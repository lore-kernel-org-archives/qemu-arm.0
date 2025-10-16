Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC31CCD183
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Oct 2025 17:08:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9RSb-0007yt-9J; Thu, 16 Oct 2025 13:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RSY-0007yS-N9
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:08:14 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RSM-0003DF-Ec
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:08:13 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-7a213c3c3f5so1373549b3a.3
 for <qemu-arm@nongnu.org>; Thu, 16 Oct 2025 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760634476; x=1761239276; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mzbO6qxXTSLN2VfEZ7sgVqVzDYN015Du6ppqHnVvYSo=;
 b=DRXYJhLts6pQgIWra1GSFIW5VaTQItoQM3/7fG0FXbPtENJe+YjVPS6f/Nf5tdwrwl
 Ipv4eb8Nnb7vmKvmdiC2hsrV22+fwWCctjRgPU4EcS8d15vPrxafkHlB95JEgKUUL+/F
 CHK2Mbtm6SnPBG2/S9W0m4CfHXC8fWDBcGmWt0oq7S75q/aWZQgxe/b0om5SYuC2oqZs
 3iehZYOTyzPuAlX97fsLNCFsvB1zn0XLQiIgpVvAwFbUsYy+29JTcGO5ng9y4clySpNk
 8xf70YW/D/nBPlvoGF+IVpkTzTNOlMKGBkwV0VLaFKf4ZzTsXiL5x3P3vCYHbWviMHA+
 +crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760634476; x=1761239276;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mzbO6qxXTSLN2VfEZ7sgVqVzDYN015Du6ppqHnVvYSo=;
 b=V/WzbKja5pHoNMGdc5Suf8cAHSzOxNiDe4cfQZas05MGqc8/rJU2+SCvd1sDV1BT7z
 tkmSUtSPHzMElKv56OyMEz6WRP65YbtaVtR4L/TT5gYx28JJEJ0ZX3MYlx3GkNsGN+M3
 kv4qjufV1UMcDPJa2pBULYEevIz1RIzmLphogGfgTMXk3rGnorNF48RKjkI1sZhmchIR
 hPu8//TAR1SvrvgUggz7xbhkPctsHbiRpH8gCnKN6kJ+kYJJ5PGRoF8ODqSsZhkUyX/2
 P/lX0Df69xia9XprAU2AVN6q6dSEh1/HS50DCUYi/CNAxKyDEG5DYUrNKDJDWlme9+Y6
 kMjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZkDaOeJTMRvuA9aklpJrI2rylytuHuCYJnpRTrQzNdq0G4hyGLErzARIfk4NBorL1uLvqjRYSTg==@nongnu.org
X-Gm-Message-State: AOJu0YxJmOsN0uVDrnDKolxkjONZhS2/OHlLr8IHSQ4xvl4VGTA7ayHR
 6ZqOw+oibBICMZQWp4tCIZOIrEUAE3xYjlhfGWgX0wntEFP/Hrw3xE0DAaTXDGyTiEM=
X-Gm-Gg: ASbGncuEtNlfnxRjRZyrzmfIWoTl4Yzl+HzSAty8B2wFbZSzssKdHh0QlOZUQZILCQE
 g5+JXzz4oIlzk2BFKQoE9liJfRn7lGZ6AZTMIn8K1W2FE18LJ3WMz7FnvxXPgnBhwqpMMmXNxP7
 38q3877r3+j8VN7K+KDT1JS8oL29qND7pSPf8Y318TgdNFIZfCeFRkEAA0sy8A/I2pUX4e+y3xn
 PCIGrdw3d98uUOl18Uv7kq6foJ5NFTBeGcR3TJIPztHMUZiUNieVrDWEFZws88hGXZNlhHORJwI
 vZ46TuZkO9H8VdBNIr13d/yXfnvMx9fA8cX5AgwyBe+nklSMl9k9zd6hCJneZlg5n1k9v5QPgDQ
 5MWnwiPO+lZlwegOIk8wBpHrsXi5ElkHc4/b5o3KCZgCGEWIYYOWTtulbbLjrvyuqT9UFr7aSKq
 jYltmVq08rdYICDPehNgwJQd4=
X-Google-Smtp-Source: AGHT+IEz4yyVpPHAHnaSdwY5OhhzkZ+c1o6Qi6CcgXGWF688z8Ud9rib7Lcs7Z3hHBFsvf4idG26UQ==
X-Received: by 2002:a05:6a21:6da1:b0:262:da1c:3bfb with SMTP id
 adf61e73a8af0-334a84854b9mr821530637.7.1760634476213; 
 Thu, 16 Oct 2025 10:07:56 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6a31e443e9sm1825218a12.16.2025.10.16.10.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 10:07:55 -0700 (PDT)
Message-ID: <0d421108-0a63-464d-82de-071ccbc61919@linaro.org>
Date: Thu, 16 Oct 2025 10:07:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/24] target/arm/kvm: add constants for new PSCI
 versions
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
 Roman Bolshakov <rbolshakov@ddn.com>, Sebastian Ott <sebott@redhat.com>
References: <20251016165520.62532-1-mohamed@unpredictable.fr>
 <20251016165520.62532-2-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251016165520.62532-2-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 10/16/25 9:54 AM, Mohamed Mediouni wrote:
> From: Sebastian Ott <sebott@redhat.com>
> 
> Add constants for PSCI version 1_2 and 1_3.
> 
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> ---
>   target/arm/kvm-consts.h | 2 ++
>   1 file changed, 2 insertions(+)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


