Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FBBC5DF7D
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 10:27:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxMSf-0004m7-PV; Fri, 21 Aug 2026 06:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wxMSe-0004lh-OU
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:26:56 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wxMSc-0004tQ-UU
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:26:56 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c1c50c1e29bso132460866b.3
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 03:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787308013; x=1787912813; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Dg3CiEYsyDNW/bZP32EasqmYY+4b11u/dJQBRxZREow=;
 b=aUeeCCc+gwt2922cYUW5X7I0A5uecQLo9NSAalSc+JCY2F1wIVJlQGrlyf7Prz0/AQ
 DINS+1olAJ2xfgl4v/3wiHoesH3gdt7Ro+H9bK/BmbrOBZSmqgDUWjqnzfkMp52Fsume
 Iirhb9mvO5ydIEet3+eotLyOazENxYw+DTaOXyz+U6GIa76UUC6sBQBlsfq46ZJ9Y7II
 69iZ+CxQaFWtTk/yUxj3Qjzfzk219b4odwDJYkslXhIo+zZab+ryTCxY8zUxbaP8+cJ4
 tJt9nfsPuT6rvJdjT4LuSzHMdpzuOFTpjKKL5OtVUZHVMVUj3G6bBIvFGOTea8mXBksr
 qHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787308013; x=1787912813;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Dg3CiEYsyDNW/bZP32EasqmYY+4b11u/dJQBRxZREow=;
 b=MXn07YD0eI7JuR+gKh44TvpT4alqpaaUqYcrK/rMwcxJikXxXtQVpmP1RYjKgh/fdz
 3TIKSMRo4vU4oWzf+rFJLiDCyrapQQAqfeeW5OZqAiJgE5f1gWgPWAEk8ZZnM9fObmb+
 X1BGF6SKiTnSxnvWpAIcF6KZckCkODaYv1UdX3RGtW9pmnAsIsJV/pu5RxbmIXc+wfkI
 Jz3Rp7puophpf+CxIFosTdpb6rQP5g7mRKEey7GkEETvq4R/4YBZLg5kTpr6IdpGQ+Xt
 0uNo0xC08eDzXzc0XXfb27wU4qLop9QRe7jwnL0T8MvH0nJmhK/Db2duMHiXBBaSQhaI
 cKQA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrN9W5H5GW+EZ5DWYFsbmALMPEsumVuY8snRl5UFfI0f+5dB+J+BGRo3Fkm9BJpwyt7U7WRU7mtgg==@nongnu.org
X-Gm-Message-State: AFuF++m+10K2fejV9Z15Nu5j24N1PYqcFsxFHiBRiFPHgPh7x8rSaUXm
 VLaIqnuHdYarUw6pEGYSBgvEaZT1FxZLDxkuYj/qfmeAnx2WZTKW2g+V1BBANNpUOhY=
X-Gm-Gg: AR+sD13xeMSm2Kx2TobmLZsL+U5bswg7feIjsPrezGhq5k023ojR1lCVQj/WvLHDie2
 +u9Me4inRn5n2Hho5miHNQk2BNT4lVBZdkxilSC/B7tFHoRGECdrxaMxckDyZzDmjxIirlmudby
 f4zQPstuTMaSp1TNRL6yFBZ/3yhj54sIPRNtAQWt/0XdGONztCClrGlultnFpe2y7GtKNqCgm4u
 7nnHauDsXIPYOa81mXpvZrBlv07K2fsv3LhASvmaYuT1RfYM4k7RLT4fx5OXI3vlFR9g/oUQOtj
 dYMlPcYC3wIDgxvfHgvGspWFJm84NtK49fpL+mZDCzM5dOdL22j2t6OK7bDKDAK3jrQwCxlz9rt
 bEBYp/8QN9B5JsjwJAGoQv4Aneht2478nzeko1JPIvDQGJrXUr0frQz9aRIwZ0wKT7omsiCKBh/
 45MR5z4p+8QpZmxiFhTxH8eTACwH9kmxDL984xPEunkAy3sBvokpqoet/WxkGO
X-Received: by 2002:a17:907:842:b0:c21:74ad:8b11 with SMTP id
 a640c23a62f3a-c246a60ca24mr510962366b.15.1787308013032; 
 Fri, 21 Aug 2026 03:26:53 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2459222200sm374475566b.56.2026.08.21.03.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 03:26:52 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E8AEE5F809;
 Fri, 21 Aug 2026 11:26:50 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Wadim Mueller <wafgo01@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>,
 Bin Meng <bmeng.cn@gmail.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: Re: [RFC PATCH v2 00/14] hw/arm: add TI AM64x SoC and am64-virt
 machine
In-Reply-To: <20260820124824.618671-1-wafgo01@gmail.com> (Wadim Mueller's
 message of "Thu, 20 Aug 2026 14:48:00 +0200")
References: <20260820124824.618671-1-wafgo01@gmail.com>
User-Agent: mu4e 1.14.3; emacs 30.1
Date: Fri, 21 Aug 2026 11:26:50 +0100
Message-ID: <87qzjrojkl.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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

Wadim Mueller <wafgo01@gmail.com> writes:

> Add support for the TI AM64x (Sitara AM6442) SoC and a board around it,
> ``am64-virt``. The model is complete enough to run the stock TI boot chain
> end to end:
>
>   ROM boot (tiboot3.bin) -> R5 SPL -> TF-A/OP-TEE -> U-Boot -> Linux SMP
>
> This is a resend: I posted a first RFC back in May [1] but got no feedback
> on it. Since then was the series rebased onto actual master, reworked for
> style and split into reviewable pieces, so I send it out again in the hope
> of getting some review.
>
> RFC because I would like feedback on the overall approach before polishing
> further; see the open questions at the end.
>
> [1] https://lore.kernel.org/qemu-devel/20260528211210.74266-1-wafgo01@gma=
il.com/
>
> What is modelled
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
<snip>
> Open questions
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>   * pc-bios/dtb/am64-virt.dtb: patch 13 checks in a generated DTB (with
>     its source) for convenience. I am not sure a machine-specific blob
>     belongs in pc-bios; happy to drop it and have the functional test
>     generate it with dtc instead, or drop the Linux-boot part of the test.
>
>   * Splitting the DMSC: hw/misc/ti-dmsc.c is large because TI-SCI is
>     large. It could be split per message class (clocks / devices /
>     processor boot / security) if reviewers prefer, at the cost of a
>     non-functional intermediate state.
>
>   * Only one of the four R5F cores is modelled. mc->max_cpus reserves
>     room for the rest. Because the SoC realizes M4F/R5F vCPUs in addition
>     to the A53s and every vCPU needs a TCG context slot inside
>     smp.max_cpus, the machine defaults to the full vCPU budget. I would
>     appreciate a better idea than the actual "fail early with an
>     explanatory message" handling when the user passes a too-small -smp.
>
>   * The register-level stubs (DDRSS in particular) fake success rather
>     than modelling the hardware. That is deliberate, but tell me if you
>     would rather see them as plain unimplemented-device windows plus
>     firmware quirks elsewhere.

I would add one more which is who is committing to maintain this model
if it is merged?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

