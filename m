Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501E6C43327
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 13:00:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd69y-0001Lv-35; Fri, 26 Jun 2026 09:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd69I-00012d-2D
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:59:17 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd69G-0000lG-Qd
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:59:11 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-6626b5ace23so1253765d50.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 05:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782478750; cv=none;
 d=google.com; s=arc-20260327;
 b=olshdqz1j2hPN0LOprvqsngY54aMqplawe1HDAey6uMYr3L1bJKlgu9B/QtlT+mX+c
 rP6mjcpNZglBdcTR3TjUR8GXcI/ipMAvodgjLhiV+uUTg8eOGmfeaV3wJAw+T11k6EFK
 8AYPYKv8h6rh1cFDF0ci9JBmN6erl+vgBzSfj43PGfXZ732gYo7W308I8Hcymku0mlwb
 xaq51RAE7yl+uTQAnO3NEKs8VTiMQGAHB1tW6YKXkOf+VoqjqQe+Uk3nnXOahSpoBFth
 Qgl9WBpI2AQZYrkmxpnl1UDg9Y0oLuDUkLZXgeXYmjAtMEJLUGe7VDilwxHWCAf1P+yK
 qSaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dRYeI2UKL4Ikr299qX0SidZFzhgg+QmtK54BlgODc4k=;
 fh=YyiaxUwDC3G1TkAoNQjAFQ/Mko80VXto1mvllNNSyv8=;
 b=LKlvUsqBnSB28HCjwyNA7hrvP198vTtmtiLPSXmjHE7Bb1XjZHel1TgGZIgLo3/Fdq
 GUJkw61pLB0lzS0PPKKg8QyWerhILwvQZjhlt8OqO74yOVmlMRs9H61jtGoUObPXU3gd
 MQDOeHDmqZbg1lEWPKCa4TkGFZa5oqPK/Dx4qjip7QpuE2DC9rm7WxdvcXLTtiUxO6z3
 Ex1sNQZY2ncnhlz3CE4zVCVVQUTo5yVc+hstsyCaiqAMBevV3J4ouvNzVb7rD+g6/eLM
 Q4pwKErQkZdl2jJmRd9p0G5/1T4XfuEU9i1RYFnfar+rfk+ysrx24SJaryvK+pYIH4ly
 TlMQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782478750; x=1783083550; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dRYeI2UKL4Ikr299qX0SidZFzhgg+QmtK54BlgODc4k=;
 b=qCWuN0eCydzuml8h86tJYdRKX/b2dknH3po8EZYTnuRO3v3+kLpGKh4SPSQKVvVoSv
 NMqWc6fZs3CL6gvj9g6+KYiAmyPODa4E9tsXwRJyCahu57yRAt7YnUjYTrRW4ZyMyRvb
 qYMLMQ7Ds6HIBuYon027NYv3YKY2p8U0vd/j4Itt2q75m0MJS83PSH/lTckACYhXx2ii
 3z41JyeOZyaVr8o3On+BTk1OeS+NEvsxi9ulRrBDa+n+Bz6TkIjsNSgfdN3rCKZN5+Nq
 N0jWBY1AYnV4+1RW3DsgYpgkUu0qwbyS4tuKteOt3aRfXktZmF8bot/Rw8VGuiwxkBoW
 /gdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782478750; x=1783083550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRYeI2UKL4Ikr299qX0SidZFzhgg+QmtK54BlgODc4k=;
 b=f555d02ArbczCZF3Ft3+64K6nHnNo0Lgr9NbXqYAmEj7RLjeZ89p+xqSp4RI8HWwaA
 WaUpyRUDHgno5uBP1bjzN48npFED4AzfVGtZn3+mg27X9bfGmK78GF9yuXkAcDxTRPUN
 xzlRXGa3ekHsLfKkWDugdcJ4XzE7xBni2ceN8G/Md/fdbkspjWqYCn/0HucDMX4ZeSVn
 E0GBnqeQJaXlT8vH+jZv+kL/25uFHXxdV8r8tX1/n7w8+QrxBlHdYGygdu/QpttC86i2
 DEiht4OaesP/mLEMoCRsMFtcnEvlssJmuiXm7Kxgno5JUqJbo4qRJqCU515PyMNUXQf9
 fRug==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrrm+Y/UBIkwkFvL+Q7ehjGC/pRmFFroG9h2pJLe8fmimENIUYxJYqViNfB3HLdVzySAnJBGhRO0w==@nongnu.org
X-Gm-Message-State: AOJu0YxAvjj1gmUscPE+Dc75VP61zq9h23EMyXBIKibAzGEyKRjFja8M
 /fX3GIa8hEOCDF2F5ZwUdrgT+No6UUH7bXlcEgWLdCBHa2JStN7QoiMQ1r0uqUqT00C4EXQAZJt
 MmTL52TupX4XIMUfyd4jN8DX/vvOww0tKPWI5aGth2KI9WmgFTrGoXTA6KSLf
X-Gm-Gg: AfdE7cmyzKeQ0/W1PQZg1VY+fkShp0l4MgVO7NjJvSBRKc+05K96RAye6YhcHZuzTSX
 VkWJdr93VtFAB2syRB9Bm29fNwiEH+jbirKu/RniTltebBPRB69r7Qb4ySz6YrNA9hS1CjI94wv
 I8yLR07Kt0buHCScLPYgci3stYNnzqLMK9Zhy0LrFub9cqQQmoXdZvodb2XEJ+0U1VpANVu7/Pl
 3trGbVhRHUAY9z4WVwOdI1oXKqmxu75jTFqGzmgIb4obHFMsLV7weIr8kmLDEMNhM+avc/K2xhC
 G+GqG6x74ewOLiziPUPrkojP3TIV3UvMVhIbUvKyzz2h+QDsvX1CAeI8
X-Received: by 2002:a05:690e:1441:b0:663:15ba:cde3 with SMTP id
 956f58d0204a3-66487956cf6mr4504620d50.21.1782478749796; Fri, 26 Jun 2026
 05:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-7-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 13:58:55 +0100
X-Gm-Features: AVVi8Cc0PKvhBxuy9vr5WqplVApxGbYcBZw8t6S0q-K4csodgUc_Yu6qcWEJqmg
Message-ID: <CAFEAcA8wARhWC1ZLBV_odnj=x7yo_qJBZUqd7=vdG_En3BPqHg@mail.gmail.com>
Subject: Re: [PATCH 06/15] target/arm: Implement FMOP4 (widening, 2-way fp16
 to fp32)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Thu, 25 Jun 2026 at 23:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

