Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E941BF01814
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 09:25:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyRQZ-0001dR-8B; Fri, 06 Mar 2026 04:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyRQY-0001cO-Bu
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:24:58 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyRQW-0001An-IL
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:24:58 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-798374d0f44so133692817b3.0
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 01:24:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772789095; cv=none;
 d=google.com; s=arc-20240605;
 b=cRSsYxjdW8XhIxjMmZiTKdK4NaFlxxDLrnGLwc5nAngAc8lLuAMxp4TVzpIyEIX3f1
 cCzierDg3YTD/zijq2Ede+TyR77dWzKEcLzIeEyyWlgBHK8QU3YHEcdCqTc9hR5wUUk4
 aQUJRPpoaz1hmHay7GxToDFWidvJW9VzeKdHkVKoaF1qK+c0LNrBom9X7Q+f6lqfamcq
 EmdVBWcmUGfqGcWOYscCL/rVk+GEtcJxyIV9Nc+x9AwESefMXr1kASQvtGVioR/rhQFZ
 I79YfClZ7fAwvOCYa4G2rh15LUcDYl0tL/UiHj85BeDZoSV0E22kddrFeCKTDDZ8aIDV
 kkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=xkgGQzMEwUzolE3oLVrHcVLK36Dc8YqjciFFaSttqwg=;
 fh=db9MrHpE2q0wKF2GyU+nI9ivZs9PtTS9Kq4hJmut6RA=;
 b=a0ljzp5DXbvDS7brWUv8RF//IbAjClCQ7ERn+TFCQGKgnGOrT2aA5I9NLJpfxQRDQj
 wVLqUeDWPCVbybhmlFDD1KzjlzJtKV628eR708dJvUNkHGGx8mEWTY3m0QcUrF7UK9mE
 C6HFgQDNSs8gbgslpogHvRwmRGWz38YotBMpJ+F76OMxr3kPZoCkdPopRxK8gc0QeDtL
 /cBvoEkajI5lCifwYz0rt7iTl0Vnf7h/9fmO1zKINLt/D0QOK7rARnDRx5/ZCEKPsrXn
 MFbmP3nUqKdmmB4pAtEctJQuQW5+W5jxoSNdWi218Ryw4dRTxiTdODS6uAB8CQ4u5ZKA
 ORnQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772789095; x=1773393895; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xkgGQzMEwUzolE3oLVrHcVLK36Dc8YqjciFFaSttqwg=;
 b=RVWVOIQdlX6yzPK+L1d9QiUFS8TCAtC+cNrH5Jrm8yInuz5T3GaB6/oFuYshT1WOh/
 IiKfuhOYpPs4sSI3AB/HgrAJVE7GX0f3ehoqbm8H122NWKly6M0crCN98Juxbemkp2+1
 DfJotFE+uyN4wTtae8haKhv+VCJkcZidDiC2wQ3NUlpDdhUREcYoLVy3hmi0txRxHY5e
 4isNPh1vHt7w2plt/Inx+aw+mKpoorLrLHt/an51j8mRCuLQmE24odTh938LPRz5tgh6
 AKhQdxQgKhT590+YwkUNv9QhLOcyNO3Yk19UMrfMwsKZrp/9WYsnj10i2wqiIgofEJ2q
 Wb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789095; x=1773393895;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkgGQzMEwUzolE3oLVrHcVLK36Dc8YqjciFFaSttqwg=;
 b=dme9CQqfzsrRX4U2g0LW7vQ0Cz2Glz6C2yFGtu2dFNegsWEO3/5oZEuB8URO4DE83r
 bHoozZeUIOt/PejSslV9rXAiriXGOkOJOeTsPXRrPwQqWVdeJLS4ZnK6eFfPB3a2Az8T
 bEFQ3Vr/lPwDvp+X1VkO6RjHI0ZjKQPU4d0MnaOGm0wpGkDXXaNVMjYU2qjiH4BRftNM
 XOEKV2se5mrXk0wev+/HqZWPEp5wmCGZxnHPsn86z4hKwhXdd8u8iRh30jgd4ZHb7pix
 DkOrNpoPXOV+HW5+gEAq+LU82nlQEQKiY0BO3gBTdnQbl8gu0CNUpSlOryRUxhNUJIi1
 6Vag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwekSPJFpG0IcboJAtsHmrB5sC8qbdIak5RZGA2rzuYcLv3SatJvBT54tJ8fu22mXlMPxUdk/fEw==@nongnu.org
X-Gm-Message-State: AOJu0Yy4CxJdmLRhcOAg8sGqLej5tiJJoZX1Zc73RZT4YuzngI4wAQLC
 kP9V8OhpYGtvb9OuLM30rxqWOakXM1kZp/riN/C1SR5V4RJUvfIExTiqDNd+qiBB118Nsh46hO+
 y77ELi4ePgwPJRrBx08xIqdk8COE2Z+kGO8gUgsG6TQ==
X-Gm-Gg: ATEYQzyFM/EkjFRRZ3PrAyWVmi+sUuyZyl+1U6SeaBLLrlqpVB8gTv2aQWoFhB5q4cz
 t0VPX2B2PbKQE64LiJ0Z3UJFcoGFX0iyl5N/UNHp0ywLWFntP1s00fmEcLBUo71uQnEPTyod2j8
 QY+MXu8WXcu0ARaRcKWwKG5T2+/0rMOo68eVT3olyU8r5MlSmUDlAErUgczeNIANN9iefia22jC
 UtCUasLzNqjto0Eky7Mj6SpQ2SIP1FH2PUop4bzgQHj+uBVirhmr6+HqogJKZEy2B+qtnuvfbNT
 4Tt1ZTXuz0RCLg3YPTl3vsrHlNrA1wmxMfpxV6qTBXNRnML/LVfsk4eGvOg1HCSL+WU=
X-Received: by 2002:a05:690e:134c:b0:649:db34:c512 with SMTP id
 956f58d0204a3-64d07108346mr4665928d50.21.1772789095322; Fri, 06 Mar 2026
 01:24:55 -0800 (PST)
MIME-Version: 1.0
References: <20260304142344.3341444-1-tangtao1634@phytium.com.cn>
In-Reply-To: <20260304142344.3341444-1-tangtao1634@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 09:24:44 +0000
X-Gm-Features: AaiRm53AnZqqesJvufABADgC0QBIVKHIB4T580lGm8FPp5aoic4CsW4dyW4EetU
Message-ID: <CAFEAcA9T+=wF=N0nayH02x+g84fbSbfARDT6M2YRBk9XSgRyqQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm/smmuv3: small fixes (spec compliance /
 robustness)
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 4 Mar 2026 at 14:24, Tao Tang <tangtao1634@phytium.com.cn> wrote:
>
> This is a small fixes-only series extracted from larger Secure SMMU RFC.
>
> These three patches are self-contained, already reviewed in the RFC thread,
> and can be applied independently. Sending them separately should make review
> and merging easier.
>
> Thanks,
> Tao Tang
>
> Tao Tang (3):
>   hw/arm/smmuv3-common: Fix incorrect reserved mask for SMMU CR0
>     register
>   hw/arm/smmuv3: Correct SMMUEN field name in CR0
>   hw/arm/smmuv3: Fix CFGI_CD handling when stage-1 is unsupported



Applied to target-arm.next, thanks.

-- PMM

