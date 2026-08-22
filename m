Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E01C5DF97
	for <qemu-arm@archiver.kernel.org>; Sat, 22 Aug 2026 11:45:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxk9r-0002NZ-3l; Sat, 22 Aug 2026 07:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wxk9q-0002Mv-9J
 for qemu-arm@nongnu.org; Sat, 22 Aug 2026 07:45:06 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wxk9n-0001Ld-Mq
 for qemu-arm@nongnu.org; Sat, 22 Aug 2026 07:45:06 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-836cde02992so23017887b3.2
 for <qemu-arm@nongnu.org>; Sat, 22 Aug 2026 04:45:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787399102; cv=none;
 d=google.com; s=arc-20260327;
 b=rIRTAbdKTS/OIhW7mFotrYJGWNYDYzSA9QElkh7kdQvJDlBjPIQ/LTCy7V6JjZZkgH
 zUQpwwkH5uqhh4ervzFTAMw8ZsdAh+5dL/jsUobMNjOBocpF/r+uTsKhgPx8FD3wPX2o
 OWdwM+5pi8qtBdVqbW1y6phWkz+3IsryHG2YmHffaiRfEKgaKg+MyoC9zIvfkDsWIgBb
 UjWW0ZDVNQBZ5+JYM8CpFq+fet1g/TfaVa4hDMHHq10FBRlBFCjJze3CZrXC4PIQ7rYb
 hx7WhDnNI3xBAGbiFFBp0bTBGExnRL5IO8LIjT5HYfx68PWDO2oOnYoUHI/2QxSlN1xI
 VymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jBzV9P1UTdI1U0NWqEwCZMjn3FmzBkuEn/EfV7c0WCI=;
 fh=H8NWyKLwOc0os6Y7K4qfiIeWsi4kyyvPKHstassbC2o=;
 b=m9wqHANTRV9KHSrCaE+SCZscA0n7Xs3TUrO+JmpuPrCLkd92zsPgd+2hCv1nD/HUAf
 c1l1ORDNRBw8USpqzR7/TeN61URAWB8t888plgL0NjJsYr47+BFGuLIKjGNArT2QItZ1
 LHN8n/cWXxN2rbjn00KFqdm5fH86JTECs+wFyAQryOMjYf/LDDEHsMN+ZcUEkXXDnVcl
 dS91N2DAdzhm/1mrxH/mfHSuRmzGjpTTY/KmRkaCsm3gtWyD0hkpRx2XXJWOArevfa0B
 EbgeZNzJnpiaJx824h6VjSmTNhyoCPdLcNLXLASQBaf3IKd3R4x9KYXFUXbx6hGmjD6d
 yuUw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787399102; x=1788003902; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jBzV9P1UTdI1U0NWqEwCZMjn3FmzBkuEn/EfV7c0WCI=;
 b=o7KUGc+rRgsQkk2kPhlY7tH7VAL2DnxPZm9N9ueuBamv4ENUEpuPXE+L0hBAbWAtw8
 Fof+P6WeUo7f6jeYNsa/3D6hYMMJv2wi0Ig1EkP50eKDqA13e79XT+J8aH24fb98JBxZ
 gSsufL1FjLD7mHuG+5oi5aI8fLrq24Hqbg2WY+4F5rWQaVbLB4o/at/rVxEPE3at5B3Z
 w8vOm4H0rxd4duVFwyBwTuCs3w5KXNFKPiLWrm1yhrM9/GceT/qWyqq4XzSQiYpeR7YD
 eFYG1p14eAtETreRfSgRKhSYhJoLj6yZY5BX7O4w2EySCCwYUJkY5Mw25DJ4U/uI0XTA
 EJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787399102; x=1788003902;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jBzV9P1UTdI1U0NWqEwCZMjn3FmzBkuEn/EfV7c0WCI=;
 b=pmGzwU67PPATtnhotMexcQHz2U+BEHfwKSR9gHQmeb+1TkibgrTreYRnQWG8RmZ1LP
 pZYH43pdZH0QiGKka6Cnb/z2vmiAnxVPtJ+oIhYG80kO5FF9ZkiTp474tm6JvhoNasDa
 x6ptCtH8fUOuCCAsvNdYFs4ERr5e3zMBdwqeOFY60FDX9zaxUEwPoaukioacZd/+CK9m
 f3wq8KYZiSzWzSkVZJHInY+26gmST4TFZ5JznFepzCGkr7UsORd6Ig46FaBMQ7Yry0/8
 s70AzGK5S7QlMJQRTqooc3K6wPUgFcbf15yQQ5FNqkMetcv3xDXxglgCz1tgknDlE3/M
 xOBA==
X-Forwarded-Encrypted: i=1;
 AHgh+RprAIyfobeO2AUbKDT+IxtQuErVtT180VbfK6MGS5kGMw6vjDIA4eNpBUkVUg5IsgMUgw9AhZ9RyA==@nongnu.org
X-Gm-Message-State: AFuF++no1Y98q+D0mPTvu0ZWEJqB5MNoJGyHLuui43FyTdn48YAsgAfo
 CQjSWuXiJ7ONpU94qr1jKz99OcJ7a56qf1Mdrj6tYlLO8cHSdSUHvm+zdVo/TBPHxoitj1TfDIt
 CQpr9GznE31kTYfXANpSI67KKA7yc8n4=
X-Gm-Gg: AR+sD12L6iDRMiiSrFJrKbMMCcvY2uFsTrPJRMPs4pubTMAjh/JHajWCb9kveK1JwZh
 gMf+azR1jER3b/3XOMjc/7gbSuxAZ9luLHA+0xXhdwvbxVIfaW91FE6q36F4OZnCmTylsAFyCdi
 2Xx+ey53yKCZ90ggz6c5BhTOuaNbyVqetJo1d8aCG4drnPCkBqwo5Hj8KNeAmGiUq6/aVSpQ8lC
 KNSrcIGypL2jzgrKKgZ84jnVEAALQWvS91n42gIAUGuOqSKpfAp3NYv1E+0OGhEzcm0VgOq3Erq
 yyzK4nG1ef3rsBMSKki9XaHPzvbXbxvT8Re82FjgfIIStnsnAsee
X-Received: by 2002:a05:690e:4183:b0:667:a0f5:345d with SMTP id
 956f58d0204a3-66ce4a0fe73mr4585323d50.10.1787399102210; Sat, 22 Aug 2026
 04:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260627154225.863984-1-bin.meng@processmission.com>
 <20260627154225.863984-2-bin.meng@processmission.com>
 <CAEUhbmXe=aJ+K8isdCpdFn9Y4LLTf9SARY7VaZoMo39SeYJAcQ@mail.gmail.com>
 <CAEUhbmXchynHnz1Zrh=WZC4RrmamRGcUm7uGda45kUUVSrzBjA@mail.gmail.com>
In-Reply-To: <CAEUhbmXchynHnz1Zrh=WZC4RrmamRGcUm7uGda45kUUVSrzBjA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 22 Aug 2026 19:44:49 +0800
X-Gm-Features: AcwNN1V0yO3IigO7wJUoT3YAbZ9Pf7lTTKlu6pI-qFkIiTsq8U8G27df-gx5uGg
Message-ID: <CAEUhbmWrx=hJb++2KVn2kqJdKd_gDYpEygDNMri5T8cmvNkAMw@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm: xlnx-zcu102: Fix up DTB for direct Linux boot
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Jul 30, 2026 at 9:51=E2=80=AFPM Bin Meng <bmeng.cn@gmail.com> wrote=
:
>
> On Wed, Jul 8, 2026 at 11:50=E2=80=AFPM Bin Meng <bmeng.cn@gmail.com> wro=
te:
> >
> > On Sat, Jun 27, 2026 at 11:44=E2=80=AFPM Bin Meng <bin.meng@processmiss=
ion.com> wrote:
> > >
> > > Real-board ZCU102 DTBs describe the UART, SDHCI and GQSPI nodes
> > > in terms of ZynqMP PM firmware providers for clocks, resets, power
> > > domains and pin control. QEMU does not model those runtime firmware
> > > providers, so using such a DTB with -kernel currently requires users
> > > to edit the DTB before Linux can probe the boot-critical devices.
> > >
> > > Add a board DTB fix-up for direct kernel boot that removes those
> > > provider-only properties from the boot-critical nodes and rewrites
> > > their clocks to fixed reference clocks already present in the DTB.
> > > This keeps the user command line using the Buildroot-generated DTB
> > > while limiting the compatibility adjustment to devices modeled by
> > > QEMU.
> > >
> > > Document the direct boot flow, the SD and QSPI image layout details,
> > > and the remaining firmware and real-board peripheral limitations.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> > >
> > > ---
> > >
> > >  docs/system/arm/xlnx-zcu102.rst | 139 ++++++++++++++++++++++++++++++=
+-
> > >  hw/arm/xlnx-zcu102.c            | 109 +++++++++++++++++++++++++
> > >  2 files changed, 247 insertions(+), 1 deletion(-)
> > >
> >
> > Ping?
>
> Ping for review?

Ping?

