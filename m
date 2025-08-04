Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87BBC87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 19:53:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj1Fk-0006AI-GW; Mon, 04 Aug 2025 15:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj1EQ-0004WP-TI
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:52:27 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj1EP-0001bD-9r
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:52:26 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-76be6f0557aso3753123b3a.1
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 12:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754337143; x=1754941943; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zne/oFmwJzJDhhVeTrMcH21MUk747mZP/ZoBfHx9v/E=;
 b=JkCzTK/nZLm9KqIRZSOj9/5WM+TO4B4kId7hZ4Yjgcf90zS2XzqyWnlX/Zu+/QW7xy
 Ct+y0HX2w6d7yraw+EAgUf0s2Yal3borU2h6KjttAQc/fCc1J9CowKtrWc+yLiy+kpYb
 ouCtweFGUWo2SkQzjkpmLVpd7M/wj8dKJGyysglvNSDJbluoqjJVxbWMqv/mcBrUIdqW
 JmmBbKzqH2QfYXdSketSdviwDdkYHmNe7qCHCP+wf6hNntD4q3lKud96lMRLQbsq/Cqe
 iG4Xa3DFOFAE297Sk1jRS3zNkahqpGlws9dBM1zHXxIn902E0b7y+t76l0ptFxnHcEay
 vWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754337143; x=1754941943;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zne/oFmwJzJDhhVeTrMcH21MUk747mZP/ZoBfHx9v/E=;
 b=HX/6FsC73jCtO8UZ2NuM1Dm6xNIqTQEqnGVfzREanevc4XOgFZp8X5o+y7C/l8Vpze
 fBEEDX+Aj2U+yIVrEfpgh51eP94SuDLxCWHlfKffct/ny8CloO0A+s3jajSJT9Spz54j
 9YYLy/H/4P9v3w2XvOeloAz3YVNG0QUurHfzkm2xUAyffqm0xVlXMMYZ2vc+Gr4Eh2mI
 1kjug3Y5Pi5ULW5MXf0FDs6sf3H+j+IJ+qhpSR5V63YvkFg47Wet5JWNtUyDtde3SrWk
 u802AlUNYyNN0wFf3IXf8tJeOSANKhVRLbttgIy21baasZN+vSOPcE94AgvsgY6jD73V
 9vJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV017gIqrNcWlInVk382klkuBNbvrd+axt0KZCQCZkKloezCjCkzcJUqYUf+/61PU7ocP8zNdROdA==@nongnu.org
X-Gm-Message-State: AOJu0Yyw77vjZRH3nqn4FvYalX8dF3frpcQgSop56ViALIWoGXocnEXX
 Qlkl7Tll5Es1Q9T3TLGeb9nUm3G4oaTNsz/LSgDkdfyKJLx8L9aW5fZ2MT8b5wStLzI=
X-Gm-Gg: ASbGncsH75gFNe0i9boGdNF2dFcWwsYOUHQ5uqCSJC+9tMkRoP4FV2OiG11YdAMseuP
 3NJPrgHMxJ7cscmfCKWEFtSaBrZOHuXnlIUwJILyLjFXH+jkXYwbkkV8g/CfWY3qCdY2o7HcMJa
 ThVY4rQ3BvyME6ekEni6aA4ADxhV/XHThPq51cX4lnzDdbRctPqBEwvY96xS+HnWea/dg7hV9ZV
 FlBjgU0gmalfyTMNJHmeALSqsDFHEvdCx6d7FCvDD2XZjpeTDXfrS2mq8MU7BvUwszr0UqsdKV7
 Sq6tzA5OVSFFsxt0jtADpTFNZqKroi3V7xL4MbXaVjGZzTCpK/YvrovukLHaSHDRlkhFJ2y/qBT
 nFRKCZ3NBuWuRvpVkRK+P6vMRiBfjr65mMJLkvBEsuWrhQg==
X-Google-Smtp-Source: AGHT+IGiSoZsqaIOCL534kzFmD47xYKQpPufDdZFG4geNQ7xeS4xjcw15Xyni/1ov2yIssTGwr7hww==
X-Received: by 2002:a05:6a00:2ea4:b0:76a:d724:d712 with SMTP id
 d2e1a72fcca58-76bec302327mr14177966b3a.3.1754337143565; 
 Mon, 04 Aug 2025 12:52:23 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfbd1a7sm11283644b3a.73.2025.08.04.12.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 12:52:23 -0700 (PDT)
Message-ID: <93a17641-8888-4fb2-9e6d-844e18e60111@linaro.org>
Date: Mon, 4 Aug 2025 12:52:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/17] MAINTAINERS: Add myself as a maintainer for WHPX
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
 <20250804142326.72947-18-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250804142326.72947-18-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> And add arm64 files.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   MAINTAINERS | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


