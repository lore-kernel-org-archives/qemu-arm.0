Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1127591lfm;
        Thu, 25 Jun 2020 03:03:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFYCIT9NpUunmn6Oui5smazgIsj57oCrl9gUz+7JdL6WFTNVoPPBCgEjOHtolrvsLO9uSV
X-Received: by 2002:a25:230a:: with SMTP id j10mr51663220ybj.148.1593079391578;
        Thu, 25 Jun 2020 03:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593079391; cv=none;
        d=google.com; s=arc-20160816;
        b=IwjJnCORgCIweZD0kdpp68vS3b2H0tCwuSsef8Y+tlgYfCbI6hjsgvFtQm5C/xy7o7
         yOF7GD7beATiV9+EMPMG5X9E3GqYChS3gc7MBdFS+F0/N7vzMUe5xfq8Hk8Ly/hPfgVs
         xa5C0uoUWUQwviJ7VVlf2orWTMMm+V25llplZcbDBR/GobvGl9daT+BhEnlLMLiBVm3g
         c04ChOmDbpEO9MMRtiHt1KGIRWj6reCSYKDYbBb2qv3STmr46wsOamn/FpTr8dN5njZ2
         ryrYU7rodfbiKTEmxV43EzLa6DQetRCJbuMC9KMz+v9CDvplcnsuoyt2tHEEy+VLoFeA
         gZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Exz6aPsYoru1iE9XY77uXTMscZc4FZwRIdoc1GW/alU=;
        b=lY98YLMupFRyZkHFrgwIpX3abOi/Y4v/JZ08NLidhSn6tycfA0HTw5y5DVLbh2fASC
         KMAELziu5QPVGckGhykgbCKwcCIfrC56iM6MwFfE20FJJN6mXZ1Beg2i1fEMs0RXdkw3
         C4400e/lk6itk0w8hmCgOld2S2uw39tiyiETZke6t+/Grir//ejKY1gzCu3h+0tmb9/T
         HW9l1GXhoPZ8rm+0GU50O3+XASnbP0G88VuvXrG1FHIi52SKOK8Kesf3CEXU9Co9dgRf
         9zHx4YBLo5XoeSMRwh3gAxzN81CfnZSko0tZ6OuOMGgoJ9NxIQ1Vzg2xsAMEU03ORaRt
         GG7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QM9dVuZ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v88si21792272ybi.197.2020.06.25.03.03.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 03:03:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QM9dVuZ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joOit-0006Xw-11
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 06:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joOiV-0006Br-Bb
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 06:02:48 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joOiT-0001Hp-1k
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 06:02:46 -0400
Received: by mail-ot1-x342.google.com with SMTP id 18so4710554otv.6
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 03:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Exz6aPsYoru1iE9XY77uXTMscZc4FZwRIdoc1GW/alU=;
 b=QM9dVuZ2WlLxyWkLjfsLs5BrME11RLrbShJufXwY/jvM6ThICJOqFkeB5ZzeUR1coZ
 LCeIi3Oa1pyjTPCC5/9kJNKILB21q1eHh+9IoqnnvYA1K9YlH955rGOv+nXN1qdMq8B0
 oZzbpaS6k4WKGqNHYmfF9OzErHZHO28T1Niv4shpevZYKtbvHPXYEj8vUA6LT0HHTt0H
 /ZeEqva467qNW60AlwdL90g3yky5a9Fzn1OeZqnQHUgDwo57AHTv9or5rF9L+crS3cl2
 hfuy3jG9X38NViYKY2rZ6rEDd3y5+ejC7Ni/TcelfU1w0pIHdfOJlX0gqaXCf2gBFTrR
 9t6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Exz6aPsYoru1iE9XY77uXTMscZc4FZwRIdoc1GW/alU=;
 b=GPHZZnpEbG0sroEYpY6XWOWC1Qey+aA6NimH23E+wvtVmhdyesyEZ/HQ9Vilbyu0ja
 Bcr5ImEQHImQc/TFlDb/HccKp9LjwtkSSKeat8cUs1M6JXyfVDVyQHziZU5xmtSYhLqu
 LgQ8J2AlrkjNJUIigWOzRvZ9+jz+REJcsXPA4OyjrlhI29iWKziE1rPedP5tv+hi//oV
 lwJM+Zr91EHiELYqtysZ1ES3/GDwhfp+WxkSJtES6NJOFxADlm7gctwVCjHWxB65S+aK
 u2MLFw3OR8vffDB+UFErmzTU1WnxyWiQ/dbm7zxb0mjUiXMDyR+Z+NZwC+GxXKC/FaMG
 Aksg==
X-Gm-Message-State: AOAM532m7UIcWGIA8XnWByeuTxH7r/0JOR73++qgPgaP6bZsXGnphuSD
 f+4ZtJCaRFZ4n7z3MrCyaGic6BtcFzLREGbvzko8pZtKaug=
X-Received: by 2002:a4a:9528:: with SMTP id m37mr26828970ooi.85.1593079359797; 
 Thu, 25 Jun 2020 03:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200624132625.27453-1-eric.auger@redhat.com>
 <20200624111624-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200624111624-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 11:02:28 +0100
Message-ID: <CAFEAcA-io6LX4uUvHat2oBE-C_0JLRew_L8r8ej28UNPvhQFRA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] VIRTIO-IOMMU probe request support and MSI bypass
 on ARM
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 bbhushan2@marvell.com, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GVMc7u4BqmUr

On Wed, 24 Jun 2020 at 16:16, Michael S. Tsirkin <mst@redhat.com> wrote:
> Virtio bits look OK:
>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

I can take it via the arm tree once it's ready. I had a
comment on patch 5 and it looks like Markus had a question
about patch 2, though.

thanks
-- PMM
