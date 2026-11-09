Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF13E606A31C
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 06:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsrroNq9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQJA3-0004wK-7z; Mon, 09 Nov 2026 01:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xQJA1-0004vY-RU
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 01:47:21 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xQJA0-0004lB-F4
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 01:47:21 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-67921b515a7so483284d50.2
 for <qemu-arm@nongnu.org>; Sun, 08 Nov 2026 22:47:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794206839; cv=none;
 d=google.com; s=arc-20260327;
 b=YoV+Qu+6NPRy2Vr+chAE6TVX9dQ1DGLbi62T27Q7Il41Rd+rPhVxfRwbVHZOICXFGX
 Q9hGUbA0J3teuk3w0ZeI6e+QAP+aL1zfVvVO3OVwuIsjKzAF7Amj/On1144tvV57RhhK
 ZLgAGkKLW9q1RVpa7SrfAsDsMMSoUwnfP4r07CMwFJ9kvBGYbDj3HlbmjcLLL52ksQIJ
 IT2NFGEeZlU3i1T6tAGomUNqenqVotZCjbE4Du9NVQEzAE0uEx1V2fu3kBpk48EtzXOc
 JRQF+hmonVrZPMaIpcyEu4YcO58gmHdBWIhuHM9jOy7pWBY7SYM1MuoRhQ2z0/KzsvxT
 AqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JtYI2bswTvOZejr/2eSca0LUR7HwUbbtr0PQryubxWI=;
 fh=ikLWJdryfGyAOp1OK6JMD9ru5dqRQEqZBlMjg6xovbw=;
 b=gs6auPmjQxD5aRBiP0jTaKHWgntSI95Rlx8QfbikUH4d0ZcKMRR/EsNkwVBRUAXhgj
 OR7k8Ducs1Tt2zlrSMtZYFlHNY9BhZU2LHQOsRv60gH86cT0Pf1FQph8nDvPUiv9wxje
 9ik2N8w1gydzKLfVLYZSokNw+IrWpS7/4yuW6nVJJBVmkfkpkxYFmlwMPl5Fq5kLyLn0
 CXfpsySUKAJpnnZViGeEKSBry3XCjEx2nMr6dpsBJbVYM0GUImaptXt42k548kRVNwap
 tV8bUPpPf84TW+93JGUd19zAyuIpI1DAPunKCHop9z9ph3hH3qRnuxqkEZ0PqUi/pjfq
 ThFw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794206839; x=1794811639; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JtYI2bswTvOZejr/2eSca0LUR7HwUbbtr0PQryubxWI=;
 b=rsrroNq9lvBI8PYqNBXSItVjLKFi4R+Leo6SeUZCpvemFtxL5y9Y+6Jrq6HqgaSkjE
 vjaPxpKX0YDN4uT+UYyKyeN870H4oy3FxgYrgSu3y2RIJ5qAIlf9ilJvS5NT6SXBU0/Q
 dPJYUsasiRZDvWwg9OQ+KdRbqrJRwAAq5ytTOOoVzcZ42/aUEnAEo7qVihVfzbcFRvV7
 nM9OW6UxGj6YKmVa2p2fVicmvgAe65JKNxpD6VUYF0YYQVqnr4JDQXEEzVBn7rNFb+FS
 udcPzdKhHLKrAReRtiqnPv9p+k16Lq2UJxv7vVvLW0r4iIQLOPn/Yr1dEy4/oeT2nsnU
 AcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794206839; x=1794811639;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JtYI2bswTvOZejr/2eSca0LUR7HwUbbtr0PQryubxWI=;
 b=Xj1lByxB4zx9lB3XYoxSmwnNQcGu3pUTDCIiGX7t8ounoUSHGlIdbKN87q7Dfm5Ww2
 44490aeQeGeMfrF90+WiM+tG7jpkM9oLq/0jgG0oPM0NfMMEWOQBBJQzNNGPgW01rVkj
 6v682vccppYfb3z3e8gFR+XY81e1R8mbkmcWdVnOgWqejPSps7Ejlz81g6PBfbu5ecmc
 7QDDHVOqwh7GqqiEWi7X6d5xS2sopwMdC1db2Xk00uVcqAwaQPsC9E9gdZKWQhSz1kXX
 kQS5eC/WxrlzQ6VL1715T+heDJHNFepeJtqZBNEl2UvgGe+HBO5vVuuLYT3Fzns8CQTY
 NWfA==
X-Forwarded-Encrypted: i=1;
 AL+hErFPIvtIRv//77ZABzQmIyB/C5N7WGburuoBdzdg275VL9bYhFQJSz8pLUVNJjMakeNbBaWNMz00hA==@nongnu.org
X-Gm-Message-State: APuU4Z8H7eR1d+6ObX75KrRYWBw62TX1CgQuH+F6UEtwpMg2xTKDLAxZ
 fsIBgHE0NPrxjwpEVI5SqkCZMJxYgHlVCIQjzbLrXppJl9lJlwr2V2BSYqVjGg+1+yLXByxqkrc
 60meZdO4QGk8+EZt38ztGuoj5H7waVDs=
X-Gm-Gg: AYBFou02DPJlpm+5al67mEm5IB09yGDXS20D391NOfTBJZf9OO7VC0iEJO8BmlIhumV
 YCcQ49Tbw4KdSK6xgXuH7cvBwfMobvc+daORSUQXosPiNxBr93VWeY7vugmCK7522d6xsauJ7XV
 4ZUKJUIYhqZ1y2bZgv5F3duky+xw+DqC6T5DdRatc27RRSWvXziBZR035LxXbkZmiYGcC1vyohk
 oWvBOG/+ALm7coKBu5YKx15pLlH34STtg2tbPedl2cZ72e8pLoQWmezqNsqGMX4PCZiuQoi8Avq
 kFA4GDigPXC9Dv0dIEGWWtXSn9sIx4quPJKySCLO2BFwi9IJ4Xq+rbm12Pl9rJ1v2pGs7OFMFp+
 C7tBh+14t1VRuJLtOunnet4uKPl06gyP2UP3CG8psh6hUaUML7b12uMSSXR77/EfYtxkwXLki4W
 l40w==
X-Received: by 2002:a05:690e:134f:b0:67b:fbde:ba7a with SMTP id
 956f58d0204a3-67c3da64c01mr1953808d50.85.1794206838992; Sun, 08 Nov 2026
 22:47:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260927075108.3621107-1-bin.meng@processmission.com>
 <20261104151128.600958-1-bin.meng@processmission.com>
In-Reply-To: <20261104151128.600958-1-bin.meng@processmission.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 9 Nov 2026 14:47:06 +0800
X-Gm-Features: AclHuK9Qk4NvDXC9KP7FRdkcY67bTZt3y5hCzQ52ytSFFyDukB_VtuEFHn8sf_M
Message-ID: <CAEUhbmUwpvcAU5z2QxmK_8t3t4PC2ATFVMV-6bq8gvZhDW6O2g@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net: cadence: Honor subword lanes in the GEM
 registers
To: Bin Meng <bin.meng@processmission.com>
Cc: alistair@alistair23.me, edgar.iglesias@gmail.com, jasowangio@gmail.com, 
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 4, 2026 at 11:13=E2=80=AFPM Bin Meng <bin.meng@processmission.c=
om> wrote:
>
> Bin Meng wrote:
> > The GEM MMIO callbacks ignored the low address bits and access size.
> > Byte reads therefore always returned lane zero, causing guest driver
> > that reads the station address byte by byte to turn four unique MAC
> > addresses into the same value. Partial writes had the corresponding
> > lane-selection problem.
> >
> > Extract the requested little-endian read lane and merge partial writes
> > with the current register value. Preserve the existing read-clear,
> > write-clear, and command side effects, including dynamic queue
> > pointers.
> >
> > Fixes: e9f186e514a7 ("cadence_gem: initial version of device model")
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> >
> > ---
> >
> > Changes in v2:
> > - drop the gem_get_register() helper
> >
> >  hw/net/cadence_gem.c | 55 +++++++++++++++++++++++++++-----------------
> >  1 file changed, 34 insertions(+), 21 deletions(-)
>
> Ping for review?
>

Ping?

