Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp322350lfg;
        Thu, 19 Aug 2021 06:22:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr0EItu6q65bOGzHTwBEiSjo+twgP5zfdsmaUDukIfl0mDVtY9pjaiz/jynTGcesnHjo3t
X-Received: by 2002:a5d:610f:: with SMTP id v15mr3751944wrt.415.1629379349806;
        Thu, 19 Aug 2021 06:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629379349; cv=none;
        d=google.com; s=arc-20160816;
        b=0ipQ4juCHvUDyHSwgKEKnSHo6106sDV6b0ciVEyJBMAYVlbMQMXxLyxapyDRwZbnrB
         5x+nmE1kWwyAqxqlGHE+v9KY9fjvzJXI8oXQXRt2zDznugo6q6w/5rCoEt6iD1Hztexe
         TWnonRlU271Q66Aeg8r/t+Jc225Td8el78sa3DHbYlwmmBFAazbZQxwBR/ECET+o/5Tp
         8rEyxAwWY6UYLowE5hjFUixIzHerxwkCuPC2zYF62w7aBbzRgd8JHctKLdjsDJW1mrOB
         GnoxO4VGG11gth88ZTNoPu9ogT1P53lNBVp0euVihp/vHN3zNCtVfAjP+7ByS/6JTyVj
         SzDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CUPej68+qV9NOcnmJyYg6aATIpM96MYKxG1Yepjz6vQ=;
        b=Wz971fPqlzSZaPb68jZJxTyLpfz2EHXWdx41P6nuXPgvX5oKvhdq1Ukv3a90vKhx2C
         czyrPfcZOi8frblXqgQicB2Usghu8HCry2VOTVtuTK59lbaxPnAJDC38yrVIkTD7y+Yn
         TwqjR3h7H1KV5hLjvRyxS0wpDVaWE2NQKYc4c056k+pRoGeDPkF3806HqehiS2X3vcsY
         ni9vIirXIOQel1yjoMKRjHpsYicmbJIRiGhBqQ4ICdBGqMUU0SIa9GrTi5HgKZWl2Uwq
         aDTgx/z+n/EouOjip6S1mzTSOsS4I7FOLn0UzRDiaw9NEjXtSemXtiD+3XTlRNOgE4xE
         Me+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="xmYMDeP/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bx7si3076934edb.136.2021.08.19.06.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 06:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="xmYMDeP/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGi04-0004aT-VB
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 09:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhzs-0004UE-Lu
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:22:16 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhzr-0005l5-5T
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:22:16 -0400
Received: by mail-ej1-x634.google.com with SMTP id lo4so12880144ejb.7
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 06:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CUPej68+qV9NOcnmJyYg6aATIpM96MYKxG1Yepjz6vQ=;
 b=xmYMDeP/RK8n2rHNEsFKMKar74mtyvlRhShH/+9R8adlrDErdeNIe7l255kguTnzYa
 ePYUnIHsrKqOOvn0gUDzvxEPa/2+V3cgBLv4DgABdYkTKuSfeQ8okIlaknSUX/IPVPDF
 zdbn3AXwz1n+Ne6MBvlLy0bmQ0onTS+vQvQBxnUV/HfbNTHk0qhuq6XENsqyirJQw36h
 7giBd4gf1w5M7P/Yi1dsvxkVfgKzatMpUD1lajS2pwfPrS8HoqzidmfHVGVpiaZepbHw
 jqymECnQXjVpTt6v28CvNUIgm5b/HJ6gL4AEI3LSld7pu0QhV1V7ZRmGkqSO4/Ofo+dr
 Lo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CUPej68+qV9NOcnmJyYg6aATIpM96MYKxG1Yepjz6vQ=;
 b=rY3GgN5HkqygQcGoATXq/hmiZpkcrWihsxfwkNo8hBjcr53RYFcvKmN3HdS3GQOP//
 wXyd3SzCctiCJi4PuOIoGwG3F2yxnFltHoeFD3A2Btd5qvjCkWsx19GEVUT+DAIyP8qZ
 QjBCEhQiS3qw/LPxt8qAOndb2nTs3Kmtiy8/e2n+odMkb8NFeqJP/GlQFwMDQ88W1/Dn
 kthy34+kbVOmBJ1ih+8JkKUdUC6BVlDvAPt7WJDbP/Mj5IbBfQHP3K7/eUEM/L/O1IPd
 wEW9NEyId+vf9yqzMDOTLBKG99R+IDfw4ksYLVg/5vqmWPwa+KWSTnEUyWFyUkksc138
 YP6Q==
X-Gm-Message-State: AOAM5303UqVMDPJT1T28pAMpsIuhbPGDuO1jhiMbmNfQRicFED5XL8gB
 s9GTpT5tyKvPvcGfjEie19fXIzPj+rNpFuTwWbAPGA==
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr15330712ejb.382.1629379333709; 
 Thu, 19 Aug 2021 06:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-9-shashi.mallela@linaro.org>
In-Reply-To: <20210812165341.40784-9-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:21:27 +0100
Message-ID: <CAFEAcA-MnRq1TpYO_FVvpH9i9U3cfnU4KkPydc87v7MpsSNiuA@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] tests/data/acpi/virt: Add IORT files for ITS
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X6k2hVL3eIzm

On Thu, 12 Aug 2021 at 17:53, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added expected IORT files applicable with latest GICv3
> ITS changes.Temporarily differences in these files are
> okay.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> Acked-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
