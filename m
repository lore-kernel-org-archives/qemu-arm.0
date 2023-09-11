Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1538085ejx;
        Mon, 11 Sep 2023 11:41:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjpq/4aHYk3kVyJUoUgAtX4ROphWxK9P5raIdJRkJQ1zoMhcvLollY9QBnFvx7DS298adw
X-Received: by 2002:ac8:5f94:0:b0:3ff:438c:6241 with SMTP id j20-20020ac85f94000000b003ff438c6241mr11646360qta.58.1694457704015;
        Mon, 11 Sep 2023 11:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694457704; cv=none;
        d=google.com; s=arc-20160816;
        b=MycIqSczpCzv01xKqfD529rcntRcTMlfiPPgzZTuw1h/jz7YWFq3ZVyAtrhCp+xp0p
         fi9jkBNae8j/eT9Mu15tr5xr203obYnLey1Kyrv/mCLQ7pM60n9UI6VHFaSEZiqy4vn3
         F8qC1YTEQzUbUen/6S42npwcYlVsSosG9m4Utp1+S2wFgXPwJ8WcFnec7HcoaNHap7k/
         NOUn56VtKIJlmjmuTQtW2epUqFcv1poIOuoIu+JgrI8Y/gTl8rtl/DezbBT6Hvib/GKa
         lXY3oBnd5CuNAEW/R82rAMELAZT7N8/SIJvm2HcICM+VHwhU3bGgrxWFgH+RpZdrsnpw
         HGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=XMLo+88NX2zws04KrGVZGS34STIONVHKxOhJuvb4Qx4=;
        fh=BsOjEjkAxgjs1IoHYi4/BRH6As/6MNWA8nrKb9fJvr8=;
        b=Tx/wtorloQG69cy8Q5o4vLCZt29foEfInSFGKKWG1RQEye5fRvwxKJktZlmFUPw1DY
         cHmG11VRgBfDqm1GLp2NITFWdwn3tdgw5pxMKgKCsTYr+clT1s7z5MxDsO4MM/I9W07H
         HCHvZ53lj4wgQFgbuwfxzGXB+fNUYQ6lfxmMm7ZX6CIple09Ex4+haQx8bB/av+blc1z
         OxAehxiU/odYptmwIq31v2YPMCvzw8pYEbDM5Ne/rurO7aXhNH7S3NvW7477h4PhIoBb
         hTGMuvEv4u44NGn3Z3ooOrVNur61kGnGOysgGgNgjuGNWv51jPHyq3DsB79QK4ffFJzx
         8kNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eAf6hODM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7-20020a05622a034700b004053f0c4885si5382550qtw.71.2023.09.11.11.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 11:41:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eAf6hODM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qflqe-0003ix-5d; Mon, 11 Sep 2023 14:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1qflqc-0003iN-4X
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 14:41:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1qflqa-0000y3-4M
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 14:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694457679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XMLo+88NX2zws04KrGVZGS34STIONVHKxOhJuvb4Qx4=;
 b=eAf6hODMzd/f9j831LYE5+mms0Z0hsoXnhtI+c53fkcn+aYQ6d6vOyn4iHi1ImswucRe5+
 L/XL+5dZjeyZlIbqszd+qc7aWcuPloY+hek6ubMxQHVcuewX/8wX7dL6P1XtZ1scpjsGxd
 5JI5wLH9mDdsURXtmNbdlF6+yLagmpg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-FjRoZywbO_mETZRYb_V7mg-1; Mon, 11 Sep 2023 14:41:17 -0400
X-MC-Unique: FjRoZywbO_mETZRYb_V7mg-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-413650a9d6dso12961391cf.0
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 11:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694457677; x=1695062477;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XMLo+88NX2zws04KrGVZGS34STIONVHKxOhJuvb4Qx4=;
 b=vnt6sHLdPOuhDFgMtQZs3o8NHhXi01hbtXK4snx8GckLNfuA/s8Jbfsz9weuYYoCE2
 2i1yyQTk4ezUW5nfAo59TyrWteLfnatzPEG+t0vu2acfgJGaNR4tDq6MCLGEjr1zZFHE
 tB03XI/UM3N1HfZMA7vK8rjT8JzOMeafOethsp3r56FxKFw7Tm0U0QjMvi1vpY8qLuB8
 SSQyCmiBX08B7BRZGwLdzMl8YBf/mSxPPXXNGeHJTDDafdEighlYRYgpKU1nEQAUClYU
 cOKqiqiOFmdSLaxa6EDmXX2OFNNikxjUaOhMbFZ/TKg4LlLsxV2Pb4hHgW/PDBzHfKmn
 nqiQ==
X-Gm-Message-State: AOJu0YwHsPO+/6bkXaImJVgohTffn6FdpntkOf314vnBvctVNGXBBW4s
 IhMBmUqwQZmgJyFMEzFt7fnVc/T0sj/k2Px2R1fyHlSb+nxcYRriBQPMFNaJRoInz6/6bFpidfN
 3wS1Szu+ibsqV
X-Received: by 2002:a05:622a:1922:b0:412:2dac:acb7 with SMTP id
 w34-20020a05622a192200b004122dacacb7mr14740182qtc.1.1694457677256; 
 Mon, 11 Sep 2023 11:41:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1922:b0:412:2dac:acb7 with SMTP id
 w34-20020a05622a192200b004122dacacb7mr14740153qtc.1.1694457676935; 
 Mon, 11 Sep 2023 11:41:16 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 t24-20020ac865d8000000b004009f6e7e7csm2799583qto.31.2023.09.11.11.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 11:41:16 -0700 (PDT)
Date: Mon, 11 Sep 2023 14:41:14 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, david@redhat.com, philmd@linaro.org
Subject: Re: [PATCH 02/13] memory: Introduce
 memory_region_iommu_set_iova_ranges
Message-ID: <ZP9fSsSHP52M0fsI@x1n>
References: <20230904080451.424731-1-eric.auger@redhat.com>
 <20230904080451.424731-3-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230904080451.424731-3-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: sv0W0QVdnG+e

On Mon, Sep 04, 2023 at 10:03:45AM +0200, Eric Auger wrote:
> This helper will allow to convey information about valid
> IOVA ranges to virtual IOMMUS.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

