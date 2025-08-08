Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6283C87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 16:14:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukPjg-0002vj-6O; Fri, 08 Aug 2025 12:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ukPjZ-0002u5-Pz
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 12:14:25 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ukPjW-00016t-RN
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 12:14:21 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-24099fade34so17375525ad.0
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754669657; x=1755274457; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=beb9Jvn6Yhwrz3bSjpv5nzdM6y4rkfmDjig7WL8gsg4=;
 b=rvlAOzrlOl1jsajR79oiVjxE7eFKRFAxphhQS5u5FsMSbJ2ShOrh/ECJs9To6Wg4cQ
 c6ZkDqCh3RBzFVssiVOpeEA6BupZ7mJtIz/VZq2joryGQeYYGjyeLm3fsYeic3I3di1P
 vDb6y/+HRyYOfy4xGdiJWQDHikb91GD6xMwLpcWPKUvc9DQN1Nn+rrU6dvvIjbWQKiTw
 yIsVPENSts/Xe6Vm4sDPYcOXVZWi9vQEqci2hNPnj9VsEuhJLrSMxpFl8QFqNcdFV8hv
 yvtT10MSTGLG+ICH2s1gAyMM2zrFk70pTEuuHi6uidT6FYBmyIPpyifb2p/HT1h9S0mJ
 uRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754669657; x=1755274457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=beb9Jvn6Yhwrz3bSjpv5nzdM6y4rkfmDjig7WL8gsg4=;
 b=nVQMh91F15xKv5XZF6zP3rOut+hrUQMzwd0wl0XXi/M4+eRUNsx5GI5xcK29Habbgj
 APSfcEpQOf5R3UA2KNMAZwo4IYuN8ES8b/4RBHgacpIQGQBhCYYkpgXq/1LEDf5ipbtW
 jCfcJ18XAmGpCtPVY+Wyus2VMrY3gZWFETM4ul5YBZFb8WTnSHShhbL3B6MH2qDRQ3b6
 ecWvP3FcuZUZVSG9NHtGYC7odMyeKBXdl/FooAJkoJMpj1vrDGIs46cpFpMsQ+8LFzTb
 pjaKgp62888B8jqmCNh5dOJ5J3Jwq6C3MOudb3B4fcbWZGzpO9MfzXP6a6LNDw+3Adbj
 acQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkFqgsSOrvnl4hbH6l8kSzg3HKpp2GrJbre2v2rXE4mm31XrjlvR9cG/lM1cFxLXYy/cKmNJFLqg==@nongnu.org
X-Gm-Message-State: AOJu0Yyly0bOBXKeO/Wp2JdCobzf9ns1GMayfppMony+xteJEtjZplHK
 /NURf3UxAuMhMxqGNJpX95e2i9OGC4CWpQ5Xzq+puKM1yanMSqCsLPGvfskm0PF9xf0=
X-Gm-Gg: ASbGncsmpulPAZH2XHk0BJbNIO69k/JFX0mAuEgJO1nbspQ/PegtpqukmvNoqP1sHZY
 yd0cKWXuP+9sJ4fY+imhOmek+KfSL5/dCmlsrZqH0Uljc0hW92bq6/3yavzZtFM5RvD2iHKiKr8
 ByAJiKv2CrfH0wisebHrlDez4ei8dlkdfY18H/I/Bj2sYIu+Rgd5wxMLa5QRSoekqUxj2VpC4te
 xUW0Y4Ymv5SvUBfPRpsMNSESI+5+b05/H3Rd3W2pNLJsKOXdjOZLGFJYvc3/3PGVbtEhcVLtBlR
 aTZiOM5v85CzmEs0kxl+rolowORQgW5KMugqPs92sGdNUG3q2V6+XFdvoBcNfCe3BJIegFqc78A
 eE3wB0Y8C/yf0NB/hZ9nFpQbUwvM2CleuxKSENa15qP6l7A==
X-Google-Smtp-Source: AGHT+IFdtcFpVQtfia5Y19J5hFX4ExR3n5Da5rtLa2hb3BCNesVDaPR8R16diSV223tV0grYofgVmg==
X-Received: by 2002:a17:903:247:b0:240:3eb9:5363 with SMTP id
 d9443c01a7336-242c21e082fmr44637545ad.27.1754669657119; 
 Fri, 08 Aug 2025 09:14:17 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaaa75sm214085415ad.154.2025.08.08.09.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 09:14:16 -0700 (PDT)
Message-ID: <9ebe5c4a-b88c-4622-b809-a9085787d841@linaro.org>
Date: Fri, 8 Aug 2025 09:14:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/18] whpx: arm64: gicv3: add migration blocker
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Cameron Esfahani <dirty@apple.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>
References: <20250808065419.47415-1-mohamed@unpredictable.fr>
 <20250808065419.47415-18-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250808065419.47415-18-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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

On 8/7/25 11:54 PM, Mohamed Mediouni wrote:
> GICv3 state save-restore is currently not implemented yet.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/intc/arm_gicv3_whpx.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_whpx.c b/hw/intc/arm_gicv3_whpx.c
> index 35dc5ac531..700b2a1a2f 100644
> --- a/hw/intc/arm_gicv3_whpx.c
> +++ b/hw/intc/arm_gicv3_whpx.c
> @@ -17,6 +17,7 @@
>   #include "system/whpx-internal.h"
>   #include "gicv3_internal.h"
>   #include "vgic_common.h"
> +#include "migration/blocker.h"
>   #include "qom/object.h"
>   #include "target/arm/cpregs.h"
>   
> @@ -228,6 +229,15 @@ static void whpx_gicv3_realize(DeviceState *dev, Error **errp)
>           error_setg(errp, "Nested virtualisation not currently supported by WHPX.");
>           return;
>       }
> +
> +    Error *whpx_migration_blocker = NULL;
> +
> +    error_setg(&whpx_migration_blocker,
> +        "Live migration disabled because GIC state save/restore not supported on WHPX");
> +    if (migrate_add_blocker(&whpx_migration_blocker, errp)) {
> +        error_free(whpx_migration_blocker);
> +        return;
> +    }
>   }
>   
>   static void whpx_gicv3_class_init(ObjectClass *klass, const void *data)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


