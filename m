Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA06CA5FA5
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 15:40:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBDT1-0005Gg-Tt; Mon, 28 Sep 2026 11:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBDSy-0005Fv-4B
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:40:32 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBDSv-0004Yb-Nc
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:40:30 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-6714595153cso2533736d50.0
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 08:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790610028; cv=none;
 d=google.com; s=arc-20260327;
 b=T+KHsN1RYl5OumkT02f1ow5KlM2KucKRaMJ2a59nao0jHBxjFM9N/5JW8ZJchYlFsU
 wcqKyBBFaVVnACORDh+/I0C+3wXfN7RJBx8nLRQezmGDJGWjCUC1z0cOrblBQN5Mt6Lc
 Ibo550Kc1UYYDsKGUTT4Bz/oN7ME0sdirABz+YCjeRLws/efn2vcIsgMlv0yuMJe+1up
 Gk+lIS6aj/3O2Z8YXPTgYpNCOiqmQ58GAUQkT0vpjOmlxm/Dg4PaBIkg1ZrAw3ix/AbE
 Pe3G1DpFKmrbetVgpdLKBFG5p0b4b6fpNlq/FzBLzh5sbHDEXlOGTqoFt7JrszYuAlLn
 RQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qM/B9Ymm+HU7jsilmrZJu7DV8Ea3+MiIvk8w5TS6NXA=;
 fh=jNQZE49dazF/kiKGQVxlKkUZP972tcSrGb5iD05g7Zo=;
 b=rVzAwX34EZqyPfD4C/o6NtL2VWM6NJkBJfiTcjGc11F8QvCqnJNIIksOQ0gqPT8DdQ
 dZ9HVhnj2Td/DsJ5mWfFyK7vi71dg/ya6i0xJPsxr0R8RmMkEbXMKkCc+6DLrKRW0pYO
 TcMG3E2yhtn2ukSLr04pN5D+OttVLL4GEpLEJJPMjDYQvg9eZsNJzcZKC7pikYK1pc2L
 3wsIWY9hRc452XbG73RJkItdhD0G+QdFLzVk6OJFElW3lukj/5rLSYjeJ5elyG2BTWF2
 gaR8gwzm9fHknK1e2f/n+1I55/Igc+y453KNg9cqqkkoZ1jecwjFIOUrjNN+6f8jvUBZ
 IYAQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790610028; x=1791214828; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=qM/B9Ymm+HU7jsilmrZJu7DV8Ea3+MiIvk8w5TS6NXA=;
 b=CtAJSTmC9QjmmkeClvO4dsSMF9IpwfPBNHbTVer9AeBZ5gyqQU3oqsZkuaWmaACC16
 9q6BUcD5u6lmhZt5tNvaNxJVIrg+65DyGP6iwM5SKYSeIqKxBgBvBRvkzrR3T5+n75rq
 6CZcwCW5Xdno4qJhNZYPTUlBBQQrw0/Eghe99/FHcucdM8t6RNmDxuL/C1MoWt/NUyte
 sqt/Le7WcvE+zUAlJCie/8KTFzJSSWNNUyGgqfrsg50X5b1y0gFB9xPn/MfUQv9r5zKQ
 bgyhrv9AiloVvJLWozwxBcg47rETI2SH9iEokU5ZmubvDiezUhXhwSaTlYJn8jjKJB+J
 7Umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790610028; x=1791214828;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=qM/B9Ymm+HU7jsilmrZJu7DV8Ea3+MiIvk8w5TS6NXA=;
 b=J2QO/I/v+c+UaLlm+7St6qzLTKIMaKjRUzTNEWE/tVnda0UAAiim7STN8B8zHmv6YE
 LAMc9XZRuJrufLeEZ/cfl+GuMqygCytakFS4CPv7/2HTbD4ZCu9tTUVf8qhkiu7ysGas
 UgqlvVjT+r5dLkAkOaGZn/2fQiE0K4RE7FKWD9bifRx+c+3SEUwcqjOaBcOT9WNN2PZi
 5Ymi/+1WEbGkdWL6zzgAJW8vU/KBDlNouhf8BpURzMUD0KLOloNVqWVwazHkemmaw5gy
 vgHmJTsNK1+zsn0dVhuVGJpW/nf2nFRT9knR2N1earPLEdwQr74q6+xZEnG3PJEgWsb5
 6eGw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxKdZ5eY1axLclELg3Gqd2F+aMPOROF7OjZp2e2CYNuE6moV1Qw+KsCRSvN+SwO+4l8/q4NyZutKA==@nongnu.org
X-Gm-Message-State: AFq9FYLOZKckdtJjAIUD5rnHKhTfcxDcH6uEqH2FuSpRczGR/PuWMHX4
 +LtyCs4mpH+EPl62H4b3WHMFW5hX7opNAcpaH129xqL9f3FAOgaqmeyLGRMwgJQsW5JH9Pwk4Yc
 /EkIhpq55gz5GF+teglZ1uTPqDbQVzUEgHkqoDFk4uA==
X-Gm-Gg: AYBFou0GPduhsoMm6W6/gjPbcnGuEzWzjtZ/uUrp1o7gM6spVn56to2Qps+o46SXE83
 X2PqqOsMEdK6AuyGtRafjVmD4v2spBowBPUqITyDldvd+bavsKecZXFgzgQJuDMz9CsaMLooJhg
 PFVXqZXEUbuJuM4W1EJzI3jQ+7vHwHH5ns/056iFyLIIkH0v8fylzRk0bVh0WvQCFS/Vp76cDzh
 xUCOa/j44dyG8gADvUJfFHYXtTUu6x0SeXGuErDuk30BfzqGq64O0fYWZ1RDbpyuDsrhHz5cosz
 S5+Sk+RXnHN5RDEdwLR357OFw2kuMBXq7xxlSruRFt8XuYy7bvVgw8zfAc0z2aaEc6MkomuRkSm
 qu56Gv7knRGNTfow4Mv10woxzv67LQy8jRPzolDQ=
X-Received: by 2002:a05:690e:150c:b0:673:ae96:361e with SMTP id
 956f58d0204a3-673ae96378fmr4465386d50.55.1790610028322; Mon, 28 Sep 2026
 08:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260925215004.456336-1-richard.henderson@linaro.org>
 <20260925215004.456336-4-richard.henderson@linaro.org>
In-Reply-To: <20260925215004.456336-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 16:40:17 +0100
X-Gm-Features: AclHuK8DTkPA4pO_5khNZ4Gh2tPJ16Yz5JxWstZ29xndF0dvODjAjfpjmxPlzJg
Message-ID: <CAFEAcA_8MyATnQiAsT1d2Ay4b1C375vPJKY80aXvi+8A6EoJTg@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] target/arm: Split out
 rebuild_hflags_common_aprofile
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

On Fri, 25 Sept 2026 at 22:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Alignment, FGT, and IL are common to a32 and a64, though the
> latter comes from different places.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

This doesn't break the set-read ordering for FGT_ACTIVE in
rebuild_hflags_a64(), because it moves the set earlier than
it was, so that's OK.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

