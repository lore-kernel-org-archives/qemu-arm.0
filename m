Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CBCFA1FD6
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 17:06:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFb1s-0004KW-NA; Wed, 22 Apr 2026 13:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFb1m-0004GM-Tg
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 13:06:18 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFb1l-0004MB-57
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 13:06:18 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so49851945e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776877575; x=1777482375; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7DPnRZ82HSJmoMCxXWYUViYlcPAFH9IoLJRnJFoDWmI=;
 b=pbz9If11iHjDXaOgOeP875FLjHByaAopGHenl62cav/JV1L6VQBFO/W7IIiFNBSV9c
 dgJizDgGER4P1EeShDDoOuTNYrPxwLtXWbOXM84P4nBRX3SErHq9+OZxrL3Gc2oc5d/o
 MurgoTOhzVAyULVVm+7dpqtsDi9Q0b3yT7CiHNyDE+HnRVrjtlSKsO3jzT0MWRTW0gZ9
 OTWsvbW/IS57D5w8Iw9ytnoKzQGHPEhOIDd+E7UYwnAZcPWu5m2DAaGonJwc2+7xYaXg
 PIdvas3VSG0t+bs8OraZXGmvdp7uL2JbnWkEfo+tW/1o5aRfWBdHC7z9BoOIktP643ct
 72rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776877575; x=1777482375;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7DPnRZ82HSJmoMCxXWYUViYlcPAFH9IoLJRnJFoDWmI=;
 b=h2LeNytNWb3qNn+6Z8zfC8ZFptto5KkpyrIATd3at9nxaH540Uf/oUmxTVhjtgt48i
 s0Egw/FYvmlPLJK58hzJGb94ui/fnEzXWDhVEde6LW9QKYyvv9GEEW2legjpdM4jEqD4
 iLbT8SQlRXuyYRcO2Jy2pQKwHsiYU72EouQBaiC/zKmEkYBJPne9W3Ag+3x1huho/o3P
 vPFrlis1bAWAML1MzZJYooH62z6HPw4b1ocd1c4lmMl4ErY7fBBUGaAFWrxgWQprbnXr
 9H0TNreSaDztsMRRZPJ9dUN3P0VGAFRFR07okNzYaO2khUCng0HrkeZ+Z/JgO5OTBfdS
 waig==
X-Forwarded-Encrypted: i=1;
 AFNElJ84LvhOgkcZALAFvyG1XEinb/kVkffUdfQRHx4mbHp9+OUZjvBHyXkRtsDfDvE6lNaMJ70Hd0voWA==@nongnu.org
X-Gm-Message-State: AOJu0Yy4ETP+xJ46rnKsNibmpnnXPRPt9VP9vilmEHH7id2WzBomoqiD
 695RGW//gAJf2vG3q4z202YiOe+CuZu3VmQf46XBnWUw665xPa9ROycLXYspOtFm9HI=
X-Gm-Gg: AeBDiesyp3uJsNuqYLQkcbB9fs4jamvd6erU+ay784ojgxffvkGW9dEtHpObBJ7s8LW
 kHceFZaJU31vBgOSMdQXpbxPgdZt9E9lMDxx7cDOJwsIijcygn1yvRJcKuARyOQ+jD3ZGP+Z6Zx
 ZR498C9lY19hcvHIYU/abzc2Gg5KmEwS0cZrkfMZWiVa4YEcso/NgoQppz05TZV7FC/yewsmXl1
 jJx7CtGIdsjp60jaF2DhcB7QcZ7U15FS3lPICbMYBd80/EfKPUoG/Ko59w3TL2+x5BrA/s/MJf7
 DLF4vIV+uTitNLr/PLk7K6kF2rbiGcvadr1pk2qyk2KxHU40F8ndKsg3osmvVyegL/QsYffaW47
 RzC5CafIoVN18zDIYJytQxahNMoxmpDSTbQDMXUfaiydeSNYLW731gqYWY/6d/hLFQbpL66zzie
 NaZXFCfBH8CspT89tbvRPTqtW3/IcvoytqTw+ZZqzcTznoIGL8WbarLYMn2OY/Y3Xd/jiAHugIn
 MKi
X-Received: by 2002:a05:600c:899:b0:489:1a63:509c with SMTP id
 5b1f17b1804b1-4891a635125mr135475065e9.0.1776877575205; 
 Wed, 22 Apr 2026 10:06:15 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a4b329542sm331350025e9.3.2026.04.22.10.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 10:06:14 -0700 (PDT)
Message-ID: <30fb9fcc-7c34-47d0-a4b7-2e206eee714b@linaro.org>
Date: Wed, 22 Apr 2026 19:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/hvf: fix double hv_vcpu_destroy() causing
 teardown error on ARM
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: agraf@csgraf.de, slp@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, mads@ynddal.dk, brian.cain@oss.qualcomm.com,
 mburton@qti.qualcomm.com, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <ee6f642af1dab29aaf99f86ac9254ddd25765bf8.1776172276.git.matheus.bernardino@oss.qualcomm.com>
 <7be383bc-40f1-4da2-96c7-241946e6e52d@linaro.org>
Content-Language: en-US
In-Reply-To: <7be383bc-40f1-4da2-96c7-241946e6e52d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 14/4/26 15:23, Philippe Mathieu-Daudé wrote:
> On 14/4/26 15:11, Matheus Tavares Bernardino wrote:
>> The following callstack causes hv_vcpu_destroy() to be called twice,
>> producing HV_BAD_ARGUMENT on the already-destroyed handler:
>>
>> hvf_vcpu_destroy
>>   |
>>   |_ hv_vcpu_destroy
>>   |
>>   |_ hvf_arch_vcpu_destroy
>>       |
>>       |_ hv_vcpu_destroy
>>
>> The first hv_vcpu_destroy call covers both x86 and arm. Let's remove the
>> second one, as it is redundant.
>>
>> Signed-off-by: Matheus Tavares Bernardino 
>> <matheus.bernardino@oss.qualcomm.com>
>> ---
>> v1: https://lore.kernel.org/qemu- 
>> devel/70cca2a5cdde3e6531e5c8f1e399e0b584d51ad6.1776096073.git.matheus.bernardino@oss.qualcomm.com/
>>
>> Changed in v2: removed second call instead of first one to avoid
>> breaking x86 (thanks Philippe!)
>>
>>   target/arm/hvf/hvf.c | 4 ----
>>   1 file changed, 4 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


