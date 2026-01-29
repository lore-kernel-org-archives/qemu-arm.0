Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E97D61015
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 13:50:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlSPA-0007It-HX; Thu, 29 Jan 2026 08:49:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlSOL-0006k6-4J
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 08:49:01 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vlSOJ-0008Vf-If
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 08:49:00 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso8436765e9.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 05:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769694538; x=1770299338; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVOk9drV3QCMbx1dpIMpVZJTvJcMaSOdgdXvZMLLwjU=;
 b=LEoFLyBm10UBQv3cn4w1BzeqyUVG+SpTyrJpzNBIbZHN+BceBYLpurrEjc/vJmDQrW
 xdPYYaA6VutUT+d5yamh0gYde/EB1/ZXhjnuK0oD9ToEBmNkeesWlbJbmQ9O4aniAHxN
 Z3z+z8RdyaxjNwTpFo8iFRgFpk/gcN5UrXbYgJhtdu7VmzAYKKw36ZSEdW3tEHhEu2zy
 cW05YXjpGZhNlBZ9wYe4qVPrBK1N1CzSRfdQCH4JqMb73ejuOfSHy7599UKlVUENEqn1
 F3RDx5YhDkkLrRyacC/pmNKEgJG8j0CqAP0htOIj9QhPP7iLXF5/0pC7vXfO+giUHv7m
 WTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769694538; x=1770299338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fVOk9drV3QCMbx1dpIMpVZJTvJcMaSOdgdXvZMLLwjU=;
 b=A+NlKHG7lH6T6hzfi19IOSpVqG96adO8hsre39unsUZiItZ6+YiP1fOoyr54+JVBhe
 Qo+hFnNf20JoCTx3705iTT3DoXmJHpg09SNJEKWDMIHe8iMnIyr9KDTAh4k0gMETFhZu
 lEgALAmhIxCDEtIoc8HSK/puiEhVPMy3If0KNHpYXTgvhBJPzSPgogF0xLOtkvHFCFk9
 L5mPVzybtRVsrzDDj8U1tfiTMeG8Y9ZCP5/JmGoZjwlrWl6yLSMEfCfgkCx387toNa8f
 3hzTxXNcMzRz8x3bfkyl9KVGjdNxv93FwHLlnaGtt7MBXckzD5LLW5u+++sTAKfftAn9
 0R2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW40SqCb6kA+OGNp8tFfUO9bVr1vZ6CGCv9TcBR2isOVcZb2wpNAWrAi0k79PfSm8YoYDT7WojAIg==@nongnu.org
X-Gm-Message-State: AOJu0YwrT9lzFXHKUhzIuez4Q6PINa045XsV1oCksYSFfR2W/9nqyzd4
 9aOeGp6ZrnPPYOFdjL9hGkVeVeEpRicOU4M9B16Q/kQzX4cqhT3OSKVpGpHUt07giN8=
X-Gm-Gg: AZuq6aKXaWLIktsYvEcAOJoiqi8Jkrgm+2tWT2iFazKawMPqEysInf4a16CvW3X7G2X
 JEvRVY4tmntgMGgvupd8lFIP4mYuQagz6SglOZFVhSvx7/ovFFOaaW5C6H3Tfj0G852wF8DUHrx
 k6XthRSaKl9GpJok2EkbQQyvkU5TBn7hcgGXGegMYrH8FStDmJ2RLkJDs5Vo9QSOehQVlfelsTN
 mjq9DdOqhNDQSB5nx9rNMI5kW56EoZOCrCSQDM4/x5RF+2tjNuNXAJtQLCA+UpGkZILa6sTYnkp
 aqTbP3AAqorSJbiFFfgcUb/azP5LvZGp0W1AmNbCJyKMa1FfNq6y9ujJsY/jlxamoOzC1liMQbS
 6F3mAIvB+wj48OKcL7eNtVAalOOZCX1gvxHJ+16JuMcjcBiRfx8CCm/GIf8AzN/JpOvai37CD95
 e2TrlUElX4BG7/vGdz5qMqkLZGzg00VxJugEiwJnwAHu36LXqAW1JYDP0rqXOP
X-Received: by 2002:a05:600c:45d0:b0:46e:4a13:e6c6 with SMTP id
 5b1f17b1804b1-48069c7887emr97166785e9.19.1769694537707; 
 Thu, 29 Jan 2026 05:48:57 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cddffe9sm175804835e9.4.2026.01.29.05.48.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Jan 2026 05:48:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, devel@lists.libvirt.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] target/arm: Remove dead code
Date: Thu, 29 Jan 2026 14:48:48 +0100
Message-ID: <20260129134849.36557-2-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129134849.36557-1-philmd@linaro.org>
References: <20260129134849.36557-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Since commit a0032cc5427 ("target/arm: Make 'any' CPU just
an alias for 'max'") the 'any' entry is never used (we use
'max' instead): remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/cpu32.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 0b0bc96bac2..2127d456ad6 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -897,9 +897,6 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
 #ifndef TARGET_AARCH64
     { .name = "max",         .initfn = arm_max_initfn },
 #endif
-#ifdef CONFIG_USER_ONLY
-    { .name = "any",         .initfn = arm_max_initfn },
-#endif
 };
 
 static const TypeInfo idau_interface_type_info = {
-- 
2.52.0


