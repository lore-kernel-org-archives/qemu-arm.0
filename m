Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24155C83F1D
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 08:45:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubbHY-0006xO-4B; Tue, 15 Jul 2025 04:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubbHR-0006uY-Is
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 04:44:54 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubbHL-0006OJ-UZ
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 04:44:53 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7086dcab64bso48738787b3.1
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752569084; x=1753173884; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aor2msl1bNKaxlOww7olaZndpSJ5JoSCkOKjI+SSJ6A=;
 b=HOx2CXFn0oGL+Adi8K8VtJo4es7ZMnUrCzsnn3qm2+89XU6JjJfEl14zlJD0LL/sGA
 wWr2WMWpCDnUNSUHENbKvm9wvILmR2306SvJvFj4Hpz2LiynhhlSfDofdyhDLqRYCCIi
 TJSAxHWJLQUX2w2GoiMor6glfvM8ETSS6YFluyBA2v2dT6+S8NdVkZd+Ijr6crud222x
 fc2bOYyMOBwHZaqJ9uQ5U+63APrvdHFKJDiINKnMG3/sivzcRPbbip69X+LulGhmxE80
 U6wvFap3Ys6wddDvqiIYMzisZ8WOCURFr5HG/eVJCyWnarqvIa5VOAOXDm2etgrGq0wG
 SEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752569084; x=1753173884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aor2msl1bNKaxlOww7olaZndpSJ5JoSCkOKjI+SSJ6A=;
 b=huLpoiHIqNxonZPzNN9caad/dTS902Dza4lSdWOnEROuVTq49qinaVI+UAU0qtmJMj
 NaFI+OR2p5DtTNcN1x0bCu16Nfi1yX5VkIsSve+OtiIAQvUmIB/4s7kM6WIBx7pot9mO
 B7zLM7MgclBBTzIITHS3ar1nvjQNI/rNzB0g1tCUxIF/0yLaNJ+C7nSd/SsLPZjljmrG
 VM4hnFJABLJXerNdGiayOCDNKDgluyBlF7sR4fZp42NjZtoU7D04OsCJTLpRQR+pWIJ3
 2cLryR8WOgI3gk88u0lVutTG8ysRqi6D4H6ZK+U+zWWIXGc2qZD8FrCBX3Rc/U2Uz51n
 bZhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt/W+9SdIro5KSCSgaCFizpT5sT0YXSt3gB6OJ9ll2+J4x9QQC5OYmNM+95m4ddK6u2BqWcBS78g==@nongnu.org
X-Gm-Message-State: AOJu0YxGmWNhO9ob6Er6fibczU657jADDzbLLer7rzcvMj+5tiP2NBIk
 WJVUHcv0izjY4nnxL4AGSraP/kPkN2lLcQMqFpJMPGrybpF3KLl+yVwWJtRT++OaCi6MxgR6ich
 pO4BFHY8gtaUc7Av5iE2KwOfr6fiHLpOYF0Pp74upyQ==
X-Gm-Gg: ASbGncuNF5kU66YCtQixMdnb+oznDkDtgYxMunHGgg6Om9VN4LE22MaV+/OdkM7aknI
 dkpjL/H4JEljwTUWkSHLQzhWJFSemfnDwkUoutTgtt850yKEGxFMcdoFM/AVb1gr5DCEozN18SR
 ltd0n7Qd8vwKztnibxLwfSIWePnR/eU8iK1nQGLcDkBEkyI7IbTeM2VQ/vo6A5XvWwEV97/028+
 ladBAZrks1WPWNWvvE=
X-Google-Smtp-Source: AGHT+IHCzuqq8ZmHpAxQsuKtA2X0/fTYAF+cKgBiT71kUmrofDMYqM8LcI3Nfcq3G4dA+dzxW8gYzFkbRmIny/y+w6c=
X-Received: by 2002:a05:690c:6e93:b0:70e:2d77:3cfe with SMTP id
 00721157ae682-717d786eafdmr254499257b3.2.1752569084114; Tue, 15 Jul 2025
 01:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250708221438.347643-1-vacha.bhavsar@oss.qualcomm.com>
 <CAFEAcA926Tur8wSvSyMQYJ6XXdiU9mNJZ=weW5x67sJJhjvBtA@mail.gmail.com>
 <CAEWVDmvQ-f-S0m_4cJLHkL=_YFRd_XAsoT9ENqPkirS7S8FMfw@mail.gmail.com>
In-Reply-To: <CAEWVDmvQ-f-S0m_4cJLHkL=_YFRd_XAsoT9ENqPkirS7S8FMfw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jul 2025 09:44:32 +0100
X-Gm-Features: Ac12FXyejF4WkzHeinsHu-ikgK9x1Sf0Dmp9tASeW_If5j5w6KGNv12fUSb-7H8
Message-ID: <CAFEAcA-SJBO3gJAkvyyXntjJDFYWK_SjUXpviijk44ToVGA7qA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Added support for SME register exposure to GDB
To: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 14 Jul 2025 at 18:44, Vacha Bhavsar
<vacha.bhavsar@oss.qualcomm.com> wrote:
> Regarding your question on whether the code handling the reading of the Z=
A storage would work on a big-endian host, I believe it would. I think this=
 also applies to the pre-existing SVE code as well, based off of what I hav=
e read from this GDB documentation (https://sourceware.org/gdb/download/onl=
inedocs/gdb#Packets) which states the following:
>
> =E2=80=98P n=E2=80=A6=3Dr=E2=80=A6=E2=80=99
> Write register n=E2=80=A6 with value r=E2=80=A6. The register number n is=
 in hexadecimal, and r=E2=80=A6 contains two hex digits for each byte in th=
e register (target byte order).
>
> From this, I believe the QEMU GDB stub is already expecting the register =
content in target byte order, leaving this responsibility to the client. Ba=
sed on this, I believe the pre-existing SVE code and my SME code should cor=
rectly work on big-endian hosts.

"target byte order" from gdb's point of view means "the byte
order of the guest, i.e. arm", which is always little endian.
This is not the same as the order of bytes within a uint64_t
in QEMU's CPU struct, which is host byte order.

-- PMM

