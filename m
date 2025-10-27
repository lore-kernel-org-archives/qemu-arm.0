Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0B9CCF9E5
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 13:13:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDN25-0006pZ-FV; Mon, 27 Oct 2025 09:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDN1d-0006l4-5w
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 09:12:43 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vDN1W-0003If-4j
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 09:12:38 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b626a4cd9d6so956877366b.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761570747; x=1762175547; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BWo+5gPcqX9uNc+sUS39zUVj44E9phbewlddhUfkawQ=;
 b=cnlE1r5dELh6EllqtG8CLL6Ata0t0LlcmeZGBFVqEKj09P+RNTuzQvyCL6rN2IVZSs
 9zm4ZWiT7Fcsk4ctpAnNN+yPmjPZ0t0yrxOS0zu5OrQjkFFZOsF3zoQ8e0zmM+s74qnk
 kqEBvwzb6X0EK93JmfA6ICcoZfs4ArNriKxnpyDStWZYBPQ9p+b3X4JgY60dZn+KH8So
 UXKkOaGVL9uYrl4hcZNzonWrTq0gl1+JLvUhX1dcm0wVX54uvrKY4pQ8OWKpX+aNJ25W
 dYJCZqVnYMo6njlQumBLVce5g8wl+dK3kP4ScyHoovwWM1Av12ZjIitg4CsXVBnEmMLA
 qMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761570747; x=1762175547;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BWo+5gPcqX9uNc+sUS39zUVj44E9phbewlddhUfkawQ=;
 b=N3k7xA1iP25hQleNdDwz/nuSx0qfFK6yY0jvqVyC6Tl1dvv/uv68pHg4fjFivT3Gpb
 X4OOknUsblGRwKJq+52Pegy+RkRkXOHfsXqFbbDkfUYnZgF93MAO238cegKr5Zv4vkjI
 5JGDOQxema6QTdXg6aYwQ8xAnE8w+eQ7c1zwi63z4h5S9hPo3BywL3Ha3v0ktJ95kIHt
 c7HKogmsw0+KT3iRDiz79hmiGn+KO7unJnc8Zz2UBC/HMHNsqo34qP0B6aDTUkEv+QAa
 aMByLfQZYLQug5JRj60q6kkKxHIs2aK50uyGo58ncLGcpndBeT4AWFwX+chNEaazE9q7
 +CTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdIXpmiLMKc9Gcl6I70kydTEoLQhbUKzDs8z9gDg+yZydenj+M7GWW8qkrVAGB3kwEy0egrITMSg==@nongnu.org
X-Gm-Message-State: AOJu0YzrOEl/dUeS+UKcQCGvYysjeqFDaU5cM3RcJlJTBHVa8jVPSzDT
 o7NdM1qX2+La5ZVJmY81R0OG5I8xMote7kwiTMD2E8ZF+BRl7frMd4GIPtZZq6Qpldk=
X-Gm-Gg: ASbGncthaUXZgYqur0NfbVNB4Uev0tStnt6ugCo2tiLGzFLCRmdqGgNGZRfLpczXVOa
 Wn/RP2yHr56V5Hji8k7SfXMhDeiMvT87VMljxQ9zzn/4H0qtU3ymzh1XXNzqSp9hL4AD64mbYMe
 bhn8xQAs/ubajMA8qZGTgT6wz25mFQQnayk3H2WlBTfyERHVpWWV3xZIjBsc5iMaYXTypQtwado
 1CD/k6fb17npxTcMfvRko+wmLIxUbdB9eGxyYdhE62HlkrFcss8dwqXGiEqNS6OaBxMAi8E01AR
 BJ8R+Ja78C+/npdYj71XHeSYPyYczbvDV6MoYfnjKiOg+lZT44hzIc54KMtbR9GO0ea1mIlnOob
 piDbiWb9sKrnQK/0U7jQovvGMDTK0g2xOUzYTb2GYHD6po5lbNHG0MZN0cjs99n9+goqmkCRyg7
 eZ
X-Google-Smtp-Source: AGHT+IERPsJSD/g2t5a29OFpAPhtaDqWSOrkfAqr9rqLYBO5nwEroImSJyGb0DI9xMLYYJhJ5o51TA==
X-Received: by 2002:a17:907:7291:b0:b6d:3f8c:a2ff with SMTP id
 a640c23a62f3a-b6d6ff24b7fmr1304857766b.41.1761570747182; 
 Mon, 27 Oct 2025 06:12:27 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85359687sm762958766b.23.2025.10.27.06.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:12:26 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B15E95F8CD;
 Mon, 27 Oct 2025 13:12:25 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 David Hildenbrand
 <david@redhat.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Troy Lee <leetroy@gmail.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Helge Deller <deller@gmx.de>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Richard Henderson
 <richard.henderson@linaro.org>,  Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,  Peter Xu
 <peterx@redhat.com>,  Artyom Tarasenko <atar4qemu@gmail.com>,  Jamin Lin
 <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 0/6] hw: Log unassigned MMIO accesses with
 unassigned_mem_ops
In-Reply-To: <20251027123644.63487-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 27 Oct 2025 13:36:37
 +0100")
References: <20251027123644.63487-1-philmd@linaro.org>
User-Agent: mu4e 1.12.14-dev2; emacs 30.1
Date: Mon, 27 Oct 2025 13:12:25 +0000
Message-ID: <87pla8xzd2.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Do not log unassigned MMIO accesses as I/O ones:
> expose unassigned_mem_ops then use it instead of
> unassigned_io_ops.

But why? Is it because ioport.c is a x86 io thing?

>
> Philippe Mathieu-Daud=C3=A9 (6):
>   system/memory: Expose unassigned_mem_ops symbol
>   hw/display/vga: Log unassigned MMIO accesses with unassigned_mem_ops
>   hw/pci-host/gpex: Log unassigned MMIO accesses with unassigned_mem_ops
>   hw/pci-host/aspeed: Log unassigned MMIO accesses with
>     unassigned_mem_ops
>   hw/pci-host/astro: Log unassigned MMIO accesses with
>     unassigned_mem_ops
>   hw/sparc64/ebus: Log unassigned MMIO accesses with unassigned_mem_ops
>
>  include/system/memory.h    | 2 ++
>  system/memory-internal.h   | 2 --
>  hw/display/bochs-display.c | 2 +-
>  hw/display/vga-pci.c       | 4 ++--
>  hw/pci-host/aspeed_pcie.c  | 2 +-
>  hw/pci-host/astro.c        | 2 +-
>  hw/pci-host/gpex.c         | 2 +-
>  hw/sparc64/sun4u.c         | 2 +-
>  8 files changed, 9 insertions(+), 9 deletions(-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

