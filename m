Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5480AC5DF66
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 15:34:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvzLr-00041N-MV; Mon, 17 Aug 2026 11:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzL4-0003ue-BM
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:33:35 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzKz-0006l0-Nm
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:33:23 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-80c5cb9a888so35639517b3.3
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 08:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786980799; cv=none;
 d=google.com; s=arc-20260327;
 b=RzTNg52HoqQylIYEu89HRtuFidlXZ73G4Vm/J+R38at108eaTu9Cm8JM9UxT+1zm0A
 pFPk3RLnP/OzcwRVkuPVw5dS2w8afOpKeEKJoJmfADeWFhgiKvvkj3ek/xIFqngCiBre
 TdM36dt4cUEund0vFKnEXVsguz+O4JSSg6+8IZ0AJi9HSs16CJDiIOeuDq2qAmHFWe91
 Y1d5Dpb/Yn6qmkHyFvFVm2mKTBZUMpTSocFPEY+awKOfKXBOS0ab+QKkDGGPuh1Vqftt
 KL8F/LPRZSSYvx+vv0k/cIsgLIdel+poFlCzZiYipvHxnqmMcEWJRXb7JZjVMxj8sCE7
 TvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NxH6oyYY+k5lJ15VPzhTEZOvl9bnMRPFJEcRFyU1beE=;
 fh=i7hKPvRKCYugg6/igKwML6O9JZv+5RYbVEaXW6KPhYg=;
 b=F1p7Z2rLtwGW+eRUgVDQXe0aUQmv+DVkbWwYqkEDWveVWNJ9OIFYtDLVNmhfp8Z/B7
 sjTm3z+j2W64csraCDg9MIr56hvAo0YhGM4m+jucDTDG/66ZiiRV960auEbMFkjsiPJz
 n0RnDLKWovBcd72d09QSx+MMNu6oEwybLYdDiVk8ir5dt7zTtLBdHb8GXnVTxao9F5zT
 mr3rVsGDII5Jmw6bO3T7TNPdU9SlN9ffsmZsRUYCK9y83+lu40E2gs5I7wNEnGdVUE7P
 /S9gTARINODnd6+VWbcL3e81lZP4MteH2AbdySQN3Qm35SbyhXypExJizDSZY1q8Cx/y
 suBQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786980799; x=1787585599; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NxH6oyYY+k5lJ15VPzhTEZOvl9bnMRPFJEcRFyU1beE=;
 b=hGuFA3ISU7lbhIF329rflqHeSyPJt0Jx2xeSXFSHPZDCfYCGMQw+SQTNnyrtc8BaF/
 sAiC8Exa5V0YcvpwnmHZ+JBqqjLHHY+sFaSHpbOff+opjY9s7XjzR9v6AObjszoFqbLf
 Nin5jfVlURuFXU0ihMEZBEZipbHeUciVwRSqzLyKgDiBPW8wuRO7C1cl72bvP9stEjMz
 mH5q7+VkTTy10FQFX5InFlR5diOuynOgPogppZHOTKzs8k7Zw+Nxf3Jr+KH0t7VboVag
 eI2l/kBdt8s4LxA/XcNDx7drIn31pGMVcPg+vHUxV99211a0I4vK5/fK7h0FRq1H9FlK
 SLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786980799; x=1787585599;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=NxH6oyYY+k5lJ15VPzhTEZOvl9bnMRPFJEcRFyU1beE=;
 b=N1Tnd7yoK2tMaFqSXBlDboM0k0rYp5WRVHdDoEpUlRG3SQngOWRpn6zvugMA+66ZqH
 cVQoIHMX/cmCi92tTJUYx5pTvNY1s/4za+lT6XuJ5ZahZxttbdh4c4Pw98nz9t4d50W6
 tBi5QRb4qIMA1sowDF0WqAttEg7hawnALRXC198GdRiNquYilA/Z7osFM8LRKuHYMArt
 b9Q5jItNePBbnOgWvYab8ZPraXwJmOXzmrUgqsMnHqLZon+7UT9cNukYscwaQXKSJ3Be
 9SWhrkEiS7xfHL1fZY8jSs2PXd4LlS3JmI3hFfvEsOZYTuM6Wx4dL99Fxye/abcVlAxA
 jQnw==
X-Forwarded-Encrypted: i=1;
 AHgh+RosFqg+GH7od1GdOPuxsmZZxL3I2lwt4/IrQeKpdBEOe/kRH+oX3O4Eku/hF3JOT28kKDNBsIFp3w==@nongnu.org
X-Gm-Message-State: AOJu0YxWhADGVD14czvtOdGicxBBaEGLhFaZhEsvOTKlbBUARXhjK2u+
 UnkmE+U0b7xqbGXoRJNLPsOJzdZpER6XFHRP509bs0reR8U/F69xItnWb9GZUn+FklFscwPMYlZ
 vlvIsHspu9GL/gCk+vYJNFMoVafjyQ68vxMhwTAnJDQ==
X-Gm-Gg: AR+sD13pG4E42vXgGot+r7tlq93cCTh5j4r51W4hsFbe7GL/C2Bsf071JNDVYwxzI/o
 Y/3gp/fbK1jWAiOvInjsgkTw+P1BB+iDv9wqnVwKSncJ8wIZDXntBkb+gDK5D84VWCiBSk7PtB/
 n1yMiCtw/cV8XoV69ibhmzNmbrPBb8deWJtX/redhA68nzIu9Tz6IW8ohpA/OEzTEdO2XFRtZzo
 yd/MAbj2rsudBpgYmyXtERZHC6lM44Vl+ellG0LvMRMY/UDvl04cp2189sUtPjWt+jhZD/JplzV
 Fy3qF3PnxXaSSS/LBNVhlEgpRl6vOFqxAwimOPDPoA6FYvjmfXrIt0JBguX/FpPGI9tR/s9BDxm
 wsuefV2u9oFm6i8rrb+hb2a+AC6Gw9fIcL1ivF3g=
X-Received: by 2002:a05:690c:ec4:b0:81e:45a6:bd4c with SMTP id
 00721157ae682-8412dfcf07emr6011667b3.14.1786980799125; Mon, 17 Aug 2026
 08:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260805153005.9989-1-simonxhy0404@gmail.com>
 <20260805153005.9989-5-simonxhy0404@gmail.com>
In-Reply-To: <20260805153005.9989-5-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 16:33:07 +0100
X-Gm-Features: AcwNN1V7_g6oRvjhn1fOm_TzQMiHpKgfB4FTj40y1hIKox7Huo-cc7irdfJvNxI
Message-ID: <CAFEAcA_4jeeExEABxjp8gFYQi_d2T8nDVn5fBUXwCTFtE3p=vw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] hw/misc/iotkit-secctl.c: fix AHB secure read
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Wed, 5 Aug 2026 at 16:30, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Fix AHB secure privilege to read AHB instead of APB.
>
> Fixes: b3717c23e1c0 ("hw/misc/iotkit-secctl: Add handling for PPCs")
> Reviewed-by: Owen Giles <owen.giles@hpe.com>
> Reviewed-by: Robert Elliott <elliott@hpe.com>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> ---
> v1 -> v2
>         Noticed this bug in the secure read function
> ---
>  hw/misc/iotkit-secctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

As this is a bugfix I've applied it to target-arm.next.

thanks
-- PMM

