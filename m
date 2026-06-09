Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988EECD6E79
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 09:24:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWshJ-0000OR-05; Tue, 09 Jun 2026 05:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWshF-0000Nn-Vm
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:24:34 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWshD-0001Qy-1l
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:24:32 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-66039d3efcbso5399280d50.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 02:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780997069; cv=none;
 d=google.com; s=arc-20240605;
 b=Wc5fwgYBizlEmPxq8wwb8mDzKglTAguZGgznOa7BXP6bGyCHJPBsvUIbi7UgOjH8aF
 PJFl+lFHx7UElxkebH9HPVyWYil0X9pQimPeaBPxvAYmXuHeiZnaxSpAkU29OEY6ackT
 wcQ8sO2lyPqoY3szkXPN0y8niZ7SgnikQqWsC/0SLcx0Isfj+gDbcIROPdWvJ7qiNGLV
 h4loz1D4+rztGUyoQmlhx48N5mAYpLJBc//ke7hNBwAg2v8GFb6fT92Dzb+22ZXMDqpJ
 kzPwl67oFKWbAjVQedu0xofdZ11i+6sZTyzO1yHEJ6HsW6MOmqhCM58xU/dvE8Yi+5U/
 IH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=s+0BfXHM21QnV4863C6uImYyGFFQDfVOWFUWijIqoLk=;
 fh=uHAM62EAaK5vWDELcWD8MymHV5eHWI6/yGoMX7Px7WU=;
 b=GBn54DNqA25p6FSjS8B6dGNaso/EWBmPzdEJkIQCkXfunq9oWo1v6TG5BeMrQpEtEC
 NPfpJrkE0R39VWn+dbZvh4fWT3XefuQcC7VYnUSvOnyQ/K148kRq/zEaaJ/B50VD6Icv
 tr9BSSU6J9Tt6pTcDqpLr8NQiGm6LtIqWzgwGo0/tPMoNBHZM6YwRn3andBJezCe2kDo
 FQ/BDInb79/23FSOqywbNB+F/lHyUyhBy/OE7AGEcTJO6EIWhJr63vmJtzgD7324yN1e
 HowNtANlrODtQ5Ix/63s8CBrjNHqrMk3/FrIwwM/qHFUxHZyvxMZ8JM+/yc4j5vXNcR5
 jWxA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780997069; x=1781601869; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s+0BfXHM21QnV4863C6uImYyGFFQDfVOWFUWijIqoLk=;
 b=ucHEjO5RpBsHo5ckYkOF9rCwamqNFB/kusGD9/pAbPJnzvuVXOLuScakq+mDxHUsfi
 BrUYjJBErhZR7PrLwHy7wN8ZqYMzTVWSUUT0RdF3cDsnWrZb+2qkEjYnSusRGLVveCwZ
 8GUrRRSTOmLo9LVZdYYzEKEGAC60GrbRVRhuZcMnQU8BEyR2seOwWyz/J38jqVY/HfLN
 1c5leXz+atiOwIILI7D1pf/JganKHZwVHY5FhT+76PrwAQVBJdhKXHRwt/qLimWlE94R
 0ZDsqwKCTQudPVIa4zBbjtfs5YE+hY148IDk7Alfe42MwrK+hEIfF8PrZEuEY5q7ZJIW
 WOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780997069; x=1781601869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+0BfXHM21QnV4863C6uImYyGFFQDfVOWFUWijIqoLk=;
 b=IPZpSOMWTJ6hL8zdIxSZR+OW2MIJ5XxBOj/p4SrtVnzvdnKx8Uh+LjxrjC+D/CfIty
 FWzzfiAR3RZQLIY4UL22MP9HHhFWd00CZhBGYuqj4aVvQLR1INITZDb5lpTPepC1HhH2
 a81qvcwEnynM9JFSedC7rfQYPArvhBp/V49bCt0znel0Q4L9kbgyvQcPttG+xfE/1z23
 pQpTW6XfnvTZiN5+PLvHU5yGIrmvfEtBaXqPb+a1mTbwjdPUJHgiBaoJ6s/0W8ItLZfR
 YE1NlghJXG2bsU9k2vSRlX2t5CPL/wDDxPCxQ8K8641fhrYEwKaxzcpD1FbW83iuy90l
 rUzA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9KF+7axL3M/YBSjsglagebAB94grY8Evq/KSl23UxRG5avlF6StFYO4oijZlbMxfp+ON60qVgPeA==@nongnu.org
X-Gm-Message-State: AOJu0YxpQ8r4i5CjV5PYeiIqu8nvQGXzqYT//5siAPuP2FJb2Elk54u5
 1bOHYfhborD3YR8eIzaE+UMvxo2J18Cqi6FuTDNFJJp17QphH1ubmD01L3UCJUunMvGHze/pq0w
 hhT4faDykU8Fu+29aUQWn24aJHqHd3KesGS7n/KExEA==
X-Gm-Gg: Acq92OH6hb5ftyX7rFljLulrod7ZxFHjKoU947vo4CbMd8EaEi6oZ9VTJ9uQuPuvdBa
 YZaSrfyL1DoH2/s8jCHIgnlkUP9yKHwUaOCx8AaDgMQQO15yG+uvIjbGOsyY+eWPHf9GqqA0jhj
 nNFEEyTdNAqioy3xRvJ0fH4TaFVfHRFku6sLYm3frJbJaEd/zbEdAgvzG063JMZBLdU2TY25y+c
 KpNZw3Gy7vr3cNVe4QZ+scY68Sj8WAph5TVJ2S5XAJ3uwIVwZlH669gyyEar98iMKMH/tt6Hy30
 gavHAP+nOnSmMFq50a2YOHPEwf9QTjqvgcu4c0Wl2wPGz1MNMCR9yYpXS9bXwCGcYAMDG0mkSkH
 AJQ==
X-Received: by 2002:a53:df87:0:b0:660:446b:7aad with SMTP id
 956f58d0204a3-66106fe57f8mr13338895d50.57.1780997068676; Tue, 09 Jun 2026
 02:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-23-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 10:24:17 +0100
X-Gm-Features: AVVi8Cd6sGxpi5dkdrZEQo85TMgWAk4dtx6bwD74Du4bvx96AFXH5vXU5Kl3WDk
Message-ID: <CAFEAcA_SLtJuVgeD5eD=XLS5pJn_iQYGRoegNc6w6vkpS5-BBQ@mail.gmail.com>
Subject: Re: [PATCH v9 22/45] target/arm: Implement LUTI2, LUTI4 for SVE
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

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

