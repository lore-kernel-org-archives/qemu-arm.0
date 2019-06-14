Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp535426wrg;
        Thu, 13 Jun 2019 22:27:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwmcWffOjbHNp1I624K9cdOnjUa3ZA9iRo1HkmnWbK82V7g0YRT7hYQd/IYFUG0xCAbxAZb
X-Received: by 2002:a0c:d0fa:: with SMTP id b55mr6711575qvh.209.1560490071045;
        Thu, 13 Jun 2019 22:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560490071; cv=none;
        d=google.com; s=arc-20160816;
        b=Xc0f3hvOdW/uYTEk16KszWowZh/bP+huhChaBCS1Po0Yc7VulIX1w45grGCp6p5NC8
         y918zvXne4nrp2NKzilvb0H0d41uBikrN8Y2ICDQdO5PtOQVvphh1XgQfnvMkxd2cwDx
         7O186/m5Ai3WEStHjU4jGKh7+HD+0W06djVVgpJBGz945bdr/S8RHVF7/X+fkeThvGMO
         op8smpIQpjRCuRsV5tCDgHqHczXNDHYzg3thzLlU+JWe5qbfZppNBLnCoTorPvwAv39o
         doGwRik2wzJ9gs/GC1OXVbfbjLbxVwnjG8OIkqS/wP9qcwUylHEdJ2AulJwjnotxd/Vc
         fq7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=JB8IeA/Yd/sgZbUx1n4wwaED4WLwmaDpVQ3dSwFT+Xg=;
        b=y4SGyl2va93ylC6t2WX7gs9V1rZCbs313DFBc/hJXesa3oiV1fkjYmiZ/laOuKPZlW
         L0YepOYiPKXNg2E26on3GrIhKkUxQ6CC/rIMExuMW8pH3uBBKxGnnc+xR1o2GbApXNsR
         ZsvPQ+kU5PYsoQZdXVDEomiiV394Zh4Onx/Waz9A3K6fjE79xQrbuqYC4PnBTvZSINT0
         y3UI5oDC6U365GMXeJLI8BEBviiSNPTdd7pjv+q9pcMum/L6Nu5JJsYoZJz9Db6pjdyt
         FLyD7i92w82KOJ+PP2du1ekppHHyYY1a0cXpMpzUG0TO6/rhLsguYXH+cMN3T+GlJ4ef
         87MA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l67si1035787qke.45.2019.06.13.22.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 22:27:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbekg-0001j5-Kc
	for alex.bennee@linaro.org; Fri, 14 Jun 2019 01:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42753)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hbekZ-0001it-0x
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 01:27:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hbekY-0002IT-1V
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 01:27:42 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45719)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hbekX-0002Hx-S5
 for qemu-arm@nongnu.org; Fri, 14 Jun 2019 01:27:41 -0400
Received: by mail-wr1-f66.google.com with SMTP id f9so1032175wre.12
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 22:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JB8IeA/Yd/sgZbUx1n4wwaED4WLwmaDpVQ3dSwFT+Xg=;
 b=EmQxO2kMRk+qZoT2TvP5hmydys0Y/ALFSMjYbaYCjcxKw1pU09GPlhQLlwEyjvztvd
 Bdr1/E6/9IY4So39FXrhD+FtBBbylcx21DgTbvR1luagmMjpjugIgQEnX0he3IIM9jy5
 sEMzazV+KaQ+40wekrdffR0dz9OKNmJfMmNVYBJtT3iyx2Yndz57dAGZD1OH9FP/aTVa
 QHYBm5NAGfqONhK0g6fiVWQIVWD/pBk4ONDufhfnQ+hXMMxf5+MrLmQ23x3SXplBv0+B
 aPwKF0abSbui/1FcNdSyKldUsd9uIj0YcgeIVycEOSpj/iQeGmuHZOtf9PqpJcWcg4aY
 6Upg==
X-Gm-Message-State: APjAAAWmCh5Un/zOikK7vshCwxWd9sx3IlZxoH4MLB57cnKsM223qHF0
 V5MbK67FScsqriZxNHXxW8LrEg==
X-Received: by 2002:adf:b643:: with SMTP id i3mr35863091wre.284.1560490060601; 
 Thu, 13 Jun 2019 22:27:40 -0700 (PDT)
Received: from [192.168.1.103] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id l19sm1296579wmj.33.2019.06.13.22.27.39
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 22:27:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <8608654a-b6ad-a96e-6127-a4d4e069107e@redhat.com>
Date: Fri, 14 Jun 2019 07:27:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/12] target/arm: VFP
 decodetree conversion followups
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EkeqcLTtSrvj

On 6/13/19 6:39 PM, Peter Maydell wrote:
> This patchset does a couple of the cleanup/leftover things noted
> in the coverletter of the vfp decodetree conversion or discussed
> in code review:
>  * use vfp_expand_imm() for doing the VFP const-immediate
>    decode, rather than hand-coding it
>  * get rid of the final uses of cpu_F[01][sd]
> 
> cpu_V0, cpu_V1 and cpu_M0 will have to wait until somebody
> cares to tackle the Neon decode logic and the iwmmxt decode...
> 
> thanks
> -- PMM
> 
> Peter Maydell (12):
>   target/arm: Move vfp_expand_imm() to translate.[ch]
>   target/arm: Use vfp_expand_imm() for AArch32 VFP VMOV_imm
>   target/arm: Stop using cpu_F0s for NEON_2RM_VABS_F
>   target/arm: Stop using cpu_F0s for NEON_2RM_VNEG_F
>   target/arm: Stop using cpu_F0s for NEON_2RM_VRINT*
>   target/arm: Stop using cpu_F0s for NEON_2RM_VCVT[ANPM][US]
>   target/arm: Stop using cpu_F0s for NEON_2RM_VRECPE_F and
>     NEON_2RM_VRSQRTE_F
>   target/arm: Stop using cpu_F0s for Neon f32/s32 VCVT
>   target/arm: Stop using cpu_F0s in Neon VCVT fixed-point ops
>   target/arm: stop using deprecated functions in NEON_2RM_VCVT_F16_F32
>   target/arm: Stop using deprecated functions in NEON_2RM_VCVT_F32_F16
>   target/arm: Remove unused cpu_F0s, cpu_F0d, cpu_F1s, cpu_F1d
> 
>  target/arm/translate-a64.h     |   1 -
>  target/arm/translate.h         |   7 +
>  target/arm/translate-a64.c     |  32 -----
>  target/arm/translate-vfp.inc.c |  61 +++++----
>  target/arm/translate.c         | 240 ++++++++++++---------------------
>  target/arm/vfp.decode          |  10 +-
>  6 files changed, 133 insertions(+), 218 deletions(-)
> 

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
