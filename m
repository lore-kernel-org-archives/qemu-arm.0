Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492887ejo;
        Mon, 11 Dec 2023 13:22:28 -0800 (PST)
X-Received: by 2002:a50:cc9b:0:b0:54b:5a7:1435 with SMTP id q27-20020a50cc9b000000b0054b05a71435mr5175513edi.4.1702329748466;
        Mon, 11 Dec 2023 13:22:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329748; cv=none;
        d=google.com; s=arc-20160816;
        b=xYk84DLed7KbLH2BWqObwMGenRuj8ElmLMfxF6+AsIfHnK+bfFsRYm9kUhPb+F67N3
         DxE6l1YLDH3FpuvF+qeZCnodspvhgYuT9/ZTqZSMiR5GXL0XCvETUhTWEBI2rP338Sn9
         g4MXSKlnv3i7Kgj4tZi53s9pky4bVLNY4/W8dawL00GfdnZ9FZejqNysXOGwyz/2onOP
         qOpG1MQfG4v3zqBNm9Od624pLCbZDgC/+GBWbP/Nv027a+p7z+E27nfMUT3w3Qf0Sogb
         xLHdGnz+R98JCW0zOPBURG/wDeskRpoWpLJsWdxxYtswbsb3ivj211iRPXPfyedztLvb
         SQ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jCN6XEpRfBzl6QRBVexJQczvz29R6MzglzJSIvh3kCU=;
        fh=nNxGOtwFJbFbIeD7JuqhPtCnPp6jwl4EO+WBprDXaus=;
        b=tAmPoNMZMELFYGlkLA6xUVqiEdviBM1AjhqpuZmXnAi90aGn79TM0k4DEH49OpRhem
         f4EFuq/hJJUvZT1UBAd3ShI0zFh+gzYYp/5sktam0IEqSrVVL3/ymp0tJuN3osLhgf9o
         +Yd7EU0PmhyGW1MROmXhilI2igeFweZ6XgEkAFbT2xpSuAHMc+cXpThGBRBnE7wG5f76
         CrGK2jW1UKHocfD3QLVic0GjiOs01veUux1t7IAS1kz1YDoVchMbo3+dSbLou3wtXpMy
         thPkn+9Qog7VLP4QkRPubzW1oPwUMkP1yS8a6QdvSMmV/b0QlAEbfVnAiy5Q0mXu7PPM
         lSvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rq0hqt+t;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f3-20020a50a6c3000000b0054c7460f9a5sor3341758edc.5.2023.12.11.13.22.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:22:28 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rq0hqt+t;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329748; x=1702934548; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCN6XEpRfBzl6QRBVexJQczvz29R6MzglzJSIvh3kCU=;
        b=Rq0hqt+tfiKoJul5dXkSr904Z9ocPuWirm9mXr+zVBlEE4KDX2Ys1ALtjnfyREZeNo
         XazVGGTgHx2zNE3uhafv5I03vYbbYtWulLyax7jdw+w5u1ZSRZfBrNlPFSI5d9qF0y0l
         GqftnR7mNlrcLuCP/nL6UdFINqtlDa5H7qBwAozf9i7RplcgjXERnmQuLIOwYVDp3Qoe
         qOV2Uhp0N/8uf1htOpoKE2hLNAm5rk2R4SMV9eORdHzwthegYszpBloDqEf0G3t7zL8N
         NRsKEp7K9GZIPhcAtHcQjoVARANHLjmVaerm2bHKF70+n2y5Ziwd2M3akhLQATQahkc/
         WPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329748; x=1702934548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCN6XEpRfBzl6QRBVexJQczvz29R6MzglzJSIvh3kCU=;
        b=jKg+T567EF+g1lzLgDctuVvC70hHlakUOXT81KEfX0E1GkTYwOHYNNz82KPUJKLGvP
         4vnpwYgoHQyurt0+qbevZ8AJMe1afUxiZilun55l9qVgREGAk8fQ35vcHaHrTti/igRb
         8NriFYZh4xBBIIAPWtCFi2RRAioonZ+etFTwvcdpy3sLkz1ESyA4dM4JTIX1geadYxiU
         PKukqs5vu62IsXuXTjz194lD3NeWaaGDM4YNVdIArcGfZf3FQG7PAlaP3TduspzEqIig
         OFV6+xaMHlySJl90KB/dGQXNHV9/QOxdajZ25w2E5U0bROLl22S/0+WD7P1bUXCJvp+7
         EfFg==
X-Gm-Message-State: AOJu0YwlGIn+vekx3urCuLDc9mX6XHkEjXN5pMuHiUPYb9zugVahdgTd
	H5LKEpNIZQqV43WhFqYaTl3yfuQvac6DoDHrXsj1bIdL
X-Google-Smtp-Source: AGHT+IEwqt6eLG4A82nj43gtpanBMrnXiDuQHfBbhdfTI3qN+rGfYQe2+K/0exl5E5chj/jjV3dMSA==
X-Received: by 2002:a50:c905:0:b0:54f:4f7f:1a57 with SMTP id o5-20020a50c905000000b0054f4f7f1a57mr5170138edh.31.1702329748112;
        Mon, 11 Dec 2023 13:22:28 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id dk11-20020a0564021d8b00b0054c8415f834sm4087989edb.34.2023.12.11.13.22.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:22:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Claudio Fontana <cfontana@suse.de>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 17/24] target/ppc/excp_helper: Avoid 'abi_ptr' in system emulation
Date: Mon, 11 Dec 2023 22:19:54 +0100
Message-ID: <20231211212003.21686-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zwOF2RFKnWho

'abi_ptr' is a user specific type. The system emulation
equivalent is 'target_ulong'. Use it in ppc_ldl_code()
to emphasis this is not an user emulation function.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/excp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a42743a3e0..3d7c9bbf1a 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -142,7 +142,7 @@ static inline bool insn_need_byteswap(CPUArchState *env)
     return !!(env->msr & ((target_ulong)1 << MSR_LE));
 }
 
-static uint32_t ppc_ldl_code(CPUArchState *env, abi_ptr addr)
+static uint32_t ppc_ldl_code(CPUArchState *env, target_ulong addr)
 {
     uint32_t insn = cpu_ldl_code(env, addr);
 
-- 
2.41.0
