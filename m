Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F508606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AGhIU49j
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMQ3o-0003uM-02; Thu, 29 Oct 2026 09:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMQ2o-00038v-V0
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 09:19:55 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMQ2n-0007OQ-Bw
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 09:19:50 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8b0f59a5fdeso20324447b3.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 06:19:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793279988; cv=none;
 d=google.com; s=arc-20260327;
 b=DlZKfyBi7rWTB/IMKh8NB6M4gHAPhHipIxc0PrH1hapZ0UOp4lQVWLUsYMV3H8Zpof
 unZUHtidWyxFeKiblPVGVS2FllF+7cWQ/UrDnGOgcVGWLyWRNn0mSZEifiz61owpJnq6
 ze/PVwAAe2XFJKaYb9b+5qKrDk5aS2lORmAOEwvpR9QS/WQbvbKvGgsT9yeEz0x2EJMj
 Ng7/9JshHozApjw8x67+rSeC2lLvLsZT51+G2C49e/ZSmNnrHiZbbi3ZITsvOGnoxRrX
 AWr+a+OtW9RO+X+i3V/jy1/TciNjidsg9LLh1AzT+nFixkmsEgYqBHQsCMT7i56cJSVc
 1zLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=A+Eq13IeGP0aNcY+C3RUDzkkzntQ9i36YlHtS3VUWNA=;
 fh=7cOosMH6ocGBhXYBTRPX8WVRUSwsA12N/0LPnSQaDMY=;
 b=hSN/BgcQpWJyeZLrIc+mUzp/lWlHe2vfzNcPZBd45BReCBsRNsrsFw/1mdiQie9pe0
 RHiXLG3hzX5MdvngbJY714XJyr/9Hw1CD6e16BQbE5NUE23pT0Fmz+zB2p7JcKbu8EB6
 R60nbrl7metBU6hgIaGVnAFU+QdYQE8m0Yx08XSoVpHphR+YzZYibdbeP3qZvUl2O1iJ
 8iauzJzS2uG2MutyG2dGZ36Sk/YdJKz/pNTFUBIURYYYQZveFPRDarbLfiJs5LEe+WW/
 avxsDRqqhkz0AWEzcIMpsgqjUUpRxFqY5h29fH8VGDUrAsS8mLX+UEPlQpMhHLGzLxes
 Ld9w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793279988; x=1793884788; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=A+Eq13IeGP0aNcY+C3RUDzkkzntQ9i36YlHtS3VUWNA=;
 b=AGhIU49jvrwtGZRFJZMqcpp8AqVzWOJNmwSIDfRDQXL4rQu0/8GDE6WFy0y2J4NscF
 MsJ+Zq/LoUAT8XgJ3iOTfeMJNWJ90XfWfQZrqEsMOiMdEDyuFxd6SQOxB0smQRArGOWN
 YM4uJIrVCs/roR/a77q7GpnvB5ZOXMuXNjqvBfag1r2XTmdYufnd7eHw5cpH6xnYt2rd
 mUvkn2/OZ+PB2BfHY+kzc3aOEn2kp+WbzfpwyR58OEyPtUpUEgyQB9uO61gDvT8lsoJv
 vTbMAMzXvONPJebH0YcPPlAy4k+o8JTGx5L7pK0I+c5c/eYjdaehK55mFzlNYGSguPUd
 iGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793279988; x=1793884788;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=A+Eq13IeGP0aNcY+C3RUDzkkzntQ9i36YlHtS3VUWNA=;
 b=fmSk8+f9ZNn3lbnc/StBfBoOqMHvqr9asm5MAipBtv61Aa3akrKI15cue44iDSrpLF
 GHoz+vxc+maY5yjwE5u2ETzAWpxs5yoMEvUx4R0CIwtWuxNdKfrZwiwLBebljnKFLBQI
 XGV13MgDLUcKu7YwuzxmxwvusqLusF597Dkeuixe6gqFqY/iBca+tZ0y/gD4smX3b4bi
 7C1McCqo7+qOQaLELWQI3JU8toDE9YK3bNPLz/Q7i7DUDrF59Hu4NjQ/aeBTSKz0uSgL
 cW4WdJ6bMmPtbFUpEjagueaxahu5XRYc/u6bZvYTa60+oSkkXXMCKyz4K1yqGJKitFrJ
 H/nQ==
X-Gm-Message-State: AFq9FYLgI5O/aPYD/ZmrRIad6HsIy3HLp1zJREhK4NBLCiGPVbKFn5To
 J+Q/XC1+U093nuxpMqLDFQ9D9SkEI59wZUcz7hXTfqAfZWtSG3OcGn8BoiauEIq4XZyM6WpwyGv
 PP/LFxWqTio92mMLnH+Sbg7h4VmczjVmGkVafP4S9ermkmRa1S3oJi9U=
X-Gm-Gg: AYBFou1wfPD1bH9arwdrsEqGRls0uvjabdF75BOaXjPFmsf5IlcYIFOTrFvbUpK2waF
 l8o3iCliM4tOwozMhKcFKdXUZhe5sWw7dWRH+FPkLOx7NWsXkPKG5wW8bJqXt3Un4Xfv8zlAnQR
 tY9iX2KqqroQcCccyR6wBtwXVColoa4RfPf5PPJOqUu1jofbRsqY5wnYqvOVUoxWk5GZN4ku48W
 h2oZMpnpgJrP3cjhQKtLLbKkdF9iFSV9fCVOrpcw/c6mBjkIhBFnRszhTUzqm6At4o1QOrilJ0A
 5Fig6uquCzaVTcX6CghyxCs3CaenlRzG9H6KttPD6/MDvz/R3v8gOtAqIWYmEOnNgzFTowLNHZ1
 GpmUy3SpjQtuMAk5ZG1yNDjpgEEFJfQ1z8PjbtNmh/9sPrG2qCNO7V0jZPejh21YhD6blEI76Jb
 cBqdwyP0dCq1yxhPMwWjRUL0x83zcfejL1uJZ42629jQ==
X-Received: by 2002:a05:690c:ec9:b0:8a8:7fda:15ee with SMTP id
 00721157ae682-8b1b5d04153mr38970777b3.50.1793279988027; Thu, 29 Oct 2026
 06:19:48 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261025110857.1973128-1-peter.maydell@linaro.org>
In-Reply-To: <20261025110857.1973128-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 13:19:36 +0000
X-Gm-Features: AclHuK-44kUA95_tql0SGvMdMFiGnbyomi6aZU5ansareu_HvyBkKtM-owyIMEM
Message-ID: <CAFEAcA98yOpsZZbSOBad0f-W8gzx+_0x2cTTMhcQhbijqpHdyg@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/xlnx_dpdma: Don't allow DMA off end of host buffers
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 25 Oct 2026 at 11:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The xlnx_dpdma DMA engine allows the guest to do DMA to host buffers
> for audio and graphics data.  These buffers are set up by the xlnx_dp
> device, which calls xlnx_dpdma_set_host_data_location() to tell the
> DMA engine where they are.  However, this API doesn't provide any way
> to say how big the host buffers are, and the DMA engine does not
> check whether the guest is trying to write off the end of the buffer.
>
> Add a length argument to xlnx_dpdma_set_host_data_location(), and
> bounds check the guest's DMA writes against it.  The DPDMA ISR has
> bits for each channel for "descriptor payload is too large", so we
> report such overflows there.
>
> Cc: qemu-stable@nongnu.org
> Fixes: d3c6369a96a8 ("introduce xlnx-dpdma")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4134
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM

