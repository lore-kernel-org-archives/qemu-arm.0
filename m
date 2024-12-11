Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4170415njb;
        Wed, 11 Dec 2024 08:08:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWiTBv3+8xaPlTYyPSOVcTtfbIktg3sfbLMJsRtW/3OwN+5HQF2vew14NOGeJFRsFGxn31L0qfhN+iUdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG7nzvKgajwluDBaBupNtrdZJBPTSw6H2+BX4d49wYYRvbNZ80jrwskgBbS6cWeWkRtAaoP
X-Received: by 2002:a05:622a:4812:b0:467:63a4:8f0d with SMTP id d75a77b69052e-4678935ec29mr66414631cf.34.1733933280877;
        Wed, 11 Dec 2024 08:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733933280; cv=none;
        d=google.com; s=arc-20240605;
        b=SZ99dUJCT+hrWy78cE71+xexlST0MCSJ5w8NsSZsXKF2at8GpnfLaeL+UU6UGYk2F0
         0tVnuhyXPcnhSd2veHDKKHCcg3IAbSGPGbtKsuE6sfHIXeRW0pXBz/xjEtLkma81goxj
         YBuQojd4VBxUPRMYcgYb0xB95x3WZLwI/zZmaNnI0u7HWjO3XNpAICEBdHa6lR+ej3v/
         t9SWskoTejQcxLvRSgMh7jtOFEF1aYRUXc4QyBGDK7lB2JY3OyIJJOJi9O97S5tHfxFx
         0VmaHnQbgzZcuv3topvaEMKautCYtT9PgZaxmwkaWBBjw/RFzbBSZ8TAhzNJrUOErmeI
         RnAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QiAv8VaHWBVzN7pAElATdirdUWbd5FLcw9NJ8tS8z60=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=enFuCWZlxqXbH6QXqdvJaqpdgnWuPezSBzCGxW4ngUvKxYAr+NKyrb58nPCEvF9Jxv
         GMYj0SLNnm6x+QPlS0/40wWcXcP7BFRRKE9t64P+5tauXF5O5Vpmyz/CPsUux0dlJSZe
         zcQTNGN4T2/Em8JV6rI3gv1cPDhtArwHv1mEFUFeN8bIxk//V11HZlzb4zFJsaX0SPL5
         vgO8O/PXqaLMW7wWgRb0/IKKexHzVkvYZk40OFzXlsQPFJxMsUr8lay9Eq3h8Ha8xbWN
         wdO1uIy/QSwpPkanss8h6Wg3VqTM2DBgIjVOgEEM4UCvOgsBhmnFq4P8SywHdgnITMZD
         Ye1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/Pj2aaE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467500858dfsi109480431cf.675.2024.12.11.08.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:08:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O/Pj2aaE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLPFj-0002l6-KM; Wed, 11 Dec 2024 11:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPFS-0002hq-Mz
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:07:40 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPFQ-0005U8-8g
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 11:07:38 -0500
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e3989d27ba3so5369151276.1
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 08:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733933254; x=1734538054; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QiAv8VaHWBVzN7pAElATdirdUWbd5FLcw9NJ8tS8z60=;
 b=O/Pj2aaEVxvh0hAiIvXGUPtPTy3YmdCtMSgJ8ahzP2b+NsaIG+kGfLdGIjRBczjU2s
 coifqJv4oTTqQdu9c4NA4XlbLlSVwwNPf7AoNrP8r13Syo0zuKvVWJt1DZ0atYHyPWzo
 YpIwqq7VEyeXFFGPEgLJt7EqL0rWg4Nt6chj7nwlHw0wMj2UXrJHfWZ+B+XBV3McHUsf
 mYuQhDE/BJF86LRHT3NOPJV1jKsj5YNe5dYhQZMqzp7Dqd7WwnxIQIF9WSG4Vmcascns
 z7hIPAhLvkTql25lkfABfJ6aHkJ2v4PRcna4PToKGNQ3O+c0rFRVLC192/bkfKLwlgq3
 K0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733933254; x=1734538054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QiAv8VaHWBVzN7pAElATdirdUWbd5FLcw9NJ8tS8z60=;
 b=fBe76JMPkzJDp+PavlFBAQPC570VbBophIcR8tRvM3lxzeJVPsPvDjSV5LSUv4ivsU
 UHj05DfVgoaUs0kxpU2bP1QnOb16RFkVSEsPO8W9O37E6HzFAbRGbnafUaWNhi5IykTJ
 n+n5TJYyucAEfSaSv+0pDAb9mFQiLLbaRvLCYBKDHXlbV9x4AS0PIrb0zbUVhzub1un+
 Wg7mYmdC7kjDqBemBz7+4pfh1gGdIW+qvhLQFOQQswPBN6e6RX+oT/Zs42/lsPL0wcHQ
 if1Pr3V9ibfrWxPWUaJExToR4nn1wGBIuU9u1RlJwkBkH5UVlx5eogdGXi2XE1iuwL+n
 3bvw==
X-Gm-Message-State: AOJu0YxyrZuzPCg1ieuEXXEtW5F9NBOiVTG5C+FNPk49aTYba+6F4fmZ
 JZDLkY+ptabFZH51Z4GG80LU4iMaw3TubdNbmHjnRjZsE62/a0Y8vXY+yH6kXvCpFdRCBhrMCvM
 TP1GzNJG51YnVZGfrVVtgwB46I0Oaw8PNQmp85ULYA5Kbz/uA
X-Gm-Gg: ASbGncvKd11Bf06kxQJvTyk5fS3wLiygK1fI+Osb2pKarOIJChOagLxMZqN7+fCnsvy
 FzcaGlDKee/GaR6DbhmZdP1ZnQmIwdKAvQWlX
X-Received: by 2002:a05:6902:2b0e:b0:e39:a1a1:f042 with SMTP id
 3f1490d57ef6-e3c8e42e5c5mr3776220276.2.1733933253957; Wed, 11 Dec 2024
 08:07:33 -0800 (PST)
MIME-Version: 1.0
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
 <20241210161733.1830573-64-richard.henderson@linaro.org>
In-Reply-To: <20241210161733.1830573-64-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 16:07:22 +0000
Message-ID: <CAFEAcA-psixV51nP0oee5+DjXjcztH7--01=S4z-6Pc0BOKvwg@mail.gmail.com>
Subject: Re: [PATCH v2 63/69] target/arm: Convert FCVTZ[SU] (vector,
 fixed-point) to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GBRJT18eBBGU

On Tue, 10 Dec 2024 at 16:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove handle_simd_shift_fpint_conv and disas_simd_shift_imm
> as these were the last insns decoded by those functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
