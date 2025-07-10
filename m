Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9F7C83F1D
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 11:49:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZplw-0004f4-3i; Thu, 10 Jul 2025 07:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZplV-0002VZ-IY
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 07:48:39 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZplT-0001lH-Aj
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 07:48:37 -0400
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e81749142b3so703277276.3
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 04:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752148112; x=1752752912; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MvXBAL/xPT2d97B4UA4Tmx9TqzY8IXm1n33AvaqrAcc=;
 b=oTAhQkKdwYA8iPluIl6COWdKwEXPTdgZEks3O35DLlSuaXttwlizMVPbf+2O0eJukL
 NDcGaXeFXa5dXTnTaHjq6TyFP604DpvAPJIwIbnV37cIfSQ1V52xVYFkh3tUwIdSHWJY
 rKgaBDsteJ85E97KLlaCNz1mhfHpiLKiz8Dp1Q5qKrx9V5v4yjw6czz5WP0OURTGStMx
 jTdlO26MCneHm+gn33PD62wSY2gCUjoISwtjqxXgbY6H74VJec7hk+eRj4TJKtQAkeJ5
 DF9V5meAyP7HfMLJZ07eqBGlRVWALCtFzqBJ26yP28pdWmBUpCHQGwutYFnlv+PpJ9RS
 CJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752148112; x=1752752912;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MvXBAL/xPT2d97B4UA4Tmx9TqzY8IXm1n33AvaqrAcc=;
 b=oEk3VMJQo5KRadlp1GX3fJOPLStUlyZy7lN+r6HZQ7I2+qn4jXqXxZqu8/Y6gMOACU
 4biPSkh42yzlJTZ2NYK7k3HCfwHH+a00R+BmxmQjmY23ryPkkjlatav2i0Jsb/lYGTM8
 FADMkhjrkJ3L+nILIQCZKUoHDa+Bs1eFJPD2s0M4DyTsltguS0GLIeHQlXB4T8+56YhR
 Hj9wSUuRhBDKgT3xW1tI9ud1UHbmlzE219Lw30jhHQa1oXxQzqGhp8Ag+Sik/uRZMcUB
 IAaXDnyrqAuKG5Rd2bXcI0LU5n+3gKEaKiv0a29sNOLAXFrn9LbX5Twg/86+abK3XVxx
 8/Sw==
X-Gm-Message-State: AOJu0Yx4BQgZH0Qrw2Q6q0yvWmKwXqoJIP9pVxkKblwFruAZa6vaBYil
 +xwdhH8hWnupYkp7gT/ZXwBrPvbrbdGZ83fGwjkal9z/NRcBAczRv1fUiHgdS2hQjZUpKxEWle5
 a81GsRet/DbMHsi3K+PHZ3jrMFN6BWEKACsMV2PbZtA==
X-Gm-Gg: ASbGncsYBfOurtCdlu2KK1KEGMYCM07zby2oteNzVCdHhOaNbZuN8LzUxlAhIr/hf/G
 bXJFCp9VXvIDLdvkuwFauQrsDvOaqwP6WMqpRCTI3JOlqQ7VyFXtrVJY9UCmdePDQMbitgIX1KI
 XfGTeDKhHzzcxjPBXnUesbccJ+cgdulJYzWMJb6LuNI1f5
X-Google-Smtp-Source: AGHT+IEHTiBycdOW92tqJTp1iKLOtWaXRGioxhB8k5/GS32d3UwtgZFn0mzDnaL02ig5YtrHzs3d9iDysVclb+6OvVA=
X-Received: by 2002:a05:690c:7010:b0:70d:ed5d:b4da with SMTP id
 00721157ae682-717b1677de8mr92157637b3.8.1752148112360; Thu, 10 Jul 2025
 04:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250708154055.101012-1-shameerali.kolothum.thodi@huawei.com>
 <1291e658f6284fc3b041b599ad375ea1@huawei.com>
In-Reply-To: <1291e658f6284fc3b041b599ad375ea1@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jul 2025 12:48:20 +0100
X-Gm-Features: Ac12FXwgEr5SQvCMa0uyAwKt-kqjt2dcCxigi8BASgj8bgRUURuzcR2i1kSb4Wo
Message-ID: <CAFEAcA_eX0uwYcVjSN=V97xh3uHs5SgHZOx_wYkLC6TNCX7+9g@mail.gmail.com>
Subject: Re: [PATCH v7 00/12] hw/arm/virt: Add support for user creatable
 SMMUv3 device
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, 
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, 
 "berrange@redhat.com" <berrange@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, 
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>, 
 "smostafa@google.com" <smostafa@google.com>, 
 "gustavo.romero@linaro.org" <gustavo.romero@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>, 
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, 
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 10 Jul 2025 at 11:10, Shameerali Kolothum Thodi
<shameerali.kolothum.thodi@huawei.com> wrote:
>
>
> Hi Peter,
>
> > -----Original Message-----
> > From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > Sent: Tuesday, July 8, 2025 4:41 PM
> > To: qemu-arm@nongnu.org; qemu-devel@nongnu.org
> > Cc: eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> > nicolinc@nvidia.com; ddutile@redhat.com; berrange@redhat.com;
> > imammedo@redhat.com; nathanc@nvidia.com; mochs@nvidia.com;
> > smostafa@google.com; gustavo.romero@linaro.org; mst@redhat.com;
> > marcel.apfelbaum@gmail.com; linuxarm@huawei.com;
> > wangzhou1@hisilicon.com; jiangkunkun@huawei.com;
> > jonathan.cameron@huawei.com; zhangfei.gao@linaro.org
> > Subject: [PATCH v7 00/12] hw/arm/virt: Add support for user creatable
> > SMMUv3 device
> >
> > Hi All,
> >
> > Changes from v6:
> > https://lore.kernel.org/qemu-devel/20250703084643.85740-1-
> > shameerali.kolothum.thodi@huawei.com/
> >
> > 1. Fixed the warning case for DT support, reported by Eric(patch #8).
> > 2. Picked up R-by's and T-by's. Thanks!
> >
> > Please take a look and let me know. I think this is in a good shape now
> > for 10.1.
>
> I understand the soft-freeze for 10.1 is next week. Any chance this series
> can be picked for 10.1? Please let me know.

I'm afraid it's already pretty late, and you seem to still have
at least one person with comments/questions about this v7
series which has only just hit the list in the last few days.
So I think we should leave this until 10.2.

-- PMM

