Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769BCC5AD5A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 10:25:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wu68z-0003v0-2q; Wed, 12 Aug 2026 06:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wu68y-0003sn-1x
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 06:25:08 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wu68w-00023V-3F
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 06:25:07 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-824af9535c8so13160037b3.1
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 03:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786530304; cv=none;
 d=google.com; s=arc-20260327;
 b=sz6gTcIkPRYEsvhjWLZ6Z3hDzXmVMvvL3vr0iflYJzZiTn0alHWdp2xA8p9O+P7aNG
 7VU/9yaeqJYr6c6HsA/JLTLkDwKmq6wGMdnfyDAc41Er2sObXnxXOS8in2iakkBEBKKO
 gixHZQTTvADRijVFlJnFgGcXju5+dvYR2VWr3UiYe3M6iYNA0hRWSkT9+iXVHR5iLvgP
 lHZzMFh6qc559pP8L0jFkWw/PxK+esKns2v7OMdgdct2XzsP34MfahBnsnUZDkCr75as
 v4VW8bYbBqsdUwUus9HZp/+K7R25DaEp57XLRVFitcchWvmyPiVwcsqU/NBS9VI6gq++
 RFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=LXTqFzRPeF0ea5Y2BTsg4MEbZkafleniouizAQfpXjs=;
 fh=uKtvcOQktBe+l2O0xQP9Rina1eKCK6YPLqXbGzMguk4=;
 b=Iw42TAYTqfrnS00KnIOgwx3pF0qoUuhLsiZwXhfg9bS/EvI8Ozb59E8K96+t32P1b5
 KpFtn15ftO7MWaKyPhqkYUcpfwiByIZ85W2ERQZGP4uTAxlpiBnCHDiBWSmeJPdCB6H1
 FvpzFLaGYy6AdNd68JazK9a+YQ8wils5eBrBmeAxSwupGA4vnMLBiFikFD2bnQ9PlS45
 neAFIZLR98iqzVOja+yEtHzTsarBfhp6203zAJEgg/fiNy+piTWKkSdyYDB99BOqwvO6
 C+KQKFESDdTMoimQtm2RBUjB5HCPim2tcyuM3orZAupPgVqtq48IPxmafitU2kCqFu3i
 5DAA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786530304; x=1787135104; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=LXTqFzRPeF0ea5Y2BTsg4MEbZkafleniouizAQfpXjs=;
 b=xim+a4DMGpOFzknSs1WSftlXLNsnwSMO2ONE8EU1jEnfCSI5xMjGUspJabtAbNs6Dc
 D/HgttWB4fEbJuEaglkyx1NS6Cwu818aTU1zmAjoSD5KCrNrxrsLVWWaRGphNAPT5jAP
 Yb/MIeJEMbpINsdBPL6/MRICMjjbtfriS4ziVEJGF7alFhaLuW3f1PbMt39I54jbNRC0
 oYBgdbH34fF1coD8WpKZBfV6L8TPZ8E0yVP9KLxqWH//fixXfUKmwlZXQ5xp6aB+iVbn
 4kapkN0dp9yby6OBj5gK1hSoMstChsQQAqf+5q6kGYsIAzJbZ+SDCm9TSM5ATTKIu88s
 8vZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786530304; x=1787135104;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=LXTqFzRPeF0ea5Y2BTsg4MEbZkafleniouizAQfpXjs=;
 b=XeHf+19NoBb81IqlF9HaaNeL7NC19O+p29t5juN9SAzNZhllHY1EegF5Uj53ix9Xhy
 9w2KPaZ3ntYNPbKt9RiDzVZE680GZpcATeG7ik9FliDTUoompK4Gi3Z5t7QmRuicFOkg
 KV58Ke4xoIYFaTckbF3UdTvuhDfJbbWlq4Szz9REzblLunuTkNdZsIXlGlxGNaCUCiiX
 O+FViBwYOfVpv5qCnI1oTt1MDIBBuhuWAFr+nHnTnL4PSULLhwzI8BJdMa7rJRI+OTJw
 sz+H3qia77r0/dDmBFpQ7Ntryvc0Kx1nyEtlu/oD1zKTxUSD4jlEaLctRBf3Cu2Q9f7Y
 shgw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrd1OI0ITVsqNVKSk9htB0MbNnyWBN35KWS6u7GaL0mtDMEvdeMQBx+Z9DLIRz5Zj2eSprORejyMg==@nongnu.org
X-Gm-Message-State: AOJu0YztLJ0Rja60roJfZ1gAEY+bkHGqOjNSYsfaju9DI5o95JWD/1q7
 UgXE0Ou5VoDn4nKxX7FNmUNNm7VRYVpprWhXJyxNVErr62S1Lwrc2aO2QGTScBtIm5cHpSaSYuX
 xha1IPfr68hIVi0ZJ1eAT/Ph5pV4J8+IiuQgi3up1/w==
X-Gm-Gg: AR+sD102fDecTu5b1bVWFF68uOaPg6qu8bDsfeeKvmonLZfp3ZkhPh8t343CEUs+mXn
 tmS7p8IaftAHtr1nWk5WfWnONnB8Su5j9LMz9soWjOiLsH3QAFEXMbmGLWiYHx37nn+7db3Ugzg
 8VF6QeTuiKUSTukyDNEPqMolTv0odhGIA9A38PZFF+CQxEn4D9bn80oGiLHpjfYhsdxsgqc78XO
 EhoQpEu1oDSd3mNxR3W58+CV1XgMFa92spt3Ti9MVhg+rZIMdEECWElJ1a4EWroAgOOZC5tr4kv
 hClNlx49kZgDZlntuO8EFuflq5hF6Si4iRR+FRWB40DqTowujj2f2N2jA6SrZJvbP4jGowIhghT
 ALQXzCVLsE6iBiz4kH2kQ16oWHYRIYQx2MoE/WV4=
X-Received: by 2002:a05:690c:e0c:b0:81f:a595:2e19 with SMTP id
 00721157ae682-8310b73e8a0mr22080347b3.23.1786530303817; Wed, 12 Aug 2026
 03:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260811143539.7835-1-marcelomanzo@gmail.com>
In-Reply-To: <20260811143539.7835-1-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Aug 2026 11:24:51 +0100
X-Gm-Features: AUfX_mwkmm23E6gGDgCu1vPUb_ezW7RKkcqYvLBMpMwup0kV7mLZVC5ThsCudKc
Message-ID: <CAFEAcA_duyqT1F2m64jg10Xy+4QVikZfUbacvZ50v=isrcCKZg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] hw/arm/raspi4b: fix guest RAM capped at ~1 GiB
 regardless of machine size
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Tue, 11 Aug 2026 at 15:35, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> While working on unrelated raspi4b issues, I noticed the guest never
> seemed to have as much RAM as I'd given it and tracked it down to
> hw/arm/raspi4b.c's raspi4_modify_dtb(): it decides whether to add a
> second memory node above the 1 GiB peripheral hole by checking
> info->ram_size, but that field is the boot loader's RAM budget for
> where it's allowed to place the kernel/initrd/dtb image, itself always
> capped to at most UPPER_RAM_BASE - vcram_size by
> raspi_base_machine_init(). Since that capped value can never exceed
> UPPER_RAM_BASE by construction, the condition was never true for any
> raspi4b configuration -- the second node was never added, and the
> guest never saw more than ~1 GiB of RAM regardless of the machine's
> nominal size. board_ram_size(info->board_id), computed one line above
> in the same function, is the value that was actually needed.
>
> Patch 1 fixes it (one line); patch 2 adds a regression test.
>



Applied to target-arm.next, thanks.

-- PMM

