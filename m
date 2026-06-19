Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B948CD4F26
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:46:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waZYS-0002q5-3S; Fri, 19 Jun 2026 09:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZYQ-0002ow-D4
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:46:42 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waZYO-00017K-OA
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:46:41 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-662e7fed068so1077141d50.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781876799; cv=none;
 d=google.com; s=arc-20240605;
 b=VQbcQKLO0pWJzgI+yjpXiJ7oxf9EcL9kpYokOuLWphgu1ULNG5QUBDyNeyzyfOJZOG
 fe7+iPtliA1sC21rz30I63RopFryL9PBJwPr3rrQWfFPOBv6umOqcp416fJRf8MGGqDs
 iyul3rVwWudybB75oOc0TWZXd4BU9ValdrzEJxhDzugeRe1W27kt700yO06GnYtpYaxH
 YBcwwhWX/QmpsYN+hklfLq9Zt1p495tZ9FCoZ4ySfrkTR5zOyQRJYr+6JRaMt2TjyjZR
 SK8HWOOAJrUi+rvnvD7huoMChXXhG10BpvwuOa4iVE7PTKt6WIwvNiFKpkIoeUZdrG1f
 ZSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=o70uc1PPgHqF8LTvbKiopBY04kSIrgeY4U7KWcDSt/0=;
 fh=mw8f2Oaq9+Id+H4xTdpCOZbLOTvaWuw4uhfhmlDmCAg=;
 b=KzIRfSfgeTOwVBGZ7hw3gZHWwLWIzivKepwGZVO1vPG2Wmm0W6jjghEAl/CIsjJycI
 oKeh+m9FRhuJYLrvi/DE2Y1PlBDTYRG9FslZjj+GtX60vzIPS1OlArft19esdvScVuxP
 qWLRnfLszqGtqYnXG9UpxJAOifgil3bZWDRPrRj/PU/FywQqac3vhbNUtmp91wAclxKw
 NTdQij8XB68FLzcOdJWbC1TpEzz0oCd04TbN8FbHHSPdi0h3MMLIS3Qj2ARB+BDqAbFp
 ROxOt2uGbjVjgEL2bz7hEcpGKHAHOHWOJvd47Cc15QALtik0k55kT3Jk6Me3PG9rbKRr
 q6Cg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781876799; x=1782481599; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o70uc1PPgHqF8LTvbKiopBY04kSIrgeY4U7KWcDSt/0=;
 b=VoaRV6iNv2Ozw0Jk3x2PHmy7X0ar2WfrsGESXihR6acyOFrM2ddyH4IT/jf9A9lSr5
 RmCQranQswDRT/Il/fX1Ojiple0oTbhV1hP70+z+2xAaaCD376Gw+dGe0KdpBj9pT8BG
 NluA0a68QkfkeVl96/oa7byPwQI3OMsJ+q0JzLGLOZmbDFIMT2qD+8r1QjOuvgyEjD1g
 SsoEveBuKojjbF5sjpv6mPMA/VxQMX0wFzCY5eXMqXgGgnD8+fIoYNeRN+imAa4jkExS
 /+E83z3oP3dTbcZz/IeU0lJ5JJFz+1lN6MyVeG9Nr2rYPqQAXE3dCF0r7NdBG5qvngaA
 cikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781876799; x=1782481599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o70uc1PPgHqF8LTvbKiopBY04kSIrgeY4U7KWcDSt/0=;
 b=VDCxZjNlYm0GDuKTvuCKHBQAH4GgvqAYbjYkX3pEiQO9uYKz6n3Qx6AJkBhrVW+p5o
 cFTaeM4Jf0O+cOJTELbKVSgPfBC+Khvr9Ht0c7f5+GMf9wb+47AcptniYU1i1B8+M5IU
 ml/CuSyidcvRRUxb/xIAYIH/qjYLvIZ2MAwN8FOJzGqM9BugjQzJKcZSOZr+HF+ubS40
 aQd3l2kFXNi/XhEUK3Vd/FuZEeiyg+UHASOq4Hs4uC9gWJ1QqjSzhcCT/Le3wghhbp9D
 0kyetmeBWmcwjv2c5UFbmEYBITec38JwvmSE7T5meviGV4Wu1nv2mFZtz0vk43xmGXse
 RYLA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+FAaF4bPtJhkTxd/Z8lMVof8Ipk012J24TLRHJphlrX0tx1NUt+aapJ+B3tqMc/VKCxGj3SZ3G5A==@nongnu.org
X-Gm-Message-State: AOJu0Yy7MaULjQCfpbG/kCo0RXoyBZyKvZKa64ZehSA+S3xDJMb6JudV
 carUjGpkaEtytCibHKjee/baycOp3FApHXjox24+LWAQ0UshLAgiOTPZpgDcq+vDFclwgadzOxZ
 dj8pgyNiEhVdswGvnR4JSVcmCn/+q6StM+N61WhUCQQ==
X-Gm-Gg: AfdE7cnykrlSNJKtB2wAr0jHwm6Uh9wCDiReXDANfVHtzx8YwY36pm2HT7A8THt/z37
 ORodalPsj2IOCimDJ6xCIMKrkT6OrBsI++GmVGcIX5OTYRB6PSKCwJG9u+JdmhY0GFeEshylpsI
 5DE2730XW5s50H4B4BLo0fIkJU17iQ2nAqPYXfsJSmpUjP2tWSbFntulXQNesG62E9mZVqTCby+
 1ScbI7n8MiR4+ipriwW38rsA7ymhCRp7VfcATAvddfsi7SfoahVyAbGxAzS+vOaZ1SStEEyw+u6
 k9JxhXITQ9fSrQ1HIsBotqMq9xRNNzrLKQ3b4o/P6UsyYjtDj5B359XU
X-Received: by 2002:a05:690e:d0d:b0:662:eb42:dc36 with SMTP id
 956f58d0204a3-663036e75aamr2126382d50.53.1781876799407; Fri, 19 Jun 2026
 06:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260618041517.573469-1-richard.henderson@linaro.org>
 <20260618041517.573469-8-richard.henderson@linaro.org>
In-Reply-To: <20260618041517.573469-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:46:27 +0100
X-Gm-Features: AVVi8CeRIdzoIUGdYkpEFGp4YzSJ1LMfs2GO7XmRREMsyj7X2XL2ZfJBN93F1tA
Message-ID: <CAFEAcA9mrB8a+ochgYeKOPdo2kdccGFSB2wiBuCxSso6P=TB2A@mail.gmail.com>
Subject: Re: [PATCH 07/10] target/arm: Implement FDOT (multiple vector)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Thu, 18 Jun 2026 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c | 1 +
>  target/arm/tcg/sme.decode      | 3 +++
>  2 files changed, 4 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

