Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp4568479lfh;
        Wed, 1 Jun 2022 17:37:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkJjAI9/Egw4VBu01Dca+RQAXptl2Ka9fJMaIi0K/4794/etAcmoG+sE4tTqsqRqwjj4Qw
X-Received: by 2002:a05:622a:13cd:b0:304:bf8a:b6ba with SMTP id p13-20020a05622a13cd00b00304bf8ab6bamr2008942qtk.125.1654130247610;
        Wed, 01 Jun 2022 17:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654130247; cv=none;
        d=google.com; s=arc-20160816;
        b=N/t7+iEhK6ZWaestTEJerQjaN3B91CxdG4CTGU0K/0VmzsWxiCy2z3LQbotqZURlEM
         df12UNsEhRMo4L2Q6dTyIF9ifXkSjkAzFhtR27TnE2X6AOJXGq7E8Cd2KuyROhBwfILk
         5t+xCXnGCEEW4U4KTFMGXCr4Fv3zNOrscJQyejHz3v24g6vE3GPZaPY/CQOOutWR0fK5
         MNS53fyICm5/6R2Z5PMbX9oB+tolrxZybIiqI57RJLQprpMyz9XPHnoJFnxXNnsImWyG
         nqAgVKMIVOOLdQj/vr5NLrCagkfIhm5jPsJRn7mjI02ApPTTmCHL0Fx/V6PQOlAHWNNN
         xP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XdrfdHxaWmx9gsIN6gbPRflPZPVQ08Xrb0jXEispltE=;
        b=kB7AxqkWhqBvpDrTajuMrPy8415YE++LYXWjwLqSjZ0zbo46/6/gD4SdW9zvgVheLS
         e1+xp3vY7Eo1A8MvKpdmq0SmKNt9OHOaBEE/G9I6Ywi88dmZ9v2qhpvjO6vSlvZhmXod
         UZe4nu3cy55056i/rVH6JCiXFaHyr1DsfZtp/Dr8ZVQfEcXEP3uL9pkL6X13HhS9S8uE
         BzQiuaVAKyOzLp/XHub3PwrmNE1/XZSlu408TEpYIL1oWIGXy6/8eZ+vouhp/kTxjThh
         AvzZ6sHPTMGsl6Z2kBms4MMFAhxSsQXFhJgAr7LuiOy5CGfP7aUV87hpA2GbUEXWry/U
         vxYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AE+nOJlb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020ac85841000000b00304cbdae97fsi897240qth.658.2022.06.01.17.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jun 2022 17:37:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AE+nOJlb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwYq7-0003x0-3q
	for alex.bennee@linaro.org; Wed, 01 Jun 2022 20:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwYpH-0003vZ-0h; Wed, 01 Jun 2022 20:36:35 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:39921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwYpF-00047y-J0; Wed, 01 Jun 2022 20:36:34 -0400
Received: by mail-oi1-x22b.google.com with SMTP id y131so4759328oia.6;
 Wed, 01 Jun 2022 17:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XdrfdHxaWmx9gsIN6gbPRflPZPVQ08Xrb0jXEispltE=;
 b=AE+nOJlblaJS8PgPgYZlqDaDVpdncUptCJEXs5IPqGzVkOdN0BbDvv+8HBIwUOE1O3
 X/Ma6i64ZOJBHom0r+jZIEQn1s6WeXc70odQFp9JHXT4+2ObBTc6lo457u4/xO8YiziE
 cjvvZPJkHrU5Unb7LDcayAvAw9XhAWJk0GWlh1cTCiJmlZkLSGH2+faP6DXQugiDgvVO
 2mg7kfC+ejn804tBUKHI1TgL7iDQ15S/5lTuq3x2DjtYkJA9WcHqq0wgCBsiVuQ73CfA
 iTAQ863J4yie9h0Io+69YKx867/TFPpnIQIKqML5e7RqvUhe6uA0zb6xQdi/eaMBUDEH
 J8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XdrfdHxaWmx9gsIN6gbPRflPZPVQ08Xrb0jXEispltE=;
 b=S5wZHBbnT/76s5xDUdaxBttTsFHfLIS+dG8c8ApmyktoTUCI7xz5M223rznpLYYUDA
 KJD1fYHch1RezcqbWKC+Bq7jy0DbJJgWLmlP3PYN151wOfUVbo3t/vLuaIgJlfucXzlN
 RpsnqcxIJjdyp8u0V9yyI7aIwYcK6IubYapyGIL7xzPMls/iFRPVW4+l6D6PQr2Kx0qL
 k31393/XEuoGRSBYG4EfT8b/pLzV6FDFCPPg1maPdBU0+pyJoxPRzumXBgz6gh5nhZDI
 CTU99Ue6cPIB/mSxr7ZLJZSOE1MWx1elvXDUMZONA5KLFbTaWnaEiGr+delOFwt1hovY
 obkg==
X-Gm-Message-State: AOAM532e58Uc+Eddnp0EM6MUmjvcnCDsWHMZ5ri5WNGpVGH8SRQCXQvZ
 EGzNvT42uaASnqzC8TND5eqZ4lZww55VzoPDvNs=
X-Received: by 2002:a05:6808:19a6:b0:32b:90c4:d1af with SMTP id
 bj38-20020a05680819a600b0032b90c4d1afmr17086632oib.64.1654130189184; Wed, 01
 Jun 2022 17:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220601172353.3220232-1-fkonrad@xilinx.com>
 <20220601172353.3220232-4-fkonrad@xilinx.com>
In-Reply-To: <20220601172353.3220232-4-fkonrad@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jun 2022 10:36:03 +1000
Message-ID: <CAKmqyKNDSbMFziFs8_Z1vpJGyAtc6g+cFHyXGv1GE7guHfaKDQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] xlnx_dp: Fix the interrupt disable logic
To: frederic.konrad@xilinx.com
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Sai Pavan Boddu <saipava@xilinx.com>,
 Edgar Iglesias <edgari@xilinx.com>, fkonrad@amd.com, 
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ROlFsM3QciyB

On Thu, Jun 2, 2022 at 3:32 AM <frederic.konrad@xilinx.com> wrote:
>
> From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>
> Fix interrupt disable logic. Mask value 1 indicates that interrupts are
> disabled.
>
> Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/xlnx_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index d0bea512bd..eed705219e 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -889,7 +889,7 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
>          xlnx_dp_update_irq(s);
>          break;
>      case DP_INT_DS:
> -        s->core_registers[DP_INT_MASK] |= ~value;
> +        s->core_registers[DP_INT_MASK] |= value;
>          xlnx_dp_update_irq(s);
>          break;
>      default:
> --
> 2.25.1
>
>
