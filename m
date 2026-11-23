Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96719606A327
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GTs7RO/8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVVMs-00053n-7k; Mon, 23 Nov 2026 09:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agarwaljayesh03@gmail.com>)
 id 1xVVMj-00051p-Lg
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 09:49:58 -0500
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <agarwaljayesh03@gmail.com>)
 id 1xVVMi-0004lo-4f
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 09:49:57 -0500
Received: by mail-dl1-x1236.google.com with SMTP id
 a92af1059eb24-1b3a05f8b5bso4230330c88.1
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 06:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795445392; x=1796050192; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=O5+8/AixUPXQ4kSG2aFXHVaf5Ok62tVtQCfdSL/IMr0=;
 b=GTs7RO/8Dst61I0mq/gGkalW9itxAqWXakG3bojfaC6iPgX2hcOTNT2aN8Z1BB2zH0
 5SkMggBB57r/6jOrz3iGU53lcp4RZYvCpu1EnGuhGKtAl/aNl/YtLgHQKqLUnylu1Fw6
 PBQWb7cuX1w8LPXAc64P795hEduwwZBS1a3/GRO6ad2rlyptxl9u3JPvFg8JdajAnaga
 +Oea+mAL+EqbsSCqlIwpYD4S/vhKpkkkp9bGtMilmbCGF+yA2ry+6Eyt54+zdzG5pTP6
 doOL4vPT0nFp9pDxn3j1WlF1nmmjQiiV49MIx7TL7B9C0/yu3+Xj+EsKPpffeajluy0z
 Z69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795445392; x=1796050192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O5+8/AixUPXQ4kSG2aFXHVaf5Ok62tVtQCfdSL/IMr0=;
 b=1U/b6+UuOqRknIizw2AUfvt/jfacwkUttM61NNfmLPkajkwrRlDLXc0n4vWMIQ5YYe
 lF2so3UNFetywoS2v/mr4kKNvcvSWVo38dcLFw1/GwF31IOv4gGp1VtTkCKavnXqcxBT
 7MbX8Q7KLxii97x2BE1hVokm2W1ol7opxzWsOKI25ykbbAaauIk3y+nTMswHWXuCmmDY
 SM+dkObwgoZ6oCBZeS8roP/vfMjFAmvLwzMEiymKZF2HGJZR85sTF3iXtt+wgjDs4BUL
 GD080rMyglfO0QkzLV9sfqy9Nfq22B696DAL4avA/rlNeltIpOEuDJEYcqre1YI56bJe
 D88A==
X-Forwarded-Encrypted: i=1;
 AL+hErGAJHLKM+XFJ9WwDN3BM0A6ltSJtZKM00rvQXjwNaVB4Qw+Y1bvcPBcEhpQDTYcm9HkGUsNhJIZLQ==@nongnu.org
X-Gm-Message-State: APuU4Z80gYphgnmXjhZ0qMSJyW4KZxZR6ycB9Xr6l7xDVaQlEdQr0Uqb
 Xn7MwB1XHSBGWngHaLkcwTxafVvTYo0zuEajJlUr35XAc0hgR4SsZOG4
X-Gm-Gg: AZFdTZcPFu945MtfbLlrN7mESyYiN+g0MOuw3pp6BjO+5deQa/Vbbj7NPu8/WlZ0ddj
 v15HjpC0LlxNLY0jxro3/5SVQBBaHOFfrnsFsP5GTmfKLI6Gcahv9X8JRVpQyY/Zyu8Sg0J6BE8
 PlKf99XqSOPWC/Npk1k/2klm7VoD80C0sH3dKJ6QG/2SC15o9FOaU4+3Ke1e5oW6HnP8E54i5Nx
 elyal4qeMcA7QSgK5txNOlfQ/Zb+/Tkug4n3VRZQv8QZsY5Vwh90CaFrm38NnjUNhkkjIftJ81W
 F4NUM66NQDTUIXHWhs/hpGnJDP2bgRdY8hGo7sOqv2PfcsHm+gLZXTw/RKBgPZTcfqWX2beG3Oh
 tib8NDuB5XvmFJrCT4HtF2Hk84eI3BGNIBJApRFeyBXlEpKFB/5MgrWUoRaVkpMUYUbCWJdUH3L
 qvuz7smJ7iZ8DLNingBeDaePCd6/U2OjOyuA2O1ZaikNq5G3D1W7p3faKo+qAJH3EbPE3DQYqYz
 KBorq0T1SR2q8piPrkUMg1fQj4eSGUb8D7GHgfwNszNJTtOqyfjGsp9BX7i4N3X5MdNo9NKXwOH
 ELGWw5rCPHSnrNkewXSiWKyFaM+ghDBLE4uPu5n29m0T5pXgX+gm9IzCPqJkmCnsMwDBzKnK9FS
 bjxuv6epU
X-Received: by 2002:a05:701a:c96a:b0:14a:8cff:fbb8 with SMTP id
 a92af1059eb24-1b5568c8dffmr9916578c88.28.1795445392336; 
 Mon, 23 Nov 2026 06:49:52 -0800 (PST)
Received: from LinuxMachine.bits-hyderabad.ac.in ([182.75.45.16])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b55ff0e4e6sm21657646c88.11.2026.11.23.06.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 06:49:51 -0800 (PST)
From: Jayesh Agarwal <agarwaljayesh03@gmail.com>
To: peter.maydell@linaro.org
Cc: philmd@oss.qualcomm.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 s23adhik@csclub.uwaterloo.ca
Subject: Re: [PATCH] hw/arm/bcm2838: Route system timer interrupts to GIC
Date: Mon, 23 Nov 2026 20:19:43 +0530
Message-ID: <20261123144943.9630-1-agarwaljayesh03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAFEAcA_4+PcP8f2DF+mtjkO5iO6eU6C6R6hjfBN7dg0o_TGPiw@mail.gmail.com>
References: <CAFEAcA_4+PcP8f2DF+mtjkO5iO6eU6C6R6hjfBN7dg0o_TGPiw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1236;
 envelope-from=agarwaljayesh03@gmail.com; helo=mail-dl1-x1236.google.com
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 23 Nov 2026 at 11:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> Thanks; applied to target-arm.next.

Thank you. The problem that you raised in the 2025 thread on Sourojeet's
patch also affects the following devices:
uart0, aux, mbox, sdhost, mphi, dwc2, rng200, the eMMC OR gate, DMA 
channels 0-6 and the two DMA OR gates.

bcm_soc_peripherals_common_realize() and bcm2838_peripherals_realize(), 
for the Pi4 only peripherals, wire these devices to the legacy 
controller, and later in bcm2838_realize(), the GIC wiring overwrites 
that.

Should I fix them the same way, one patch per device? I will send them
in December.

Thanks
Jayesh Agarwal

