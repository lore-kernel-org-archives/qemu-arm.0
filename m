Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1408505ejc;
        Fri, 3 Mar 2023 10:47:22 -0800 (PST)
X-Google-Smtp-Source: AK7set9hNmr5TROmXa0s/s9/iEHsMpk+QyQXNogJs7H7/CfAatcJkI7GdaPBPS2MBlRDlSv/ZQZk
X-Received: by 2002:a05:622a:204:b0:3bf:d161:799e with SMTP id b4-20020a05622a020400b003bfd161799emr5151549qtx.65.1677869242131;
        Fri, 03 Mar 2023 10:47:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869242; cv=none;
        d=google.com; s=arc-20160816;
        b=PJ2UpKixA8Fyy+fJxVPHfRXcdkFGyBX/OAFQpKFsfjimxqrJtWtFQQBzACJjUUIj6w
         ct1KY1bnMpC2sG9/brZQXALXjI2G7lFX49BLXbYblha1QtSoS6QxrbGmKcuUoNghRcPm
         QoP9G2yaVB2QsKvVQodN+LhaHBO2Gd/51FD10ABAiy9K5S+tugepGqN4BSxWWXAAPfCO
         JvHwJtGIgzLGQfSYtqgf/avXoaQnVogsboy5Hp0gCYTrQ+PQitprJkrvQd5AEneCcm0j
         OXYmU1WoA124+qbo5Oiz0UNTVrW4v7ss/kTvf+M9NewoHqITrh7z/yLVHuar1CnSYm2j
         ASmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+SIMPEwRhLB0F9/Y03oPnThC5qqtRO8qJVAcuzylTDQ=;
        b=jSSul4j1dC31d8O2l6Q1pntuSlUW0dRjkPWwQdeDqa3JgH64EToOiz2fRA7KChgNgi
         ATKrZaf2OpzPGDlEHtm3+t2LW0AaCv6GOzM9YzxqwtC3nlCES6DS2vQn1l7vlJP8EEBu
         MNr7AOXwGZ3h22WSGlwGd5EtowMKuWD/7CPUiBQzSRScWpCota2106rbF3YolAzDeOyS
         z/Vr4k9XYMatHNOWVz+LI0nZXew9TxH0gZa++PXTbwU9v6KaD1C91F1k9sdZ3dYyZO65
         9cfxeBtMG8GTuWD7KOl11mZvciRX96FxIALuXYoYsHaiG1l2YYi+J1VolTzuCNshlGOw
         Q/NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pj8EIGbr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020a05622a100200b003b62c3eb9b1si2241378qte.572.2023.03.03.10.47.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:47:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pj8EIGbr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYAR6-0005cm-VT; Fri, 03 Mar 2023 13:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAQz-0005IK-0j
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:47:17 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAQx-0000jd-AU
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:47:12 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so3182600pjp.2
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+SIMPEwRhLB0F9/Y03oPnThC5qqtRO8qJVAcuzylTDQ=;
 b=pj8EIGbrSe/n0I+x96yXQp+vA/DQ0jch6GAgYgTQbJPZSykJnmS5SgwOj5GuLiJstP
 3O/pIo21PSf6jDuWH36OK0/97WwCkmTpPRTIP0/bPSnivdVx9W5R1gjtjnE0l8L2wl4E
 wPPWAtc4+9Kpx8buds+ieWRJqpHNUJGLRNZm6HEF9g/uD/GOchW91et/UMB97xlt3urA
 gke7MY9t82UKoEI4555MYag77pEoVwis6wVmzxDZJVThOLONShXcGhDCo/gkKFLIKdf0
 WjU9SDwboNtytfy//g95UAsBrhrFroeNVi6wBMSgWwr307gmGHPAl5di40ITYM1vHEC2
 0ULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+SIMPEwRhLB0F9/Y03oPnThC5qqtRO8qJVAcuzylTDQ=;
 b=W6NmInGVc8tzF/w9he6Fig8RuMsQQUEyfVMklaZ+5fSuYuS58Ly7j4mXnqPXJBJyjy
 7sgkPzIcTQK9YjYk27Y1gfiWLMRmMuyl2OIM9krhmgAt3qGSSvmuXfvFiJQp6H5/v6Ng
 5xJnGCUbDr/IZ3Ba5jRClLpX9cBp/TIew7GENAqAZ5UXjnkZQOdR50sHqp/Azi+WFT6Z
 aKouNcTdzPYhM8abjYG0kOLgfFKybyYB+iSCbdiiAK2DSjw22H7XKat9QBhtcIpuLpy3
 Lp5kA69bfwT973F05kfk/OKIN0eE59V4acrA55fV9Q4RWwAuP3y+w1zy4/PV6RCKpEls
 LBEg==
X-Gm-Message-State: AO0yUKXdjj+Xx3X6qjXTYMa/bPePSxO7Uk2zKinvHDz5nMXJ8n0JFrs2
 NPh461tmPkLpEJTtL2GLeOcwT4MCaMqPtDFkNcjOjw==
X-Received: by 2002:a17:90a:a888:b0:236:a1f9:9a9d with SMTP id
 h8-20020a17090aa88800b00236a1f99a9dmr2833482pjq.2.1677869229818; Fri, 03 Mar
 2023 10:47:09 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-23-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:46:58 +0000
Message-ID: <CAFEAcA9Mv=CRWmQUho=HhRmVBcZ9w5cqry7LDwyLnEHWt3yOQw@mail.gmail.com>
Subject: Re: [PATCH v2 22/76] target/cris: Drop cris_alu_m_free_temps
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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
X-TUID: GlwUFnjQdtU5

On Mon, 27 Feb 2023 at 05:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c         | 23 -----------------------
>  target/cris/translate_v10.c.inc |  4 ----
>  2 files changed, 27 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
