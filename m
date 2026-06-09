Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F1CCD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:22:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWzDA-0002wL-MU; Tue, 09 Jun 2026 12:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzD5-0002vR-EI
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:21:52 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzD3-0003ZW-Ru
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:21:51 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-bef47b1ac01so868622566b.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:21:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781022108; cv=none;
 d=google.com; s=arc-20240605;
 b=KKr94UPqn1Dd0s2oE6grc7434Bop9Vh/hzCnWScnFIpOBMozF9GI5Rlwn/sOwX5UMB
 tv73j2UzmFgkGLoNC3mchPpTd6c5ckj+EhYCHF9+wcjprVwYzZLe3r74rmfKuK1aMHX8
 UpweWNqTpNcd6fDEm9uH+g5GEgQZsF8dEF68aT1zwLStclzNOyTdoYmzTPrpA4HrYhws
 enY3H5LeJ6nGe1TwYE4jOw5bMttWFELzFdoeXtmQpnEBK565qM23X9QeKOVIoGD9fiUU
 85925MR+ot9hscFo3LPnGZ85++jMBP42+LcCb++cQko7k1U/4Ps4x1suf1oS2brT59wv
 u3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=lJi0FUC+Wq3lY78M8l1ne60ubU4FPuJz6C4Y3c4UpzQ=;
 fh=eBZbqoRJNGcwafajNwJQ8U0ArXTHFZluI4StVXgsOH0=;
 b=IucJFJVMkpmDjMrkgK+ltPoHYl2+L/b8ZJ6xNnKbI15LKX3XVRQt1r+lYt69vWMNBI
 62BDItYZ2keM+qnNSWZC078mmcjdYSogEuCEo/x0bNor0N2qEIg78hs8gwdeF66CZLAm
 ofPE9fUEm04rxxLW/jrzXvgzuqPP/xHlMQmVpEs2++VqrF22kjw3teOM+iQ0hC+JCzOu
 LcVl7iDXwqsBxTrfk/5YQGXMQFEhTEl/W/XnuDdfH62+j0Urx2yRbywu5XgGRJHO7H6q
 oBxKzVVY00bxRuNuXaX6D7y5PqSRAutK3bSFtV1f6wGoy7h30Vz33OQ8ZwQVZu7ijS6m
 03WQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781022108; x=1781626908; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lJi0FUC+Wq3lY78M8l1ne60ubU4FPuJz6C4Y3c4UpzQ=;
 b=nedwTOsx8EjOYbfeIFj+AaqWAx5ZseG228LfleZlieGDWavUc7LlfTqOo8sGcMzJql
 hHT6Hg8+K5qpwoNLzD9z9epYPLTeDwUh4o/k7UU4CAiyuIhzA9dPerYw8DdU3D/CkdXN
 EEdN6J3X5EcWN8aLh2FwsFF0wta2j26jNHBxNCGFKv+lU9sOlbzcU2F19u4mayD7gKcg
 5du+70vA3cdKCnqmB0+BOz9GwViuy8ySkE5k4jwOeAPkRW5PthwDsJpbtq3ELgX8aqh5
 O12jRW2Zl2T/oBIMHFrqJ/JyFkAQeP/IQla+NafQdG76GAfIjS6A4NkBfFVFWt94l9VM
 5WUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781022108; x=1781626908;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJi0FUC+Wq3lY78M8l1ne60ubU4FPuJz6C4Y3c4UpzQ=;
 b=EqsyuIxwg6esCceChRHu/4wr65ammVww+OgNk6z+nDm9SVgyQ89rp57JRENFV4pM9Z
 aX80DDl9dVC83umbEGqSAbWIBOLUfPrK8peexBx1F76DlO8ulA+Sjj5anbE74JlO/MXZ
 tnGkmnqoE8DE6RylGddEQHjIU2vt6flxDnj/D36omaeGCM2Zz9iQaWB6xOooDViSzyue
 WwF4SvdmaBvSOdpsaNoQWqKtfHw4fQiaSqACYmH0LNGXfAdLuAF8M5eXc5QZjC+1nonj
 CIJup6FouimBm1OWP3Y+duuugdTY5qNpglZ3iykuNVIvFN4kdeJx3LhAJLlAghctISd5
 gqjQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/MLG4ORg254AQBDNHektCYwyv8YEJH/MFrjsuds76StibbgF2IU18VhGXRkfDhOH53lo2pJih5AQ==@nongnu.org
X-Gm-Message-State: AOJu0Yww402sXe0jufi5wdJe8/9cTFuN7u869nkiTtYSwHgE3LjNAf8v
 +NUyCElARQRo2NBh17kPk5Ej9YrsVYFxna+g6fIdXpfh+I0LjSJ2U1JIyeuq7NY4t2rsGSy+pHM
 PSyEv2pQtMs0P8m7fTfxQqgj1RIRCE6cjFiWIq07BbQ==
X-Gm-Gg: Acq92OFeGAfoG/pptKMxkcL0YK0Nf11GwWEvP9IQX6LxCmQCx8Lz4x59dqlJXcuMCPX
 mzZMXiylh9Bq3GcMVNRS7ePx7ybz7xWdBtnAAnJL5QZ4pbpidSPM6BY1ZELrNoDjHrzN7+2ETOF
 IEcyPKfR9WY87AI3iBRFK9xvFwPfLEGg8i2SsbJvvvY3lz9qp2g2rBfN6n/AqZsxjc5prp/pVEz
 CoDzR5MdLGo/etONem/RbBeBbHsx/22TgyUFCCU13hn3eZWYSM6TP3zMrZf257V7rb614Q1nonp
 PhPPmLQ5R6HxkRCHeOBcrOw+41cF4KNIFzso28qysryd55EtSf8EQf0eBpqSeAtKvSCVuJqDGG7
 sng==
X-Received: by 2002:a17:907:7f89:b0:bec:7ab2:9128 with SMTP id
 a640c23a62f3a-bf36fd9c7f4mr990913066b.8.1781022107985; Tue, 09 Jun 2026
 09:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-41-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:21:34 +0100
X-Gm-Features: AVVi8Cd9ICfMsVIQhNBvhheiNHE6s2vD8rOTn_LtJvW5QBhLwkh9SeHRU4HBwcw
Message-ID: <CAFEAcA_XyWLi5UWwkJYtxFbdB9mySUwz1UwgNad3Kxt=4BXxxQ@mail.gmail.com>
Subject: Re: [PATCH v9 40/45] target/arm: Implement FMMLA (FP8 to FP32) for
 AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Wed, 3 Jun 2026 at 04:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |  5 +++++
>  target/arm/tcg/helper-fp8-defs.h |  2 ++
>  target/arm/tcg/fp8_helper.c      | 25 +++++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c   |  1 +
>  target/arm/tcg/a64.decode        |  2 ++
>  5 files changed, 35 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

