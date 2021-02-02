Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp6513lfo;
        Tue, 2 Feb 2021 02:39:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP0NOTM1bPMA1EIrOSVDbNEAQQAKiVHDoj4bhmWB7rrFnCBrE0kR4N203BiibglDJinWHR
X-Received: by 2002:a25:f509:: with SMTP id a9mr30076815ybe.35.1612262386611;
        Tue, 02 Feb 2021 02:39:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612262386; cv=none;
        d=google.com; s=arc-20160816;
        b=sbhHpnymn2oNxWMhTUeud4XwUIkYHGdUJv5WdNo2psLTxAp2krlsS9jBwh3DLq5Xw5
         zkRu6ZXOKuDnQCAasKPLYgTnEDaVFH+bG0FP/cgWlGh0OpLsMHyQDVBEf4D6cmpCQ4/r
         bBMPCPGn2OoLkNdG1OXD8lfhMZ+z8vu47VVinVEgSd82+z5a8IAIrzoREc3XuYfMKsk4
         gJNOoYZ+M6Nu1Yr9qJUeGi1C7BrYgi4D9v7Yk8pErGEHBSHYKiHw5uG4SdP5xFXJlLu+
         mWI1UIUdRKmipHGSjVM9436CpP9KFsBS+otIRG0yFWlIeS8zkm3STaoeFRmDut+BscEC
         dVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4+RkjWW8jkMS4qVVsrgqauWLA57gigTXQ55afsDtELQ=;
        b=EwxBrAhaTtRb/pyaDUw6TfXSDIrK46BjRe7cq2Qofkwv/4gWICkvr3LF3DmWCk7/SG
         5ggI+j/ALIi4LfxVW6Pq6pypBs1NIwV4/+qTVqQwg7QLntYU7+SC9Laq/Q/a1CXupG0T
         diD4fkY8ZUXQ7Zf084jf+jrwx8fCXNmHg1vaSZ94j1woTAz6gZcpfURYvNXl1BfwM0c+
         LxN23y8Q1R+vv25f5oiM5D8RoU3awkO0IRAtLetf13Oc45yDULsnXjDAEhsIXAS+7dmU
         tPnDh1Ly98oDa4Q8ndxrrtUKWiD570qifNkh4Za5zwbUAx0Tl7we+lN4q+Pgk3YIkJEM
         tDng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EkXX7ll4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si22545978ybk.457.2021.02.02.02.39.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 02:39:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EkXX7ll4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6t62-00087l-0N
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 05:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6t5t-00086R-Up
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 05:39:37 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6t5r-00089A-97
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 05:39:37 -0500
Received: by mail-ej1-x62e.google.com with SMTP id i8so12705071ejc.7
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 02:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4+RkjWW8jkMS4qVVsrgqauWLA57gigTXQ55afsDtELQ=;
 b=EkXX7ll4yCQRCfSL59yXwm7EQM+1so8XZL8O6OcmQAthSnQYFQzomlgzHuV/ByyuZM
 Y1XteH0Ng7rl4MUobRLc4IqTJjgc/4liDExd5CuPEiFZmCtfYZ4MK3MpiOUZwNHEpSpi
 zTBdKRjYtn0FWV8YJFkymoIeTPzEfSFsCFImcD8ToFQHDwZHVipO+JTfY5wcaYfwCnS+
 0ocvwoTFDPWjjvfcxXcagDM0ub0ATiSc2vkLMv2VdtmA4/arF4jRYQdqkJHmrO+kisgn
 E64W50uiTDtJVz6zCRUqx/tFoh96CEcrMICQhJKmRWWTDy2xkChBVWcTuip844TeU5cZ
 kpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4+RkjWW8jkMS4qVVsrgqauWLA57gigTXQ55afsDtELQ=;
 b=VVSdl+lyO8ZQXhiuEU38mbD7781+mx5f+otX8hpir9s60weD9faq9aieeOu7Hc/3Oc
 jqhZpE+8yrOo/RAOyGwVnFwk/uynl2KFOngfWtNoMUQcqDgDcz6uFHHQSrTezX6AD/JX
 dGwtcJ15PXw/cFxYNUAdl8KtfM7GMPA5NaxS1QxT/dNtNA2cT48/e0omkDhochGl30Ds
 /k+OHeoxcw1On3HZOhKcZ/b2/zCJXrB4bH4KMm9ly0Uf68BeGWeAl3fQ0nUxFkzb0so2
 ahDnATQA7nZ0X1HG6F2zZV0m0OCoJChZdmb3vfxgjtoC6B1DhLyyOAKggBIIfUTUGDOZ
 wX6w==
X-Gm-Message-State: AOAM532TxKCUiMpqkoDyr0Lq7s74URfGXW41dCvMmxyRN8zGDq7NTTNR
 /izMCGiHe9TpW4jeUCR/5fVoDlaUTDGbFX1b87xoEw==
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr21159350ejb.382.1612262373697; 
 Tue, 02 Feb 2021 02:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20210124025306.3949-1-leif@nuviainc.com>
In-Reply-To: <20210124025306.3949-1-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 10:39:22 +0000
Message-ID: <CAFEAcA8M2TcRoAyXph1CvX5gOiMqWusV35ygkxOxZy_H_P5upg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] hw/intc: enable GICv4 memory layout for GICv3
 driver
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hil7uRcGnlZw

On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
>
> GICv4 sets aside 256K per redistributor configuration block, whereas GICv3
> only uses 128K. However, some codebases (like TF-A, EDK2) will happily use
> the GICv3 functionality only.
>
> This set aims at enabling these codebases to run, without actually enabling
> full support for GICv4.
>
> This creates a ... problematic ... system, which will misbehave if you try
> to use the virtual LPIs. But it does help with letting me use QEMU for
> modelling a platform containing a GICv4, and share firmware images with
> other prototyping platforms.

So, what's your aim for this series? I think we could reasonably
take patches 2 and 4 upstream (they are changes we'll want for eventual
v4 emulation support), but I don't really want 1 and 3.
That would reduce the delta you're carrying locally, at least.

I suppose we should look at what changes QEMU needs for KVM in-kernel GICv4
support at some point...

thanks
-- PMM
