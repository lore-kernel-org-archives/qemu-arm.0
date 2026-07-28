Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C05AC54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:11:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wohaG-0007LS-1h; Tue, 28 Jul 2026 09:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohaB-0007JE-7j
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:10:55 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woha8-00020p-TP
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:10:54 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-66892c81725so4352239d50.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785244252; cv=none;
 d=google.com; s=arc-20260327;
 b=DCWbSY/3NH863gFsP3DxVRpgnXdbImjV3gRFYvRuez0vyiArXNF3Lh0SDC+IYcrbqP
 L67bA5PhtF0w12iH42S+zFaPGf2uiAAQkgwjPXD8Z/kJiWyStKnsB5rJP/HyCZs4vFof
 L1dae3LtTgh72gWb4Ze+Hawe77gwNWgWYdZgPhE4m+7wO2RRQhor2gVwdO6cMTHK/TKp
 ABsoF232qahwmHABzhj/R2BVXEAfYaMFkAfOAUKLJeRHjlgVLZ5jiBAI4Nu/WvL314Yv
 UHMtPWkanunBDn783GgyUOpevGHM7g+ExOp0/GABv3okyCiww0MHieCbu56/V7NyYEIe
 pumw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5b5PkYlWFhkF9HA7hvxT8BueeiqPXo1SsxoJJJy4exw=;
 fh=F8ZKBEPyBTMoY246N3Fz3CnlqsxA6DUyNl0zuWbvjwU=;
 b=PPyjE9DaAAr9aZDB4+8bLwdTvN3M2aVMIrSnN+IrsqcE6v01yNofDqNRMhoiITEEiO
 WoryxQdV//0boBbhK1lIZ3cb1JvLqGondlM7NhxwIMJ+DGEq+8da+PV8dfcDehEXIJHk
 ceDI6t7r712+CflCFO3VuEMsIVRXpEgE3IyiRUkkIzokT2kOwi0l2kAjfHAFG27jEE8U
 QiJCqFVi9MTO6HA5fphSj2aKZoqxzUMdP6v8vp3+VTyXcoMwoVYHFOP13Yner9owzTde
 ILzZKb05y/Tp+Ux3B+p6mvB7aaX5zZw6AjFs83aw6AAi3+fcqpz1fZDqP1maHYmijMxl
 fr5Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785244252; x=1785849052; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5b5PkYlWFhkF9HA7hvxT8BueeiqPXo1SsxoJJJy4exw=;
 b=oi6U6Is6w7UZskMXOMsUltKgD72jws5FU6WLPbADa9wDF+kpfy0ZwnDt6D4nPTXMII
 HTznwH2JF7PvPpK2vJ+Njp2eIgGhOaL6VZuwxjJpovX8s+vAIJY7L15Ec/w2okeH0INW
 fgWpBwpSxXa774/3sS/15C8UUdtgh/Uii09ShkHQhW8YjiZWna4pw/yKubOTuJAI4nZQ
 vweUESt/j/Ii2raQ0OGl3xm2bEUaTzXZRy0Yd2HjAJa9zOKm4m0Ru8N1pidear3zVQME
 UYPD2jwZyI+fSdTkZU/L0BvR5ITAdcZHoTi2ZMO0aJ3Y79hkjuI0DI4rQin92xOIsl1M
 lJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785244252; x=1785849052;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5b5PkYlWFhkF9HA7hvxT8BueeiqPXo1SsxoJJJy4exw=;
 b=gJ2xGuCQp1JcsJUdOzMjf8cxM/o5+1UWLxlCcTP6S3PO0oRmnKPoXJH4rBHF9ubB/q
 aSkdQ60ZmjUleFXLcavIkflDAtW3kCFMP8+Rj06pzsdT6r3avqQw6peoGVQx1qgWdidG
 NzOFbFzZblfEw7ctmaA86sAcHiVLhh7cv17ethvMQIfsjon6u+T7o4q7Jd92CQ8VyrlR
 q2mFO60WSRDLPFHHQBqNx3te1B1IUIo2QT31l2Abd92m02WZ7GFyXjtkg47cA34usDEw
 +QCnefTXK1VMoRGKuNBfdehUdVH/hcauHKmtmVD9dF4Srp5EjAohv50T+J40Q/606XO3
 ZS+Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqd1EA5kmNYOjNwQu6hTlE9/eV1wok47N2slMNxlmwMxYdsL4TZMnzAAPkAl7oDkNd/M0NNUcIu7Q==@nongnu.org
X-Gm-Message-State: AOJu0YzNW6plR68yfapgVkKFhMiPLoy2DO1cq+rigeXYP+ksXHiSNFde
 otPRrFYCD8hfFy7wiIQ2AlAyUBeAtZ6uHVLj+Cmd+9WraXzVm74/JgXyL0RN0snGpf7zTtPGwJy
 QsOeLkfafMebHGAjoYkAxmsOQRI9zZtpVbo5qu/akFC/ZkNGcuVDeFXM=
X-Gm-Gg: AR+sD13ynwjOrpSKYfvRTzIhyMyENT6wCzXcjse74aolmRCA3DZ18YKoK4z1pYLOgTO
 uLtpOqs8FPb8QYUag74uxCiPU5CdzJD0CVKiluNuvUBw4eJ/1C/k3DOhf0S0ZuSltC5cLHFoE/o
 K1M/n0yh7g6FchnyRONM4Js21ynUKBNDdch0leku43OHbRJXG46O5eaJxcsDVeg0f33uQ9jmlPr
 KzLra+Qj5VqrNAoBA255gRWkvifHrUKKHhH9EqETs+Zs2hD5sW7DRVwXjAMDkcALGf7MED2Vyiz
 ZuVbZt8hCIwmU2Y0gb/ZRk4tMXxU6UK5fJV3ADBq0hct9Q==
X-Received: by 2002:a05:690e:4005:b0:667:91ba:9bdc with SMTP id
 956f58d0204a3-6690545d1b7mr999478d50.11.1785244251630; Tue, 28 Jul 2026
 06:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260713230244.70174-1-richard.henderson@linaro.org>
 <20260713230244.70174-2-richard.henderson@linaro.org>
In-Reply-To: <20260713230244.70174-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:10:39 +0100
X-Gm-Features: AUfX_mzel0WsdEsnhTkAXYMtatvaxAyUyyQDinPC2WGG1PLaOtDkiPlvcxiDxKM
Message-ID: <CAFEAcA9DCByPPCL6fSnuMYmpBALNJaktyEB8ywAU2BU39GnaNA@mail.gmail.com>
Subject: Re: [PATCH 01/10] target/arm: Implement FTMOPA (non-widening, FP32)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Tue, 14 Jul 2026 at 00:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> +static void sme_tmop(void *vza, void *vzn, void *vzm, uint64_t *zk,
> +                     void *fn_opaque, uint32_t desc, MemOp esz,
> +                     void (*fn)(void *, void *, void *, void *))
> +{
> +    intptr_t oprsz = simd_maxsz(desc);
> +    intptr_t index = simd_data(desc);
> +    intptr_t esize = 1 << esz;
> +    intptr_t host_adj = HOST_BIG_ENDIAN ? 8 - esize : 0;
> +    /* Base in bits for op3[index*:csize], csize = (VL * 2) / esize. */
> +    intptr_t ctrl_base = index * oprsz * 2;
> +    /* Create a zero for use with the largest esz. */
> +    uint32_t zero = 0;
> +
> +    for (intptr_t row = 0; row < oprsz; row += esize) {
> +        void *vza_row = vza + tile_vslice_offset(row);
> +
> +        for (intptr_t col = 0; col < oprsz; col += esize) {
> +            void *e2 = vzm + (col ^ host_adj);
> +            void *e3 = vza_row + (col ^ host_adj);

Having just read patch 4, is it possible to do this with the H
macros rather than a manual host_adj, as we do in
sme_tmop_2way_sh() there ?

-- PMM

