Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B60C5DF9C
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 06:07:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wykJ5-0008KF-5k; Tue, 25 Aug 2026 02:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wykJ2-0008JQ-FZ
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 02:06:45 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wykJ1-00023k-2U
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 02:06:44 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-cbb8b54fcf8so4239098a12.0
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 23:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787638001; x=1788242801; darn=nongnu.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=gPR9SlHWq0gRhMJPkEyFpxP4NGyHKKiN3b+8rFZAUJ4=;
 b=fVjwUQb2BtbwOj6FeYL9/LzJmRqjSYjAqJLJaKD8khLWM07amhEWifdhgzuETZEC0n
 zt9q7d+znc5DIO7kup/PthmcwZj2O4GXtHyWEb8Vlm3gHCSude1QhPcSgpSs3u7yilYM
 NK4AT0CstGyugBHJaFvOI0tNAwiCP8yTydQwQgnjptCqOriknbaurzEDMt8D2xC2zFXQ
 FrLxU6HhPhSuf6My+CSdEVsSm4z8ic6mtFGEQC11jpojrUwBFq6Ox5pNLuZj4AHbsWJh
 rawqu1KfEVKpUdN6+pxYL/+ZR09iM+8YOk+LEx7OpRtCXztammKeLWJWaTl2G5pwS2JI
 6dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787638001; x=1788242801;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gPR9SlHWq0gRhMJPkEyFpxP4NGyHKKiN3b+8rFZAUJ4=;
 b=CGAWYNa7DJemkJeiY4/UdqpS2TNheaa+QNzk6w0TYoaw91u6eZRIQhUG1VIKM9NWAA
 ivL+CDuscFNEQM89hnQgo90YHB6Un1TFys3W9Yl4oFGrcs7gZLxRrzimwJSFx5hElk3l
 PXJ0unulAcJ7Xmtm6s7OKXmWfC6m5ZRcHzrSAKRP+MXspe3HkWkL/sxHLzp3BxNNPHzh
 osSwv+r6X0hsipFHRVLLcL9ycW+OECgzqq6Ib/NW7aHElgPLk8e9JYFmI7u+G5JOr1RX
 E7U3ljqY0lUSEvRTe7mryoA+hpFmaLI1gQakH0h8OzKnA0AdOB09JhwFnDlYGzxxEkKZ
 lyXw==
X-Forwarded-Encrypted: i=1;
 AHgh+RojvNK2ntR4QCjFnRpRmcRQpLDdlFtGJtHDpF2rhCcZ0kupUxkeD/C5C2TiwmZVmwdtDzyXB+1TSA==@nongnu.org
X-Gm-Message-State: AFuF++myQCFpE94DTq1G837MLk/pGL/+66dS9ojatqRglboEyIqLmVHr
 QR7nFc6JVYxUOu9qtA6l1jW4Kh4U17YU8HN6QF31IXQsiUhuHYdCjLNs
X-Gm-Gg: AR+sD11el/hM/xYgy4oZJw5CQOKrkJkpA7uAJvnR0PvHf64UKRZBxe0XeTNYLP3H9Dx
 tZL/gAOWKiXbQ1acmWUWpToCe5pDsFZEADB0oglVTceGoS0vKEB/g8ixne1y9LzyiG4woLNKRdA
 Ey8toDOK/aPVkuJhRY63TTQLQ0pX2rSkOmCKwYmUqrbf0BYV0Z5hbQOSp1smQiawuvneBpOrwB5
 z7CH8TWPQd8+W2wVcpmTigvJxjzpfy+sma5hFxLRvaaVTlA/MO0MfEIucE2tX/6OB0NERzUh0lX
 wtWix3Lomqqbm5/G2IK+271kPqEsmKtv6sVUmnl7wkLtj1fK2o4xHp5lqnXeZkayLwWiG/V211O
 eoECYf3ljqaIFVdXGiR2fWMrmB6q1SRgZWN/Jn3H72e/ijoZIChBsb3YI96eBzYFMKDwkgVbzUV
 0vq4mwgxM/FXRGGKX5opicwRlsGkvy9ZFcFVqw6UZ19qCRY3x5UM1095F3xovIhHdG12iW
X-Received: by 2002:a17:90b:1b43:b0:38e:9eb2:9d43 with SMTP id
 98e67ed59e1d1-395c357e8efmr54346162a91.16.1787638001436; 
 Mon, 24 Aug 2026 23:06:41 -0700 (PDT)
Received: from smtpclient.apple ([117.55.237.216])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39642060be2sm903086a91.0.2026.08.24.23.06.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Aug 2026 23:06:41 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v3 1/5] hw/sd/axiado_sdhci: Add header guard
From: Jack Wang <163wangjack@gmail.com>
In-Reply-To: <20260825021155.2475879-2-kchiu@axiado.com>
Date: Tue, 25 Aug 2026 14:06:23 +0800
Cc: qemu-devel@nongnu.org,
 peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Content-Transfer-Encoding: 7bit
Message-Id: <67241963-D3E0-40B1-96F4-7557904C082D@gmail.com>
References: <20260825021155.2475879-2-kchiu@axiado.com>
To: kchiu@axiado.com
X-Mailer: Apple Mail (2.3864.600.51.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=163wangjack@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


> On Mon, 24 Aug 2026 19:11:51 -0700, Kuan-Jui Chiu <kchiu@axiado.com> wrote:
> Signed-off-by: Kuan-Jui Chiu <kchiu@axiado.com>
> ---
> include/hw/sd/axiado_sdhci.h | 5 +++++
> 1 file changed, 5 insertions(+)
> 
> diff --git a/include/hw/sd/axiado_sdhci.h b/include/hw/sd/axiado_sdhci.h
> index 85afebad93..ab52eb8185 100644
> --- a/include/hw/sd/axiado_sdhci.h
> +++ b/include/hw/sd/axiado_sdhci.h
> @@ -6,6 +6,9 @@
>  * SPDX-License-Identifier: GPL-2.0-or-later
>  */
> 
> +#ifndef AXIADO_SDHCI_H
> +#define AXIADO_SDHCI_H
> +
> #include "hw/sd/sdhci.h"
> #include "qom/object.h"
> 
> @@ -19,3 +22,5 @@ typedef struct AxiadoSDHCIState {
>     MemoryRegion emmc_phy;
>     BusState *sd_bus;
> } AxiadoSDHCIState;
> +
> +#endif /* AXIADO_SDHCI_H */
> -- 
> 2.34.1
> 
> 
> 
> 
LGTM if you could add commit message the better

Reviewed-by: Jack Wang <163wangjack@gmail.com>

