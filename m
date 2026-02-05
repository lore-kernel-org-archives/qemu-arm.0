Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59ADDECD999
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 20:34:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vo62n-0003PX-Gg; Thu, 05 Feb 2026 15:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vo62j-0003Ok-Gx
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 15:33:38 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vo62i-0001SI-19
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 15:33:37 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4359a302794so1037182f8f.1
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 12:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770323614; x=1770928414; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pTQcVJ1lzo9vi3zXuxiMVxkT2/kMhpBgeSQmrUucCFc=;
 b=a4w2XfjZGMsCCajMbbLP2hVUyQFRkhDxZrmiysm6e7/ZuiSVuJWACdslwx6uIbiUMe
 esvu0zwDhW4H9Jk2IqsDk7AQYFVopcPrg5W5rGk5thMG6JFA3DFXKTef7eSH/bzxiUev
 b6W67EOjtlJEOopdlXkGhOCOY4VnRHkZoPbHK0O4/2l5KJpEKr8IG711vdn1KQnasM9n
 LgMr6d5nWrl1wNyY8eWbMQznDHTJmURTaQuspYU38CvKo3poESU2lf2lsg3jt5E/EBL7
 Rmz0J+iDxDVIMmtJuKPiZJwgdd2mXyC0n2nig5A1Drp9sG00v355d4ZB7gJgN6hDJAFq
 ts1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770323614; x=1770928414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pTQcVJ1lzo9vi3zXuxiMVxkT2/kMhpBgeSQmrUucCFc=;
 b=EuVxs2/m7CZ/X4jbGCP9Jw/yI/y8/pDz1kqJDGC4rfWRYzR6lezDYzAGUWgj3/9WLB
 tiHemyzmmG9qUgEXSTKyaV0xEsu3jyuUSAvBikk0qq7iY6XJG7I9vU/la7J0Xg/yQh7k
 PRM9SqJOYTLFXWuO+zJsSNXITZVMEeNIofYDLIvvRyvJbciCo+eI62AN1YqbBDw22a0p
 w95OKRgwIN3NjerccFMSwkpMHxKixvHRtTuig8JMaXgUAs98mGBe4674LrACaofkXipw
 MIWzttTYOWe72g0WEG8I7e0gl7j0GhoNZCkbcMiPGjk5/hMFdfv/h4YYSgryi6tkY2l0
 ptSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7bEeaovJ6X7c/sXPsYZMqd0DeU0KTp1TeU+E3osWoFmlIuqDvg24hFIj+JWJsoZEScaOBjxfreg==@nongnu.org
X-Gm-Message-State: AOJu0YxdjxMiSNRb60LT59zZYx14GTM9cutADw9Xg88gsHdsNwWBD7dj
 1DLyErhY0OADuwc924b9kThK1HWcT2TV/atEYdQGdzD001+1i39dtto2Uzu6MqQL46s=
X-Gm-Gg: AZuq6aLUV+2uhZjTKlXD634fvmlXw1pbt3GHslGWdHOMsiTzT9ntkO0R+sCqHa4KOVd
 GtQjT6OGHJJne+vBuYoKaW/kDYkGVlhwJSZ0IkHAkmZJag8jWzUs/aOtKT4xeXEw3GcbFaaKgvZ
 2hlKe6DY/A6zaVvIVWRTFVcB4dPmfa24ewRvfn/KJa4pkD1BH1BtTsLxi14uWpqG9K8tqBvNtk4
 Ri/VW2N65L1w5YJDA0Wuv7QHNqeE6DyIsqkB/UL5YeNEACMeqfx0nqLNcNlF/wSpN45LExfumpo
 EaSSBRUZ9kq6eHr+733g7dhLXXAluSrng0XiGJLRvtUQWKi17SZhUMxg+UIUdq0YJ1t0kJ7NLJx
 6CrMVv6XTA9tZa1NdGA2P0uoyc9uBR/NMVbzR81Gxlt1GUy5p56kNB1/fmBNjYC4L8oNQHrJEyV
 Da7JIRmTKlmi+y36P/XMeBjZ+aNwFkppNc/0uu2iBwFwb1IRzt5BQ+UAya0QXiv40A
X-Received: by 2002:a05:6000:24c6:b0:430:f985:a7b2 with SMTP id
 ffacd0b85a97d-4362938a74bmr789373f8f.51.1770323614336; 
 Thu, 05 Feb 2026 12:33:34 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43629730992sm624922f8f.21.2026.02.05.12.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 12:33:33 -0800 (PST)
Message-ID: <5f4f186a-9dd7-4175-b12a-628ea64f4038@linaro.org>
Date: Thu, 5 Feb 2026 21:33:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 07/22] qtest: hw/arm: virt: add new test case for
 GICv3 + GICv2m
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Shannon Zhao <shannon.zhaosl@gmail.com>
References: <20260205152432.78208-1-mohamed@unpredictable.fr>
 <20260205152432.78208-8-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260205152432.78208-8-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 5/2/26 16:24, Mohamed Mediouni wrote:
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   tests/qtest/bios-tables-test.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

