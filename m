Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1389024ejc;
        Fri, 3 Mar 2023 10:27:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8LOOWlMtUOIyItEnNfsY37IXuhO4ImUBGeCV3bXS623dbvZNvvxBDi4XcMprQHj5fUGFEp
X-Received: by 2002:ad4:5f4d:0:b0:56f:5466:20dc with SMTP id p13-20020ad45f4d000000b0056f546620dcmr4715599qvg.4.1677868074896;
        Fri, 03 Mar 2023 10:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677868074; cv=none;
        d=google.com; s=arc-20160816;
        b=D9spEwIY5SkesxyOBo+3ZIcs12trWVo2wVT4H/t9IO27Www4k99K+9RvysyUIWIV2Q
         KplWFie9iNmXRw2NfV6W2LlKAZGcmUVcE/f1XMw4IPtuLXPVqDeIbGPW8vgzgmVZ5Qtd
         lFOWV54Ochh1zmnL+aclQWvuM2vNgSN/nEV5m2dcQxIpD54d8sS4SaCt89Rlhgp+RY+f
         UCjsCDQjmSGt3vx1yg5HmFibHs8kLkMb/nS2KItCl0BoTTD5Gu6q54QeQMMWPrQqhEVa
         obX5TdMWNtXrYbLJokKMAVqTcukjiRBwA36d1mBwCc6iS8YsFTv+FJuATwkN1jGXWo2J
         cg8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SYiORfyMnSoUeeRM3KxybcI4Ibql1AoH9JkfMTnixtM=;
        b=KSwB3Su3GFffbtMfObvjvFKVDcF6an1nQTJzLV5Z1zX4ycoclslWEOSdywUnY31qNP
         N/zClqpj2M/0u4N9HeCWBJQe98+rFfH39yupCpXOs4weNLUkL4PtK6i9VPyWwwCIyMGP
         gvb0IsmxHlq25gbCoeUOggCi7FC1HZieFG0x/XgOhUTd46ehk7TeXV34Ci3ACq5ECX+1
         IimzeR3h2sSapmIbH6lrSkecCxBkp6hKJUxW3j2+4504RzLDbPAzfJS9mxzvm4ZEoGw7
         tpfaanyU91Z/G9+5WfLfu2/cQ9pu+mndi16xE9AABo33+rQPiVXvSfIcDVNnzrGERceJ
         QPeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RMLZfIOu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13-20020a0cf30d000000b00571a3b77862si1978707qvl.238.2023.03.03.10.27.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:27:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RMLZfIOu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYA82-0000L2-7B; Fri, 03 Mar 2023 13:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA7y-0000Dz-Vb
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:27:34 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA7w-00035C-82
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:27:34 -0500
Received: by mail-pl1-x62c.google.com with SMTP id a2so3661729plm.4
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SYiORfyMnSoUeeRM3KxybcI4Ibql1AoH9JkfMTnixtM=;
 b=RMLZfIOuZ1DTH/QlVJN1jKsa4ib8Pi8ggm6+JCOgl2vth4Nk22fFfBvmuEpE60Qtk+
 sPFLHL5HP7ERF+JziONTngm4VEr5yPCuQz1P9XVjuXxaFuiXnScN/+gkdYRpA39FdTcA
 4YMevUP5HKRjf14J66WVCof2hlPxbnl+9Xp21WnK6P+f2GXPl+KX5F+xw+bG3ua92usd
 ppBaRMCVB5RiIUO2y8xUhLYyEj0pMWEV9scBRwhGy8UY8QXC7j74Eb0lvPrfedGQu7j3
 FHZK8hsU9IA7jxpzAIwQkn165/N6HvW5kv5wXF6wRho4nsBX/BD2qiXl5udQs+dqblib
 Glpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SYiORfyMnSoUeeRM3KxybcI4Ibql1AoH9JkfMTnixtM=;
 b=ETPuZQPM83lYdh8zp+GVTgbDF2o0Oe6H3ecHYIOSXMjjtcZxnJL/JrLDmtrPXhrhEj
 Wuz2HYtatSC61O+zg0LDWU67Igtvmqh0LwzRPbnFpikvXZbYwlx2cfxsJ2P9lxyEeY4i
 0KUZKcciudJocbMVtt8f3LdpxQ2c0AVsFLwTP85/HOLP0G8foTA+I4HbK5k7yWdBAfhZ
 8Yd7VB4RBnw1RVudi/b05FBpi+a4OzDSe+gLfSW8lEfM61IrbxTpC5XWG+hzh9KZgG4D
 RKZ75SY5brdKZd5Bf2EUSSGBzTJ6Ht+HPvGCrRP79NKuXOsYVE6crpLU8g9TGCz4YF+W
 nABA==
X-Gm-Message-State: AO0yUKXIiF8xGPFjJIccIYbAy4cq7WxJUazXVMCbEp9h73RZ8Gz6V14e
 gu4uWxcPf816QhtQN9RrtLGRkiX+d2Afhiqzh8rDFA==
X-Received: by 2002:a17:903:1243:b0:19a:b151:eb83 with SMTP id
 u3-20020a170903124300b0019ab151eb83mr1030807plh.13.1677868049626; Fri, 03 Mar
 2023 10:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-17-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:27:18 +0000
Message-ID: <CAFEAcA9JuQJWHuAYVhgn4jpfMKPtSYAh1iuZ4QemkfzEcCycvg@mail.gmail.com>
Subject: Re: [PATCH v2 16/76] target/arm: Drop tcg_temp_free from
 translator-vfp.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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
X-TUID: 7Kn48A5HxVXe

On Mon, 27 Feb 2023 at 05:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-vfp.c | 193 -------------------------------------
>  1 file changed, 193 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
