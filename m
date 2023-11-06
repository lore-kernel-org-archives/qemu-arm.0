Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2677524eja;
        Mon, 6 Nov 2023 03:06:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrtEle3XRdh0+i7i6ZkbeEaZZ/cPIMb+YVX7iETQYSYuthD964ZnJysh1dxF+dg2ZvsTy6
X-Received: by 2002:a05:6a20:2447:b0:134:2b31:e2a9 with SMTP id t7-20020a056a20244700b001342b31e2a9mr25752489pzc.0.1699268791514;
        Mon, 06 Nov 2023 03:06:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268791; cv=none;
        d=google.com; s=arc-20160816;
        b=nF0dOYCrW66WaLAskGxDeOHf9C9XzrQTipbcdM77zuXi2K3o1XSw219dxv/pI1hCR3
         6P5Tx2KeOfDPuZ8PMpBVY3VRLno4D/XgoY0YytcPbE7XOetq3hTU2nzHZR6tAsWAc3rL
         gfsgwH3yiLR/ommF0nqZm2871E8G8ZLv2DJO1qcGWbEgetTObE7rWSQ2OyTkMg8aUNLT
         bBRDI4uUGoBNVU4MKmYzS9lAv22z6wlPBJIkJF7PBu6VXf/e+43EaqTDRSaLfCdseTqG
         LiYnRZ2iHB7OtkURs6Fm+mzEjCTS+/c34WRSGmAzfcsQLuFT9aQ5S+bxu/K5iv8RXQ59
         H9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=9JKKmt1EY/kf3nircSCgd4NoTIWcG19r0u1T6OQDS20=;
        fh=sv0Y+dA/cU1Bgb/VBJogqin4Spf+R0vCWKmGl8Na7m0=;
        b=iiLRaYJwt33+6L4Ck3yv6yO6p/vVvUZfc2B8JG7DN0dsqDAwfNeCvwM2/0wsUrVD9S
         ZECk6AjDpBUCI/kMT/E46uMtbfgffwMFzPBWgxigch7dzTfciAjahn/HHkdx92ANvdfW
         YMe6kjCM/6rP8gqpEWZVkA5b99jeRYe4N04e6K6GbpvXy3xRqo6qjFnfi9JobrQCQfa5
         88MdoWOU2sRpnHhIa3gzwYvnTznGE3LUtPu+gwpiOv6iBx5RC5pd2s0L5xOXaAy0AlJE
         bGCBmpa0bm3UGJW1ULvGjiaF09k5KIninKsWCKk3jBKv/NV822pQ0tux8m16EhpaxUqj
         AnmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUm5LyCN;
       spf=pass (google.com: domain of kvm+bounces-692-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-692-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-692-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id kx15-20020a170902f94f00b001c624cbc92dsi7286187plb.296.2023.11.06.03.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:06:31 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-692-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eUm5LyCN;
       spf=pass (google.com: domain of kvm+bounces-692-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-692-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40E65B217F1
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB4D1EB2E;
	Mon,  6 Nov 2023 11:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eUm5LyCN"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72DA1EB29
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:06:24 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE95D6F
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:06:21 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-408002b5b9fso32364755e9.3
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268779; x=1699873579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JKKmt1EY/kf3nircSCgd4NoTIWcG19r0u1T6OQDS20=;
        b=eUm5LyCNRxVPPiU2LziOuhXPudnk3Oi1pkWbCTIF27q9oU6qxXl9Ai/F6pL7iMzfjW
         hAIp1mqlTkdHkLxG7ba2IV5mr+prZEXmdMRSeBS6D9D2vBC3EBW6v8l8YPWa6C2PI6n4
         0w2zBzkzEkVb0QHsw4Xn4KMLHKVbq+zE9w8ANPmq44py8pPl0NsMuVOT5KmKxMY3Gkud
         uHcuJ7wAE7Gty640Yrb8Eu2i9uDy4jvIlXaBn4ywsDfRvMBddiX7fjMFbZkqLsXvEu+I
         c/Z/VR13ytV7KhpxhaTIg+SuqnRbeIaMzW7I2zZtDsNOwhkWYPz7iI6c9ZhQRteJY4Pw
         nc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268779; x=1699873579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JKKmt1EY/kf3nircSCgd4NoTIWcG19r0u1T6OQDS20=;
        b=MXTDJCrpuQ97SZ3vfmUQIReQm+dnSNwr0R+OB6MF/2L4jXdNWG5ewrXnp2i/Hb2EGM
         +9ThdaeJhD7SAVjZDBj3brQp5DYD8SH4lN64UNHb7+0U1Zvg+iNpXxe5pjHdORk5C9ob
         KgM4BhxL5Vzyl6HZdXh7Ek8LZu4McAgH4UW78SlpiXjYd0I3X1on1/OSk/mJSvHhAWPK
         XPRCKgLkibO/59OsKzPMniAlUQlVkpMQjQU3GCJPOCAL+vz8o0iGRFnw9jw6WviaqXg4
         aVGK0XWV610/eLZXIQgqJ87dcbiEBEEluGa4cL5yYA+FKDjItyP77YJJq/0q4fOqbw/5
         URNA==
X-Gm-Message-State: AOJu0YxgEZH39Cz1+1tuiLpOd/Gy+Ha344eHorO1kC94R1NGI3Dqr5hT
	O4wjULQYPoD4Uv2YS2OpiURHJw==
X-Received: by 2002:a05:600c:1913:b0:409:351:873d with SMTP id j19-20020a05600c191300b004090351873dmr24821001wmq.31.1699268779697;
        Mon, 06 Nov 2023 03:06:19 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id e22-20020a05600c109600b0040523bef620sm5449491wmd.0.2023.11.06.03.06.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:06:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Roman Bolshakov <roman@roolebo.dev>,
	Zhao Liu <zhao1.liu@intel.com>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PULL 23/60] target/i386/hvf: Use x86_cpu in simulate_[rdmsr|wrmsr]()
Date: Mon,  6 Nov 2023 12:02:55 +0100
Message-ID: <20231106110336.358-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: n2MttemSqm6g

We already have 'x86_cpu = X86_CPU(cpu)'. Use the variable
instead of doing another QOM cast with X86_CPU().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Roman Bolshakov <roman@roolebo.dev>
Tested-by: Roman Bolshakov <roman@roolebo.dev>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20231009110239.66778-6-philmd@linaro.org>
---
 target/i386/hvf/x86_emu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index ccda568478..af1f205ecf 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -676,7 +676,7 @@ void simulate_rdmsr(struct CPUState *cpu)
         val = rdtscp() + rvmcs(cpu->accel->fd, VMCS_TSC_OFFSET);
         break;
     case MSR_IA32_APICBASE:
-        val = cpu_get_apic_base(X86_CPU(cpu)->apic_state);
+        val = cpu_get_apic_base(x86_cpu->apic_state);
         break;
     case MSR_IA32_UCODE_REV:
         val = x86_cpu->ucode_rev;
@@ -776,7 +776,7 @@ void simulate_wrmsr(struct CPUState *cpu)
     case MSR_IA32_TSC:
         break;
     case MSR_IA32_APICBASE:
-        cpu_set_apic_base(X86_CPU(cpu)->apic_state, data);
+        cpu_set_apic_base(x86_cpu->apic_state, data);
         break;
     case MSR_FSBASE:
         wvmcs(cpu->accel->fd, VMCS_GUEST_FS_BASE, data);
-- 
2.41.0

