Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp623244ejq;
        Thu, 9 Nov 2023 09:11:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIpEmOBKyJEJQYzuZZ6HsSEt3teWmsjLLs/z2a3cPuBUeVt9Ufv9Dz/vTrpr3IA2MFRqSx
X-Received: by 2002:a05:622a:14d0:b0:41e:3c03:a7da with SMTP id u16-20020a05622a14d000b0041e3c03a7damr5505550qtx.1.1699549884231;
        Thu, 09 Nov 2023 09:11:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699549884; cv=none;
        d=google.com; s=arc-20160816;
        b=pFO1cXRsF+QfmmCb1GEjybF3Gy2UmibB8qSdavyhZUPa3fo/iDWB6bLH5LtTuSphkn
         O8aICzxkJgZ5/VmpzFMSWdE95uJ7Xg6sAAP8OLknzg3qo7BVihhHVFgfRuDiB/DNBMYb
         5ij6s8XD7hvPbePr1cVlU/K9hLw1S/IuFmwwhmulflNzrF9DN6lWLGHT2U5i0Nlog47c
         WtOezbJUR6kfjPKCJbUZOBr/eeCB4a4dOUUUTARzusf42Xyx9zUjMZwyWtjdmDklKqsU
         wpT1OLGrZTSRiNlncgaxbHHq6Y88XMrexBGyLrNU9JefiVg278lZ4TZsLDxKAiA5++d5
         FpSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=U+9y4x2z4fsA5Zt83hhNWhpPB+KEimoExJJi5qWOLcw=;
        fh=Dm1iQM0QWvIoyGvxUnukshATKG+3sudU/M7mqcqEwU4=;
        b=GoYEeklDNhcjqRCoLLj6wDi4G5ErkIDQ2pbQokv8qpKx5c5ewzdPYPY+4wuPr6hAnN
         mYMeqYjrhZcn+3LCIjqFwxsL6UbtpHUddhE0rYzwoDqUEYa0My00UkOpUv38aP6wzOJ9
         yzBUtMyTZrnGP0SyUdsh59VNSHeo6bxpaTnzLsNExCxC5BAoyJrelVVgmDeobfAF6JhC
         LbZUyd07dyWXxnC5dv7+LPHO4LEKRy83VmmHzGRsF8DaW5Vs21KCYYWp2cAjtSmqdcy4
         E+v86aoQlIMVUBaLwX/JOJkk4e4qF4zY98Jz6B5UiuCPNasIv1VZOXJ+qPLiKST1WdSR
         SRqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ec5HGziM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17-20020a05622a021100b00419ce76ad38si3157930qtx.76.2023.11.09.09.11.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Nov 2023 09:11:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ec5HGziM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r18Yl-0003tK-KY; Thu, 09 Nov 2023 12:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r18Yk-0003rm-CW
 for qemu-arm@nongnu.org; Thu, 09 Nov 2023 12:11:14 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r18Yi-0006Z0-Ss
 for qemu-arm@nongnu.org; Thu, 09 Nov 2023 12:11:14 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53df747cfe5so1889473a12.2
 for <qemu-arm@nongnu.org>; Thu, 09 Nov 2023 09:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699549871; x=1700154671; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U+9y4x2z4fsA5Zt83hhNWhpPB+KEimoExJJi5qWOLcw=;
 b=Ec5HGziMBXpXd54g6Ok5vO2ZkKQRnN9P0KFdeSO4g3Q06I1HneLWt8+Dr8fDyB9lrl
 66uy0lsty+2RTHT/JEdVHoIJAUMcjBThzFWS+ex3UGVITTry+Wr0EDoZlPIc4f4hLYZ4
 9WgE3AMvlRB/yDChtBNi/l1gafn21hYOTYkElqPFY/xnINaJICy+XNIyFaEGMC3xPBZc
 HgkEugSBSds9/+EEXqvVyS9EsgMcxMU4iLL3LaWRBWsXXrgniQP+XrZtcBUcdLWCDTPk
 pk4eVsNCRA1/v29QA4uHQ2IsH/hwpQKEr+EPm5KJOd86Tzx219zP99ZumoeDKRnzL6Du
 cxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699549871; x=1700154671;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U+9y4x2z4fsA5Zt83hhNWhpPB+KEimoExJJi5qWOLcw=;
 b=wg2oVMEIFMqLM8yALr3MwoYiIra8QMOEmzmkIBpbvHSKMN5aECV7sfpgGvbXH6l648
 b3S01d8qyR+kl1so0L6uSRD05fEwzXJ6CgVz9tIXKhM5K9M6inwq1Rzhg6EzxOU0R/eL
 AIH2ukCcoH11JhyFK3LljVa3sY3EOtpS/ehw6ewYCqRYYJl6Mg5L8hIW36Z/Uwq6ijvB
 2VwoBzDYNp8DXezLumnGDgP7wwTtCM5motnT6/qXOhazJ+2Cumlj9GiYnwzDjJjIjBag
 d4SgPL/QHpFLsGeN0spmW74piTzTmP/t7/FqOJQd5Krpo99RcSofVcnekytsTmIRQ87N
 VgJw==
X-Gm-Message-State: AOJu0Yws14qU4FAiAJ94q9x0bVIaaHODFop0sSYRjklohjBvIHdIcSvT
 np84gpEsuJT3CrlzEcToBKvjnh5mwt/SAYMs3t1ttQ==
X-Received: by 2002:a50:9ea7:0:b0:53f:a526:779 with SMTP id
 a36-20020a509ea7000000b0053fa5260779mr4812176edf.12.1699549871438; Thu, 09
 Nov 2023 09:11:11 -0800 (PST)
MIME-Version: 1.0
References: <20231109170715.259520-1-eric.auger@redhat.com>
In-Reply-To: <20231109170715.259520-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Nov 2023 17:11:00 +0000
Message-ID: <CAFEAcA_iNjy2NgxEk51_XU27qZOKjw+OuxzGhvTCMBAjxaJi+A@mail.gmail.com>
Subject: Re: [PATCH] virtio-iommu: Remove useless !sdev check in
 virtio_iommu_probe()
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 clg@redhat.com, mst@redhat.com, yanghliu@redhat.com, 
 alex.williamson@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +e5Zh1cKLs4s

On Thu, 9 Nov 2023 at 17:07, Eric Auger <eric.auger@redhat.com> wrote:
>
> The code already checks iommu_mr is not NULL so there is no
> need to check container_of() is not NULL. Remove the check.
>
> Fixes: CID 1523901
> Fixes: 09b4c3d6a2 ("virtio-iommu: Record whether a probe request has
> been issued")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Coverity (CID 1523901)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
