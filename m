Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp959471njc;
        Fri, 15 Nov 2024 05:23:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWJVX533FDvdrkRvMNj8XFxyrFtZqY2jTxSdG+BlqM0H8Admoi1I/sc5slb/zX4yGbGqyHLPu9/TJclAg==@linaro.org
X-Google-Smtp-Source: AGHT+IEsu1xUNSNLpe1ME/w18911vU01BVWXGmh0jW+gwpGTDPyURngJX2pxrxSAF6S9rnn8DGBP
X-Received: by 2002:a05:622a:6107:b0:458:294c:39e7 with SMTP id d75a77b69052e-46363ea7c9cmr36563971cf.38.1731676994455;
        Fri, 15 Nov 2024 05:23:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731676994; cv=none;
        d=google.com; s=arc-20240605;
        b=SPaWsSnyvbRAreGtlh91UG0dcZaUzui+0+JtJ7HeYkvtPNN0MX3JeFd7Wl1BQXC3eH
         JsWu+pUG9V5SR0KIsd9/BpHgCL9D9Z2sU6YJRYj4ECngk9Lf4GaOKJlFycqOkSHHTVr+
         i9hGf+a9NTYM89dbZkiHScOQoGAdk2aQjV3WlK9H3+5xBGfJ/GlwCJ6ZoCEm3JsLVJHu
         vgqwkwQcMDtdzn2Aln4efEkGMjrq08YOob3Lx3H9VUklBxcmP4AIJ66THtIsIvl24rL5
         ifV8gGfsUuu8A14sP/0tuKx4wjFki/vd+CNlAuVi/fFK3xXIIV9oEtw1q0P5ZV3NcOd3
         G0cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NGPP4i7QbtYZwZYRq93bb60RZTSsE/TgJjIB0NxYoKI=;
        fh=adDlGcu0xHQur9DKbGnup3yOLwrFV1y0o7L74W+8hbE=;
        b=BVoksUhkSfh3LVT+u++QIO6niXHQ+kVO5Xnjar5ItSsI6zT1NF+pEx5Q+htuwNrL4Y
         mYuPbK7kDg16GyshGOhcpnyshMhWafwXNhIDdOBkIOvi14P7ydd13JoiF+1uWpsAspWd
         HJirhulkJEuwfkF3EZTEri1k1gT8Ijnt6/gv44F5oYkw9uKyIHziayFwjdU5e5/oZKF1
         eyLv6TWOQmpUepq96XTyk/+MxNUgqqw7wFb56NC1OuzeiTvlV2GTmM34jwKimMtHE9nC
         GLoQyRqSFiHdi1tgm8yLNzbV4pmyanPq6N8o0UVBzP3biJb9XMlHzJ9OESJokKJfoj+p
         RhpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rPLDjCJq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635aa9f378si38197751cf.248.2024.11.15.05.23.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2024 05:23:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rPLDjCJq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBwHk-0004mk-9P; Fri, 15 Nov 2024 08:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBwHi-0004mM-Bv
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 08:22:50 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tBwHf-0006mK-Cx
 for qemu-arm@nongnu.org; Fri, 15 Nov 2024 08:22:49 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aaddeso2202822a12.2
 for <qemu-arm@nongnu.org>; Fri, 15 Nov 2024 05:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731676965; x=1732281765; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NGPP4i7QbtYZwZYRq93bb60RZTSsE/TgJjIB0NxYoKI=;
 b=rPLDjCJq/oFelSV8n2WedtlK3sUPV1xJa+yf/w64ezXpJ2EddjigoKxCgs5tbCU/m0
 gCWf/Ca2nfPMRP5Xka61n0PZ2Yw7cM4x5gEgWYFfj9Qe5KP6mGRjQB/iC7uupyinuKeJ
 e3+GoMxakjViBkIBXhjYtaPJj3E7xSE1xJc6GoH1LPKQEA0avfT3fCLLZaIxfmRMOAO0
 PRbFrH0sSyADP5V0ML/yTmj5k9rlGfCHRT0bzkb5LVEbD08Kanqc1LU/D/BnnozTU7mF
 JgWhbX+WP8dqE4mtZtK3LwwF88rugVbZAIOhK8oRI9T5OUxqHYObEEBWiwy9wVCjFik+
 HX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731676965; x=1732281765;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NGPP4i7QbtYZwZYRq93bb60RZTSsE/TgJjIB0NxYoKI=;
 b=fKWBrKtfnxQ5i/BScAk8/faaP+1WZ4fDmLP0P35eum2hh0ILKyflCqix14ZRz+WzJM
 zIGGpd0XUIXSDa1xRJ4QTUpdNdVYVN2/aNwADkd+AVYBi2Ms2eRka6SJGN3SA1LFAbCR
 z/eH+firpcQgVc/ZoLocC4TLtfV3X3y5QxQuBjmkloIQKVrIO0kyJGAgphipsPDOicXu
 sN149M+8e6GxTc0BNws7sWZTjjfuYQFebPgwqnKtYZsWCHvuSuFfZYKrMFocGfPHWFUH
 u06l5sHENBXmzhWECUfmZyuLGbxH9uCjLk59fMDOW43AOHC0IMNj6DM3gCBT6RdWErI9
 1lHQ==
X-Gm-Message-State: AOJu0YxM5dE4XgPzGqrXloa5FmihhiaCnKJBr+BtiLAuYuencNrNmXS0
 IvHe5yPCpYav+UFfY6/3hFouDcfw+yTnsBry2D3vv7udhZwIGSzCBAeJRWHTDjWCFLuQ7QJdIaN
 mgaHIhj5WqagiFA4RyHEqbEDS9FJ18BkhAJ0ZXQ==
X-Received: by 2002:a05:6402:4309:b0:5cf:704d:238d with SMTP id
 4fb4d7f45d1cf-5cf8fbfe648mr1897399a12.1.1731676964999; Fri, 15 Nov 2024
 05:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20241114165900.6399-1-paskripkin@gmail.com>
 <20241114165953.6894-1-paskripkin@gmail.com>
In-Reply-To: <20241114165953.6894-1-paskripkin@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Nov 2024 13:22:34 +0000
Message-ID: <CAFEAcA9i+YmGj5tznoc9FQkDQKqN4vx_0grOjh_ZFGyj-aPgng@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm/ptw: respect sctlr.{u}wxn in get_phys_addr_v6
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: feQ9WyKsDGZA

On Thu, 14 Nov 2024 at 16:59, Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> get_phys_addr_v6() is used for decoding armv7's short descriptor format.
> Based on ARM ARM AArch32.S1SDHasPermissionsFault(), WXN should be
> respected in !LPAE mode as well.
>
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  target/arm/ptw.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Instead of this, would it be possible to have get_phys_addr_v6()
call get_S1prot() (replacing most of the existing open-coded
handling of PAN, simple vs classing AP model, etc) ? I haven't
looked at the fine detail, so we might need to tweak get_S1prot()
if it's missing logic that only matters in the short-descriptor
case, but I think that would be better than having two places
that need updating for new architectural features.

For instance, we are also missing the handling for SCR.SIF with
short descriptors which you can see in the S1SDHasPermissionsFault()
pseudocode and which we would get if we could make the
short-descriptor code call get_S1Prot().

Couple of minor notes for v2:
 * if you're sending a multi-patch patchset, please use a
   cover-letter email. Some of our automated tooling gets
   confused by multi-patch patches without cover letters
   (and, conversely, by single-patches with cover letters)
 * our coding style says all if() statements should have
   braces, even for single-line bodies

thanks
-- PMM
