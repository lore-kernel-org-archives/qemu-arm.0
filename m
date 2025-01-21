Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp154672dlq;
        Tue, 21 Jan 2025 06:28:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUUORJumU+MCoq5umnTHqd7LlmzkQ0X3aqqmBNOpSEaa2opgcczMvGK7NLDhocn+Ond62cLKfh+B+LGeg==@linaro.org
X-Google-Smtp-Source: AGHT+IES+SQzwFsELZ0NVvlP4QoGFrnSNN6Hu9+ZMgRS4NChud5X6BK7ddDI/KRKPYRa7qVKHxqI
X-Received: by 2002:a05:622a:311:b0:467:672a:abb8 with SMTP id d75a77b69052e-46e12a1e603mr275356271cf.5.1737469690026;
        Tue, 21 Jan 2025 06:28:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469690; cv=none;
        d=google.com; s=arc-20240605;
        b=fpogW1MJCfpHsgSAqPvagimfM3fCYhVoVNQo/00U/Q28N26mX1HLf9+5/vKwFtUGBU
         CT2u5SNwdnZO1fBROCwUMd6id+u/CjBV/LxqTGIL3lVqLZo6rNxACjhjmdsQGZe4gmhT
         EOgeNeX+AkqV46b/mjXHyjP20OIDr68Vm1jpdOpTHjM5keUKdk9xCRiEhGf484DUttEn
         o/2sJ2Q19K876xpwv2qMT/t9mzlh1Z9NeWrRmx4U8ANdF29ygcMfLmNhh492xm8Hbc9Y
         4zrYnGmQgkSIfAmpdyroKbuSfz5zlnWJkVtXRV0fUFrCUj+uwIHHNCb0BrNzCNLQmIL1
         OOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XLtjxkwdz6L1VGr45Id+Wfm3w9Chh81Y/cb2LCx94qE=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=VRF715a3gNaSB/DIEX7eNp2AV/LYuOw1bJUzp22e0W7lmDJYezfwQNO0lL6yIM8S6v
         co8tJ9H1gEOOrslMPB7hKRZgp4VgviwCKR0GYLOz0x5FtJF4KbaDRzxSU0n1n7OorvqY
         IC27Y+kGWFNlIkeHNo5uLBm80tkFw+Vn/Hd4vjgfd55wS7NFHK+zADpNQ/yj1izQ4mkX
         HmcI5wdBVXzglkfaYmzS9mq/sIcvvEJI7DFxvTo6ouOKCtvHge6SV60X5l2e+TZMs7Vo
         1WnrV6sIwLFUaQYegz23Xprv5xN7C5AJkOVGR2SgeH1loU+MjKPGhBjT3OgvIr1+HZqK
         ALNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G9NCpxCk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e1030727esi121339141cf.200.2025.01.21.06.28.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:28:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G9NCpxCk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFEC-0006KR-Ja; Tue, 21 Jan 2025 09:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFCD-0002P2-OS
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:25:41 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFC9-0003Zl-Qa
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:25:36 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso41095915e9.0
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469528; x=1738074328; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XLtjxkwdz6L1VGr45Id+Wfm3w9Chh81Y/cb2LCx94qE=;
 b=G9NCpxCkXb7KaCQ/IPs055hnOPgDAQKTXS147FrPUPJZEDwuRmWsw8dZeYFL50hhMn
 uTRR7cjbmR+Y1utadxek5uxcLgET2vjG1QD0O2W9Ec6Kf9b5Qp+z5cx4TD/iVfR/9LSm
 YzZZl4VwHz0qbxf9LWxeFTf/e/dbldDcELLxe96rQjBHsOPIiLgh2TpHf9iUW9YKq6sW
 nINPuW0qgw1vn0/JvsLmE5e5eWmV4IOlUoeNEc4m8JGGkkaiVvxicX1Me63LwDaMEk0H
 y4yo75TRVnBlDhz0+ewA1Rk6Zy6VF8nzDU7cIFu2doGHKjMrxsgvgygvLM+RPAlj/GDu
 4L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469528; x=1738074328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XLtjxkwdz6L1VGr45Id+Wfm3w9Chh81Y/cb2LCx94qE=;
 b=qups1Rp7/C2Z0Bx6/xxfN53W0NNVDfPjH/VQR3R+dG7GNjuoQrvTMTyfch7xGt70pR
 hTMDc5z36fUpuYMMQq5N13LY0metul0Cwm2nr8PFtkfetQal3oV32WoqxA2K96uHH/O6
 FYuv/tK4Y79n7MCPTcCzeQ4fHVFcRd2MU/bvhBKEB7gmbh5viS5BilHnArM8iZ+VoK82
 u2CavghPn88TpXlw9vYbzjN+M0DKZyugAVjPUKdeSeaopRefAD4AykbcNvd0qc0OEzOt
 7Tpk8Nzd0bbIHd5Kem3yYRaLl2bLHgDIqQ3e7bXZ/bR2zo3a1MpSg5eW00AbJgUUZtyo
 4xFQ==
X-Gm-Message-State: AOJu0Yyio345Q7GHB39YV6J9JG7r1+tU2I3DnJzQf9cHeJc6XFu/w4xa
 qO9HittEwBoZtGUQ7XDX5axOi2XUrlOQx4CiR2ppNIuw6OllEO4MfJHu5+MIyHo=
X-Gm-Gg: ASbGncvaRNC0l0qQWvlEqXsx7jJU+Iq51InpnxfpF0Q2edowuXuQvw8GqA0g1YoCHOS
 UiETveAIT4aSGTu4if71+M3Vd8RinzI+HmFFrHCixjd7r4iJKv1YsIfydkEcFS3v3HQcQHVQFLZ
 rKqs+RPtNJZ+oLmF7dPhJDQ+M3elHBhewVcgHob9UAi3HXfuD8luV5uGwZRxCLvkVvt3RzVm7wn
 /ljOTxkFYB+edcBbzI6J1H/IWJCLLt+n9f3laodZ3G9IPfLLke03PV6/yGqQzR4h2cSlat7kaPh
 9zs8IzuRFp0gfCVA/SETi2JIW8BhRvwk5K01ZgtgZNCc
X-Received: by 2002:a05:600c:4e08:b0:435:136:75f6 with SMTP id
 5b1f17b1804b1-438912d5426mr194266845e9.0.1737469528605; 
 Tue, 21 Jan 2025 06:25:28 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890420412sm184694965e9.18.2025.01.21.06.25.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:25:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 22/28] target/s390x: Restrict I/O handler installers to system
 emulation
Date: Tue, 21 Jan 2025 15:23:35 +0100
Message-ID: <20250121142341.17001-23-philmd@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9ApEpldBCfsK

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/s390x-internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index a750e7a343a..6e2c98de97a 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -356,6 +356,7 @@ void cpu_inject_stop(S390CPU *cpu);
 
 
 /* ioinst.c */
+#ifndef CONFIG_USER_ONLY
 void ioinst_handle_xsch(S390CPU *cpu, uint64_t reg1, uintptr_t ra);
 void ioinst_handle_csch(S390CPU *cpu, uint64_t reg1, uintptr_t ra);
 void ioinst_handle_hsch(S390CPU *cpu, uint64_t reg1, uintptr_t ra);
@@ -373,6 +374,7 @@ void ioinst_handle_schm(S390CPU *cpu, uint64_t reg1, uint64_t reg2,
 void ioinst_handle_rsch(S390CPU *cpu, uint64_t reg1, uintptr_t ra);
 void ioinst_handle_rchp(S390CPU *cpu, uint64_t reg1, uintptr_t ra);
 void ioinst_handle_sal(S390CPU *cpu, uint64_t reg1, uintptr_t ra);
+#endif /* CONFIG_USER_ONLY */
 
 
 /* mem_helper.c */
-- 
2.47.1

