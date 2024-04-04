Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp296452eju;
        Thu, 4 Apr 2024 07:28:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAuKnnIRUYikC7Ai0jCyyMajGdIWU03aM4eF2MOUxpOn2jhUmSxCr85Hqba6/LVVtQQIFNdqWfs252rUqfk8ID/jGRKELe
X-Google-Smtp-Source: AGHT+IHM7KzJ1ciBHh76p6DTW85zDsIClkcMU75hVZkkN9Mn7nEAmqSmi+Sk2zTtOIyLsB4Lfmnx
X-Received: by 2002:ac8:5b8a:0:b0:432:b6d4:2cad with SMTP id a10-20020ac85b8a000000b00432b6d42cadmr2693855qta.14.1712240882189;
        Thu, 04 Apr 2024 07:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712240882; cv=none;
        d=google.com; s=arc-20160816;
        b=isdyxkE++ggY+nxFLVMrR0K/NEcmpLNz60ewnZXAuWWeBsx+4fcofaaBDr9yhfpOFe
         bF6kezB9m6FrPeug1KPKNXWskeotsoZdSyByI0Qkb+52keHOdoQEECDAXltwMWlKVL5s
         KHQ4VPa0eekKjXwMLUNMILEYoyu1/yO0E/USxHQLqyQM5BAz/gGf8Z+5JlI7WF9C+HcG
         OpAOrI3A1W+/bTwMmTLaUB9Llq8JrSjhaEFIRGFDDfnrWb/xGqsWYmbRtQWKu+13+90R
         DuA0ef8LFZIDo4WE3ez46ek4NZgXT1sgZTWYQAjT6W/kwMj1WJzOwsuGB+EAl693Ddlg
         dRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZNmD2zvccXxBiRyDCZ5QsCEdO6xkpxPE/hEP78GGnt8=;
        fh=Y5lrYJP1Ad4VsJalarMUZ8X5CzVy67qj5Wcb7ia2IxI=;
        b=srg8C4G8WdxdEyTCfHyKzCfamnNqOAiv/t09W5NPoYJgt11cCgryYPQveQBaH4qY/K
         8mcicy0BCyFr0efyIyJHCHFYx9kRXhkvMqA7EfMvqVOr19OrLseZHKYmR3mrcgbZ+FDa
         /QdBpwYRxJFMIUBFQJiMDPuU9irEawZhiJYnMM0YcVomYKeFhpBtDaNr9fKILF+WbIAr
         xbzUTEg5WYPK6x7yrYdT6VG4CY+cmOCoWhXIZIiJx+cQvDdCf+cj8SDs1hFJNB+8N+hj
         VCWaDGiaJDZPiHOj49/es9km0wxQFuuoOmc9nbQTdk9haeTqff3ZcEQ8QJbaSXWYWZa/
         LVTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="frJcs/3i";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4-20020ac85c84000000b004343a39b59esi5707406qta.15.2024.04.04.07.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Apr 2024 07:28:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="frJcs/3i";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rsO3y-0008A2-SE; Thu, 04 Apr 2024 10:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsO3w-0007qN-7U
 for qemu-devel@nongnu.org; Thu, 04 Apr 2024 10:27:32 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rsO3u-0006DF-J5
 for qemu-devel@nongnu.org; Thu, 04 Apr 2024 10:27:31 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56e2ac1c16aso10129a12.0
 for <qemu-devel@nongnu.org>; Thu, 04 Apr 2024 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712240849; x=1712845649; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZNmD2zvccXxBiRyDCZ5QsCEdO6xkpxPE/hEP78GGnt8=;
 b=frJcs/3ia6Opx6xc1m7OG8E2g4XHlpWAcjjgCAR968MXvYxrYu0BkOqteFN6JO3nTL
 TxsydO3/W1YXsq1oILPyg2eAVm9rJcQBvfR+QMFWgy1DSRorh17HGfzglPqNx40vhu/l
 mnbA8R4vw2Hj3pAvYMUHG72M4XVpRcxnu8kw6Cb7TKTxddsIhhuRqxtCjPWCz+WBuOCV
 R0/wwRtD0yev5guq/ixPcC+skrw7tzF3hepx2j3DKetdiOYpR0QXYBkuue277ph3kZcd
 yI4rXuy7+ytooqEawxNhVcGtH1FQcdAR+auoc8ncGzp91UxZpEScLXwn8IJ76bpMifOD
 RHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712240849; x=1712845649;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZNmD2zvccXxBiRyDCZ5QsCEdO6xkpxPE/hEP78GGnt8=;
 b=mx6MEZkmt/yHFiSkJDm51R5I3Y77QInu4iH8IZ/n6YfFTDj5akRfm2hDEvi1Q3SlsH
 tmlzThkPBXvPwWGU/pJH/o2aG0YCBPHj3fI0nAnXYuYlTjiBE2Kkt31wVkQ4Rpv0RHhV
 HUt+SC8IB9AlGKSidwV+UNjMCvo8FFtWw1kxbgt6EwIcQS1u0z9+ZhCcfMVeQ3mmbMog
 veqATNp5B57rCrA+9EALJyXG/4pS1fwZEKCESTHcny+J+UK7yWMolv9E7KJiaFwelijL
 pV8nEyLqdFWoHCHbxcTO6017TlSNoquJ+1QB0SEXDyF2heP2OqkSmSb6MkcuAT3VeNo7
 5SHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGyAsHhW8GxAqhfsNaggA6W4yYjBE8DdtnaDKxklb+bqapvN0KfPpkTz2wLgmPCnQ9AK1emLsy8N2XA35Q92dY4hjcwhA=
X-Gm-Message-State: AOJu0YwG2poOo9b4gwYrDqODE0RuX7sXASWdZRoORWCDivPe6k+ishYs
 m8Lmx4Nrct1WbpttB388PsGtRIrsXsGLJxB2blpJuk3zoPNDYuynxWJYvACB+4BJypq7XftYdBT
 UGVoGTDCievu1/rLyd8c8O8gTVOIDkzJb+qKFvg==
X-Received: by 2002:a50:d7d4:0:b0:56e:bad:36b with SMTP id
 m20-20020a50d7d4000000b0056e0bad036bmr1157566edj.21.1712240848773; 
 Thu, 04 Apr 2024 07:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
 <20240403101611.3204086-19-ruanjinjie@huawei.com>
In-Reply-To: <20240403101611.3204086-19-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Apr 2024 15:27:18 +0100
Message-ID: <CAFEAcA8v8guoP37xO81jGRpydbriSjgow0MBv+OnDGjZ52+Tww@mail.gmail.com>
Subject: Re: [PATCH v12 18/23] hw/intc/arm_gicv3: Handle icv_nmiar1_read() for
 icc_nmiar1_read()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: X2c0fiq27ibU

On Wed, 3 Apr 2024 at 11:18, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Implement icv_nmiar1_read() for icc_nmiar1_read(), so add definition for
> ICH_LR_EL2.NMI and ICH_AP1R_EL2.NMI bit.
>
> If FEAT_GICv3_NMI is supported, ich_ap_write() should consider ICV_AP1R_EL1.NMI
> bit. In icv_activate_irq() and icv_eoir_write(), the ICV_AP1R_EL1.NMI bit
> should be set or clear according to the Non-maskable property. And the RPR
> priority should also update the NMI bit according to the APR priority NMI bit.
>
> By the way, add gicv3_icv_nmiar1_read trace event.
>
> If the hpp irq is a NMI, the icv iar read should return 1022 and trap for
> NMI again
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -301,10 +310,11 @@ static bool icv_hppi_can_preempt(GICv3CPUState *cs, uint64_t lr)
>       */
>
>      prio = ich_lr_prio(lr);
> +    is_nmi = lr & ICH_LR_EL2_NMI;

If you want to be able to skip the cs->gic->nmi_support check here
then you need to enforce in ich_lr_write() that the guest cannot
write a 1 to the ICH_LR_EL2_NMI bit when the GIC doesn't implement NMIs.

@@ -2833,6 +2833,10 @@ static void ich_lr_write(CPUARMState *env,
const ARMCPRegInfo *ri,
                           8 - cs->vpribits, 0);
     }

+    if (!cs->gic->nmi_support) {
+        value &= ~ICH_LR_EL2_NMI;
+    }
+
     cs->ich_lr_el2[regno] = value;
     gicv3_cpuif_virt_update(cs);
 }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
