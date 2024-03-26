Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1433820ejj;
        Tue, 26 Mar 2024 08:48:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXz6SQ76NH1UOngg1GSV8PIFVY8QvPe1XsnIKV19FRMYPrLTDOVTOESgqiIjpsNXIIHeFlmaMsoQ4WniqM3//D0tv5HhaT1
X-Google-Smtp-Source: AGHT+IFLjkASx3+SosDdQFcjIxqNg/paWd2Ab4KjHBZbSfaagICDGXq9Yj3f2qjJDY9rNNicltBG
X-Received: by 2002:adf:e042:0:b0:33d:1656:21fa with SMTP id w2-20020adfe042000000b0033d165621famr2082694wrh.24.1711468090729;
        Tue, 26 Mar 2024 08:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711468090; cv=none;
        d=google.com; s=arc-20160816;
        b=iGZNPhHmd8wJpNvGof+znfBHpmr7g+kgx7ZNPif5AZFMcgMduoUbZG12TLQ2fmvM2f
         0kWlXP0kRHJjYzInIhwFimXP+bZ5jGmiu9OQmTasaJqJwaner0n4CNRpjrD8lfVsqzK3
         g4eyI9BzfL02gInJmAAtpjjW6ptlTK4fhv8Jwt/JfYy+vIDILuvTQiq1vMRWO4g7KH/Z
         v7Q5mG6fBcp3mFzjrXm7XVYNqej7SM+9TeEJi5mVzWoItN+jUQzg3SncLEhCGpLWRW1n
         sBaF45VcBmsewnu3+vcTGY89KEyfQM6XXqXOafuii1WEDEdtihh1QhnxGeJbVtPfQOIp
         dx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a9aAigC2kGTbid56AicgylDWHcJDSIM2k5pIIBM/YvQ=;
        fh=pAGJJoxeRb3mkCbKvnNYuAbiZvOjq7h9qEZVLWQJHmc=;
        b=bfUtI99FJVv0rfVTAL4z0YlmsqfnBYkBrtZnLUzU5NSLmiCxVRZv3M3HtLC70qH7VD
         KlEScWz6b8/Ea23CNIaXIKd4NiYZqpEiSW6YHSTGb/Abz7qKLlwhX54BOmqgAjeXa+FI
         BU7IT5H+y91krNccmx3t9Mbi6clc0wHSEz6ZHZsKjv323Rud3oZP+OcB4BUqAD8Zy+6+
         oYbmrykOvbhn1DMHhvJv64ilPkXyGV67XM7SgpuJosNwCVD+3hNzahUCLFUu9lp1iUv8
         om8VTmdYZy/52uI6z6t0ZU+ADvBhaC7EOnsRuk/Jfk22HytxwtpFhOMKYUBVzCpXe8F+
         TVFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FmYpNi7Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13-20020adfcb8d000000b0033ec9e1a45asi5273709wrh.57.2024.03.26.08.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 08:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FmYpNi7Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rp90D-0004V7-GD; Tue, 26 Mar 2024 11:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp907-0004Ah-IQ
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 11:46:14 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp905-0001Gk-RF
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 11:46:11 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-414925ba716so554715e9.2
 for <qemu-devel@nongnu.org>; Tue, 26 Mar 2024 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711467965; x=1712072765; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a9aAigC2kGTbid56AicgylDWHcJDSIM2k5pIIBM/YvQ=;
 b=FmYpNi7QecEHtkQhubQskR+WXcoThxDv0g+BLSCZ2xir1KJr/NjBTcI8DUOxqD5LHi
 gvBxstumxYsTnRScTg+PhX0iskLMP4R57PqFdmRVhShgbKhKHs8iCDqUUcc0HEkefY10
 eoQdB4t2laCXVHMmOWjCXU2RvBqN+HZVDI2sCU7+8nP48msST/Y3m2E8YSc9y8lzZ5c4
 Y2dDYml9KYOE466Yl8JBtDlSg3pMfjiNjEBWJUtC9cLx/JvrGQgVJipZeF1gYegRBdQc
 NIGvBqAOpz2nD19Mul1Wtf6zZQdv/0rsDmd9+3zy2q72n3R9fq4hbKQ0wZiG6owfaJmF
 7c9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711467965; x=1712072765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a9aAigC2kGTbid56AicgylDWHcJDSIM2k5pIIBM/YvQ=;
 b=GhNhDvNDZxBcJWK3R55FKIXtXwp6bsOStjEXDHcwzFfMTYiu3wp6apZR95i3+jUVVO
 kSy6vUnIXt8JKLX6MqlqdwFomSQKFtU9L2/SUhNPWOwt584IP6m+LwReVxS37GDA/0hC
 jsabyNIX/R4md9RQGmOIhuvibqIlGKgJjiQRx9odWYUlAi3wwRuvrZy8tLxvGgpT28H3
 ioc6kf2p7AJkeSA+UcwdrEGW/7ZnUQo8FMGE3As8ZtaZn5kUBZ56FreWaTDjXkPehJNq
 togUwtbIrC3PIjuRWW3dQgtxaQcdE1XzO6dPWW2MYME2TkoTnokD8m6KRcnAnba2jhBW
 PHLA==
X-Gm-Message-State: AOJu0Yzu6e3hYYL0A0cpaFCCg4WrSLZPzetQ61PThBx0VYwcU+iVi0HV
 E9kY0p9rssz3pwRE9AeVbxqa2CI/+Hzzna0o0hOScqXrmf6CMvbEXsiYp7SWjG1VJiwssq1DHfR
 P
X-Received: by 2002:a5d:464c:0:b0:33b:87fb:7106 with SMTP id
 j12-20020a5d464c000000b0033b87fb7106mr1879099wrs.55.1711467965635; 
 Tue, 26 Mar 2024 08:46:05 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.229])
 by smtp.gmail.com with ESMTPSA id
 bx12-20020a5d5b0c000000b0033e45930f35sm2895844wrb.6.2024.03.26.08.46.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Mar 2024 08:46:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>
Subject: [PULL 10/13] hw/smbios: add stub for smbios_get_table_legacy()
Date: Tue, 26 Mar 2024 16:45:01 +0100
Message-ID: <20240326154505.8300-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240326154505.8300-1-philmd@linaro.org>
References: <20240326154505.8300-1-philmd@linaro.org>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5jdOrNABDhO9

From: Igor Mammedov <imammedo@redhat.com>

QEMU build fails with

  hw/i386/fw_cfg.c:74: undefined reference to `smbios_get_table_legacy'

when it's built with only 'microvm' enabled i.e. with config patch

   +++ b/configs/devices/i386-softmmu/default.mak
   @@ -26,7 +26,7 @@

   # Boards:
   #
   -CONFIG_ISAPC=y
   -CONFIG_I440FX=y
   -CONFIG_Q35=y
   +CONFIG_ISAPC=n
   +CONFIG_I440FX=n
   +CONFIG_Q35=n

It happens because I've fogotten/lost smbios_get_table_legacy() stub.

Fix it by adding missing stub as Philippe suggested.

Fixes: b42b0e4daaa5 "smbios: build legacy mode code only for 'pc' machine"
Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20240326122630.85989-1-imammedo@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/smbios/smbios_legacy_stub.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/smbios/smbios_legacy_stub.c b/hw/smbios/smbios_legacy_stub.c
index f29b15316c..7d593dca98 100644
--- a/hw/smbios/smbios_legacy_stub.c
+++ b/hw/smbios/smbios_legacy_stub.c
@@ -13,3 +13,8 @@
 void smbios_add_usr_blob_size(size_t size)
 {
 }
+
+uint8_t *smbios_get_table_legacy(size_t *length, Error **errp)
+{
+    g_assert_not_reached();
+}
-- 
2.41.0

