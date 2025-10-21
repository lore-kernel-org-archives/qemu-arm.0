Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E08CCD1A5
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 07:53:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vB7BT-0002z8-6a; Tue, 21 Oct 2025 03:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vB7BS-0002z0-0j
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 03:53:30 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vB7BP-0002o3-Sh
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 03:53:29 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso40125585e9.0
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 00:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761033200; x=1761638000; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4XSzm0wfUSA4CIUhFWciPqUNrYgEsNDDhSIDvvR9MXA=;
 b=B9n2DoaafE7jElxj45XyA0gXigsHAqsUSGiFk/h5KjYht/0SVsoQBM80CwVNNy4DZG
 umu9wDczD8wn1GRYlWdFZEHKmEAEHg4rLz7efspCQSW4zBCOr3QXe8yBb5EgDbjZ9kDs
 cFk6o+DNkm8VzY9UyTJTvfDidVyNHVdkIg4ya90d8QlVmm6H8YmNpeVtvrkdLWEwFeWr
 I5ta9EaxHEorRaqkRv+T+4AbFY1kNjtxQKNR+gAKCAtFt7E09XVNiX8YtwEsRFUHT7ao
 3cNt5XYNdmmVYJy+VP/T9V9hFVdPFq+CQ6l1ZLiWaaY2ZQ0ETwv1GA0DS/sLN6YzqLXY
 Y8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761033200; x=1761638000;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4XSzm0wfUSA4CIUhFWciPqUNrYgEsNDDhSIDvvR9MXA=;
 b=PKsm5EZyzYAzizLvbvsuJpVXvgxa5EhWFbp0dWZ+C/QSIoCkEQLWPLaRhwP5eNpiuQ
 QeiNBROTnBMOSD/uWG8BnOX9OcFJfhlsuUGMsHG3/XBWdg2l3u3XSfhbteHYjHtfC6+r
 b9uO8hJjk0G0C3RqjHmBhEGsZp4bvNGsIPE/SL8EEko4j/8YQU/Lq7VWPm3dEclqHgDD
 b2wmMro/cVhOFqO5VpXalRHIbtPdrUKzpPupim9EaIT2dzIFa22ciOe0ZK/YZpqZLLE1
 39AfqYdMIiNDgoFDb8wNk6BCiG4Qn+aM29v7swp4+5keHYS3EaNk7lhhRBJnFWlVYKYa
 3xqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfyggDgAzbLFt3r2JNsIUaV0etXzFjTTKS46RZBuOaUZJswsHoEyiibLciq+HhKEVUYU5oPBl29w==@nongnu.org
X-Gm-Message-State: AOJu0YxGo/YWGv94WvqQEh4+8lcRud9XwdAKIYs6MMzfyAhVGmFudFjq
 YKCFqKWAs+L8qIJEFt1Zo1hyjzqY2ZvyUzp8mb2s/jicRxLE4VVodgPaHhj1qmZpc45fOCjejJP
 Kk8NvHrU=
X-Gm-Gg: ASbGncsgQohKalg5b3V/bMEYqUk9016LGCsag+ZIIvjr68rpHpS9Pk0SEGSFyXdZLY1
 DXH86hfjvcrrpzSop1x1YH90ANzTmg6H/se07+sk4EfCriRu0Dya4o18xmYRsP8lrrh7kYCth2w
 AwHYAiPL3Ab2EBeDJhNonJv1P1YWAD3ScfTf81IdxDKQO3DeryTh1HU/sCeCzRnlWdbhytqp/B4
 r8xG1EtUZDHl9w9wC52dHWt8fqmit4yP/lJUpApeujEjULpKROAtCzX/V3yoI+nS5HZQf7roVpR
 E18Lu0jck4WWELqO7Ce3seVp8Eg37W1GroUR0O4QWfU8BM/5PApVa/1OapCIxP41taLc4BdICOT
 Xjp9KEFZxa6eOpxLOvVbj+LBFi6bYY3djRBjgA7xCtlJ/o6W//BUO4x3qDRJ9MpYz+F6jayoGYM
 1HzyTpNAEQUld4NaHdPyqwe/VYqHkJN7JnMgptBR39LkWcrZHBJzgv7Q==
X-Google-Smtp-Source: AGHT+IGE/vHKF0Erfc5wVRVZkuf2QIZN0tTKp1Pxq4T4C2tMAQMK2l5Jk6432IoFNv1goONmMlkQVQ==
X-Received: by 2002:a05:6000:4285:b0:3eb:9447:b97a with SMTP id
 ffacd0b85a97d-42704dab1e2mr10803396f8f.54.1761033200022; 
 Tue, 21 Oct 2025 00:53:20 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471553f8a3asm212347275e9.16.2025.10.21.00.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 00:53:19 -0700 (PDT)
Message-ID: <60f2024e-324e-4856-952b-59ededfb2468@linaro.org>
Date: Tue, 21 Oct 2025 09:53:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/30] qemu/target-info: Add target_base_arch()
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org
References: <20251020220941.65269-1-philmd@linaro.org>
 <20251020221508.67413-4-philmd@linaro.org>
 <bc03818e-d76a-4301-931a-058f21bb6847@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <bc03818e-d76a-4301-931a-058f21bb6847@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 21/10/25 01:15, Pierrick Bouvier wrote:
> On 2025-10-20 15:14, Philippe Mathieu-Daudé wrote:
>> When multiple QEMU targets are variants (word size, endianness)
>> of the same base architecture, target_base_arch() returns this
>> base. For example, for the Aarch64 target it will return
>> SYS_EMU_TARGET_ARM as common base.
>>
> 
> I'm not sure that reusing semantic on a subset of this enum is the best 
> idea, so many things can go wrong.
> 
> More widely, I don't know where we would need to access this, versus 
> specific functions like target_base_arm().
> If a code needs to check various base archs target_base_*, or it can use 
> a switch with all variants.

Yeah, good point. I'll just drop this single patch.

> 
> If we really want to have this target_base concept, at least it deserves 
> it's own enum, separate from SYS_EMU_TARGET.
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/qemu/target-info-impl.h |  2 ++
>>   include/qemu/target-info-qapi.h |  7 +++++++
>>   target-info-stub.c              |  1 +
>>   target-info.c                   | 10 ++++++++++
>>   4 files changed, 20 insertions(+)
>>
>> diff --git a/include/qemu/target-info-impl.h b/include/qemu/target- 
>> info-impl.h
>> index e446585bf53..2c171f8359b 100644
>> --- a/include/qemu/target-info-impl.h
>> +++ b/include/qemu/target-info-impl.h
>> @@ -17,6 +17,8 @@ typedef struct TargetInfo {
>>       const char *target_name;
>>       /* related to TARGET_ARCH definition */
>>       SysEmuTarget target_arch;
>> +    /* related to TARGET_BASE_ARCH definition (target/${base_arch}/ 
>> path) */
>> +    SysEmuTarget target_base_arch;
>>       /* runtime equivalent of TARGET_LONG_BITS definition */
>>       unsigned long_bits;
>>       /* runtime equivalent of CPU_RESOLVING_TYPE definition */
>> diff --git a/include/qemu/target-info-qapi.h b/include/qemu/target- 
>> info-qapi.h
>> index d5ce0523238..65ed4ca8eea 100644
>> --- a/include/qemu/target-info-qapi.h
>> +++ b/include/qemu/target-info-qapi.h
>> @@ -19,6 +19,13 @@
>>    */
>>   SysEmuTarget target_arch(void);
>> +/**
>> + * target_base_arch:
>> + *
>> + * Returns: QAPI SysEmuTarget enum (i.e. SYS_EMU_TARGET_I386).
>> + */
>> +SysEmuTarget target_base_arch(void);
>> +
>>   /**
>>    * target_endian_mode:
>>    *
>> diff --git a/target-info-stub.c b/target-info-stub.c
>> index d96d8249c1d..d2cfca1b4c2 100644
>> --- a/target-info-stub.c
>> +++ b/target-info-stub.c
>> @@ -19,6 +19,7 @@ QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != 
>> sizeof(CPUState));
>>   static const TargetInfo target_info_stub = {
>>       .target_name = TARGET_NAME,
>>       .target_arch = SYS_EMU_TARGET__MAX,
>> +    .target_base_arch = SYS_EMU_TARGET__MAX,
> 
> And nothing can enforce base and arch match by design, which is a 
> problem IMHO.
> 
>>       .long_bits = TARGET_LONG_BITS,
>>       .cpu_type = CPU_RESOLVING_TYPE,
>>       .machine_typename = TYPE_MACHINE,
>> diff --git a/target-info.c b/target-info.c
>> index e567cb4c40a..332198e40a2 100644
>> --- a/target-info.c
>> +++ b/target-info.c
>> @@ -33,6 +33,16 @@ SysEmuTarget target_arch(void)
>>       return arch;
>>   }
>> +SysEmuTarget target_base_arch(void)
>> +{
>> +    SysEmuTarget base_arch = target_info()->target_base_arch;
>> +
>> +    if (base_arch == SYS_EMU_TARGET__MAX) {
>> +        base_arch = target_arch();
>> +    }
>> +    return base_arch;
> 
> More confusing, we can eventually return a non base arch if base arch 
> was not correctly set above.
> 
>> +}
>> +
>>   const char *target_cpu_type(void)
>>   {
>>       return target_info()->cpu_type;


