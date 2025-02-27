Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp268052njb;
        Thu, 27 Feb 2025 06:43:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXKIlwgdOpCJdAJP9wzHcP/hENeACwmxlBzzz9OLgXznw+MTm8CmJHtRTNWTSplC1eNhSLp8FP98BgKAA==@linaro.org
X-Google-Smtp-Source: AGHT+IET8dhuQIGnM/D2xaFRmQu0vaVODr8apKes2VZBiGE2TiYxvZLrEzmJKUDlwFeuaLl2jMpZ
X-Received: by 2002:ac8:5893:0:b0:471:edf0:8366 with SMTP id d75a77b69052e-473813647dcmr90172091cf.42.1740667384791;
        Thu, 27 Feb 2025 06:43:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740667384; cv=none;
        d=google.com; s=arc-20240605;
        b=VSld6AcGr7Q3pDZmZjPXO8hYARsOaaQF75dh2ihn7ZX53Q9OwCkTVYgEbLZqiifRp4
         APOY+TA9KQsNHkAbPLbtfRuBe6XWNVkqku+auSZaHVJ4a3LMxlTFCue7nbZQRJoP3ntC
         FFZ1SovCfOmwAXHR210At8Mkda1qN/eV6776D13KlaDDUsmFmyrv9hw/zeiD/ikpph06
         2M3QHXxt9XBm10EVC4XeiIwoOo+Q4xSY54cJc9fpmrWBptlLJIo3MjQ4rZuSsUYSzoE0
         GcmPB0++n/LT2zYDohgLo3qorQMQ36A9NBP78flCmlZv4R0YShcbvRgH2sY641mFe7DK
         jWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Ocn/d1/FX1YV6bfS7ORusoHXK2VvAcMUIDGKps4AlVc=;
        fh=INHftBK+eErPMA/c1qJSnbmgqy9cZkH7tn0L+zL1vN0=;
        b=iVk3vsJVcZaCX3WBuLRLT8uci+JSZdFnJ744MejtgdstTg3UOP8vzvMPhZr38J7DYL
         R+AkkZg4W6mv29Rnb02TBibUfc88xCA6oipaXzOw4yDtxUNxWfcsNOWGaFydtlTYYpX0
         oio37vYNYNckS/vRBJqPxWOjq2TuOy0xTH37mlV2Htor8IjS2T2hAX/e4Wnwu06SJyOj
         tZl+2z60yb7cz/cZUSkYlUvItKF+M72Ln1mB/OYXMz8dkQdvr9CmXL766ZeLr75bEfpl
         H9jWt4ikettFlzPJyBaw9MeTNr16Xynr2Oq+ldFWiFBY4kx3tvJo4YBmiT8iYJ6m0AWl
         5rVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HNPFpwcV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4746919c9f8si14200391cf.41.2025.02.27.06.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 06:43:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HNPFpwcV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnf6B-0001qk-I7; Thu, 27 Feb 2025 09:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnf5z-0001nr-3i
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 09:42:40 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnf5w-0008SE-L0
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 09:42:38 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e573136107bso931703276.3
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 06:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740667354; x=1741272154; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ocn/d1/FX1YV6bfS7ORusoHXK2VvAcMUIDGKps4AlVc=;
 b=HNPFpwcV+MYen3EEVvhCzp7gTPT/I8YR/ZTvZhqQJjP1z2Z0Ob7ROT7MRmcl07fExu
 5DigGZulpBx8C3gymxcCm1Zkskc7AA85GQwxLei3xGxB9kIN5D4vk2Q8+tVl9TEhCH1/
 wsKWjwZmfWwIvd0Pk+JZKYhDrhHza7cKU/GeogfTB8zveTJLPOieK3al3gwgdS//qawa
 X9repq6FrjrQBTWm/fOMf4/7FKqg/iDFi7DAIXH8wF8frziX4D1unRLXn8JRyTOotdWi
 k5pb/UTz9XS297iaTQ37LHouZhWdHUkhJyWgOaLN76r4NvOX998MEobpn10rLCSRpmD7
 PqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740667354; x=1741272154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ocn/d1/FX1YV6bfS7ORusoHXK2VvAcMUIDGKps4AlVc=;
 b=FguHslVop0lBGQ81bA06Ri+jpwS1/KsAuwcBvGPFIkUlvpz8CXSVFkSXckD+wCtDXq
 7TL76c4v2/h/M7cWbdmMpSHLLdKUJE56eKbB+fCeyQcIu5GfMloJg/bmxfdazuBdpVch
 WCACrr46A4v2qrNGfvZgFrPP2jtVK3H2P7HwT7pDjpPCyhuwIufldA57hGCQi7bQ4UKo
 6xPsXNoiDGKs2LivXCzr7+d47BbxZktk3+4ymb0pbDqQaxNPwx5IeEPQp8v2rhqBNta4
 g9sLRuFjjhcungHi4r4FKeLYEk25gKyRNdFUOco32szagmnMmhnGCbYlXVD+kQ2CtDNH
 6pWQ==
X-Gm-Message-State: AOJu0Yy6iKs3xqMfEwX0Ol3TYFpKSCa/3RYCYh/wQWPfHAy36Xx48MvH
 o6IIdRh6WA2Qu1iryDVfEN1sbNfuuaDrVHB9S3/O9pMirWBaxFZNNzg4Ns5bybg9w4kPe4Z6IYk
 /89EmdFJNDkB2eQZ+aj4g3YiMJh7bMBqUUS9/Lw==
X-Gm-Gg: ASbGncs0OcI/G77/gX2vR7ahIobY24s70p8ontdLTsWcOPNhr6dO7LtRzJlX0t2aPWo
 Em26nLWgKXjGGhnTMEJ+RWg87237cKCenwBlCRGWbYUNS9goL1Q6HlFAgrZpocC2uQQMiGJgtKM
 JNnBKI167v
X-Received: by 2002:a05:6902:150e:b0:e5e:85:a9f0 with SMTP id
 3f1490d57ef6-e608a6a09c0mr7332624276.6.1740667353910; Thu, 27 Feb 2025
 06:42:33 -0800 (PST)
MIME-Version: 1.0
References: <6866d6b6-24af-4743-8407-26ae2998dd21@gmail.com>
 <CAFEAcA9B40F21r9RgeDd7k09juy35k9QWewzgkmyNkYVK_K0-g@mail.gmail.com>
 <CAFEAcA-U3QTWKhNr4Nd39hX7e+i+HDEyu8EZfSOm37GvvaH-hw@mail.gmail.com>
In-Reply-To: <CAFEAcA-U3QTWKhNr4Nd39hX7e+i+HDEyu8EZfSOm37GvvaH-hw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2025 14:42:22 +0000
X-Gm-Features: AQ5f1JqPj_GeB6VHJUzEIepiQLN3FpontCJ0wn56yXuIhxbHnGaNgJ4jOfCz6TQ
Message-ID: <CAFEAcA8SFHQGdhSo0UGtSPFyuuJZWPDRMCROQHMBvLSVtQ2mBQ@mail.gmail.com>
Subject: Re: ldrd implementation issue?
To: Stu Grossman <stu.grossman@gmail.com>
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dG342PiJ+iDD

On Mon, 17 Feb 2025 at 13:03, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 11 Feb 2025 at 10:46, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > (added qemu-devel to the cc list)
> >
> > On Mon, 10 Feb 2025 at 17:26, Stu Grossman <stu.grossman@gmail.com> wrote:
> > >
> > > I've been getting SIGBUS cores with a bunch of user apps running under
> > > linux 5.15 and qemu-system-aarch64.  These happen to be 32 bit (T32?)
> > > programs.
>
> > > The fix is to defer the register stores till after both words have been
> > > read from memory.
> > >
> > > Here is my fix:
>
> [snip patch]
>
> > Yes, this fix looks correct to me. Can you provide a
> > Signed-off-by: tag for it? We can't accept it as a patch
> > without that. (I can do the other administrative tidying
> > up of it into a commit, but the signed-off-by is what says
> > you have the legal right and are happy to submit it to QEMU
> > under our license (LGPLv2.1+ in this case)).
>
> Hi -- this is just a nudge about whether you can provide
> a signed-off-by line for this fix. I'd love to take it,
> but can't without a signed-off-by. (Otherwise I'll have to
> reimplement it from scratch, which I'll do at some point.)

I had a closer look at our LDRD code, and I noticed that we also
have another bug where we're not implementing the "must be 64-bit
atomic if the address is 8-aligned" requirement. So I wrote some
patches which fix that, and also will fix the page-crossing bug
(because they mean we now ask the memory system to load 64 bits
and then split it out into the two destination registers, rather
than doing two separate 32-bit loads, so we will take the fault
before updating either register).

If you're interested in testing those patches you can find them here:
https://patchew.org/QEMU/20250227142746.1698904-1-peter.maydell@linaro.org/

Thanks again for reporting this bug.

-- PMM
