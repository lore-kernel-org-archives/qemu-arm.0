Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB90CA1016
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Sep 2025 12:19:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uwgGr-00064r-Mq; Thu, 11 Sep 2025 08:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwgGn-00064I-No
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 08:19:21 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwgGf-0000ty-Um
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 08:19:19 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e96e5535fcdso1659587276.1
 for <qemu-arm@nongnu.org>; Thu, 11 Sep 2025 05:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757593150; x=1758197950; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zXI+GMvURQii7b2L96FtYP1AQ4kDXZOeUobdP7oHQ/k=;
 b=uIgIk3BetcWT3t2RDyYqYzu/Hh/4qv34/mf1/caPz2s2bnuROX7iL+WrCRNK377MkF
 e3nC3WgVqK7D5kRiPX0zXu/vrMJN0ZDlcfADD9UHHkJhvjkTPGSR5nAs3OitnE2lffoM
 xWTF+58kSakCcVMI+b7cZm9peyphlyGVkgnF8RmqOQcQXWt1Qcef+1eSdTjLrAocoXL1
 GgixLxPKztBMVpm5GHpnCzk39GfZxb8jyRPMzlIY09NmY9/34fQTIvApUohUBKh9IbZ/
 EqIitNfb8awL70PFJp6ne4Erh/lXP/EP/mwYtnGajyn2hUKvWXjmzW+wNBMENvd7D7Bn
 7PAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757593150; x=1758197950;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zXI+GMvURQii7b2L96FtYP1AQ4kDXZOeUobdP7oHQ/k=;
 b=hbJz/Qtgy8lzhazNFxP/BtQrdLfkakrMeD6w6/MmQOPOQsctQH8IY/UOojpGRGkTc2
 crpW/N1WKBh9Q4wokTQjlltAycbRlW9+ltpXUAa/K8blBJRu7w6f6dTQdw+VIsI/7NVb
 QHPBS/FI2+3cnUxPYs1MJtR6fKZ4Eo5VJGdmuklLxsnFaIfzeXEEFPoQdYUJR/h82M3P
 rUs4qXf0HsANB186cJMJrjKHz3D0lFPpoeBKELpvlxm6I2c8QeULwvJUB79+KtlEJQ3P
 RKID+uxeKXcVbg3XuE5vBe3/Dra7nB7M79J08U6zsoTttfpgetKFL3Io0svUK/Ax0z2h
 tbew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAmZITPdmsoo5FkEqxdkZtFB7f5Mf2DOeD2AB9r4wJ7vCAR/MxDseXa6Dnm3jPM3ILVOVuT9TJUg==@nongnu.org
X-Gm-Message-State: AOJu0YzuvHZ/QSiWeD2xUZ05TXngueM2YwZmr9CMJfhrS11FzLQBMomV
 gjsg3E0Dr7bq8omOlWx9UcizZeUmmyshpWtnaJOTK7lL6jU1uM3QmdSpTpagXv2LuWgUYJlv/Ti
 hNBdGLR+XewME8VSYHGGLoKW+P9T3JX+Y8MxNeL9ci0EfqizTbA4h
X-Gm-Gg: ASbGncu+L8AjgLqIobH44D8WycSFETEcIstnSyBcDfmyDvCBUVo9wYQIpaO4KoajPdc
 yUvH36dzOirx8AgazkOrEyjERWnkAbKZRR+e3ojKxMo3IuGJEufr/fy4YUmtS/i+pxRO/24U8BV
 Jan75BLNsjwiUdMSKPLyQctvwlxiGm+BXRmlyExNNAP3netyQ87r4hGAzfmQothgx3H3OtM+Tk/
 gbGAZwqIEOZQASO8+kRB7C2U703Dg==
X-Google-Smtp-Source: AGHT+IH0QB/NzfB5m53N60418CHu1jpf4Dij4QAxzyt9Wiu44M1hoCmMaGiOCbmMbJtqm9OWQ/27g70RDtR5gfxINNo=
X-Received: by 2002:a05:690c:28b:b0:729:d9a1:cdcc with SMTP id
 00721157ae682-72eebed04d5mr29921257b3.13.1757593150233; Thu, 11 Sep 2025
 05:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250830054128.448363-1-richard.henderson@linaro.org>
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Sep 2025 13:18:58 +0100
X-Gm-Features: Ac12FXwlBdjBpENTVDr-FjbLObMOiBmpfmFZjkTSkLuigZIQLgXwTi6dRXfYuP8
Message-ID: <CAFEAcA8-U=+OvEVYcNQkt20DXsoZKqcuD9poqKsH=Ls_0tuEYQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/84] target/arm: Implement FEAT_GCS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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

On Sat, 30 Aug 2025 at 17:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based on Peter's tags/pull-target-arm-20250828.
> Tree: https://gitlab.com/rth7680/qemu/-/tree/tgt-arm-gcs
>
> This includes the prerequisite features, ATS1A and S1PIE, and
> not a prerequisite but closely related, S2PIE.
>
> This passes the linux kselftests for gcs, with a 48-bit VA.
> I also include a few smoke tests in tests/tcg/.
>
>
> This includes a best-effort linux-user implementation.  Since we
> don't have softmmu in user-only (yet), gcs stack pages get normal
> read/write access.  This means we cannot write-protect the pages
> in the same way the system implementation can.  But all of the
> other parts of GCS work fine, which is good enough for testing.
>
> Changes for v4:
>   - Rebase on target-arm.next, which includes all prereqs.
>   - Fixes up the minor conflicts with the elfload.c split.
>   - Include Thiago's t-b on the system-mode enable patch.

I've now gone through this patchset. I haven't sent R-by tags
because I didn't do very close inspection and other people
have already done review (thanks!). I have left comments on
some patches where I saw issues: 21, 26, 50, 52, 53, 68,
but the rest looked good to me.

I've applied patches 1-12 to target-arm.next (the FEAT_ATS1A
part). Unfortunately the first major review issue is in
patch 21 so I couldn't take up to FEAT_S1PIE/FEAT_S2PIE :-(

thanks
-- PMM

