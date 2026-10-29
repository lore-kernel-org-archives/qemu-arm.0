Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC477606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wy6/LFKO
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMQrT-0000vr-Fq; Thu, 29 Oct 2026 10:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMQrR-0000ti-O3
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:12:10 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMQrP-000586-LP
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:12:09 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-677af43eed4so2170283d50.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793283126; x=1793887926; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IemviYDDO55O0E7ubLPFHUigYpC+Vs8wQQA/9S1OTAQ=;
 b=Wy6/LFKOoC798q2+4NI+8fD6cUtK3CTBQIcYbLUdZA25bsZT5u39fObRLcpN+mKB2o
 EdK0L74dm28MbjXrs2DH/wuSvIiGN2QrBA5SAztrfYtYBADUrxK8uVfcUTDT5tgYIQpu
 N7uf00oEuwYOqZo5LPSD8Rc3BEBCdpa6RohOkO6/mne5wwa5JkX1JYd9qpTSfkz4V0kJ
 d9fGmaTNXbqNyVNY6VkNTt+FOYHTsgoKb2q4NdicvJEMg34ubz6LwerfZfWRg0JKrbrg
 6F/yxAEu8gMlop4FRhh8MHP7gux7gSTHAxPZocQk4dbIigWbTapFSwdZOO7h1ubS6KH5
 cZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793283126; x=1793887926;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=IemviYDDO55O0E7ubLPFHUigYpC+Vs8wQQA/9S1OTAQ=;
 b=kc4Upy67cEth2jPVlO2H/Gyjs9VmTd2BYCwoJMddaajLH/MuG+/dypx6/r3s3jbcw7
 qrSitI3tAvAYbJxSNiBZ3URmvimmiBxfBcl3bWcB5bI1p91X3UMrGX82yCuAQVbnMhYR
 VJLvvWWLWOn5NZoAmvb5QqAb/tqnYnrk7oQBG5ZprBy5tHbweYdY99BmBA0kPnEh7sjN
 DDrjrPB7q8hnPbD2Vc20CVBlS+HmRRAsJYb1v01OnObQvcf1CDLixoa0Txe28KBby65U
 jvLMMZ3qurDB/42qtKM6wl02M3YQv0doXEO0TcVhPEOQeqrt4FH0O7SY7zx+WSXYVQR0
 bazg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwl8mZ0Y//gbpcsOsFtTlR/tw6F7icMr+xyDT54I+o6smKdAa5KQvchCzM8lsjBDl2IF2Xl4jSJnQ==@nongnu.org
X-Gm-Message-State: AFq9FYIqQvBQuygYrtZDa6cRJNsVAmjlG/5bfpq5wowfE3zITVJJ8CAO
 Kfsc3wlaILeA63kSsoM12/8c3YKcPOBdAJa0TquomtkBZYVDaZUP7M2cM2j88+9/Wd8=
X-Gm-Gg: AYBFou19e2kgi5PGBth5Wq2+UcmhcHlTV7WcRPIZ9kKWqZFGQZlaN2skW5uHRQQmyqm
 YASrEQb/+jpojHOBoCKW9vAymHwlKnicsMwZBqFaIEoJQSv/bDh62M/2QKV6NOtrGPV8G57Q079
 4VukWUSx0vfJT/bAgMKYW2nWoIOqwl5UjVLWor/rlLW17psdX/7XiD1Kzg3nFDxvuREFupvcxt/
 Gj4jUBS9Bic277cpK2kDKS22mmcZgPr+hVz9rVqE/hK5zwPL+4uYnP3vScVBs9DltlFBFzW3j8y
 G7CRw9xJZM8YmpbJTU3F4B0CnwAS/PuQaXRycasqQEPkzIb4K45FQ/Tt62Rhde78Nv68ayPsB0I
 jaes52gLbcHo4fnRRzy3q1Q/hFTBKFSYfZMmz9bH6kQDAyN3nO2LSmWRkJ/eumPaE53Eh/RkKFg
 x51eu1FkgeZysRrjaT39XDfUCxe1VvgCU0NWcLEd5H6EBGbZeWvwsPFNEonJK9yPS/7Wvrv/1tV
 FMci/dlPWIOSAwbDpDJKYtqF/BqaFK7iybiYmszA0oIjSpTSP5r7tdaayl6fqP0ulr1Lwi4/Jk6
 +KNcNZDjR2v140BxOJMkrvDkPWeWnEV3FSIesDfYIkeM
X-Received: by 2002:a05:690e:d05:b0:679:5ce0:da0c with SMTP id
 956f58d0204a3-67a7be983cfmr4834937d50.83.1793283125769; 
 Thu, 29 Oct 2026 07:12:05 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-67a7a15dfccsm3275775d50.18.2026.10.29.07.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 07:12:03 -0700 (PDT)
Message-ID: <ca601eee-e78e-4c1f-a951-2c9bebe99c44@linaro.org>
Date: Thu, 29 Oct 2026 09:12:01 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] tcg/riscv64: Fix logical vector immediate matching
 and emission
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
 <20261028143330.6518-6-philmd@oss.qualcomm.com>
 <07353a79-b037-42a2-9747-4c9f9a05e901@linaro.org>
Content-Language: en-US
In-Reply-To: <07353a79-b037-42a2-9747-4c9f9a05e901@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=richard.henderson@linaro.org; helo=mail-yx1-xb129.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 07:20, Richard Henderson wrote:
> On 10/28/26 09:33, Philippe Mathieu-Daudé wrote:
>> and/or/xor_vec always have VECE 0, yet their constant was matched
>> as a byte element and applied at the stale SEW of the previous op:
>> "bic v4.8h, #0xf0" became "vand.vi ..., 15".
>>
>> Add the 'N' constraint: use the smallest element size at which the
>> constant replicates, if that element fits simm5, and switch SEW to
>> it. A wider element can't fit when the smallest doesn't: its upper
>> half repeats the smaller element, which would then be 0 or -1.
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: 5a63f5998791 ("tcg/riscv: Add support for basic vector opcodes")
>> Reported-by: Aurelien Jarno <aurelien@aurel32.net>
>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   tcg/riscv64/tcg-target-con-set.h |  1 +
>>   tcg/riscv64/tcg-target-con-str.h |  1 +
>>   tcg/riscv64/tcg-target.c.inc     | 53 +++++++++++++++++++++++++++-----
>>   3 files changed, 48 insertions(+), 7 deletions(-)
>>
>> diff --git a/tcg/riscv64/tcg-target-con-set.h b/tcg/riscv64/tcg- 
>> target-con-set.h
>> index 0fc26d3f98b4..9b4e219fac16 100644
>> --- a/tcg/riscv64/tcg-target-con-set.h
>> +++ b/tcg/riscv64/tcg-target-con-set.h
>> @@ -26,4 +26,5 @@ C_O1_I2(v, v, v)
>>   C_O1_I2(v, vK, v)
>>   C_O1_I2(v, v, vK)
>>   C_O1_I2(v, v, vL)
>> +C_O1_I2(v, v, vN)
>>   C_O1_I4(v, v, vL, vK, vK)
>> diff --git a/tcg/riscv64/tcg-target-con-str.h b/tcg/riscv64/tcg- 
>> target-con-str.h
>> index c04e15ddfa3c..d7e8b2ce4f2f 100644
>> --- a/tcg/riscv64/tcg-target-con-str.h
>> +++ b/tcg/riscv64/tcg-target-con-str.h
>> @@ -19,3 +19,4 @@ CONST('I', TCG_CT_CONST_S12)
>>   CONST('K', TCG_CT_CONST_S5)
>>   CONST('L', TCG_CT_CONST_CMP_VI)
>>   CONST('M', TCG_CT_CONST_M12)
>> +CONST('N', TCG_CT_CONST_LOGICAL_VI)
>> diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
>> index 168932711796..4faf7ff36e07 100644
>> --- a/tcg/riscv64/tcg-target.c.inc
>> +++ b/tcg/riscv64/tcg-target.c.inc
>> @@ -116,6 +116,7 @@ static TCGReg 
>> tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
>>   #define TCG_CT_CONST_M12     0x200
>>   #define TCG_CT_CONST_S5      0x400
>>   #define TCG_CT_CONST_CMP_VI  0x800
>> +#define TCG_CT_CONST_LOGICAL_VI 0x1000
>>   #define ALL_GENERAL_REGS   MAKE_64BIT_MASK(0, 32)
>>   #define ALL_VECTOR_REGS    MAKE_64BIT_MASK(32, 32)
>> @@ -384,6 +385,22 @@ static const struct {
>>       [TCG_COND_GEU] = { OPC_VMSGTU_VI,   1, 16, true  },
>>   };
>> +/*
>> + * Return the element size at which VAL is a replicated simm5,
>> + * or -1 if there is none.  Used for vector logical ops, whose
>> + * VECE is not meaningful.
>> + */
>> +static int vec_logical_immediate_vece(int64_t val)
>> +{
>> +    for (int e = MO_8; e <= MO_64; e++) {
>> +        if (val == dup_const(e, val)) {
>> +            int64_t x = sextract64(val, 0, 8 << e);
>> +            return x >= -0x10 && x <= 0x0f ? e : -1;
>> +        }
>> +    }
>> +    g_assert_not_reached();
>> +}
> 
> This assert can trigger...

Bah.  No it can't.  Because of course val == dup_const(MO_64, val) is 
always true.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

