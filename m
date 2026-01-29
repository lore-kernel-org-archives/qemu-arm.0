Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11598D6B06C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 15:31:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlTzi-0003S4-BB; Thu, 29 Jan 2026 10:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlTzZ-0003Fb-8b
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 10:31:33 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlTzX-0006fQ-PR
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 10:31:33 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-79472374371so7505707b3.0
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 07:31:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769700690; cv=none;
 d=google.com; s=arc-20240605;
 b=J9flzUmAip/F+AXG0dbdrrVCxvLfDMSBmyPn53hPozl/0XGfkoiU2PqCdp6Pyv5l1a
 wS35fwdArQf0Xv7KZaVHluAIt5rLREzu76GvyFgw5cBm6ntAys1gI+qKxtyid8lgmnml
 oVyPT2McQfQUcH3vdLaZ4eSx+82kF+v1dLm+KVzyYntb3nY7Cd2kFG1nMbo16a9spFJm
 oQXNVYGAmZA8gapySDWvcXyWYSazFVuUsOAo3JBINaXqxq6sOXMQyizv1o59Kf4LVyB8
 OZE4HT/dEoPph0BsMVjP5OTYzM9u0P0oPX0ffS5TM3Jha7uxPW0ITObTPSPnu9tdMIYz
 9xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=e75Fsiedu5+aeIo3TbRJepvWQBvQru25HrO6tbDPk6o=;
 fh=hrQIIeK8qNjdDRC/8Hgh5VQwq7KNb3VrNRdOBASwPEQ=;
 b=XpoxgBLFoCiVXmdHkMFmwVYIvGwSOoJxWTvaMemzwKe8zUmP4i5wJnxhpRGWdgebam
 RV/4XRMGUjIdtQU60lGe7dAh6plKN+TL5dD/klXwKtJIaEHL+MOzK7E4zHOaBP3vF5ym
 RzhuyPAIzye3l5SGeMZy/89a3NhwQWK/JoltYOHqLRjOiN3m58SVbM1Fnx9vFYWFvfAI
 iF8H+JtEiDva/KkJtaSrAT7nUoNKiVoedAJ8xcA6TSjqnKFIZuT1b0/S9TR7z3cgWDOA
 YS3KxJzfrj7n1qVqdn4fTI6Ib9K38fYopG6AGd4Ds2DnAg5BFt7WgequrUZ711xoqttw
 RmCg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769700690; x=1770305490; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e75Fsiedu5+aeIo3TbRJepvWQBvQru25HrO6tbDPk6o=;
 b=gzMrI1uqlcOEt7hu+dl+eQoJ6mSOmKs3iETjCWMICLxtDrtEyn5JbFo97HEw4riZC2
 gByK8oHuUg0zeeZhR8tRIMK3+PwzJOJyRK6tABmdFCUDqnR6y1Sz8H+BeQKj4OgRCiOG
 8rGwKgzFcN9LOmG3ugDfM9TH90qRB4cZCUJXROnr3kZUm+0dHhMryan7EzrxxAyHNOzv
 hh0jPr/SkGkT6J8B7heFNm71fZ1e4nJ2pM+3BllK4WX70y9NCPX82U/IQkdUHV3hILVo
 peNtnGGdjlaEWVp6ffaU6XyrnP2XCczWm3IX3HKeWjXz+PBrF07p51XiVvmE73a3pI2l
 hVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769700690; x=1770305490;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e75Fsiedu5+aeIo3TbRJepvWQBvQru25HrO6tbDPk6o=;
 b=vmH5iRwC7+aBTlQGnGYmNM3YmkpT8jlwBkXEemCkaEiDYaEJcaCJq2JLSaVV73apgc
 MRPOXcWInmqSnUj0MmNq880X9y67qUEK+qn3mwMblfhqYol/cSHwSzex4vWQcG4WZFmT
 ZDGSYpLfi/YeorlxbRxfzphvQZxdfJFtm5vTqSbYXbnecgfNP5ZBGtwsP2vcec3HkJmS
 twKmRcPbNvn+Kog3QTRMkxPK4CfY23/XrfdgoFQv+c7W4UedUQuZ1be9wDgG25CoMU9p
 nrEgIk+/8knWoGToNovb2dV+e+HtA51vsEWBDjUSLswDT+9KfdbhbMAdUTVYBucLbTC8
 nM6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGCmisfSz+kFGo1CgfSAVn+o8T5GZhfU/o8EzlWFpRjqy903xCSkNjaBuHXLwrVNkTAvxU9+j8lQ==@nongnu.org
X-Gm-Message-State: AOJu0YyludcnFD1c04RfuO22kBfQ7/BNc+SzMd9le7FQcMutTRM8PQoH
 U0QtHiZ+vKZfv3p5Mw3pMBzVDBSKLZh6olH4d2Lf1GMPnTNNRWowrR8crD/xAqan+fLAxphLrkb
 xxZj24E1TXMn+gLxVVjcCGCp6XSFmUKLyB0uQVFYjTA==
X-Gm-Gg: AZuq6aIscFqFtGZwZxBLDaYiMY0JmEPtrj1V5izT1ScBq69PLFzVTdLM6JhkPBvuAYu
 Fi+l/YZ8YiJg3T6X+Jf0z6Mmqm72wURRVl1yVrg3rZ+YrAvdRDHLoTps/JnIJNfdLFHNngozgtg
 RMe3xiU2ZmNLJ32DMRziGO7tCm2BIah0oKZXFRPkApapeudX1KypA3QffQMQULp0QHjppeTsHFg
 /+TZsb+1IAcb5xl8gKfkbbsw26yyJcQihxGw2b0ypigU3gnMZogb7zxxtipcXUZOs6QUQ==
X-Received: by 2002:a05:690c:dd4:b0:788:1b67:d741 with SMTP id
 00721157ae682-7949de8253emr83267b3.3.1769700690290; Thu, 29 Jan 2026 07:31:30
 -0800 (PST)
MIME-Version: 1.0
References: <20260127182805.73212-1-mohamed@unpredictable.fr>
 <20260127182805.73212-21-mohamed@unpredictable.fr>
In-Reply-To: <20260127182805.73212-21-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jan 2026 15:31:18 +0000
X-Gm-Features: AZwV_Qg1WATCwSufdmPxyH5WetHRcpWhB31D8z4FidksJvzSyQsOxMu86osm3x4
Message-ID: <CAFEAcA9TwmftmcnxbWMoeAfuV6LD9pPv1hVXiAOr56UKUD+z+A@mail.gmail.com>
Subject: Re: [PATCH v18 20/22] target/arm: whpx: instantiate GIC early
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>, Alexander Graf <agraf@csgraf.de>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 27 Jan 2026 at 18:29, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> While figuring out a better spot for it, put it in whpx_accel_init.
>
> Needs to be done before WHvSetupPartition.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>  target/arm/whpx/whpx-all.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
> index c88c67a9e2..55773555b7 100644
> --- a/target/arm/whpx/whpx-all.c
> +++ b/target/arm/whpx/whpx-all.c
> @@ -939,6 +939,29 @@ int whpx_accel_init(AccelState *as, MachineState *ms)
>
>      memset(&prop, 0, sizeof(prop));
>
> +    WHV_ARM64_IC_PARAMETERS ic_params = {
> +        .EmulationMode = WHvArm64IcEmulationModeGicV3,
> +        .GicV3Parameters = {
> +            .GicdBaseAddress = 0x08000000,
> +            .GitsTranslaterBaseAddress = 0x08080000,
> +            .GicLpiIntIdBits = 0,
> +            .GicPpiPerformanceMonitorsInterrupt = VIRTUAL_PMU_IRQ,
> +            .GicPpiOverflowInterruptFromCntv = ARCH_TIMER_VIRT_IRQ
> +        }
> +    };
> +    prop.Arm64IcParameters = ic_params;
> +
> +    hr = whp_dispatch.WHvSetPartitionProperty(
> +            whpx->partition,
> +            WHvPartitionPropertyCodeArm64IcParameters,
> +            &prop,
> +            sizeof(prop));
> +    if (FAILED(hr)) {
> +        error_report("WHPX: Failed to enable GICv3 interrupt controller, hr=%08lx", hr);
> +        ret = -EINVAL;
> +        goto error;
> +    }

So what happens if the user asked for a GICv2 ?

Can we have a comment to explain the ordering requirement
mentioned in the commit message that is forcing this to be
here rather than in the GIC code ?

> +
>      hr = whp_dispatch.WHvSetupPartition(whpx->partition);
>      if (FAILED(hr)) {
>          error_report("WHPX: Failed to setup partition, hr=%08lx", hr);
> --
> 2.50.1 (Apple Git-155)

-- PMM

