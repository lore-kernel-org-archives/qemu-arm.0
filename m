Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp363699ejb;
        Fri, 8 Sep 2023 04:56:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrRrOVBMVXlU7MN0d4bJ9DyHlYFtexlIvV8O4AlEtY/csRYJoAaITn/q8ZW7cnoixGdRL+
X-Received: by 2002:a05:622a:60b:b0:40d:6ce7:7692 with SMTP id z11-20020a05622a060b00b0040d6ce77692mr2626928qta.52.1694174189705;
        Fri, 08 Sep 2023 04:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694174189; cv=none;
        d=google.com; s=arc-20160816;
        b=f1Dw/I8VYbLpdhpVsP2AIbS4hMgPx66ojZAakgM/QIc+lway/gEwXImu/8x7aWqMiQ
         KzS8yC61kNvrRVA/qfgyuIsL6Nl7S0xfmMs5dOodkbBYMG3ejXrQFO4sU1A3lm5cqEx2
         NVCvmeFx+9JO4842wQILVP0bE7yC8oZZ03EjsCdvnCGqEUNk1pZEjjwDbFfNBK6UCKfa
         9JfOeriM8GQZXk2t8l+P3LhaP5mOaeKeFZQmnlHCu7apDXECWvr+XcR4tCYmTqholg+s
         WH9SuX7cqRK54PP1IJkv2V1gDwTxwpq0zukVXk5ruzm+Edy/j5hYechkLiJqDOJIxxSM
         hulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gXRwAXi4DxtyH8oSQTskF3KGKFgoCA76W69oY7bLcYE=;
        fh=V4W40pxfZJYyQAzWJwhKQM/6uNal9YCQTJGLqnVS1W0=;
        b=rTHsbzHzENlFjLptkohSR1Fb86vtZc8gvxIgVbMgJNkvfu97s52SW4C10d7GOswSLV
         HAmLBOEWfs6DLXj4SK0yqa3xiRw+COjmvqGRo6xwaxIxSLBWd94KYmsMfqnR+Y6/DKdS
         p5FrAVj6YS6+N+qnEfZog0Apx+EmW/RrXXPA6e+AouNVWolYDIhRj+QrIaGfvWkEYyVe
         9Gr1ZglMQor/ciBQzOW/y75tXSPMBTcHPa0eUAScIH4OH9U3s59arLQf/+RnqVXNV/9c
         G8EoFrbgG72zXYlRu3FdI14a1hrwl7EXJ4BaNCwYLfa1v1AAZhuFkyKbarPaxFcVkMPG
         QNyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D3kZ41ys;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020a05622a100a00b004042849cfb3si1071044qte.262.2023.09.08.04.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 04:56:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D3kZ41ys;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qea5t-0000EL-FI; Fri, 08 Sep 2023 07:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qea5q-0000DJ-MM
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 07:56:10 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qea5m-0005eV-UC
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 07:56:10 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-52bcb8b199aso2684505a12.3
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694174165; x=1694778965; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gXRwAXi4DxtyH8oSQTskF3KGKFgoCA76W69oY7bLcYE=;
 b=D3kZ41ysn0RnQCoGdEP75kZ/LAbpwr2G7PuFZSBsTT6Gz7SmwCHq2Uz5ecjtWaJMHK
 QPQ5bSHOC/Kxnc+BHbNCoT5q6aOmlYA93Quc87/4XLsm0SKaUdYkHjvN+SvDvdGdcW3K
 qXeromN8CyolBHGm1V8ovF6xV5uuUePAhmW2f8xGhWJSnvGX1gIYmMj3rvGauGrXtXRh
 WYYWHs/SM1mwD3PwNV/nB/yWKty0d2LEnsgdWPLG4IbKUEWpHNXZY4DNE40X5CnuFfXR
 837A7+0Hq5uoAHJz8ycz9whXWsL+i3jKzUZiWbQ5PTnWPXdhyzrRNyDaFNT1sMlI+qkX
 /dGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694174165; x=1694778965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gXRwAXi4DxtyH8oSQTskF3KGKFgoCA76W69oY7bLcYE=;
 b=pu+Pfld5++dXznhBtH7cdz4+hfNXyJdmsxyGVZ9pVkYdz0h6UNULvIODDROKUor2Mi
 iBv6f/yYuXNfrm21Jnx3FJepJtxfBlFLTCgRiG3nom27NNsQWDRhr//lHQwmS1elBLjJ
 +T21JVjzmKMcje+dVM7mNJspTFSAs+EL6BS8Or1NXsvHGluherk0k6ogZZ9CZLLsij4Z
 OEgIqL3rpiW1IqPs/u4LVn+cIV3pz7VIN4DIifo+JXcb0AyMt8Bx/c9FhhGlFGfGAelW
 w19zbe5IKOCAw7k8NS1POQ2h6v+TxyVE3wmvl0dmxp8zXpaEhlRfiHp0tE6EFvqxgw66
 +YIQ==
X-Gm-Message-State: AOJu0Yyex/174dQ9cfK2LgX3DvhNHM1A6J+8PLjErXn2y41bQTwPcJtd
 HbOPtAm2rjJRGxvQHi/GsLwcXNVskHikNYqp2eEiRA==
X-Received: by 2002:a05:6402:29a:b0:523:3631:876c with SMTP id
 l26-20020a056402029a00b005233631876cmr1609025edv.18.1694174165146; Fri, 08
 Sep 2023 04:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230829232335.965414-1-richard.henderson@linaro.org>
In-Reply-To: <20230829232335.965414-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 12:55:53 +0100
Message-ID: <CAFEAcA9K6+c24rEORCF1vNav38kS5UBBVtSeC9T=DjV1_i0PDg@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] Implement Most ARMv8.3 Pointer Authentication
 Features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, aaron@os.amperecomputing.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IPrI0wU5Thvl

On Wed, 30 Aug 2023 at 00:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v5:
>   * Updates for review.
>   * Include linux-user ESR changes.
>
> Patch 10 is the only one without review.
>
>
> r~

Applied to target-arm.next. Thanks to both you and Aaron
for this work.

-- PMM
