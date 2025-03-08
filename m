Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp307535njc;
        Sat, 8 Mar 2025 13:39:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWIUG95tqKKb9+ioB3AocaS7l94U7P4gX5bJy0N12e3I+rC8j8+mkp3QpSRPcZzibfhUfTEvCY/ihxW6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IG60lmno41dW8gV42mLTfwEEWzNUKzt7rl+lKrSS4cuoaPiaORRYve0JeMU/QCCRynAXlxs
X-Received: by 2002:a05:622a:1a08:b0:472:1225:bd98 with SMTP id d75a77b69052e-47618aeff94mr129410831cf.50.1741469954835;
        Sat, 08 Mar 2025 13:39:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741469954; cv=none;
        d=google.com; s=arc-20240605;
        b=DTyjm7ghIhqXbc/xHc2E0EK+eDeMx+mnl6kzJ6sNJS+EtoMpck/X1Pr7Ydnlj9DqsA
         /kA67Y1Epm08luqqzYVKlnEk2KMB3ifiq82/mAiqHfg9l/BSZ7HUMRmT6NuSxNiPW+Mm
         x1BVPBVBTbUpejvwOq4Kw4cLGFPB3nvihhUbZamXvbX60HWZqvHSJ9Jzzv/bTxNlYz20
         0kr52AOYDkMbAe0pS+lXMZZ8DRjmpPWzKnX7r2C+KYL/3gRiaeN+p+bw2BG6Q472xYaS
         5+pTuAPsusnvxUm5sI2Xju3W42varU7YZujPqQowAmcariz/eCjDvAnK5DGIYsHwevGM
         BfHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rMei/vL26mhTGl41GbDkmhJ/KXJkHCw9uJWhPvP3Z6w=;
        fh=SrOjxuqe2cGY/mGOFHQ7uubiH8Lzvmt7mGgHlxBO2sE=;
        b=bAMoIVPu+c6ZV1Sf2BQdC1xR49zEsHh14ft//RuGfWWeX9qwgXUqA2teWJyCVa2D7t
         cPwz3Mucew5p0JLKmCBDxvMiNqklZyjjtVVqZSTTpkQOC2ReB7KL5/z0yg+8KCh65dps
         jmzP3wjSEZQtUp+uj6mX8/1jI8upBAl6h8W/B9PgGxAvme6w5/u6Ue1ltWX8KSVInh8M
         2isucXbza13eTfFZwfElIvMjen3i8Q9w9pRPonwhgLMCeeLujZdXPBovzu+wvlB+2sMH
         S9IxbB+Nnk8YNbutiVhzs2OX03I9ImSLKV5129IHoYhtdhlXnDbjAfIbmypFG6UspU1e
         B1WA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z21EBV6y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751d97f95asi61643881cf.85.2025.03.08.13.39.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 13:39:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z21EBV6y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tr1sM-0006Uz-Mj; Sat, 08 Mar 2025 16:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1r6-0005So-1V
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:37:12 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1r3-0003uo-VS
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:37:11 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3913fdd003bso141162f8f.1
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 13:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741469828; x=1742074628; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMei/vL26mhTGl41GbDkmhJ/KXJkHCw9uJWhPvP3Z6w=;
 b=z21EBV6ywampdlYy9NWn0h8qF97tiG4m7PZ8R8IpoeDMX38WmkAJeyGtp0kH65jScE
 dEMKQX+OAIFvFOl8T77+0znMq/WqUXG/oFgmbfRpt2OC7+YZ0E+LLSZmH7IoAtouHhZl
 G9WPreYQlzBLHkooGOOIJduJ7+ZvpN2phoP+fDW2sTDKaM+Ddypk7silPClBxrdPqE4p
 fK49IgKhbOrh3egOzbnlZeWclQ9Hx5iHs5Xdf7PXre06/L/wBWLadCR6eQYPovEAf5tS
 AjlraaORfV/OGgBy0QxinZDkGo1gH6EfI89hCeknkmFyEufDCB8LIf1HBMBtHy4eCmtg
 s3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741469828; x=1742074628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rMei/vL26mhTGl41GbDkmhJ/KXJkHCw9uJWhPvP3Z6w=;
 b=G3aqxr+CHWw2eRkNnDgEAjYnB0ua3xxykWBKULl+VXFLtrtZJ58ygDvNqe5TCT+uoY
 dMrkYpFKoY4dnMwi3E1TEWpbrUBB/2ze+D3dQsTmLkPD7DOyebOsf4eFDm+BN0mhFRxU
 a2idF8TPnyu6CdBDfhL7Nf2esc0XeAi30hB01hv4ZYweM8iI14JnLuffMZKQD6AwXs/x
 eA8vL2ms021m8cmxd7l0bLIWz4XBZBlqtz2uj10IFhRVaG+zsa65JLPb12jSenKPtsNy
 CWdwW0/vrJbMjpHNnEmTpCQSoSchT3cc6E0vpvPngtGe5owLUBXozrP0PvIu6N2EuLby
 esDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHkerlkkrFFEKL3Rh7Ats9ARuY1a6Qdf5tYlRdsPm5EFOC7hEVN0m5q/8HgSzdVmwlIvxUagEP1w==@nongnu.org
X-Gm-Message-State: AOJu0YxdWlZIRmK7nBbL3weaDdM896nflNC4hSDKbRqPe/9GiUBmSLNw
 KpRpk0IttOYjOD+KsnwNvSK19Ad1N5vlIUeqknd3gjZl+hkB/QsodTI+1rTHxlM=
X-Gm-Gg: ASbGncsho0ml07OdNVMokQEd4SUfCVJch2salyPj4qsRdUS2RFDi10FhvulrxXccvq4
 P5P0MHBFtpuIKvzcbeUPGH6RaRNH8SubW8PIhmxzidoHT4oSkoj47SvjidTW7VYH9N8kFvAZUko
 CmD+TSPDHHUcX/Jn8bOJnqLw9JDmhQYqgExezrYGJYktfmDwhpHbhPMRuxuEbMZwpNn3uehGVrM
 j9lf7p9Mv/pGEnzn3ZDC999GnhC5Iv3qNbsM0vg9WX3vFGdx/mJoAGG/w4qtQxxNim8zponthDw
 H/zaS6pW+q6b+yhUsdYMKus1SigPpZq9xcQNeSpd+TOYww7a+uKuxBQ04en3/TmABNpNqjjQ8N6
 AaxQKjcBXEmWmF3DmuqM=
X-Received: by 2002:a5d:6d84:0:b0:391:65c:1b05 with SMTP id
 ffacd0b85a97d-3913aef5f15mr2375513f8f.11.1741469828116; 
 Sat, 08 Mar 2025 13:37:08 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0195casm10040270f8f.53.2025.03.08.13.37.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 13:37:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 05/14] hw/sd/sdhci: Make I/O region size a class property
Date: Sat,  8 Mar 2025 22:36:31 +0100
Message-ID: <20250308213640.13138-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308213640.13138-1-philmd@linaro.org>
References: <20250308213640.13138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: s3tAYQSi01U7

Be ready to have SDHC implementations to cover
a wider I/O address range.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h |  1 +
 hw/sd/sdhci.c         | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 0616ce3aa59..2709a7a69d5 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -113,6 +113,7 @@ typedef struct SDHCIClass {
     };
 
     uint32_t quirks;
+    uint64_t iomem_size;
 } SDHCIClass;
 
 /*
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 2b7eb11a14a..637067fef50 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1443,6 +1443,8 @@ void sdhci_uninitfn(SDHCIState *s)
 void sdhci_common_realize(SDHCIState *s, Error **errp)
 {
     ERRP_GUARD();
+    SDHCIClass *sc = SYSBUS_SDHCI_GET_CLASS(s);
+    const char *class_name = object_get_typename(OBJECT(s));
 
     switch (s->endianness) {
     case DEVICE_LITTLE_ENDIAN:
@@ -1468,8 +1470,9 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
     s->buf_maxsz = sdhci_get_fifolen(s);
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
 
-    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
-                          SDHC_REGISTERS_MAP_SIZE);
+    assert(sc->iomem_size >= SDHC_REGISTERS_MAP_SIZE);
+    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, class_name,
+                          sc->iomem_size);
 }
 
 void sdhci_common_unrealize(SDHCIState *s)
@@ -1621,11 +1624,14 @@ static void sdhci_sysbus_unrealize(DeviceState *dev)
 static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    SDHCIClass *sc = SYSBUS_SDHCI_CLASS(klass);
 
     device_class_set_props(dc, sdhci_sysbus_properties);
     dc->realize = sdhci_sysbus_realize;
     dc->unrealize = sdhci_sysbus_unrealize;
 
+    sc->iomem_size = SDHC_REGISTERS_MAP_SIZE;
+
     sdhci_common_class_init(klass, data);
 }
 
-- 
2.47.1

