Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FB1CCD183
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Oct 2025 17:16:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9RaX-0005fp-7b; Thu, 16 Oct 2025 13:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9Ra0-0005Iz-QR
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:16:11 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RZt-0004cR-2R
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:15:52 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-b5f2c1a7e48so662236a12.0
 for <qemu-arm@nongnu.org>; Thu, 16 Oct 2025 10:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760634944; x=1761239744; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uO3Yp50UwJMk/y1zHsdYq7Wk9EzSwK2Trqtqi4Eq1rA=;
 b=GVELwRkUW/IYNz+oxYD0GwXHNFvl14fuI2jHMpVahrBIUxaGXmP/9XE5KSc4sP2tNK
 ZFF6Or96C6ipuq7zlBUMmQnWKH/KLcYWP6eGXzVYN10Dtlfo9MyBpdITaz4Md8JobiFH
 AgJlK2BFrqxrjL+DlDltNSPfSd8drfULu1WXktgns5fwyLcchaRIOVSmdKfJURMiknOo
 copTZJ52eRyMoY5eQVwET6iFpxCy9xXI7jSS24B0aNLMz7hs9nxFr1ClfA69HCipxyvY
 vk4OiyCto0SwS3FwIbksxQcsTHC/TobnF8gjvv0vtPJkbdifKA2DUpg3M6SoRCCE+Yca
 FxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760634944; x=1761239744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uO3Yp50UwJMk/y1zHsdYq7Wk9EzSwK2Trqtqi4Eq1rA=;
 b=S+DdXHlNUZ3edinS5Ci603f+W/Bd6AFJpVAueqW91guP6tUy9CoL8YyTwzYKAJK80e
 crs1jJb5+9uuPv1qNKCdff55ViF40nz6SXOUIX9H32TcxbLs1QtMLnra2vjPWFXn/p/p
 USKlVPnrBck0oRdaTwRFc6o9/9G9g1OMu5BMvFyNSCMP0Pszhq1FuVxhmtMqWFINwjIE
 3gsL4BS1QvYWt0a1I17B+blB+tdaVKXuXOEzSZMAAJ91lVWRa41eDeJOxD4QqilnG3Cb
 Ks4IZb6dlLnXF1G3H+iyLY1iMqYTtC1Kx6zTlAkEHaynyGhHzLQvPzrGl0iehuFzOU5f
 3WYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxE1CKDDiJokvY3K/MozdGISKpJcXyf/OS29GuvbJAnFUkWaODNzqiN5+lxDCQyGDf6G26e3s93g==@nongnu.org
X-Gm-Message-State: AOJu0YxJDziDv69YcpU9/ksYcl3PYNERJWj2RR0ukW/pvm134h0epz/g
 ZnyTQL1UvGVjlYjjWQKXp6sUXDgkNK6QObwuEZA8+BZf31IMU/8VABQhGQUSbli+xt4=
X-Gm-Gg: ASbGncuQ8STQ7kWm9a+EFb4TilgmdI4pAug7T2q0p5AOnmpWOeRlLyP6cV53YCWfSVV
 wwRHoUUJ48JoX4l5EKBrwxdcojUPKk0X5Ttmo1xvSj9cTX17JFb4mFsojJQ+FFpraWN0KVy9KKZ
 3ZPGiGopfuLE/q9pBuIadz1heRvpu5INl4bXJpncLLnybvLS0Um4xyeOske9Pop7gZhmVjEpXXn
 cpo5vuSQamX7gONO7I3rNejoDe3eGs10JRF66DI6F6nFENePcegl5Hyk/T5zugyBBKZ/sWiKCbI
 sYdNTVAxUbqWLKM57gk/MbdDd0Lhu0EoaPTsqLzc8igIj0cxBuG0gq90QwmI9Gm3t9+JJdxDiNo
 uHORYSStNnpiXCOXYDopjnQ3Q+mU+Ixxpdtu/t6hzAL0MV2uOXpzICCnvxDwQ22LYUJ4wunTImd
 w3ez1xMvyVDDilP7rgCdGW1NM=
X-Google-Smtp-Source: AGHT+IG8ntzTeyqNtRo+ruJaIAP0uFdEsIN1dMzMYvlk3+/f4KRMCNbUa4vYTIfJVgyQ+KNmV8PtSg==
X-Received: by 2002:a17:903:138a:b0:28e:c9f6:867b with SMTP id
 d9443c01a7336-290c9cd4adbmr7484625ad.23.1760634944303; 
 Thu, 16 Oct 2025 10:15:44 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29099ab474fsm35797705ad.86.2025.10.16.10.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 10:15:43 -0700 (PDT)
Message-ID: <2cbd9feb-2c20-46e0-af40-0bd64060dfba@linaro.org>
Date: Thu, 16 Oct 2025 10:15:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 24/24] whpx: apic: use non-deprecated APIs to control
 interrupt controller state
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Eduardo Habkost <eduardo@habkost.net>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Roman Bolshakov <rbolshakov@ddn.com>
References: <20251016165520.62532-1-mohamed@unpredictable.fr>
 <20251016165520.62532-25-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251016165520.62532-25-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52c.google.com
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

On 10/16/25 9:55 AM, Mohamed Mediouni wrote:
> WHvGetVirtualProcessorInterruptControllerState2 and
> WHvSetVirtualProcessorInterruptControllerState2 are
> deprecated since Windows 10 version 2004.
> 
> Use the non-deprecated WHvGetVirtualProcessorState and
> WHvSetVirtualProcessorState when available.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   include/system/whpx-internal.h |  9 +++++++
>   target/i386/whpx/whpx-apic.c   | 46 +++++++++++++++++++++++++---------
>   2 files changed, 43 insertions(+), 12 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


