Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388CACA1016
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Sep 2025 14:41:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uvd2p-00065R-Pj; Mon, 08 Sep 2025 10:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uvd2k-00064E-F1
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 10:40:30 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uvd2d-0003x3-5c
 for qemu-arm@nongnu.org; Mon, 08 Sep 2025 10:40:28 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e9d923fd113so2750325276.2
 for <qemu-arm@nongnu.org>; Mon, 08 Sep 2025 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757342414; x=1757947214; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ie34N3VBwqrFPbD6ojvoILKtO0smHKsr9OKY9vnHdMo=;
 b=YZtfefGjSLuStpyeKvUgnbfnh7IBXWPi1KHU52udca6UUBz3EAbUIRUHmoyiHu9jnM
 ZKx6k7jVdHLtkDhxu4lrB2scwIjb6tj2SPVTpXcDW3NdcG7bO/gk1iIwxszqVVjfHl+A
 OF+1Hq4GG9d+1qItvZnAUFER7eqXLIdPjtI7z9emijWZPGLzWTfdxVIRQ1kOtRAftmEF
 dJvwv8sy/G7OJoD2pmLg9eKfYKBerSRAb72cYGU6rdP2XwgbB8opDsXwyC13mSJZqLDB
 VG2LnN9+7tW8fT8U+bKI/aM4rnD06mbIPG4hDyrqxRCODKOxTjRhHC8iVUupGK1SfqSt
 XDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757342414; x=1757947214;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ie34N3VBwqrFPbD6ojvoILKtO0smHKsr9OKY9vnHdMo=;
 b=f8/oMfTqJjAILX6g5Utpq5EkZFvKr4+H9cN3MBCweaOpB9TvE7IkD/WxLodkVOzD79
 L8g0hsn93E3n6OMtWMbvBgTb+d7peQSWAlYcOTfLTKM0//C/r/NteX92KnpNusPMO9c4
 LJcrLhqLA782O3NydmJP8VBWCEEX3RitbBZAW2nlzh8u4fH+u4Ci9tMa4/2uIay3CKWb
 YZo0kCteH1ohXdz7hUnWlWAAXb8lzni8cuNWqLHC9bgZ/wJDF2yIuY4dQm8/Zs6M03+5
 0Mm6vs19c5dvLDUO0KOYbSmsreXX++NXYvLwVmasgcnHUNjPGHFb4GcyRS5IucyDa6eO
 mfgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3hrIuzUKCkvp318apXC3Me5GwCCqxkmMx91Q0nTcg3za+NbRUbEmcTxfFVikQdw/cMi1tQdkhXQ==@nongnu.org
X-Gm-Message-State: AOJu0YxmVh35aqE5AAh9aS5CVhN7zCz8LCZa5izLA5MAk26CdFTaDh2c
 BVNdnoJ+UcHJzK1bgh3M82qfLpZOAeCAN4WU57uXxZheZ0HPXZs6GFyqmyvN+FkIgd9KDTQf5kL
 JH/kWiWZeZsb36WFkLZemwbCstTfjKotBgmondHHQ/g==
X-Gm-Gg: ASbGncspt8HquZxJeVo7lh35yBT71L4ifvkz9y5UQjiRyOadnQDbV5Aep7xwLd2sBc8
 VZBFgJTZ+IWu2hrkL6gdWmpQHjLxEfwSgvGQA4J2Ry0OUHSHSj8117xDAkIITTrTMTJAFZVnLwH
 J9xqoWlhpf7j89VkJYS5znorEEJHp1p6yRmp6YzsgzqAY/MIRc9Qc8iaUbfaakgGynD9u7Mp8uT
 xtYUZWddfUIGpUd9jE=
X-Google-Smtp-Source: AGHT+IHhsjuNPyIzKMUeNxY5Mwm+esAXfiuk2vgektFdvaaf7I657hIB3fs6YRjKz2bWk7obYFxGkDBmm3Q6PDNxfWA=
X-Received: by 2002:a05:690c:e1a:b0:721:1649:b070 with SMTP id
 00721157ae682-727f5648a22mr68472707b3.44.1757342413782; Mon, 08 Sep 2025
 07:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250830054128.448363-1-richard.henderson@linaro.org>
 <20250830054128.448363-22-richard.henderson@linaro.org>
In-Reply-To: <20250830054128.448363-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Sep 2025 15:40:01 +0100
X-Gm-Features: Ac12FXwwgwtZix-bigiwbIAlrULrTLg8Zc_nYKMGaTuwQu8P8XfMxdwGH5aikIE
Message-ID: <CAFEAcA_irevvN4jAtU9w2bXvEbcQ2gT2XcRGjYpP00QbgX5YcQ@mail.gmail.com>
Subject: Re: [PATCH v4 21/84] target/arm: Do not migrate env->exception
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Sat, 30 Aug 2025 at 16:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are not architectural state, only placeholders
> between identifying the exception and delivering it.

Yes, but is it definitely guaranteed that QEMU will never
do a migration or a record-and-replay record of the cpu
state between identifying the exception and actually
delivering it ?

I note that we do migrate CPUState::exception_index
(added in commit 6c3bff0ed8) which in theory would also
be in this "non architectural state that we consume
immediately" category: so presumably there is some
situation where we might save out the state after
we figure out that we need to raise an exception but
before we call the target's do_interrupt hook.

-- PMM

