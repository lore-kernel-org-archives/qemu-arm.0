Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DF1C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 13:16:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weYJQ-0006q9-Tu; Tue, 30 Jun 2026 09:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYJP-0006pl-Qh
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:15:39 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYJO-0005NB-2t
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:15:39 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-69532288224so8531865a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782825335; x=1783430135; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BPiaEk3+CCk+AmYMD67qlsorRZzNw46lcqOGFjH8LzU=;
 b=lVhXSX1an4Q6VvsN7EQhUJlLAZDy2wMH7oxnUBxbtYLwMmH07GlrRs5QJasKyphdSC
 SG8k+KoJcDtqZsisPZhuKErSFsKD4f83z1eGHj5kRTRiGyrzhpZEzGFSCpDbVjBizrup
 u7vLkMUyacZTypju9/VWkiUN499VCmBhMAHSmyfqj9Ue6F7xAnqQT/voO6PDW5XKCxmc
 aOqz2uN4Jxaoo2vknOJqLwgWJ5aDzSyIH8JV8zYBm+7M0xLYZLMj+tQ4nBGGz+kiUrrv
 9dHOizpBOrlklPJtPpr9vNsQeaL5JfdUdYbn9xuUUbfZjGR8DHvUovbJe0Ti5N9azn66
 4iRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782825335; x=1783430135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BPiaEk3+CCk+AmYMD67qlsorRZzNw46lcqOGFjH8LzU=;
 b=a6Bp/G6+nbYJKrksAXc+yC7y+gNPF7wu/90ySjAOCmLX3VBcXO6ADDN9R1g9lu6FBU
 uHbd2d3/yfk5U8vUt9hAgtD/434EVn0TOvhtPkMw/1e0oK924CuSrqaxTkVKDFGGlq1G
 QMoiwPcBVCop3a1cTRbXaOXNNVxylIYhSSpGp8RUDKAq32ce19vai7KA1cpPSbRHE1O6
 y8Od3myumJ1Dl4NoIvUkFAfXa0YU+1QJDXy9L7bzL7mvjUOradsb6nYJCb68uhrK7GS8
 B04z/uUpC4qQCiRapXOfa3ghxvf6olrdHTdFkc96ILS4g47S8MH5Rn2QR4rVn/tMsC98
 MRKA==
X-Forwarded-Encrypted: i=1;
 AHgh+RolPjDaaqKII1DTiXWQv8VUoafACjpYm8B++NDrgMoZEmGyUrcUF96QYPlSqQiIJYQjywoJmrBqKQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxy9xWQvfI96qAB/6EQPubFsfJjYO7Fcf/VEoHDXiZTnBR/XACF
 TVEEX76P9yUDyfaBCP4uLY4eiXfoc41uKiUgoh6CT8Mke5YZJHMG27LPHQLe5TefXww=
X-Gm-Gg: AfdE7cmSIUcdB9uyFiIdP6CagCOEL6hrlEiBolzyz/LX1DcCApkCyT9YsvmN9W/YgOL
 tzvNPBuQ6cCULF8O6kUYCsMac4b/Zbup0gUVDpe02hB5NLQY425nV9ZZ7vjE7/UsIfXKbJhu+Qp
 4QPWGxBugOmWwZZun/ELej1y719DUSL1hSGk3i+ydc2vMRfZQxR8e4mU3mDvz+BGDH0xNR1HJ9v
 lZMqwY6gkxhVHmmTOTw15YmaLTvelNmQ5g9AbRxziG8TIGbFtuQ/8qg+xVwRdJx+DAYqO7XEdnz
 +rdVvUEWi6VrMRQ+QqdGVg2YQujuQPZcG/ah1C5G1kBYv45E09QRQA2VI+cXiJBL0Ishr3HSMNE
 RkOCcqvQpHkZrdpm8ani7gmHUFEV61yFGen+1pothAp0OjmJrD2RUkCWGNgTuuX06oIcOGpbmsO
 CAytBSiWAMhp25c4jv0SFwMqNX
X-Received: by 2002:a17:907:d716:b0:c12:34ed:da13 with SMTP id
 a640c23a62f3a-c12873a8823mr156028666b.63.1782825335624; 
 Tue, 30 Jun 2026 06:15:35 -0700 (PDT)
Received: from linaro.org ([2a10:d582:31e:0:a648:9a45:1aff:ca47])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1288d16b06sm123829866b.8.2026.06.30.06.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 06:15:35 -0700 (PDT)
Date: Tue, 30 Jun 2026 14:15:33 +0100
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 4/6] target/arm/cpu-features.h: x-rme now means GPC3
Message-ID: <akPBdRdfL7aE4bpQ@linaro.org>
References: <20260618-jmac-gpc3b-v3-0-353e546067e7@linaro.org>
 <20260618-jmac-gpc3b-v3-4-353e546067e7@linaro.org>
 <CAFEAcA_M0Z770FApDyhNcYaP89JP3Q8MDj5bMjYKSpmONYrr7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_M0Z770FApDyhNcYaP89JP3Q8MDj5bMjYKSpmONYrr7A@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ed1-x52a.google.com
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

On Mon, Jun 29, 2026 at 01:00:05PM +0100, Peter Maydell wrote:
> On Thu, 18 Jun 2026 at 17:33, Jim MacArthur <jim.macarthur@linaro.org> wrote:
> > @@ -159,8 +159,8 @@ static void cpu_arm_set_rme(Object *obj, bool value, Error **errp)
> >  {
> >      ARMCPU *cpu = ARM_CPU(obj);
> >
> > -    /* Enable FEAT_RME_GPC2 */
> > -    FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, RME, value ? 2 : 0);
> > +    /* Enable FEAT_RME_GPC3 */
> > +    FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, RME, value ? 3 : 0);
> >  }
> 
> Just noticed this, but does this mean we should now list
> FEAT_RME_GPC3 in docs/system/arm/emulation.rst ?
> (If so, we can fix that as a followup patch.)
> 
> thanks
> -- PMM

I think we should, good spot. I'll follow up with another patch to do that.

Jim

