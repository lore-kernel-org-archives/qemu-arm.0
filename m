Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2032795lfk;
        Tue, 6 Jul 2021 03:53:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcaOh7PZoHMG1QUnXmntg1MLy4E0LNshFbAG6OyWJ6/xlRWx57r8FtBaHunk284Blxh4tW
X-Received: by 2002:a50:ff09:: with SMTP id a9mr21972359edu.368.1625568795105;
        Tue, 06 Jul 2021 03:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625568795; cv=none;
        d=google.com; s=arc-20160816;
        b=hs6YVDNwaSmpisvzg7izqJuHuZslJKNk0Ezeq9kpLjDW2DMobonJC6ANdLVuMUNDOp
         dWCkJRq6z8IAp+gpDrOmLjQyuuxQiDfprVuMlbyXADmCIhU4AZSZu69aBev5koZM+Neh
         r175Wv+smVs72EPYWRHd20gk2gUwYffH2F8AqoRoT2stpqFq79fmghkBXpnzpF8SlG6E
         PT2Zl+CNxaKiCby/mg/5xocBFGXB4QYs7m/PA7B/a2Lo1VH8g9s4swNR6q0oYbIGKeHx
         BBudZ2h5OshA+lZ2r0ld1ICnaPrkIcdtuCGJLYJ0O6+T6u1TnM3byy9Dx7hTK2sYe0TD
         yN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=R4afGJ1Rf8zZV0WhJLgEZos9eSyKALSPBbG/9IP7xbg=;
        b=OH195w/NfQUZ7nOWwdUlbLTQTgaIIODMtymAio7VDMSEpjYk1mAq64gUxaTobMp8N7
         1D7WebNROI2LOCeVw0t+doxVhbhOSTLD+wJblzH3bUMUOvbW3J5Osiiv81TKEVQI45c5
         pM9QBlijRHX7jBoIoRd/JLpEn0GtpT2K2Ft44eta7kDjViG1MN/FeVoPcfkwkkYi2Vn8
         z7/KDRdHKw0La3mmJ9ppdGFxDIERATj+L3FiPGnCjT1EXVgV+szQbP26Drn6NYx+/TZp
         N4VZl4MsjAUVbnQi26zklPr7jRCLIrDbHNKDzwZc4dP53NOGIyfar0pl54eVEE2339a3
         aZlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="N0UHcZl/";
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id he17si10442230ejc.29.2021.07.06.03.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Jul 2021 03:53:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="N0UHcZl/";
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625568794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R4afGJ1Rf8zZV0WhJLgEZos9eSyKALSPBbG/9IP7xbg=;
	b=N0UHcZl/DWc+NF7rnkOAQ+fKIJCZt6RDEtPF2rYjfBEyyEJoHcVaEzg8gClE6GJunQLS8v
	l+KY20B0mP/c6p43iHNStR1TW26hloutMcoJENi6zTdyvmDHdCDO2ri+i5valoMUpr7xJ/
	7z9Yj2NlQZY2gJIKUwJzQ+oskwjXKFw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-lF5MAdLyObCppbw75df_og-1; Tue, 06 Jul 2021 06:53:12 -0400
X-MC-Unique: lF5MAdLyObCppbw75df_og-1
Received: by mail-wr1-f69.google.com with SMTP id k3-20020a5d52430000b0290138092aea94so228710wrc.20
        for <alex.bennee@linaro.org>; Tue, 06 Jul 2021 03:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R4afGJ1Rf8zZV0WhJLgEZos9eSyKALSPBbG/9IP7xbg=;
        b=oetwoiFoBMxh8e6bycGzgGMApLXb38pxgX4JQm5z7f0hNQKWFm0vNuYIaSluAhd8u1
         negkqD1pmtqnIubdU77pvablZ95qmKrI1oJrxT3qr746u2HuA7PZVrO9DKsdgMOV0GAl
         wK+Lkpxlsqut99JMTUTTnYRtYkLXd85neCpQvgBA0FFKrkQiDtn0PpN48T32dckFp4Jo
         6wDrzb8rKKI120yKdDy+ai4oADE3ZOOArujxLjri18n4LKibGpp0+ZLjqq6sfG6puxEq
         jN8SAJpjAbnf2NCRGK22unRbze4wZWmflB8nGrT1VB+UAPZZzt9aOq0faAt257UXdsEE
         H+FA==
X-Gm-Message-State: AOAM5306u7tHlIC35WICBG5Cvg3aZHvacRTda4SSf5HRJLg21hS6FBbA
	Py8NkE0hONbM1ZBFO9RSLLaBevHQSsrG8/RmQdHm6NXaB4FayymgNEVkcnj7FrbZvN26iEh/FGD
	uI4W0cymJACUQHE6F
X-Received: by 2002:a1c:5985:: with SMTP id n127mr19730879wmb.75.1625568791750;
        Tue, 06 Jul 2021 03:53:11 -0700 (PDT)
X-Received: by 2002:a1c:5985:: with SMTP id n127mr19730866wmb.75.1625568791606;
        Tue, 06 Jul 2021 03:53:11 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9575e24.dip0.t-ipconnect.de. [217.87.94.36])
        by smtp.gmail.com with ESMTPSA id n20sm14807465wmk.12.2021.07.06.03.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 03:53:11 -0700 (PDT)
Subject: Re: [PATCH v1 2/5] hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c513eb05-b08c-8030-5916-cac1515148fc@redhat.com>
Date: Tue, 6 Jul 2021 12:53:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621152120.4465-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: doIaiQng6gWa

On 21/06/2021 17.21, Alex Bennée wrote:
> We need this functionality due to:
> 
>      /* XRAM IRQs get ORed into a single line.  */
>      object_initialize_child(OBJECT(s), "xram-irq-orgate",
>                              &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 647b5c8b43..528f71bb9d 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -368,6 +368,7 @@ config XLNX_VERSAL
>       select UNIMP
>       select XLNX_ZDMA
>       select XLNX_ZYNQMP
> +    select OR_IRQ
>   
>   config NPCM7XX
>       bool
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>
