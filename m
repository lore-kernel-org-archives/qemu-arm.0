Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1733601lff;
        Thu, 5 Dec 2019 00:39:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwflZdGdU8c8Rsf2TSVsxbHCcU+I6t4zvl4IPoybpTGozEXe7AMXSbasVewyBptkXmfgyv/
X-Received: by 2002:a05:6830:1d6e:: with SMTP id l14mr5706446oti.32.1575535176801;
        Thu, 05 Dec 2019 00:39:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575535176; cv=none;
        d=google.com; s=arc-20160816;
        b=rnyr9BxFW1da8GwA1yZlnNq4aqnA8H6uDtnlb7bSnNLGzC3QeShxeHRJ7G/JoGzG0y
         cb7wEoJqmC9+tpt6b4guN/RpKS6jWrKmqr6GJzZuNWS1WzW+1tbWMK2b+13hMZEUgl1n
         wLgzb2bK4SZfVpLVk2TLWYu6ZW0stRVaMPOaB19OcpoRetWhfr0kj8GmWqgL/FwicV6J
         Aes3FQtENx5UOoS4wXI7OQeS4LoKQMMWrn1DLeucZZFfdtD2UJlX598bJsPmximB6Q6W
         Vk4H86YZgF5QznhqTWPVu/kbEPvc/YDduWn3Qb61ofHSM4hSokR7TZ1w3nd5W1GY2D4g
         o0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WEw3d+DqTbpKJERAhcdHK2F5dU6bzzDjmvLgz+gaJQ0=;
        b=j6tUGeaUaU0gDNiJErs463+9QBEUCK7l0wzfkSkno6fkLN8v38wVg1e7JG9RzUgTbj
         veV/QPpyhU6EKOwqq+h0I+P+M3c5bJUnJ/jg7RNNIF5dm5otdb/2nENSB3nmkIG4cMW+
         pk+SeN53A3YfIoWno53ayNUNFsJrc0Py82tx3Q0uQ4JZ0YNbSkYKWbh9RTrgykG3ZVot
         fzkCtfXDC2RqCpkgX0cC1ncFpMXE9tthn2z8IujNyiuURmp1jXF3QtcvO/yMWtGqNT48
         cXUYm1KloPLsXMiCSBu2h/KLUDxdNv9rJTXbSHHcqlc5o/oZ/77QwBN/koXCgxyTz3Ph
         N/8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H98HaKzO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6si1584302otq.217.2019.12.05.00.39.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 00:39:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H98HaKzO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icmff-0007bK-Mf
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 03:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43976)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1icmfQ-0007XP-OO
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 03:39:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1icmfP-0003if-J3
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 03:39:20 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39159)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1icmfP-0003gr-8t
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 03:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575535158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WEw3d+DqTbpKJERAhcdHK2F5dU6bzzDjmvLgz+gaJQ0=;
 b=H98HaKzOVl5eusB1sMuBL4lkYdHwVop0tXN5HQ72TmgFL9FnXmjXOWhcRQQLIGHtLDzcCC
 7GL0/bOXhipHAN5g7h/BQuvXOwhK3V2ceK6gkhl9d9YPjnw674LGbb9IhWkZlZOrDF9qnK
 o9MV2mUAau+cB5HPNPLeEiZUKgs+aH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-Vv2LqZlkOUWmOhPLzVbL5w-1; Thu, 05 Dec 2019 03:39:15 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 292518017DF;
 Thu,  5 Dec 2019 08:39:14 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 555526012C;
 Thu,  5 Dec 2019 08:39:13 +0000 (UTC)
Subject: Re: [PATCH 5/5] hw/arm/smmuv3: Report F_STE_FETCH fault address in
 correct word position
To: Simon Veith <sveith@amazon.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1575467748-28898-1-git-send-email-sveith@amazon.de>
 <1575467748-28898-6-git-send-email-sveith@amazon.de>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <39341988-f302-c750-9801-4710ff50c2fe@redhat.com>
Date: Thu, 5 Dec 2019 09:39:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1575467748-28898-6-git-send-email-sveith@amazon.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Vv2LqZlkOUWmOhPLzVbL5w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4UlXUJNaJbr+

Hi Simon,

On 12/4/19 2:55 PM, Simon Veith wrote:
> The smmuv3_record_event() function that generates the F_STE_FETCH error
> uses the EVT_SET_ADDR macro to record the fetch address, placing it in
> 32-bit words 4 and 5.
> 
> The correct position for this address is in words 6 and 7, per the
> SMMUv3 Architecture Specification.
> 
> Update the function to use the EVT_SET_ADDR2 macro instead, which is the
> macro intended for writing to these words.
> 
> ref. ARM IHI 0070C, section 7.3.4.
> 
> Signed-off-by: Simon Veith <sveith@amazon.de>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> ---
>  hw/arm/smmuv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 2d6c275..125e47d 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -172,7 +172,7 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
>      case SMMU_EVT_F_STE_FETCH:
>          EVT_SET_SSID(&evt, info->u.f_ste_fetch.ssid);
>          EVT_SET_SSV(&evt,  info->u.f_ste_fetch.ssv);
> -        EVT_SET_ADDR(&evt, info->u.f_ste_fetch.addr);
> +        EVT_SET_ADDR2(&evt, info->u.f_ste_fetch.addr);
>          break;
>      case SMMU_EVT_C_BAD_STE:
>          EVT_SET_SSID(&evt, info->u.c_bad_ste.ssid);
> 
Acked-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

