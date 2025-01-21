Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp152594dlq;
        Tue, 21 Jan 2025 06:24:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUHfpzC3t+3kJb1BjF0bRZ6ZJJG4t5r9EV55LlS8FADjmZZ266IXun77+t1ufurW8NJhh2FTV+5KQ8C7g==@linaro.org
X-Google-Smtp-Source: AGHT+IHjBt+SS4UEQ3PeYrAIKj3oBITSNgxXKp3m/YUxVlHaHXB2PYYFK6f+RQ1Xx6g1ImAnrVu0
X-Received: by 2002:a05:622a:289:b0:466:d559:b528 with SMTP id d75a77b69052e-46e12e8ea76mr253457211cf.17.1737469484506;
        Tue, 21 Jan 2025 06:24:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469484; cv=none;
        d=google.com; s=arc-20240605;
        b=EXMnoNeb57m9q64rwTW45+Lv3OR93SRlvVrPsVS66r7MS4BLWIf43FN9mnNMZidCzs
         XB9I1Zwl0cZhcda/vTbGvnsk2C08dijfB2MMzEBS8Trvgmiq2BG7nGf7lrkx+jyroX3q
         t2K7cHxNxv/mppZgGb6IV2Ytd7IO/hPJvEyX64tmNCUywiAfLEwoiNKnFcb120931UUM
         oXS7DAHYx8G451f1jwYE1AER0/3QDYuijt0GSCF9yNfm4OtlZqqNyZHKJlZP65deexxb
         tjXPeGxzXmEQuKcWyaMFmoqPuvrwfCz1AiZKRfxOyeErhCAaY49EY1sFBN/p+nwYiYJS
         CwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UG0trGBZa/zHcAjVBtljvnuPb8rCcRdqGnikIpWwT/E=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=I7RYaGl5ABmB6S2DH249KH8RO2bd4xs+/dEf2Bs+Q9i2Rh8BETTrgJq5Q2i+BsqxvL
         cXPb+5+I+XMiQ7TkfrOXGwm7D7q3MTOf6MSwCQyJGdhtqkCTrAtlVfaN0C21kixAuj5o
         vTf1hBdUwnJKRyBAS2iz/7VF4//mPRi8xUXTnYyrg+spVvQlk252qwnfvddxEe06L06t
         /e1bfv4Y/7Z2SdlJt0roXeYSyLwHJBt+LSB6wqO68X9rjtzD8iKbs/BCvn69ptDpc2Xz
         w2v3+b3QKylsEvK62y+J8CyKr7iYTwiDObb+J7xJm3WL1gjBTDWiZtiLo27aogCaH1Fd
         U6QQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tPpVNRT9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e102f3a8asi124263721cf.72.2025.01.21.06.24.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:24:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tPpVNRT9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1taFAW-0000LD-Js; Tue, 21 Jan 2025 09:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAV-0000KR-Id
 for qemu-devel@nongnu.org; Tue, 21 Jan 2025 09:23:51 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFAU-0002xo-4H
 for qemu-devel@nongnu.org; Tue, 21 Jan 2025 09:23:51 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso40947815e9.2
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2025 06:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469428; x=1738074228; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UG0trGBZa/zHcAjVBtljvnuPb8rCcRdqGnikIpWwT/E=;
 b=tPpVNRT9Sz25zVayH8cmdU+l4I6O2mNyYgnqUIL6SuscPBIsJijtPDMEaSwv2GgHML
 0Cyo00LkAt+/ZbtvMgsxV4dELVvWDLVHqHJ6fJ14mKyyrCQcwRCqczIu88ZttWYysXFp
 uioiJLxxWU0539vz71Il3kolY6SCHZ5sGGf3e014BC7bBPUrwezcCA4UBJPMK/SFm0M2
 mQeHwhxURc31g9fwd76Sv429j49LABl1T+ux2yThdDVsCqJDvATemD4Uvq8W1vLDWYjk
 ub2Y2c5axkSSYST0Kt4hadt+2aGmi2oHTORWD2PQOymwZMTdtMUlGF9lnqZRJxoZzmhV
 LxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469428; x=1738074228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UG0trGBZa/zHcAjVBtljvnuPb8rCcRdqGnikIpWwT/E=;
 b=fJW96WDEo6JQiTnu1w+vOaubAoJqpR+HlSlx5oc6TkZZ0BlNQT+ZdT17Q0gv1zuGi3
 U39KNvEswfiH9s0+GMp9Pvjd8B4NdTTMw5U+GNyYzEwHkxdhwqy/cri4wd6AoLlbi3YI
 Xi0B8D5g9sjUMjx4Y0BqjyctPahR/GnwnYaOZu/8j5C2qA4pwvX8T/2f8Ki5zFS2rCE1
 CbWlyvC5NTwpX5kD7MCUXa/ghYg3eSxunYweRx2hos5Q6DAM30H+L/XRZNMrmGbZbcAf
 yDl+sLJWnu2xdPX6opZ/oQYi4lB89E7xj2JViaPOLFhCSAGPWcPIUAqf5kGJAC9Ylkws
 jSnQ==
X-Gm-Message-State: AOJu0Yxvaa6iz2GTVfafXlHt2q/dQF3eTI5QLa1mVlrMOBjNsFmyH+Z9
 G0kXWL6QKxi0Eb3CwdlFwKHBehP4nhC3xFnwF2ogJKBjg3FKTRGHrvlzZMm0CYcOfCMP0sk/kwU
 cMxY=
X-Gm-Gg: ASbGnctB1OGbZte10wcQ8o9k60aRz4wTlHXIzoF9s1bErdb8vy5IoOGuoPnLGAReafk
 JqycnrKMmcULn27LqdR2OsCVA6jjHFfWGnNK3vu8E0b/fllDbGA7+mZUflsmx93J+ylHfxk/ry9
 5BuP5MQUygFa+McVpp1G1DQIrvrp3oesjhWpRgl3j8Bf59/LggLXOuVi3jLqfe2BLJdgUOjrnYl
 RiFrB8x6/e9S7aXsBxhxt0+9kU8vAuXDeyLUCW7YJBeoc9TFYIRCNrs9S/TMsh9kF5Adl9WnQjM
 RCUJmzZCAQBt4rPxD0ngwc6aZjWeOj3FN8v3NJLZxzE8
X-Received: by 2002:a05:600c:3d05:b0:434:f767:68ea with SMTP id
 5b1f17b1804b1-438b0dc9532mr10630425e9.5.1737469428481; 
 Tue, 21 Jan 2025 06:23:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389041fec5sm184309165e9.19.2025.01.21.06.23.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:23:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/28] target/hexagon: Ensure not being build on system
 emulation
Date: Tue, 21 Jan 2025 15:23:14 +0100
Message-ID: <20250121142341.17001-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MNfwoWTj9Fkx

Currently only user emulation is supported.
Assert no target code is built for system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hexagon/cpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index 79e60d4bfa1..f78c8f9c2a0 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -26,6 +26,10 @@
 #include "mmvec/mmvec.h"
 #include "hw/registerfields.h"
 
+#ifndef CONFIG_USER_ONLY
+#error "Hexagon does not support system emulation"
+#endif
+
 #define NUM_PREGS 4
 #define TOTAL_PER_THREAD_REGS 64
 
-- 
2.47.1

