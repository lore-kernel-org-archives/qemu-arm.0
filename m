Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E82FAD3E7
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 02:14:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFjZb-0007qb-MW; Wed, 22 Apr 2026 22:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFjZG-0007o3-Lq
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:13:31 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFjZE-0005XX-3d
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:13:26 -0400
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-50d6b9bca48so4038121cf.2
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 19:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776910402; x=1777515202; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TVOMlgTKwLmNpS1Od8/7xYLdhQ4uz2+MNbY8Tp1Oaj8=;
 b=SzdepP6vAzNLSLmi4/+8ajgs3cqdJTl2cE0dsF5QmJDqfnE4v6A3MiIU9fIM7gSMld
 9HpWdLyEsGlAZo8KVKe0kFIxcv7Vun83Z+iwbBrYQ+IZ7zFah2p1GuwTFB7tkbdHzeIG
 bo2amO/6Z0Oyj6neKErVLGFy72RAjMEBnnet+c+gQQOiVStARhaGopn7+PS0mAelRuQW
 +/USDzdTGJ8MXJdnKtIEUOO+kaXIPzduCOg1mzYOSKzcMzyoXzoxICr1A3jnj5pXiqh1
 u5O14XnfGOlznEX12oTBsTWqgu9n43N1TlW3L6YORw1a7Y/mm2CiOEr05o2E3T0b60Y6
 JW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776910402; x=1777515202;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TVOMlgTKwLmNpS1Od8/7xYLdhQ4uz2+MNbY8Tp1Oaj8=;
 b=fn38P3H3YfEyNPkGAg9b/74B1toz9yVFdfR2UlPwIyirBEQOjOh/gbVSX5uYrIXdt7
 K8KfaMikP8jw0D4rJh4M+ANnXR4sMgILA4vRgOunddM88FEJpqxcN6v84QKR58rQyi2N
 t1CL5aU18RXO7oUiCxnroxFc2KHxmk40I9//NkYGazyGQK/IABTGDDWkiQg0Fahwx3UQ
 CY0H/dGV3QN7cvxFb4QbLAU5JOrpYuKO5S5qMGtYQpG2R+aorrpKXtsvbmi7Ejq9ijnP
 DfiQI3effyrxkmlKEZVO1NtIbte8tyCn/FzoR3U4f1Ys6gFyRg9H/Bs56u/9DSJEpZo2
 /czQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+lUen9IHQYJ6SZ086lxFqIPObuDhg1lvU7PYchqf1Rt10nP5nCx2N6sqbK74/u7zXBSsgVFOKASw==@nongnu.org
X-Gm-Message-State: AOJu0YyqQVgSXzQVbFc7aEiY6rVb7Ez+jvCPHpsV2Ldm99g0KjKLhWWm
 AR7cyB7F1jBKoaNp8kz2M9AGynw6PegPCSR1isVGeb811yXAis6pE/2yMdQhEgoutFM=
X-Gm-Gg: AeBDieuCyk/iBOKQL9awRudRuLUaPOaHrkB2h3kZVr8mw5mdk//UgDxepjKZuFHS7V2
 aMVLarZJVimwZ/JB29hUS+Hj3BfT9/+undAWIUFypDA6wG3obBJ3sr6t501n4o4spDR9xUhuABl
 bE7UF8sdgTscI0M6q/NFzE8S0Q9phdau+UQW/6bMM5bagcYCr9YjKf+LQhl8+KCZHK/9ofSPLIc
 LJ6SyylJ05/UcOLWJF+ULHos0xtikjDqk09LbVWN3Y2jNnrJAOv4Agu9pvq44jktuBEzWmexVi5
 VuI+8/WlYt6af4AhoIZpkTMt0Kr04V74IBLMWylPwLMMRSqKyjwr+1EgxqUMhrOjCQOPE5zqy3O
 CUMFcIyVMza21cNWJr2/4jQ/ByuWucDNa0pd5Br6n7/+nhjxx4cTqJ3K3CSYWAtx3UD4srqckXD
 ghWUKsUy0HPL9O5NM4JBCKMzhL5GRgWUn4GAD1mnO53H3Cc3vAhs1JQQMWFft8odH9CWCWXwKkL
 iU6LjdS2nDKSKmjHIo8xsoqlGsW
X-Received: by 2002:a05:622a:1812:b0:50f:bc35:ac0 with SMTP id
 d75a77b69052e-50fbc350e4amr118429931cf.30.1776910402087; 
 Wed, 22 Apr 2026 19:13:22 -0700 (PDT)
Received: from [10.72.56.227] ([172.59.184.224])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50e39487921sm145477261cf.24.2026.04.22.19.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 19:13:21 -0700 (PDT)
Message-ID: <5e7013b4-8879-4db9-bbc1-71922371276c@linaro.org>
Date: Thu, 23 Apr 2026 12:13:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] target/riscv: Make get_phys_page_debug handle
 non-page-aligned addrs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417173105.1648172-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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

On 4/18/26 03:30, Peter Maydell wrote:
> Currently our implementations ofSysemuCPUOps::get_phys_page_debug
> andSysemuCPUOps::get_phys_page_attrs_debug are a mix of "accepts a
> non-page-aligned virtual address and returns the corresponding
> non-page-aligned physical address" and "only returns a page-aligned
> physical address".  This is awkward for callsites, which in practice
> all want the physical address for an arbitrary virtual address and
> have to work around the possibility of getting a page-aligned
> address, and it doesn't account for protection being possibly on a
> sub-page-sized granularity.  We want to standardize on the
> implementation having to handle non-page-aligned addresses.
> 
> The only thing in the riscv implementation that we need to fix
> is the place where we explicitly round the return value down to
> a page boundary before returning it. Drop that.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/riscv/cpu_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

