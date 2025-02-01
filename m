Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp942557njb;
        Sat, 1 Feb 2025 01:16:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVMrO3JyscRB3B9JY0Rdh0jiVxo9Byc9+ajMR4Xu6Iqb6uE8alBN+ojiFx2n9IA+pQ5mpQ+5y65E18Jjg==@linaro.org
X-Google-Smtp-Source: AGHT+IFgYtTMQM3/RTBG/09gzwxJwefWGtY6c37RgXOAPxzWUO0wJLDjEn8oUnsm35SssLMuHOib
X-Received: by 2002:a0c:b4da:0:b0:6e2:4575:6bd5 with SMTP id 6a1803df08f44-6e245756ccamr129634346d6.12.1738401395773;
        Sat, 01 Feb 2025 01:16:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738401395; cv=none;
        d=google.com; s=arc-20240605;
        b=Qeg+07LHTTUCeeMJ4i81rM9xqS/nIY49C/1nbQzRmaT2hQqVuFowGEjipVP2zJnV/w
         QIfAH9zl+lvMzltRJaQN0rPcpQ0xPMRBIH918v3zONKchJtl4JShKz5mRa3boB1cVMzR
         ovIQkEBGtnLuNmCwc9rRK0xis0aXodvsKxE1ut9waIKinbD50MI7WKu6QJEVZZ3yzBTr
         YANE9zIzDC8GvZheh/Fw9HZ+izvbQHcQymaXsKr4efQOOfarkSUhzOwyOgn9j1qOJUJq
         bUwBrY3w5nIwLgNTeZj69cH2/KxILtwholl9zYNkM8Zcc81CREsx77aIjREnhLdpfNkP
         Ea7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h0KOfqY1jZzuDBLOoyIvqjDh4dLpYlCKlbjmZKCpncY=;
        fh=ujy0PWdnTQbfnP+OWSIAlk8IwtTTJWDWkx+rXXup5VY=;
        b=PbEwKc4kio+IeQYGVGqtJp8sikRdMMKwE93+qvzdu6GkV6VvS+/h8UGRNpENB8cgi3
         DyQsM7kDb935Zrhd+HjJ7ydlX4JNtb76WXKMCZ1CAUDM8xIlVjDUE0Hl9P2M/RFGnnx3
         +zWO6RwpdjCFQChjxjNOEwE2/at6n6caQZUIL/2ZkzUgsnC3oKHgfW9gyupRkBEbkfdN
         qg/cbv4MmAp9ry/6QC4bsI8ea2FUNuOvcClBQQ6Cl5Nzb24odOAgOtEpc7hvQ5LaQDia
         F4/LnEn4I7Sx/U/fNaJbl7XZEhe5VhrrpjtWUXhLJ8pdDI8SqXkCQtqD/ucPv9IWxRKv
         UMHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Cgql6/Qt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2549994b2si52632586d6.270.2025.02.01.01.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 01:16:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Cgql6/Qt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1te9bs-0001BZ-1d; Sat, 01 Feb 2025 04:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9bf-000147-UJ
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 04:16:05 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9be-0000jX-H1
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 04:16:03 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361c705434so20721295e9.3
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 01:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738401361; x=1739006161; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0KOfqY1jZzuDBLOoyIvqjDh4dLpYlCKlbjmZKCpncY=;
 b=Cgql6/QtC1u95c6dcBjJqqWEKbAnv4ORmQ3frkiUrZR0T8c7PWXOVFh+FFbQI/D88U
 8KHEv10VmerLvP83375WosyKQmHnfocIT8upHwV4dHWMACWHFwf4wYj/LhYogL/slVbN
 /XGQXeylVD/eu0UkqMcdsQzeR5qiZShsQueEEUh+fA8KyakjrVY6nbgS+hVp7BPHJTsw
 zkPbYtFbB+uHkJsBmZrqQ7bKbH9ggT4kQqv81Ok8q19gxr6a/pDMPNnx9970VKhsDaEO
 PYCJEaX/u2t7E4BbQmzxud3eQh9zHSjY/5WD3/hfwFOTAoJYRFNMq7rn4rL1J2M1FlP6
 ePXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738401361; x=1739006161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h0KOfqY1jZzuDBLOoyIvqjDh4dLpYlCKlbjmZKCpncY=;
 b=OFPdQMTXlHNXhxT2JRuP7/uqQ7JdzgfdPsEDzJcQH2otIhieQOZTo7CC654uHB1TJN
 lRuRK0to5Hv8Cs+PWZu1mSr2uwqXTs+7K9d0EyJlm7tq05/KHvrJduExmYTSpUANpLdM
 GsdDwHBu5+M5S+qaFy8SZX3GjJrKFakA6WGhc59g7iR2IbXeOQJOVJD/Qu4IyvObCLk2
 l/d5frUgsOO/ftZiLCVB8G0SX8aEZJOxXgGVEs34r8lPmDCJdLYE/nQB0vfAtwGbnZsC
 45VBJpgA41UVMW5H5VqlP+cz8Q+w6p7BlJwmErJWPjPtYvEFYTWhbkasGFnxPCWo1bI+
 Zl0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcRbJhlyCSEEFCth8CqlIBd0FfdVl74Y9gNwFnSCkHVR0zm0E0czZPO2eNZRp3rIyj5ATYBdPLbQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzi1qj1wtAsipHCDN19jRVMSU6EwGCxfWYeK6NthQtbsHD6osZa
 4N42HFmXjv/r0AsjtpsgvLd0G4c6DXPIQPXZCjx3rkuBJAMbR3A1cWWxYlM/0bQ=
X-Gm-Gg: ASbGncvyOZ0cTB2grPOyj2FZQXksw8T/511qaMIE9DZ3jl04PHgKqhXtuYWF6Ut25gZ
 tmIG+rYP3PIFD+L5gn1MNTO+YaXKaV1u7DcZXKmIzaaFKcUGHKFE2/ksx0HedEr596vLGpBUdS/
 dRWcngOuKALJDeaReZ0YmZI/CUiSFcdCsXOfGnyQzEOwZVW0AG5rNRidapBxfgXgve37DMkE6q1
 W+XNnBhcW7LSNK8EpHZWF8xIpL5eq18dci+j83p7rcPndd8QfyC9Zq8nTVGBvaK3nXP0oq2jQCq
 0venx6VO6dOuwEA3+tfBiIL6G2yweP6D302G+7e9dUsoL4mlhofnl9QGy/+CkdENPg==
X-Received: by 2002:a05:600c:154f:b0:434:a367:2bd9 with SMTP id
 5b1f17b1804b1-438dc3ca79fmr141484875e9.14.1738401361073; 
 Sat, 01 Feb 2025 01:16:01 -0800 (PST)
Received: from localhost.localdomain (232.170.88.92.rev.sfr.net.
 [92.88.170.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b5a03sm6766496f8f.71.2025.02.01.01.15.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 01 Feb 2025 01:16:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jared Mauch <jared+home@puck.nether.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/7] hw/arm/raspi4b: Expose the raspi4b-1g machine on 64-bit
 hosts
Date: Sat,  1 Feb 2025 10:15:26 +0100
Message-ID: <20250201091528.1177-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250201091528.1177-1-philmd@linaro.org>
References: <20250201091528.1177-1-philmd@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7RNogqCr3IcC

There is no particular reason to not have the raspi4b-1g machine
available on 64-bit hosts, so expose it there.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi4b.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 713b4693a49..59b0d2ced44 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -107,7 +107,6 @@ static void raspi4b_machine_init(MachineState *machine)
     raspi_base_machine_init(machine, &soc->parent_obj);
 }
 
-#if HOST_LONG_BITS == 32
 static void raspi4b_1g_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -117,9 +116,12 @@ static void raspi4b_1g_machine_class_init(ObjectClass *oc, void *data)
 
     raspi_machine_class_common_init(mc, rmc->board_rev);
     mc->init = raspi4b_machine_init;
+#if HOST_LONG_BITS == 32
     mc->alias = "raspi4b";
+#endif
 }
-#else
+
+#if HOST_LONG_BITS > 32
 static void raspi4b_2g_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -131,22 +133,21 @@ static void raspi4b_2g_machine_class_init(ObjectClass *oc, void *data)
     mc->init = raspi4b_machine_init;
     mc->alias = "raspi4b";
 }
-#endif
+#endif /* HOST_LONG_BITS > 32 */
 
 static const TypeInfo raspi4_machine_types[] = {
-#if HOST_LONG_BITS == 32
     {
         .name           = MACHINE_TYPE_NAME("raspi4b-1g"),
         .parent         = TYPE_RASPI4_MACHINE,
         .class_init     = raspi4b_1g_machine_class_init,
     },
-#else
+#if HOST_LONG_BITS > 32
     {
         .name           = MACHINE_TYPE_NAME("raspi4b-2g"),
         .parent         = TYPE_RASPI4_MACHINE,
         .class_init     = raspi4b_2g_machine_class_init,
     },
-#endif
+#endif /* HOST_LONG_BITS > 32 */
     {
         .name           = TYPE_RASPI4_MACHINE,
         .parent         = TYPE_RASPI_BASE_MACHINE,
-- 
2.47.1

