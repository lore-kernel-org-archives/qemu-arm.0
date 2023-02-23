Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp889137ejc;
        Thu, 23 Feb 2023 08:32:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8kVTXRuHvj2gn9f6kNnJ6b/EnVnbHqkgEVo6WR3bv/Ur5g6LLZ1KYAFgV0XFanvDqclO03
X-Received: by 2002:ad4:5b8e:0:b0:56b:fafa:9117 with SMTP id 14-20020ad45b8e000000b0056bfafa9117mr25886172qvp.25.1677169975105;
        Thu, 23 Feb 2023 08:32:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677169975; cv=none;
        d=google.com; s=arc-20160816;
        b=dCrA8xV1hHt6hWDWuvWtC1ywMEPYgkIepk+qlwZCmbsZjSDWtBrjOuWxu21o4AOskq
         UgknLZMhBRxe0CWEiVowdkPYe7GklkCil2To716eMNSqMzb/TwR3Iz+WrgkBwwuVjG0E
         arROLAdNRbdY1V6k+G2SD4E1/DKscMoVOmPu9+1+iWrfbuLpZQaNnyBTLivt5kN64vpa
         r/EfW6wAhrL0LodIPjfN4yPy+WqrU9gQL48cLahXr7daGnV2Ll8rMiGvHaUn0lzcblDW
         g3eonpXovir1OSK4bpS9xmiWGqwK3lfi3eF6+J9X/62THjMPKyHOMvDJqInJCE76s6a4
         GVJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uviNt3lw24MHazb1piWlCKZx3R8PPhlJwbaiSWELna8=;
        b=O4RlvWLirmYggHCLZy1K5wDWkeR7muPeqrCDXAqPVxk4UOAkTTYJ/n70WeWtu+joQx
         zoZCt+zlHwjkWbWnd3V24yGI+VJgaYXHdPoBP1UwXOG0L4MTE29xdOEA8BZEWjGXskJ1
         iDUgw2JCbK5zdBpqXBIUnQHHnoE9ls5/U8zYbcILaedvTPMsesdtwhsSvXC/vS38F/w8
         dodFnk+xzHOXK7nBMymY3vp7nrhVconWn/k84UIskEf6L4XJTfoakS8ooQMA897urIfL
         Q5siUKS0uUgI20vVMtRmiUlgb2TsfePL68ezJnOloOIvDv9DjGcBBJVpwZK/qdNydS8Q
         QePw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Lhi5N/Ag";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15-20020a0cd98f000000b0056e9493e97csi720903qvj.432.2023.02.23.08.32.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:32:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Lhi5N/Ag";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEWF-0006CY-CO; Thu, 23 Feb 2023 11:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEWD-0006CQ-Qs
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:32:29 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEW7-0007Dx-II
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:32:29 -0500
Received: by mail-pl1-x62b.google.com with SMTP id u14so9679314ple.7
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uviNt3lw24MHazb1piWlCKZx3R8PPhlJwbaiSWELna8=;
 b=Lhi5N/AgIHedOjgAfGedCU7bA/tbMIyaCAsMHmjTTgd+crfylSPD/9yhSX1ddMUkOG
 jtqh/f9Gdny5DcupXeV9xVULQ+ncc/+XTMHYtnF9rm/tzGytkDhDpi4htiBjccRuPg0T
 Zw+CKf3q/xwbySOtQUqh54Z7d1AjavhgPBXxgs32R/Ye4wzgy0tKdFzjqu+3oi94usHA
 T3QBh6t5I85BbFUOQ/ZMbywSC4gPssy8vKyjyHaOYiPq+Rq7Jqz3oBW+Hh9Jb18xONdy
 /LdmOljvfuSKQkLfNTm5d3jsIlGpPJrPn4k9679jnzPIxvEtUqxrmI/ke+QZszcx3QJv
 ccaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uviNt3lw24MHazb1piWlCKZx3R8PPhlJwbaiSWELna8=;
 b=thVlHRjo1yd1+WjhO4qxK1MKt2250EDxxYnN5G8imwg6tuDQU6+l5Bn19qep8H5dHG
 P2NRDS0v4314w+IkWEVIzzzIZXE3SXixkV4V23QjE4ocBy6lIBcnC1OeU1Ml1wY1MIkz
 kfac/883tCbG90EmahsiLPnAlvIxPXpwVWFtNABTole5QjgS8WGNq0wg7XA2SD3vmTko
 59UwQzMhY3+Rrd9RkjCK7/qBFMl2m2W7MAeal/aQBV07AKIbxwX+O4A9hRGFysu/6d5E
 GpCMpBdSRF6IpAufnoiAajznshl/6btSrMwX9Vaey00Ol2RJvx58JUqKdEP3Nb/SGQB1
 Vwkg==
X-Gm-Message-State: AO0yUKUYDdUgGWObBCguTIDaWVjuRVy1NMn2V+YwrPFBT/x4GszOr9St
 22lm+LbnDeLy9KMO1vxLTUqCssm6IhaCuknT8pgXZJmhOYHStA==
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1269488pjb.137.1677169938150; Thu, 23
 Feb 2023 08:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-16-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:32:07 +0000
Message-ID: <CAFEAcA-T=wK_Sp-z0LdbqeDfh=f+cf7C9NX_TVc3CPG0qWD67g@mail.gmail.com>
Subject: Re: [PATCH v1 15/19] target/arm: Add SCTLR.nAA to TBFLAG_A64
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: r0t7uBOHp0f8

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 3 ++-
>  target/arm/translate.h     | 2 ++
>  target/arm/helper.c        | 6 ++++++
>  target/arm/translate-a64.c | 1 +
>  4 files changed, 11 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
