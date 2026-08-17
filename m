Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2182BC5DF66
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 15:05:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvytn-000394-U0; Mon, 17 Aug 2026 11:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvytm-00037S-6L
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:05:14 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvytk-0006e6-D1
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:05:13 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8200ca16f26so49669687b3.3
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 08:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786979111; cv=none;
 d=google.com; s=arc-20260327;
 b=nGc4vgz/sy1qd4U0Kyc3npw0Y1Bg9gp/lxo0G6FIg8ytS9gcbt9gVc0Awo+G4pQO0A
 2sxIUhARZDe4Qz2CnOPPvBtDAN8g8KThGuvI1Rn6yztEj5X8aYd+yQED1WE/+KEYMYXb
 cUSKEBvztf9/p11k42Rpxx0xkn0+y4Em1n96ExzvUEyzSSNar/ScKCRG8too/Txbdp3V
 N2SAZBmsgtIgCERviSRo/FWUsA08U74K0hmQdy+qpAbrvAQvU0XXTkFeXHq3dEgcRmU+
 YuY2AzB/JtDVsEpof9WEKQPZoiagzN16pwyAH6S4UybE/zG7V57jePVDjeyZn5Z5FO1e
 iNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bTDSl3vbBIWXZ/neowUCuUM/B4vD+2Uiz6LJRcpxOjM=;
 fh=9+m5iMw5AqFqsBJuIgFzyFLVfBYo0z15comSEfnS9vM=;
 b=j/CehSfUz+9Ov3/nKSeJP/YZElT4AziqBdSkDe3B15N+8gv4ubnfFjGEMtgw9m7yv+
 00V1oX2odx1KxxGmiKmkl+eHwZFMCWpkKoHw8f0BuaxHeHmfwCiYuoF3sqD7yuu5ZB4P
 1kNO5N0WbcPSPrrKxqAFG03ACi19V3gEQmgEE3mnPhsPvPn8HRHe4bTA77rhaCZF2lm8
 38ZU/+9Sm3j5GtTFts7BfDpfpYlEUshOSB6lpCsfPp5xCP3mOazVXXq0dDXhNZqIH0Sl
 SaUeuc2WJWma0Prr41yHdqiXSiuxeao6iTEBMu+MqvIZZQCh61tFC3sSlrtVwZb5zGKG
 9p4Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786979111; x=1787583911; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bTDSl3vbBIWXZ/neowUCuUM/B4vD+2Uiz6LJRcpxOjM=;
 b=lzQrImwG3OhYTLDpuU3RguDBKH1AU6xDH5Y/nps/liPBl7W+sCSn0s7OadlN9ECw+n
 EbtzU5CUC+sRRoZU5/ChsPnEp6W1kQi9P2Zjj4br5uW8/gGMNYTdI+weFWo4QGPypmFA
 eKnXqfJCpTXIcItwLVqUCOfgPuSo4W1+CiO/WZOG1za9WvtN2XmX4PPYlsdtLZbQ+38+
 wtd6Zo2dxZzIOekcvlmBJPY++kdXauwNtM2H+Pk7vU21KhaXoQsQRA4Cc8Ey5HRKxpe+
 KucnPTMCG0jHhkCt5cRdad06YPYy1FK3Y25lmcjB95uXBic1AyBkSrnZBNxuY4lBzosQ
 0IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786979111; x=1787583911;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=bTDSl3vbBIWXZ/neowUCuUM/B4vD+2Uiz6LJRcpxOjM=;
 b=GJbDL1dGHWAyl1Y2uNxcwQD3xfVUET8T5ryVU1Rn0pGSmHcehfH5NTSlry6NLkaypK
 yVyZIfuWxh+OTFYuZVKE3MypLt9dr7/8DpEphPFaJb4hgW5k+OgaeGDTmJ6T4SI27fNz
 rRQHqSX1JEyYmR8qCoS1PF2hxl1wIjneYvUCv0P2qkHn1qfiyJgMuX6j4UxAM94SQCfH
 NJgrbh7MDkA+QmH1bchSn68X9wFCvv78qbKBL04I/2Lyzc75ksBcDt9+OUbAlXhdh0Vv
 jsSXwE2ql+XinXI4M5O59agAJk+uIpg/icdZLI1KEE/3IiradErFlAQ2jEMuB2Wn9Ez2
 fHRQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr5GkSi1XdqnzqSdJnsaa8Ch5iAa9Qijg7xBTbjdDaT3wvJncXnK2twngNWtpq4nkMn4oFu9kdFKA==@nongnu.org
X-Gm-Message-State: AOJu0YxP+zHMF+IQ7tVXvI3ghbcaf5S9jV+U2L+n86f2w5UBds8dOQbq
 d8MwwXz+CXCVAmte/75KJhfY1H1/m/N6Bik3UeiBkhlNytbb5zQv8wxMtNzU2Zm38pwHHA3Ne/1
 dsj8lflLZ6wxzZ6dAObFAE25B+ix2k5twO4s6FmlZTg==
X-Gm-Gg: AR+sD113W3BZJVwHjI4ulK09I96EgJ/vg9LO22z69jEjErG2sjPH8qBTMXXDXUzjNLo
 EhES/QJqNsQkTFuXjVaFQ51Loq0c4op6/eOTW2VLsGshyuPDkYw3U8UCKFo3VlDKHni2MDAeWct
 u84IhgrBcaKxj2GLl352pW1fpwx9FIKDH1+9fo4gMlIVocQTmjJF1DonR2oJn1wGsF44xgGW4oZ
 FmKFPVdUWM+gBjIiAI5If3Aoj/R+1wq7HbxtFg9iVgNghVftS1nID+v47wyf+jFK+pw/OIQBoBM
 a8W+IW84PLcM3t3gtHGoPeNGVfWwqXDz8WO2HtMxx7zSOEErZWveGQdXpZAgQYwVKevoWKl78+l
 XG17cEpyjAvti506Hn6eUrYqkyhwW5Wg9Y2p9R+oK
X-Received: by 2002:a05:690c:311:b0:81f:e7c5:f420 with SMTP id
 00721157ae682-84131277225mr6317187b3.20.1786979110903; Mon, 17 Aug 2026
 08:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260812204435.295067-1-richard.henderson@linaro.org>
 <CAFEAcA-xmbhZFG+zVcQDt02UJ5ELY2bOiCkVVW=60oZgzujiqA@mail.gmail.com>
In-Reply-To: <CAFEAcA-xmbhZFG+zVcQDt02UJ5ELY2bOiCkVVW=60oZgzujiqA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 16:04:58 +0100
X-Gm-Features: AcwNN1VKVMupBbeViC0ymV44SLc30POJjleH3mcKWR0BMQcDld_WjelXWQ_0XyE
Message-ID: <CAFEAcA8Yh7EcQ_Wi4PqRPZDR2L1-tuDpDPS1-TEGnidSUdaTCA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] target/arm: Introduce cpu types max-v8 and max-v9
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Mon, 17 Aug 2026 at 16:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 12 Aug 2026 at 21:44, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > This is something that we've talked about for quite some time,
> > having separate "max" cpu types for Armv{8,9}, because Armv9
> > prohibits some deprecated Armv8 features.  Retaining all features
> > simultaneously has the potential to cause confusion.
> >
> > Changes for v2:
> >   - Re-reorg cpu_max_initfn, avoiding the build failures without tcg.
> >   - Move aarch32 tcg parts of cpu_max_initfn to tcg/cpu32.c.
> >   - Separate patch updating feature comments in aarch64_max_tcg_initfn.
> >   - Do not avoid aa32_max_features for v9 -- the registers still exist
> >     and describe the features that might be present at EL0.
> >
> > r~
> >
> > Richard Henderson (10):
> >   target/arm: Tidy cpu_max_initfn
> >   target/arm: Pass ARMCPU to aarch64_aa32_a57_init
> >   target/arm: Pass aarch64_enabled to aarch64_aa32_a57_init
> >   target/arm: Sink aarch64_aa32_a57_init into aarch64_max_tcg_initfn
> >   target/arm: Split out aarch32_max_tcg_init
> >   target/arm: Move aa32_max_features to tcg/cpu32.c
>
> I've applied these (1..6)...
>
> >   target/arm: Annotate arch revisions in aarch64_max_tcg_initfn
>
> and this (9) with the minor comment fixups I noted (but not
> doing anything about AA64ISAR.API or re-sorting the out of
> order ID reg field setting) to target-arm.next.

Also, once we have a max-v9 we should fix up the slightly
bodged GICv5 property handling: currently we register
the has-gcie property for v8 + AARCH64, but we should update
that to only register it for a v9 CPU. (Q: how should we detect
that we have a v9 CPU ? Do we need an ARM_FEATURE_V9?)
Then we can remove the code that does 'Downgrade "AArch32 and AArch64"
to "AArch64"' when has_gcie is true. I can do that after this series
lands, if you prefer.

thanks
-- PMM

