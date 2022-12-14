Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp493709ejb;
        Wed, 14 Dec 2022 06:39:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ygnZhdI0ebMmDlbWzbEIWF8gM8V6xWNlIMXE474gKJexRRAw34eFGyPvDo4HngaCl/z61
X-Received: by 2002:a0c:bf43:0:b0:4c6:f83c:473e with SMTP id b3-20020a0cbf43000000b004c6f83c473emr30271813qvj.23.1671028744744;
        Wed, 14 Dec 2022 06:39:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671028744; cv=none;
        d=google.com; s=arc-20160816;
        b=UEny4Iv3iLWjMmMhH0WiatRkaRSVGt6LDm0btZq3+R6u0qTXJmOMQuwuWGOj8fm52Q
         ju96RjXQP8G32CVlHALnVV2HNIE7XmF9fGVRvjnuZmlCYpuEgw125TCTKqR7W0oLjJ5O
         6L2uI7Uo4uOqcwuVQZZm+Neqdel6uhQ3d2+UV9wOg7t5APSLG8fqtw++de0/Tq2bTl4x
         +XmVoqU4GIQS8X+QyaNpPzz93ZTQXjlMF94blPI8y5Y42W1jH8vBDMLFv2zmE0rvDBnh
         rP6gUEKeZdo3u4jDX5lUSJnrOPppQROktRk81OrKaWZwllorHXpwBGkNdJhjuMfT4BCL
         1BKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZsHI+5RXvEYR/f4x7ZQZgOnTTHnssIUM4iy0WeOwN4Y=;
        b=i06JWokNam4zY1wXm2Lun9vz+BT88BDIF76BYmwEav82IcDEy28xPtJmnhceVihHxC
         wwpIs0Z6mDJq47S+BiRl2Pe+UBgvwQeF/yKZg4afhekxr36pzL+y/LuHI6DwzGwjpK3k
         owrDMb/bkVCc4ugze7LMhUDLJH8lfcVDRExfcvwjMJJArRk4X1PIHEKCSeJLYfch4hlp
         aKFh/CvQd45amICcCofscTq4MgRjU6V/1zKDmPiHJCyubZScxfCy+V07JnCsO7eJLHNm
         Hb6clzhLqwSyyDXbmx8mYpAjX02VtkPjW3EMOBbLopO7scCdEQDeHR66aMYzfMLSeaKE
         BoSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q4KOeLZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020ad45bcc000000b004bb74825290si8589064qvt.132.2022.12.14.06.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Dec 2022 06:39:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q4KOeLZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p5SeR-0000f7-O9; Wed, 14 Dec 2022 09:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5SeQ-0000dT-6K
 for qemu-arm@nongnu.org; Wed, 14 Dec 2022 09:22:26 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5SeO-0006SS-FV
 for qemu-arm@nongnu.org; Wed, 14 Dec 2022 09:22:25 -0500
Received: by mail-pl1-x62a.google.com with SMTP id w23so3442766ply.12
 for <qemu-arm@nongnu.org>; Wed, 14 Dec 2022 06:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZsHI+5RXvEYR/f4x7ZQZgOnTTHnssIUM4iy0WeOwN4Y=;
 b=q4KOeLZBeemgmu8NsP6Rv1Jy3SB0MYOxqXRvb7tTEY9yxEFLq4XzewNxwgX19xTOWQ
 /VdWuH048gVO6ncmuurDSaUyBklq8fpoRAfKnGbid+vdNGOlXL7QsHhQLsb+Jvnev7jq
 FSlXCrJpyUUpaNKlPVFHUuwvCOcNWCmYeFhDMlb2Xul5PpHlYGxtY8qSgvV9BreV7MEY
 fY1hdHbqsuR31saY7BJAQ+KOzzVSNdFTEiCB+IqRBN/ncOfLMXdFYsLpxM23Ch1ckL7W
 sm6uA3usSNZz6e1j+qOWdUYCxOGKqMCN/L0WxV2EiF7G2vGj1mJzrX6gTyHiVYARCL5L
 ItTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZsHI+5RXvEYR/f4x7ZQZgOnTTHnssIUM4iy0WeOwN4Y=;
 b=j5hX2L3aDDcMbpIiF9HtpDgClKuiexpXcMI34LvjKwb/IfX8nvIlcSRy0IRPHJhjjZ
 hcWzJfInNGyjaJMdoz2ovhv+o+krF68uDeLQiGf1tvzqeWQrAeqdEr4Tb9r7G9XYHooI
 fpVbVpEJf42tARd80DEvovb4llvQglDvnzCXCIzR7D6Acsv4VFQjqsR9Zttwik5uMn97
 dAElhbIXth/aUROgkvN8pzlezUkpCfRNU1IBB6xVMhxNWynJXBOJDSPR2N+hMmAG5mt7
 Bl3ePRnJs0K9RUbD2/PAU5leipkUI5Z2zsPamecQIGqCCdaH1jlCNjGA0R7c7wh4yaRy
 FILQ==
X-Gm-Message-State: ANoB5pnPWcBrSM6TbNU0t/NzJhI+r44RagEfx0dFj8GJs/dDySTLmz4G
 yXKi01WTJOVf5ozBIIDy49IS+QAkNvTyNq6rJ4dRww==
X-Received: by 2002:a17:903:2053:b0:189:cdc8:7261 with SMTP id
 q19-20020a170903205300b00189cdc87261mr23142690pla.168.1671027742389; Wed, 14
 Dec 2022 06:22:22 -0800 (PST)
MIME-Version: 1.0
References: <CGME20221214131036eucas1p142325a5cae35a116406184b5d0731115@eucas1p1.samsung.com>
 <e5232540-9c92-e16b-f8ca-207ee4a8516a@samsung.com>
In-Reply-To: <e5232540-9c92-e16b-f8ca-207ee4a8516a@samsung.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Dec 2022 14:22:10 +0000
Message-ID: <CAFEAcA_5D_cRvTHXnY7ydA03p+0tAd19W3FpEi3BpoNU+rvaVQ@mail.gmail.com>
Subject: Re: Question about Cortex-M exceptions and ES bit value
To: "Igor Kotrasinski/Security (PLT) /SRPOL/Engineer/Samsung Electronics"
 <i.kotrasinsk@samsung.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kaV6ZN91CuE7

On Wed, 14 Dec 2022 at 13:11, Igor Kotrasinski/Security (PLT)
/SRPOL/Engineer/Samsung Electronics <i.kotrasinsk@samsung.com> wrote:
>
> Hi,
>
> I'm playing around with hacking in support for a custom Cortex-M board,
> and I noticed something strange in exception entry code. The
> av7m_exception_taken function has a bit like this:
>
>  > if (arm_feature(env, ARM_FEATURE_V8)) {
>  >     ...
>  >     lr &= ~R_V7M_EXCRET_ES_MASK;
>  >     if (targets_secure || !arm_feature(env, ARM_FEATURE_M_SECURITY)) {
>  >         lr |= R_V7M_EXCRET_ES_MASK;
>  >     }
>  > }
>
> Meaning that, if Cortex-M security extensions are NOT present, the ES
> bit is set. However, in the reference manual for Armv8-M the roughly
> equivalent ExceptionTaken() function does something like this:
>
>  > assert(HaveSecurityExt() || !excIsSecure);
>  > ...
>  > if excIsSecure then
>  >     LR<2> = CONTROL_S.SPSEL;
>  >     LR<0> = '1';
>  > else
>  >     LR<2> = CONTROL_NS.SPSEL;
>  >     LR<0> = '0';
>
> That looks to me like the ES bit (LR<0>) should NOT be set if security
> extensions are NOT present. Am I correct, is it a bug?

Yes, I think you're right, and the condition should just be
"if (targets_secure)". This matches with the v8M Arm ARM
documentation of the EXC_RETURN format, where bit 0 (ES)
is RES0 if the Security Extension is not implemented.

This doesn't cause any guest-visible bugs, because at
the moment both of the CPUs we model which are v8M
(Cortex-M55 and Cortex-M33) implement the Security Extension.
But we should fix it in case we add a v8M-no-Security-Extension
CPU option later.

thanks
-- PMM
