Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp159610dlq;
        Tue, 21 Jan 2025 06:34:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUTVx7wkeHwg7Mefd7q7EtV7ttg6Xfm1PV3rWKbUO3AsabD3Hycvfh2epIJe/+MThtgH9Vx2gJ9DcRfMw==@linaro.org
X-Google-Smtp-Source: AGHT+IEMKJvNYFtgdRgH6UI715mqonBAft+7jepo+i3N5zQJ1TqBCgMa6UQ5B5C2Rll1cH/g9EmS
X-Received: by 2002:a05:620a:4504:b0:7b1:1d91:5d06 with SMTP id af79cd13be357-7be6324d633mr2506970385a.46.1737470074721;
        Tue, 21 Jan 2025 06:34:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737470074; cv=none;
        d=google.com; s=arc-20240605;
        b=JDXy/Xa+M/xRg9/BLc2fDL3xB7WFY1E/LbCb4GSOEzdNukidT3UmCUZZ8K8EJkCQs2
         wjFqwqnzNCaPzay6HRaWrk1fyHJlQN0O6wJi7AA3qI2lj2I/2EN65FBB1xm8yKUuSnHI
         ktY/wr9yYuMhACPe4zyrkcqwzlFS5m11Co8TJQmB7gExUGvQi5BBk+elK2GTJb3cEOct
         jlNvN8hMFkGfowpJBrQzq0kM0CS509tLFTeWVjOmTkuSEnivn27hnnGq8GQpQewdKjJW
         pUxjtde68x9miItYL+wj0c5hUc3bV3Ev5FinPulqc4UFQ3Py3B2uqq8IHlYxBXCsVPtd
         I8gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XFAdNtSt1Vac9l1lQj/iEUHKax6ecgV2tBSS3BkOMOM=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=aBVV3i8hZesggVmkyqq7VZi+I1Nonnui5jzveGe1T90jSWdXu5BokD+fG7F9BbaEp0
         CibvVYRCDpD1uCzNcoGqJlFNnObVgUkkEdda83yNx05elrMWbzLmhwRmaga64j4+8Iua
         zhizxzzpt5WUi4x8jgyTpOAoMT01OZCLSfX08mSR6cbXAChBfEVX6WOoA/I2MzOL1C1h
         UUE3Ibxz8fpSSgTfqq0ih6bprui8pfd0b1AD8q4vrfiLeB7y0C00jJRMONIN5s+hQCsS
         e5zKWGYmCHWifufpEhVWHStmylhCgPCY+yAqJw3306GouPMfqJb2vgI2PLgNYQNqam0N
         1N0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N6xlUVlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614bfe0csi1227653785a.226.2025.01.21.06.34.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:34:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N6xlUVlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFAp-0000UD-7n; Tue, 21 Jan 2025 09:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAj-0000R0-Mn
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:05 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAi-00031Y-6a
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:05 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so41427345e9.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469442; x=1738074242; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFAdNtSt1Vac9l1lQj/iEUHKax6ecgV2tBSS3BkOMOM=;
 b=N6xlUVlRKXXUos8vRWessYSLKiRPyVgDGQHbzJiWtrBb4LBkrhBlXMGryOlk1vUTkF
 8ppmQfGS892h44LbQyfIRmjcheQef3tzyUYQOGa4EB6Ds++/7yiZADy/XM89mNzDOVLJ
 vvnzhjyCRqelph58deXNTWvgdsiFrSjSww1qxHEVXwM+ZAxcy7jka8rw/k9gbGvlXCVJ
 cFii7ao+Up/9Lz4iica1u8LoAUlLYQid/cHibmTdR8nKj47q9a6MzVD8P8yL45tiB1CM
 jubUqoPuSx4sAHa2F9kJEA+PXM6rJwJKnLEX0L/Xkz/nT0+D6hS1dBYirZH4l0twNtDG
 kUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469442; x=1738074242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XFAdNtSt1Vac9l1lQj/iEUHKax6ecgV2tBSS3BkOMOM=;
 b=K2oQixxnIaReUk+DYd7JRWJpKqyqcEAWQSpPOoqdarxw88UBXdZIUrmc723lbxUW6n
 G5ATchTds3Qftcga5GNlyesmKoZ0EUD0+xe86EZMCD+sh8PF8/KZ+QmUBE+N3mqldsmu
 5NfIxEHGybi8p430kppv8T6Yrn3izLBv+bIDYJYVzI154XDoQSSC3L/XtxoyN/LjkwFf
 zxDIyhBpyTWhx8IZEtDCkSGLKmyi4ffwyo1ncrtiKnb1iE3jjMSk5vQ++9dtnkH3DdlF
 bKNbaoxbkOXiX5aVsAFnIZYYJLApKu4J/vyVCjdFN5/fwOy63mwsMjohw75a5x1+NXDK
 SgGg==
X-Gm-Message-State: AOJu0YyFQRDQUAGzRlLSbaxFRY99EklRE0c03UlPIs/atNAUvQBqLQYc
 L5fPmlNs3XexCIQmNghNhUa104DV0L1U1txzPbnaxx3EE4SmaWZBOp8JgVS3q1k=
X-Gm-Gg: ASbGnctgm4aCSoCvTqcoFIZxF0s/NJNXBKKCwGW5TYHFfIyqlexAiUGJqRLbUjU6Ah1
 c1dLmEeZbnq0lA0DidPApCTd0hrb2MpSntYx4fLqqxQME/Xzk2xSxLXxHVAY0HAFp1PxOy0M2B8
 KxAbylLLLdo8w8t/bFZYD2vHx7kFSsx81snNhcPCsIEXv3L7dEuaf4U8t3Qv7JOxFpZ7J4FnCC1
 6WvvJ+tcX6KhO1blD+yr1Qb6STzDiUpTsaIt+Pq4y5GFbDt0owdgp4zfKgow4h6FVFOZYKnUBMO
 4jLjSeS025tszx+byNcJowp0iPcTGxtB9DaNec70MxOp
X-Received: by 2002:a05:600c:34cf:b0:434:fdbc:5ce5 with SMTP id
 5b1f17b1804b1-4389145288emr173734005e9.29.1737469442591; 
 Tue, 21 Jan 2025 06:24:02 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890367b48sm180702695e9.0.2025.01.21.06.24.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/28] cpus: Restrict cpu_get_memory_mapping() to system
 emulation
Date: Tue, 21 Jan 2025 15:23:17 +0100
Message-ID: <20250121142341.17001-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: Ks3IEuYLLQEc

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b7367f6d808..2402706c7d9 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -614,6 +614,8 @@ extern bool mttcg_enabled;
  */
 bool cpu_paging_enabled(const CPUState *cpu);
 
+#if !defined(CONFIG_USER_ONLY)
+
 /**
  * cpu_get_memory_mapping:
  * @cpu: The CPU whose memory mappings are to be obtained.
@@ -625,8 +627,6 @@ bool cpu_paging_enabled(const CPUState *cpu);
 bool cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                             Error **errp);
 
-#if !defined(CONFIG_USER_ONLY)
-
 /**
  * cpu_write_elf64_note:
  * @f: pointer to a function that writes memory to a file
-- 
2.47.1

