Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4541172lfm;
        Tue, 25 May 2021 07:37:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSP4xV6o8NKDybgDc57MbsjDeLwu2E2XSm+sEvYa0cajg/WcKfRR0XGk2r+Fy5iQOhYKS5
X-Received: by 2002:a05:6402:48f:: with SMTP id k15mr31567335edv.262.1621953425253;
        Tue, 25 May 2021 07:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621953425; cv=none;
        d=google.com; s=arc-20160816;
        b=rf1Xicb1/lgHLkfQJB81bXnscpGZdndCI+mzaF7TPsn6kMjzWBU5b8e4lxXd5mglRp
         OsD/8gF3pq1dr8WGUZFmIPugkef3B0Od6nlXXfVX9pXn2f53lG6X8Cz2Uy/RByafsFKu
         swUWKbhW1vkdoorMbjY8lcLDN2nT71DHRbN9sw+ojStN9+yBk69wMQAtp7dGvY6Z/dGR
         qPn6ENjTXF/TFziPJ6bsFAQiW2ZVkgnqYKANdrK/PSiUe6TnLzOSeGX0nxKpN8lz8iPv
         ZZXjPWqY9uj/VCMbpT+i1Uo9rTq63ElosQ+wYssfwsMu7mSp1p3m1pv/CKabIFKyx9P7
         iQqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PYy9YKfsUlPyS4UsgRXgoLwbQO5UGtNoTeKHL1o76Qc=;
        b=ypljtgAeFhH2jcKan+waxWVfvKy/7b2ZMa6mMWiKUr0/I1KIl4F2J82KVvP7H83/t5
         jiYmkhxjZTnrr07zA2MvL6W5/Ft8PUqJ/3H87+So7rZziJEg05i963CwMU+QOfeNhQ9G
         fH2e+9gU9ORe/vTsObT1yU2WsP5iXr8k+JeNJ/fKNBvECtHvVXEI4g1XGIsB+/FswgCw
         p8B+Sz/CX26xyRERJYUn/FiEnRSc6bSbT4etGIIKdvbNYYsYAoYV0Sz5DKk6Fv145Qc5
         +TSc+EtRCfKV2/LrYpTaBe2J39aN5StKtccBwB92a9epDH4IckNfX4/CNjjpkBFD4HuF
         cvuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ci/opAAx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js19si15080604ejc.277.2021.05.25.07.37.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 07:37:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ci/opAAx";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llYB6-0004Lg-DD
	for alex.bennee@linaro.org; Tue, 25 May 2021 10:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llY7S-0004sr-54
 for qemu-arm@nongnu.org; Tue, 25 May 2021 10:33:18 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llY7Q-0002X7-Ef
 for qemu-arm@nongnu.org; Tue, 25 May 2021 10:33:17 -0400
Received: by mail-ed1-x535.google.com with SMTP id t15so36516166edr.11
 for <qemu-arm@nongnu.org>; Tue, 25 May 2021 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PYy9YKfsUlPyS4UsgRXgoLwbQO5UGtNoTeKHL1o76Qc=;
 b=ci/opAAxnRuiN2y7RC/SIWILviO255abHFlFhucm+5OVu+yb0zoSOts0zJ28ugPMrv
 a6c1Bz2bTFA3R5ZytCa1SdfyC/PwuFYgVBhElh++2hLhNrVNCmtsDMLhmQvqnqUd/SGB
 qpnBqAejebUP2DIIEBpuyL0AIC/RKuJAFi2PpaGfWaqyw+FuwoHcDtmLgTF7qxjnHfXT
 crzDE66X9FbpuCzXwyl7Yw2tq9etumss7PUXtuqVyFhuIMc565Lrc2K0HI1IHeYB0+jb
 FmJYQjNYkFaFRYp5RZrneamW+YXNSOvymzTwbWM6LDMK5fAys2SHLbwL6AbvFyCuoTAV
 CmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PYy9YKfsUlPyS4UsgRXgoLwbQO5UGtNoTeKHL1o76Qc=;
 b=rxoFiXJfXOkOIGR3jxNz+Ubum9H8KQw9T1sKKE0Zt/UUe4J0g0BGTfTTvJblS0rkix
 oJ8/Etxxo+HRvW4Sw/hcTHvo1EVqbumUTaFLazMVf5QF7ZVfl5K31JGaZixguzeMa8dB
 KQOTx4ljqqqVJSZSCZE9sdyaZiti21qFf9G5yxphIV2YCg4+FkFJq7tcdr9CCRu9UO/p
 FjKxe4mMQ5PeYu1WSpF6iciW4GMa3Brmk3Ij2GU5N4aNQLh5Vh0sVL8HidDGUWa5+f8C
 mhyGwoqm6NHgOkaGmPoECDnjOFOVnGh9DuQZqHBBbO/fPrRQNwhyC02I4u5JyyRYpA1/
 UVRA==
X-Gm-Message-State: AOAM532Mvt+Bqz9hC10HAzYft5C4KlkRCh+IFsku3Afiii5LshxoW8b1
 f0zr4zd3/n8OVXsANdtpTKDT6RBQUwX+wXS9QvdHIg==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr31614887edv.44.1621953194950; 
 Tue, 25 May 2021 07:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210512182337.18563-1-rebecca@nuviainc.com>
In-Reply-To: <20210512182337.18563-1-rebecca@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 15:32:51 +0100
Message-ID: <CAFEAcA_7PsBAD_L4-O4JkptOdx6FoQTy2c+hyhmQ4o7O4TGjXg@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] target/arm: add support for FEAT_TLBIRANGE and
 FEAT_TLBIOS
To: Rebecca Cran <rebecca@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BCMFhZo7DOEu

On Wed, 12 May 2021 at 19:26, Rebecca Cran <rebecca@nuviainc.com> wrote:
>
> Testing: booted Linux 5.12. Ran "make test" and checkpatch.pl.
>
> Changes from v8 to v9:
>
> Dropped patch 1/4, because Richard's
> 'accel/tcg: Add tlb_flush interface for a range of pages'
> patch replaces it.
>
> Fixed page_shift calculation.
>
> Added do_rvae_write and vae2_tlbmask functions.
>
> Moved RVAE*OS entries from the tlbios to tlbirange table.



Applied to target-arm.next, thanks.

-- PMM
