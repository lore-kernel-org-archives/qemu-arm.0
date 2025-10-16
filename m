Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3204CCD183
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Oct 2025 17:15:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9RZP-00051e-1g; Thu, 16 Oct 2025 13:15:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RZF-0004wR-Ro
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:15:12 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RZ7-0004M3-Dq
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:15:08 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-b555ab7fabaso877672a12.0
 for <qemu-arm@nongnu.org>; Thu, 16 Oct 2025 10:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760634894; x=1761239694; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ci/F42ux1jJkTEQXrgFt6RzYeTgODsZDi7fkjO1JtVo=;
 b=VEc/aifiaN2K8LfLY9+dfmEC6UQ+Ltk0/2IpbYZV8eswNgRXvyYM3qBCr3gLBleQsJ
 +FRU/lsjwOXjpG8LiJmAr5ue5Ox42m4TfjnaQ40uYUKY8ESnhIopxWwivFbhM8UJCbeB
 1pjG7ef//OImfuWhpXUin6UauZ73ehpqF7yN61AZK4krcRBQd9BvkWIzDQWbdXO4rNNB
 QyMtlnMd9jFqq4EfkQjBJD41cfT02xIkTPy9AtEeTQhv7uX91cuj8lHHiQEPX3/nTfUi
 c7Ze3ZYSeS2EyItf0w8Qmas0FvQ7JDE2i4AWFCzGaaKHQihsXLlnvUzA0zll47L40hM9
 et/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760634894; x=1761239694;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ci/F42ux1jJkTEQXrgFt6RzYeTgODsZDi7fkjO1JtVo=;
 b=TJv8C1BrR62JiRPysLGJm6V1fQ+bQLcv5j/E2mj0vXbqDLcZWMyS/+CHQtlzsBRH4Y
 5u7b9CveK037cnV3kdOC8Kx16a6VpttfxjKzLLOwVG/HBITbbuh5sfpg2/euZRqwgimb
 IEAkgtQ5dxHW0ts/u253x2esp78aNjfK5cYYTU44e1ZlgDGMAVsqyTXPlpHUJcjC7gJq
 MrgU2ZMzUDTxCCLDkdnMrHJXjJsdY1BI9lxTvoUENwlYtb7eaTIMJhzbEcLJTHdHyv7A
 sZpQEENcCo1zTJqaBtFTrHWrBRaz22inDtpi7l2BwZLIjSZN43ah/wkJi+lnDUdokP9W
 9obg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeXGTaNlqC4bT/jhTGIKypbpc+jE38jZjpCmGE4bzjmyh81aB3igougvQ7P7dXXaqG8uWkVktaBQ==@nongnu.org
X-Gm-Message-State: AOJu0YyEru+xn3QOpgrnDP8LpFCJ4sLCyPOAk6e+CfmKD9MZctPk3J5l
 oO1lzYxGPNAMmt/B1aDwd3aMaLYgcO8Tnr4ZC9uj2+CHqCb+XfEZEbKm+WhJa8iOfus=
X-Gm-Gg: ASbGncsXpygSzSc+6+5ZD6o25CMcFVAWPUykPfH6u966bW+RlAyJXuxOtLE6qprrY3k
 aTAD0OYc2/Vrte8oszcnvcLtPJNH9VnzyqJ4Lf7wf/sALtEoyAl1y8QGJ1TRjXX3CMj1x5lkSCZ
 tqbMKH9k4wiq5QCCBMEbScRmHEwzxYzInkpVef2j111M1V+R6H5hpWg9umH/FFhxwPLxs3LDVTn
 I0n+OFVk6YQHPbFhtvgY0wi000fXmGXT11mWbdwJ0fDywQ2e4MOrBMfUl7y/cO+1L9VmNt76CCw
 Q01ChjWgallapSthptDBrQpJ+xHGH2glDAZP7QKhteejahg3ZErJVWllqKJ3644xk0ETXbqr1aZ
 BNAtZ1N30kxvJkgn0pPGkQ3/I7eMSmN6QrmoPbfEASAmiEqElb7MMJUi9bM+UNqr8Imwu4D1Xv5
 89gHwgI7IlCCmi
X-Google-Smtp-Source: AGHT+IESHVS5zp8LjiBu3X4lB7NPHFDhxojp46lSTxY7yZ18tWMQWxkehHD36yDCKsmzvWqqfozA5w==
X-Received: by 2002:a17:903:19f0:b0:28e:9a74:7b58 with SMTP id
 d9443c01a7336-290cb94784dmr8453135ad.31.1760634893676; 
 Thu, 16 Oct 2025 10:14:53 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29099397d3dsm36335125ad.52.2025.10.16.10.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 10:14:53 -0700 (PDT)
Message-ID: <f0780d08-7487-421c-be4a-a5c5664f1507@linaro.org>
Date: Thu, 16 Oct 2025 10:14:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 22/24] whpx: enable arm64 builds
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
 <20251016165520.62532-23-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251016165520.62532-23-mohamed@unpredictable.fr>
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   meson.build | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


