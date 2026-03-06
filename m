Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C61F01814
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 09:19:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyRLL-0007K0-E9; Fri, 06 Mar 2026 04:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyRLH-0007Fa-DN
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:19:32 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyRLD-0000iK-Oy
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:19:28 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-649278a69c5so7792813d50.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 01:19:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772788766; cv=none;
 d=google.com; s=arc-20240605;
 b=c8eL3TxNytAndmK5uDMP534A/bIIxDjjLocc380mCOJUcNcBr9TV7jcNI5cxPTueJg
 htNZZZClkIFRnLINFnnfJZLiMLTiKRhkrnKPpaLdWWbdoQJULn8lyR+rf221y2jsaG/l
 OQ/SNm8vRzWf948ik2sIGdqiuIQ02/QQyAtsIFtdFjgjFHBuRgh3MeYW05Bh7Sq5fliA
 0cFpKtc5W6dqY8ih4etpw+u6qCu9Ra+fAM5giE4JiD/Ue/gAZRlnlOW70Izg0cQPt2sa
 LZCpHCGtr/zJSDlUocvRD8sVxLblv65xxx8HZkTwnLpaqpOSHb3BY7nOCpljnMYGPW25
 0nzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=0/6zAoZ/NERSIqrcdz6q0tgy2YPJ35UoP2Tv4Gcm+RY=;
 fh=da2/vijuymuC4Q3be6YeRP9ONKv7aXAhFYIwTNo3Dk0=;
 b=gBFdG+SDCSNTsshBiemSQBb5C+BDOh1/SMNGtFa9S2W6Kv6f1WJfjSXNgljzdA7UUs
 jlVOzDROV6t7LrtrPmJ6eCnxcWPOj5PArQYlbPTMrhumM4E4oXYm1xRvMfoRoxapATMs
 ouMYTmEUL5BJ1lcW71P2ZGyJeHvwhWzsxoF7O9UuYo5zsWGHWKYa18GxxREm0ZwqkYt7
 xfpDJszul1pnG+f/VQ3dC9tEQ/q5iceSGBG6XYUfQRJ9YpTFLd4OixCUyuOB75X4Vvzq
 0Z7ilsTM8cuytyLcHerIsflvysbRRt6bEcutolPFybJSCZZzM9JoQwmzEV/2ITgTR2TL
 rdYA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772788766; x=1773393566; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0/6zAoZ/NERSIqrcdz6q0tgy2YPJ35UoP2Tv4Gcm+RY=;
 b=ase6/rxM65pS26h+W3jkeKZNfxHVFqL6/sZCjlr/SgOTYMf1gKRkRXLH9jOOxIoiaD
 HJ31mtCfHEd1XvyuLqMI1Dj3+x779ww4QCXGuAIpaIzBUz9CaR/FwuBsKL92ZfofXv6C
 oG5nFwdSdHH3EejvbPF6/t3dEGY+A0iM3FMmb5loiMHc5p9ubvUT73wdoxBS7tHn055T
 lq+8vPq3DnhZGPxmpKoii5FfXPaTTPoiplQ6vcTGLsrLmEnOJgcmVqieZKBYmJITqNg4
 ecaSYpAmnekYaMXP4sZLfQj/pqftP/KmG0gmXfgZV2IfUPxnex83XhMukxPAkHfFcRqp
 KRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772788766; x=1773393566;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0/6zAoZ/NERSIqrcdz6q0tgy2YPJ35UoP2Tv4Gcm+RY=;
 b=RkNgC5V/8VHycT6rAbcr9AAumKSGWUUYgFAACnZO9+sNTop7GeR/xQY8yCgOwhKuwR
 MmibR1X6mGSPg72SpNpTHToJOfhTZtnG4ennCWb2j5NkE36oMgG98GaUfYw3R6cIea9p
 sVEoiodyhp/LHc+/4uRR57UFXqQSAG8r3QN3BH9IvEcvfIPyMROIRCXAQM8mLGkLI/8S
 y3inVl39zURJUUR1jHbj/2ypwvl2RVRt04wnmWNxSt33l1YIEe+L/i+uZsMbmcu7JwYp
 4nzJALEo8mToXzdhBOjve8mDPp0iMLGJTC8wMpZsMBV66bCuqem/a0B3Xfwm675fl+Fo
 9hJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk/scKlfvmjV+Q7H52OG/icqc9tGuHMmi/BbAAPGJoQ83HA2FNylwlESKQzvvJoiptQhr9jftmug==@nongnu.org
X-Gm-Message-State: AOJu0YwGNwtburrRAZxz5j1fYTBlACr+b4Ri8cRYPuqceNT8XZ8rr77r
 /QIlP7LXzMgDaGxUIlf4H3niHIMMzTNn0EOMEkKfjtw5RBvoiRSdW/w+nLyw5u1rcjXZXE2utUB
 EsuCLlR16uJryaeOYaHgJYQUloFlApQZg4UFV256EIg==
X-Gm-Gg: ATEYQzx32aX5xHT4V8gkxA1rhsgIlPWjs4Ob4poF+iYj84R/qv2DHJM0r4sOypRG+86
 GHFCMFCS7d66rjCqEOzBdFOu5yGfs4zEGvaLJumvm7sQ+34qXG8CH772U+wKSWNGJQSDwgcIzg/
 8LBegiBN6XFlCfIVXmD5qiZg1SA2hIy4H4rsvxVMNWSSIgeaeeWE29EN3BB6O/ZDWCDKbCdGdAK
 pLbYt7vUOp4AtEGDX52D0/28GwmEJ56I4RBV8uKcVZAsBNzyVm6CGM8DrHvsPQx83d0BW+mH9Im
 zlmCZYnenbeHWw/tfklYJC96/mucZoopF1NlbiPbeiTmysCyhgLsjDQOwnYT6SqcQEA=
X-Received: by 2002:a05:690e:1516:b0:64c:ba9a:f1da with SMTP id
 956f58d0204a3-64d143757f4mr1022633d50.87.1772788766241; Fri, 06 Mar 2026
 01:19:26 -0800 (PST)
MIME-Version: 1.0
References: <20260303-sme2-hvf-v6-0-b473702d8287@linaro.org>
 <20260303-sme2-hvf-v6-1-b473702d8287@linaro.org>
In-Reply-To: <20260303-sme2-hvf-v6-1-b473702d8287@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 09:19:15 +0000
X-Gm-Features: AaiRm52yZxeAMvaUZ1XA7Duqx1hN1BfK7WKnC0qBF5S-Bx3DlbyHktkeKt2Ee_s
Message-ID: <CAFEAcA8zTkc4pyHQKoDkTMhGPLQmxBaJS3bZiGRrPgux3rDLzw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] hvf/arm: handle FEAT_SME2 migration
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Tue, 3 Mar 2026 at 07:42, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> SME2 support adds the following state for HVF guests:
>
> - Vector registers Z0, ... , Z31 (introduced by FEAT_SVE but HVF does
>   not support it)
> - Predicate registers P0, .., P15 (also FEAT_SVE)
> - ZA register
> - ZT0 register
> - PSTATE.{SM,ZA} bits (SVCR pseudo-register)
> - SMPRI_EL1 which handles the PE's priority in the SMCU
> - TPIDR2_EL0 the thread local ID register for SME

Mohamed points out that this breaks the build when compiling
with GCC (which I hadn't noticed because I happen to do my testing
of target-arm with clang on Linux these days):

> --- /dev/null
> +++ b/target/arm/hvf/hvf_sme_stubs.h
> @@ -0,0 +1,158 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +typedef int32_t hv_return_t;
> +typedef uint64_t hv_vcpu_t;


> +typedef __attribute__((ext_vector_type(64))) uint8_t hv_sme_zt0_uchar64_t;

The "ext_vector_type()" attribute is clang specific and gcc
doesn't recognize it.

Since we're defining all these types specifically because the system
headers are not providing them and only for the prototypes, my
preference would be to simply drop the attribute from this
declaration:

typedef uint8_t hv_sme_zt0_uchar64_t;

Could somebody confirm that that works OK on the relevant macos
configurations ?

thanks
-- PMM

