Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0925C87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 19:48:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj1AG-0005Px-Bt; Mon, 04 Aug 2025 15:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj10d-0002eH-Oi
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:38:12 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj10b-0004ze-Fz
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:38:10 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-321461ab4efso878529a91.2
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 12:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754336286; x=1754941086; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I1zsubyvwVn30bSAS37p6BLVoe8qvxmpIX/1NZepylo=;
 b=zy/cY2DkN0+jI1pYaWM3BCawOO7xsVW8uKK90dzDZW2aknXiur0SdfrNJTDcWHFSFg
 nPRnLS7QdZIIqN3p/n2WtL/6dpfnDqTORizGVvsqCwA68NMADxVNyOs9cBXW7KVvqII0
 KgR7ggYQ5ANezAJ6/5+v+DXJazgcyXssCMTnOvxUO7PIcyD6IgZAsjC5Q7yQKl9ldQQY
 GdeA2YAggjjJwNOfylNlNpM7m+/H7utYIZAgknsH5ORkL9vgEgp28VTkE62Nn7m1IvLG
 fkn7bEVomYcUooDCeSTYkLloaED5t6KhH+Ox4uf6j3/wQbRvb/JG02BTs/PFLaD7uj//
 GYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754336286; x=1754941086;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I1zsubyvwVn30bSAS37p6BLVoe8qvxmpIX/1NZepylo=;
 b=G4j1P2CtJky3XbrG9ko42atI1MpUpPx4hw3ssU3k0RCuWaXmC0XwWBmZw0Erfrl2wI
 V/LvaYdH806TNBdGJ3bo1KFCn6W3Q5mnx9nSLqGR27P3pCftbw5vlUfP1dClwh4u2LLs
 Z/LxUVWi0wYCeobA3YBKgmFZgKAFpVLZXkDuDbIsmxe0VlURBA/doQWrfd/94Byff835
 AIo/5eX9W6jSIafoWaD8WZhj6r26kSkW9cuwFEAqdh0WJe4TBklHaFIU0rn4/kU6HrOi
 0gwrtX+dkRk4RZXgTA298foq4vl2Wt6DH7gGBLGOBFiAkEC2ILTZAEgAK5atgqKyr9zM
 FMqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBIbJhpvQjdXikIlWMPF9liEO0x08NQmxNVkHBiNhd3OPPdb/6wy05Fu66UOWBCtpnxjcOjjyxSA==@nongnu.org
X-Gm-Message-State: AOJu0YzwbHDiZPOmtFuRu1k2E5J4C0d3wzYkg29BOqYp8GN8h1nCZ3NA
 PnjK1Grr6DMm/1VMQ66tDK+UUkC+N6oEBhaizJj/8podA9FvVavWqycVVWourkAWPyY=
X-Gm-Gg: ASbGncttzq6hb/h1Thz2+isx/7dktFwxf5q894FmAAk41O/iU/RBaSQbhaRL3JM1fDw
 IQ6ZoryH304N1m6SJ7LwOWeQyP+aLlbX11jjs6Y1AMkcR5V8pK2MUqBwYaQZxZF3QoDtrUnLFHl
 UPBUsltuXPvsl7EHixxocXCbFj+CFvpCRKdKDd/ZjIko+4PJiLbpT/oTW22SrBB7ldBKp4uE33b
 ygV3+/mYIiWxe9E/voiyIntsUfHjtl2Hx2luNiug0F1Ib/2Ik15ylx1/9y8GXvJIcRKu87Nxj6t
 gjqTh9EXICL1oStReIbZie51+zKYTwn6BesCxsmqs/SMQtNTL/obt/6l54J1WZguZig28h77h1f
 YEMuFjkeiYNvBO9v7fYS5kYBcuMot2Vo2J0g=
X-Google-Smtp-Source: AGHT+IE5+Ucw4k581r3Clz4JLeCHdhrDNXmMgCFYxh9hDcukuxuOQYIMjRLHUp9cj5QKyW61/Ihhww==
X-Received: by 2002:a17:90b:39c5:b0:2ee:d371:3227 with SMTP id
 98e67ed59e1d1-321162bc325mr16157470a91.17.1754336286119; 
 Mon, 04 Aug 2025 12:38:06 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422bb19069sm9285105a12.65.2025.08.04.12.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 12:38:05 -0700 (PDT)
Message-ID: <00f14f71-aa5a-492c-9fd1-c22ced239197@linaro.org>
Date: Mon, 4 Aug 2025 12:38:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/17] whpx: Move around files before introducing
 AArch64 support
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov
 <rbolshakov@ddn.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250804142326.72947-1-mohamed@unpredictable.fr>
 <20250804142326.72947-4-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250804142326.72947-4-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102d.google.com
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

On 8/4/25 7:23 AM, Mohamed Mediouni wrote:
> Switch to a design where we can share whpx code between x86 and AArch64 when it makes sense to do so.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   MAINTAINERS                                           | 2 ++
>   accel/meson.build                                     | 1 +
>   accel/whpx/meson.build                                | 6 ++++++
>   {target/i386 => accel}/whpx/whpx-accel-ops.c          | 4 ++--
>   {target/i386/whpx => include/system}/whpx-accel-ops.h | 4 ++--
>   {target/i386/whpx => include/system}/whpx-internal.h  | 5 +++--
>   target/i386/whpx/meson.build                          | 1 -
>   target/i386/whpx/whpx-all.c                           | 4 ++--
>   target/i386/whpx/whpx-apic.c                          | 2 +-
>   9 files changed, 19 insertions(+), 10 deletions(-)
>   create mode 100644 accel/whpx/meson.build
>   rename {target/i386 => accel}/whpx/whpx-accel-ops.c (97%)
>   rename {target/i386/whpx => include/system}/whpx-accel-ops.h (92%)
>   rename {target/i386/whpx => include/system}/whpx-internal.h (98%)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


