Received: by 10.25.21.156 with SMTP id 28csp2282890lfv;
        Tue, 30 Aug 2016 07:28:22 -0700 (PDT)
X-Received: by 10.55.149.135 with SMTP id x129mr4359024qkd.16.1472567301945;
        Tue, 30 Aug 2016 07:28:21 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s22si27636370qts.105.2016.08.30.07.28.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Aug 2016 07:28:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B73A59B0FB;
	Tue, 30 Aug 2016 14:28:20 +0000 (UTC)
Received: from localhost.localdomain (vpn1-4-213.ams2.redhat.com [10.36.4.213])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u7UESGTf030793
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 30 Aug 2016 10:28:18 -0400
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v3 01/10] lib: xstr: allow
 multiple args
To: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, alex.bennee@linaro.org
References: <1468587641-7300-1-git-send-email-drjones@redhat.com>
 <1468587641-7300-2-git-send-email-drjones@redhat.com>
Cc: marc.zyngier@arm.com, wei@redhat.com, christoffer.dall@linaro.org
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <827721e5-8343-42f7-f737-ac315164ea67@redhat.com>
Date: Tue, 30 Aug 2016 16:28:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1468587641-7300-2-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 30 Aug 2016 14:28:21 +0000 (UTC)
X-TUID: AwsrJ84kAxSw


Hi Drew,
On 15/07/2016 15:00, Andrew Jones wrote:
> Make implementation equivalent to Linux's include/linux/stringify.h
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  lib/libcflat.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/libcflat.h b/lib/libcflat.h
> index 72b1bf9668ef1..82005f5d014fb 100644
> --- a/lib/libcflat.h
> +++ b/lib/libcflat.h
> @@ -27,8 +27,8 @@
>  
>  #define __unused __attribute__((__unused__))
>  
> -#define xstr(s) xxstr(s)
> -#define xxstr(s) #s
> +#define xstr(s...) xxstr(s)
> +#define xxstr(s...) #s
>  
>  #define __ALIGN_MASK(x, mask)	(((x) + (mask)) & ~(mask))
>  #define __ALIGN(x, a)		__ALIGN_MASK(x, (typeof(x))(a) - 1)
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
