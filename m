Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp896759eji;
        Mon, 18 Dec 2023 08:05:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOTNj9b2BQVTktq54lFhh24GnQE60PrW3emJ/2MrYp+Ju4uFnZk0j4QDCWX1+lb9mBh69U
X-Received: by 2002:a05:6214:4012:b0:67f:4632:5dbd with SMTP id kd18-20020a056214401200b0067f46325dbdmr2279568qvb.54.1702915529822;
        Mon, 18 Dec 2023 08:05:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702915529; cv=none;
        d=google.com; s=arc-20160816;
        b=g0ubBHU7wsi+F+G7YjDwppiBVrLi+SUXHnMJa+3/7W+mMPTegYzk/0dMHNmlG0d1Vj
         O+7wQzIBU4jykrffsLzapPZd7wETo0pPxnYlnFpov/R+1S40SyKpi1V/lPD2wMxikQhR
         ULKynhLW0w5qtD0xeLtkQvmdQB35Kee8a48cFjemLALw8FYZQGaXEfAwMplb0WQ3uffk
         uQHl5QTckiqltzy02NY9ECrVwk/0Fq1+ElJUuOf7qn7A87HtPp1Hljm5nMnK33DGTSzd
         nGXjZXLGu8jIBrg61lJjgP08cmbNK7iA2foA1wRQfuS7MqMm+0o2NyhmF/UNvfc27N5N
         U0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=U5OLSCZC9BIXS1cN1J6VaYoFXDpHlpu+zG2y2DGsV7E=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=vStt60bHotddXqAaWQK9jFDD7wSGA3rNIE0UYWepPPn9b1jOFVgj8lX1rXem3LHfZz
         a8BqfkTVj0HEbSlfdUtCtHwz5TDwkIfKJ/2wi/1p6lWOA3scfLlR1m1VEz6UkgpEU1ba
         TFPmxK8dwhytABiT9kyfGoFik6qUC0FxXfCawLx+UWlB03OBrxLDj7oXru9wOZbjrR7s
         TaldNhC0NuaRsi5GXqy+sEluuq2DBimw5ODRZRywRAZMYPmKrJhxUuHrih9PEPkmmiuR
         c+Kv0hRGLfOquNeISDu3ae9XjlrQanymVYvGCkLQAnhgRWXhxoFHU/N4DLMMp6jDUToj
         I4wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lhs+SU7P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x25-20020a0cb219000000b0067f1a7134desi7457019qvd.184.2023.12.18.08.05.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 08:05:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lhs+SU7P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFG6n-0006zr-4u; Mon, 18 Dec 2023 11:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFG6g-0006yH-VU
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 11:04:39 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFG6e-0002hD-RD
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 11:04:38 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a2335d81693so336332066b.0
 for <qemu-devel@nongnu.org>; Mon, 18 Dec 2023 08:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702915472; x=1703520272; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U5OLSCZC9BIXS1cN1J6VaYoFXDpHlpu+zG2y2DGsV7E=;
 b=lhs+SU7PMb5kH0AGahZwErP7M3xwzeJlJGM+pImEC3eaky+E1B7rH3TR8vvCyFRxRI
 eE3etYxHfu7OeD4MoSCY5UfI/RQpSBU7suKifFQkskPVHCgAhCwvoX/Hl4qP7sRiRt93
 1MkBRHalfuWbfImOPXAE0fQWQkvOqzfljKCqWp97IKScAnc+1mgx5VI8jvaiAhFSUFx6
 rNt44Lq6ULJjgmrbBFuE4dWMOSjof96jA232H6x6sMNVIM7wJONsMypYZsBbD3iJLZ8H
 CVaXbgJcib7ceIHJOP+PoOlcJipqSKJbNEuMG1oAk2rAJJSiZ3Mj+wFSdkHX4Z4dLMXl
 iNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702915472; x=1703520272;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U5OLSCZC9BIXS1cN1J6VaYoFXDpHlpu+zG2y2DGsV7E=;
 b=OfbwqhUy0wT6VHewS/4qlAVLzic0Rg3cmjrCpe6gVxkYkv9xQMnRWyuRciTU0Ols1b
 0qmXnzFEmph4vdAAP19H3QYTplRgSrsIFhRYdxydvpErZ/i0UFxb62Gj5VqAAUvvsflr
 eD7k0uN2jmqsmafGr73v1FEvnODaekBWm3dfgjMMHWfbqjx8lu/DMLIq4vH+lnETxSGU
 RZyQ0/e5sScEAqJ51Lf1gUfrI5qsigYUeLiClLuci4N9LSXbLRhiX69K3Nt+l0TBJRxx
 rnaEOci2hLoXUuLPNeIRCO1uKCvM3sLnSwz+7Tm/sFY+nFBtA7S4fTQLXOqh79p55sVb
 JtUg==
X-Gm-Message-State: AOJu0YwJmDB+t68FAUO5kyKvGcWRRR3rc460HHnlqWc0f2KmcrnYOzOm
 hMuShkle0BEFpD/RCiikc7lvITW4vx8a9uove/ZP7ESg7nGRSbsS
X-Received: by 2002:a50:baea:0:b0:54c:bb9c:4b88 with SMTP id
 x97-20020a50baea000000b0054cbb9c4b88mr16948661ede.5.1702915126589; Mon, 18
 Dec 2023 07:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-3-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-3-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 15:58:35 +0000
Message-ID: <CAFEAcA-JRM--on+r5iuyC1eBGC=2=qb7x7htUT6A5Cuzs7V58w@mail.gmail.com>
Subject: Re: [PATCH v4 02/45] Split out common part of peripherals
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: UFIpzvQGgRdF

On Fri, 8 Dec 2023 at 02:40, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Pre-setup for BCM2838 introduction
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
