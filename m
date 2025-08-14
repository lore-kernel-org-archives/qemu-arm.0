Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697F5CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 10:16:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umUzp-0005A0-BR; Thu, 14 Aug 2025 06:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umUzm-00058g-7Z
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 06:15:42 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umUzi-00044D-Ni
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 06:15:41 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b4716fb798dso428932a12.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755166535; x=1755771335; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=phIvjDKlGlv1Saxi19QXKIlrYMyfCqI3wfoEDdW1mLg=;
 b=L7Mf4f6df5UxlCErlKhkFOFQ//pNVpLmpZCcEnEoY32DCXRLlL3NtGRRLjr+ZCZugx
 03kuga9NI5oMxeDVUd8ZlD90MKgKDTow0OXIM+4vbH591NH2r3c44CF0xjVhZPIX4BN7
 5r2XbPM1CguLOCtWB3LuotTsH91/iGatOo4J5QPmhYoN2XIBziYZyaAyYON8eXFMZQCe
 TYe/AYyemYzuT2VAwTE5DmT4mDjitM6UKnqyI8Bc1KIygFdQTb1hzJbObZPzA+D6b+Pt
 SFJQMMtcYYrgs+xIKuDp2wlThgsStC2n/xmSpcGrFgivcp+cTGbY2i36vgwyesQ+JzWV
 /Lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755166535; x=1755771335;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=phIvjDKlGlv1Saxi19QXKIlrYMyfCqI3wfoEDdW1mLg=;
 b=a5wQQrK+eVN9woh3avJ2O2xkAWlyt5dzxyet6mFLsLHvTg518pKA5c31bfsALV80WJ
 PtfYB9Vm0nFzPm3b4yypBeh4dXjQUjsCW/ipZMqRPet2niu3elYTI4065vLPVECqNGcZ
 a4VzkNU/Q+Ld+KDsOJu0/ukvO6+uHlCQZ5hMeDa9dqz453x3EdZBV1nVmDRlZLlccg/X
 8Zthp0lRsmE81JrM2ctaE34aEjM3izvPn8mUIxfYc9sIKWGh57YU82jQpGTNAWJ9pmws
 1fwv/h86n3W+g5sHU5qJezCSUTKpTerGLj/2moaQG8XB/D0K09dpG2HHtf4RttEbhIVH
 fkmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Z4yUw/W+Vw70Ay3GLK87rKKBUB59x24D6AmiEReIC4mazmfaVs+SeVXtPsRlxj30TULKOwJ/Jg==@nongnu.org
X-Gm-Message-State: AOJu0Yyx7OGIglnEIw5w5X4BsR/RyCVc59BLr9u+4yKDubtdJM/6u2s8
 tnv8cGbpV4ClIhC+1RidGauiNX7Doz3fFVAboPJ/iE832uKLG/lbJyRWxz8kRvQRiew=
X-Gm-Gg: ASbGncs8+kys1FiugQlSKfwfto4Rmbada4h8ftOkagc564hMX0IiiIx+HfbhZaF5IWC
 q+veyhplKQ2Mcte6C80CwLsgKGyAYRL2AuU+n7zXbJ7NBnwShrjvQV3RhzSJqgPPHiN86zEGybb
 QgaTHkTieY0u64CPXrSpRZZCM3xwhLwi+Mb4Hmkf5qk6ROSCOhrCv5bst0CZDt9VcPK3us2Q3Ut
 LcX7R6VrO/D1RMAwAMONJRZapfYyRxE3NDeLkHVtTPrEiKIDdTZ9YTfpRZC3JmCZFBxa0KlRX9V
 d7NghkLgJLJClnR9K7rJUVwc+w8NyMaqcr7+Tv55lh/xmLPS22PyRj//7cCfmHfIe2x33YMUpBE
 cd8V7SWy0bumFU+J55A91cPdyFAMElGwsgeUeKjRUdc/K6CQVUsnAUqKc3yRNnJg6C2n3/oXrCX
 hCc35e+MBtZS5VMKs4Ib2wJvs+Ce1w2eQzeWgPHhx2tb+F0bW7UAHQ+9vmCVwgjmMV
X-Google-Smtp-Source: AGHT+IEJgMn5UghoKXvah9AA16ZOATQc+ms4pJvvU7jkdG7iHuDnlKvJXT5hPxX26XOx1un8pVkX1w==
X-Received: by 2002:a17:903:138a:b0:240:4d19:8797 with SMTP id
 d9443c01a7336-24458a50a4amr41739945ad.22.1755166535345; 
 Thu, 14 Aug 2025 03:15:35 -0700 (PDT)
Received: from ?IPV6:2401:d006:5c08:e100:bc49:5c3a:83c2:8ce7?
 (19r3hzjy9klp0jf5b7z5.ipv6.originbroadband.com.au.
 [2401:d006:5c08:e100:bc49:5c3a:83c2:8ce7])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-243099fc184sm53035355ad.144.2025.08.14.03.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 03:15:34 -0700 (PDT)
Message-ID: <5540d49c-e8f7-4622-8363-f53226271749@linaro.org>
Date: Thu, 14 Aug 2025 20:15:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/85] target/arm: Implement FEAT_GCS
From: Richard Henderson <richard.henderson@linaro.org>
To: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <87jz39mcbi.fsf@linaro.org> <411c904c-c2c4-412f-940e-5a9782bf58e3@linaro.org>
Content-Language: en-US
In-Reply-To: <411c904c-c2c4-412f-940e-5a9782bf58e3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

On 8/12/25 22:07, Richard Henderson wrote:
> On 8/12/25 13:46, Thiago Jung Bauermann wrote:
>> Most of the GDB tests pass. The only failure is in a test which sets the
>> GCSPR in a process to a bogus value. This causes the process to get a
>> SIGBUS:
>>
>> (gdb) set $gcspr = 0xbadc0ffee
>> (gdb) continue
>> Continuing.
>>
>> Program received signal SIGBUS, Bus error.
>> normal_function0 () at /path/to/gdb/testsuite/gdb.arch/aarch64-gcs.c:121
>> 121      __asm__ volatile ("ret\n");
>>
>> In the FVP emulator, the process gets a SIGSEGV instead, so that is what
>> my test expects:
>>
>> (gdb) set $gcspr = 0xbadc0ffee
>> (gdb) continue
>> Continuing.
>>
>> Program received signal SIGSEGV, Segmentation fault.
>> normal_function0 () at /path/to/gdb/testsuite/gdb.arch/aarch64-gcs.c:121
>> 121      __asm__ volatile ("ret\n");
>>
>> I don't know whether this is a bug or just a different permissible
>> behaviour, in which case I can easily adjust my test to expect either
>> signal.
> 
> I may have forgotten to set the gcs bit in the iss2 field along the unaligned access path. 
>   I'll see if I can verify this hypothesis.

Thanks for the off-list test case.

I now see what the problem is: there is no such thing as an unaligned GCS access.  The 
pseudocode for GetCurrentGCSPointer() forces the low 3 bits to 0.

Thus your bad pointer 0xbadc0fee becomes 0xbadc0fe8, which then produces a SEGV 
referencing a bogus page.

I'll re-work the patch set to correct this.


r~

