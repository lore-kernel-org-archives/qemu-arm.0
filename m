Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4917CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:50:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBtnY-00005Q-K6; Thu, 23 Oct 2025 07:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtmu-0006HZ-0V
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:47:25 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtms-00023W-4g
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:47:23 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso3545845e9.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761220040; x=1761824840; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rYEkDKuUtDiIDypQqJeptd+MMxIUvh06oL1URWY/YY4=;
 b=a/fIixeeUnJxEJPzxeF4R84t8pTZg6iWrUWP5acbqxvBKJ6/JxsiWpq1HJQIvVmSOX
 Q2ws39zRUq9O4cG4kEGbiHTptPk4Bz91TgaSJVvL/aCxLdS3BTy0E035qumDTI6BcS7h
 IM7cOFuvaE8lFLfLp+rN+zHZ39mNGfCe192wiIigqU4yDr4jWndcB/l4jWuByGgrmIb0
 fegPav8wK/8VuV+3uKuRPGi+0sUxeNZywIwz8CjBu0DtTLLyrkV/ywD1rygUqTIwrbHi
 X8370bj40fczUhk6MWuzaak0Q1LopNTvDy2H2XchUsOtYFCBEQCi8+aT1spxmOkh49s0
 MIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220040; x=1761824840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rYEkDKuUtDiIDypQqJeptd+MMxIUvh06oL1URWY/YY4=;
 b=k7Oz5HCRO4cVmeNxOfzTdeqScfIeJ58ZsU9qWE7sF8vLdFOb9LhNzJ8pSIk5QvPrkF
 G4hyTW5LlUAhmovXzxOiNcQQRCS+x8L8CU4qOOI1RwyPOhYJwape4yp7xV1ZOuGu33PM
 jsqGWcHtoC5EIhyzEiITU+NoFA1Jwrbs47cJw8xwDFT1PGn4m+MDqtXgjwGNDbG8Okph
 aqtcgeSaeKvT2IVjesUmTmoIjgygavjkxnTTG1OjrGTlCNhqv7NpB82e00xEwaGSoXMp
 pTdVuGjbOPWK+x+MH5hx/nX9j0DwNmzPP0KOtR+PbEygDma9l6iDCv3Lnx8bul4TJqPY
 Zndw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQV+xhPOwwv08nE3Pzzjp2cMhYfTcAAypzJ3yL8EFh6XJIIGp5cHRnu7r6XbyCbeMvj4iXO6+Ugw==@nongnu.org
X-Gm-Message-State: AOJu0Yx7LoBZDYA6D6ZJPXMKZQ8cUr2BPNq8bCXW6wWAha19Y2vlAMxO
 Zf3j7IOl5Im4XzNf4cXZPMXdvL3MpvqAaUlwezZSt5lwzLkem+72N9t2lTody+7tF7U=
X-Gm-Gg: ASbGnctbD2hKYIh1dq2GKfSXrfgzUwsDb8o2YUBpjOtROj00Wj4w4Fs8Z3RaVI1YNp4
 yu6rG3o7Eqbk8WgJFVv+8ziPEQ3HX88yyxhAaeNEIkIdcS3lBJKthGh+MPE9Yv/06FlVFOTG/Xf
 gq8L5JZlmoOBHaSGez9b2oFILu3PPURDC2Qyp+/JywGB6vrCvIhfPfdUaMCAFyicsab/g7tlsnI
 Er0Fi4tYIdkC1VmjxNDqKKeUhlHFdZ+yG+WQVl3Pc5zoP8uNKPa/FLDg+H0xBZxlm+3AElX8KHO
 pIhKB22lh9/ibSIPaiXEXNmoY3Dr8vuo42L+mUxSyXs6/4MkMJOkxq4zIAuCHwyjo0fpWYerAKQ
 mSgCIfh7AtNhd4ygBjLsbNgSdU4B/2IiRR+fJ6AHoookQ1b/HjKixsGk4f9CwVAb+OGCW82RfPK
 tPAQpW5EOwFhf46Tgnrk8i5iPB9efVCvobYAziawo8P07E6LFjqw==
X-Google-Smtp-Source: AGHT+IEhCa8nWJvZxaZjBO+0dwM9Zo+hrjKGJMN8shQIydDxpRkwClXOwpsN6LKP9DFFgH5B0VHDPw==
X-Received: by 2002:a05:600c:1d15:b0:46d:d949:daba with SMTP id
 5b1f17b1804b1-475caf93244mr15127945e9.4.1761220040426; 
 Thu, 23 Oct 2025 04:47:20 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898cceebsm3538175f8f.37.2025.10.23.04.47.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 04:47:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Peter Collingbourne <pcc@google.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH v2 08/58] accel/hvf: Mention hvf_arch_init_vcpu() must run on
 vCPU thread
Date: Thu, 23 Oct 2025 13:45:45 +0200
Message-ID: <20251023114638.5667-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

hvf_arch_init_vcpu(), along with hvf_put_guest_debug_registers()
and hvf_put_gdbstub_debug_registers(), calls hv_vcpu_set_sys_reg(),
which must run on a vCPU. Mention they also must.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 include/system/hvf_int.h | 3 ++-
 target/arm/hvf/hvf.c     | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index 8fce627b08c..0c335facc3b 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -71,11 +71,12 @@ void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
 const char *hvf_return_string(hv_return_t ret);
 int hvf_arch_init(void);
 hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range);
-int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 void hvf_kick_vcpu_thread(CPUState *cpu);
 
+/* Must be called by the owning thread */
+int hvf_arch_init_vcpu(CPUState *cpu);
 /* Must be called by the owning thread */
 int hvf_arch_vcpu_exec(CPUState *);
 /* Must be called by the owning thread */
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index fdf8df09d4b..8095cb0805a 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2119,6 +2119,7 @@ void hvf_arch_remove_all_hw_breakpoints(void)
  * Update the vCPU with the gdbstub's view of debug registers. This view
  * consists of all hardware breakpoints and watchpoints inserted so far while
  * debugging the guest.
+ * Must be called by the owning thread.
  */
 static void hvf_put_gdbstub_debug_registers(CPUState *cpu)
 {
@@ -2157,6 +2158,7 @@ static void hvf_put_gdbstub_debug_registers(CPUState *cpu)
 /*
  * Update the vCPU with the guest's view of debug registers. This view is kept
  * in the environment at all times.
+ * Must be called by the owning thread.
  */
 static void hvf_put_guest_debug_registers(CPUState *cpu)
 {
-- 
2.51.0


