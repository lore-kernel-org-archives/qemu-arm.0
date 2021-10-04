Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3598027lfp;
        Mon, 4 Oct 2021 00:53:32 -0700 (PDT)
X-Received: by 2002:a05:600c:4148:: with SMTP id h8mr17119911wmm.2.1633334012158;
        Mon, 04 Oct 2021 00:53:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633334012; cv=none;
        d=google.com; s=arc-20160816;
        b=vhDRl0v+3KhWCePPtzm81WNeG1ag2hbBhSJS0ZD+vR+o8S8PmBF5cr/lGDhdfgZ1xZ
         aI/0pczvwGo13B7aK6EhudwOAG0VUQFuzTCMEY7nEdQSVSePvn1or6Dm4Hsj8agEaj6N
         xS+Ts9WJ8llLwLPCBx7WA3raUHTOkl0gz2Pz61A0OnyZDOkG16trwvqES10Z1YQ2jOFm
         1Ig26ng3xu8HVvtJlMlV9wBIjsWdegYEJAuN9oJx4KYj0taXNKS9PqTMj4XWiF0C88cE
         RzMbOVhNCZ5gD3ykoGTNas/Rex0ji8KfdMkIs4a9sM6klOc0mbTB2bX63cRngPTiUM4v
         UgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=r//XP1lP00GFemry2tO/FQC/7ePT3oIBKh6OtpkgF8I=;
        b=OTTVgieZXDEzzmD6t8pKwt3KJcGsZRLEPG9YO1w4Gtmxgw5qk7ugwgJdIZWtfPjp2w
         XluhQpiffesvIJHt2sMvPb+h15x1zObsxnw0H0LxSSdRBGSZ63VaMm3O4Azr1iSmwgXd
         d+P+xameIHgkDbYaVTvDJFO+49pw/n1PF8RvndR/u4Pn08RZaXgJS92czXxmmb9zNQVP
         G9Wul3Il3TFrjXS4V7+rYAkWBQrdQSDMvxFi1gd40SyRhrprGslXw+qcl8Fiq3VigG7A
         Px2g23orVU4pHKmu7+FpYiM+sw6gndSr0FLFmvJykMiwrgz9skNnwWPcFdhv1B4Kw56i
         NJfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=H8svKU3x;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m5sor8056412wrs.37.2021.10.04.00.53.32
        (Google Transport Security);
        Mon, 04 Oct 2021 00:53:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=H8svKU3x;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r//XP1lP00GFemry2tO/FQC/7ePT3oIBKh6OtpkgF8I=;
        b=H8svKU3xJSIJm4RK84+pYQ6eNmrLTgRg7eHdjCIMu1/MBzV7s6Lrt4LG2KTyyWIeKO
         P2jM1W4WFFbzGS5l7eMqansH3DxlirLa1i8VbvRCBHstwCfN97Y08cytqTYkb+XisM4H
         yc0Vx/MKchkv1V9m5mH3JCRTtTXDanY6mndpzRWBctbUMVag9b6u3ZrCwNqKtriwnZAR
         IUWP8H8rZgdKctBSUHYp6T+nFWsX0L+1dh/iQH1J0SLd0sNXoPYe+SMuE6IdQcu/pNR1
         Vi1ElLmPlHIc0SRgjSxDAkERyx7A9SwvK8m9+f0uNRqhVU2C2IhXtaUt+CSwallairH5
         RGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r//XP1lP00GFemry2tO/FQC/7ePT3oIBKh6OtpkgF8I=;
        b=a3E3KHmV/S6PwrnwP3UxYkwOJfOmoT08bFX07ZkSsfGU2UL2FgEJogBW52uZIWF18K
         LI90VQ3uGcnr89omtNcVBBoJhaBLdJ3VbGO5N5UAl/E7QaRrxZUqwL38DP68dyye2Dzp
         pzR/U2/8STtkrZPuzcJCMCYQCBWboAz3zLK0em4oCeZawesXBCIjC8MTwx50bTR49Mx2
         rrohHoEx/J3jN3BySlLkE/dVA2Vb1fUbnviNtz9+HRlem30eplSHvEcIsTH9Nh7mn9n/
         1McmV/NBOR0CKYCojAeOvU/bbV4fVgaF78THvhAkXUR+vfPhF7KlgUAyG5xfn6EpFPtH
         R30g==
X-Gm-Message-State: AOAM5326j5LDySQFQXqKoY42eODvOvG3GpeINThnUwByp3DR4m10sd+h
	ASIV8Raw54WcsGZaPBerovJBioT2nRo=
X-Google-Smtp-Source: ABdhPJz0/+JeR8/mTuHWS5cmLN0PWikRxF40R7zyTHRcHTedJRrwBSCwtaTFbj7ozVexT12/XvQbaA==
X-Received: by 2002:adf:bbc2:: with SMTP id z2mr11204655wrg.359.1633334011650;
        Mon, 04 Oct 2021 00:53:31 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
        by smtp.gmail.com with ESMTPSA id d70sm13725677wmd.3.2021.10.04.00.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 00:53:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <f9c512eb-bada-5755-6927-3b6aa2a51fa2@amsat.org>
Date: Mon, 4 Oct 2021 09:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] hw/arm: fix the position of vcram for raspi
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Bishop <cleverca22@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org
References: <20211001174243.128157-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001174243.128157-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FOHWQ2YHymaa

On 10/1/21 19:42, Alex Bennée wrote:
> The previous calculation fell over when I tried to create a 8gb Pi 4
> because the values where only 32 bit. However the quirk of the Pi

Typo 'where' -> 'were'?

> hardware is the vcram can only appear in the first 1gb of address
> space. This also limits where the initial kernel and DTB can be
> loaded (notice the DTS for the 8gb Pi4 still only uses 32 bit sizes).
> Fix this cleaning up setup_boot to directly use vcram_base and
> documenting what is going on.
> 
> NB: the aliases are confusing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Michael Bishop <cleverca22@gmail.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/bcm2835_peripherals.c | 14 +++++++++++---
>  hw/arm/bcm2836.c             |  2 ++
>  hw/arm/raspi.c               | 19 ++++++++++++-------
>  3 files changed, 25 insertions(+), 10 deletions(-)

LGTM:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
