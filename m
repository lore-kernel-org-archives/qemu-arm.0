Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C48CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:51:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcbN-0001YO-8L; Tue, 28 Oct 2025 01:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcbM-0001Y6-7v
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:50:36 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcbK-00047t-AT
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:50:35 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso4071601f8f.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630632; x=1762235432; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bn2C92Ox23h5s0IuScw63a4Ihrbd//B4afSM1bgktqo=;
 b=RkRxdODHQLzOEQ5oodl8Ukk5TFGZI1vtbQVsxzDKZ1x04ez/lHM2dgZtCztzbzWKst
 EL3m1lIin7MdY4MDfVQhvL/t2BJjR5jRjGedqRvK1ENTj6UOjCEbQwc1iinUTTmXlqs8
 MEZbuMxU6Fs2zW5nCGaNd4NryZS5iSXzqO1ovdLQ2xHWNy4ahcV98E+ScBvA5w0qEsTS
 xAdNu07Zp4Xr+J80qqmi0LamggkMG0b3ZoEzYhInzPE1L1P6+owmEP+GfYTyNG/qG2Xd
 PowwTeqs6D5AlOhrDGQ2CG7KSnjsH2iAEa83VFsGhANMGTODgsZ8/0yQCD2FByINa1tN
 ZcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630632; x=1762235432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bn2C92Ox23h5s0IuScw63a4Ihrbd//B4afSM1bgktqo=;
 b=oFha+APTpeUSv9w8MpyWlRnc35BIYgi6+DHN0wjfgZdWPUcSLDF0uPd4kETjv/o68G
 JdtM3MozV7o0Jt55VaQibBaLmV9Jmeapz9ScMTkBLGSir1MOQpX8N3UYe8wLTy1iUq93
 IpxxdjF9BYv4xoz8ecH5kGfSND8c11Nt6PVHWhpRhOnpe2UV6TQn4h6INWQpTpNsdyT8
 kDCLO6ApIzMB0ESs0/Fc+eh6x0Njyj6XS6E/43sz2TMXoE9Cbkk4WFQxJUudc2uXrubD
 oaK6r0AGBYHHtyEzv1mdpPdkt12o3URGyCESFi4DHbE2/4hYfp7/ImNTLiJgrC6GwOKW
 AJhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhZ3WgcpBtQ7YK+43J8jan+bXLufxjrzCpV3cxQPIoiXOK8hBHlCHGlU8Zjf4g7p2hx6+un1Zbkw==@nongnu.org
X-Gm-Message-State: AOJu0YzpDzwc95OtKtXiyUT6qRWuIdBU+jT7nUCcYPpi10iL+hXh+qXR
 poeg+/obrPpKpoonSqHcVwskwJMuOT1Zj2lVedSwjNbqkK9EXJaxylWTI29BQS326mI=
X-Gm-Gg: ASbGncsrF06DLQ8wenpJcdqCfJmmzRbVvIZSiRsZNtZ0t4P4q0RElfFZovaiDQGYNqQ
 lzuOKaalAMxfubw0hygk64tsTDyO1tVoQaZ8zesI2xArf+eJJO4eryPhV3GmuLstTRyTwuaVUH5
 7CSLB3b6XgBo0b4UkJuu7B7Vo9SyxUTnD6JVBZHofAs5b56Zuae4ScB341Xr06RzWB3m1XvDE1w
 qP3e7cQsHUYQlx3htZES5iiZjIgfoZr+fk+L4/XZEzjbArqSDgVh5TQ6rp6uAl6ZaTTETxT0ONO
 2+t5upKU3fxVx6NCdRqQ+/OhEY9W5E1iHwuRzRoYvgEBhGbai9ixAdIEfaY+7Cj/h9XmSl5iU7h
 R4vft5YrTLxwEzUZO4TLccuomrp48AUZKT7lWjm0h/eIVSkLWnV4JxcApaYi3MYkFOgEfejx4TA
 GjHAes037SmHjClvobuQ3Mp3Yk2wPc7baOU5ejuu6ivobleoe08RQOCUPzP0NcrMGo+w==
X-Google-Smtp-Source: AGHT+IGSglBN+lTnjgmy3R4hdyxRvhXy8vCf+1szzhrxs7W2rxaBTq0xanpi+n18Rxek2tCaqHX32g==
X-Received: by 2002:a05:6000:2c0e:b0:427:9a9:462b with SMTP id
 ffacd0b85a97d-429a7e52ed8mr1550126f8f.18.1761630631830; 
 Mon, 27 Oct 2025 22:50:31 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cbb2bsm18324137f8f.13.2025.10.27.22.50.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:50:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 11/59] accel/hvf: Mention hvf_arch_update_guest_debug()
 must run on vCPU
Date: Tue, 28 Oct 2025 06:41:47 +0100
Message-ID: <20251028054238.14949-12-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Since hvf_arch_update_guest_debug() calls hvf_arch_set_traps()
and hvf_arch_update_guest_debug(), which must run on a vCPU, it
also must. Mention it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 include/system/hvf_int.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index 0c335facc3b..241c668795e 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -83,6 +83,8 @@ int hvf_arch_vcpu_exec(CPUState *);
 int hvf_arch_put_registers(CPUState *);
 /* Must be called by the owning thread */
 int hvf_arch_get_registers(CPUState *);
+/* Must be called by the owning thread */
+void hvf_arch_update_guest_debug(CPUState *cpu);
 
 struct hvf_sw_breakpoint {
     vaddr pc;
@@ -109,7 +111,6 @@ void hvf_arch_remove_all_hw_breakpoints(void);
  * handled by calling down to hvf_arch_update_guest_debug.
  */
 int hvf_update_guest_debug(CPUState *cpu);
-void hvf_arch_update_guest_debug(CPUState *cpu);
 
 /*
  * Return whether the guest supports debugging.
-- 
2.51.0


