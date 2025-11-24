Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6490CFA466
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 12:10:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNVOg-0001h5-99; Mon, 24 Nov 2025 07:10:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vNVOW-0001dn-O2
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:10:13 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vNVOU-0001L4-Sa
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 07:10:12 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5957f617ff0so4506013e87.2
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 04:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763986209; x=1764591009; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=464XLwOgENqnAYRoNAorIbSPv136xeUdY/Nyhr11L2g=;
 b=zPyC85zy9omzh9PfYaxq1FpiCFE9GhNKVXlfUhu95rD0MeCngEEQ7gY9C7BX9mlavq
 kB1RhRJ7a8VBVS9LuVRC7QxkbbFbt1o7kWHSBnkgCZqlxNKyliSm/XVm+WsSKmlzSeK3
 Ly0qOAeNj0Kf7NO5yQUYU6H3GU6l+VEq6uaZkTSBStKsBIjsV5nwdCiSnwFmLRpdQ1S5
 p3KYHM/r62N5Zo2hByLq2IlUY6rScqnIoNBL4z5hWn2tcUSpa9lgwrqqaKFkXqqgYf+4
 MiLjefnRrHGWPSCv01IVRY7YlAME1Yxm+06PvTFHsgPPvErUb4ikxKLtshC7JsGr2YV+
 1cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763986209; x=1764591009;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=464XLwOgENqnAYRoNAorIbSPv136xeUdY/Nyhr11L2g=;
 b=BPupxk+kDhYnknTK2j1yRP9uahH6BZ4BZpM8GUORh7rOeONaRvR875JPseUTMOb7IG
 muN1oifkiPW/ffy6ALPC9356qBVEPlu+PfKPnpaXcjIPkRjQcS3K0wFYscQOzJcFhfPd
 X5cFNLCwWtHErSJiY0TyQy4BAzGfVMvqsUUZ9azGuCVilywLU2vhs+H9h12lU3umqJbD
 atgaa4B1mNjmMkxB0TWLDQhV7kLpaP3chrj8T2s7G+7sw9ipU4z57Trhh4/ivo4ksjib
 eFagUY0A83zEobYSgwJFpBCOMMSI9t3y0Aj1zCzB4gl7i1L56SMV8Ry35hDPhO++OLc/
 54EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9XKop71vsTm88VWfP8Ne1yVwHIWXiWh4I2UrTvwLSeXdrjStLt4I2RDeAs6DZ6P/5vV4GaA2Fig==@nongnu.org
X-Gm-Message-State: AOJu0YwaDGoof9JyvpdF3ADgNli6VrKbibFXx+31Kjk0xsO0C7SuQ9Vq
 xZFw8sT/jy8af/RyEGSpGa4y4VoXLH7gkUDF81er5JSxLJUFvJGrghHNkng4vF4/a12lXa6m4g5
 gekdPIC3Q5zbGXKIA+dwgCdizgj0jqRRIW2l0AhoDmw==
X-Gm-Gg: ASbGncvZLOhtRRLEuyoNDPoyfCd/eWqX5G87tg4IihxrHx9rV2D70UUlG7QBRIAiSwp
 HAua53PP7aWtR+friIJ65FYQWsga9CynTIsHZgpGYKWAtGwG8KxWOLFqUnlGsV2ym469dOmxoZZ
 ETi8MtjhmQtcBfmQTthgxyjtlCme7JOe7S38nfAFKgmRzmKipX9j7LW71l6+i3Wl6STfVuO+Ivx
 UC8/bpC4Zop19VHYquCfPvIg7CYC/En90FSOHf9o6+Ky/jV2IOHvnGHbemteINqMTBu9Rw=
X-Google-Smtp-Source: AGHT+IG6R2G/ACcxmdXJkgFwG3SuaZgiqgMHu4iOefmJalun7XdRPqap1Iyeg+vnMhlPwr1hzsZgY1ylKSnuAPXO0Xw=
X-Received: by 2002:a05:6512:4005:b0:595:7f2e:de0b with SMTP id
 2adb3069b0e04-596a3eab6e0mr3552517e87.12.1763986208592; Mon, 24 Nov 2025
 04:10:08 -0800 (PST)
MIME-Version: 1.0
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <aR9KhE9/ahl372xE@Asurada-Nvidia>
In-Reply-To: <aR9KhE9/ahl372xE@Asurada-Nvidia>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Mon, 24 Nov 2025 20:09:57 +0800
X-Gm-Features: AWmQ_bl2_x9y6gjkOKyKhRrZQIHwGYZLiApBj1GKpWD9Rvne_7FHzPszjwTOem8
Message-ID: <CABQgh9F7mwrT0K+nJAs7+mTrvTjvarc=N1yjLYowQX72rLeb+w@mail.gmail.com>
Subject: Re: [PATCH v6 00/33] hw/arm/virt: Add support for user-creatable
 accelerated SMMUv3
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com, 
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com, 
 smostafa@google.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com, 
 jonathan.cameron@huawei.com, zhenzhong.duan@intel.com, yi.l.liu@intel.com, 
 kjaju@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=zhangfei.gao@linaro.org; helo=mail-lf1-x12b.google.com
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

On Fri, 21 Nov 2025 at 01:06, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> On Thu, Nov 20, 2025 at 01:21:40PM +0000, Shameer Kolothum wrote:
> > https://github.com/shamiali2008/qemu-master master-smmuv3-accel-v6
>
> I did a quick sanity with two of my VM setups passing through GPU
> and MLX on NVIDIA Grace. Everything looks normal to me except:
>
> >  - GBPA-based vSTE update depends on Nicolin's kernel patch [1].
>
> This now becomes a hard requirement that would error out when the
> kernel doesn't have this change v.s. v5 just giving a warning. So
> make sure to apply that to the kernel tree for testing.
> b4 am https://lore.kernel.org/linux-iommu/20251103172755.2026145-1-nicolinc@nvidia.com/
>
> Not sure if we should put a hard requirement on the kernel change
> that isn't merged..
>
> With that,
>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>

Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>

Requires stall mode enabled.
https://github.com/Linaro/qemu/tree/master-smmuv3-accel-v6

Thanks

