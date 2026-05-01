Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFE0CCFA13
	for <qemu-arm@archiver.kernel.org>; Fri,  1 May 2026 13:27:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIntC-0005S1-5J; Fri, 01 May 2026 09:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIntA-0005R9-1U
 for qemu-arm@nongnu.org; Fri, 01 May 2026 09:26:40 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wInt8-00026n-4B
 for qemu-arm@nongnu.org; Fri, 01 May 2026 09:26:39 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-65c37eafcbeso285838d50.1
 for <qemu-arm@nongnu.org>; Fri, 01 May 2026 06:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777641997; cv=none;
 d=google.com; s=arc-20240605;
 b=RJ2KJ6nobqzDtKcb38kPMClF1I6WvDeQBjBekg6m9EA7J1dLlfAWHoYKqFpyyDAngg
 +mQA2hPuNVSf+u4eMSEnVY20Lr+yeZBwC49BATggfhHVdL0GYrqKLt35nfdJSoD/ZrHT
 xQgJBBtV8N1qFeQ7YFf5AgxZQtpiJwXIJElRzFDfD+ebMCRkkR/DM91e5Xch2TWCO5/C
 JbhlSa+k5baA2Fiz9yaptieOhdfLHl59+bP0i/N+1Brqz5NCu4wdaqQQOQalb+BIvyCo
 d1tF7X90DqxhKQX1ewNwvvQLGD1zrMN6ReClcmTNUKcHtIm0UDpJXaaOpVarvgb3YJTK
 T46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=ZdKGHo6oo9Cb8ca2wioUB050Gq3EF1HvVEUamfky4FU=;
 fh=7C/xDuxq3vUwWD/OakVqEqdI4JhgPfTUvwU8jQtnj4w=;
 b=E4MZeumIeIpalhCY6et+b0rAXEOBXf4ga94lsO4J27bkCCr56CAxjjDoNgbvDNiONH
 9i+w9N0GR6YOhr/x9vT/SqqaydhMUmvW4pjl0KP5KJc4guUF/RSpl43hXuPjf134437t
 d7lj5HPBYyjmG92NjqH50R46VmuWwIIJr8P/9+mSwIKAJTuUkS8UUIbwocFwSHZ30mST
 n9xOGWwUjc9m8L75A5OnK3fUtYjZI1PqJgUXDR4gvVOXfK6scR1shN6m+bgLaa7kcymL
 ju44dYzag2NXoDkj1JFt63OXEtQjzT3QcHV0VVwqrJuul6rZbEj06jtYNfSddJSVssRM
 s1gQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777641997; x=1778246797; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZdKGHo6oo9Cb8ca2wioUB050Gq3EF1HvVEUamfky4FU=;
 b=J8vJeejMSlKwENsQseBwF1zfIVk/XBsnJw1WpEYaLZdiALfkXftCulKHEKF3EjTm4U
 tjKTlTh8kDq3LbfWmUgFsO5XO+HKDQC9BBgDPkBRRavwIb99kkdAMK91mdHnJxAHgwUo
 NyFEcvahOqHpj6mdoAB/xzxFSolajLULVy6d9yKDYQhrdCErLmQLxXw+KrFzOXo6QV/J
 D/uOcaQOYuX1FZl0vXWCRizyd20tnv6C4KkOG9QoGve6MKQZ4o/hYT+ZLWVCorEsdbq6
 Z6ahFLYhwFDOg4io6HzjFZDhuR2gMcrIH9k6zOn/qrgdpQIfX92Kxisk5/xACtyO/7EK
 tgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777641997; x=1778246797;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZdKGHo6oo9Cb8ca2wioUB050Gq3EF1HvVEUamfky4FU=;
 b=b1mXkVmtA+DjrKEHHZSl5MS39SWawRIcvP+HZc75oCT3dkX3qzkBcB39cIKD+Czpk1
 pv3ffQMzyEmvLAjGUV3VmMmd3FTBd5zx7xTab4PA31oaUXlnUDB5059JOXPfSgsS5trK
 FPHUF7gAE1ACpJ3TI92vtTeOq1Zi5pd6aW5hOMgAOCjKV308TgHW+M52jixVaOJRlr87
 zyBtg4cnWMVmBoNQjSZHu3C+Nby6g6kOYSbjy2SncKZe098zQ2uo3zlZTYgVymqT0Wtu
 KCTg8HPyc5W+ojkcz+0urvEPchnRxBtZhL8XhEN/Skr6pmNtHE8UzHNI37crD+SRAetP
 IW1Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+LU9/Nq/EQuAYwiVBIPqdELsUtlU9NNEPC4m4lyLtqijArEVY+BYkVc9SjvJkZueLIoYmFsSdH3Q==@nongnu.org
X-Gm-Message-State: AOJu0YzdfD4T1wNSlsO+Yg+Jp/wbDriuAk3kLro7IDWDPpOBX+RsATkf
 9lIr06LR00LVv2SuDvFx+rleyI9yIWA3pQNun5069zC1k6DpJxqMCRTLN3ZqtdXbkDTh4RmUBBg
 VWwJ6YWiyLsEvbrGpaLDgde/pvXC4BJgGSkXnCwbITA==
X-Gm-Gg: AeBDieshmWQJToYFO4ILt7JTYQCF9QCbTHF1R8l5xiqfVnA94ezTdllf7SUEZ0BntuI
 6+xduB5Xwz7my8EoxDY0hDe2Hhp0Y6jTMEeI0tO2Vofk5jELLhCBhiL9f2SW8XymWZkoBjGHQ6I
 rIpcfm0Ec7B93aKXhS/lZyUtYpDfPem3jQGjqAABz4NXH9/f7EoGOjkqLD3Z6MVCk49HaGLBeFI
 IjF/6Qe0x6ms0TkPHM+1F2ovUkU2jiJNadbM6ocYcaoINP2QZ+vYm3uXZYIEsguUVrJlofE/BqS
 9FXlvrzRnAfs6LiDDvOYOggQs5w+XONJnVyrq++8LCiWimtGJ7aNgmkPxwel4ZuXAwdTn8lwu0z
 Ikg==
X-Received: by 2002:a05:690e:4259:b0:650:3064:4cf2 with SMTP id
 956f58d0204a3-65c18aee941mr4704287d50.5.1777641996611; Fri, 01 May 2026
 06:26:36 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 May 2026 14:26:25 +0100
X-Gm-Features: AVHnY4JGIrrdf9PSbpR1pXeS2eLOJL7gDMGm71m8-KeQxSXmtU5YSrFg4qAJ9P0
Message-ID: <CAFEAcA-WB+vfiHZpPut=AdEOCXacsTfrvxiGAmhaGH1abHD8ag@mail.gmail.com>
Subject: Future of target/arm "max" CPU type
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jim MacArthur <jim.macarthur@linaro.org>,
 Gustavo Bueno Romero <gustavo.romero@linaro.org>
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

This is something we've discussed before. I don't think I have a very
solid grip on it and I suspect I may be missing some parts of the
"problem description" (i.e. what are we trying to achieve) and perhaps
some implications of the choice. Overall it feels to me like a "no
obviously correct answer, make a tradeoff" question. I've written this
up to try to clarify my thinking and canvass for opinions and for
people to point out what I'm missing.

For a long time now the arm targets have defined a "max" CPU type
whose definition is roughly "all the features that QEMU
implements". This is helpful for:

 - giving us a way to provide newly emulated CPU features to users
   without having to define a specific named CPU type matching some
   hardware that implements the feature (which might not exist at the
   point we add the emulation, or which might also need some other
   features we don't yet support)
 - giving users a way to say "I just want everything"

Mostly this has worked pretty well, I think. (It can cause problems
for some workloads that break when a new feature is added; TF-A
firmware seems particularly prone to this.)

However, it doesn't work so well if the architecture decides to drop a
feature and mandate that newer implementations may not implement
it. Up til now that hasn't been a big deal, as only a few very niche
items (like FEAT_DoubleLock, an old mechanism for quiescing external
debug before a CPU power-down) have ever been removed.

With the Armv9.0 architecture, a big feature gets removed: support for
running in 32-bit mode at anything above userspace (EL1, EL2, EL3) is
not allowed to be implemented.  We've got away so far with ignoring
that requirement, but as new v9.x features are added, they are
designed under the assumption that there is no 32-bit system mode
code. For instance, the GICv5 CPU interface defines only 64-bit system
registers, and our non-compliant "32-bit is actually there"
implementation would give you a 32-bit OS that couldn't handle
interrupts. Other similar (or harder to spot) issues are likely to
also turn up.

So my suggestion is that we should have two new CPU types:

 v8-max : "all the features we implement that are valid
   for the v8.x architecture"
 v9-max : "all the features we implement that are valid
   for the v9.x architecture"

v9-max would not implement AArch32 EL1/2/3; v8-max wouldn't implement
any feature the architecture says is v9-or-later.

For the existing 'max' CPU:
 - on qemu-system-arm this would be a synonym for v8-max
   (since it must be 32-bit)
 - on qemu-aarch64 and qemu-system-aarch64 this would be a synonym
   for v9-max
 - on qemu-arm it can also be v9-max, since v9 doesn't drop 32-bit
   usermode support. (Though we don't currently implement qemu-arm
   max this way, so it might end up being effectively v8-max until
   we get round to implementing support for selecting AArch64 CPUs in
   qemu-arm.)

I don't think it's worth claiming 'max' as deprecated and dropping it:
as an alias it's trivial to support, and there are a lot of workloads
that won't ever notice this change.

It's possible some workloads currently using "max" will need to switch
to 'v8-max", but I think this will be rare: it would have to be
emulation of an EL2 guest which is itself 64-bit but which runs some
inner-guest VM within itself that is 32-bit. The failure mode will be
that the (outer) guest will report that it can't run a 32-bit (inner)
guest (in whatever way that hypervisor reports that kind of error).

So that's my sketch of a proposal -- what do people think? What
have I forgotten about?

thanks
-- PMM

