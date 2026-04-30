Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D23CFF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 10:46:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIOu3-0001gg-IS; Thu, 30 Apr 2026 06:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIOu2-0001Vk-0e
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 06:45:54 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIOu0-0005kh-H0
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 06:45:53 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-7bb0d18c7f9so7978677b3.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 03:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777545951; cv=none;
 d=google.com; s=arc-20240605;
 b=P+191CTvrrwO1wABzPuSsUux1vi2tQ1xvzH4WURdMSvFIuDvuuuUbcpU0L07Vhy1qd
 KKoYBgv5yrhfrRUC41MaUEzyGe9XTsWMg1iqrfR4DXMWqeNGElya12TROZJs9lwuVtG4
 qyJllXEr9hpxizQgsN0/mczOKz2ReRLqyIlLsgjNGwh4aK6JFQ4bIn0KxlWkXzAAfSV0
 8tyXSuwOL4RSgI7msd9aRgFwOxJlNPO2XWDPzcS/SsIMkSKrLnrOOA1Yr+ZfoMoXxUMo
 h2XzTlzE23s9mkGZ66SIH9ZpLzbPFXy1+Y3PSk8jXyOPXECVPAYd/s5Uta3UmvHcf7XG
 jb1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=BHNxHJBuaO20juKE/pLga5H1LtRXixgb5UTlH1CgSfA=;
 fh=+qC5O8rA++MRXW1VhIpFZ2ZVHgzYJeiVRjde1+dPNgk=;
 b=D0PCbQYw3fVQHAiv9K0Oi3YZpUzGqDRVggvrd1ypYvV9Pxz2qIyKzM9J4GS1wyCETn
 M4U6r+RhFTSBxBs3K+Mw1n9TeeSMk0QAt1CeGhhdeAa56jMMlGEy8Vy9YfMhmfszVvrY
 sjbg93E89Ufm9aT25rqYIfCjUDIrWQsKmRLV1J22ID/fGSGbtO60HQaQQkpeQHGY+pdz
 com2av20j8fpqcpjaMGjK3J00XOvLVGuIFON9dogzixChsOBkPHp+CAxLOeAHL70AGIY
 Ly1OUNaeMNuL+6rpInH70SraxzHGUuFqZxt11gX3bKvlAnQRLs5IQ16WVPb18JH6t7eK
 EBXQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777545951; x=1778150751; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BHNxHJBuaO20juKE/pLga5H1LtRXixgb5UTlH1CgSfA=;
 b=ZGrEWOvcWxevGpL8LuBKhYBuFpoedPXj+U5YibHsiv6U3ZiVOiTnreIPKodovoZJZ7
 thbxRqIKhpO8vHtTlJ0dAKKQUh6Gx+I5mUIC9pGokOxxheWRZZwBO/Sx/awmyYdiUJJ+
 EYe03IOm8QoHkaDhQ23Y3l6jhlrswDTgfsC4KNjkq4N3JfbAXV1EFbXSgywGMAMsmew4
 Yrmy68qqNR+4p9FBYdLJghA4LFfeCxQgGJGwxUSiJhEo4I7wX9ak2++DWvWN03Ov6zeV
 Y4aQW4iuF826AOFYm4zFgcAzf9KKd7fkDsu2H91iOgHg19S3OQIrIDWQfSeyah81Z8XU
 1k9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777545951; x=1778150751;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BHNxHJBuaO20juKE/pLga5H1LtRXixgb5UTlH1CgSfA=;
 b=XgZtHN7oybHMORjwDYagPIr7SxNaRXQvHdcZa7+gkC9PgqMxBKYCW7UFaWk6GGqqkS
 n+Tj3TpfUtadvl91muzt/8MBWaYmVqcr2bUsFvWBB6NNa9ivq01bPPQCWDhgWpT96MKg
 jpqikq/f33bYQa4QmrjueaLpgOkjB7m81Kq86XZak7FyXPyWyXMxTR4YXm0p66FOcqyX
 FbMDH1xfPjBHFgSEBmc/bd/aVnc7n2x0mR73FVSSPc6XREYZM1PiasL1vlOgNZ66Uawb
 kySrBpbBun0SEu2InB+pPafuh0XZBkuVopvDoLsGfPZCd2Bo6db+1lmxctVZ5yPC/VjZ
 uOHg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Th9CS7D8DbURgjtGPLjrye+f1fmLnfYMUt02estpe0gx7ltbzsNKMAFFeuXh6SP8FB/GoWxzIOw==@nongnu.org
X-Gm-Message-State: AOJu0YxTfJs3Okz6gBudsy64YmlVV5HexT4TLEPyf5Fr3k0lMPNOrRfV
 7COphsVhlh3H2GvhH8Rb6B3gS5igF3iGbi5MNhQ7Q9Zh+c+XBwN4M/rAJAlYZjHRYzig6XkuEXq
 T1lD+TnN4eXLXt/QfHsViL42S81G8sAAvNq4zMUVYGQ==
X-Gm-Gg: AeBDietr6z5CsA5l9ohhi7SwDKTlZFtPHT3q1ZuuAisQiSPLvlZsI8wsf01izJhkapm
 u8UFV+PBeEXAM+8dQWVTSjVDx8TyUenJhSsaQXZd+Vvt8w5s2oEWkMbqbKdWo01K6p4egAv5qWw
 2bApb0NYS7pkLwmRIl/Hyy7rOEe5sclgsdm8DEK97SPTJQ5uM90UvHB/rpJyU8Nd+TuGp32uDHL
 chDGEsxH0TQ5hOiiJ9NqBlA/MTVrWRQXaxaQUjdQ0pqN13N618tPVogGfhdrtKttnwTFdDQf9Yy
 pyZw9iMIR+Gr2gBS0SYV+DpyLooxjmtSarj2yRcFO/ftN8AOZouxfaskx3/HAsK5ROMpm/g5Rlu
 bGA==
X-Received: by 2002:a05:690c:dc8:b0:79f:b903:88be with SMTP id
 00721157ae682-7bd5286ec35mr24805137b3.16.1777545951020; Thu, 30 Apr 2026
 03:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260409035015.132370-1-richard.henderson@linaro.org>
In-Reply-To: <20260409035015.132370-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 11:45:39 +0100
X-Gm-Features: AVHnY4IYbt_Y4eG0oHQudzG_zLHAvsPw9rSRj-bEwJ6YRJpT3_MD5jjAzA_UR1U
Message-ID: <CAFEAcA-mEC7feX5r=W_bvawe-sFdO=8neP8V4-hvYHFYkugeZg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] target/arm: Remove bswap_code
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pierrick.bouvier@linaro.org, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Thu, 9 Apr 2026 at 04:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20260407222208.271838-1-pierrick.bouvier@linaro.org
> ("[PATCH v11 00/21] target/arm: single-binary")
>
> Version 2 here should probably be RFC.  This time around, all
> instruction loading, and more decode, is done by translate.
> A new CPUARMState field is added for passing data to EXCP_SWI
> and EXCP_NWFPE.
>
>
> r~
>
>
> Richard Henderson (7):
>   linux-user/arm: Restrict regpairs_aligned
>   target/arm: Only define aarch64_untagged_addr for aarch64
>   target/arm: Segregate target-specific user-only fields

I've applied these first 3 patches to target-arm.next, as
they're good cleanups independent of the bswap_code parts.

thanks
-- PMM

