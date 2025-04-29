Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp349314njm;
        Tue, 29 Apr 2025 08:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCDnJzq1nrQAXXDTepoV1V7D3X9VWOi/xicZSeG6IJc7Dw506FyfHxr0t6JVq8sFwpt/u4jhS7CklOzA==@linaro.org
X-Google-Smtp-Source: AGHT+IHF8E35qAqREFuibn1ByStVO3QoNenT2YkPyTze2D6YVk+BB+TGXSYmgq1HOOBPLDA3kgEm
X-Received: by 2002:a05:622a:a17:b0:477:5d31:9c3f with SMTP id d75a77b69052e-48815b4f196mr58156331cf.42.1745941173899;
        Tue, 29 Apr 2025 08:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745941173; cv=none;
        d=google.com; s=arc-20240605;
        b=g9GoHJ/P8XGB1IUUZVg9sYvXM49UzocCyNmJbiHW2ghU6MKiimuJCOryxaIJQowSP2
         cekfMX96dHYpY/CzXxkKAbYwwFMYMQdQZDaHCWrdkDrrAkkGaxEi107proMLRmSeSMxk
         w+7o3cPhcRdOUeSIN++Gr9I316PNon/2hz9f7ddb2uFBiLMbTTHXvVrf0VsuqNsW48kD
         GRmPe5/z+m99QW1HVPQHIqwatMnKZfgVUE43edaTP4eoz7IR8v8fa7upoZ8SC3ISXbii
         m3yHkj+siqVqLfC0VX3ZijljSdzgr9fQoyf7N9RXBRIRrDLJ02K5MW1GdUU1L0P4J3d9
         Of0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=B/dF9ePSe8e/Wos3Lfb/d8anPOw/xvpQ5gn6BfEi2A0=;
        fh=iarf4vSJHbIZ8TdXozm5ExYso7NSx7gagCLEIGxWsBE=;
        b=lJlUKPwZHPKP2dZgVniZMwxEzS8jqrFvr1E5K7BfnoPNBrSl1e6o1jPfcRKDybapDq
         3GLiio0RpTRLy2cAmEadmrCAwpREFPwO2DFFPjz6jhY4EBS5nsU4UM+lSdlCxelzNPWy
         OuBGVt7esvsiM6yEC3JlgFp7s4gxpKXpN0DV81mVmduGwhk8yyVO9LYhqv/YbsHBDVGl
         PjafCt1R5Q9cx7Otf7NH8OnyvMvdVwv3Q68D/oRDeAQeY0ew7olXz2odUdumBzZcwT4r
         fH0a1pMUdSPQHleWlHT/VgMuuehjlHer9TIB80KgvQ5qkMxLAYdNSroQhyd3J4FSWwEE
         BVdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NqVkwhbP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4cf8fd8a3si90545226d6.414.2025.04.29.08.39.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 08:39:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NqVkwhbP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9n3P-0006cc-06; Tue, 29 Apr 2025 11:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u9n3F-0006aA-Ti
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 11:39:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u9n3D-0007bQ-16
 for qemu-arm@nongnu.org; Tue, 29 Apr 2025 11:39:16 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c1efc457bso4487278f8f.2
 for <qemu-arm@nongnu.org>; Tue, 29 Apr 2025 08:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745941153; x=1746545953; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/dF9ePSe8e/Wos3Lfb/d8anPOw/xvpQ5gn6BfEi2A0=;
 b=NqVkwhbPE22isy/hBqQ10SsUqGu7BCoTaRiVFD1vrixdhUg+IHk30EV1NOMFGLAqzF
 /+3i/RScZutfTvCodUNYsyTEXJrkyKvw9hP4pjnwjqiewAjGQnrTVJ9mNDoBVeEMdRf6
 nQLvSZLX1RWbMlBIZRqkfZuh+l3AbMYzYA67vThkXK5BoHR6LLW6uy0UIjFX1p/je36q
 Ub+6FNETUE2kqBTie0BiuF3TvgeVKOy1NDxmZANGfZilW4jGVwE+1Nh6bhLaCPmRzyMi
 6VEntG09IIiRoyENbpgmXHRRsWhXdo2OcBYFlC8FccUgpiswLyvM7OCj3TFc63MIr5gp
 2hSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745941153; x=1746545953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/dF9ePSe8e/Wos3Lfb/d8anPOw/xvpQ5gn6BfEi2A0=;
 b=XaLk1IB6TijT2uDRyDivoJN0AkbE6FrSMnYcdLLXOwcYe79JIYu5ZD6HACM3PAjO5b
 pIVR6MJsXlDIcUwgyaW2TIyC9tYiieSZMGXuGLa1ZkXhNBaVmLhrEAMCOmWPExRNKdgr
 OCRZYgi2c8UOvzMzgCuxRf9melO6JBoCbsagHIuJQ2BOod+5qeIcf7BF8uySKlw0Hk44
 9+vGTYN9eHIg9OzxwyF9233k1kDPcRFB1ZWXUVRBGH5XVVbg5TUrQqM9pwO05ppkR/SL
 s4Z5I0Cv7lxXyuip9bP1sMcFKjnI5+iRMqoCUzEVpVdQYNx+0riJ+KHsDmkINpkG9tEP
 6DvA==
X-Gm-Message-State: AOJu0YzInTDX3ZOM3HDT8xU3JLiZIgCQnJcJKTUc32oI3cpke34IXmw+
 qEEuY2LF3VByUsFmw6GiP3Rud0Wy1kTPm2jjCDhQNfKiqEqeAJ7e0HSZxD8U7Ss=
X-Gm-Gg: ASbGncvV4zu92HxhVsY4fuyupNSGBHt4h+7tHHIuYpNKN2JXu6hELxtdZ31pzoL7CU+
 GSuS+6PhnOtZYuFTOXMkjIzAp7HN2zX3GO34Wdsrnk2RJUI35Qa/UaZmZLh43W+hDKYRhVF9qMQ
 HD63StTYT/u9SmeJt3PgBK5cgKLqBLqUUr/q5BK+tMk7r3uHDVDdrXT8f8GKvcreKf2YDzxDEWl
 JoRVxnskSWmiHE8I/nMnBnfSFjXyf5B9X7aJIV4KjjamKsSZRZlyl7xf8g8S6TlxBmnuuX7Au1v
 1HNdIX7QCPJdJR1fTkkl7CGL2tME1SXNWkFCEIHLqM2elyewQoi5YA+FZz3+Qm0dl6YCR+5T9uU
 gUyWj6ftq7Sn9/yMS02Z/ATfm1zWBBlE=
X-Received: by 2002:a5d:444e:0:b0:39a:ca04:3dff with SMTP id
 ffacd0b85a97d-3a07ab9bce2mr8812412f8f.40.1745941153506; 
 Tue, 29 Apr 2025 08:39:13 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8d60asm14560685f8f.18.2025.04.29.08.39.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Apr 2025 08:39:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH 1/4] hw/arm/virt: Update comment about Multiprocessor Affinity
 Register
Date: Tue, 29 Apr 2025 17:39:04 +0200
Message-ID: <20250429153907.31866-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250429153907.31866-1-philmd@linaro.org>
References: <20250429153907.31866-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: X30GU4Mmduqr

Support on ARMv7 has been dropped in commit 82bf7ae84ce
("target/arm: Remove KVM support for 32-bit Arm hosts").
Update the comment in virt_cpu_mp_affinity() to avoid
mentioning it.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7e3933066f2..83bd1152804 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1767,12 +1767,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
 
     /*
-     * Adjust MPIDR like 64-bit KVM hosts, which incorporate the
-     * GIC's target-list limitations. 32-bit KVM hosts currently
-     * always create clusters of 4 CPUs, but that is expected to
-     * change when they gain support for gicv3. When KVM is enabled
-     * it will override the changes we make here, therefore our
-     * purposes are to make TCG consistent (with 64-bit KVM hosts)
+     * Adjust MPIDR to make TCG consistent (with 64-bit KVM hosts)
      * and to improve SGI efficiency.
      */
     if (vms->gic_version == VIRT_GIC_VERSION_2) {
-- 
2.47.1

