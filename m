Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6F2CC6B34
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 13:00:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHL3z-000501-9n; Thu, 15 Oct 2026 09:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHL3w-0004yo-40
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 09:00:00 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHL3s-0002Hi-S5
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 08:59:59 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-8b0a921ee46so20503257b3.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 05:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792069195; cv=none;
 d=google.com; s=arc-20260327;
 b=RA5mdP+7UmAG/SauwzmCc5W6mgEr57qudhnZ91Gdkjs3iVQqNoWrXWBDKGFwt764EK
 UJnAS35BiNfbAEZ2F3QjtBTD4w/8DTFP9MJUNpNmfnI4mcR5hCSbdLQj55s/TZ5cP19p
 G1eWnFPbRzP7Fsgpe0tN1mPc5oExl+OT3gWaMsxrFaxn06P5HafYVsgyA12aWZeS9grq
 dpp2u2OxE8VyfphtIMJNglImLrtmOalQENZz6jP9J8qA9dnyXlDltf8sVgV8067Qh2xV
 LDw3QglbOxzDyrJpO0zVtZ9Nvd/s/vGsn6pHRZpum+S1t9IjkCEWVh1AXC0gs4kuaxdx
 GwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bG+JBl5qKwa2XHa8u01oWs7LWmC2tmAkrm4gc//FRQM=;
 fh=ApRiHAeUIoqlQQJQSGt4fxdCuOqgxd/Iea+639BVXBU=;
 b=OeE6+CXsjAe+ESMyFe3NbNCJ+m/g4L7XKvtDgbMejz+1/2MGx8hOyW5J/KGNA4tc46
 C15Ped5lCgKv72uXBgXZFGUG8t2k0J1VDrfctrqIsVdzygdEbyg2l1Zn6RrDYrhWUu+Q
 IOJcWxT/+nLbXl7B6XjA9Ct2etcc/Gnj/nZqpX+ZMXIlqt1RkaUaJaSqlV9Gmnux+8fQ
 nc7fuJmYp1k5ZDcebXnABEVPUvukja/l7HLFHuYdMY29jxGNxllAvv1IdXWgQ+3DboT/
 NPZSF257Qg+JCPj7+fwprVU2blpGx7sN/xscb0Nb3Br8nw5C0gH+USC8y03Kk0P2/PCr
 qDgw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792069195; x=1792673995; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bG+JBl5qKwa2XHa8u01oWs7LWmC2tmAkrm4gc//FRQM=;
 b=gft6rRPWg1KSTUVQFysUqtOYZprrRTHRcJveSlSjfrQ9rop0RlxJMu3bXCPguFsX0b
 KjkyewE2yM4zBHTny8H9abcYexReSn6kS0upsdeNzs+z0ael+c22izNb1QEVf1gEyfOs
 sKqDlQEoUEFwqb947B1bJQyBnuHDx9MdohnvGGjVrMKC166FUueCE1Ne7dzkP44puoTO
 HP6FidOvnlh36oETe65MhpYsBuTWyfHwtwtGQAr3Dlj8IXvacVorLbeSm8wGGBqXNZE1
 zU/yc8hSNUKIDS6XECZgfLK0YhMSWk84TyjVDzVGi8/6TZnCGoLH6JTD3pEo8N7g/RFg
 kqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792069195; x=1792673995;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=bG+JBl5qKwa2XHa8u01oWs7LWmC2tmAkrm4gc//FRQM=;
 b=AiAjTIhkRLixy6O4ks+mbou7q9805z+RVj+QYLptyoS85NBnnqv4gA7CcO0NrL0mFa
 7H6M4SYjrGdvp5SqrfS2YgNbbKZNZ2d1IMcsTUqNsTKs2/U+oa6oniUG5yfDqNv57Gex
 ZfxYJwQap5mX6rQhFkm42B1saNglA8PcXVFEIcreto5SpwDEcJ+E/H7bhcgZTpSiL4Ec
 I98zYhFqqiMlbzqDDeBIvvd2yb8pG64MsEOHRXcNLLnZkmYmjWBwULHWa6LVhHr04S8Y
 1ZMFJ8G3MQcuoA/th3PuLjxGkpAIcKV4/zntdsq7TbD2eq/ZoqhrDLIfDRz1wJv2qhUa
 ARZA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxSRAGpLtS8zJGmQpTp6YoVtDERbD1H1dHwrqWH+aEsl3g6KD6dfco+DCwtLXXnaWWq4YsXrA+AvA==@nongnu.org
X-Gm-Message-State: AFq9FYJiGoIISzr04ynTBcgSxJuAj4rfg0jRCB/K5Q4YVUgXBwPOD+wq
 UdB9BqsHGjKQO4ldtb7hc9+Ido6lfTk8aW2HNBxrhvT3bkOhXC/9XgWLvq/YHgzvGUinCTo6sKu
 SQ4QDYiPuQDjDpaNkKs9nzVyoXfZh9APbWo/RPe80iw==
X-Gm-Gg: AYBFou0KG0qXnnXfKyiYBHsOuYSME4/57aCi9cSq4QOMDlmFgmj+7QRKn/M6eyBZjwu
 CzxKNcys485I0Y0g6aoI/CqvUTibQn0cGVAL0C9XWq7/gxDrOdu35ILyPPQ83Uiht4HdNqNJiTb
 v0PS3nfgBEZpNXzUeH0EtAM3qAw/QNwsFObhaX/o1o/cbiAnaHuUolMrvyIa784DilzG3YJ4gSc
 ZBfOML1optMnn6P25mnDbpz5ZF66zGvjvjLKGrIe2sm8p4urxsj4XbJkpN1waZiLKnMYFJgu8YT
 zSG752BOsP6IvpqI6h8Oi1J6WdXvihTAA2cuFA9faN+N2hG2Fu4n2nOH1tDoxdYq/61NBchb8ya
 oLCSyyLDB7WKYm3XY3z2sSeIjOHp9iRhVncGTg9A=
X-Received: by 2002:a05:690c:ec5:b0:8ab:447c:b159 with SMTP id
 00721157ae682-8b07edf2767mr63205287b3.94.1792069195357; Thu, 15 Oct 2026
 05:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260725012635.4925-1-marcelomanzo@gmail.com>
 <20260725012635.4925-4-marcelomanzo@gmail.com>
In-Reply-To: <20260725012635.4925-4-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 13:59:43 +0100
X-Gm-Features: AclHuK8P-x-1z0Vijq_iKVo2E7aSWPYqsDlcSoRnEh9htqAdWMT6zRtSdHMDLk4
Message-ID: <CAFEAcA_6a4=spy4KJV7Otd-sKde4sKP6brW+dXtUgLMwm6hHWg@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/misc/bcm2838_thermal: add BCM2838 thermal sensor
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Sergey Kambalin <serg.oker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Sat, 25 Jul 2026 at 02:26, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> From: Sergey Kambalin <serg.oker@gmail.com>
>
> Add a dummy BCM2838 (BCM2711/Raspberry Pi 4B) thermal sensor: a
> single status register that always reports a fixed 25C reading with
> both "valid" bits set. Real hardware reports live temperature; a
> fixed reading is enough for guests that just probe the sensor and
> read it, without modeling actual thermal behavior.
>
> Part of Sergey Kambalin's original Raspberry Pi 4B series (patchwork
> series 829638, posted to qemu-devel in 2024, never merged). Ported
> to current master by Marcelo Manzo: header paths moved under
> hw/core/, class_init()'s const void *data. No functional change
> otherwise (this device has no reset or migration state to begin
> with).
>
> Boot-tested: guest's thermal_zone0/temp reports 25310 (25.31C),
> matching the fixed reading this device returns.
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

