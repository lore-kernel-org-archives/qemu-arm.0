Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB64C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:24:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojeX-0000xH-T5; Tue, 28 Jul 2026 11:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woje9-0000aP-BC
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:23:14 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woje7-0000Km-Ti
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:23:09 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c197f968b3cso572828866b.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:23:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252186; cv=none;
 d=google.com; s=arc-20260327;
 b=YLeqaXM0ZU8YA5IJbWjasqxd+EdjBKnAejeayKDPUC+W6LGsFJGeXzBRegWtv7EeoG
 UB579uyUfPtYkcufg0oKwoUfIEH07rutoiP4pXBxBtYMkYv2elkiXwZOLRqhIgHv9lu0
 VWXtSVWI/6FzmCxWV6Do11Gz9I7ESIEELEFldKiMrmCml5eFp/8vCSQp1ahk0Z3+MMcq
 j5QrnOK2jI/Pqf4qMyQwhE83NkKX3FhZyUosL++BpkE1cIu8UjeyoHr/zS0sDNVvafKA
 ephw7edRwEcsOPCpfTmuVAteyMDYYoLQV6NFAtn9GgB/qWskuaedihaHXYlgF6AtHqt5
 ThFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6tpV9v/Kg119xk54JR97ciqjzzxdkwIqP4iGztEVIJI=;
 fh=nwiKGnptv2kTbiqqQEtZRS8KmQwDvrpieg5uUufUlWg=;
 b=seaQu3REpzAe94jgQmtsQRg1sRyCSgNKHDbr1u3MKQR5u9EbJiwPo3+B+4cAY77FU2
 cUmgL5Jat8CrJiTuTJkWG7aED65qgCKmtrkN6nMAkU0z9dZQFjNx6gYIWhAVNpH51ayZ
 L5aLYgAox/WWb0PSJxNWMv8jYIxEbdZ6dpGLM6ccgjTTIlx0xYgjoo9yvqgrDzc0ynG1
 /HUtPAvpaS06kQYvFAl+CKkvs8W7ranoZlVFBXd1uvC/NzxWjgcy6AeAKGVDsMAN57/x
 /KuGn6tk/1ib5abgmByVdFW/fEcovkJuKhkUpuTZ/Mi7OZ9h9Tluel+uFYglxUG55o3e
 Uo7A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785252186; x=1785856986; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=6tpV9v/Kg119xk54JR97ciqjzzxdkwIqP4iGztEVIJI=;
 b=mX/qKdL41pb4fhQ8mb9y7l8Zusr3hF+dmjaW65HzxqxDVw3bIXs1OnQjysgL2N27IM
 +KvKjRbP6Og8F++/3ZkUoyWR89W1EU4ijx8BIrIONLtTRSwEm4mw4rnt74SzP+NefWmw
 JWAevqBWeClOCULS6HMK8sRO6toOOgaqGP9WXEZM+naNuLRmo5NBDcjgPI9QcFO3V/6S
 1ACPBBVJ6WuLSlOns+uE7+vyxpepPqIHHkQbMP+AJizUIrjjEA9xJhK6T1jgDO0okBY3
 NBu3HawL+hcxDr8LsVdskC4FnBP0YKizQCF+yDBk4me0csSxrJJ1W7YbPW52HG5jnqj2
 PYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252186; x=1785856986;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6tpV9v/Kg119xk54JR97ciqjzzxdkwIqP4iGztEVIJI=;
 b=NPshBfWmT+Oq0G47kPiYB6q+2TgL53hcWlwkD+JkEU2wEe9r7MX4NPxOs4QXyPe3WO
 eAcFoNfHJ1M0vlns3txEqxEAtympqFUWKdUlOnYd4Q7rADseIO0YN+AU5W19eoeuT6H9
 pESALTWLAFjOrC+slRRoiFEsqLXgH/wf1XWxBjDOR5Eta6EUIjPDhmJFQ6Z8cOLYAsub
 5E9pQJ5q0kvLrEM3vx4+X7NANOVDpZCpDnqNcQTbygeE4bJWBmOteV+s9fstmolgdJ5v
 V+J5WkR7ph0v/Kx5hvkogKsISj/0+M389z3O+TyTOPCTW67U/iroWj9DoHv/7CmVDoP+
 t0vw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqOYQCKlApFe3CpU4fHBdYFmndpTZB0cuVvYq7yGVTHwU5V/6v1cKWV7a7LuwhyA0REB94/azgvJQ==@nongnu.org
X-Gm-Message-State: AOJu0YyD1L4tW+G2V3FhHqNuJsUTO4O9V6qkPRz7Bw7OBp7Z7hZj7ovh
 QhSWGYJv2V2meSb2OEDXXKEdKkMjC1fSat1GcaB2pWf/VKn4qAgondqrwGTEFisGBMMz69XdgZi
 Z5IwsRR2+MatFwABjZkm9pgIt9dOdL7/2onQ/bkOTE4/ttqP1Gg7C
X-Gm-Gg: AR+sD11Ffkr1eKKv5n/dKvBhEOTDeVUKvXmJCNCNkY7B+EuY9ImpySyVdlrrnHHafsu
 6jfjPyoQ6Cb+hqbbUBECJO0ho6BUUSQRkv4drSy+oliJ2vWVsX+E1lVo9ep6whaYIrlNl15qSSr
 L8S7U5YhakwzTbYMPQ992ofhmVAlo9L/2LG2hkNs8rvvy2Fu9Int7OhXD+xY/4+yZlIpMeHy9jc
 PZYuemW+gumJMthtU8E6xSbpH/jUVZD1NkSlPpuaFchYJlj2PMEcnooMnkei7GcBGjWA3ysl34p
 MkY11wxJ4OypDPLJ2OnxY8qZKV6NictgjqSG/jvm+KzNpg==
X-Received: by 2002:a17:907:3e9c:b0:c1c:4a80:30cc with SMTP id
 a640c23a62f3a-c1f72251cc6mr161154966b.46.1785252186333; Tue, 28 Jul 2026
 08:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-4-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:22:50 +0100
X-Gm-Features: AUfX_mwh-YNdXFyiWCCOCm44OL2O1x9X-npQ-uURM_q36bA5bauGyq3oqAMX-VM
Message-ID: <CAFEAcA_V5gNCQZzXJbX4dqYDXsFkpvvbNKFKH0j-bEKucJiWXQ@mail.gmail.com>
Subject: Re: [PATCH 03/20] target/arm: Remove DO_ZPZZ_AH_FP from
 translate-sme.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 21 Jul 2026 at 19:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Expand the macro at each use site.
> Merge the two arrays and index by fpcr_ah.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

