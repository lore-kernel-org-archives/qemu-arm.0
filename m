Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp981777wrg;
        Mon, 3 Jun 2019 11:29:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxzK+VyhhPAPgF67ASG/UxrrgA+Un0k0M0g64mYa0yAahH3dvTJL+P7S/6lI6D0Ury5Ax3
X-Received: by 2002:aca:7549:: with SMTP id q70mr1896225oic.58.1559586570452;
        Mon, 03 Jun 2019 11:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559586570; cv=none;
        d=google.com; s=arc-20160816;
        b=ujZCKVtGzYC9V3jKcRjnx9B4nzg96+mufw45UevBBsmQrVv2UZGUtliSmRa+bXVruD
         0u98Rv5V9EaV22vviGpcLzMTZ89ky9PRCz5KyJ9y3tqhEuQ+7qyWXRsEsdcTbLHtxSi5
         Vu0gLrdKRcEGmu4A2DCzUJbAnTDxCl+QXIGT73ZkmjEOKikFMVflJf9jfQm/q//FjjRY
         Zu8PEZAuj3xU85bGsbIng1oGOajMRKwJsSomB8AyjZv8YwEw8Zua+EIiD9CKh4OgsM9D
         Yb3d3fsyKzQcaEes7WBU3p1BLlU6O7zI6j20PWLqQptIsYBDf5u09qKjpc8KdDXd3bVD
         S1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=VLmtCbX21yBAyUbC25lb7dKxRnnl0D2+/WSJ7CNaXHs=;
        b=wwRSqpoxn6PwwWW/zPe2NutJoYo5EwwqOttCbFlXpBbeKUFKhOV2vN2RX5OsWpBezH
         vANg3EvLJgbIfqRpO2ZGYyfAFNyXXF8FFvKqxV9nFQHQWzMbDOMoPbugybHlX/PO6irf
         oRaGn3VZ98r/ERxk2DaovA6xNT3sqTsINLtnNFtYwHfA9HcqmUt2Hw31MvNJRQvKD9Cx
         pX/Zk1J6SLyV7e1Lngrlm4JQEL4HU9EMont0BoxYUm40Qv26LC4Faa27ekvZS5loN6pN
         TiX+1ZCAUhags+jkqwkrwX7nqMNUj3Xe97HSVLzFbWcqRJ+WUwDhzi1mLPqO9Bc6v8Kl
         fUNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <lersek@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o127si8009234oif.193.2019.06.03.11.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 11:29:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of lersek@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=lersek@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3172C30C0DDB;
	Mon,  3 Jun 2019 18:29:21 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-13.rdu2.redhat.com [10.10.121.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4168D2E16F;
	Mon,  3 Jun 2019 18:29:17 +0000 (UTC)
Subject: Re: [Qemu-devel] [RFC PATCH] cputlb: use uint64_t for interim values
 for unaligned load
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: 1830872@bugs.launchpad.net, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, randrianasulu@gmail.com,
 Richard Henderson <rth@twiddle.net>, Igor Mammedov <imammedo@redhat.com>
References: <20190603150120.29255-1-alex.bennee@linaro.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <5f684c68-d2cd-90f7-3892-1c6245728042@redhat.com>
Date: Mon, 3 Jun 2019 20:29:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190603150120.29255-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 03 Jun 2019 18:29:21 +0000 (UTC)
X-TUID: LledsM50KfP8

(+Igor)

On 06/03/19 17:01, Alex Bennée wrote:
> When running on 32 bit TCG backends a wide unaligned load ends up
> truncating data before returning to the guest. We specifically have
> the return type as uint64_t to avoid any premature truncation so we
> should use the same for the interim types.
> 
> Hopefully fixes #1830872
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  accel/tcg/cputlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index cdcc3771020..b796ab1cbea 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1303,7 +1303,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>          && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
>                      >= TARGET_PAGE_SIZE)) {
>          target_ulong addr1, addr2;
> -        tcg_target_ulong r1, r2;
> +        uint64_t r1, r2;
>          unsigned shift;
>      do_unaligned_access:
>          addr1 = addr & ~(size - 1);
> 

Applied on top of commit ad88e4252f09c2956b99c90de39e95bab2e8e7af:

Tested-by: Laszlo Ersek <lersek@redhat.com>

Thanks!
Laszlo
