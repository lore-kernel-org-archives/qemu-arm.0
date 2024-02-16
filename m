Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1151509ejb;
        Fri, 16 Feb 2024 03:04:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVR9/KirKxzZOIIfmx0/ab9i0ZIgUGcuu0IkYOfk9KHXEYId0ss2RDoEOWju5W2vALpN/W0ZVUjWU1QA4+l+dH0S2SoihHf
X-Google-Smtp-Source: AGHT+IEEkwQqPlgkAQZPO7NoxhSoqYF01/sm1wn/QXOTkZOKp2ivJ7qx3SSMIdoZDVzdNvinnmdy
X-Received: by 2002:a05:6214:20e8:b0:68d:14b3:91fc with SMTP id 8-20020a05621420e800b0068d14b391fcmr9006358qvk.4.1708081493316;
        Fri, 16 Feb 2024 03:04:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081493; cv=none;
        d=google.com; s=arc-20160816;
        b=T2UANoLPV+jNCjjtWIM0h2/5bWtnbo5Jcu/YGhm1GT8jg+w7kn8mRg6cMpXbrYjEVy
         RTTZv4y6HRrsVaA22u27gfFTbTuCO9GSsHDZtTotg/KkczJG/MHJaHTYt3bImG5BFXLy
         7PnX12lFRvb8/c27KprV4AJBbmQlHMbqc+6AxlyPu+Q7J3kkPvV7L01S41uhGN6PC/CJ
         KpnJBPmfSMzO2mF6TD4XKNgN8Z2299Ly8cGlh8iXhqsQSAea0LMt8gbA9KQXo/xg1IDT
         grcAVJ6HK2qop6NIfff4/h4vax89GQiJgVmvHDgyF42WNyWnx84wYlI9YyBu18juBjIA
         UZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=11uvKBQ22hdk4Lseo0ZUQbLGXppus19b55fkM12lrfA=;
        fh=lo699SrpvFYJnxFLZ6omanT1M6xx54FOFadsij93CRk=;
        b=SX2wkmwhPWueJ2TNOOqhLQTWdHeacn/z/JAO7RU8XZhdxXJvn744yBdNm7FFkZvW4/
         7AEMlYP9nok+k78G3RlbzH+0hIKJHRCcHKzd1w0S/Z3bopwrXuZwsdsGjl3xhgAeCuSN
         SYVhcgbw4HKv2RjBQCO5D6oxTISdOE9T3ImJTF4O1Tmiix+8xVCma6p+IhQ+6mpzTbd0
         FSoq1YEJMXH9sjBFcom1e9+XnHIOx8ngtgT/jSwQJAK9AGDieuXBJsOle3Ly/gdD3ATh
         XQ7VpYR2vg7FHfI+YtV78IfauNR5TmJqzA69UxNhgik1QW4aNTmkWY5sCAXcpfmyiSUT
         +T7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VVtEuRON;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp9-20020ad45f89000000b0068f2c61c9bdsi2338247qvb.397.2024.02.16.03.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:04:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VVtEuRON;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1raw0J-0006Jy-Dq; Fri, 16 Feb 2024 06:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw0H-0006JE-Mq
 for qemu-devel@nongnu.org; Fri, 16 Feb 2024 06:03:37 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw0D-0000oV-Ia
 for qemu-devel@nongnu.org; Fri, 16 Feb 2024 06:03:36 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33d14a711efso681052f8f.2
 for <qemu-devel@nongnu.org>; Fri, 16 Feb 2024 03:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081409; x=1708686209; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=11uvKBQ22hdk4Lseo0ZUQbLGXppus19b55fkM12lrfA=;
 b=VVtEuRONg16xx1oOe+nOWr24BGDYupjedUe7m/Ujf6aVZ+6pexCN+uWLFWnvv6/die
 f0p5imiKaKkivgTp0MnTNlr2Xvra4oKuMAKBKsNCGmky56UcgLPxTSbGVeIA7/qUmts1
 hd8JyMbK6VxjKivF4ClO3HOjxZ6DXyTYaRKR/pAf0ei7zKtKY3RtciPy8DQTwKH0O0mV
 PVUSfPxkL7VgsbizmdK9JWuw7bN5bzjwwdPbwgd6To7jkWDMgWn6WGmBNy85sAuq2WFw
 ReVQmnsYNRJuTvqgeU2ZhqCVZfMShzvN+mXHUSnP7xeSMjG6JH7Xd1Z+UHpwTVQCgv1e
 fmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081409; x=1708686209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=11uvKBQ22hdk4Lseo0ZUQbLGXppus19b55fkM12lrfA=;
 b=P7LMImfzuersiKzc/KF0cXreZa50DDJUzlHICS/l8bnSiE3OVBmmQ9Onu0AhdMm0xu
 WbwP91Y7vDbrbe7722+nfvWmGBDFpSCXkYM3kwCv2AiKGCQ14F/qiSv/1mt38CPfl3wo
 ZabAxp6xFsCzK4mhfvLgooymdqd2O05OgCMEHfHwuO3PFzGy1AolUzl88FUN3F/7QKDJ
 K25+0W5/NnT9T25uowshkzrGysAH/CbstLW2VsAf2VsVzGLkCzbznmAendixsZ0TiFaH
 zt3UO+PVxFcMzucuP4Db8YHx3kH36SMe87+mVeHKvfGsKRrd5r4fWf2uYLDchODkFDda
 81Sg==
X-Gm-Message-State: AOJu0Yz1NyKC1+SkmLc6vuZ8+u1psoXTHQiLQ8BeL55Gsy/I6eFvZrap
 E62uJ5Uhu51RlHuabSeKZvNusKkkZPaNsBXrlpSYcPKstG/4yivQKg4+yP4L4ZjOlYpGVKAS+Js
 n
X-Received: by 2002:a5d:408b:0:b0:33a:fafa:8cdc with SMTP id
 o11-20020a5d408b000000b0033afafa8cdcmr3540983wrp.32.1708081409620; 
 Fri, 16 Feb 2024 03:03:29 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 ay3-20020a5d6f03000000b0033d1b760125sm1780146wrb.92.2024.02.16.03.03.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:03:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 02/21] hw/i386/pc_sysfw: Use qdev_is_realized() instead of QOM
 API
Date: Fri, 16 Feb 2024 12:02:53 +0100
Message-ID: <20240216110313.17039-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
References: <20240216110313.17039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: 6k7XI095ZRC3

Prefer QDev API for QDev objects, avoid the underlying QOM layer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_sysfw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index c8d9e71b88..3efabbbab2 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -107,17 +107,15 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
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

