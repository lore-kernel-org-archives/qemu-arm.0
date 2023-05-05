Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp371468ejq;
        Fri, 5 May 2023 05:16:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5TjkKYKyXxB+vXKwYkuKLrRHlXYj6eJnhSpLi8S+R71rd1ACn+ON4rg1PpMhNhqBBfDW3t
X-Received: by 2002:ac8:5856:0:b0:3ef:3d98:ce78 with SMTP id h22-20020ac85856000000b003ef3d98ce78mr1849836qth.66.1683288965680;
        Fri, 05 May 2023 05:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683288965; cv=none;
        d=google.com; s=arc-20160816;
        b=tCvhrcwDEF/3DXK2bOQF5JyZfa8CaGtY/h8AjcTHDrtb34Uw21A/tZ0SwjVI/xxZiM
         t6UbJcg8giaJEa7octUWfWCviJYDhxoLlwQ7nNYNlKQFrVEVcZ7WLo86ocmPaAvjNCjz
         YkiqBITSkCOuH+0ArVdY9bzCqVgeKG/sIUz3gR/WIXvYx6se9RBYkr1uvVXruXkqxbno
         VX/d/KDMivlzEx+gSLkrA/izX0sXDW16V3pL7PkgrocO82GhV58vUfue3S15nl7tCaTE
         updOwKeYQiuiPlbTGUPGU1BQTx12ObKeo6j4ysmIfucAFtYqfme5dPoWQBUjPpNs5XI0
         uiiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lO3eW3fZaLa0+rwzfl2C543xJ6D9lu8K8c+iPjNoRVM=;
        b=n0c+iew+bylZV/GiHfPMjSQjNrxfUlV8+fiOHYUmiRbMfQVNCuiQ2IxjoDPulHCc4n
         NAZg4IxN8BqQ7N8iAKW8c+MtSQFEp1g532gjLhkAC8M6XqEw77a13fdT027tkuCvjkqg
         nHCGYFuP5ifpG0ZtPDN1zTRvObKBgDBsyxzg7xsx/lUbXKiLgPZ/uRFwxS6m7HwB+uXK
         LpuSse8GeVEyC7oQIVZo1UI+fFgcj9M54flP2Y8EcjJbIofO2O1EQpEbnclyHqUGY3sy
         6D0ySILCSJfc2D/92+YrthI1SPuO6L3vXpyd/yj5BR2kDBZaD4ZTe5HEQHvW7G1h6x9e
         1mmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSr7gm6L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a05620a06cf00b0074de71f36c2si610211qky.569.2023.05.05.05.16.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:16:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSr7gm6L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuLh-00082x-VU; Fri, 05 May 2023 08:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuLf-0007uu-OQ
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:15:43 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuLb-0007u8-BL
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:15:43 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so3043234a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288937; x=1685880937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lO3eW3fZaLa0+rwzfl2C543xJ6D9lu8K8c+iPjNoRVM=;
 b=BSr7gm6LMYphEseQIwyCeggFciVQedUb13wAHIamWju5kbbWmqFDUI6rPQj8mf4zhy
 yk1Nc0iZAYYv6qJv/44p0GxjeCW2usjWMC+a51Y3JMc0585UeuBwqxDeP0IJz1KqAsub
 w+ogk5sBc8qU8UgS1LlVFi2DVJrnYclcMLrZwrAYpfCOHAPSZDIE2BOEompjEdPHEb/B
 SEQcfLgYZRS39r7SJKFLyvv97wAF+SxSvCGGR2shsnLWV/zWsOtMydFQk04skdbV6oAI
 Z1Sx/XmqlzhZtTUYPaGu7MkrpFcAEHTYvVd6O+cWrDckVPEa2KfvRrF8KmmX2Nfx5V+X
 t+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288937; x=1685880937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lO3eW3fZaLa0+rwzfl2C543xJ6D9lu8K8c+iPjNoRVM=;
 b=TpGNU9/o8R7wb10o5xZ0ExPars4Z8sY7m1UY+ocSn1Jwp59voDgHZsN+/9wLBvp5qY
 4JgIkXh0EMHH8QKkZdD2PVIk8Poc5IjDGPk/5OEoz1o7yQkupRujx0OaBIDttk+h+/i9
 luSKMaLzbg5LLAcYn262v+ILa067Qu0X621XcAhXQbaNdAAjRZCjAIaUPpUUqgS37qie
 01yPO0QGhwg9hH0fmBKM1KkdeJpKPIxu6yy2Gm4uanWj5okdri86srhmx4L/BY7aGC2V
 mz1rsmJldeVh0+Q5o5me/DmRKL7VBP/mXzDVIiqksuMDK4DFSAwyAeWAPTKmBybhQr4x
 14pQ==
X-Gm-Message-State: AC+VfDweIBW2ofb65Mmt+Ny20tFvyZ9sWHnffq3p0GwJ8meBZlPtcHH9
 EpMd3JZZ7eP4kQSydXO/tPQYSLeZsZUnCZoBFBAk7A==
X-Received: by 2002:a05:6402:3456:b0:50c:cde7:285b with SMTP id
 l22-20020a056402345600b0050ccde7285bmr1370834edc.29.1683288937699; Fri, 05
 May 2023 05:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-28-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:15:26 +0100
Message-ID: <CAFEAcA_t-1-ue7PSKd3oXBD04wnYHJu869RRc1J3XuP+40-bmg@mail.gmail.com>
Subject: Re: [PATCH v4 27/57] tcg/arm: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: V07qpIEn4evX

On Wed, 3 May 2023 at 08:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
