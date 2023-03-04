Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2410468ejc;
        Sat, 4 Mar 2023 06:01:05 -0800 (PST)
X-Google-Smtp-Source: AK7set9urLLTnRrELngRpsTh88il6rILP+5A3ovC0CgBRcaP58ik8ju88FoQN6X6EY7zS2DAptQI
X-Received: by 2002:a05:6830:4393:b0:68b:c04d:79ca with SMTP id s19-20020a056830439300b0068bc04d79camr3224817otv.33.1677938465048;
        Sat, 04 Mar 2023 06:01:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677938465; cv=none;
        d=google.com; s=arc-20160816;
        b=UwMw4vwAOvleSX6ElUsjjC1PVn9WQe2VGkjvqUbClUZnDaNX6t6Uww2RerqYlZyumM
         wr80pX72jbYlmsfRGAyBXnftNCJrcB4QeKnlYmfKz61ViqdDeISF9Z5suGRF5fcNDLsG
         E1m2BRWDjSVpV5udUgRPdRpzNEGpB+bWpEFRgVRXQztLvBxa0fMI912tfoIGVS1G0y6I
         vtOfUfglimv9AJAoGn5CJcFIjCxLTJuu5GLAGj8QICuQ9XYZUxngfqTNYU8m4sov1C6u
         6qr4W3ONawzA44bAFUwyhMGij9fknmcC8pAEETdU6U3RhG8nJYtmrBRtri0vj5xLdAk/
         51OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NeiQphHlMzktu9vt0AmjRkGANH9Jn3FuteNn0G+SIuU=;
        b=qfpnajzNKOQR9elfyN+75Y82EDgUKL7lP4PiZFSSCj+g+AaisMryLXjXhh4JF9JIYj
         6PdutzU2jVENRGhyElpy/sAj7cA1Huv/wZj46pIcQvG5UYhTHKQdOjldSAf++81Jcob4
         3uG2JkuzTVFYA+v1x7p9Jl/v9JqbG0g4q3RXnfnRIePWxFylsdP2YwUHWTx58/aIfMtd
         9qvFExwDwmXNl7+XC6FLIjdtHRhdlZ6jC5thBViE5vifgXjmHkcdkTRGLrVEuIerRzMy
         4WqRbeylFaKV3+ivEtC/kZxVuz5v92AJM8JjtnscNfLZqDbryEFMRDhk5/kHnu771S/P
         DWlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y76eYiix;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19-20020a05620a121300b007423ca61537si3587424qkj.162.2023.03.04.06.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Mar 2023 06:01:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y76eYiix;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYSRO-0002Lo-C2; Sat, 04 Mar 2023 09:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYSR3-0001vK-Hi
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 09:00:37 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYSR0-0001iN-E8
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 09:00:27 -0500
Received: by mail-pg1-x52d.google.com with SMTP id s18so3056904pgq.1
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 06:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677938425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NeiQphHlMzktu9vt0AmjRkGANH9Jn3FuteNn0G+SIuU=;
 b=y76eYiixNVszC2oY/+uqIdX75MU3JbSe1wUqsfVJmof1O39Q7af9ZCz8bnenJDqqxf
 Ds39bfyHMnKbN3V44h8DHgwkAMV8d1HU7mssIaC3LLpSI0gLe8CdMzHMYeLkoPaYqOFf
 ts1X4f8D8tMMnTx8kMQKeXUynH7+jfPZyerNHom+Si9sHjoVMOPrJGp3ymqKmkNssdSs
 VsS4aSNlFBWfHN8aO0a/mAd0sVKkNRLseetNuNu23xa4OgquS0hzUbBBiknNaSRao5xn
 RaPc8Au+vaYHQu+8Y9vFPNKWCXpM0ziryXqFVjwKPYIsvJC33fTX8WoJL/q1s2AgYiJ0
 Zu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677938425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NeiQphHlMzktu9vt0AmjRkGANH9Jn3FuteNn0G+SIuU=;
 b=rt5NQ65zuiO2UN50fYxaYf8Y0cot4BRvdIgPCz9oWsjSVJ8E78ZDIMxvSCL1rrAUKx
 Uh3nSdajUfZjxr/F0dEBpgevqPgP+8YPOSjbZef1Rt+BdVuGpaC6R5NCw9mtsEnCCE0f
 vhBW+z98ttYqJ1s3ZuqdfPFtga7J6gptQvCGKzDpk3VKR8+lsCJwIhze2fjB+Ml1/ja5
 KkDf9y2rOxyiMzORW3OzPNCyiZLo/vRnD9sd9KBpkH8qKeD5bbBOBN1HSwJiOyNyRv4+
 Hh3bUqhDbCFBfkL2276DpTJ1VJGEgv/z2PPamUbWzP/oSwmBubSkNEbQQ6p4TJohQUrr
 RzcA==
X-Gm-Message-State: AO0yUKXvEDOJEqffxYSxRyQtsCDLAKxgDJAly0Rgp535i2+uujv+eBf2
 yilXqBUSPfJeMi0t8kjU22WQQ+RiNltbJH3dLt32Zrh7ynMaxtap
X-Received: by 2002:a63:f0a:0:b0:502:f5c8:a00c with SMTP id
 e10-20020a630f0a000000b00502f5c8a00cmr1560055pgl.9.1677938425060; Sat, 04 Mar
 2023 06:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20230302174206.2434673-1-clg@kaod.org>
In-Reply-To: <20230302174206.2434673-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Mar 2023 14:00:13 +0000
Message-ID: <CAFEAcA_htipnv3SC+DgSW+pHuTedw9RXtAW-TDFv8NZuxX3+JQ@mail.gmail.com>
Subject: Re: [PULL 00/11] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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
X-TUID: TSR/XeHWkzAc

On Thu, 2 Mar 2023 at 17:42, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit a2b5f8b8ab7b2c947823088103a40f0ff11fe0=
6b:
>
>   Merge tag 'pull-tcg-20230301' of https://gitlab.com/rth7680/qemu into s=
taging (2023-03-01 19:19:20 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20230302
>
> for you to fetch changes up to b22a2d409b1acfdf0d63d1bb3595194ceb3d94da:
>
>   aspeed/smc: Replace SysBus IRQs with GPIO lines (2023-03-02 13:57:50 +0=
100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * fix for the Aspeed I2C slave mode
> * a new I2C echo device from Klaus and its associated test in avocado.
> * initial SoC cleanups to allow the use of block devices instead of
>   drives on the command line.
> * new facebook machines and eeprom fixes for the Fuji
> * readline fix


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM
