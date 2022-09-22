Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp375008ejy;
        Thu, 22 Sep 2022 08:41:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vFmg5fz4rm+Kdcpjh/oSdhib5Didh2FYCaZbxdiqMcUDiab6TZzFWJHmveqVC67sen+Mg
X-Received: by 2002:a05:622a:170e:b0:35c:cc84:2359 with SMTP id h14-20020a05622a170e00b0035ccc842359mr3253259qtk.45.1663861292654;
        Thu, 22 Sep 2022 08:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663861292; cv=none;
        d=google.com; s=arc-20160816;
        b=HFyheVzgac2hBEz7v5sPC/xNMMDNoTAFz329EK1b4M/87xzUA7mRz2vKQPEsCeQX2y
         QOHyCoSB1Ds++m9G/zSM5Kofy1eNJX1+85A5JMk7dLgyqCqAi6fb9O/tMtKqkLwqNXoV
         EHLzZOrD3ndu6WuFY3lOlwZf1CPaBJuTh9stXVATtf1+XQuM442CARQO3MK/3sEzLVVh
         q1ts9Y5IQ51Y6VVI3lq8jzFq9a4N0AP6dZ5K/wW18rRkeYe5odKzzy0e/H4RmBDmBF5H
         DCi573TN1d4WRxsmTP3WVqaCdgEQRfHP/1LSa3h9BhphokWLX4vN/muR/hgKcNxTAukq
         CGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=L1qwjJUgC4tmrmpbKzQpk5UW5yrSYzDz/EtHRzwrhGg=;
        b=ggdw+rGbXsneFykEmbfm/nNhWNdu9As3cHwmubmS/K/ZP/Gqi1ci3v6LPt5AAMVGHL
         Gds8Qi08p7H5miMK3JHIXwm7Nkr/YPJMbYmmzueLYQZ6rBU/T4bc86QsiYTx6u0Svjcz
         RiXOeFfLzvtN/+Z+QoRjL1jV8hZIg4ojF1vkbxyj1GhboUUId+J8C2m6LTadmRZzFl4E
         BSEcd4r2MYGpcqgSITNXUV0II19Ky3edTIhN/cGuOc3ZAyYPBlxSM0/X5stzw9uitgQG
         4hvTnmLRijLpCrNylxpMK9GjtU1Bt8GBz9ENAfIw2s2zBLYWZGC74ts07TV8OfQNuSIE
         Cttw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BqAJIN+I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ch12-20020a05622a40cc00b0035bb6eced79si3110275qtb.634.2022.09.22.08.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Sep 2022 08:41:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BqAJIN+I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obOKO-0005lx-O4
	for alex.bennee@linaro.org; Thu, 22 Sep 2022 11:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obNq0-0004zK-91
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:10:04 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obNpy-0005MZ-LQ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:10:04 -0400
Received: by mail-ej1-x62d.google.com with SMTP id y3so21781515ejc.1
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=L1qwjJUgC4tmrmpbKzQpk5UW5yrSYzDz/EtHRzwrhGg=;
 b=BqAJIN+IRm8E347crlXH4I24yCTReJW670jJDKgpUe6AoSPAQoBRhCO3kPcKUCdzYl
 0ZbmM4DtjtMjQBtHq19KmC8Y+HkUuG+kqU/pXkxi2QUDtlAD1dI+mNdQTbygIVixjen3
 15tq5wB5A17Vga3hHNCUqF9d4RzkfQk8Xm4zMtwhWIi8Sfks1uWa+ZUD1BOwXTuAfgrj
 yoaK9RjF/c3odq/D+WY4PQfE22u1o6nHEM2o1cecvBpWOtEjfCcbIe8M8dTCkXau+jsg
 3+bMaJD6oG6At1rgT0vRPMmQ1O0Dzy5JCA69gQx/IPxC3gS0HDA48zFCo9v6yezHmea1
 ozJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=L1qwjJUgC4tmrmpbKzQpk5UW5yrSYzDz/EtHRzwrhGg=;
 b=olTEKFqqNE6P07Cjon1BE7DoGGyi7UyT4kvadrTaJn4lz9mJskZFTp1HHpnbOMuOI8
 CjCioOxrB+dfB+bsXXmdFTTWwltImdScH+BwbzW+fPlLHsItrTZfkfOGnFUfSYIbGVEX
 USknVunw0t41983Lc3Jh/ZF9Es65DvgC51ZRJT8SEAirjWgpuvIEzrOTix07PgFpOC+L
 MkGrj2+YtUHfgXugweIMK8un60BPh4eoRK2NAweYNmoflJLf/CzDUhQZiiwaPfCO4g0T
 lALnaSSY9if6t0Pun5lPTwazCYVf3tD6t8w1tHKXJInstDE/GpvLp4Di4gYnzrUASDUr
 HOPQ==
X-Gm-Message-State: ACrzQf2l4HC7+2FQGlgAksgqU/5m//aCMoBPmfzMGfEwr8qztiIjgd2c
 PCMDK1HaaeT4bFxL3Y6tKWzO/FM0sEAs8cqOeLGFKg==
X-Received: by 2002:a17:907:86a5:b0:780:156d:e842 with SMTP id
 qa37-20020a17090786a500b00780156de842mr3242913ejc.555.1663859400513; Thu, 22
 Sep 2022 08:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220913182149.1468366-1-titusr@google.com>
In-Reply-To: <20220913182149.1468366-1-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 16:09:49 +0100
Message-ID: <CAFEAcA-onpK8H0rPkjGWyAriVciPgbCYWy8oVaDfKW9op6NUvA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] Initial PECI bus support
To: Titus Rwantare <titusr@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter@pjd.dev, 
 patrick@stwcx.xyz, iwona.winiarska@intel.com, tmaimon77@gmail.com, 
 quic_jaehyoo@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y+iYu3RsNMKh

On Tue, 13 Sept 2022 at 19:26, Titus Rwantare <titusr@google.com> wrote:
> A lot of the registers are hard coded, see hw/peci/peci-client.c. I'd like to
> gauge interest in what potential users would like to be adjustable at runtime.
> I've not written QEMU models that read config files at runtime, something I'd
> appreciate guidance on.

From upstream's point of view: please don't do that... Ad-hoc
config-file-reading code inside device models sounds like it
would be very confusing, and wouldn't work if the system is being
run inside a sandbox.

-- PMM
