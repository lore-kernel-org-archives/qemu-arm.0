Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559B7C5516D
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 17:47:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wprK6-00065v-R9; Fri, 31 Jul 2026 13:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wprJw-00064f-PG
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:46:57 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wprJu-00082K-H7
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 13:46:56 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-66807ba2f0fso1773784d50.3
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 10:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785520011; cv=none;
 d=google.com; s=arc-20260327;
 b=ha3oC9Lpbpd46Wl4MUUDTOBq8Ew4vihspvHAuQoyMICiD+/8yrAkSrI1KkMztMQwrM
 C9Ghjeg8IV9iooFt6cw4XTABTo1I+0CT/i9xP6hW/yJ2NPbV5/WUpWm5uTR27BiBPa+d
 9DIpnsh6bfGQk23LFfl4qpW71AJhGL5cUuodKk2LYzAPzdUk3YouLqrX0xyKHfCW3O4E
 irpnhYpz1EIfD7hq8+ebZB84ICW5Q/vZ0ei4vqde5nOmn8xGr59qSBBxR7tw9PG/PWyC
 VB7lj4D8K7tjBpXr6fc5J0BBM4vxDXSGbK20DemW79Djbw7mi3T1vJ54XxYT/y+kjtb2
 wJRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nxVW1r7MPiFQtaZmJ6m7+lZfEOVo+HD0BGnYA/H8WSo=;
 fh=Tx2QSgFjFyIZXivJVbhq0giNz4eaBK1vlzuU6eSzhNU=;
 b=lOgnuNpDbU9hEf8Cm3ogOOEflpj5LGXBwuDkzm6JiSwRfB2/V3iAwWRmmajLwEQ0Za
 owRz9/J9oPueR79DGFN+JAblUyQx6S6VaCxy0d6pzRJoCe4tFw4QxpYHm68PF3GT0X4Q
 wn8+A+p3BJodxVLE7SawuYBL0GyCjDytLEKWqFnhl1sEZf5Vqn2FVwJsXyBx/kJodjaX
 FmdXO5XbFIk/CoUSm6IWQY5wyO+HULOz3Vb6pFS3mwwkOTuqj2UhY960ur1XiXiR+V2L
 /YN9c7UJXVUMs9zyO14wMsnOZyfmUxbfF1UgHfkfPCW5OyhM4K9ifDIZ140zhgMUQLry
 YWbw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785520011; x=1786124811; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=nxVW1r7MPiFQtaZmJ6m7+lZfEOVo+HD0BGnYA/H8WSo=;
 b=EJN/FErzx6qjDLawIOU8SgSXrdjfl8/c/QbKIaEeLAiaH2sJCQWEibLdHGuoXBTflY
 WwixKQLxfs+JI1TkvWEKoG+Po+aoR0effehqdgJCBTC86RwXaLNI5aatRc+B7GrLh5aj
 Rw21dbosgTBx30Dp/SsNI10HCl+QXENrpaeC18JfzIKbybTtnJYYnW3JU2mFOgCXeSZu
 h82elhvAmu5HNUp6HqGq6FP5w9uZQVuHr0VuTYmYZZrWgfkAcT78s+rgcckjLmETxSO3
 Z9jBCBw3wMqs+IpoU3V+7IdjfS8F2AOdW8pySoBiJIT02RhE43ZqqEoV96DjCe3agNbn
 rhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785520011; x=1786124811;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=nxVW1r7MPiFQtaZmJ6m7+lZfEOVo+HD0BGnYA/H8WSo=;
 b=ewjU9KCYsflog65UKeKAWLvatTs+k+3vGZiosFIX8V0RUZnazA8CEx8CpH/6aNDpBY
 dIwPYyxQLrwlVJ62vXDDG3CmyQD+z1HgKHdmMtehxVdru6VEL4+hrpkcqtPHQsASuJgy
 BUB8Ztee8ZH7zZbQ4k0fSYNrIaz7oklEdUNmA1sB3YFt2KsTWbn16by3/dKkekoUOrWK
 SbvLTF2ORvz+EPb783xc1bzc0TW3WPbIXDpQHKWPhSKqnxRrrTLFP3iVzmidJHYUjoaW
 056GqHpzlfrDL3Grs/4zJWFqlcRuRVN3hfGtSxXJ0qWPDTP7aHl0w4z9cfmsccSr0m1J
 o0rQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqgnMA3w+LKn4fH+h68kWiSnfKe8YKdf7os49DbLxWiulDTnjgb+8LO/3UTcdOXAAH5Umjx5NTmJQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy+ppoHBbiV+IPPXHWNjUcIBhWDV1iUefhYypVVaqZjgZJAcUP4
 QvWElC11RsvoW+GTvebTUNVN7TbcC5r6txFAK+X0iONRVhbmLtWMvdF9/8HlUO3DGLJzN+6KBR2
 H1+Lk6tkfWlXW5xJchjZbjCPfHkNAM4TNcLBlVKxjjQ==
X-Gm-Gg: AR+sD13tkPjOqcVLXz9fPC2f6lJj3Alq+sTf+1DtplsDe7wx1DG64WIyS6NUzc9vSlr
 1V35McSuomu8A19HfPotdpEasmOlu5+tmrPOgdgI6pCUXEvxKCavuQNwz4r66BBHzMndSbRN5EM
 AffXamNklg5t2LqYcwiiaSi2T1VAi/B2zoz95j7Zj6bcFvlAUw/u176PTwDoT9gbZ+rwGymXdI9
 pXAhDR/R8w9aNdfwgOQ7Nd7T5/fS2z5Vv4BJFpU3dXTEUd6ifn/V0EkQar8bqmnylWKnr9y2VWg
 uQUPhwbio6kHw5VKWPXCWQ4NgBHF1OpKyCMenT8pE+By6tmCDAIZqKONI2h1FN0MrewpCGizjJm
 qRLMxLrZw617SQ8X+e3yxbgoUWuLz
X-Received: by 2002:a53:db0b:0:b0:668:568e:8618 with SMTP id
 956f58d0204a3-6694efde7fdmr879479d50.1.1785520011068; Fri, 31 Jul 2026
 10:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260724031123.76597-1-richard.henderson@linaro.org>
 <20260724031123.76597-4-richard.henderson@linaro.org>
In-Reply-To: <20260724031123.76597-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2026 18:46:39 +0100
X-Gm-Features: AUfX_mwlwSiLwrDKY0AGcE9mtDwX06M3suwmRLlhqqzpw_kDHrEGeCtiPIF9jd4
Message-ID: <CAFEAcA_5gcPt2cvKDHx24KwNYtWs7Z2--Qeh-8iBqPaukLqwtQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] target/arm: Implement HCR_EL2.TID3 trap on undefined
 TID3 registers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Fri, 24 Jul 2026 at 04:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> It is IMPLEMENTATION DEFINED whether HCR_EL2.TID3 traps on registers
> within the range which are not explicitly listed.  Previously we chose
> not to honor the TID3 bit.
>
> However, with FEAT_IDTE3 it becomes mandatory to honor SCR_EL3.TID3
> on these registers

NB that it's mandatory to honour HCR_EL2.TID3 if FEAT_FGT is present,
and we already choose to do so for V8. It's only V7 where we don't.

>, so we might as well honor HCR_EL2.TID3 too.

I'm not in favour of this, because there's some complicated
history behind HCR_EL2.TID3, as outlined in the commit message
of 205ca535ab ("target/arm: Correctly honour HCR.TID3 for v7A cores").
I would prefer to leave the trap behaviour as it is now [i.e.
"on v7, trap only the specific registers; on v8, take the IMPDEF
choice to trap the whole range"], because the wording in the
v7A Arm ARM is rather vague. I also have a feeling that I looked at real
v7A h/w and it didn't trap these, but I might be misremembering.

thanks
-- PMM

