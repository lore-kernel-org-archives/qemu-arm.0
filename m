Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4644842njc;
        Tue, 27 May 2025 00:34:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4oJpW0pRDfPkAG0sMzeXcYAFdq60nt9H8IYc5sMe7VChwyFcT6SUQHv1dqpLbXL5uyuMKRNTMroF19w==@linaro.org
X-Google-Smtp-Source: AGHT+IEzIR5WWiRbSlhqYB9t2ExacSzfe5tUWn0e/+Dfae73DqXd3Z2STkxXy3+uG3O9Hhl01NU6
X-Received: by 2002:a05:620a:1922:b0:7ce:cfa2:20e3 with SMTP id af79cd13be357-7ceecc26fbbmr1872025585a.44.1748331284695;
        Tue, 27 May 2025 00:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331284; cv=none;
        d=google.com; s=arc-20240605;
        b=aR/I2qLnkZ0Ou7uNOp7Tu/CpliEr1Tdk7ApsuchcdroeZd+RyeImYI/rB98nWtt6TZ
         rj9AVvJ+R0AB9Tma9Xhe/MZFx5AcesWWn/1ndjZWYruyz9HfdFndQ+CkrLlTrHxyWvoJ
         Eh0BXxHdThB2/Ex5pV0vj7Imvgghak7K8Ld0NdE6s2Jia9Gb0CE5IVL+NPrfFdyu4k+d
         JGLbLv91+uBn4dALzegLH+0akfz6HAKF45qPAVTC4EKzMVssHPvmQNTm0i5zjWTogRH9
         3KILvuyGK54veatj2f0xiDxKmEE2hoTDv3d/UbtRd3+BOD04wjRgPCaLan8onUkxApUf
         aLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Qtx6hs3oMoJyKfla6vTtXDeD5yxOX/zNXnxSsXN/A8A=;
        fh=KVSGnzQQZwPd/+6xI6Cb6Yl4oUXElZTO4emJe38Y6N4=;
        b=jdcSTHJDoL/d7cj02FAEKbskRLxFLAhq3BuWIYhzv19iH1PxfQKhGmmNRAm/jP+H5F
         qa6EthNzlIjcy4ftVg1daikLm24KM3rUI1vAl8XGkwauC/ZR9nS8yIBOFiWqKOjtPBN4
         BYI4uhd5LEFOqhP8S/Q0Y+3TmBntp/+zNKqL2Q8UzzEiJDFy8760C4KJTv1mOQSoDcyL
         08tyijhOOmDlwjiUiXVV9RMys2ZIvYgb73+D6WWSerAF4ISUVdF4seKqKtqlzDlkAxaW
         AStpKTdU3dch5MJY5dZbkOOHg7qRbej2VivIa93eAqSwefX9HG8+vpRqsuaIXEmpjMI/
         9UDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ynTAcDGZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd49607678si2672686185a.68.2025.05.27.00.34.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 May 2025 00:34:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ynTAcDGZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJoov-00022f-1S; Tue, 27 May 2025 03:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uJoot-00022U-7f
 for qemu-arm@nongnu.org; Tue, 27 May 2025 03:33:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uJoom-00077q-1K
 for qemu-arm@nongnu.org; Tue, 27 May 2025 03:33:54 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a3798794d3so3079892f8f.1
 for <qemu-arm@nongnu.org>; Tue, 27 May 2025 00:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748331224; x=1748936024; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qtx6hs3oMoJyKfla6vTtXDeD5yxOX/zNXnxSsXN/A8A=;
 b=ynTAcDGZ0jdRv+UdEuzf6Rp8AJ+j0LswnvZgiouzrHaWXNAIp9Bj4g9l+cvs8z/SYG
 bm5oiWP/m1mMcL1yao3qzQSewPYkG8M94OT5Po/B4I6WgvN5HstpkSjrR8wGOLggEpyQ
 EK8xdhxjAl8115c8zPTA78CU234a5Nfk94aRNnHyx4dge1rZpu+U6W8YZVHVbaI86qDs
 9C7s3LGN/LcV0+1PRqA++s7plc2wj29enDtSSFVaT7DOO0XkmJrz7zrFZOjOBhNmfAG5
 H3FQW8Jwpc6nbjypBWL7KhmgjjQue53Ez2WgegQkYTXU21z0BPLIOFPrnu7p8B4I8MyY
 ddzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748331224; x=1748936024;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qtx6hs3oMoJyKfla6vTtXDeD5yxOX/zNXnxSsXN/A8A=;
 b=GaAMkLLw3LEp/gY2+iLs8vhQ27OFFiF2LxA0QyHM0YJ9Z7JczWSVZS1iKQ1pzNREVq
 jTzEMjki160b/d1qdJG6Up1ZCRBObpX/FlC3kBQ9N1YPFDNoCRf00J73CezWmOKpIYoz
 V3hXxce0BoeOv3MZJv/pK52xjhTGnNdzUs+S9X2BiqYbUX7Ygv40nF4W7AvcWrN1VbSV
 uh5Po1rulRrVQ0FwuyQj3dhoc9tNWTezYdmLARcl0uIrLYbp6hP4h53y/YHPakGo/dPo
 2QrZQ41WiBsM2v0EHoyyJT7iIo/azuxR+ffxCGmQtHtQICd9dEHRbHcmNtQjQWg3mI1f
 TrBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXckCzBM4oRPv/UwU+lXrXBQtwH0T0LANIJHoKSKnCx4QKCG3wEzBNWV5n+VpIPZE+EDQUIVLXKhw==@nongnu.org
X-Gm-Message-State: AOJu0Yw0ya2IXOvm0rfwLvOVpTaYA4iebzGdvSpvcdoXd35IOUsJ4ccR
 GsWZ2nzKOtaojNl1nFcw8Ov8OpXyds7MvpRDUH7ea134UWixabQ9JRo3rDWWTotSsxWgIwJjvSF
 c/VK/EfFowg==
X-Gm-Gg: ASbGnctLLzj5PAswEuoc/Cde8LTfOakN1l2QENWhqG/n4T0NjrQQgepyHhFb14dHd9u
 lQp+CydzEt5zZ1TQ2VR1qANk5Eg2rzSMgbWz3oxLy6b7c6BIG+nhJaKCI/OsRa7rfMlpeKsxzXC
 RbpeAMdG/qbUeT+X5zhf9xFki+Pl69irzDKwk52PEWqZ/NwKq90D8e36/gg6+QFxijeb4QGMWUF
 mQbcrXCrkQHKSUlqFKcQfJVlRdUyuHDKWDtJwX5Xaa4moALSiY3xoen/J/r1gAWNqs7m5w1S7Sh
 m3sasMCXo6pXFtyVr/TBkv10AURfLIIPBcSi2vjNXOgTn1Pjg1GFrNhXVBjARZuh+Q==
X-Received: by 2002:a05:6000:2481:b0:3a4:d738:f98c with SMTP id
 ffacd0b85a97d-3a4d738fb73mr4772965f8f.30.1748331223820; 
 Tue, 27 May 2025 00:33:43 -0700 (PDT)
Received: from [172.16.25.47] ([195.53.115.74])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4d47c0684sm6706179f8f.44.2025.05.27.00.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 00:33:43 -0700 (PDT)
Message-ID: <ae9e0a75-bafe-4d66-a8f2-9c3371315279@linaro.org>
Date: Tue, 27 May 2025 08:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] target/arm: Fill in TCGCPUOps.pointer_wrap
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: foss@percivaleng.com, qemu-arm@nongnu.org,
 Gustavo Romero <gustavo.romero@linaro.org>
References: <20250504205714.3432096-1-richard.henderson@linaro.org>
 <20250504205714.3432096-5-richard.henderson@linaro.org>
 <e8176be8-dbe9-4cf4-a23c-a6100d530c0b@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e8176be8-dbe9-4cf4-a23c-a6100d530c0b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OhXoNfrHt5im

On 5/26/25 19:21, Philippe Mathieu-Daudé wrote:
> +Gustavo
> 
> On 4/5/25 22:57, Richard Henderson wrote:
>> For a-profile, check A32 vs A64 state.
>> For m-profile, use cpu_pointer_wrap_uint32.
>>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.c         | 24 ++++++++++++++++++++++++
>>   target/arm/tcg/cpu-v7m.c |  1 +
>>   2 files changed, 25 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 45cb6fd7ee..18edcf49c6 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -2710,6 +2710,29 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
>>   #endif
>>   #ifdef CONFIG_TCG
>> +#ifndef CONFIG_USER_ONLY
>> +static vaddr aprofile_pointer_wrap(CPUState *cs, int mmu_idx,
>> +                                   vaddr result, vaddr base)
>> +{
>> +    /*
>> +     * The Stage2 and Phys indexes are only used for ptw on arm32,
>> +     * and all pte's are aligned, so we never produce a wrap for these.
>> +     * Double check that we're not truncating a 40-bit physical address.
>> +     */
>> +    assert((unsigned)mmu_idx < (ARMMMUIdx_Stage2_S & ARM_MMU_IDX_COREIDX_MASK));
>> +
>> +    if (!is_a64(cpu_env(cs))) {
>> +        return (uint32_t)result;
>> +    }
>> +
>> +    /*
>> +     * TODO: For FEAT_CPA2, decide how to we want to resolve
>> +     * Unpredictable_CPACHECK in AddressIncrement.
>> +     */
>> +    return result;
>> +}
>> +#endif /* !CONFIG_USER_ONLY */
>> +
>>   static const TCGCPUOps arm_tcg_ops = {
>>       .mttcg_supported = true,
>>       /* ARM processors have a weak memory model */
>> @@ -2729,6 +2752,7 @@ static const TCGCPUOps arm_tcg_ops = {
>>       .untagged_addr = aarch64_untagged_addr,
>>   #else
>>       .tlb_fill_align = arm_cpu_tlb_fill_align,
>> +    .pointer_wrap = aprofile_pointer_wrap,
> 
> IIUC this is also used by non A-profiles (R-profiles and
> non Cortex cores).

Yes, r-profile is mostly a-profile.  Those non-cortex cores are also a-profile: armv[456].

The point is the separation between m-profile and not. In particular, the mmu indexes are 
different between A and M (see ARM_MMU_IDX_TYPE_MASK). The assert would not be valid for 
m-profile. We can avoid a check vs ARM_FEATURE_M by only using this function for 
not-m-profile.


r~
