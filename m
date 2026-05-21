Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4653CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:45:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ4dq-0003q5-5t; Thu, 21 May 2026 10:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4df-0003lb-4l
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:44:43 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4dd-0003CS-Ol
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:44:42 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-65c477a3278so6557101d50.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779374680; cv=none;
 d=google.com; s=arc-20240605;
 b=cgBLf665i5gLFZ+GqDV6pAWNoeiA1U0V99RaTFYprytY4epcFgjYiGwpdq6sStKmXj
 SIJg2NFNfeaXv67oad7uXhsJo21EuE9VHfzG4nlEkeGVIqLOEo2B9CKf2MCoaao6SBf2
 0apQMGL/hp0D6kMoe2syi32xIlG0/x4Vr5ZxjNWxmy3CRcmvix+ZPIFEAx8MEFCO+0FQ
 QG4rHCvdltKGPEK91eQjVux0BY6qZypcbzK9wkJaMLjQOw0Oj0sljJTMUpnSIfCVVVq4
 zGUTfeqlvPn2Ri+76KyBmv8UOumuUf3PtaYQA/F9VsS08DXr34ezO+CKjeZFfZfKpszj
 V8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+MOrE8Bqp6huGpTQFTl7kQZjUCovhfvU+1H4MuVqdlE=;
 fh=lDo+pnxeWCd7nKOONfgexqwKs6lcABHlUahagkKuDMU=;
 b=c+bt8QBpysLs65J7CEWF62VC54rD2fX7XZ4cAvimbLp2YHrUUA+a7/fNXs+zrl2CWs
 Wu+uI9rntg1e97jDLb35MxQVB+RIi297sxyNpYYCFtkFx62aTakWwyxS7ghUOdmKtwfs
 k0G8KYhgolVStVGD2juTe+/oypsVJKbVkrKHsafJ9n/codT+/VY4k/U2YIzhn7ulkadb
 fNfgQ2Ph8T4Pu3CEOaYOP2aoHAsdE84eEzDWTkadQbWTPbQIHC3tHep9b2bHQvD+IIZI
 g94DI91uS8pGAQ7SwFW2O3NXx+I1k6xW434xfh02s1UxTFAfmuFxCQSssNiCiLOQ0Vd9
 GsiQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779374680; x=1779979480; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+MOrE8Bqp6huGpTQFTl7kQZjUCovhfvU+1H4MuVqdlE=;
 b=yNvIzqK//zWmlsy1Jg6HvLYp3HCRc1azzP4wXctIRn2gEwzX/KeAAMzqp4q7W1Hr4s
 QKFahfW26EbIlwVHDTgRwIaPUkvnsSJGbxokv7mBO7cO6W6BtK4ctxosxXn1xNEkEGLK
 XLFPx6QorkanuZRHJwJdn68JZhITV5jNbWT+qrfORZ+i21+kYvJHR6mceW+BPqFZ2ntN
 wxSGj82bpxlv/gK+k1eo+UPY+7CnT2XcUB4ZSZ+17/vDUrpgUnC+dGaxmNcIrVTnaepw
 icp7m1Oi8Wu80gpifE1WQIQjsvBfli0MvoRe7EtYG8z3MUWCZgUifmDLeXKdJ3y34qWz
 q2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779374680; x=1779979480;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+MOrE8Bqp6huGpTQFTl7kQZjUCovhfvU+1H4MuVqdlE=;
 b=Bzd06LTlcn82W4GbzGNBhgoK2sJj2A/J9skhhQFwOB4tXscO4cFrlqhnl679SQJdim
 rCQ4qeCeyFxpijHB5fyYcl3+95vcoKT9ZJSUdz36bJFw5BcHMWyJT//dUi2ZuIyw4FqK
 Y59HxQkSVNtRuHTm1RfdZWz1pNLGG4D3SLYLkSvOk53/62ODo5DX8neC2Bv/l4aAIU2C
 z/1BDwDKC3gVOQTZQxPU6SMMsElaWZ3p1helf86sSi66BgPsaUJRfya2xAmZ22MZOd0l
 0Dr1KMLDmKiglxtn/G13f3dlfGxKEf3SGSgraoHhqML+4vId5Yah3JxrcsqhS51TdWrp
 Z+tw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Z2yPHl8Sqh9S5jFmB5RpFtDAJyyS+s+zqU7RMwoSua5a9qBl+7NVPx4DCzI/nM/qGXhamsTE8rA==@nongnu.org
X-Gm-Message-State: AOJu0YwTzQ/CxIQsOMLDTlHXAHuXj661hpSmlx2NOQQd2p2H+Xea4vJp
 2VI+Ly5UMh3PnDqa0Ti4nZ4+oOHYAeBseEKjj7xG0SlY3fA38ing9jO5DobJ4c971+Jhi7HIY5N
 xuXuUBm5q4LwVGGU1TZ/uBdk9Jhd/43kHhTjSrJ6Yog==
X-Gm-Gg: Acq92OFfGKjV1qX5M91bMuHsftt1wipkNqDv4B/CPDaudqRVAbRHanOzQk46LvPLkr2
 SJeTbTUHWQqXoUaLy2pt74frbMRzhVwF+S4uf6MBArwNShRWu3xBxD4J9N3+c6C1TtS5r3NZaNd
 yOJONIdm2ADTkEyhg2jk1YwGXMdeF60cLqx1go0nTukoKheqC5HpAh6imR67dhvnQN/ckqFso+B
 iLSUEKap5DwM8lrDz8J5Bz+tM04hgDMGIhqnw3zT49TFovrYOATeZyU9kAHskAdHMNcaIweXoDQ
 G9QRSnFAnnBVOKq/Qax+/XRcccjPsKKXQfB81fE6gD1MglWdgFiALiAzGdV2skwoUZY=
X-Received: by 2002:a05:690e:14c8:b0:65c:2ac8:ec3b with SMTP id
 956f58d0204a3-65eae04a179mr2655818d50.17.1779374680132; Thu, 21 May 2026
 07:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-18-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 15:44:27 +0100
X-Gm-Features: AVHnY4IUp7TcyI20WMiYWdaiaQFPQ_JS7RSvRxiZUj_Jj5lnQdZuqFBGgGIxTEY
Message-ID: <CAFEAcA-+49gaO-BiDFs8oNBj12+0MaBAiT6Z5Rq-HgMRMPmcSA@mail.gmail.com>
Subject: Re: [PATCH v6 17/64] target/arm: Implement ID_AA64FPFR0
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 20 May 2026 at 19:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h    |  9 +++++++++
>  target/arm/helper.c          | 13 +++++++++++--
>  target/arm/cpu-sysregs.h.inc |  1 +
>  3 files changed, 21 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

