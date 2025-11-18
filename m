Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69E5CED262
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Nov 2025 09:48:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLIJe-00044Z-QB; Tue, 18 Nov 2025 04:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vLIJd-00043w-4M
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 04:48:01 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vLIJb-00023Q-8A
 for qemu-arm@nongnu.org; Tue, 18 Nov 2025 04:48:00 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5945510fd7aso4458616e87.0
 for <qemu-arm@nongnu.org>; Tue, 18 Nov 2025 01:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763459277; x=1764064077; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aZXa5bmPdeMtAC8UpNVx/NK1W2UYHd744ERGExCRsdM=;
 b=Q0o+ovExuCRw/Vp76Tn/Jb50xyjOhO1znKlZloYJ8EjAedXqcJRGsiwO6mnudSrsL9
 0Z54KhNd4FQNTCALnO2dTZy4do8J7TkiuzSYXKonK3BP2Gm4qI2n31S7i5BKvmbgBqPC
 hm2x7oWi7Ew6pQNj1JTq84T24QK/HjrqlcF8P9ms8Ei7/OOrPj9M0RYP0aE4HRnK/1Yl
 m/VfQXPoZGZnRatTUcuSlJOrtSxB1nkPaVKpm70jDeE8x6w9eh51KvMdugiRW2PkJ2RD
 KRgR83DN6QyQk9+p6BwizmPp+UCgjFMmEXSSgnTNSlcYajnzvouocFkq08lgIW9AfgzB
 RjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763459277; x=1764064077;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZXa5bmPdeMtAC8UpNVx/NK1W2UYHd744ERGExCRsdM=;
 b=HctP2eOm03bKVUlYjncS/P7BxHuJAo8j2jeGi8LOzhF63kDXyNuOiWGt+dt6bJKa8p
 TGLjp7Hd3X6pPhLyFlb/7mtznJGuWNKRKHjeuYO95HkAqFfCVgJ6sNgxrTtsPvmjpK6I
 v45iwhJ8UQ/J7rv1Av8DJuNcNI8UeCcONX26f8HsZJ/xlgS5OaEgZCU2lFQLhNh5BmHJ
 ZeOPaJe8zVWQ0CztFT/RPxKTiMHZjqUrAhE01Pn2BZTpc/zkfsuoZH8KP0dveibGcPbA
 TXnH4O6O6sPzU4skYBYqbdPe5LMuR1a47XQAJ6Fgvj361UFiw877wGqCeQ5K8dERfQnb
 QmyA==
X-Gm-Message-State: AOJu0YwBalSe4xqdwWENG6rGsbyDaqlgg+cpdPaXVXaJkgKMxYUDR2D7
 cuz7JJn3uX6UOPMFEzmGzHRFTlx6SBAIx4KT3yHf/Eu/sIgKcN12K4creGIbB9hrxi7Hyrxhzn3
 nf5Yx4xm19/WqUBymFv9/SOS5ES8VWhrAwW9CvyYjnA==
X-Gm-Gg: ASbGncuYERJ26br3IFPbFps9ujQEQB51hLMO+rbLJe2kMHD3+neg7HWkAZQ96HnzxiO
 YvZo0f/hX8PTZH9OBkdWAZukf5J1GoWbzHJKZ0aFJdn/0l2i0u/4RsPbWpGCpCYT62oOk1tT0yC
 xw9WX6CvCoaN+7cECMiUKWhLAU/6ESlhDu27Taipluk1JRKByaGlNRFuTNf59I6bBJ8znHXRaIX
 cij92b3V7ckhb/7lv4YCHt5gvtglvDfzaYFwvpzj7VVLRDil4sudSodl00K1jsD5ob7BsgqICOj
 MZC29+UU0aI=
X-Google-Smtp-Source: AGHT+IGD8c3XOSzNSAtnbgCPXL5tD58s4Vu3uE6ycBqXZZzYELWWILbqDjXE5LjudjQPrkP6j3ddsItNOIABJyrJRIg=
X-Received: by 2002:a05:6512:6c4:b0:595:7e9c:cdf7 with SMTP id
 2adb3069b0e04-59584220ccamr6117950e87.51.1763459277344; Tue, 18 Nov 2025
 01:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-15-skolothumtho@nvidia.com>
 <CABQgh9Fk2qHkHbpepY0j8MaLe-TkxrVaMi_R3C-oD2HihK-wGA@mail.gmail.com>
 <CH3PR12MB7548AE8D724A8B4D8DABFDD4ABD6A@CH3PR12MB7548.namprd12.prod.outlook.com>
In-Reply-To: <CH3PR12MB7548AE8D724A8B4D8DABFDD4ABD6A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Tue, 18 Nov 2025 17:47:42 +0800
X-Gm-Features: AWmQ_bk1G4ZN7vSmM8EP37hq4hWbZlZlf7eaN7zRGz2vPept5dLmWT4VzlKWyVE
Message-ID: <CABQgh9FqZDznoQDugR0M_Lw+UPg2r3jyQ8W6mv=OPArYAPQQnQ@mail.gmail.com>
Subject: Re: [PATCH v5 14/32] hw/arm/smmuv3-accel: Install SMMUv3 GBPA based
 hwpt
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "eric.auger@redhat.com" <eric.auger@redhat.com>, 
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, 
 Nicolin Chen <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>, 
 "berrange@redhat.com" <berrange@redhat.com>, Nathan Chen <nathanc@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>, 
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>, 
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>, 
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>, 
 Krishnakant Jaju <kjaju@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=zhangfei.gao@linaro.org; helo=mail-lf1-x135.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 18 Nov 2025 at 15:57, Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Zhangfei Gao <zhangfei.gao@linaro.org>
> > Sent: 18 November 2025 03:50
> > To: Shameer Kolothum <skolothumtho@nvidia.com>
> > Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> > eric.auger@redhat.com; peter.maydell@linaro.org; Jason Gunthorpe
> > <jgg@nvidia.com>; Nicolin Chen <nicolinc@nvidia.com>;
> > ddutile@redhat.com; berrange@redhat.com; Nathan Chen
> > <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
> > smostafa@google.com; wangzhou1@hisilicon.com;
> > jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
> > zhenzhong.duan@intel.com; yi.l.liu@intel.com; Krishnakant Jaju
> > <kjaju@nvidia.com>
> > Subject: Re: [PATCH v5 14/32] hw/arm/smmuv3-accel: Install SMMUv3 GBPA
> > based hwpt
> >
> > External email: Use caution opening links or attachments
> >
>
> [...]
>
> > > +     */
> > > +    if (s->gbpa & SMMU_GBPA_ABORT) {
> > > +        hwpt_id = vsmmu->abort_hwpt_id;
> > > +    } else {
> > > +        hwpt_id = vsmmu->bypass_hwpt_id;
> > > +    }
> > > +
> > > +    QLIST_FOREACH(accel_dev, &vsmmu->device_list, next) {
> > v4 has this, while v5 removes it.
> >              if (!accel_dev->vdev)
> >                 continue;
> >
> > So I got a warning when accel_dev->vdev = NULL in the beginning.
> > "Failed to attach GBPA hwpt id xx for dev id xx"
>
> Could you please check you have this kernel patch applied,
> https://lore.kernel.org/all/20251103172755.2026145-1-nicolinc@nvidia.com/
>
> This relaxes the vdev requirement for GBPA based HWPTs.

Yes, with that patch, the issue disappears.

Thanks

