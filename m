Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E21606A32C
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Nov 2026 12:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JdS14I6x
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVSte-0002fd-LX; Mon, 23 Nov 2026 07:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVStd-0002at-0c
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 07:11:45 -0500
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVStb-0004D8-A1
 for qemu-arm@nongnu.org; Mon, 23 Nov 2026 07:11:44 -0500
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-67db1f6f50eso3163942d50.0
 for <qemu-arm@nongnu.org>; Mon, 23 Nov 2026 04:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795435902; cv=none;
 d=google.com; s=arc-20260327;
 b=mAylDWG1Fi1N8mFhSYB+290Ff2VIECSM66Sln+CyzQEg43mzI2uzml1is9onk/+HNP
 2et+9mEB+u3A6JbpqaveWAEmgprYliWzzrmBzdfawJvtbQUxZQFOfx4PNM35zMGEWOOk
 +y31CcQXiP6PYCVlgMWmX2cHMDPQ0IbiiC/GyTlsq/2Qlp7XOwFFmAvkFqQLMUrPzIZ8
 GJttQVY94G+7gb8poXiQJ98UNBYhKA5tGUXGukA+L1P5try5uJFsonnvynmdantzaA/3
 yELiiOgSJ6Y4xXBKyun3CkUa85pTUhzfRTi0xu75OAXyD6NKxHteqOUxzcGQmYVo/wzo
 U1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7bsd6MScyb/Cw9bSouzvpkrUzEybksY5A3VWBFLKcos=;
 fh=UXZ0wD9r7iLCR1DsRrpgafzfKtyY6wW7r22Mz1B06w0=;
 b=g0sQ1TRifDw3Emugg27Bml9Ly8OggAvusm8E2rvNpsG1jn/rjipZJiAd2lfaM5BiS2
 uG6NEfSr+AcSrpg8Ir67Rq7eMqIdAsNzYblaJPu+Poy5zU/ggIgSYwiWZ8N556XOJD7J
 QmF+I5aXc/U4DdljUqN52zM7kDqDmLMkUlZsYX5HhMIHjS3ObD99zkaCm08K+OVizTwH
 xA1p7yHdNyA2AkGTMYSfBh3GLbDJbpP7MrznftzAwBMAuQnuMWN9gCVOnYGA/xeXmOyB
 YFod/McKg+uMonkDINFc/N+WbX1Iug9I5Qu79oinAC1QjJGuVc6giGf18y05J6tUjce9
 3aAA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795435902; x=1796040702; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7bsd6MScyb/Cw9bSouzvpkrUzEybksY5A3VWBFLKcos=;
 b=JdS14I6xMJB7zxtdhvjNFpQ91fpjba3mSA9Jha8GZqLpOeifjht85Y+wKKKrz3xChG
 66OyuoRvC4YC4lLdY06jcO1MDlPG9Yqv985h/KpGEkAT0EUEzTDFIyvBd8Cjv2ezURNQ
 4WMRpMRVDj9OIAXVFQN5v4OXiOlh+BorfHAKp3bKW7caa0T2CoHqp4L8NrT4vAI0Y1cj
 5LDbe+uSvNdbEVsCSmYH7vuE1PeFolS3UaMyo9by0sFPeB7CuNOQkJWbVJoiRHtsorU+
 +a37+G7X5SmmdsPK6z+KbMPEcIVzQaUkem5MdSAxxPlI4+aQ/zPBb2HBXKWNF5hWcrUN
 J9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795435902; x=1796040702;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=7bsd6MScyb/Cw9bSouzvpkrUzEybksY5A3VWBFLKcos=;
 b=uRwmd7uIMd0/cH2Ny5qhd9AwXjRi99EGQuZaqc8rf5YXB1BWQNi4oBIa0TsexEj1a7
 vl+59PwLmhgmJKpsTTC9nnMit2NvxZu+jumpZJz9oqnG864/OvndPqqHwf3mjcQTwFqr
 wWeXAx+l4ipUTGCvXYN34WwmApeGCSmLJlyHiuJI/dlfganZL0vIR8FRCzKCd9E9lG/+
 GGXFwzZatRnahQLx1hF5e9LyJJAqOa1EQEmAIJcDbcIsK9M9sCpnfgzIt6WsY28lypM3
 fXFtkE/KbWmzOT4fQhzRYPuHwICI+7Z7ncQstZQ24iKhhtEWC91RvX+L1FB4hA7ZUOSG
 ExiA==
X-Gm-Message-State: APuU4Z/gH4b6pbA+BQkFFmolaJE+vjGdicgJLvMNg/TmqaX775gNRDSc
 6FfKMvA6ve18wMV6NkJOoXpVO1qR50X+EYphrw1SHuS2GRmFH/+BbwJZ6lFZdswWBI8Phfg03I1
 NQr/8WiZao7SmbHy5Sl7OVeZYWF8w5a1obO9s02s+0w==
X-Gm-Gg: AZFdTZfif+pofW7WVZcK+vMcdUmCO42k6zz35VL9qTJ0tizYwgD9qGD3QjrgmrdEMP2
 8KxAhMvkfWrq5Btsf/N1VU1IWGdjvfZnH7NFj59MscjLaxMV8gUHGyek9i+l930YvyZV7zNbLJu
 dMcdegbtY0EJQqnSJTHeJ5ov5Wv2lTGsVvpQUt9WS44X269vT6R6zbsKH7LnOo4LUUSagHDiHr0
 pLNM6YXLnXLgwynUSmChF0XuSB5FoXbA0l2QXX9pxkkfE1xoT2/z9aZjPeZctcrUM8lze9gi4EK
 X+v1vBXirhHaKIzyfhxsa9aQQPcbEVgxug0JTui5T/XpEWl0DpauPL7i4NR+08UvaUnKffoWDig
 1CbPO9tnoEssB1yM3xymN4OpxXQYjZNC/Qw4Q1dVJ0FAPe1d8q4vq/ULx6DU9HQkTgKdSzaAygl
 DsI8WCcRX0N8OXaoKTOWyR
X-Received: by 2002:a05:690e:13cb:b0:66f:c1be:a64f with SMTP id
 956f58d0204a3-67df4444c30mr5051365d50.65.1795435901705; Mon, 23 Nov 2026
 04:11:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119091922.1380805-1-fuad.tabba@linux.dev>
In-Reply-To: <20261119091922.1380805-1-fuad.tabba@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2026 12:11:29 +0000
X-Gm-Features: Aa3M54rpluT39izReyFJiIZcPDUpABTDZz_S3j63cL7aubt1aEvxAtxAxp_Umg8
Message-ID: <CAFEAcA9mkWC5re8NfCPQzgB5de+0DYC5TbQV9TXweEtMKzdi7Q@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Don't count a virtual EOI in
 EOImode 1
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 tabba@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 at 09:19, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>
> icv_eoir_write() increments ICH_HCR_EL2.EOIcount for a virtual EOI with
> no matching list register, in either EOImode. The VirtualWriteEOIR0()
> and VirtualWriteEOIR1() pseudocode in the GICv3 architecture
> specification only does so in EOImode 0 (ICH_VMCR_EL2.VEOIM clear),
> since in EOImode 1 the DIR write increments EOIcount instead.
>
> In EOImode 1 an interrupt with no list register is therefore counted
> twice, and KVM running under TCG deactivates an interrupt that its guest
> has yet to deactivate.
>
> Increment EOIcount on EOIR only when EOImode is 0.
>
> Fixes: b3b48f529fe8 ("hw/intc/arm_gicv3: Implement ICV_ registers EOIR and IAR")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>
> Notes:
>     Tested with a local reproducer that runs a KVM guest in EOImode 1
>     under TCG, with more interrupts pending than list registers. Without
>     this patch the guest sees an interrupt deactivated before its DIR,
>     and with it the reproducer passes.
>
>  hw/intc/arm_gicv3_cpuif.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)



Applied to target-arm.next, thanks.

-- PMM

