Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1161283njm;
        Wed, 5 Mar 2025 16:06:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVMEueHIWo4aUpxLfGYK99ET5EFQ0/l9oJlin5AZ5ZX+f3/7+I9vrWOX3Oii1l3gDcDcOJSTPbcy2BrJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IErv5hik40sPsotKaurPcT690/79vi1xTvDsPBvJdP4C9bNh7yHfnSdSW+KOumy4hZNEQvB
X-Received: by 2002:a05:6214:29ee:b0:6e4:4484:f357 with SMTP id 6a1803df08f44-6e8e6d47ce4mr63433716d6.30.1741219586344;
        Wed, 05 Mar 2025 16:06:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741219586; cv=none;
        d=google.com; s=arc-20240605;
        b=YB/8xKXvwX8DVAZvnKuMQsOQ+w2ypjJfhHIthqrYASUGkh6oWjjLu74mFzOuT+8nJI
         CgZ+Ka7+HRLO1jwvHyuSWEOE+yju8Uz26f1OHCTlTA28qvTjvphucJN13EjvTccchPRq
         62V88WhSmsMtHOFcCPKlECrJLBPeXR8uIUfEiTtETOjAsgx6y29/YSe01j+/FwyQPxN4
         zBoEUcY/E3dElX2hZ4kHjIRUGSDhPTY03t6AUEqrcYTar00FrIQ/P3S9beyysOQy5gWJ
         HQdwdUrLLSbfo2V72xBgqQ8h40dgkO7a1bShlfF4OePVxWuVNdc6iE8eqyFiI7VUfNiw
         JtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :message-id:mime-version:in-reply-to:date:dkim-signature;
        bh=uNu3P7y19nGx7rFiXxP9tYKmxh/Cdz8S4IOkXEmb16s=;
        fh=Nd5PWEqJgTYncpO0MNkGhtORp2olJ5vP/ivOE5csnr4=;
        b=KjgVlrLu8eAA5Bh5Qg2hS4eJNW9+h1pkokW28OgLziWZXwbgk+PAOClaYCPsnE0sT/
         W483VgFG4gZye57FeoiKny7L7e/hfYc/wbp/8zNRJFMhU1KVXlmBiJtfqxpYFSukffi1
         dWo0itIK9XLbJJyQXE/Km8F/Us3Yi2T0FOMdmNKbsgcN7Od6pn4wPwEctKvf2Z/BO1HB
         fpfdRzzpjPMg2G5DPQs8SpyESGWL5gRcygc9y09loIQqiEV5h6FHbXEw8wEdq0Fit5XP
         /j7Zpegz3kLKNPPJQ3BTBSw3mVv+g74Lyo6TGbM54WIvxiAJKLg0jt3a1RdUrHVkGREY
         MJSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20230601 header.b=SMtlxTCA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db3f5afsi1019011cf.539.2025.03.05.16.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 16:06:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20230601 header.b=SMtlxTCA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpykb-0007T4-E8; Wed, 05 Mar 2025 19:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <36ubIZwwKCCEK78FEBPQBC7KDLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--nabihestefan.bounces.google.com>)
 id 1tpykY-0007SM-Lk
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 19:06:06 -0500
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <36ubIZwwKCCEK78FEBPQBC7KDLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--nabihestefan.bounces.google.com>)
 id 1tpykW-0006q7-Sl
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 19:06:06 -0500
Received: by mail-oa1-x4a.google.com with SMTP id
 586e51a60fabf-2a7d6283167so30415fac.0
 for <qemu-arm@nongnu.org>; Wed, 05 Mar 2025 16:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1741219562; x=1741824362; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uNu3P7y19nGx7rFiXxP9tYKmxh/Cdz8S4IOkXEmb16s=;
 b=SMtlxTCAswEMybGTCbz7/bpNhraiRqVhKephyXl4jrxJd/VcL7QRqPGGPvHh8BSl2r
 VK5qzR0utu9IzhjsGnFTQpmWdFeAQOeVC94hXYXW0Ta9YDEkrSIX7pKxQxGSm/sy7USv
 B2vZYVp5NJxXt1cXfK+mF8APt/kbNijoNyUd3YKdFz38USL9frxQ55XmmCNX7KCneGDx
 ZTOvTTqy5Qy2ybBct2tW4HMMr90c91xw33kg4hqDb/b/fPaPSLh2K4aeerr2NEqq6+YB
 YouE3YAmDT1m6VKnnSyvr/A8slB99V5BBx9fUQVSbET2ZWczecl+/+/IIzvmuPgBkonX
 v3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741219562; x=1741824362;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uNu3P7y19nGx7rFiXxP9tYKmxh/Cdz8S4IOkXEmb16s=;
 b=hU+P1EsNbut9URG/Km1F6MIrXeaPsDLQ3qDbhnLg8WT/vqO0B01zMxsepNN23+4nQ4
 ArjZ7PB9A6n8A2/Kky+zA64LDIlo4zjjibJvVz+eUtgPj2sUFUrhKAet87tENv7hczaL
 vsOQKNax1RQq5TxeneOUD3XjqLOVd/RGvD4CW+2Z9QxpMuShcNWdkj5iBVie2Xj+vJ8o
 yDSolSnkpbJroyYvimfKuU3jwt5HqQMZsbRjvXcvOXAQMffV/pPm0fSmin68ZExWdQsM
 vC47rSU66Cb9IJRABq2wCtMbua07xTMulX3L+7mECZCXxcRtEGHPhydrkUSvt2GUvPNU
 4lDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPxo27SVFMznkbVZmfqzfKMBkk7YzuUAsgGCqI/9RGtp+9ySReyJltSs/vW9ki4hulxZgkq/dFvQ==@nongnu.org
X-Gm-Message-State: AOJu0YyEHjAyfzl09GbvpHUeW1wvZwN9Yddg6m8mwZUNRfGGgzA3Zq9U
 8f/haCLF7j3HXdUMAHLdWriR2m72GlMQbK+KLfonSmy+N3HYjJ8Omw72u+xYYcSjpro/Fsq+m4E
 UJUw0Vu3+9STxXOt3QXsAd0gCvQ==
X-Received: from oabxa2.prod.google.com ([2002:a05:6870:7f02:b0:29e:6524:e13e])
 (user=nabihestefan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6871:e409:b0:297:2763:18d4 with SMTP id
 586e51a60fabf-2c21c96650emr2657319fac.15.1741219562108; 
 Wed, 05 Mar 2025 16:06:02 -0800 (PST)
Date: Thu,  6 Mar 2025 00:05:57 +0000
In-Reply-To: <20250304064710.2128993-3-jamin_lin@aspeedtech.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306000557.2092401-1-nabihestefan@google.com>
Subject: Re: [v5, 2/6] hw/misc/aspeed_scu: Fix the revision ID cannot be set in
 the SOC layer for AST2700
To: jamin_lin@aspeedtech.com
Cc: "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::4a;
 envelope-from=36ubIZwwKCCEK78FEBPQBC7KDLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--nabihestefan.bounces.google.com;
 helo=mail-oa1-x4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Reply-to:  Nabih Estefan <nabihestefan@google.com>
From:  Nabih Estefan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KzZnz8+1e1LD

> According to the design of the AST2600, it has a Silicon Revision ID Register,
> specifically SCU004 and SCU014, to set the Revision ID for the AST2600.
> For the AST2600 A3, SCU004 is set to 0x05030303 and SCU014 is set to 0x05030303.
> In the "aspeed_ast2600_scu_reset" function, the hardcoded value
> "AST2600_A3_SILICON_REV" is set in SCU004, and "s->silicon_rev" is set in
> SCU014. The value of "s->silicon_rev" is set by the SOC layer via the
> "silicon-rev" property.
> 
> However, the design of the AST2700 is different. There are two SCU controllers:
> SCU0 (CPU Die) and SCU1 (IO Die). In the AST2700, the firmware reads the SCU
> Silicon Revision ID register (SCU0_000) and the SCUIO Silicon Revision ID
> register (SCU1_000), combining them into a single 64-bit value.
> 
> The upper 32 bits represent the SCUIO, while the lower 32 bits correspond to the
> SCU. For example, the AST2700-A1 revision is represented as 0x0601010306010103.
> SCUIO_000 occupies bits [63:32] with a value of 0x06010103 and SCU_000 occupies
> bits [31:0] with a value of 0x06010103.
> 
> Reference:
> https://github.com/AspeedTech-BMC/u-boot/blob/aspeed-master-v2023.10/arch/arm/mach-aspeed/ast2700/cpu-info.c
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Tested-by: Nabih Estefan <nabihestefan@google.com>

Thanks,
Nabih

> ---
>  hw/misc/aspeed_scu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 50f74fbabd..545d004749 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -910,7 +910,6 @@ static const MemoryRegionOps aspeed_ast2700_scu_ops = {
>  };
>  
>  static const uint32_t ast2700_a0_resets[ASPEED_AST2700_SCU_NR_REGS] = {
> -    [AST2700_SILICON_REV]           = AST2700_A0_SILICON_REV,
>      [AST2700_HW_STRAP1]             = 0x00000800,
>      [AST2700_HW_STRAP1_CLR]         = 0xFFF0FFF0,
>      [AST2700_HW_STRAP1_LOCK]        = 0x00000FFF,
> @@ -940,6 +939,7 @@ static void aspeed_ast2700_scu_reset(DeviceState *dev)
>      AspeedSCUClass *asc = ASPEED_SCU_GET_CLASS(dev);
>  
>      memcpy(s->regs, asc->resets, asc->nr_regs * 4);
> +    s->regs[AST2700_SILICON_REV] = s->silicon_rev;
>  }
>  
>  static void aspeed_2700_scu_class_init(ObjectClass *klass, void *data)
> @@ -1032,7 +1032,6 @@ static const MemoryRegionOps aspeed_ast2700_scuio_ops = {
>  };
>  
>  static const uint32_t ast2700_a0_resets_io[ASPEED_AST2700_SCU_NR_REGS] = {
> -    [AST2700_SILICON_REV]               = 0x06000003,
>      [AST2700_HW_STRAP1]                 = 0x00000504,
>      [AST2700_HW_STRAP1_CLR]             = 0xFFF0FFF0,
>      [AST2700_HW_STRAP1_LOCK]            = 0x00000FFF,
> 
