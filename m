Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79A7CA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 17:29:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulsnk-0003vC-NC; Tue, 12 Aug 2025 13:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsni-0003uU-Si
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:28:42 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsna-0003Ru-R0
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:28:42 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-459e39ee7ccso56101455e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 10:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755019711; x=1755624511; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hbl7ajSiNJK7b98o2AX/9HHrEnoB7DYhJ//FpfdP6jM=;
 b=u9NhJHUCeUCuIDAVsXYKdi6UDFRxaSuwt9FOwMvauvClqqPAlL8dU2GllHqb+hJreg
 QZLwta/8vayWRloeZRJ1RyJJWLcvLAwITj+/BnydNakKoHWap1qBuA42VdHb7an5DhzH
 uMjII+KW+sWEMeMRqNUpMKWQL8hY4B93xX+C8vk5gNxW3VejlfOtKq3Pj/IErHKO3oen
 MUVnk5ra98AItyygnoxQ+6Tb2ARnsVt7ZJZDmhXk6TZeJhs5s9TXI82l1QYPoihWRq2P
 +JaAnEr/fn+ydwT0t4nk+X6gpW43pJWVE47KFSVJb72hA01tNsT3P5BE8AQVezoTdqs9
 tURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755019711; x=1755624511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hbl7ajSiNJK7b98o2AX/9HHrEnoB7DYhJ//FpfdP6jM=;
 b=opIDZ+gES7RK2WQoBI9kiI44MgSnwG9TB+KQ3B+DePMIdwr1CWkOud0H75HGw/szsM
 fmJOESkwuc6DR9dcet7JBoOafrm3eJJ2I8zDS2xt8Uk0jiaYZGMRKsBoFPin1LTmfxL0
 nhCcZigBXrhM05RdgexOqq12K0ym/jeqKLh8CqqGjDInAdj32Cni8JpuLlI8M9/u+Hma
 NClYB6OvBNcQQ58gXK+/FjmmfVJQaZ/VyKc2OSjejRJgRHtGUZp3QbdxwanxerEWFCEW
 5opUF6+p1vVMUPL59E2ExLc9cP4wyiDNHfi74zFgI4wItZylRTMHG9tKzPeGzaoTCkX+
 1IZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF9VA+eAIvoFkpdCLe+W9uhe7GdVnqxkeMHpWwglP0uQC/rBVf+/NewN6VJaMmeF/ROLdl4Zp6bA==@nongnu.org
X-Gm-Message-State: AOJu0YzbkDdGqaEin9cX2FM4oqlPGJRvEnp/gbsB8f2drsEIIbDiC8qo
 g4PNpS+2x6uYndq0qHWPMWaa2cSbdpLL7jn8NQv8CCQQjb6cz8IqpJMUldWPQSXZJss=
X-Gm-Gg: ASbGnctDcjU1AG0YE/kKfdBvBc8XkWssu/4abb3P27Jh2HxECAa3lhx0kBKruTwYrAy
 PIPr31FzocJWX5PzG07+MzUQ3wpuHqLPOc6DM0F5bajAsNgTGunAy2vu6bIXLGUJMtT2iwEZWaE
 +BxsR6HmqqrfICXMaovFyAbYK4EjIAK+jek7OeJLTVFc1XxPWSTOVm+0EacEDuKkUinlpwY/cNO
 6yLevBDCrNVzybPAzUQ/m+7g7++UpaBivlYnDOzrqZNzp9RRC1R3TLwwt1HCMlOauyN6EqmWzsR
 dUtZJ2Zvuao4dLqqHjQQF0C3NB3CSxctCY5hiyQQoKYHHjsT1vtvSTYaPqPXR0Ydmv/G+tyE6I7
 HvMjnWq+uiMDGGidIvzyhoejtD2hCYQx9LQICMsJPQaArVMjfvs8dxYOMYBcg27lyuBczzkLu
X-Google-Smtp-Source: AGHT+IFWwbaQHe23BReftsVg783iD02j6Cp/qQHnk8XrfTKXBUvofgvLXMly9n8OdcFF/Pl/0k18wQ==
X-Received: by 2002:a05:600c:45cc:b0:458:f70d:ebdd with SMTP id
 5b1f17b1804b1-45a165dc8dcmr54605e9.16.1755019710554; 
 Tue, 12 Aug 2025 10:28:30 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458b4f9e952sm444632735e9.9.2025.08.12.10.28.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Aug 2025 10:28:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Mads Ynddal <mads@ynddal.dk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/10] accel/system: Introduce hwaccel_enabled() helper
Date: Tue, 12 Aug 2025 19:28:13 +0200
Message-ID: <20250812172823.86329-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250812172823.86329-1-philmd@linaro.org>
References: <20250812172823.86329-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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


