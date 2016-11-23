Received: by 10.25.150.194 with SMTP id y185csp2489252lfd;
        Wed, 23 Nov 2016 02:38:17 -0800 (PST)
X-Received: by 10.200.45.245 with SMTP id q50mr1707297qta.47.1479897496949;
        Wed, 23 Nov 2016 02:38:16 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o78si19028902qka.48.2016.11.23.02.38.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Nov 2016 02:38:16 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx14.intmail.prod.int.phx2.redhat.com (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2C0431B316;
	Wed, 23 Nov 2016 10:38:15 +0000 (UTC)
Received: from localhost.localdomain (vpn1-5-72.ams2.redhat.com [10.36.5.72])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uANAcBd6011944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 23 Nov 2016 05:38:13 -0500
Subject: Re: [kvm-unit-tests PATCH v6 08/11] libcflat: add IS_ALIGNED() macro,
 and page sizes
To: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
References: <1479157719-31021-1-git-send-email-drjones@redhat.com>
 <1479157719-31021-9-git-send-email-drjones@redhat.com>
Cc: pbonzini@redhat.com, andre.przywara@arm.com, peter.maydell@linaro.org,
        alex.bennee@linaro.org, marc.zyngier@arm.com,
        christoffer.dall@linaro.org, Peter Xu <peterx@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <23d97150-4eb6-db78-9a18-9af79c3c5597@redhat.com>
Date: Wed, 23 Nov 2016 11:38:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479157719-31021-9-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 23 Nov 2016 10:38:16 +0000 (UTC)
X-TUID: +uyN7Kny4y5+

Hi,
On 14/11/2016 22:08, Andrew Jones wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> These macros will be useful to do page alignment checks.
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> [drew: also added SZ_64K and changed to shifts]
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> ---
> v6: change to shifts [Alex]
> ---
>  lib/libcflat.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/lib/libcflat.h b/lib/libcflat.h
> index 82005f5d014f..244e40a724be 100644
> --- a/lib/libcflat.h
> +++ b/lib/libcflat.h
> @@ -33,6 +33,12 @@
>  #define __ALIGN_MASK(x, mask)	(((x) + (mask)) & ~(mask))
>  #define __ALIGN(x, a)		__ALIGN_MASK(x, (typeof(x))(a) - 1)
>  #define ALIGN(x, a)		__ALIGN((x), (a))
> +#define IS_ALIGNED(x, a)	(((x) & ((typeof(x))(a) - 1)) == 0)
> +
> +#define SZ_4K			(1 << 12)
> +#define SZ_64K			(1 << 16)
> +#define SZ_2M			(1 << 21)
> +#define SZ_1G			(1 << 30)
>  
>  typedef uint8_t		u8;
>  typedef int8_t		s8;
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
