Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1867320njc;
        Tue, 26 Nov 2024 00:49:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcH6ZidzhZZ9LgbRsrJB/f2CRvY0d/iQ26sTj5WVY35e/EdN2PEQY3qebsQdjsLMl7z/TrItigndIkAA==@linaro.org
X-Google-Smtp-Source: AGHT+IHLQUbH039aPD+zkBC4TZb9/GPRnv79q17y0gHy/9FSRIARHFG/TMIv4mpWVYHaunEqIxqP
X-Received: by 2002:a05:620a:17a9:b0:7b1:1352:66fa with SMTP id af79cd13be357-7b5144f019amr2532843185a.30.1732610997008;
        Tue, 26 Nov 2024 00:49:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732610996; cv=none;
        d=google.com; s=arc-20240605;
        b=QBfqrFF+oV1IW9rkGnZKm6Qc8Z/gTzc3/S0UrVXHUjGlUBQ6Zy+x1iiTWoV9P/1oQ2
         BrZrDh6TT5/mmg9mIrjBCkiOm3ELyS8UJ7VjntmMbz8ydqdPYtgDel5wJ5116ZysKwrk
         3GP4Q0U8EdMNZOAJPC5Ustf+Xvh6hu8vv1aW1uMu6PzaIPR3rlxKyBY3zYb5+Z+UxVcF
         WlHDTX5FnjEsv0KYL7xTC6n/6A+hcwmWHj6pOawRI/yE4ig/xSqeUEq96ILCQSnK8Ydb
         8dsQlekYcaHrJ8Xs/sWsf9ssmz+doPescnJ7QBDdcEc/ifZftQcWqff6Gh4sH5wiiA5m
         T8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vt+DBc9E7puNWklMEXZgAviwA5/ofl4yBlgoefDshmI=;
        fh=ESjUfM4c37P/9Lu8MQ3JoDWZB6LMEAG+sEAqo+2l7RY=;
        b=GDNkzAraDA/K3RH2lMh2ytXJE3xVoVp+vyplyr20CfKmvWV9zepGS4ba6J1dZkYVIM
         /hcM6H1yHrq60bcTZHwjr7T1Hv24sLXIDcSsYSAzP992ftWR4sk+0ntQk4qLjnU94a6G
         1rAcUnzwHVnYmjKpbV2e1uCDB1MhLzgzhBxqBIDwpp33zxQ0LNiv1VFgy6AlIpYg5miL
         LZldUGusqbndKXXJcxv0urM+2Z+5HVvgJ2tSgfC81RMxTo76qFtc8heVaeldqGZ9YFmS
         GVpH36YCBZPs1Ld9i02J+FL9cLW7tDKa02hQMw7PFTD2/V60HWdmUmo3TtutB/O1sLyW
         L0uA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tQg3Jq5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b66bd309casi476867085a.512.2024.11.26.00.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 00:49:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tQg3Jq5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFrGR-0003TA-HD; Tue, 26 Nov 2024 03:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1tFrGO-0003SQ-It
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 03:49:40 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1tFrGM-0002ja-RD
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 03:49:40 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa560a65fd6so189740366b.0
 for <qemu-arm@nongnu.org>; Tue, 26 Nov 2024 00:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732610977; x=1733215777; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vt+DBc9E7puNWklMEXZgAviwA5/ofl4yBlgoefDshmI=;
 b=tQg3Jq5DZnvfe9doH6WxvWW/akicfU3lIpu8GezrivQC1w2ZhycvhPMCY9VHcuc528
 ROtGO9fcjagM1aUFLoVSskooSeJIVulSuRT7nOjCaPBafslXk4qFzcH+0NLG0cO2ZNCy
 SxzQbrEOaxeJKVZua5KEYV8UqznE52gYZ8iLDlGoMWMy1Dud9IOEB4qzxFjUqVAqFzk9
 DzYTT7cd6vUiudaq/SuhQ9OERHSv4mvAL0WaMR+25T2UgE5xEuIaYck5S8tPJcH4iscK
 sXmtIOjnK4igDsVRgJgbi6he4JiXTz7YlHt6DSiz3yLdJ6RMrZhJFwnt3bH/fWg319On
 K6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732610977; x=1733215777;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vt+DBc9E7puNWklMEXZgAviwA5/ofl4yBlgoefDshmI=;
 b=VArbzJ05uqrpCybpiLdv+G9mFrM30PAibNc5Y6tBRI15OpzM3zfWr98J/ufmdm4jWa
 B8PCE8cSkG2YbZtpJrK/hyNmCvPfy5SgDh7pfattp4/PV87cLls5AmyUIYAloRFJkBAL
 Gx4lTj0WFPjlj3IbhOY8TbagyZ+Mg3n8rdaxixcT4SH8Lcmu7rAP5D3oIKp34F50feX4
 +6zZFjemJbx9MsIIrYS7pO5xNG0NjhtZB/nLk2HIDP8M6qFie0aFL06I3jAzGDnE1KNF
 BHMNvai1nCY/JEapceCBCowDhoDCzq2kcgeCV5K1r3CDAYEzxXgFyXo3Qrkt2ZPatVpn
 0UqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo1IReS3v1edC9ZauG1ICrbX7Vk19Ei799w6FopILZ4+BhFL+y4SwUDhZ1elCylEDmxgKbhEK9ZQ==@nongnu.org
X-Gm-Message-State: AOJu0YyRNFFGCNNXPjJ1/8qQz3z6F2zOu/3YvlBCwXGYJolHXp/lCQBM
 Jt/hoO3InLsPG8t+gRXHBYQt5aVD1V3q/Gg3CD8UckTwBEqqIBKiOTd9B6sitHg=
X-Gm-Gg: ASbGncvX8jQZ1Qt2ncPR+gVpyxsDjNtSfcKFl2qCf7ERwFi+iOUjtcMvtmiI3BAYOI5
 +TeGWirVZATbQtraMyL4v1h0iLWBZIiBa1HmX8cqtg+cH5767NIPRDtiy3jMK0AsbYMz6VUuG7j
 WJpfD7Mue8VD9NZaMZNd4PF/gYLu1kZW/G32SVSudxizmqAzM2lX7Y5va3eMa13AgEQ378t/NDP
 NY2EGz7Qeoksp48JAQjyGauEMDDTxqR2wwEQTg6GzzkmxkjxaE5Ga5qb4PFdiLBzPMeq6CEVpiQ
 mSy0rglYBxVuLAQjnJNVAsdieQ==
X-Received: by 2002:a17:907:7809:b0:aa5:2e06:7e18 with SMTP id
 a640c23a62f3a-aa564891059mr223979966b.10.1732610976879; 
 Tue, 26 Nov 2024 00:49:36 -0800 (PST)
Received: from applejack.lan (83.11.10.28.ipv4.supernova.orange.pl.
 [83.11.10.28]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b2efbf1sm568553666b.44.2024.11.26.00.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 00:49:36 -0800 (PST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] hw/arm/sbsa-ref: bump default memory size to 2GB
Date: Tue, 26 Nov 2024 09:49:28 +0100
Message-ID: <20241126084928.252067-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: iQBWMTGLUgGo

We are working on adding RME support to SBSA Reference Platform.
When RME is enabled then RMM (Realm Managment Monitor) takes 1072MB of
memory for own use. Which ends with firmware panic on 1GB machine.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index e3195d5449..2195465202 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -901,7 +901,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_IDE;
     mc->no_cdrom = 1;
     mc->default_nic = "e1000e";
-    mc->default_ram_size = 1 * GiB;
+    mc->default_ram_size = 2 * GiB;
     mc->default_ram_id = "sbsa-ref.ram";
     mc->default_cpus = 4;
     mc->smp_props.clusters_supported = true;
-- 
2.47.0

