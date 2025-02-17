Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp29980njb;
        Mon, 17 Feb 2025 05:24:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZ21ryh/emjxkwWh8SXNCwpM8hz8VukpvF0qM01ZaM/Cf5WSRkuqE8rK4MR49CZCnkplHuF2mwlXRheQ==@linaro.org
X-Received: by 2002:a05:6902:701:b0:e5b:114b:b7d4 with SMTP id 3f1490d57ef6-e5dc9033904mr7427342276.10.1739798643481;
        Mon, 17 Feb 2025 05:24:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739798643; cv=none;
        d=google.com; s=arc-20240605;
        b=gLADLckOF9Ql+WY/eW8L4yuoBkAkg+ufWpmtZ/9kCN4nGL5AOdjWa6aRZGFTudTefa
         2uawNtLLGJvyvKSn2Y9APDXwv1ig0Rxp5ZQiOnDVAUujpGmPjhP2nSB10tTxHFer9GGH
         /UKQzN79Afbp38LZg721MnGN8PfueX5MJunuVlvDpHY8DUU41KtMBXntr1+wr51km0e8
         j1Orree2KHoMcL0h1iPqDdYJyo5+zkCJ85re+9KAr3B8xwx6ModIFw3EcMnurRYKSIhU
         E5kegmE3wiOy06LVFlyGKx7JYE4G57YubzSFewcdNP3eban0ae67hhJj1MyJmWEDGI5y
         Nexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ImPdxCbzLfZbm+Im9GPC7SBy2QXQei9F05/Rwvm6ey8=;
        fh=GldoleQhFJd6KDyZLoQFvb/LbzEnmZvjP3BSEBRDV2U=;
        b=MdU/TtApi0xi8VMoYcS2FfM69BbM1f4qQX0FJ//8xZfxSQTtbWAyz9kCH1gLwIfd7R
         LYU/E3dWg0UL5QjtvPm1GOCLZYps9oYupIfYLwpzmcuJxzheF/gSlUpI4he25GT484k1
         yChKBDhndMHesajMPhgLZ5PFaB+sf1Vyi0mfiMEpjN4GixIjqVzm8Iqv0Dzpm2d1qk4P
         /r+5IZq1+pd0GJad9/YoFp9505nilmLg5kuxMHvXDrczzkcDlgroFx2OoeiynqWEcqRu
         zA09C7nV2RcSf/FXwELw6qy7qaSggHrPg9hnV9baID1TNjxck9k2P8dsX+uxbbzsEuJz
         2cGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S9X8mzpR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5dae079c89sor4632199276.13.2025.02.17.05.24.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 05:24:03 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S9X8mzpR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739798643; x=1740403443; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ImPdxCbzLfZbm+Im9GPC7SBy2QXQei9F05/Rwvm6ey8=;
        b=S9X8mzpRK7ZRm9pvRnlmtwN0BoDT1CgAiVp1m/MAjXdd9omXG8IireYmT0pRQ3u8wN
         lbG589bIEDMiBVsJGHAn7++cpiXjQBo22ICiN48zkl1vZ70/jSawHOAMSzJiJkbAP3Ig
         veDYYjfBo89UAvo0FV+kptjRbLdrZJmjhKRFkkNSJsD35lJEs31ZJ7sZnglV0LKA4Q1C
         QxtaXVd6Qio5wppapg9bOg7jFhdfuf12PZ7lTbaZggKUTadnTiI6Qoy9rYset55sAMr0
         4W6nNjHMX+zgLtNAwtf7so1YWDIJ7es9aMIs4DqUPajdkGt5w9XJHu1Dzeeh5VZ1geFQ
         Alvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739798643; x=1740403443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImPdxCbzLfZbm+Im9GPC7SBy2QXQei9F05/Rwvm6ey8=;
        b=ZtY3h1kpjFpYOxKKhOb1AcLtEUy0gDHqYMCa89ln/qAlZKdzY+csSiS4u+CaJNDogQ
         GJTKXFw3lsDZSpR+eSUmTHgyGUh2NdRYgUeySaytVUTbubeIdNsjj6EUOpTJRDxnODds
         pe2r0ASINeekiXgx3j9IMVk12P17V2pHSc1tzeM8InyMOA9JOxqogoerQHX0M2ft0m38
         Ch8a/WzGpbU2tQ6bvMQ87r2sGGkUN4R9oaOJ2QlRAt4RzfOOenlekVa0ed+L9cKODj7m
         zwLDufu+NbcQUPaDdG/BeqjcmPx0ULAT8rkFlBdfmA2RPby5PEsEAz+NYu67zpp3GElx
         MfxA==
X-Forwarded-Encrypted: i=1; AJvYcCXuJDlJ6AReS2vYZBUnToYNVNHKzO12DyjLW+myGNZ27AaQvy2b7Vk+7kH4I010YIfdPvhMFoEvhdhPXg==@linaro.org
X-Gm-Message-State: AOJu0YyAyF5XaDiidZrLs/39oZEC3jNsTDWfDQvkF64priMLKSAk5pr2
	D+/v2AQhnZSW8Bjbq6QwppB20nNIJcuEb492xnfr/4q9oxvrL419cWBqIr2w4KDD9q2LsC7xQuf
	jsMDMPWbEOa/FgvTxOapfc0Ec7JHk1yXSHQ9+EV+x
X-Gm-Gg: ASbGncuUyJs8/3wnh0h2JM18eHzthBh6ZrcLtmZBkKy5qJMQRs67rpKGDaQWnVugejf
	ZYGFAO/exyqIyPS2p+zSlVVmuxn/BU7tOvnYglDWV1WrlXgs35MHMZHmLsX53TNN4y6nU+FS+Mw
	==
X-Google-Smtp-Source: AGHT+IHn/5uBYEcEfuf62osQsmwewhf+q1KS62zCpfLr5PMh/z61PR2M9Ke8u9oq3nM+YguGO1gA787hgV4h8xEOMy8=
X-Received: by 2002:a05:6902:18c2:b0:e57:fd58:ad51 with SMTP id
 3f1490d57ef6-e5dc9034483mr6776156276.1.1739798643063; Mon, 17 Feb 2025
 05:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20250213084219.2975727-1-kchamart@redhat.com>
In-Reply-To: <20250213084219.2975727-1-kchamart@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 13:23:51 +0000
X-Gm-Features: AWEUYZkcmvJY6s5eLDYtzmVvSJljIFAjCX8XkYb2BhFxcVOHEA5Paai8F7oB1hw
Message-ID: <CAFEAcA9MgeaCQspu=4dCusTQVP3KOvpze55vshPJCaNS_E43yg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] docs: Small changes to system/arm/cpu-features and more
To: Kashyap Chamarthy <kchamart@redhat.com>
Cc: qemu-devel@nongnu.org, maz@kernel.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Steven Lee <steven_lee@aspeedtech.com>, Yi Liu <yi.l.liu@intel.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Alistair Francis <alistair@alistair23.me>, 
	Tyrone Ting <kfting@nuvoton.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
	Troy Lee <leetroy@gmail.com>, qemu-arm@nongnu.org, 
	Alexandre Iooss <erdnaxe@crans.org>, Joel Stanley <joel@jms.id.au>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>, 
	Hao Wu <wuhaotsh@google.com>, sebott@redhat.com, Eric Auger <eric.auger@redhat.com>, 
	Ninad Palsule <ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: v0rEM2Y/k+wE

On Thu, 13 Feb 2025 at 08:44, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> In v2:
>
>   - Add live-migration context to the PAuth docs (Marc Zyngier)
>
>   - Fix the Arm capitlalization (Peter Maydell)
>     - Context here:
>       (https://lists.gnu.org/archive/html/qemu-devel/2025-01/msg05137.html)


> Kashyap Chamarthy (3):

Hi -- it looks like only patches 1 and 2 ever made it to
the list. Would you mind resending, please?

>   docs/cpu-features: Consistently use vCPU instead of VCPU
>   docs/cpu-features: Update "PAuth" (Pointer Authentication) details
>   docs: Fix "Arm" capitaliaztion

(nit: "capitalization")

thanks
-- PMM
