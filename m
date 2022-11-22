Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3330415ejx;
        Tue, 22 Nov 2022 06:23:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6QCvhEAinQ1mBXUZRsCKN5TQVpGwU2SSd+UKQ6CbkZswVpeZxcNG9I/5B5qRIzflCeGqBh
X-Received: by 2002:a05:6214:ab1:b0:4c6:a7fa:b7a with SMTP id ew17-20020a0562140ab100b004c6a7fa0b7amr10532759qvb.40.1669127003682;
        Tue, 22 Nov 2022 06:23:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669127003; cv=none;
        d=google.com; s=arc-20160816;
        b=j6yfDxAKArweflmJwxyp69fV9HvVLOIzPCPox77+wxkk9xMyLQEU9/9Aec/YSHiTIH
         OgB3+aYavjO9CdPmCgfo949g1RtyJfF1c0NTEQAvH316X0kTeXxzSrWCoothso7tGnOX
         IcrrOD/r5EB7a5FiccvGMsaKqzObjiqnRMjHKazSHxVCHC+ZrsceOciqy5D/cEeeQUMl
         WtvfB79tdPc80UoiPkwDMTWG+x8hhjzS7AbiYafFN7pYVq9Qxsbzp51bz2hxy/gM+C27
         QdUomUdlLyC8yMHgJVUdPjg88/L/yS7d1EZdPPsSwJj7xnUxwu+lbQG7bK4XAH5+Tf77
         B4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=V4Sw8aSxUN9A5QwjVO0Bw1eHNkGVVrDX+DJy0NatTCA=;
        b=TI9dG26F4FIsE80xjdK6TjJFT3UnuN12S286mxSqbiZC5qsK5jmdsqDLiglAAbqmq4
         td16zulEWMwRooavixYraN+XB+g1yxwQNqCQJ3eBu6L0wJWTVpmd4qwDcR+vlfoL3z1k
         5gBV9K875mj0LLeDHEjw+1kUuCrWJ1yx81ekvSDDw2aqcXjwVOqnpCstOICPQpE59Tww
         e59B3bmN99g1Ae/9X4J/LuQX+VLsTku2/GFqZ+3D9iFLjjbiZfLeIeC3dXuiJbnvlI4T
         a3X+biXc06w08S1CrrkpiZsm/sgYj7E7JGzhULKpJJdaOrnT/LvFRfWJPIwKIM/AZI2l
         ievQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h4JBSVMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do22-20020a05620a2b1600b006fc2508ce8esi251257qkb.729.2022.11.22.06.23.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Nov 2022 06:23:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h4JBSVMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oxUBG-000362-V5; Tue, 22 Nov 2022 09:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUBF-0002zO-8Y
 for qemu-arm@nongnu.org; Tue, 22 Nov 2022 09:23:21 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUBD-0003ug-Sn
 for qemu-arm@nongnu.org; Tue, 22 Nov 2022 09:23:21 -0500
Received: by mail-pl1-x635.google.com with SMTP id 4so13820014pli.0
 for <qemu-arm@nongnu.org>; Tue, 22 Nov 2022 06:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V4Sw8aSxUN9A5QwjVO0Bw1eHNkGVVrDX+DJy0NatTCA=;
 b=h4JBSVMzURhPQYzyrI7pdrhFNkbFxsjFhZAc3KOUKyRXYW3zfMweTYenJSVnl6XySj
 02pqy4uHNkad1GJY/Qq0prgL1psAWig2rH5/jMM7AXi7XcNNDrR9DUIIkKAPZ8TJVvJG
 tt7xHwwC3wQayQc8y7Nu+h/CJwN3NjQ6x0hIZGV/Rd/2yBqzzubCK/txBrj8zMgOYu6/
 NEPJ0hXtY96DIBn7wcTx64aKPLB+xwu/lQ4cI0OIYo1TdzMZghVd4lMNzTzrSC60HQSs
 tBx3T2g59t5mEFy6vL+OiMoC6rVHUCsb0O1xtjQY/+VmQ8NNMbQvFjS1Nzwaqq/D1JmZ
 gU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V4Sw8aSxUN9A5QwjVO0Bw1eHNkGVVrDX+DJy0NatTCA=;
 b=8BBa4VhD2HAK7CEvjl7nbLW20gny14LdVTbpqXt7NQ3JNdKftnsWVFgqztCUaH5/N2
 S4CSJTeR0DAfzBeuNsmc1/C8GFTZ8bZ8Qf1mB/wKCusr1wAiHW3hlHSK9CTpoiuXerMx
 LJNP7XHCy4HyF371oIT74co0z1/liPiZFELstWuBWJc3sKO3Alshxdb8F7CSBQF8g2B1
 cjMSG7XNLMx3nTzHTgNJyxu3vIvyuV02ootrXEiyxCKlONU9vQaRfilcF8btYXRBALWB
 ZBrNd5PAKnOuzE+5p7AYlbiZUaqahImBIynsWRWWC957F6XyKvARS01W0TgwWipfxE+e
 d8zQ==
X-Gm-Message-State: ANoB5pk7p7J5QgBQ0lTzWIt3jdIy2Vz40Qc+S0VPCUF7PVe3+ouyBUj9
 VyfTljquQ16O+bvp0sb7WlgekFiz1ekbGWKyWltWdA==
X-Received: by 2002:a17:90a:7004:b0:218:8757:8f2b with SMTP id
 f4-20020a17090a700400b0021887578f2bmr20720237pjk.221.1669126998448; Tue, 22
 Nov 2022 06:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20221112042555.2622152-1-richard.henderson@linaro.org>
In-Reply-To: <20221112042555.2622152-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 14:23:07 +0000
Message-ID: <CAFEAcA8yOn39EFtf7eoZJp4rm+1nARQCFj9V9Otmo7HTNqDO0g@mail.gmail.com>
Subject: Re: [PATCH for-8.0 0/2] target/arm: Use tcg_gen_atomic_cmpxchg_i128
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GhuuYpZZoI0X

On Sat, 12 Nov 2022 at 04:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the new common function and avoid rolling our own helper(s).
>
> r~
>
> Based-on: 20221111074101.2069454-1-richard.henderson@linaro.org
> ("tcg: Support for Int128 with helpers")
>
>
> Richard Henderson (2):
>   target/arm: Use tcg_gen_atomic_cmpxchg_i128 for STXP
>   target/arm: Use tcg_gen_atomic_cmpxchg_i128 for CASP

You can queue these patches in with whenever the
underlying tcg series goes in if that's easier;
otherwise please ping me when the dependency is
upstream and these patches are ready to go in.

thanks
-- PMM
