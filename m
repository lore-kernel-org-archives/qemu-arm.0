Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp404041ejq;
        Thu, 4 May 2023 08:50:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6jRN9G2KleioeoQk6K6qrpfdoQwPtd3HSTlC55whGLlOSEu9RcJpxdoqbydiNkvr+Ucm2Y
X-Received: by 2002:ac8:5dc6:0:b0:3ef:38c5:7957 with SMTP id e6-20020ac85dc6000000b003ef38c57957mr6468394qtx.32.1683215430256;
        Thu, 04 May 2023 08:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683215430; cv=none;
        d=google.com; s=arc-20160816;
        b=qNJFd46vaN6S15sW2Xlxj+ddy2qXrRpvypQ7iyVt1w7b/yZcmLkHAHgdVZ0tZU9jOJ
         TSPQgtsZrPtnjvkuj4pHZz0j0kfu04z6rVGuZ0aDqgMpEKScHRuoy8xQ3OAouf39LirR
         EAEuO/6NqjzVtJbmBHGlfDVa4Kfngpo+jjpieygGfRGJIQLgq4GYJpqkCE5/dRBHtJSJ
         OyEQV1gK88uSSpwtsLcTWLMOEBsj2z1HxmwmybQe3KpImRicpu3t4Ai28BGeHoB3H6o1
         LVBJjGtKDo9VsI+JC5G2JV6/+uPPL+9B97R1NqhuIVJn1J0ZVY3nTLfloVKS83RN3bLz
         oDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=iIpxPPCGn5q4P6gM9rBx3mfBXwTmnjji3/HoVk/CHVk=;
        b=OEkuhHStgzC7Fu3ypOfRBLRGj2s3gyttIAf51vXQQCNN9hoR17JjPQPZDN6axMw/mo
         lBwZxlD9pXwN3on6rCPZiZA0SewKXPQEryI/Fmncog2Vt30HypcofDXXF9chpuAcwzlf
         wxfbD9XPEutfVCW69z8ppBz1MFm4o56s7sa8WS+QezNt8HDqi1GwxnwYeAmAIQvg8pZA
         N8KKi7tcSY3V3Zyr751ykFePDGID+RLksFGCchH8SYFpLs+nd87Gi9LMghudgkivS5PA
         2Bax4AcEo2U25At+mUqAcWc2UVP7TX8LDOVHyyYtsBbcS1oaTAxlQahXBcBW+vdXLcAe
         5faQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZX7NjTt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020a05622a004900b003f3640b48aasi1342051qtw.622.2023.05.04.08.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 May 2023 08:50:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YZX7NjTt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pubDu-0007bq-Jg; Thu, 04 May 2023 11:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pub8A-00066Q-Kc
 for qemu-arm@nongnu.org; Thu, 04 May 2023 11:44:30 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pub88-0004IO-5n
 for qemu-arm@nongnu.org; Thu, 04 May 2023 11:44:30 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so18654809a12.0
 for <qemu-arm@nongnu.org>; Thu, 04 May 2023 08:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683215066; x=1685807066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iIpxPPCGn5q4P6gM9rBx3mfBXwTmnjji3/HoVk/CHVk=;
 b=YZX7NjTtuRuW0PHT6NYHwI2cpi2v/9FVFGGZsH9vxX+Px9/6NeaiYC5pm/kOMTJLJK
 yH7JyHctqFKTe04qk8vovgtJi/xtnn5H/4HRTaJPxQkw80HIKzbVIyfh63VJgW4Lw6RQ
 X5p8+pz6hjlVzyv0CGKfqPkYYdi2a26itR8uz/0FhyVywI8LnWthP1nCkuRtFlw0mOoz
 3w0jwunP+OC1SzS6gO+sirhh69Rpejx49KURF36AEqA8gKQBuOpkQNTPqxZZd/gq/67r
 olroA23buRP/7+7IRFN7IhTOChzRj1XypFF3kZzwSJsL+uxwqMRqc3zl1KA9AM0FuFyx
 B5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683215066; x=1685807066;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iIpxPPCGn5q4P6gM9rBx3mfBXwTmnjji3/HoVk/CHVk=;
 b=JEIRXQ8YVZy0rbAvnDitLnis91gcb2fX3S6m9/EqnX1q+0eXN7sLkC/HY6pNYtHa14
 hhENf5b/znff+Xla9tiA16ntLo4d/iXNZntppin4v7CXlR6d+WMHxqumuDDUW8LL1nEj
 HmbJJOchNALqjDWR6ybTdyOK2nrb+8+4M7ZhqZIdUT2GlFRCxrUUv1osRe7I6oaDFwwP
 BKNNjUqlAmkkgRXu18HKD7VoYdhgWu+3ZQbLCeyHJ2EwyEZGgJ6C+w6abyxapB1sjPyZ
 fbTYJNOODCiXn2YO6KKfYYzawG98JXI1dWmsOb0WoLmUBtDwJwqwfiIwGFgrOh1mnw0m
 Ljxg==
X-Gm-Message-State: AC+VfDzHhCx2j8kF37wbSXmXbglartG/3wBM9KBd/nnU6BbjcmDoBKI4
 QLDUv5F1sFmQo5SK4A2PIP0trSzCtDbPHsuP8JC5hQ==
X-Received: by 2002:a17:907:1c97:b0:94e:c40b:71e3 with SMTP id
 nb23-20020a1709071c9700b0094ec40b71e3mr5504940ejc.5.1683215066393; Thu, 04
 May 2023 08:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-6-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 16:44:15 +0100
Message-ID: <CAFEAcA_ZW3EW1L6rCuhDjpaANhkaNvAbETWaaFFdvJ2V88aOSw@mail.gmail.com>
Subject: Re: [PATCH v4 05/57] accel/tcg: Reorg system mode store helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6pbykxZBNte7

On Wed, 3 May 2023 at 08:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of trying to unify all operations on uint64_t, use
> mmu_lookup() to perform the basic tlb hit and resolution.
> Create individual functions to handle access by size.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
