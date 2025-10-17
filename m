Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF22CCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 08:49:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9g91-00013r-Fc; Fri, 17 Oct 2025 04:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1v9g8u-00013T-Vs
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 04:48:59 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1v9g8r-0005bq-Ar
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 04:48:55 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-362e291924aso12888291fa.1
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 01:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760690926; x=1761295726; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kKB4yQ1CEdIhJDYLxJpP2+X3Y/kzNOW0KePOaAmRC9s=;
 b=b56AGACa/ppBMTfG3MQokZCufosFqsKwsX2HNYfqrQdrgCRthLbOI+z+eGdrHV1ugK
 G9/NiNsgkZTEUZKQqhXapSf6IbN7PT0BH6P04uHNtxk5v6TAAgO14bnUVpIvmHvlgoqV
 ltmIlrce9tqS3YvL16QEO3+p2Lv70TAsR5DYMMbtuMvsqwtH/tSus1PVCOn8tMNskPdI
 p+YuTTwOhxsDZo5jhfnYljIW3flFVhG0w5JRWdzl972OhrW+9fn60Ke/tiVNzR5z0z6f
 qhclcJRKPzNr8LdYUq66ie2lxXcCSRvHEdQwSx/aniJOlfOdN1yBQOdjWJH4lAKWYYHf
 XGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760690926; x=1761295726;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kKB4yQ1CEdIhJDYLxJpP2+X3Y/kzNOW0KePOaAmRC9s=;
 b=WPJwp+xsaK3jNvit1/9o11Ff6PsM/JugtdHjgCWCXd+mgaj5i1a2Lw3vA8no4SB5kp
 zHsIPM96uXkmaumb+znMhYjgUEN7ExBjiqxDvVPI/tJpzcRcH+euT+YoEiFUIEXedXGW
 9bqG0jEed5zXRfKQHGSL8LvxnUh/CypQ+OnIwoGieE11HxZWkI7PKpIwi1FToEIzu0T3
 Ib+7nM20QnuuRZCkbEqoRCdmI5Ltia0AHfN/N3k7z2NemSZScPLbGdqSwgDi7PCSXbMe
 eD4AiFYkkMYnCapV+Q+2JqFCwqbSS0n+IeIM7xHmDM1hH5eo75YxbHo++c3u10wV6g+N
 kouw==
X-Gm-Message-State: AOJu0YwvaUwZ29bu0NTpraDj7uOP0nuw3qQb6bes6d0+HF1/8GJ0rQ1G
 /gr3W8RUpXRdQyYe/PZ8CKbH2Lss9ffVKD12HZmzcmnXbZOUfMgDTIa/Qq5e0z47Lv0ARfmZqcc
 7AkBePfYJE6HkVDRLY152J80OIgi0PaL5/mN/nFyWog==
X-Gm-Gg: ASbGncvgE7JUh+bH8NTNg/SY6o4LC+qxqc1R6rH4tFWb6x8+dQJ80AiSY3q6h2fGm0u
 mfwrgK8md89157lZUFn9lAeaGVGzHO8qzqbuUXycuR/8AL9w82OqycniBGX1WyrQfmrYziHaBdr
 VTyvFIm63/7o7IqMAZN/b7RsXPJUszJCZnKz7fPJ5pQfvQVxXb4xawkhZkQ4E22QHmVK4vgmwrQ
 LGUvJFaftFnE/pkG/fLV083KCpcBKncsNWW4ttAz4pxkRMyRvmv8U6bxMn2qyipYRUwGzDenE63
 G4y2/Q==
X-Google-Smtp-Source: AGHT+IG4k65O71asJCL6E/CldgOm3nUH469QX5GS8KFVkXWXKGt8ggS/iD3RXgzo07G6YmzdsGjjBFbaiWpuwUNcOE4=
X-Received: by 2002:a05:651c:982:b0:36d:86b8:c57d with SMTP id
 38308e7fff4ca-3779772ac96mr11562771fa.1.1760690926464; Fri, 17 Oct 2025
 01:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-22-skolothumtho@nvidia.com>
In-Reply-To: <20250929133643.38961-22-skolothumtho@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Fri, 17 Oct 2025 16:48:35 +0800
X-Gm-Features: AS18NWDhZs1ga3V8_u_-nExC4rJxQqoCbJlEd5-ZtRx-SGG4amb5y8sU7YEkL-g
Message-ID: <CABQgh9EJMuVNHoi3iCW73mrC=y07djR8QoPAn8wN6+rL30iadw@mail.gmail.com>
Subject: Re: [PATCH v4 21/27] hw/arm/smmuv3-accel: Add a property to specify
 RIL support
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com, 
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com, 
 smostafa@google.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com, 
 jonathan.cameron@huawei.com, zhenzhong.duan@intel.com, yi.l.liu@intel.com, 
 shameerkolothum@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=zhangfei.gao@linaro.org; helo=mail-lj1-x229.google.com
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

On Mon, 29 Sept 2025 at 21:40, Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
> Currently QEMU SMMUv3 has RIL support by default. But if accelerated mode
> is enabled, RIL has to be compatible with host SMMUv3 support.
>
> Add a property so that the user can specify this.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>

If ril=off is not specified, the guest kernel will not boot up, is
this expected?

Fail with log:
qemu-system-aarch64: -device
vfio-pci,host=0000:75:00.1,bus=pcie.0,iommufd=iommufd0:
 vfio 0000:75:00.1: Failed to set vIOMMU: Host SUMMUv3 differs in
Range Invalidation support

Thanks

