Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1861505ejb;
        Thu, 20 Jun 2024 03:05:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUapiifVvsHB3ImsOj7wju9iGL3V3K5MamJdW356ti9OgZf9ABjHD0g9q+uGY/yn7b+wYnzSGia1tgaH3R1c2Y2VDNaesm
X-Google-Smtp-Source: AGHT+IGNE5hvw5HXQJ5XxI8IczJv5xfGmOOnEVOpYVMPJcvTz6eJcm1Ax4idd2a5Fjn/exLe3YWw
X-Received: by 2002:a0c:c246:0:b0:6b2:b251:7d95 with SMTP id 6a1803df08f44-6b501e2436cmr46229176d6.17.1718877928215;
        Thu, 20 Jun 2024 03:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718877928; cv=none;
        d=google.com; s=arc-20160816;
        b=JL1nd+C/dSi5X6ksEXT8BL4tNAMha7b2NkxMJR83Q8sCYHnGZKo+oRtubrrAnxhVke
         MCf3dfnpDFUFvve49Nb8oBVbmNm66aaDcDFkFFxqH0TA6mVuBLxLkByux5f6UbL9MlEU
         r55W4Co+Ylsgccr743t8ecqFIOmN/KfZZSuLLFmUCCfJEYuKi2xG8/dDa+E8cbQLmZTu
         oLlwWEsbWBYR07pLtsMTPMcsamT5qPYKypQQDOIZAaZhZNlKyvmfjnieWn1RSSyJUxud
         jIF+sIvtW2ACvbQFoA1/uu75XNhbAU3wyaCpaFejF2/XwwRWgxyhANZqC1C5BBed8VTI
         kqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BcjW6Xk7rpO6ZbCiQj+w7Y+/X3apRINHHNW3WYLCgSs=;
        fh=Vq1ty4ELZxVCg9+qPZshZise0IO+cBv3g+/60ITE1zE=;
        b=0xgEpI+F1OzoNtz2BuIeDdFewtBAP8YmLWQlNqq3M6rU82rdFtjFemhT+FZFAjKZXn
         ZTtyBpS292AkPhGyQRRVU3CAtjzTkpedWV/El1WyBgfsDpNyz4ztoTdAgIxMK31AzuJf
         +ghmHqapCl+NdNMx06mpViJhVpJ3VZQzQ/Mhb0yhtIRGmqA3LRom0qLFzZ6dQNt+sPPT
         dVJLdOGnppc1k44fR8RLkLLmhH7IklIVUQ510ci1MgNNKY8ZhhqAt1uIqxOQ+CMXhpz7
         2XwGUp0JqGnsvoHoU9nbL0hGOb4UyjJ8ObHMacMTfIdturlzCtz39HhjQLAlsjchbNo5
         dBPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bA2EcbFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b500c76bb0si46771856d6.80.2024.06.20.03.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 03:05:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bA2EcbFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKEfM-0006j0-Hq; Thu, 20 Jun 2024 06:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKEfJ-0006i9-Bw
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 06:05:13 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKEfH-0007ey-Fq
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 06:05:13 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57d1d614049so781769a12.1
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2024 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718877910; x=1719482710; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BcjW6Xk7rpO6ZbCiQj+w7Y+/X3apRINHHNW3WYLCgSs=;
 b=bA2EcbFLn/JIYsbk1JvDrClaku8KEvj9mw6Z8pbG0PqfpPfxosSGNdGi8KbwBikdem
 NJWXleuiRZPOw04bp/BgPHo2FS+OzPh3oPP2cyCbB/BUK/Txk775xeWsTHd8G4cHfJKJ
 8vDvlOsmhLV8MlbQBh0bV8DsfoAU18+AaRQJLUZmDfmxf7GunhrdAtKZFU2s/uLDt1VG
 52NdMbXGyVC3UFyDzEJXCr0xxWT2U7SBWGcfDSJJYdXY9zXtO4+mFIp8mLsV7fUqoueJ
 n81u8zY8s0366xzhKo5dujuPw7GO8XKWpJFQ7jm27uTuFjEHqRSR8FV+AK7yZcZ+2D4f
 Ep5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718877910; x=1719482710;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BcjW6Xk7rpO6ZbCiQj+w7Y+/X3apRINHHNW3WYLCgSs=;
 b=mkwggFxFeYK85GC4iKQMNArXbqgqepVyYwLiUKhdnfdwFDu4L7cU5tUv+h6UZz68yO
 y6jAgl0kqFCaoV/1+1v3RDtaTk36sAHsGNog1PY7W+Dfhn5BXNAmyDfbvS4Qmie/YMiK
 0Db+U1V12uNPaFaNyBPm9EEmQHN3OP2XW7Ry6tKbBCkZiDzNXXnrBbyK+3frgbbqmUVN
 M0tEsvZqnlarmo7PwoA+RpVitRar7ehFnmgfBUjhNYe22KChyzdsQi1hoJie7tvPQLSg
 m95tDDDhASEmluPTAb9oCzSXMRJ7atc+Lwy7WiBEsrjXDPniGbY36A72LGV8n8ijM1a7
 BjSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyl7hkSt0KSULnL3Wb6eN7/zdT7TfQghiisAdXvz7nb/qTP939kfns/SoaIHK71hJlYIGyK23HsX9RTjYwXQiAABFG
X-Gm-Message-State: AOJu0YzWL8DqUvT7jl95Y/hDtXcrmdINuQcPLU64725k8CZOw5IzFZOG
 ze91TCFUUmpE40E9oFKrt60wcQT79VV6zqXteY7/nVZ/HXjxYJNJLo8GjaNre7nIPaZ3Pmoj22r
 /lz9tLZdudqtKg2oTUC0+9MrLCCgXKz9RNZzvpA==
X-Received: by 2002:a50:9312:0:b0:57a:234d:abc0 with SMTP id
 4fb4d7f45d1cf-57d07e6eccemr3507510a12.1.1718877909680; Thu, 20 Jun 2024
 03:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240620060014.605563-1-marcin.juszkiewicz@linaro.org>
 <20240620060014.605563-2-marcin.juszkiewicz@linaro.org>
 <CAFEAcA9XbYr9jzYm908_stCUrZCqixB+cysFTRCe2MnAFW1FVA@mail.gmail.com>
 <d7880fca-2bfb-4368-9419-8227616f2ce9@linaro.org>
In-Reply-To: <d7880fca-2bfb-4368-9419-8227616f2ce9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jun 2024 11:04:58 +0100
Message-ID: <CAFEAcA9vM-5h8a_xmEUAiKTHoS3kOyutm4er+3+y1_T89U5biw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tests/avocado: use default amount of cores on
 sbsa-ref
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org, 
 Rebecca Cran <rebecca@bsdio.com>, Ard Biesheuvel <ardb+tianocore@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: eEHe9wV/2wpB

On Thu, 20 Jun 2024 at 10:55, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> W dniu 20.06.2024 o 11:34, Peter Maydell pisze:
> > On Thu, 20 Jun 2024 at 07:00, Marcin Juszkiewicz
> > <marcin.juszkiewicz@linaro.org> wrote:
> >>
> >> I was wondering why avocado tests passed with firmware which
> >> crashes when anyone else is using it.
> >>
> >> Turned out that amount of cores matters. Have to find out why
> >> still.
> >
> > This commit message confuses me.
>
> Had no idea how to write in more readable form. Will reword it for v3
> (with reverse order of patches as recommended by Philippe.
>
> > It reads like "running with two cores will make the guest crash",
> > i.e. "apply this patch and the test suite will stop passing". I
> > assume that's not the case, but what's actually going on here?
>
> That's exactly the case. With sbsa-ref firmware which qemu uses now we
> have crash if more than 1 core is used. Avocado test hardcoded "-smp 1"
> and was passing fine.
>
> And I forgot to mail qemu-devel when I got hit by that crash.
>
> This week Rebecca Cran pointed me that crash is in BootLogoLib in EDK2
> and I wrote some workaround for make things work. Then Ard Biesheuvel
> found the real reason, fixed QemuVideoDxe in EDK2 and we got sbsa-ref
> running with any amount of cores.

Oh, OK, so it's just random bad luck that enabling the second
CPU means that we end up doing an unaligned access to the
framebuffer, I guess.

Then, yes, Philippe is right and we need to update our sbsa-ref
firmware we're using for the test first, to avoid breaking bisection.

For a commit message for this patch, maybe something like:

 The version of the sbsa-ref EDK2 firmware we used to use in this
 test had a bug where it might make an unaligned access to the
 framebuffer, which causes a guest crash on newer versions of
 QEMU where we enforce the architectural requirement that
 unaligned accesses to Device memory should take an exception.
 We happened to not notice this because our test was booting with
 "-smp 1" and through luck this didn't write the boot logo to
 the framebuffer at an unaligned address; but trying to boot the
 same firmware with two CPUs would result in a guest crash.
 Now we have updated the firmware we're using for the test, we can
 make the test use all the cores on the board, so we are testing the
 SMP boot path.

?

thanks
-- PMM
