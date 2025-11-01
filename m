Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22D9CCFA00
	for <qemu-arm@archiver.kernel.org>; Sat,  1 Nov 2025 14:20:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFCSv-0002aT-C7; Sat, 01 Nov 2025 10:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vFCSu-0002aE-1o
 for qemu-arm@nongnu.org; Sat, 01 Nov 2025 10:20:24 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vFCSs-0004to-23
 for qemu-arm@nongnu.org; Sat, 01 Nov 2025 10:20:23 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-594259bc5f1so229909e87.2
 for <qemu-arm@nongnu.org>; Sat, 01 Nov 2025 07:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762006818; x=1762611618; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K9zp/U5Qb5Pam2E1qPmLEw9uZeK37F56N8y4Jvvc2mc=;
 b=f416JIr9nPNds2Bg42OgmTtGKGN/a22G/yyynXEX/IPZUHpU+B42WB0bFVXY2Vfy48
 W6x/swTcnGINz9F4M/FKPDOUYKHwJ6TxdOvAtsnSOYJv4c0CwxmFy4R0y5JVehnGGUxD
 4kyY4UaAdeCeHAlsNg9DWOivUFx104JUkfyXM+3a18kOqWBQz02KvzAfVF1ukriFmPl9
 6xnMAIFPoY23LoFRoC3vltTalpDswynjKIhl4dN22ZyNlPIZVZukIyqBrtl9XdpofX/z
 5mchmYjFI5nfTexFb2ZAc9SjOkowiRqOmV6dH1I9T+Lo45cnITnFtSmgtocxORJO8GB/
 p58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762006818; x=1762611618;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K9zp/U5Qb5Pam2E1qPmLEw9uZeK37F56N8y4Jvvc2mc=;
 b=KnXHo0R6OEuiU3SP1reBvUHwKySlsMiuftJ5+C9mkY1LHCiMT4TmIYcdB4XzBFY7hH
 g9RbUXZhcVG6sOjI4nSyF8NY/mUCBOOyLwGKzk/A9QomLBTW0jLO8IlsEW7HYgX/f+BN
 zJzKMxgWxOMJGXsfX3W3koTYCnkiE/PTIa9nrhIl5PHYpcfO/ymghUcn8ZVMy15FhqgP
 fRHtwldIlnDNt676LjGES56xWmxq4MwbSQwSbmxtZT94tiLHRAVCSRW9HNogrMv0jOrb
 XjfxoFnnfJWuSCthcjpmevMLgWtk6fjsdTQX2JtTERk32SO4QctdOsix0MuDNaXcbI0E
 CUtQ==
X-Gm-Message-State: AOJu0Yxg9esQtAMc/4sAjTX0WQs1a3v62vNn7824GLygwa7+dAzym6u7
 RAnTt9eWlsRLprxFtVwvTU3RwKsVl+VTr6EfvN59xGebTYFXPzGPg70AK/LzwlA0/ngQgHl6VSY
 lsrKRr6ltIi+RAAgCGeGKAYIW1tVG7ldsGNcfaCmU/A==
X-Gm-Gg: ASbGncvZ9mYWLmnKs0nRbB5ga6wQrO5zb+YwrVTHnZqgibeKutEBoveUh9CwV+HKB/v
 dqPuzRlVQLJmkYKoOylJ52lL6YKZpKaEvQBu45WyVMj2NLwW64gO6QyRrxQUgl5b7m00Px3UA9X
 H+QvUZl1Lxo1s4sbfWDewsPlDmj2sDCfLdvmr5d/E73aYoOyw/Tgcha7VAl125btwkXhnAW03Sz
 1RRqd3dc/EGA4zmuXfpt9VlPkxDtTYRqhQkIrv6fJ0qG8PAR3kVTdaFdM+Tu8BLgZz4gJ+y2PJf
 VV5vHA==
X-Google-Smtp-Source: AGHT+IHWvCHGbVSzhFiCjoqPpq8hGci3kps+8MblsGxKlECurt4gqLtGs5kLWlDl5dZWhPcP//udpWdxIEohI6mNhCI=
X-Received: by 2002:ac2:4e12:0:b0:592:fcad:4a11 with SMTP id
 2adb3069b0e04-5941d50cdcemr2641210e87.7.1762006818452; Sat, 01 Nov 2025
 07:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-20-skolothumtho@nvidia.com>
In-Reply-To: <20251031105005.24618-20-skolothumtho@nvidia.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Sat, 1 Nov 2025 22:20:05 +0800
X-Gm-Features: AWmQ_blFoW5ky7o3CKhmLVd0KWalRzH9RYdbqvefwV6SQl2F4QPzrmUXu4LKQu4
Message-ID: <CABQgh9ENUvSJ5UiPGDbdQ_VPm5PtdFVmEM_27Z9QEb4O29cKwQ@mail.gmail.com>
Subject: Re: [PATCH v5 19/32] hw/arm/smmuv3-accel: Get host SMMUv3 hw info and
 validate
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com, 
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com, 
 smostafa@google.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com, 
 jonathan.cameron@huawei.com, zhenzhong.duan@intel.com, yi.l.liu@intel.com, 
 kjaju@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=zhangfei.gao@linaro.org; helo=mail-lf1-x12a.google.com
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

Hi, Shameer

On Fri, 31 Oct 2025 at 18:54, Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
> Just before the device gets attached to the SMMUv3, make sure QEMU SMMUv3
> features are compatible with the host SMMUv3.
>
> Not all fields in the host SMMUv3 IDR registers are meaningful for userspace.
> Only the following fields can be used:
>
>   - IDR0: ST_LEVEL, TERM_MODEL, STALL_MODEL, TTENDIAN, CD2L, ASID16, TTF
>   - IDR1: SIDSIZE, SSIDSIZE
>   - IDR3: BBML, RIL
>   - IDR5: VAX, GRAN64K, GRAN16K, GRAN4K
>
> For now, the check is to make sure the features are in sync to enable
> basic accelerated SMMUv3 support.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 100 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index a2deda3c32..8b9f88dd8e 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -28,6 +28,98 @@ MemoryRegion root;
>  MemoryRegion sysmem;
>  static AddressSpace *shared_as_sysmem;
>
> +static bool
> +smmuv3_accel_check_hw_compatible(SMMUv3State *s,
> +                                 struct iommu_hw_info_arm_smmuv3 *info,
> +                                 Error **errp)
> +{

> +    /* QEMU SMMUv3 supports architecture version 3.1 */
> +    if (info->aidr < s->aidr) {
> +        error_setg(errp, "Host SMMUv3 architecture version not compatible");
> +        return false;
> +    }

Why has this requirement?
We have SMMUv3 version 3.0 and info->aidr = 0.
and qemu fails to boot here.

Thanks

