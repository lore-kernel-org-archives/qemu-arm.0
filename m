Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DF9C83F27
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 15:18:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueEke-0000hh-Um; Tue, 22 Jul 2025 11:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ueEM6-0002qX-V4
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 10:52:45 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ueELz-0005H3-Gu
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 10:52:33 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-71841a48502so45672687b3.2
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 07:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753195945; x=1753800745; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9tMAznd+1SsHvYjdRnM6O8GnkwB4nBWumHqcRmHHHUA=;
 b=W+9ftDjFJDFQxsmM/JXv6Lndv8oYNkq4NAdTDxMCSonhYed2MOPYxnPdqEAfSeHsFr
 A2Hkj1A9g0FJiI+vWOAJfsWgJGR+FHxgT55iiPsqM2ibhyPAGpcJ+x6dNbuyGt26Q+qv
 y/WhHXuJ7lZEBoNAmkigJRjpB4NrFfoEaIgU/Xr4lO3bsfNdgsOFQfrhsCdOvRtYr56n
 DwftzpwUhyps+BERvW+9D2NdUY5e8X7lWPR/oyX8tUzftxeFRkQCkAGPzbrrydSEBcnX
 4s0SyfyDUOPEfKGfEdzGGhBqy2qsje2dRUzjQxm0F+lrPEz852R4snShK8cVhHRbDP0/
 QF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753195945; x=1753800745;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9tMAznd+1SsHvYjdRnM6O8GnkwB4nBWumHqcRmHHHUA=;
 b=aCc8xyvxML6IeJCR+bgSTUv5PTQ3QPBLdhqgtT6NLY78YKFvSgadfbajS9iddMd6YF
 XrZO/+ZM6qGQfGSVBx4es5uM+NaAYAXW8NHlh9/SkzwhTh/HXsMl3QAMPSOh9nAVuQEB
 ebIPoQ/7v9epYeuHntrfiofcCtWJgJOwSk8wG7gNR7IK6Vq4hxAKpf9oSwv+vdL2R6Dz
 A32hIFRh5AY1NoNx3SwRptlJj2QWyGD43Ela8+lhb2Ven/an3QBu0kU5D++Wg3JnowIc
 ZobgMez6TwZ1n3GcrZqizTErQSAITYV6J+a0NB/2UqF+ofeS/hpVYraEzRgmbP4g4AQH
 /SkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3mvmtTMm4+3Gw2rC78k6Bs5NrzwWFWI2jPZaeIZm3eXb/zuBl6mfRGZaPHm65JXnlQ+00VOKAbg==@nongnu.org
X-Gm-Message-State: AOJu0YxC+ZJ+XS5PrYOgW3isMZsKeUNEWej+TUITKdshw3JR5lzHvQ6F
 XvLJV3m+z0Cw7rJzxtsg94nAPrX2+0Erk4LstSehvmJBGb43eZyzxw1OmvwGbPXL+U5xHwKK42d
 zqE6DVxqZ6RNiAPFlF6KQo7AxyobaSf+IVfxUInwYxg==
X-Gm-Gg: ASbGnct0QsBwg2smbuDOSi0xg+W4OMomgs5NRtT/qBgrygYz3mh7cAuWhShnyCJLkam
 tcl/mJwMmuv7MUzPxIlkg0gR8vjVoG1+KNTz7VmJc3oUa/0fYcXZfbBngYiKFyIYaMaEWIXP6wD
 CIpPbNbAVPGHgxXfL8CXvEHl3DGRiKMEqQEnoOnPfDRocOh06Qg7rhKycUFx8Peu1yBQ7VcKqvj
 WrUxgx3
X-Google-Smtp-Source: AGHT+IE5qFIMbwaYuUH6u/BvpN09BOrsZRQzHQ8BAYN3YdC6l5JN7M81YtapWCKTezMTckW/wWefj9qxC3hxFRFuV8w=
X-Received: by 2002:a05:690c:6d0b:b0:712:c325:2965 with SMTP id
 00721157ae682-7183747ce76mr353740877b3.20.1753195945033; Tue, 22 Jul 2025
 07:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250722142358.253998-1-richard.henderson@linaro.org>
In-Reply-To: <20250722142358.253998-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Jul 2025 15:52:13 +0100
X-Gm-Features: Ac12FXwclOsTNjETPBBoCIuEyrGEguFgbyDYjcT2w3BtTlWm0EO7eqpNtQc6_uE
Message-ID: <CAFEAcA-_pYcxD+rCocqGJ5LpvE4S7dzf55wW8Nn=ggEDek9FEw@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Fix sve2p1 mtedesc assertion
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Tue, 22 Jul 2025 at 15:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Hi Peter,
>
> Sadly, I couldn't reorg mtedesc as I hypothesized, because of
> different usage within AdvSIMD.  So I decided to expand the
> mtedesc from 17 to 32 bits, and then pack the gvec desc and
> mtedesc into a 64-bit argument.

I was playing around with this today as well, and I
did manage to get something that seems to work with an
msz/nregs split. I opted to just re-encode the byte
length back into a fake msz/nregs combo in gen_mte_checkN,
which is the main place we don't already have an actual msz/nregs:

+    /*
+     * Encode the total_size into how we fit it into an MTEDESC
+     * and assert that it fits, whether MTE is enabled or not.
+     */
+    uint32_t nregs;
+
+    if (((total_size / 3) * 3) == total_size) {
+        /* If this is a multiple of 3, we need to use that for nregs */
+        total_size /= 3;
+        nregs = 3;
+    } else {
+        /* Use the highest of nregs = 4 / 2 / 1 that we can */
+        switch (ctz32(total_size)) {
+        case 0:
+            nregs = 1;
+            break;
+        case 1:
+            total_size >>= 1;
+            nregs = 2;
+            break;
+        default:
+            total_size >>= 2;
+            nregs = 4;
+            break;
+        }
+    }
+    /* Now we've divided by our chosen nregs we must have a valid MO_* */
+    assert(is_power_of_2(total_size));
+    assert(total_size >= 1 && total_size <= (1 << MO_SIZE));


But I think your approach is better because it's more
straightforward, and it means we will have space space in
MTEDESC for future purposes.

> Lightly tested so far, but it does fix the LD3Q/LD4Q assert.

There's also a bug we have at the moment where gen_sve_ldr()
and gen_sve_str() call gen_mte_checkN() with a length value
which is the SVE vector length and can be up to 256 bytes.
We don't assert there, so we just fail to do the MTE checks
on the right length of memory. I assume these patches will
fix that too.

thanks
-- PMM

