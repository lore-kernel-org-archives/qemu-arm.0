Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp16784njb;
        Mon, 17 Feb 2025 05:04:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVmotlHW9CxUv+9nyahHeE4j5ii/GP0u9xFjDmg5Lt6lO3qd6b/DDtPmMIunroG//hWUu9ezPxJ6pc5lA==@linaro.org
X-Google-Smtp-Source: AGHT+IH9qtaong2eLUK/juvhsWHYJaAbM2Ewtq/fkrkmQmSjygfOYST/FS8+F/MfUEQPb4s15jWj
X-Received: by 2002:a5d:598b:0:b0:38f:4e6e:22 with SMTP id ffacd0b85a97d-38f4e6e01a3mr900343f8f.48.1739797480008;
        Mon, 17 Feb 2025 05:04:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739797479; cv=none;
        d=google.com; s=arc-20240605;
        b=RV+o0CtdHVmlv1leFjYYrPY792yeR93DMuB/mmqpzO37pA3Kk/DPfGCkeza3Vds4wY
         NsHCUcR/xuSps4PRdKX86GPC8uEGgWMA+jWQmyZrXnbNQHDFBhOKxB+YK3jK7I6FCtdP
         w15IBjXjc7Qq0gITAK/MpUwIdDuGWx3WMt7f3+VCpiVebeHyh2bIsf/dcIzGqiWjI7Lo
         rVNF/iHg5NX860AS/BUDfxxtoJ1UPgKupPiFUtXjWYyZAhbnKPqSQRUWPGYPGIDiZsoe
         BAjH0DngwnQYzZG3uX5AeqZ0eowydyduQJ0A08jhOjtAepu5gHtkEDij0yT3Wy0WoRl1
         RD7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=N36CzgkxQ/ZEegvCvcDE6yqLGkrsappvLNmw9W/A26w=;
        fh=INHftBK+eErPMA/c1qJSnbmgqy9cZkH7tn0L+zL1vN0=;
        b=Qv+0jV1Q9tYk48xpqDWVUxE0RhTIhCYA9bP50ilydXW406D0e38BPWwQPWyofbeVyy
         7hasUFeM7ayuaUV3lAedawxqqwqTHlbQb9kFx6fedWARh/tX0I+mbT8ps+Z302cXoCVH
         Hy3sSCcU/dxUVa7JEBHLLCcye5hhn0gG9lvReTXsPteji0do0BXQ99RdeWVN4eilFjJi
         Dgqj5+EUaVdh2BOW70wAuiKG6JVc4U1q8sCBpvcw++pWttsKP+Z3Vg3Y0IVGkG3yYmIN
         A+l993QLmEi6olb+vR7HCqoFLOmLfNFx+sgeOxeS7fs+CIUlnuS81KTpZDydj+xaYzjW
         JftQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zQFa+bM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38f259f80adsi9994417f8f.474.2025.02.17.05.04.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 05:04:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zQFa+bM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tk0my-0001CS-4t; Mon, 17 Feb 2025 08:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk0mu-0001Bv-2f
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 08:03:52 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk0mr-0004Bp-Qx
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 08:03:51 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-6f4b266d333so30861057b3.2
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2025 05:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739797428; x=1740402228; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N36CzgkxQ/ZEegvCvcDE6yqLGkrsappvLNmw9W/A26w=;
 b=zQFa+bM5cUeM/5BVetYRXM9xATljn7HHo+81XM1TmHfpTHKHfJuH4DRUzlPxNT4adg
 brWXiA5pjhdGrrGiNLsPuFBgejeNGYH6jiSCvCkIeRCtTirz4835n/Im5hzx7I3u7EM9
 4SLpAenV4XfPtT/EadWLfJyygfTuPEQiUKuDkZnbZQchqRaLH5cVorglu+Agu7SET1VQ
 fAr4TCzWMGzWONbB7I/g/wA0PurYfRACe4IA/MXB5OtbkMhnp5XyJ9EMo+7vFWW88MZn
 yErFYDbupl2Ilf51NfR+lbcXFM0d0FI8ClgRLRLmeNlfQBngMxb1nkxc5Rdlwj9YdPE7
 CDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739797428; x=1740402228;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N36CzgkxQ/ZEegvCvcDE6yqLGkrsappvLNmw9W/A26w=;
 b=X917zLR+lR+31PT6puB1R+6akaAXOtAOlTxN44c0jCfSeQH0DFhpfUWgkrKzZnUlhs
 OmDG8NxJeGqM0hCig41nPx6cvQP57+VNzEph+jyld/0ftCl+loWhQ1ipSM38h1h1S1ik
 JM6oJAElLAEhF1DqcYxWHHnXzVIzX5Wxb8CjT4F8zERKCCa9E3s5a/vvFEd8cuGlxWRW
 gjhGHc6OSajxoe4fzIKhLg+hdORrmWE/txtiLvr3hoLOqoyn7rRFBGXgGbHySIcoceDg
 f7602dRx7RBRTUv+IlW17yBrptsR/ZFnR1/CGxcN2IDth00TntudJvU2WdAXflCN6wVs
 eEBw==
X-Gm-Message-State: AOJu0Yz4iDdgOEY5e0Xf2MK91qDMEEStMnx2Dg5uYgxybZDULlTaeFBy
 Tizmqc1QwyZm9jdVBD43llwi5hjjeaicrQt9Wi9smf01fizBGg25NhdhUAKD3KhkL/5NG9vWEHQ
 roFwxzhfQVK/o7TAHVsivGhNJVY83e68cxMeBZw==
X-Gm-Gg: ASbGncuL767CwDFnGvXA6txB2PRf+rtt1rQpI3COK2sEdblX8DdvfOf7dTI7Dyca8mC
 2HM61Htli6ZVhERZn3QGcOY6kfN98HJkfKxR02+imHOKLaK+O5VOutvGOQk4rgeesPIeg3j8PNg
 ==
X-Received: by 2002:a05:690c:950b:b0:6fb:8e5b:bd16 with SMTP id
 00721157ae682-6fb8e5bc027mr2021957b3.25.1739797427874; Mon, 17 Feb 2025
 05:03:47 -0800 (PST)
MIME-Version: 1.0
References: <6866d6b6-24af-4743-8407-26ae2998dd21@gmail.com>
 <CAFEAcA9B40F21r9RgeDd7k09juy35k9QWewzgkmyNkYVK_K0-g@mail.gmail.com>
In-Reply-To: <CAFEAcA9B40F21r9RgeDd7k09juy35k9QWewzgkmyNkYVK_K0-g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 13:03:35 +0000
X-Gm-Features: AWEUYZnkzrX1v18ZYMZvoZ93bAJK3Nd33aB0NJ3a3785YfVzVmi_SzfJwZGOnTg
Message-ID: <CAFEAcA-U3QTWKhNr4Nd39hX7e+i+HDEyu8EZfSOm37GvvaH-hw@mail.gmail.com>
Subject: Re: ldrd implementation issue?
To: Stu Grossman <stu.grossman@gmail.com>
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
X-TUID: 1evee3J5ZSek

On Tue, 11 Feb 2025 at 10:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> (added qemu-devel to the cc list)
>
> On Mon, 10 Feb 2025 at 17:26, Stu Grossman <stu.grossman@gmail.com> wrote:
> >
> > I've been getting SIGBUS cores with a bunch of user apps running under
> > linux 5.15 and qemu-system-aarch64.  These happen to be 32 bit (T32?)
> > programs.

> > The fix is to defer the register stores till after both words have been
> > read from memory.
> >
> > Here is my fix:

[snip patch]

> Yes, this fix looks correct to me. Can you provide a
> Signed-off-by: tag for it? We can't accept it as a patch
> without that. (I can do the other administrative tidying
> up of it into a commit, but the signed-off-by is what says
> you have the legal right and are happy to submit it to QEMU
> under our license (LGPLv2.1+ in this case)).

Hi -- this is just a nudge about whether you can provide
a signed-off-by line for this fix. I'd love to take it,
but can't without a signed-off-by. (Otherwise I'll have to
reimplement it from scratch, which I'll do at some point.)

thanks
-- PMM
