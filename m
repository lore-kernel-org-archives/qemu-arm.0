Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD09CCD19A
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 10:01:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9hFx-0002TC-6o; Fri, 17 Oct 2025 06:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9hFs-0002Pf-G7
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 06:00:12 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9hFn-0008PE-Di
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 06:00:12 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-78356c816fdso18307327b3.3
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 03:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760695202; x=1761300002; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VJa3DKX/KUQkLSI+xZa6UVrAyJoP/rqbHYIp2RkqgOo=;
 b=Xl28V/TrtZumNIxNRz+s+qkuXHdrfnXtbmQe/PslIs5r005DiVCwIAqDoLz7dmrcwq
 3R9ooMbBMFMw0XLh1WxkH4aNrExxKiBJ8A6acXy7slqvNKaN8Ephtqw1ruDKv+jw6OuX
 5UTBXUoiqncw2Zj8KT2aHZe99qi0HUGynQ0f9pODJF8q0sXwKQmxBhlFC5v89THV9jt2
 jO7//PgGJgwiOvQrZmpU0ZFc5/ZuZeTU1ARvfjtjHNEusFH9ORsYDdg1uBbTX1b92s3E
 98t7DmbExgXQrTctWFuUTMwiwUcWs+ya3Z4a+gfb5JK9MK4+04ipFmyuDwmMnvxLyVcB
 hdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760695202; x=1761300002;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VJa3DKX/KUQkLSI+xZa6UVrAyJoP/rqbHYIp2RkqgOo=;
 b=X5r+xV3yzeYtfxTYpFt7HqLfVYXA9LyXKZFaromeA+Wr2bLehyu6chelDnl3k2O0YO
 7onwoWBM4fnZX/Yn5UQKa2s9OLxOhEAMTEt72pBVUa97teCe+V4ex2/VDwpW9zrtXWi/
 BgTMVjjOwPOkLXGuQ+I3hj+zUflOc/XLeBG+YiX1A0/EgxlsTbdzZ8Vme54vqUDzZqhq
 iyG3bo69CTICccI+EVlwwWXq/Fo3I7mwXZRBRHzoaQUNuXELHnroQzoPRS2dq9KfudyA
 zs1vmdCRSV1Pk+V136NcYWAM61j4m6qyPJnlOI+iFpyss0gj8Rx68vsHX2L0wSzaD6Sv
 9aiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTwOfde1JGoWFb9u5nNaOEOrFvv+s/Psdby85um+YxxMGtPM7BvpssYMIm90CbPh3jzv/QxKQiRA==@nongnu.org
X-Gm-Message-State: AOJu0YwBaio3r84x1ZozQSp0wDoqzmnHTyrf6ncnKnMQDAWUyWJWEN68
 GJg14nefTuw0Yi7CKY5nu1PKU/FW0AY24EipuE7Ku7F3IW5dIr85oHa1m9DJvwqMQLP3PN0ft/H
 8E3BBt7R2u96WddI50BDAakwWfm/HxXGd5enXSWF9Dg==
X-Gm-Gg: ASbGncsP6ZkPai7vpLH5LzrPB/6kxSkHjEuDeSU/qR3l5ws+VCqCEZZ0oBFXnpsZ4H0
 wfgIMTs1LfeAuCZ7WbjvzyUtgXJgJyZvUOvyzJ2gzK4Hwz0IhFDkcvrF/krag62EoppvUKqveqs
 CsQUw8EPlhRPwt3BE/r/0OmyrTjB+Uha3fbdm8hbHNXyhudOhDRLYsiMse7P+Gbr/KMahChWfw2
 Vz1q7vU8fV/ipDUBUWHjt7+pYvVQAxGn9kvyKRH1+VKMRLx3BmmAlzJldHsP62d3co78MUyn/FD
 QocbQMc=
X-Google-Smtp-Source: AGHT+IH4OEBDLw07h3F0P2nswJ30GRiaPlMQzRr3gsANdHzUh6/Ser9QSnqiUsgXdYQ9JpTls3EO/RERzdJy4f9eMJ0=
X-Received: by 2002:a05:690e:429a:10b0:63e:9e0:4727 with SMTP id
 956f58d0204a3-63e1610ebc0mr2543424d50.18.1760695202280; Fri, 17 Oct 2025
 03:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <20251016165520.62532-1-mohamed@unpredictable.fr>
In-Reply-To: <20251016165520.62532-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 10:59:50 +0100
X-Gm-Features: AS18NWDtFsdK63CgYP4c_rTmG--Mnbl7EfCsXWh2HUfMSt_ZscexxzPxI5R_BrM
Message-ID: <CAFEAcA9VWiQoOytHh9PbbQZVXm4ET7Ud9eLQP0C0njOO8R8qzA@mail.gmail.com>
Subject: Re: [PATCH v7 00/24] WHPX support for Arm
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, 
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ani Sinha <anisinha@redhat.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, kvm@vger.kernel.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Thu, 16 Oct 2025 at 17:56, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Link to branch: https://github.com/mediouni-m/qemu whpx (tag for this submission: whpx-v6)
>
> Missing features:
> - PSCI state sync with Hyper-V
> - Interrupt controller save-restore
> - SVE register sync

The interrupt-controller save-state we can probably live
without if we have a migration-blocker for it, but the
SVE and PSCI state sync missing seems like it would be
a source of bugs?

> Known bugs:
> - reboots when multiple cores are enabled are currently broken
> - U-Boot still doesn't work (hangs when trying to parse firmware) but EDK2 does.

You need to fix your known bugs before we take this, I think...

thanks
-- PMM

