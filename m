Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DE3CCD1A5
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:17:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyAD-0007wf-RD; Mon, 20 Oct 2025 18:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyA0-0007j3-43
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:27 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy9y-0006n0-8n
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-427084a641aso2226670f8f.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998521; x=1761603321; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SGsMkVpjo/FJHdJoOY2mGhnpaGdDSXbai5OydODTaYY=;
 b=YvKwdbV11GrYtapP5OGC/Feuzhi+rNyEcFWiLXJXJqTim4uIfqhs3ep/Y3KipwtJzT
 0/5USB9Eq55Y81c5WOPnlus5xainB+fnOs+GlaK7jvEHy/Zruxx9M41H5YVi2/Wbmqy+
 K8YOhvtJpQFGNFpkrZpQ15c2FOdmnpw+xLQRhnnry6LbCcF451jDLFlxHwT6nVw8cuwp
 8L/VjzLPMiYKMKXH6rH+yDV6gAO86Awwyp+H6mIGIlPOZ40ZEeUiVivxqRvC5F9MLHoK
 cYakiVMBpEGUVz88PWMz//i/Dc9sH08ALwG5bmXjqYvTTj4lpOvtAer6zlL2sS0owWLG
 7WPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998521; x=1761603321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SGsMkVpjo/FJHdJoOY2mGhnpaGdDSXbai5OydODTaYY=;
 b=RrkqEvS8BnbFdD0XHpvgkFsczxIjxiaOmA4xlf45i46TpbDJUlxLsiDtSlP6WTiBxp
 1fGMLb/pOd+UPrRWbmSNFr+EMjV0mKBcZDTxNQMQptfRd3aj+5rttBqsUlMsbPPcqHPC
 /hNoWaMm3/DHP6wM9xrs2KkjFxRBtVUodGv8MsVUcMuWrJT3YThvnpW157zdt2ad/zRn
 Bl11EQsXei4RGcJKQ/rzseMmzHSH2Fc9iMIUSlF3VI//BQIzC/DJm/300/42hUoAlup3
 GG75y4N0D6s3V4MzmN7aMe3DMcQhlmalaIGB3tmGrsWaldcZOWHsNWPzk5DJqYAG/mYE
 uhnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFNn9aKvm2uQjKOObxoWFhHqEQ7b8BsbtRmDSscL9CluNJnTyiv/cL/f/3/bTohkMtWmED/VkznQ==@nongnu.org
X-Gm-Message-State: AOJu0YyAh2/1Yjlo7KMTxEHSwPtiLOKIZFSOpTaZwuX+muZJ2m+hyLw5
 awpCyd6J8d2eugMEPdgPJw+f0HSC7fu7o2ZMbLg4MKDnzwJ+Y64yQFoSVwbl6FUI8DU=
X-Gm-Gg: ASbGnct7oMJrtFUUM+DFjcoAgR5TXbi8jrKuUPB7kdHCNk//Y/KzIwww2m/63bEIfoV
 b05NzSg+aOOTFcYNDCPRZrxDj3sy8DnUJPsqL9hFb6qWxKcfEJhWAyEUp+SyloxQOxTtp3os0Nb
 sPMxbpfUqXnOCdApfAuj544IQc+JnX0b4xzob42mO1kwUjdLy/8SVlnOUWfFptmdTmKEMUP1Sj4
 GFazvA7m58cV5wf54zhMJU+0+CCOEcoTZMJZESi2TVCmqSeui67iJxIYLoPTPUblh4UN0YUQW0G
 YO+Ff5y4akhH+bDAuDvyCpyAOBZm6tVLC/JMefbW+igfFhXZjXd4Zdu+bJg/godB+LU6ypv9NOp
 MjDevH1IPAXIN66wa2cz+DbY/z070GMrtLBjyW11Ak+8MYq+OGY9K4+wVLwvWz26dmcQbAPJTYO
 KRuPEvE2ziiDTXm8/VopoSsi2phQrTSCYWjjiYoYz5xmYvHXK84g==
X-Google-Smtp-Source: AGHT+IGAat5gZRGuueJ3K6lXAJPGfvUZKXS1F5Wyb/UFr+YTHmDVwcjZjIRGxBGbzg5k6k3ln6Jgsw==
X-Received: by 2002:a05:6000:2887:b0:427:9a9:4604 with SMTP id
 ffacd0b85a97d-42709a9465fmr8944014f8f.45.1760998520654; 
 Mon, 20 Oct 2025 15:15:20 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce08asm17078064f8f.44.2025.10.20.15.15.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:15:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 18/30] qemu/target_info: Add target_aarch64() helper
Date: Tue, 21 Oct 2025 00:14:56 +0200
Message-ID: <20251020221508.67413-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Add a helper to distinct whether the binary is targetting
Aarch64 or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/qemu/target-info.h | 7 +++++++
 target-info.c              | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index 984fba3f42d..e8fbdf19d53 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -57,4 +57,11 @@ bool target_big_endian(void);
  */
 bool target_arm(void);
 
+/**
+ * target_aarch64:
+ *
+ * Returns whether the target architecture is Aarch64.
+ */
+bool target_aarch64(void);
+
 #endif
diff --git a/target-info.c b/target-info.c
index 40716bf4051..e567cb4c40a 100644
--- a/target-info.c
+++ b/target-info.c
@@ -57,3 +57,8 @@ bool target_arm(void)
 {
     return target_arch() == SYS_EMU_TARGET_ARM;
 }
+
+bool target_aarch64(void)
+{
+    return target_arch() == SYS_EMU_TARGET_AARCH64;
+}
-- 
2.51.0


