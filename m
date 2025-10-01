Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D13CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 21:34:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v44T5-0003Lv-5a; Wed, 01 Oct 2025 17:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v44T1-0003Lc-RZ
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 17:34:31 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v44Ss-0001po-8T
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 17:34:31 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-781206cce18so325378b3a.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 14:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759354451; x=1759959251; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YPpeJ5YIUX5lKd84GGk7FsGv1OwuRD3RC23LCRsYslg=;
 b=sIEeeNvcyKzcCV0CnRdzq8Zr1kN2YMUKYFF7V9UOvnyYkAFzygBrYWkpCHpMqAAoqG
 jVEUYVxH2Gea8gDyEAHxu1kG3nu36a8YN9JEwOUnXQ9d9pXynTxL5lTnJtf4yr4eIAuk
 ySoZMezSv38LmNh3CNkrhY8x2pAFBMbXGbrlOUuGz8Eszz5JtMADWPHdFqNwJebXIHsw
 8/dNRFWZ9ioV1oXZyoMnOdEnA8HpLHqwzImTVxgHfDc6cJNoWt0l97uX5uLTrHgmUvBU
 sj9b8aa7HZNB6ByHAmB4g0mv486eQ75WgffLs5NjPt74NQXronLqDtlDL9L86o7AK/bs
 0HBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759354451; x=1759959251;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YPpeJ5YIUX5lKd84GGk7FsGv1OwuRD3RC23LCRsYslg=;
 b=uXTEUobXdnlLTbI/JcGQzXfMvBCrYt0Y7hEAXuYqzt/bn1+MMGrBoGZxaGksUbLbcF
 X/5OgqqXFbpl64rY1W4Y0gIFJZ/O/gLaoEIZ3ERoPvo0o/oo98N1PWkfWz8Q7rp9SYWB
 idROixk/hDEItd2+e05EFGySrLl4WelY99kp0QdCfBoLnu5EJWqUIEZGADqTySVTBtk2
 WaxvpguVQc37IWU/t1yq2h8ZPLMPxr8kiczK00Uf19guFJI0jUhBwHHqjUzNlvY+bCIU
 JQj0DqC98wZ3oDPwmn5Unyxk8xFmeL0ZhGNAE0Vo57f8cWeyTcrLDcEZu26inR6yEQR+
 MEbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI8SFAkp5tKRVM+/HUOrQtWy0jzHS7ICXBrCoHRhX5T5Fw72hto5+78ziTEsG/m5+HxqfN6or9yA==@nongnu.org
X-Gm-Message-State: AOJu0Yy5tM3W3pew2t2DtizypWzxMGkN0GDBqVCdNK+TJHI7n9GLilL0
 X74xbkutx8BNKAZ2voJf9JQl+d4pH0nLec3R09umBgiECLjxbyHRZC3JrlT+EAeFPLw=
X-Gm-Gg: ASbGncsOIIERSPSeog1bCXAxtmjbfUnRL4FjWYyY1KBDjUvpTLqxUJgNuXWyPnmEbwn
 ckK6lAwrhhFJUNrZWmVZkzhpPaB8xBAldY16U7qxtH/f9YaQqjt087AwWr48BVm5YRNQIgT5ch+
 Hah+nkFPMiNxTPR1NHmwMZ2jUbiTLlwerkR8dFayM1HMOUNoXHtlZ2+GnSTNI/EKjdBB5/C1zCV
 qEn4iYZWdj2Fx2VAnzcNQmWrw0QBZlS8jPsV8IP0Ef9zRkhzGIh/wHGPjbTLYdpj5/Bpg7wh9uU
 izf+5iiqDsZL0Z4ET/Ilc2UQs6t3cYDfMlK2QS4EvMLPTtw4aPV7v2vCGkZAqvGSr9EgugJhI73
 Trpi8No8WZ+nzjVzHffgkCgX9GX1bohVWyaPbycn1XsfomrdUb7/4ijVk2yqeeE0NIvA8Uuk=
X-Google-Smtp-Source: AGHT+IFeKUoK3R+qASWhDW73rWaM4aVikiRMkfhXcS9n0gBsMDEFy8jIWSEV5l8tze8HekerhEN2Ng==
X-Received: by 2002:a05:6a20:12d6:b0:2cf:afc1:cc3c with SMTP id
 adf61e73a8af0-32a22b27964mr1201636637.16.1759354450648; 
 Wed, 01 Oct 2025 14:34:10 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02094847sm607279b3a.89.2025.10.01.14.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 14:34:10 -0700 (PDT)
Message-ID: <60631203-626f-4628-8a40-226bd45d1c8e@linaro.org>
Date: Wed, 1 Oct 2025 14:34:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V6 24/24] tcg: Defer TB flush for 'lazy realized'
 vCPUs on first region alloc
To: salil.mehta@opnsrc.net, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com
References: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
 <20251001010127.3092631-25-salil.mehta@opnsrc.net>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251001010127.3092631-25-salil.mehta@opnsrc.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 9/30/25 18:01, salil.mehta@opnsrc.net wrote:
> From: Salil Mehta <salil.mehta@huawei.com>
> 
> The TCG code cache is split into regions shared by vCPUs under MTTCG. For
> cold-boot (early realized) vCPUs, regions are sized/allocated during bring-up.
> However, when a vCPU is *lazy_realized* (administratively "disabled" at boot
> and realized later on demand), its TCGContext may fail the very first code
> region allocation if the shared TB cache is saturated by already-running
> vCPUs.
> 
> Flushing the TB cache is the right remediation, but `tb_flush()` must be
> performed from the safe execution context (cpu_exec_loop()/tb_gen_code()).
> This patch wires a deferred flush:
> 
>    * In `tcg_region_initial_alloc__locked()`, treat an initial allocation
>      failure for a lazily realized vCPU as non-fatal: set `s->tbflush_pend`
>      and return.
> 
>    * In `tcg_tb_alloc()`, if `s->tbflush_pend` is observed, clear it and
>      return NULL so the caller performs a synchronous `tb_flush()` and then
>      retries allocation.
> 
> This avoids hangs observed when a newly realized vCPU cannot obtain its first
> region under TB-cache pressure, while keeping the flush at a safe point.
> 
> No change for cold-boot vCPUs and when accel ops is KVM.
> 
> In earlier series, this patch was with below named,
> 'tcg: Update tcg_register_thread() leg to handle region alloc for hotplugged vCPU'


I don't see why you need two different booleans for this. 	
It seems to me that you could create the cpu in a state for which the first call to 
tcg_tb_alloc() sees highwater state, and everything after that happens per usual 
allocating a new region, and possibly flushing the full buffer.

What is the testcase for this?


r~

