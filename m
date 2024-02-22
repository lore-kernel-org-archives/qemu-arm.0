Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp219291eja;
        Thu, 22 Feb 2024 04:57:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW7tUkW4Lqf4gnrKUHtCxPyLD3aHnIS1JInI+NbvaNigcJOX3h2Hu9TcGuqKnBIUICgNy5jRxKwis7TNNcRo7JvzhuNugMl
X-Google-Smtp-Source: AGHT+IFp/hYC4Q98TIrF9bgKMGEkiz2kK8DdJGqKdLLKFy9yyJMQcL+2Xg+TKZto/y6vdRupCyvy
X-Received: by 2002:a5b:7c4:0:b0:dc2:56c8:ced7 with SMTP id t4-20020a5b07c4000000b00dc256c8ced7mr2309102ybq.5.1708606634983;
        Thu, 22 Feb 2024 04:57:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708606634; cv=none;
        d=google.com; s=arc-20160816;
        b=p4Ifc1cMMA0gyiMPwdwi/ei4g1x/038R0dxVrizEr4N+dIPclwZjYb7aDfKn+m29+O
         yFWQrgbN4zCTWujV/DrJ2+jsQasu99eGY8xemis91rIfQw/IDMKF/iAP5DCiUaXXRx0q
         SCi2FpdQRVLJBlLwJuXPVXqtJqFcgFTzunL2+1d2zgJ1aIiPGmz/ld5PDMrrl+q7kygr
         WQGveAsK7kNbCCrIDT9qkBhp03CLtYwd7VeORWjZpq6bG9PeehwJomvb61rz6T9JZ8uU
         2yPex/mZWzRZ+s9PbPw1knTgdG85rTClkGKB1cnH6WekV8o2q/2HHzfC1Hkx6BD9P6y6
         1nNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uRGIpW70+JCu0X7x3ntc2AVzHCNC5IMABlVBK4pcGGo=;
        fh=hoobuGUYYDvH0Swf9XQmQaugkFFBZJv1DqRpGZMnoV8=;
        b=0incPQwrxTcE/o/9/RsBGRckMjWvEk2e6ZcC2abmnN/f6x5RQkJY1XXsyrCYSxvfjY
         AWhZwSqiH6oU7lgLSEhaD/DObjSwvfRyVGaaw3EC3ziBTqXogF9ElWO8M9oUPTjzsfb4
         yukPPYYIPxNGZ4eHXpnj/ApKwhNOAyXgdhKBqHVfm0gnx2yF4bI3GZTm9ERmS+JzzzWQ
         e4/OEoHBEwFPR+t/uC+T4VU02f2ku4eCakfzqHayJEalykqIMZK8zRzjeVHpMGSdMZRk
         /1oba0B0QwkQSXd3qb40IiEomAlWLoQqSgTxGLRKZApZZVWNnolikJro9TX8xfafcf5O
         sOiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NqnX49VQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vq27-20020a05620a559b00b00783e08c89f7si12962339qkn.749.2024.02.22.04.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 04:57:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NqnX49VQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rd8cE-00066f-6q; Thu, 22 Feb 2024 07:55:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8c9-00063N-4D
 for qemu-devel@nongnu.org; Thu, 22 Feb 2024 07:55:49 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rd8c6-0004pU-3z
 for qemu-devel@nongnu.org; Thu, 22 Feb 2024 07:55:48 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33d118a181fso4157753f8f.1
 for <qemu-devel@nongnu.org>; Thu, 22 Feb 2024 04:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708606544; x=1709211344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uRGIpW70+JCu0X7x3ntc2AVzHCNC5IMABlVBK4pcGGo=;
 b=NqnX49VQEUL4rdFt3fe5ZFoouFmxkrr3E4MO2d3GD8XJUMjQkWPr4IVATuHIvsaVSH
 Pmm/1bUCy20vKN8qA+8NBf+2djsAEzPDUespYJTFTR2akoFOcHnkZQH3WuOjT87wqxW7
 BROQ4G8eHn+y8qhh1HvVDjYMhfU1QpdCuS9tXjphGslp343lC8SdPCyprTu+VtGwz0JG
 Pr8RrZD4E2B5IDVG6IFu2qLClfcdIVWmqls4mbxn7JF51iYL2Y80771Hlt8ocLBedy58
 aDRmlZAnk4sDwN0Djvm2x0CH/eABrQSb1OMNxZKqGDmHpIVXUf5eabORB3artj2Ljwyl
 4cRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708606544; x=1709211344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uRGIpW70+JCu0X7x3ntc2AVzHCNC5IMABlVBK4pcGGo=;
 b=seqrvQcdo5tOZmGxkmUwBGMhrMpsVzYvcfkBkunqVrT5O+cevnbR+AcWc/oINVm1+g
 JUk2q0N9JPbQHX2Wn1G+8bb0My/8daTdwD7Izr3lYlt5xH2hB0UtGTWjCEFhKYPKc9un
 rD9bQUtUZ0+V8MCyvSuoK+/OUSd+RdqBb/n9Z7Vsw9eTAdWu9sU+jMPd3WOqhkxSOi04
 XBiT6ygRXpjmwZYAiviZiPYdIfOTJgBhJjZuF7X49r2rOcPs9oGrhgnoEqJrYZXpHXc/
 s5pk5EcRCh2CyEYbz2G1u9ptOYaUJunBjn7Q3cH0tRU6JOCfrPN5qaMcUJ2EOs34qktI
 dHAQ==
X-Gm-Message-State: AOJu0YzSwoGqtzh1EEjVmttSgcozJa726McA2qxsLJEtFIGDK2lwBaQH
 +cFBpYKSi3Q2z69c2kAKmgw0sK8AzQJC7qO3j/EbkJqnO/UCFAKnK9pFZfRNo19ofJruT0EeVq3
 fhXc=
X-Received: by 2002:a05:6000:1f0e:b0:33d:6fd8:90d3 with SMTP id
 bv14-20020a0560001f0e00b0033d6fd890d3mr6031207wrb.4.1708606543937; 
 Thu, 22 Feb 2024 04:55:43 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a5d444b000000b0033b7ce8b496sm20291719wrr.108.2024.02.22.04.55.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Feb 2024 04:55:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 19/32] hw/i386/pc_sysfw: Use qdev_is_realized() instead of QOM
 API
Date: Thu, 22 Feb 2024 13:55:12 +0100
Message-ID: <20240222125517.67131-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222125517.67131-1-philmd@linaro.org>
References: <20240222125517.67131-1-philmd@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: osmUOTkQLuOL

Prefer QDev API for QDev objects, avoid the underlying QOM layer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20240216110313.17039-3-philmd@linaro.org>
---
 hw/i386/pc_sysfw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 2dcaa116ad..b02e285579 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -95,17 +95,15 @@ static void pc_system_flash_cleanup_unused(PCMachineState *pcms)
 {
     char *prop_name;
     int i;
-    Object *dev_obj;
 
     assert(PC_MACHINE_GET_CLASS(pcms)->pci_enabled);
 
     for (i = 0; i < ARRAY_SIZE(pcms->flash); i++) {
-        dev_obj = OBJECT(pcms->flash[i]);
-        if (!object_property_get_bool(dev_obj, "realized", &error_abort)) {
+        if (!qdev_is_realized(DEVICE(pcms->flash[i]))) {
             prop_name = g_strdup_printf("pflash%d", i);
             object_property_del(OBJECT(pcms), prop_name);
             g_free(prop_name);
-            object_unparent(dev_obj);
+            object_unparent(OBJECT(pcms->flash[i]));
             pcms->flash[i] = NULL;
         }
     }
-- 
2.41.0

