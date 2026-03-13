Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E58105F781
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Mar 2026 09:00:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0yMz-00045T-2f; Fri, 13 Mar 2026 04:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0yMx-00045A-42
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 04:59:43 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w0yMu-000221-6g
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 04:59:41 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-64c9a398bc7so2227000d50.2
 for <qemu-arm@nongnu.org>; Fri, 13 Mar 2026 01:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773392379; cv=none;
 d=google.com; s=arc-20240605;
 b=ATK507Dw0G8Xp9VlHtjhecRs232YnY7ZKI7zaYJKG8UrtONygMbKEepk+yJGgrwGoZ
 6JtDsb2kEbTM5jgtKSwsAz3T30PxXKgEgmib4XalwaUy3ioA1I6pIWVyYEXLuIlwSVdM
 roZGRJns0MNST/sQO79BDdpWW66d0savq36fV379vJYGlF9oLLC1mIMO9R575Os89x2S
 je4Ib579odrsRMJtcVzyeFGWlQzwjmM4wjH9ORk0GiL+PHX/2PiYx6oVN54yYWoQ9UmM
 KbvqXez4yWSg/ay/9d5lzJQR5xLvXC7OnWVdG4Ld2YYPIqXiadO1nJF1qlPKagkGWhou
 A6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mltmT6aMoafo7V/fQ8c/CuHXNuMtEfOyupyXicc8i+Y=;
 fh=6CJNyWyCk/m1waF0MRMxll546WpVpdKTgQnJp9vwQkM=;
 b=HxmowAHb4Ck2HYBqSFNRuNPXrLWnV/SWDihafqRfzk7XLhf8nLaatxYg9jNk371PtB
 qFVF13PFoqzcKBU6KGl9juGDGa5uQM7viXI3lNGbBtWey3b/85ijUz/cEDPUWRmXYsMR
 H860KsSO3bdcV9ReDJZywv7SGKWLihh/SRXHSdRptur5+nn50o0CuG8DtAD6dl64+0fr
 tFRpQCeRbqUgJcGus1pLkgIu6QrNlwGHPCsPIStACmJ3PfKFqytgC7VwGEiu98rfFoTe
 ontv41wI5EEMEIqiNbVbXsiCrbTuvWcA7oJOUVAMMEN6EbqAsM+qvxT8H3jYnpFsLKUl
 B98g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773392379; x=1773997179; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mltmT6aMoafo7V/fQ8c/CuHXNuMtEfOyupyXicc8i+Y=;
 b=St8pb9u/UvSIAl5yF23wcXx1PzNyCCEiVyCjgWOwqv92tlWnapAWQcxB/8o60rStBd
 KXMnSWxzpEJneFdQpDFiXwf7euPK4vxmusvLs8ZlvLp7TUS6PLJ9Udbybe6ynK4NvpaJ
 pmRE7Rsj4TSIktM4kR/IPGduHZHxK8cE3DHbuUcvZlegU5cPz0YcxJa0KKOZpEAMxg5W
 K1UXqbvzUntbWtVotaSsZvd3/eAcRwh7J/j1vsYO0y9BJKhVtIbih/skO61T8j+f2wbY
 3rFVuFfzjGvDxMqv0AvkuL/RwElKCGwLh3qAHPUeqUHX67/AtdbpqgNzR13Z6Cmu8q9o
 zDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773392379; x=1773997179;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mltmT6aMoafo7V/fQ8c/CuHXNuMtEfOyupyXicc8i+Y=;
 b=Y3+o9Uo5PGjLSOEuvx94WICXlzk6GJiL6+t+MgJS9jYxlmdf7lUrFYjKkeKmXuix6k
 TItS3Hjt4/h1gawIuT8SUXc7Oqhcs/ZXxHvl1v6V/RfLtehQFf1ITH1B06SAxbzhmg+D
 mfCT5KLd9JJmnvpO42n8yEIa37yWqnz0DLb/37Y6N+gTT9rSPiMa8czPktXQ6wWlnmvG
 QFVag36kuKOPf7LskNR0fo/MtCuufXfmI4ksa/vRDcORmCbYMvqW9Rmf2GL/Y9xELTO5
 S+aSKTaJKrDkecaeSc8QD+aqHBdcpssLu8ZvOiSkUmrTQSItLfXE5992ULE0+wBwCima
 wG6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjNje1XYpPb+Dnjts6tnTM0sCR4R0Zs3wzJqakNQ6pjXMwWdfGjQuzE/bY5L48GjxTbCGXDci0FQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx9ofyt4jgOM/OpuZ3LnHofAP0aTL0ub3uyfGTlrWZs7N0shKwh
 Kr+349tANps6GiInpnG5WOq6iEVryPnhIjDYmMPRB+0FvpuJFQ/3Ooa1/MavxYMZ4Knct4bI0rG
 zNzNRCA3HyEGYYFj+hOXAINM8olgyaxakBdYcTfsw/Q==
X-Gm-Gg: ATEYQzxm9bT2cxYKG6uOLcIY8rPLDUXqHPIJOuJzirijyLkifEDSa08eqkLSMyOU9/J
 jCnOBduWXowUpy64qdBnRVZeBF/VNdTtQqULkXmc2szSI0BZiJhZKElMwxy7c0u+4FjwJ+Nyhh3
 ZJkSe70YdL8lT8NWs6RRRk2Wrbkk2Jpz05r+998XfbRLdAY3kFX3XWDExX90I7vieVOaaDf/Ijc
 QDL59FRpHgmTj/K1xpmo52HystYmvJdJndxNilqJg4FgcjBrm1UjW7XyBhYqWpjzvWvToH2V0aH
 oBo4m41115dbQQvj+pU/LExvOe4GT8w1puI/3znXBS1cf+FgL1WOOVwtFWiXKdFFjzc=
X-Received: by 2002:a05:690e:200a:b0:64c:a1f8:ee27 with SMTP id
 956f58d0204a3-64e6308bde8mr1853167d50.72.1773392378727; Fri, 13 Mar 2026
 01:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260309214852.92545-1-lucaaamaral@gmail.com>
 <20260313021850.42379-1-lucaaamaral@gmail.com>
 <20260313021850.42379-2-lucaaamaral@gmail.com>
In-Reply-To: <20260313021850.42379-2-lucaaamaral@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Mar 2026 08:59:26 +0000
X-Gm-Features: AaiRm51xtyHatKKDExPQgrJMY0-M31vYv6zkJHYTknmG1JJmEe1dOb5Pj8zMaiw
Message-ID: <CAFEAcA_w4_4by-iWm4CE3J3Ydm1B831nQbv=HHOtW8i7wMMD0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] target/arm: add AArch64 ISV=0 instruction
 emulation library
To: Lucas Amaral <lucaaamaral@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, agraf@csgraf.de
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Fri, 13 Mar 2026 at 02:19, Lucas Amaral <lucaaamaral@gmail.com> wrote:
>
> Add a shared emulation library in target/arm/emulate/ using a
> decodetree decoder (a64-ldst.decode) and a callback-based interface
> (struct arm_emul_ops) that any hypervisor backend can implement.
>
> The hypervisor cannot emulate ISV=0 data aborts without decoding the
> faulting instruction, since the ESR syndrome does not carry the access
> size or target register.
>
> Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
> ---
>  target/arm/emulate/a64-ldst.decode | 293 ++++++++++++
>  target/arm/emulate/arm_emulate.c   | 738 +++++++++++++++++++++++++++++
>  target/arm/emulate/arm_emulate.h   |  55 +++
>  target/arm/emulate/meson.build     |  16 +
>  target/arm/meson.build             |   1 +
>  5 files changed, 1103 insertions(+)

This is a huge patch, please can you split it into more easily
reviewable chunks? Something like "basic framework", then
add the instructions in multiple patches that each cover
one coherent group of insns.

Are there any places where your decodetree file patterns
differ from the tcg ones? If so, that's fine, but please note
them in the relevant commit messages for convenience of review.

thanks
-- PMM

