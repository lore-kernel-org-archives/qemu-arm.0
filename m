Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp1023663ejb;
        Fri, 1 Dec 2023 06:32:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu34opK9Pt88bF2mrcEUw+AvqPKOkMJkG8rnNlN9X1/YFnp0qmZMU5AxSV4oYXfVpKcqhU
X-Received: by 2002:a05:6a00:1d0d:b0:6cd:fa15:8d86 with SMTP id a13-20020a056a001d0d00b006cdfa158d86mr4118874pfx.2.1701441136824;
        Fri, 01 Dec 2023 06:32:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701441136; cv=none;
        d=google.com; s=arc-20160816;
        b=gabU8UeIrKKurq4FvD1hdKVmV+uhFFCYE8qH5wSvZie9nqP3fsJRVm7+PfJ1A9Dj1g
         iaL2VSGNkXYCP5o04aMvmK2bo/Np+4JaJ/yb4Gfm4GMjRa21l5utm9BO2KRxaY8SazT8
         /HyfBX8HnT2i/O5vAkUjCAC7cQYuHO7owPYV1J7V8mQC4qUr7lVAayjwsx6+E0dNJ8rV
         mAfZLTJkkRhkr12WrEmKkxGeDo+pFm1AQgZvbaoGpW5WKSeg1ewhXy2nbCHduCPLmXof
         YQ5Zwm2dfDE/2MeFVPH/f163XMtITauWhckZPsH/CfMJz/UNkxbC8GBYLE5mXLj7Gd9I
         Mmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=H2r7iA7OoHYzxctfj3egfbT+slVUvULOjb8ti2ra+So=;
        fh=o3lfIpO1LiWB5YaKx2qN0pZoVgkt08VAmJbZ6Wpmxfk=;
        b=aCSIGdf8c8RYCxJ7sGKcvfaXpNBFPAEh7nZkGx9tpExwWG+N0YAliXZtec8PcT6tX1
         tt1b967UZw5K/M56KtZ+Ol98SV8fUOOiwycLYzae6CmRsAajzQEfI/Tdj3jy83PtwR24
         UqqAehIYV7UvEaD8/SPi9htAo7dDxw+KaJiClUSsFB+k727lJXBfvD09zNH2ChIk0Tjr
         +C871PHLKAOh0eiZ/tSUzcdAeOG5fl5JWSH2SRCnKW1O5gHHKdSN/uzB0TRwmWQQdDFv
         AQBFLAdqfrouQ+7JIEzQmYAdX6qi4MwqAWJsrMRYU1vF1lU24Fy3QwN4pyNzyn8bMsTN
         BmVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P7b4dJv2;
       spf=pass (google.com: domain of kvm+bounces-3126-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-3126-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-3126-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id f21-20020a056a00229500b006cbeff5ae49si3453648pfe.3.2023.12.01.06.32.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 06:32:16 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-3126-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P7b4dJv2;
       spf=pass (google.com: domain of kvm+bounces-3126-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-3126-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34EB0281C00
	for <alex.bennee@linaro.org>; Fri,  1 Dec 2023 14:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA154A9A9;
	Fri,  1 Dec 2023 14:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7b4dJv2"
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF32510F3
	for <kvm@vger.kernel.org>; Fri,  1 Dec 2023 06:32:10 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so1561772f8f.0
        for <kvm@vger.kernel.org>; Fri, 01 Dec 2023 06:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701441129; x=1702045929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2r7iA7OoHYzxctfj3egfbT+slVUvULOjb8ti2ra+So=;
        b=P7b4dJv2A4PESequfg7QwbL5HJVLLRDbyK96r1Iwz8fGtccCwWiB0tJRSb9EMYd7yS
         Gt6BWCE18E8TUKThpAsnZbnvX7dOlJ6/1EtOxFMKEnLUobgy4IW5Hn3vrgrdTkjBdAC/
         qZAuIoStGlsfK1hogiQecZfSLSnwEAgdpNpu4tqasofhZbrtcW3fp3Btyh08/4YrvVQu
         xCjPpM3s+sbQ13U8hV9nG4dGA1mQrGXfIk+nNf9nO0wVJXm2e6dZdMKLyJ4JVZF4B6z/
         Twd0QC0yr2w+gOfW1nJd8+mKkDGUUoKvKWzvztR8RN+XFeX8FRX6hIGjP4V3PehFtGkD
         MaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701441129; x=1702045929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2r7iA7OoHYzxctfj3egfbT+slVUvULOjb8ti2ra+So=;
        b=TxkxSbtOZz6cXIVux0U4zlIOR/62B7WzuWfoNnRQOOJh62S2G2sbbRGomIvE6P4H9U
         02hJNITxvidYwSiFOJ2dEH3/LsWe3CRukaCZKcpNZOQH6U/8a+g3RTrzNqWS8y2C47ZL
         nBrbtb8ZOGb6dLw7YU8I6XQ9cl4WeOFK6e1BBQs0YYF9J9/JQoXVBuIkrGfsHaX0sLsv
         GTPqrs1FtMZ2xBTeA7W+klgGYvdjAVZmF5iZEp0844EWkAY8VxSMBzjOs+9HaGKWVD0j
         XVMIpEXOBlErFXzhHzy2BSlQSHqJSoobAjxQ+COkeJe6TRJdS2kPCTblSmMY+TL+ShrM
         VmcQ==
X-Gm-Message-State: AOJu0Yxw2LkWyZMVZG8t6etyRC6/lZDiOX3Ow7lJHDFVzUntUdGuiW/I
	OG5AxrlCyhis9RrEfwgPf0CdvA==
X-Received: by 2002:a5d:4e8b:0:b0:333:85e:a11f with SMTP id e11-20020a5d4e8b000000b00333085ea11fmr889298wru.59.1701441129295;
        Fri, 01 Dec 2023 06:32:09 -0800 (PST)
Received: from m1x-phil.lan ([176.176.160.225])
        by smtp.gmail.com with ESMTPSA id dq4-20020a0560000cc400b00332e7f9e2a8sm4277513wrb.68.2023.12.01.06.32.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 01 Dec 2023 06:32:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 1/2] accel/kvm: Expose kvm_supports_guest_debug() prototype
Date: Fri,  1 Dec 2023 15:32:00 +0100
Message-ID: <20231201143201.40182-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231201143201.40182-1-philmd@linaro.org>
References: <20231201143201.40182-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3JxwvkAy4F5z

kvm_supports_guest_debug() should be accessible by KVM
implementations.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/kvm/kvm-cpus.h | 1 -
 include/sysemu/kvm.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
index ca40add32c..a232348c91 100644
--- a/accel/kvm/kvm-cpus.h
+++ b/accel/kvm/kvm-cpus.h
@@ -18,7 +18,6 @@ void kvm_destroy_vcpu(CPUState *cpu);
 void kvm_cpu_synchronize_post_reset(CPUState *cpu);
 void kvm_cpu_synchronize_post_init(CPUState *cpu);
 void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu);
-bool kvm_supports_guest_debug(void);
 int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len);
 int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len);
 void kvm_remove_all_breakpoints(CPUState *cpu);
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index d614878164..6ed18f2d6a 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -206,6 +206,7 @@ int kvm_has_gsi_routing(void);
  */
 bool kvm_arm_supports_user_irq(void);
 
+bool kvm_supports_guest_debug(void);
 
 int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
 int kvm_on_sigbus(int code, void *addr);
-- 
2.41.0

