Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp24317263lff;
        Mon, 6 Jan 2020 23:35:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqyzI7fMECzmJEge9W9Wyj1Ct2yGCafKMKVVahd49HoFWqRH3jT5pZEJubpz8WSviacFO5o0
X-Received: by 2002:a9d:2264:: with SMTP id o91mr122204821ota.328.1578382536505;
        Mon, 06 Jan 2020 23:35:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578382536; cv=none;
        d=google.com; s=arc-20160816;
        b=QDDalfM/rMXnSgFa2ELtLsNX+RHFPibxplgqmjyt9UEAQDYXKcCKQZuVWc870DTfiZ
         nLI6jHUMqQtECAe8nvovna/uspWnTpHQ9Kf7JxUsN29RxIVTvbfr9Xd4Zzu+5p8Rf9ge
         KrHRYU/8BY6ZxWFBTtt600WttBNqKwYkXAM7xOO71X2YvnSjz/PrqvE+T1UxL7vZ7pZb
         76gYgKytGkq1w5A1+P/qkgEhfbmChPJG65vs/bCujD+I7xO5e0p/P3f9fBvpBQXYiEme
         EOuAWTuwbA9VwdXa9eoROgy9x1EIU9PjFz9RsnKUJ04VEIbF1Hijj0cpE2m8X6nFMU6e
         aGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:dkim-signature;
        bh=9MB1EpwF/3QQ/vJ0P9V4XwfNz1wYN5CHQ5mAOEIgsWc=;
        b=hpuMEpbcFgbZOir8XpHYwG/caTsIah+av4Efm/4uZq5cW8jITVBk89bOWAiqwqTvj/
         us0CexX75aCfroUmnwZPv+AVwdcdqiJvdffmYPryV0WVxqzLDjStEXZAT6Pjm/xZIftZ
         km0sk4ulWD2lUcqns45ER+GqipSNXBfEr4mWlIMiYDPWJ/yhWS5+ZKcrzT35rYoNyw4q
         h9X1bMoo/hfZ1yphwdzMUyCzuaq1o6+kLvVNFE2wC/irfOkOnJzHF7gCD0wW1eJMbPyc
         A2O21v5tMmkCwhlMdRRj+JbMA4EHRanhSaRkIsrw8gWZZfF1d1vghetLuM218mMKldTO
         NoRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=igcD6iqO;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s128si34500623oig.204.2020.01.06.23.35.36;
        Mon, 06 Jan 2020 23:35:36 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=igcD6iqO;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgAGHff (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 7 Jan 2020 02:35:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27555 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725987AbgAGHff (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 7 Jan 2020 02:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578382534;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:openpgp:openpgp;
        bh=9MB1EpwF/3QQ/vJ0P9V4XwfNz1wYN5CHQ5mAOEIgsWc=;
        b=igcD6iqOM8T2TukFvz30JZooeK5i4+fssuKNLmen1Sjqt4jHOkX3+CEW3cCPtO5msGyFus
        xM2RsGSElGcU3sieVeDjuscDdvIg1ss6UbAfbHp9OCLK3nVxSlMFLKlhuwAGWCn1mHXOYT
        IM0BCaHYm6CQrJa4nKjMiS5lqm7DY8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-FdoqD2fZOFKOIrQZOzg5-w-1; Tue, 07 Jan 2020 02:35:27 -0500
X-MC-Unique: FdoqD2fZOFKOIrQZOzg5-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4DCB801E76;
        Tue,  7 Jan 2020 07:35:25 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-116.ams2.redhat.com [10.36.116.116])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 89F8E1C4;
        Tue,  7 Jan 2020 07:35:20 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH 01/16] libcflat: Add other size defines
To:     Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
        maz@kernel.org, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com
References: <20191216140235.10751-1-eric.auger@redhat.com>
 <20191216140235.10751-2-eric.auger@redhat.com>
From:   Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <cab416f2-4e86-4cae-97e9-d78cfb7f2781@redhat.com>
Date:   Tue, 7 Jan 2020 08:35:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191216140235.10751-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: hMb50aQahopg

On 16/12/2019 15.02, Eric Auger wrote:
> Introduce additional SZ_256, SZ_8K, SZ_16K macros that will
> be used by ITS tests.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  lib/libcflat.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/libcflat.h b/lib/libcflat.h
> index ea19f61..7092af2 100644
> --- a/lib/libcflat.h
> +++ b/lib/libcflat.h
> @@ -36,7 +36,10 @@
>  #define ALIGN(x, a)		__ALIGN((x), (a))
>  #define IS_ALIGNED(x, a)	(((x) & ((typeof(x))(a) - 1)) == 0)
>  
> +#define SZ_256			(1 << 8)
>  #define SZ_4K			(1 << 12)
> +#define SZ_8K			(1 << 13)
> +#define SZ_16K			(1 << 14)
>  #define SZ_64K			(1 << 16)
>  #define SZ_2M			(1 << 21)
>  #define SZ_1G			(1 << 30)
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>
