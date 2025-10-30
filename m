Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245ECCCF9FC
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Oct 2025 13:45:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vESxp-0006FW-UQ; Thu, 30 Oct 2025 09:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vESxm-0006Es-T5
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 09:45:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vESxd-0000J0-2m
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 09:45:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-427015003eeso925121f8f.0
 for <qemu-arm@nongnu.org>; Thu, 30 Oct 2025 06:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761831896; x=1762436696; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gkyjKmNCu+65Pj8bIu/kye/9Y3EB+0wOeDHE6t/vBDQ=;
 b=pWM2YyKknt9mhRx4iPV9EhRP8sGAv1nd06fGRufkn5UkaMNQsJQzJdR+mh4KUjSj3z
 5sfIU+PvuWdzAfhwjHsmTzm8laM/Qawcg56tkOvwfSD+bUI9dPSRlGKJefP3bSqAAxgt
 qviUq/ihkEBv36MO4PB5krsxFcBa2tQK/bssoGyuL8qhSIZzgocLVgkkfxjc+05P2X4q
 fRdnx86aWcIKvAo4rx6IbT9bFZXIznjaY7Ne2g3dGLBVFMGM03yAma78a37CR8RFLaea
 /1ONcCQxkGjDopSTK23YRiepnhdickeAlVFT3YOquoCWJ/OmRISQPE56KAtTcguLjuIN
 XW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761831896; x=1762436696;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gkyjKmNCu+65Pj8bIu/kye/9Y3EB+0wOeDHE6t/vBDQ=;
 b=YJZ5oYdfJEveAgHubX2ziFd9isVjTwfLIHKJ1wq93WaIiEnyHrInTnGyMFWIzQTai7
 ijTkK6Oe7fBaTP5Dm3rHHmyCrlL8zq3cFn9u5T2lwT/wfhKxAEBB8EhkVlkhrbGCpCcQ
 9AkLkYHxxF+o742R5kCEvOzHU6Jv+ctdap8PsoyDEhl92n/Kpvk7p5ZYgA+9GxGshJxN
 rkH4965PBeQcfcdfHYUbCIc2/0rM1262FddYbfohBimCJr9dVlem83pvHVMk2//dotMy
 qLVN5G/bEVBSfHsIhNzxwb1LwUPBulJMK9QFm25jEYUT6A0mAPlK59X36f8drNYoEasv
 9gOA==
X-Gm-Message-State: AOJu0YzhlOsFmuG2cIm2B9xs3MCgQ3CKj9aZaO3nfjDFnP1YPvpnowuT
 sr7uIPpL2tZfdQRgRQkL62O4wg5TiyuVsS3/+Bhgb+eycRO/2VNd6wtV+DjzQKc9XBF3uTVfAP5
 ilW6QpTs=
X-Gm-Gg: ASbGncuqEqDMVRdBlBe0H0BItk+6bOu94veQqLd4RSB5kaQcrkVJuVSD02ZN0zV6xLM
 2jbP50PwdDMuKiYJeAu0uFWcMPyvoD9RCFhzaL6JkwSa3lSK6PLrNcuBsmtzRJwmKU+EYm79ZS6
 AeM/490vp6qKpCaNpXowqInLzjJkUbnON94/WU9lZ/gX/jnEeJovtEbLVqWMRZyGBSn2Qa3Bpk+
 1vL1r3eiT8vhmpi0d3agdgiL/6I0yJl6NW89aZ44+PTf1ZPPzZ4xlyQlcEly3j5Aol68WBDGrau
 2LaQ8z+nyEapDEngaBv869UTdrynzcKJsoaP6SalJgObiEIqx5w9JkyvTehTgmByjUBeuqD0R9U
 vQadcb7M2zNs5cBCkixm56bRJDT/vRst13vBSTaOY1WzLhwJl/lDAVRAYCqA6tPVuzT6SOc3f1f
 gAworctrfJaGIEQxESLVB1R5TK9OY7MZcyQ+RnjMrVZsbiFyfrTQs=
X-Google-Smtp-Source: AGHT+IHGb5szLyZijZcBEVejW4R4v3aRMchCYavwFdnCK5cxy+FIp4u2C/P2WBo8AB3EudnrszctMQ==
X-Received: by 2002:a05:6000:461c:b0:426:ff46:93b8 with SMTP id
 ffacd0b85a97d-429aef735b3mr4457579f8f.8.1761831895619; 
 Thu, 30 Oct 2025 06:44:55 -0700 (PDT)
Received: from [10.180.230.213] (124.149.216.82.rev.sfr.net. [82.216.149.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289be3f9sm43701005e9.12.2025.10.30.06.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 06:44:54 -0700 (PDT)
Message-ID: <d96eb786-e603-4d11-96ff-3721666540e8@linaro.org>
Date: Thu, 30 Oct 2025 14:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/23] Misc single binary patches for 2025-10-29
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20251029214001.99824-1-philmd@linaro.org>
 <80d9f994-dda4-42dc-8214-a0134798f732@linaro.org>
In-Reply-To: <80d9f994-dda4-42dc-8214-a0134798f732@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 30/10/25 11:04, Philippe Mathieu-Daudé wrote:
> On 29/10/25 22:39, Philippe Mathieu-Daudé wrote:
>> The following changes since commit 
>> e090e0312dc9030d94e38e3d98a88718d3561e4e:
>>
>>    Merge tag 'pull-trivial-patches' of https://gitlab.com/mjt0k/qemu 
>> into staging (2025-10-29 10:44:15 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/philmd/qemu.git tags/single-binary-20251029
>>
>> for you to fetch changes up to e5c542fa16b0a7d47070692481db301736a0ac7b:
>>
>>    hw/riscv: Replace target_ulong uses (2025-10-29 19:16:24 +0100)
>>
>> ----------------------------------------------------------------
>> Various patches related to single binary work:
>>
>> - Make hw/arm/ common by adding a QOM type to machines to
>>    tag in which binary (32 or 64-bit) they can be used.
>>    Convert the Virt and SBSA-Ref machines.
>> - Build Xen files once
>>
>> ----------------------------------------------------------------
> 
> I'm seeing a failure on mainstream pipeline:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/11906335084
> ▶  5/68 test_bpim2u.BananaPiMachine.test_arm_bpim2u                FAIL
> ▶  5/68 test_bpim2u.BananaPiMachine.test_arm_bpim2u_gmac                
> FAIL
> ▶  5/68 test_bpim2u.BananaPiMachine.test_arm_bpim2u_initrd 
>                 FAIL

Thanksfully the fix is very easy, since this is likely due to a typo:

---
diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
index b5070b46666..0f6d98684b9 100644
--- a/hw/arm/bananapi_m2u.c
+++ b/hw/arm/bananapi_m2u.c
@@ -148 +148 @@ static void bpim2u_machine_init(MachineClass *mc)
-DEFINE_MACHINE_ARM("bpim2u-pdk", bpim2u_machine_init)
+DEFINE_MACHINE_ARM("bpim2u", bpim2u_machine_init)
---

