Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1491CA5FDD
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 01:41:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDBEJ-0006es-KI; Sat, 03 Oct 2026 21:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDBEI-0006eT-MM
 for qemu-arm@nongnu.org; Sat, 03 Oct 2026 21:41:30 -0400
Received: from mail-yx2-x2a.google.com ([2607:f8b0:4864:41::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDBEH-0005FQ-8O
 for qemu-arm@nongnu.org; Sat, 03 Oct 2026 21:41:30 -0400
Received: by mail-yx2-x2a.google.com with SMTP id
 956f58d0204a3-675617094f5so405986d50.1
 for <qemu-arm@nongnu.org>; Sat, 03 Oct 2026 18:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791078088; cv=none;
 d=google.com; s=arc-20260327;
 b=aHEEiVzdSw0744rkYBz2GQtEsdr3RQhmJf3Q/ZrTR+qbYveTztloMAZFpRnTif518D
 42UMKPkhPuyakrR75X/UcJIWMvxyTqPC0/jwd/ixJJ/ONojWWS1t6hHfpMo02eRN3als
 /iUndZvB08NSP7lWd1/nivkWpAGHTUkJRHuOz8w7SBf271sdRrni4wqLS2zKNayQM4jz
 TJ7kh/G754i35FUEI9d9zkDF3/p/ebvKmsfRY5C+qL0QaMIdCE9Y6pBpFsrl1MIROIt2
 fecBDdAKHRoab7U29l/kIINlLRq6NqIuBc1MJDP4cnZylgCNjwXyr2tOTop1khY2AM8z
 4QxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vMoVDe3OUzRN/OxefeqtSS0DcK7Rdn5mEh9jPcLOup4=;
 fh=V4zGZT+i7oczwhGlwZHieJZTrGuV6yh97yeKVUpKs7Y=;
 b=dBX1FHxcc3hBf6uE1qDim78mAvkMlSb5Aiy0ie38m34guoU0eUVr4nHVwlEYEKdFd2
 mfDoj1zFSjLC83kVUPFyHzw6sDPgB5TFBqEqF76BCOMtluwd7TFsk1EHztWRqL9dVnID
 BjYVuwrfT4fxbdvqiofSkYMwmtVH/7qhhAXxDy3axrjE2HVvQyQ9lVV34dswOGrTMPNL
 CU4EBPYOBc6moaHPnAwY3iKA/SgQNu2GL8iDTVN3dUQLkh1USmg2b+pJ4rGjrv55+UcC
 qSz6H0zKn72ARxyW5Z28b2bwbKlTQdgwaL5kqwRBkLeaKc1AO2ushyhGfRagjMEIRWgA
 JnWg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791078088; x=1791682888; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vMoVDe3OUzRN/OxefeqtSS0DcK7Rdn5mEh9jPcLOup4=;
 b=N8bwZ8YQfGTUOg1vzKLd132+B38B8+2hal9NP3tvjxuxkFzxss2Eajd82OQGph8KfK
 9+XDHgGHQk1pq90welJYpenQ3mATSK7BsnN2hJOC8rRBDqqIuQGEjj4MVppYCBszFPJ5
 tgckTC9XvkZSigtb0onZZr/dqaT9J9nD9T04sa9vP8Pm6LrREzKwdDQ5Uj1DVKeIK+YJ
 Mb/f3Ghqz+KnEzGt1Dvu0pGUlHeHv2fJpBEeY2IWl+qXD4Ou9mzyQAVODpboAUhOBmRP
 H7Rt9Ury1VFU0gfDSW6wRmlFgwbNAgHhw3k/OL3Qe7p8frmugAxL5YsU3bcZhZ+/PYb8
 914Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791078088; x=1791682888;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vMoVDe3OUzRN/OxefeqtSS0DcK7Rdn5mEh9jPcLOup4=;
 b=gjmn8cBVkrYSc2PKNO2GRU2fPQ9i6uyDhijtmweCzrivnztYy3feqxlCqxeOp9t/vD
 +59PR+L5AwV7QW0WPuhl5YuxeaV7SYDZ0wUUYn/9ySB9RGeUbtqRkKsWVZLy+a3W7QQn
 2aMV9jXv6OqHDNvGFT2qkQ/4h9h4Kt/bWOYiunhlWxl5Ct6ArzIT8Ts4MeW4oxVZnNiW
 YERqo4H1oZHPrcLBPqhV1foM1foARQYKq0yoryH8qzD+AQcUulYbTGASWQhYbdjJGMmO
 idzM5sS6EPtPJOBIcPv8hpe03Z4mTBjxDq4P5kkMz42OehBr4vfzA3RoyvCvkLEFhVEE
 hUAA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy3CIIc37uuLFj+w7DVywcEz7tISi+dkaz/0UovcZqWtxtlR9+Gqdb+zKQz3KEdcM14rvD6lwGFmA==@nongnu.org
X-Gm-Message-State: AFq9FYLE90NYzXkKvueEBbo4Q4XmM9VmAWyyPe+n2C+Z3dNRfvNOsoeb
 /lbTgyjCSb34/eD18O1F4yHcaIV4GVDm7LC3fejibz86XNW6/hmEYUngMwnllH5CKnnD/TRTPkG
 6AwXgPCWlmMqK2RCayHu8JThNSbLsRQY=
X-Gm-Gg: AYBFou0SvXlWjKXIRZwYoqwrJIMTTVPFrIxE/dNtyKOAL7cXuRGdNjzffTQPjsV/+/t
 fe+x1crCYrezmU95Lx0OU8DSydGWUnt4KqfPFVM4kryRcwOHxeuTMLktKn0HM3z0hGDExA9levO
 tFLE2Nzrd7OhtEwmBMe+YdIVYBUKuvBXGffmoGTH1+nF7SGeLHAzWt2F/1NdMX2NPACcJ134EEK
 t4M40F0mvGggrWiPXS3oX+NenF7Ve3EFARouhScbrNiU5qFmNvfXyehstaNMtsJjsDe4Itog9eg
 sA7J2gjZKpk6ODq/i4ZiQDGsTgv3yF8VJOYAxKlvyYdF2/KHOj6VxKge0SYOCQv2BtdWCTTMJx1
 w+yksXcGiM1ybVFMs
X-Received: by 2002:a05:690e:4089:b0:677:d3d8:990 with SMTP id
 956f58d0204a3-677d3d80bc5mr32942d50.6.1791078087838; Sat, 03 Oct 2026
 18:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260812013619.2134092-1-bin.meng@processmission.com>
 <20260812013619.2134092-4-bin.meng@processmission.com>
 <768450BF-240E-4E73-99FF-E234915C066A@gmail.com>
In-Reply-To: <768450BF-240E-4E73-99FF-E234915C066A@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Oct 2026 09:41:15 +0800
X-Gm-Features: AclHuK-V73b0EH9hNCLlUQnpHETqtuHYj9VD6MAz-2xa5c3e3ZY1rn-p3iwVa8E
Message-ID: <CAEUhbmVFR1OR6Zmt5YQ9T5GBTvdBszNxP0=w+M7aehWkUUuFEg@mail.gmail.com>
Subject: Re: [PATCH 03/10] hw/arm: fsl-imx6ul: Map early firmware register
 placeholders
To: Bernhard Beschow <shentey@gmail.com>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Bernhard,

On Wed, Sep 9, 2026 at 6:28=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
>
>
> Am 12. August 2026 01:36:06 UTC schrieb Bin Meng <bin.meng@processmission=
.com>:
> >U-Boot configures the AIPS bus access controls and the i.MX6UL SNVS
> >low-power registers before its console is available. Its timer setup
> >also enables the system counter through the control window on AIPS2.
> >
> >These blocks are not modeled yet. Map unimplemented regions at their
> >documented addresses so early firmware accesses complete without
> >falling through to unmapped memory.
>
> Hi Bin,
>
> You could try setting
>
>    mc->ignore_memory_transaction_failures =3D true;
>
> in mcimx6ul_evk_machine_init() instead and check if that prevents these (=
and any future such) failures.

I think that flag is way too wide to ignore lots of failures, not only
unmapped areas.

From include/hw/core/board.h comments, it says new board models should
not use this flag to enable access to unimplemented devices.

 * @ignore_memory_transaction_failures:
 *    If this is flag is true then the CPU will ignore memory transaction
 *    failures which should cause the CPU to take an exception due to an
 *    access to an unassigned physical address; the transaction will instea=
d
 *    return zero (for a read) or be ignored (for a write). This should be
 *    set only by legacy board models which rely on the old RAZ/WI behaviou=
r
 *    for handling devices that QEMU does not yet model. New board models
 *    should instead use "unimplemented-device" for all memory ranges where
 *    the guest will attempt to probe for a device that QEMU doesn't
 *    implement and a stub device is required.

Regards,
Bin

