Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ED6CA9ED0
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 10:37:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGDOt-0008T5-3X; Mon, 12 Oct 2026 06:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGDOq-0008SA-Mm
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 06:36:56 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGDOo-0006Rn-P0
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 06:36:56 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-888cbacf70eso19180087b3.1
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 03:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801413; cv=none;
 d=google.com; s=arc-20260327;
 b=cUp2yM4HLc+b8SS9RhRi2za1bdta0ldqO58WkfJnVTLAz9dUQSi7Bii52psrtRcdB2
 79qw6mDHjThkFzHdFi8J/bw3Ul/sgmOPARatHbZpU4Y6DJZVz7DyBeLPGOuvUrT2PQCC
 d9FbA5Vo0xB5AHyl+75JmNU3fikW0FGebQjKHGE1D94bkPajErmF7Pzl+js6/sX/PgKx
 zaCGWWE1pt41BjS52T9Sv7SbA20Mom9v/wN8Ky3gOtqkVvrStyvTDX2yQfZR1b212kZC
 ktnFTKCb9lXQ5EPTEsYm5RFhPN27WFkxQg8m7mKj7XIvBk+OELuhzdhCte5cF9P9UigO
 LBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Q4Pwj0umhNYnhJcqSnnypcfIwnJ9p2Z4oUzUhn6fJ4Y=;
 fh=+HFjpdpYJTS3BLVQzH87ap9apFTu3p7y9Tshnz6mjBw=;
 b=rT/Uy0oJg8Eb1+J8fc5J8GUa7rvJZI6ZEOKUrrdPSH+MbVusADwIEMOMT/8181H4cS
 51sqW03AA+Rutvm/VUoI5beL0BZwzpEyxp2aCpbt0jyo6vFzS9Teatk1cklG50YPMtM7
 mUakDEiwjHcUPSKcsVEKPb/tLU9aI3i7s50Q55Xvq4UcH37kiavjXamjQUxcxlhmC3pV
 z8oPTtAb5/+PUeF7AxeeuX4VX1KW12sL7P//HSG8b51of5kl1/OQAA+ODSSTIV4m30Dc
 w6SwGDCaEKyEUuRKl+9Fo3S46dzQhCuW6TGw7yi07P2VcitHXiPm8J2wAAYcTyC7rxyN
 v9kg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791801413; x=1792406213; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Q4Pwj0umhNYnhJcqSnnypcfIwnJ9p2Z4oUzUhn6fJ4Y=;
 b=PxLO/FOnj/wMShCPNG1Dp2eTzF6svOpzRVNqpuXuY8mRjWqE745PcE6H8bkQtNQfOe
 64VrPfkV0YKo5FtjnjL8taoE+JeF7BANMs1esp5RW80KmyYcNxWj2MxP9vGTF+EXWhpg
 ZYNsFSIeY51yp3vhP+lt8YI281z97Qar0dG+tay9KTURVO7PTHzIchyeJk4YW64Ul99y
 DoOjj5L5ImLpHQWZSQE7z5+beosst4NGaXzxBZAqqs+KJDQxlkuBw8pNzDGrlct28Q/g
 lX9Y3IDoppuDsh1AwrRaPZCOpBXdkeRAjE6MuLeks23hU63Nfw0xr39AHiZ9uHMoWhRQ
 A9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791801413; x=1792406213;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Q4Pwj0umhNYnhJcqSnnypcfIwnJ9p2Z4oUzUhn6fJ4Y=;
 b=MFjIskMfz4HYFjh8HlqVes42JlgmRP8eOrLMwQoNJqh/eoV536m1LyWFITI2bcnYmF
 DTy0ZpDWUIexwbyuCXk+MwM4RqlogDELfT+u5UIrXLaJOLv3IeqQjkA9GfeI5+HnZyVb
 RIuBx+m/2nt55d3oa6NSwg+27rKOkiVZV7P2/p4qrHI8e09QfgXd1AdZ0XDxlAfFqWH2
 /ZsKWlM86y/wkboM5skXTZE3v3rVr9+KltdZ1wyeDN/du2Lux/R0BwxNy01ROhRPtK5f
 rkymjber4TX2mpWoRM6CqkebAxm6fOFPVn3mCsQfvNtuKhxGscktMV7J9G4Y5Igrf7MT
 b3DA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzByEj3Kw9xADMT1X9Jl8q94THjYGNBrUjkFib+adrRkjaTuPgqz8SvRKR3rSkklimu/65s6SrHsQ==@nongnu.org
X-Gm-Message-State: AFq9FYKYa7wm3xgCmVyvptpnXxbylQdIulyiuv8zxjmb5NzSm0OmgQWi
 mVaRSgxLXsYV49XBIt3UoIwHnkRvK/4s+MvbxmsPAJoDbuiNMEHF3F2wB8UkPm+LkSsxFfmcgAC
 2dE9oIdOHBP8I3s04f6NtQQmWIH3aqyYKhp2wzmbrBg==
X-Gm-Gg: AYBFou3MR2pV6WoEXQKVlZqtPS9EJM2L0FsL10DslgfD73UJzhgZr1Q/XS4lCgQ4nhU
 cMSwcdU2/d7H/49vbFSTpsJKbcToMToB7Zf2J8mP2sbUv3qxfjvSE++3UE66S+H+5e37ITvz7ub
 d5NB4yi3W/SuOxhTjp5nieFp9MafZpdjQ+LjKgYjdY0XKT/PvonRIqniPupwiyyBa1gfGpPKqqf
 uD7eX1HX9Q4oOIZtz8LUI8Ms9ZguqoZ+hVfBEEqogIo8SiMhxmpAeqyLncZD19B3KzZ4BNCt5h3
 SxHgmPBmJUoGfnhOZFp9I8lmoYXtVTP5Hk6WW3n2i37zo+ERl420403GEUD8or99wKQ1WBD+d6R
 q/bV2Vjl4ypPh2NFvxT4tmTWTIHCVj0f2q8eExc5e
X-Received: by 2002:a05:690c:6509:b0:8ab:3dc2:a4d7 with SMTP id
 00721157ae682-8b07ed90e24mr30426327b3.22.1791801413399; Mon, 12 Oct 2026
 03:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20261010070952.323466-1-richard.henderson@linaro.org>
In-Reply-To: <20261010070952.323466-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Oct 2026 11:36:40 +0100
X-Gm-Features: AclHuK-20_kwZsKo7IVLn4oF9imCQm3d7Q-BGTahwP9XSW9HzvoyA4LdWoYWips
Message-ID: <CAFEAcA92eOaY_39yN9H-vXZ7A9=CSPK6LEOxbbKxREv_HYw_qg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] target/arm: Implement FEAT_IDTE3
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Sat, 10 Oct 2026 at 08:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v4:
>   - Squash accessfn when we don't need it.
>     Rather than confusingly add el0 to the access_tid3 switch,
>     complete the kernel emulation by squashing away the call.
>
>
> r~
>
>
> Richard Henderson (6):
>   target/arm: Rename isar_feature_aa64_idst
>   target/arm: Enable writes to SCR_EL3.TID{3,5}
>   target/arm: Squash accessfn in modify_arm_cp_regs_with_len
>   target/arm: Implement SCR_EL3.TID3
>   target/arm: Implement SCR_EL3.TID5
>   target/arm: Enable FEAT_IDTE3 for -cpu max




Applied to target-arm.next, thanks.

-- PMM

