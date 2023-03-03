Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1415244ejc;
        Fri, 3 Mar 2023 10:54:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8tbepr7nCzLxtPchsYQCrQ7Rd6966xrfsKs067V+r0Rqo/IRNv8a09/jYygD7RUGM5IPDe
X-Received: by 2002:ad4:4eae:0:b0:56e:a96b:a3a1 with SMTP id ed14-20020ad44eae000000b0056ea96ba3a1mr4556634qvb.7.1677869696802;
        Fri, 03 Mar 2023 10:54:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869696; cv=none;
        d=google.com; s=arc-20160816;
        b=wW5MGshJKH8HMj7GFTZMaN76X11fmIsTDZP0YypC8u+cFIW1eFPSaH03ZvElV6Zhpi
         Wvv4qL2aZ63mgjuRpyFF57svInfBu/XtzcuXYJ/1u5c+AyTTjWw5BL+r99uEcOA2A5+m
         FKUINMHNWrNueHRLKRnLxtBvd4EJvj+rkRJvxWdFc+M2/QbVG3yRxO79o3VUrGe/Jz7/
         MnJaSBUt8lAVgoGGfdxs+zXTNejZnR+lkVzEiizUmuHeRK7AI6P7i0HrHOb805+2a3qV
         SVfnp8VVKRMmBpdwspKPoyc6uQQWeh4at4Poe8rF12sJS11q16lU+A/HbgGK7aAPgbuU
         Tb+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nR5qUU2uzOcQjboaKHrmMc87Xgswj3droDWrcIFZcLQ=;
        b=LiY9u89U/cVebeFFH550ERy8H/7FIbU7UeeUu4xHl/7MFiKcm1CYW9wllY6NXJuNRI
         DmZcZGESZrzBttKOSIZ2wY01ov5CLbklxWohL8jaguzGSW7leK9yUtUduYxREe5OL3XP
         SsULYzHbKvlSS4mAHlbg2ACFwr91GllXhFS6ykLQgwajp1l2O5+Vvbnnymhr2eXxNYuS
         61oOBXRjzXnhWr3D39jk0PcF41nO0uVMPssfyjAr5kMmT1Sbk/hpNAL/f+is0XZGj6bo
         IDDN8LBOygBsp9Q8UlX+5pn8R09Vfh2Of11Ukz46SZvH4wyCzXN6a4dGX4SgahVk0fQb
         TSJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCXHocHv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a05620a408100b00742ed8c3d9bsi2429999qko.669.2023.03.03.10.54.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:54:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCXHocHv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAY7-0006Cg-FX; Fri, 03 Mar 2023 13:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAY6-00067e-Ef
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:54:34 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAY4-0003Mt-Rl
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:54:34 -0500
Received: by mail-pf1-x433.google.com with SMTP id n5so2177073pfv.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869671;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nR5qUU2uzOcQjboaKHrmMc87Xgswj3droDWrcIFZcLQ=;
 b=gCXHocHvtD2W0pHwKgjnQ0NpANcnGAuW6HH12jYUq//A/Vgs9l7xRybMYzuROJvQfl
 J9PwLF2sVQMAxVkFX9jRXTBa8hbVwWwRp2SfNgI7H/Gt1sMXN/xlPjmoZJEjLp7oF4z3
 KIba6JD25fHKVVKaXNs7WQONfgeBnwjSYsY/SdY+xFeYgNAC50PZ4o0aZvuT5ClD+FdW
 Nla74RAmJHNff9vSZDaTf3D0LNDe/YP1zvGeO3kuRWCsTCGPdnBDoAXdhTF7SEHxryLH
 Wmk7l/zWqs+63pUfZ0ZirE0guUJxTFunwn/vzrxHyhbt2463c8VtbcrkD+e9cOEoP/ke
 LPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869671;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nR5qUU2uzOcQjboaKHrmMc87Xgswj3droDWrcIFZcLQ=;
 b=voO24YoC1UOwyPRBD/VyV2To17kKXFbWhEqsjc++8VtzmfYOnGhh3iOqjGB947HWFw
 rv1iKFVbwgK0GonU/sibMeu/XaYDv2KGYDUMQ7ycRp0zEZOFS5828KOXMj+EKpA76Kbh
 zvafgdeYMKzqmvXsDIEc6SnHauTF1Ws8BuQzOAzauEbZesfCfYsuERqQ4wDIoTbyPfsp
 kWSwRfpVwm9IViBFxhTKVOM/Sa63B0Rryira3vp8HhKH5P1N0rivtOQOo2OafDxvz/UJ
 QZTpb0TdRxZmPXGSnGTWfkTwLV17fWjFX+zTNi037JtpSNLRBiCpAfFQcbF3kVgj0Xuy
 p5Cw==
X-Gm-Message-State: AO0yUKWJT+yJgGI+g95MI9aWl6kvTUF4i8EAZ5ovGq5A/9JlBoMA8Sdx
 q/M0Y/Drh7SklLqDRrQpQf5tPSSRuSvG/wlATw28rQ==
X-Received: by 2002:a62:cd83:0:b0:5e5:7675:88e3 with SMTP id
 o125-20020a62cd83000000b005e5767588e3mr1331443pfg.5.1677869671455; Fri, 03
 Mar 2023 10:54:31 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-30-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:54:20 +0000
Message-ID: <CAFEAcA9n=FGkgxXfNPmP_GfsKt6MqNNHuVwMFwRhTuojsGSdBg@mail.gmail.com>
Subject: Re: [PATCH v2 29/76] target/hppa: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
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
X-TUID: Nf9oXfiJxeWp

On Mon, 27 Feb 2023 at 05:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
