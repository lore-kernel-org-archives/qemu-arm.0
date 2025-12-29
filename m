Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74AAE92FCB
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 17:59:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaHV5-0001Lk-AN; Mon, 29 Dec 2025 12:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHUi-0000mR-8w
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:57:26 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHUg-0005Yd-KI
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:57:24 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2a0eaf55d58so59495205ad.1
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 09:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767031040; x=1767635840; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ptmPtl9PHyVjyFIR9fDjL8hxPyC+ceFfam3bNYTak6I=;
 b=wz+5AYlcFLijUQdnJXB293BXtAxCepRAQhuVIZ2BNz7aNohKgtM6hIA7H/dmW/SyeJ
 zmKKjRZbKRHOuavg4BSJDrETOUvplkOA7zG/5xjUrFWjLznkfLKatuvQdiiGfblrlFtK
 EtGeNcuIXcvVCLfq5Ro8uhIopn4Tb7EN2K0eKcVXfI5Uo4WTDC80uCX0Vq2cfYeaCLZA
 Br3vJvN58wXKHrHV5ELFpV5bg7uPiuez+YaGehZVhpgNApVUnZhZ0z1+PdaO6j7uNkGC
 0mxcvGBLkAhPRHfUb3FyddC41dxbyV94UQUwRez+XSdliyEvEmXToftXbMhwFeGJAlwT
 6AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767031040; x=1767635840;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ptmPtl9PHyVjyFIR9fDjL8hxPyC+ceFfam3bNYTak6I=;
 b=aSjR7oBCfwMiW2XKxV3WJ/TUZvwwNgIbVLfu1nNUbEDMsB/0kMKM9kH1aQHKdWQN5O
 EnaPhgGPUn44GbVygccga5EBNaY/4QPHLLIE0qvLAwWfCsU8UvXefgfhu24+btRyBXCp
 V4+syGje0rDVb/2PNrDZ1SGvYPCT7GJb7F0mhsUFLiowyIk1CYJfLpohaN4gwTgfMRsI
 ERG9DX4miEwz1tL8Ph+PKPH4LlyHhACfust8A1pVGoBlTPcn26eRR06DRY0aerPphI5K
 k9JLv7np2tUU7Ktp7okKrlb9LNeDO/FClNKwVNrj33RR3VsiCTB/rSlCXwAXzipQ679L
 yKuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8RtRxFwUbq1CdCJLiEN6HNIx5i0YFHOfmowLThPrDM021jHh+VJil5g0ZQwx8SdGtO5zl3slGQw==@nongnu.org
X-Gm-Message-State: AOJu0YxtzYImUe10hX4UGfZI87DOXAvUu833+W7Tc1ANHsWYdJmUvx5K
 tD7hHOoIw2CDlT8TK2XXBAxPXJ1y6C+KqOPGrsZNilwnNAvniCkMnJ7W5WdlRvRiCvk=
X-Gm-Gg: AY/fxX42pFFAGFOvhpMsF9QNw7cKjsWNGIy51F342Lwq+7P24dqiEts1jXsYr3j+311
 zuva+vrUSIMKVtzbXxXcyg1Fm/WhU4oXNS90eVjxkydwS+7IWJXaFQtJ4hRHcJQrJ/gKw2n3VBd
 lC74nHw3bGBabX64Cu0TbfiBgu9BTnKgAX22KJWVvBwGnPs4pLCRUiJCFO+cTe376Q8Vwoly5gB
 xIhGoF3SQmZ0ADQtIwoGpLUT2A39Xt2nxFO6MB66fqLnCBICn8VpZ6efA2Q7d5W+RGFE45gVY/u
 Ddk0OnXt+EXGmBg8iVAJIP4vnKmx9C9prjsGBv71faMsdqpLGM6ZBoJrU8MMRE6lSZ1CUOxieyk
 LRgBMGzSpdUU4ibV+dsxTqstmcgjQZeQyZIEGdROMWFQrlwrnYXKF8CwsNSSvLC3BLDSazJpr6h
 SM2xWND0c1AwVS82zypTVY00tUbnx1q4DNS5QmSdEGJOrfvJYq2ZIRLE1U
X-Google-Smtp-Source: AGHT+IGTwUkOJN/s6/eauxTisj2JxoFXKlUcBqUfGxRUgkjrOrbsTX0al3QtAi934g4EBJJoQS5haw==
X-Received: by 2002:a17:902:ecc5:b0:2a0:e7e0:1d31 with SMTP id
 d9443c01a7336-2a2caab9181mr388381665ad.11.1767031039524; 
 Mon, 29 Dec 2025 09:57:19 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e7720b52esm13647124a91.7.2025.12.29.09.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 09:57:19 -0800 (PST)
Message-ID: <04228bf4-fdcf-4f4c-b2dc-3279ae5d2e9a@linaro.org>
Date: Mon, 29 Dec 2025 09:57:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 27/28] whpx: arm64: add partition-wide reset on the
 reboot path
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>
References: <20251228235422.30383-1-mohamed@unpredictable.fr>
 <20251228235422.30383-28-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251228235422.30383-28-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
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

On 12/28/25 3:54 PM, Mohamed Mediouni wrote:
> This resets non-architectural state to allow for reboots to succeed.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   include/system/whpx-internal.h | 2 ++
>   target/arm/whpx/whpx-all.c     | 2 ++
>   2 files changed, 4 insertions(+)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


