Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp532940lfq;
        Fri, 8 Jan 2021 06:16:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9hZc6lXXfmwjtX5uSwlnI0XEQ7PmUGPr7eWrpyIL3IhMTh1ph180CFazmlLFB94sXy5hJ
X-Received: by 2002:ab0:1d95:: with SMTP id l21mr2930865uak.138.1610115412693;
        Fri, 08 Jan 2021 06:16:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610115412; cv=none;
        d=google.com; s=arc-20160816;
        b=TF2pmKpePpr+bNS87UdmzCruiz+7r4DciBjziJ8b1N2z1StU4GpwmTQNVzyphdeDEe
         21pGI9+Bz4cW0xmS03IRFfqv1U6LOJ/44OETM/F8gM2pjSWZBsYEWgwQbpyKcCKqa+R6
         2rM3EahhDn7eAhQXgak2iMTwLl12dLIzwnOMZb9C5jv93cx14zP8i8Sqid3nMMDiwW5A
         nlJhWQdutwyR436GlLU98t3TvdqJBsm9jbKdW6YfefrQBQTloKo9i6eKodkgbMA326bU
         ZNa75NtRvpOFpgnu6PJD25JIswVOjI5k/WVi5g5T27ld1VB9osQVg3SGK063fTwU7P2u
         O5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mLQfpG/xAL/ln16xrJTSA3DJ4YwPS5WhjEJngGqR6gs=;
        b=jY4PKMM71IZ39g83/n5H4cydAaN2HcJnConChVwr0WdlEryc3fVi84SdZv5wGCHUJD
         GTfImEBgu/P1Jo++mB2Ty4s3IPFuCXLE3fPR/YRfagi8daBrlsV6oJHGuEjNXnaFU1kX
         sKBsef3TJJAJ64b+YXgLKcGTaqKrGNBXRXfmWo830e3qu6qDTS9tNGvxY7RcjC5fqLhz
         swvyG3ax0R9TgxeEkQTGoYZLsaq+NWb+n1KGmQrfuE36ZUkel2i7b740TencN1KR5EfY
         xDK9KsijzD4emd6NEU6u3sPuXe2oFZd/a0KbuCXuW7uzVF2bLMbpyBzMLP7ZvB9DzZCe
         dMCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OHLVtNHB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si488754vso.26.2021.01.08.06.16.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 06:16:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OHLVtNHB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxsZQ-0003df-0r
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 09:16:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxsZ4-0003cU-Ig
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 09:16:30 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:45809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxsZ3-0008Hm-0T
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 09:16:30 -0500
Received: by mail-ed1-x52b.google.com with SMTP id r5so11263911eda.12
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 06:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mLQfpG/xAL/ln16xrJTSA3DJ4YwPS5WhjEJngGqR6gs=;
 b=OHLVtNHB+2BCxQKaNgj6fgBd/yPMcjWxDycF9GYIoQdWppGbjIMzKSL4XztoDlQm5b
 oe2sY7sm8X5yW2gJbZYNK080Db1p9axUSMP2r56BRRhI5qFdL0ayV8d/gFeJ9+pyEcod
 bBU25DPYbjj24QP/r7oCmqjzmw6i7QxQ25fQn+LoO3dFrdy0HUUSQ3jr91hEVEVWMwcM
 ZZafUn7YYsjFqfQKkGrhZtTnO1unkIMdK9ghwmhDi37x43ihvf0HpWxBL8O/0M7PEZ3W
 0YaCx9UO4L29yjKGTM22TKmjqwwwL3trbMLxjYjX/hh7yHu7bxWIEw6HqkDbWKwZuwFc
 6nhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mLQfpG/xAL/ln16xrJTSA3DJ4YwPS5WhjEJngGqR6gs=;
 b=tz05AjqdYlmtNfprwcaoRCil+nKcty/pgb2uTJczPqx6IOs1uWNN4XtbwH1E9JnqW1
 Ww6s5zzGxfjbT+zYFi1N+CqZ4/t0IWHoZTF41VKx/MLO4k4gIAWaICb2HMphWoQgcdwg
 X8AdimlV4VBtWOh1dQKdp7d54zrocJ/8ynZTWX1HNMSlHLc9dgAT6ti1iZguSm1xf4iM
 twTT7YvyXDGEsFMoKddgQCfxfScXyx9VQhnc+b00ipYUUlyFLoZ7YeW97F6YODctuHKR
 l9kzJtUmPoRxGnoIhy8fVU6Db4WrMeQXyDjC1IAbEK/H5eYrhuq6VLa0bdyspaSZNiOm
 BhDg==
X-Gm-Message-State: AOAM531iKPBAdcRiarmbHYltxBjwsHElSBFgigrXSho5mpwZiFzCefp9
 dE0N0IG3PYIQ11klyo5RKizHOtQPjDu1K/dS7ZGbmQ==
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr5296788edw.44.1610115387614; 
 Fri, 08 Jan 2021 06:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20201216221247.522686-1-richard.henderson@linaro.org>
 <20201216221247.522686-3-richard.henderson@linaro.org>
In-Reply-To: <20201216221247.522686-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 14:16:16 +0000
Message-ID: <CAFEAcA-ptDOQ-yO5KXiVe3E1UFyDH8wj-705F7fQXR4bsVxxBA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] target/arm: Add cpu properties to control pauth
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nzq+grnJZzSN

On Wed, 16 Dec 2020 at 22:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The crypto overhead of emulating pauth can be significant for
> some workloads.  Add two boolean properties that allows the
> feature to be turned off, on with the architected algorithm,
> or on with an implementation defined algorithm.
>
> We need two intermediate booleans to control the state while
> parsing properties lest we clobber ID_AA64ISAR1 into an invalid
> intermediate state.
>
> Tested-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Could we have some documentation of the properties in
docs/system/arm/cpu-features.rst, please?

thanks
-- PMM
