Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB716CA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 17:07:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulVyk-0004mf-Ca; Mon, 11 Aug 2025 13:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVyi-0004k0-40
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:06:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVya-0001kU-UU
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:06:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b7920354f9so3789931f8f.2
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 10:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754931980; x=1755536780; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hbl7ajSiNJK7b98o2AX/9HHrEnoB7DYhJ//FpfdP6jM=;
 b=VnKcCFZqiEqzU0SuYZ6nBdbpTC8zOXY8Cnhyx2vPzl2EqvfSazD7c5ZfwaDWZLQ1iN
 AkREtOtje+2hCWoN2YyANc3JSuPfqKlPwKiFQd0+ETmqFNiu6yRS5+41xAW03GNdvmPJ
 BGRXBtau71iKm3jbWzqhcK/aHp7xiOMw/NNTJjBJKhjz8dtnSmibfbOT2oSUOk41qy7V
 pCQOinza6ph+Ah97h+dQg2rpRL2T9wY2pHx2Azy7jh2Ms09FQQyR5AYJ2eDkLVPHo4+/
 upzT/mzrUasAW8Mto/rY+cb18WiX06amQ0cNi4eMzuXjTu2oEBcrWXDmBdtjT7R9BJTm
 cC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931980; x=1755536780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hbl7ajSiNJK7b98o2AX/9HHrEnoB7DYhJ//FpfdP6jM=;
 b=IzepFdtNybNtQ/OrDYqQaGeu74Ij1l68PFe9LprF3ASA1UsCF+qjj8/CQ3vLHXWjWo
 HIybJ9HaE1CH5En8hdwrogoWe0YE5mq90dPWgQZy3mZDvD5Xadi4qTpVf/CKp8pE/lGM
 5PFSisHaPzsXPmS4jqhPp3Urr5GkeuJrqM756lMEK9uDrFTGGrS2F+BJI4/bxHiYo9tB
 WXIOGZyl+AaBGqUF2GgkAWMdMZkmqXgcF5Mdp0kI+CmhBHyYeqDiybmMSvf0AdJ/Kukw
 fmyaL4+MJwuoTrBoFKQPXQ5yc1T74G6wrhh/PTn2T2T9FBCJNKCHskBgWGOuq+1yRsE4
 RRLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/jJl2hUfRGa/6Vz36OPkI+Y33KWqvZF6N6/rwrqFb7uUIK9qmCwFctH67zkxRFnzUcEiGiV2IOw==@nongnu.org
X-Gm-Message-State: AOJu0YxIn8IdBaHWhlZ2oQzW8RISO0unLuSD1QCB9WzZylvE1INhLfc6
 853LYHyEsWxL27ugheoCn8du+HAh01qNUksg9hPi1hAelVqzF9NOC/xa7m4So6XhgDw=
X-Gm-Gg: ASbGnctfY4xSYydLxRKF2ZhzFFTJnuCGPhPAhaXwFihTu+rUfhsJJXoDZ8b6lo2zKNy
 aDgERV0a0ajLqkebrKqUHQxqJsrw4rN9M6c05ALFnFiZkzDuiA6BJT0gYdruxSJ6jpAQsKS1759
 Npv4nmssSQ0ArOe9TQurb/7sA/pjY9tb/gANrQwT7v94IUfME/t4oshi9d4azO+mp10Am6lGvMB
 kujL02Jmf2YIuCCliUpYuXTC9LphSjTQHZxAa5tLuGe93fKzo/T3dnCdPD4wSKbCH6+l9ZfhDP/
 QxOwgyjUibaC2ooQqaGwSMDVrrvUhf/duO4ZBgDT7qoX93zdkJROw0x0hdrwB8R0IA/7TFu7Mck
 qvPNbrLMz6uVB8fqpdBPXtsRFhjOJcO7zfb2ZJ7WyP6xLRgXwOCJSiYS+OuR7XwGojX7DeJMz
X-Google-Smtp-Source: AGHT+IHs9VhBLuyq5DxMA3Sqc0EWtw1Yz98FWwe/a6XU5QQ2lahjqbMswlIp69fYsNKRzJHrl1XcwA==
X-Received: by 2002:a05:6000:2886:b0:3b7:9589:1fd1 with SMTP id
 ffacd0b85a97d-3b91100eca2mr436223f8f.44.1754931979737; 
 Mon, 11 Aug 2025 10:06:19 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e6214640sm272712305e9.1.2025.08.11.10.06.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Aug 2025 10:06:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Miguel Luis <miguel.luis@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Haibo Xu <haibo.xu@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Mark Burton <mburton@qti.qualcomm.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 01/11] accel/system: Introduce hwaccel_enabled() helper
Date: Mon, 11 Aug 2025 19:06:01 +0200
Message-ID: <20250811170611.37482-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811170611.37482-1-philmd@linaro.org>
References: <20250811170611.37482-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

hwaccel_enabled() return whether any hardware accelerator
is enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/hw_accel.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/system/hw_accel.h b/include/system/hw_accel.h
index fa9228d5d2d..49556b026e0 100644
--- a/include/system/hw_accel.h
+++ b/include/system/hw_accel.h
@@ -39,4 +39,17 @@ void cpu_synchronize_pre_loadvm(CPUState *cpu);
 void cpu_synchronize_post_reset(CPUState *cpu);
 void cpu_synchronize_post_init(CPUState *cpu);
 
+/**
+ * hwaccel_enabled:
+ *
+ * Returns: %true if a hardware accelerator is enabled, %false otherwise.
+ */
+static inline bool hwaccel_enabled(void)
+{
+    return hvf_enabled()
+        || kvm_enabled()
+        || nvmm_enabled()
+        || whpx_enabled();
+}
+
 #endif /* QEMU_HW_ACCEL_H */
-- 
2.49.0


