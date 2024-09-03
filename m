Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1465943njf;
        Tue, 3 Sep 2024 07:42:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4w+XP6U+0tvQT/fatDK6ZeKJR+fjgMKtScIPAkZmL4IjSbliV7V7FoWmL20ABWGIXk9DERJpDLAiPXw==@linaro.org
X-Google-Smtp-Source: AGHT+IEchWqUxYutThgherEIJmtVGgH70kgZWh7Xy6X4H65niYWPiAKVxmfrHBOdOXPYBwmybiKz
X-Received: by 2002:a05:620a:3183:b0:79e:f932:7ca7 with SMTP id af79cd13be357-7a812065a42mr2536300985a.29.1725374527075;
        Tue, 03 Sep 2024 07:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725374527; cv=none;
        d=google.com; s=arc-20160816;
        b=voLrET0gmRNF0m6JvsbTv1OWHs6M/+lxKRP6HzyYPIKBQ0UGAl71lJdM0b1CcLkOb4
         1Nt8kj7GObD2j0uc43223NkpIO7HRHio2vKZ4xhym+e7ametSXFYR7Zs8LAxdtipaW6I
         o/G6KkTxYxfouKVleSGymAvwTM6yhoz6tjKCYD6k8IFKUHWHTzphXQrh3LGLDUs59cbH
         d3z5Tl/6D77EX+ovwcZGAbyYaAJX97Bo9SjOV2KnH8Xi6VRDilItHSZ2rZNEC/pW89/R
         UNkl/MCzvHsBkUY7wDJvRUWjWVxkfGzontlg/z6Bo2zzX1Wd9wIOW1d8BjA83ehQXEY6
         3mFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=qXN1HxG78/psUtrRyQwZXCfhfBENbvTH4d7ZUVt9NUk=;
        fh=ie0SJ8Vl3BTBWHZAjAH+IIZ32ZN/RkWaFWRKp8SsWHc=;
        b=Bi+C+GUpvuYyh0F3Fl50+zbpun8TG903EIWoKqBONBFAjxvLMDUi+q9hHLYRGkFqS+
         O5q8hRRflibCLYBki4qhYqpcr0G20MZdsoIRCt4wQTkIEeA/7UPM4FaaHsbLTFSWKkkX
         ToCbJ/tVUvVFz1CHdItg4FCpNRW5XDCIdjK5e8yEHswI6P7Uty8i2p+jvA2DvQVZe7sm
         jPDdzNPdSwg+Z++bZAgRqk4NIimIfqCEPPnloWqEwUxJ4sqQ41BMvtXlmKi1AA27nWE6
         9ynEQICHqRzmXr7QYiA270Uhp9dTxzaRiRhYZEFychDjDjuyscj/m9U8TAyQexgOH1Kj
         4jQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gYGQBiTO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806d54466si1317286185a.379.2024.09.03.07.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 07:42:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gYGQBiTO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slUjK-0001RK-7v; Tue, 03 Sep 2024 10:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slUjJ-0001QN-9T
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 10:42:01 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slUjG-0004gE-MI
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 10:42:00 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42bb72a5e0bso47852915e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 07:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725374517; x=1725979317; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qXN1HxG78/psUtrRyQwZXCfhfBENbvTH4d7ZUVt9NUk=;
 b=gYGQBiTO10xSQqsW8jzO89mp6UzRja53yh+V0cVfq93GRrV1EsBILlszv/8lUmZbnl
 v6FZVN96XOGggYLLtH2PNejzrvZwVk9krUVVhhPh29cl85JDJE/XYU7FN4+FwMGfisym
 JWfLahV6aEzB8SFLnirZtxDFeIsfak4AMHJO2Fc0qoCIUEh6Az4c/zLRfCAFn2noiuRi
 dHTx0ES72ILFX5uwEIM4QuJo5G3ZWjfpNlVnioesNJGv3lom79m+tOkUG3EpIUfFYoGW
 vtMSwmJg1y1WticeDMzq+pG7t4PeSURtNYhvy7W57Qw72MD2woKyXdJ5grNbyiRm4j8P
 dl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725374517; x=1725979317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qXN1HxG78/psUtrRyQwZXCfhfBENbvTH4d7ZUVt9NUk=;
 b=geQXD4TJYUA5MFSAXC07qmcHRS8QtIY7PCbbSTH/00RW6Xn10p9LqTNynfb/o4WFHy
 Ue7oilKyoGo6P+WjwMqYczMmz5luQT4HRzyPL9qarHioZWt5D0QjRE4HSkmlNCWhPYP9
 Zp+TSqJ3Ms5rb38SayAR0Pjdjc7QisJd2+Dywak1K8kVInGef5oN9BC9VyD+tqYgge5p
 7a1WzXhj1kAXp2Rq0BrjdaKvvWoFSQfRpnvSNfZ9zryg8nXs0jHuSmjYIxX+yjKp2Hty
 Yx03f52w/Nv7MzvIwYQwXhhKS7W8/8S7StaQrzisSZPyIirLQsexojdpa7el91WXgAo1
 QgcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvxZeLIpzPp3asd7zMFBho9Sq9Sj00MmcAFHNSs958EhD8STx2g7R9CfTU6/iHbdGU1dCtghl/Ug==@nongnu.org
X-Gm-Message-State: AOJu0YyviTE98i94UkV2OaObJYEA8xxzxaJlAI+bCSQ0uTFzhb2SnYXG
 GHylmysmJI0QBWJ6C4QkPB9RubushK/MbgEP7qhOf/2RgsYoEOHjwvzgu9jmjAw=
X-Received: by 2002:a05:600c:154a:b0:428:1b0d:8657 with SMTP id
 5b1f17b1804b1-42bb01c1136mr130767155e9.22.1725374516137; 
 Tue, 03 Sep 2024 07:41:56 -0700 (PDT)
Received: from localhost.localdomain ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c89dca8absm27934635e9.27.2024.09.03.07.41.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 03 Sep 2024 07:41:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Changbin Du <changbin.du@huawei.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/arm/boot: Explain why load_elf_hdr() error is ignored
Date: Tue,  3 Sep 2024 16:41:54 +0200
Message-ID: <20240903144154.17135-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Hx3vIpMGh88Q

If the file is not an ELF file, arm_setup_direct_kernel_boot()
falls back to try it as a uimage or an AArch64 Image file or as
last resort a bare raw binary. We can discard load_elf_hdr()
error and silently return.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/boot.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d480a7da02..45d0c6b9f2 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -799,14 +799,18 @@ static ssize_t arm_load_elf(struct arm_boot_info *info, uint64_t *pentry,
     } elf_header;
     int data_swab = 0;
     bool big_endian;
-    ssize_t ret = -1;
+    ssize_t ret;
     Error *err = NULL;
 
 
     load_elf_hdr(info->kernel_filename, &elf_header, &elf_is64, &err);
     if (err) {
+        /*
+         * If the file is not an ELF file we silently return.
+         * The caller will fall back to try other formats.
+         */
         error_free(err);
-        return ret;
+        return -1;
     }
 
     if (elf_is64) {
-- 
2.45.2

