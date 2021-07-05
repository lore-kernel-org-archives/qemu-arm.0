Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1306241lfk;
        Mon, 5 Jul 2021 08:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9qYDTPNbFdNTPMQW2+oQ9P2L0iLU2rmRcx2NSKdUsueJGy6cAijECGI0lQiQ8hjntUg7g
X-Received: by 2002:a17:907:3d9f:: with SMTP id he31mr7027006ejc.95.1625497504181;
        Mon, 05 Jul 2021 08:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625497504; cv=none;
        d=google.com; s=arc-20160816;
        b=t+5aAnVLcSsloWAUiHI3bqEuTUbIZ9qap8NHWlFPmlAIi2Urw0J0Fji1FMZr6w/Rbe
         uW7p6M42l9qRC+oyb/8nMyl35Jnq2QUCgJYxTL9waXHLQ2t83spOs68cclAYlMSdncxJ
         SVy4P7HHgVOFHlwbNA+br6KOroQSqg9Q6eKWEUp79BVuVqVgkvq0bu25zkfcVgDNAPP3
         imaaC7I22sy6dNvXZo57j7KxM5UBwk+3+W30RdyC1U0ANjzeu6jHNh95/WdAFGl1tkkO
         +IsUaiDivUKFI8peL4VKdx2qLAb9Q/1ViqPHQhZVUSgjzNGYteMs6Ai7oGcaWyuzJOCv
         +wmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=viGaPrwPRmGQ4jEkrgd71Q2v9IVY4KVegInd7a9aLVo=;
        b=iBesZo84bvItO3WXuJhrBDs8ocplX0RHTyYhT5cCQvEHjFfk8RRx4cl38w9yPg8q/N
         Og7lNpRVtGnZ5quLQj9NxK99UsfmmbIZuJ6RDVsvIftJHBLUOXVOp9pnbunQgDb1vZXj
         bVscHQ25Z5T3JJwF1I3epa0HizzswhICWjs84T7f6wVIOoDDu4HsLlUHPX2gzhsc1USb
         iBXoBUCiRdKnkm4NNgoZbsOfIRkuatG2eRf8t4mIelRFIBqV+Jxt8Hikz2bEWDgdxOwr
         zpIp4zMsoUWufg3x2p3+ItOmRRF7azqVqcYK7zowfNM0eqFKniGNaryCPPQFwJ98evzi
         Y8hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j5OYRfQQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eo21si11291783ejc.359.2021.07.05.08.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 08:05:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j5OYRfQQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0Q9f-000675-9V
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 11:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0Q8B-0004Wl-S0
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 11:03:31 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0Q8A-0001TY-9q
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 11:03:31 -0400
Received: by mail-ej1-x636.google.com with SMTP id o5so29438430ejy.7
 for <qemu-arm@nongnu.org>; Mon, 05 Jul 2021 08:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=viGaPrwPRmGQ4jEkrgd71Q2v9IVY4KVegInd7a9aLVo=;
 b=j5OYRfQQ1X0iMIlvdiAnL8Jj+nXCUk0EZH4MHV4fD+0zK+cNaKd4QWwqgYvqktMSTv
 mO4zOF3vQPZOh7lqmXQYCaKBEQ3rlFYpMSuG0KFuc+AyZDVP/xO8HqkCacCIvXm+sgoa
 46KZzEH30OacffoavFrXPNx9OZzt2zNjyQSDBvIbrWjWr/5Qr04x2pp5xZqTgCzazmPe
 5CX9PNjZrNPjAJWXsYrvdmX1355aifYYoVCnD3g5DSU7C2N2Ju0o/kHh4PhaG+iseQjA
 5Az83EMM3QyM7R2QbATCCVx+gPCr0uQ4m3FNYxYA8Dr5jIfevPh1i3zsE5X+X6bHtmlL
 zROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=viGaPrwPRmGQ4jEkrgd71Q2v9IVY4KVegInd7a9aLVo=;
 b=fkCYicWwYT/7OX5IXgFSoDoEo5DcSOjyF39UoHB4uVk2dEWf6YFl+WVBiG5VXA+o7U
 evK88YcuFBqSfkk7jDDZN/Hs1QYQXbsOXsanCDMxLiCdZVeCsasM6+jH7SqhFUYqARwd
 XbPchSIaZrBPi59V6w0M+yy0Hk9D62uaw3OfiselMfIpRxjOOw0dkv9A1NamMsY+4RhK
 o0DRLzb+Fc8eN0kFJ3SZdeP6AdfzP2iA/QD1UjcxAMbWxKNcAzismdvZTaxkUAYNzmnH
 9M9g6/ob7plM+7s4fKdrKaRTWAEUhIedbONqec3vLgzapNvTHs9zb2asiddzztjoHKUK
 vaXw==
X-Gm-Message-State: AOAM5335Pz59i5Es0mmW/BgYmPe9OQGKej2grRSy+C+QGCCOVK84St0F
 YBpUZPqDEaHf2Ngl48ETu/wGPmYPba4RxsUapn18+g==
X-Received: by 2002:a17:907:1691:: with SMTP id
 hc17mr13500745ejc.382.1625497408724; 
 Mon, 05 Jul 2021 08:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-11-shashi.mallela@linaro.org>
In-Reply-To: <20210630153156.9421-11-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 16:02:50 +0100
Message-ID: <CAFEAcA9uN4gVrPPcvu7uUePrwyxbMvekwZREXhyoNU68iBDdnA@mail.gmail.com>
Subject: Re: [PATCH v5 10/10] tests/data/acpi/virt: Update IORT files for ITS
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EuOYegjNJK1/

On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Updated expected IORT files applicable with latest GICv3
> ITS changes.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>

The comment in tests/qtest/bios-tables-test.c requests that
patches with updates to the expected binaries should include
the IASL diffs in the commit message (so that reviewers can
confirm that the changes happening are sensible).

thanks
-- PMM
