Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC46CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:14:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBw4e-0005he-OW; Thu, 23 Oct 2025 10:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw4d-0005gm-0u
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:13:51 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw4a-0007MY-Fr
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:13:50 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4283be7df63so389481f8f.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761228826; x=1761833626; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bn2C92Ox23h5s0IuScw63a4Ihrbd//B4afSM1bgktqo=;
 b=zCut6CCnlIr/hJcruYMVtZg71sK+5Uh5Kt2OVLSn3yHPnIu5e/kkSb8HMwVNKOZQof
 en/ue5ACG0sv4DDSe/DrysYnT1enfSszzE8QpfxR006zCtcRpVMg5gdkZfK6jmbEFY0I
 sERYil58MJSPZyuSf3ltpFFNHAaxX88TK0BmumuWx370on3GBMGK9MKceIpwdMuC6qov
 MoR9c9/NUAz50Zc7h+WMapQ1UdGdaXWdpMMAPD24vdcfP8GkBzfUnQkNbF3X3ZlZ5Syl
 hVLJRhpjI8HMaAebltvRT5kqZjhvjOFkJoNT941My6bqfzB+yyD2/1/6ebk2fdh6CpKW
 5JZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761228826; x=1761833626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bn2C92Ox23h5s0IuScw63a4Ihrbd//B4afSM1bgktqo=;
 b=e1Uz9ZR2UQV4cAO2udc+VkO2BLsgVckftTFXJztFw1+Gpg6LJjidTF3Oe5lAsuUYzR
 59bCZ0wJph6CiF6zrfReklA/uM4aHRS2RInzLSWpK0u0iUmT5JwbQpCkcPc0mTCUxupn
 S38CZV36spWTujVJHxTVN29/OcIpOtqU7b+WdLPbSHDKtk63eeLXyuf3RcPaAWt61ITK
 ntJhRiLcOXeLMAG8nm7w8uhiuJIfOF5AEKrRJZUaVt5tgNQ0xvo7jWCHWGkSvJPCBoAm
 ubSu8rHSrikizChqmhDD/7+Dm3uId792n3R9k1Up0eYc6KJnLXAUyX0qQSdOue3+rFc6
 vYLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViKIX25bU3D5eds/OsxOLNTpNHwQZLKws/lnQz4jmwyIT7zzq0bISGF+2416bmM+NaspD6qj5mtw==@nongnu.org
X-Gm-Message-State: AOJu0Yw/ELJxwEuhAB5CB3hWOHb1B192yc8BH0ZzAH8dSM/rJyrqdlXe
 /HwUNk9BKuWWzfn3tqMFNqVgzK7bK8dyMGHqTi8/yH4xTYIakzsLUg2qOr7DOYu0/qo=
X-Gm-Gg: ASbGncue6rLJN2Mr6QQ/eh3WjMl/Rzqz0rpSwwH8AB6FIjMNWeztgDiSIdlku4rI6lu
 1CWcifixAEZ6ExspA808/BHsEvpex4QtykcYy6CL/gZCF1sOIDn9hYNyQ2bV2KZb+y+EXLye2sS
 9b6PecAYOv5QMmQXhhvifNZBSzkXTc3hjZTt93cXuhIF+l+6cb4jxBFS/rpCx7gdwjtk/NtId7q
 rWKy8dFJbhn2oEUG+zpKbJtMUOJFkkYnh0y1NwpzbSR0l28e1t9JdrKUp6d+9ODuzLiKZiVLRDE
 PLxnsyHWsr4AfbPr4Ka0P8P44+WsSS+m0gXknLldnZw2e6jw3dB0vy4Gmz6kbfuFN+MmGYvWvFp
 h7Z03Xy+zv5/Xhia/g1LhuDYcx6HtukMz9S5sowKv8FqzFeZdEVcBNEW+JTcpB+JnxMmdEg9ttB
 OF4KFlMe9L96EJj3dWwAFZrBWF1cIByGq2RKrpV7n+1wgptzmEVCNVw1s439lC
X-Google-Smtp-Source: AGHT+IFOObY4FZQI60HAKVyYFMcVdLy2QIR00SAsee7dM4Kc4Y6LZN9jVb7S4ynbEXe1Qt2RZDCCiw==
X-Received: by 2002:a05:6000:2884:b0:429:8d0f:eb4 with SMTP id
 ffacd0b85a97d-4298d0f1116mr410025f8f.28.1761228826243; 
 Thu, 23 Oct 2025 07:13:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897ff3f5sm4349458f8f.22.2025.10.23.07.13.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:13:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v2 11/58] accel/hvf: Mention hvf_arch_update_guest_debug()
 must run on vCPU
Date: Thu, 23 Oct 2025 16:13:30 +0200
Message-ID: <20251023141339.10143-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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


