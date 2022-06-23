Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3016854lft;
        Thu, 23 Jun 2022 07:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uRPd9OUOyd6BDO14sT08DxlrPL7X0RU1tlUB/+Rypd9eJPDmIKw8NgfXbcxVIAds3R11Z2
X-Received: by 2002:a17:907:7781:b0:6fe:4398:47b3 with SMTP id ky1-20020a170907778100b006fe439847b3mr8566835ejc.513.1655995759433;
        Thu, 23 Jun 2022 07:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655995759; cv=none;
        d=google.com; s=arc-20160816;
        b=Lw4hjCjjD0Ph+/jjNwQvwdBPnDDWTTJmhBtkOA/KgffETX2BdRXVIZ8ZTqbmuW0k6p
         3D4WuvfpzvM++31HRJXi7+oO7Tt6ps9iadbisRTvpeZK9HOMpf8JDRhW7EvVdskQIs6t
         hCMu1Pkdfa4qCuOHYTYA8jZcjh4e3PyzjAC0t6aL7Bw3MZpnf1V3ztBijJErfs3W5QNc
         7UXIr7YjHB89udskmhsyw93t5wE+tCxxhkVoHF0rHhbx5kmcgyv2kjvtTXQzin6tiVqa
         MdrWxZd4w7CPRWbLbscEI5xeEy78KMQzNFYRdvl8yOcACTx1SuQFJvDC94RuLpHMxhNC
         +hoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SI8xutk3gmYbsLJ8Tc+MzdPXoHGzso0b1vVVkRwkUCc=;
        b=N9+q4rWPgcLjrm2aS6b9LOcCDRqzMKAYleP0J4aZH8q5XMZ9YDUa42V6/CVD8eTmnr
         OHHk472TRZB7uLsz3jf4ThRlIIY/LLBV9u9WPBuhze7V7Vlab1UDgh8MLFXSkAR/rsxn
         OMQQagbTmVFZ0wiEWXThacPVEbFsK4RJo8VOW+YP0L+4NC7Z/e8sjKFVPhJ2PETdMIId
         Qn5MlyGXz/FebyIHRtMU98jJv6+8fhT+yEeA24mTCHz4K41UABrI4h3nk7EvJHlly1QM
         Po7BWtaVTZxtRcRR6soTicaSr9BCek2IizcCuaF28wv+bT2HgyxMhXRVAHi+DsedfT4B
         4W7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JtOft56H;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id sg20-20020a170907a41400b007262ba0aab6si512670ejc.374.2022.06.23.07.49.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jun 2022 07:49:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JtOft56H;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655995758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SI8xutk3gmYbsLJ8Tc+MzdPXoHGzso0b1vVVkRwkUCc=;
	b=JtOft56H30DonPit/jkRtLEbFd+kwh8GZrHOFnp8kDC4ojR0256eJ83+mOm3+2nxzg3a5X
	BaR6Qo5T5B1c6KNZXWAIiZBV5INLTIupC6ok89BzKX1DwPj+i2+QPiC7hSUVb+yPJQwV+9
	gNhH0YJlOVFMyh0+XFxsRII0yr9ccJc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-XT21VTARNBCaqxrErI8j1Q-1; Thu, 23 Jun 2022 10:49:17 -0400
X-MC-Unique: XT21VTARNBCaqxrErI8j1Q-1
Received: by mail-wm1-f71.google.com with SMTP id c185-20020a1c35c2000000b0039db3e56c39so1524104wma.5
        for <alex.bennee@linaro.org>; Thu, 23 Jun 2022 07:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SI8xutk3gmYbsLJ8Tc+MzdPXoHGzso0b1vVVkRwkUCc=;
        b=5LnkYxnoxzdplfPQvPkRd125NYP1f9F/SqmOu0vvOzED10U20aEUmRCnoDj8iVs6cO
         Ph2yA1XGTjzXJ107AEcpmGiSIwSjl4GmZGgY1e1JCJvPqs0iITWE9HPUwKtstY+bNqNx
         7HTJD9fxRe7vQHzZNmNZ8pgHl0D3i0n+fxnVPQU2A2BsciryLsYS+XQts4qr1AicGRu2
         lquqNt4n66oltWaWxK0Kj9ZkfO+NIpqgqLFJp7YXrmnpJPZnEzOlPgl0aLU3qvNwlTN/
         NPZ47hP9bl1zgTuuNFiTlJAE8THhbQTnOYnOVRTWD54tqDgTToqdJ5GtJlJpZ9/dr7V2
         s46A==
X-Gm-Message-State: AJIora/DScLEVXVCdvhcifSlNsTfC2ufq2I5Xmz5eWXzWe2/LP+Hnl1l
	2eE2vQwYWfPunZb73JMTMddn9LpuJSAMkWrRT8rRcRHujAyZc8zlAvg83Q/f/pCpbIGZmD3LyiX
	TxyA1D6/VAi5pJIta
X-Received: by 2002:a05:600c:4ca7:b0:3a0:3905:d441 with SMTP id g39-20020a05600c4ca700b003a03905d441mr686392wmp.159.1655995756144;
        Thu, 23 Jun 2022 07:49:16 -0700 (PDT)
X-Received: by 2002:a05:600c:4ca7:b0:3a0:3905:d441 with SMTP id g39-20020a05600c4ca700b003a03905d441mr686374wmp.159.1655995755954;
        Thu, 23 Jun 2022 07:49:15 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com. [80.187.98.39])
        by smtp.gmail.com with ESMTPSA id c2-20020a1c3502000000b0039c5328ad92sm3499945wma.41.2022.06.23.07.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 07:49:15 -0700 (PDT)
Message-ID: <95b9536a-12f4-2dee-918f-c673b3d296aa@redhat.com>
Date: Thu, 23 Jun 2022 16:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH kvm-unit-tests] MAINTAINERS: Change drew's email address
To: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 alexandru.elisei@arm.com, alex.bennee@linaro.org, andre.przywara@arm.com,
 nikos.nikoleris@arm.com, ricarkol@google.com, seanjc@google.com,
 maz@kernel.org, peter.maydell@linaro.org
References: <20220623131017.670589-1-drjones@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220623131017.670589-1-drjones@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /YZ+/NOL4OhN

On 23/06/2022 15.10, Andrew Jones wrote:
> As a side effect of leaving Red Hat I won't be able to use my Red Hat
> email address anymore. I'm also changing the name of my gitlab group.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>   MAINTAINERS | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bab08e740332..5e4c7bd70786 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -55,7 +55,7 @@ Maintainers
>   -----------
>   M: Paolo Bonzini <pbonzini@redhat.com>
>   M: Thomas Huth <thuth@redhat.com>
> -M: Andrew Jones <drjones@redhat.com>
> +M: Andrew Jones <andrew.jones@linux.dev>
>   S: Supported
>   L: kvm@vger.kernel.org
>   T: https://gitlab.com/kvm-unit-tests/kvm-unit-tests.git
> @@ -64,14 +64,14 @@ Architecture Specific Code:
>   ---------------------------
>   
>   ARM
> -M: Andrew Jones <drjones@redhat.com>
> +M: Andrew Jones <andrew.jones@linux.dev>
>   S: Supported
>   L: kvm@vger.kernel.org
>   L: kvmarm@lists.cs.columbia.edu
>   F: arm/
>   F: lib/arm/
>   F: lib/arm64/
> -T: https://gitlab.com/rhdrjones/kvm-unit-tests.git
> +T: https://gitlab.com/drew-jones/kvm-unit-tests.git
>   
>   POWERPC
>   M: Laurent Vivier <lvivier@redhat.com>

Acked-by: Thomas Huth <thuth@redhat.com>
