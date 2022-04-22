Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp316053lfk;
        Fri, 22 Apr 2022 02:54:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/JTSz5XeIJme27D2AAE2WPSLNMbRyykihTiOJaTu+M/bLybNbsamnJzqBa8EiKWddfxxe
X-Received: by 2002:a05:622a:6083:b0:2f1:d380:1fad with SMTP id hf3-20020a05622a608300b002f1d3801fadmr2545642qtb.4.1650621250251;
        Fri, 22 Apr 2022 02:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650621250; cv=none;
        d=google.com; s=arc-20160816;
        b=Gretz/cXrXizbCHZIZ41HLnEX/xiOUdM5AsvwL7hWmYC+B+ExL49JH9tUjKQrq3VpC
         N9v7JzRQWCJq2OaecPpgEMDRYPuf9dWST0RukYyK27Meu1Sf/HodTwICQrGCPCWwje0X
         nkdpV90W/cELiTEqqH+bDkYoimP6T/3EPPiZllYJBY4tGXsIsvpTgMbCcthfjjTRUFsY
         PbsuGtu1ScYFwmIDcG2yXHkIXGGZXOTAFWzYXeWblsLNTDx1SAsmenPz82EmozY7yFhQ
         uYQJGajQSriZWFS849mqRx4jVPUDlaKTHcCSIsCx1N0jvUhLuEQQwftu7NQioEg2PLGD
         oR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OZe7+eLUTIPHvw9ZeULdVp/qrjoKl4WUm8ow6eQlx60=;
        b=XL/dkLt5zpQCPgiqTp7vgjGY6qGuEkoQ2lr1teLKSXTgIf8j2ngUER3oJ4wqPcgWOu
         uz1N3lqZMb4yImpHW76iAhM8cvCV2oiBz4EN6gAhyhw2FsFHt3oeC/j1ujhSTpBvkNbx
         DuXaYvpbFE+AYel0U7FrQIe4R1zmNDeHfWxUPMGREQwZqjYTEQU8X8QX9n23kFKAZLRY
         Hozd7HW3hEZFg2PU4yqOWgvsYQz39Hn5tDFkY1rNmNV8ZKQ0480RJKHqEWrWew65y8Xv
         FVGhEFixK7qVm2PdkQ0yrqCaWfkxOgqEoDA6nd+KKTxPLFd3R/sMCDUSlvq89hDCIY4x
         g6Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W2pmfpqQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7-20020a05622a048700b002ed9a000642si2095807qtx.154.2022.04.22.02.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Apr 2022 02:54:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W2pmfpqQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhpzN-00035t-P7
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 05:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpuf-0007QV-6k
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 05:49:17 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:40185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpuc-0000I0-Fq
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 05:49:15 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ec05db3dfbso79584207b3.7
 for <qemu-arm@nongnu.org>; Fri, 22 Apr 2022 02:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OZe7+eLUTIPHvw9ZeULdVp/qrjoKl4WUm8ow6eQlx60=;
 b=W2pmfpqQj0fF4Imve4c9pj7M6JYxePf9dpJ46/u8zuxV3/EGt1lRPQxg26PkapGHkJ
 k39MEyvUPYWnkRju20siWzT+M80J+rNebGLadd2TCq2FmgIdyjCpNSECD8h1hD4UsmvD
 PFL/a4lIDL0Lpm6jxWqDcO6MFwR8xi0Ye/+AG3plIGtiZMHPIOBQ4fZy7OJi7fmlKhA9
 medG6d15nDJyTXYOLKV96r8lnmG2OHSJJDlMLTbd8g2LfxgYZ9DDft984KusiZNgrgWG
 EZDT17jZJY/S0PMLiQiuGu9ixT9l0VQEDZYWzffGiSr9+G9WFM5N3rpYYFcpw094AGsK
 eSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OZe7+eLUTIPHvw9ZeULdVp/qrjoKl4WUm8ow6eQlx60=;
 b=qXQHc5onPUqshiroZtskGmJKbXv4aZgJtKowAvL38cfvZrq0c1SR+AO/Lgk2SjF5g2
 D6Sdqr+/N6QwiHsG2ZQy30t+p+SlHdtim1URUSxps40iQmdkuVZnXhusJ3FeXSYJc2cY
 wvw3k0ff45Mov/Yd3VDpBSkKSTimo9tY7EzmCUvitmbEDEL5+RaqEbo8rpV8z8vzd1GT
 yURoyDAzknslEkRB47fR2i4X0jYCXZwGKfRl0NMp6FWj91R5iqEI6UYAWaxsFoRGobhg
 AuIl5jiHap108KCgqI6BunOW+eK/3oIrVkv3rdVmfdUM21d14c78Ub6qmzAaNRIUVn8B
 WYrg==
X-Gm-Message-State: AOAM530/9sxq/ojGtjkRacdPeXE144Ak0Ahg4sPAYn6UZg5L36YaWM3M
 6Dh4qkeYHh4gB5v1a38NFwGUPbOUkiQU/2f836DsiWrCaLA=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr3847194ywf.347.1650620953229; Fri, 22
 Apr 2022 02:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-29-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:49:02 +0100
Message-ID: <CAFEAcA_q9zA_Zr7q4MRxu1uYrZ-1OnWhQf9jEaePe7Qq8jbNvw@mail.gmail.com>
Subject: Re: [PATCH v3 28/60] target/arm: Reorg ARMCPRegInfo type field bits
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sx6ixbIxpJDC

On Sun, 17 Apr 2022 at 19:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of defining ARM_CP_FLAG_MASK to remove flags,
> define ARM_CP_SPECIAL_MASK to isolate special cases.
> Sort the specials to the low bits. Use an enum.
>
> Make ARM_CP_CONST a special case, and ARM_CP_NOP an alias.

This is a behaviour change -- read of an ARM_CP_NOP register
currently is "do not change the destination GPR", but
read of an ARM_CP_CONST register does change the GPR.
Maybe that's OK, but we do have several r/w NOP register
definitions at the moment, and if we do think it's OK to change
that behaviour we should do that carefully in a separate patch.

Also, currently we do not migrate ARM_CP_NOP registers but
we do migrate ARM_CP_CONST registers (and this is important for
KVM --migrating the constant ID registers is how the check for
"is the destination a different host CPU to the source" works).
So overall I don't think it's safe to squash NOP and CONST,
or to treat CONST as one of the SPECIALs.

thanks
-- PMM
