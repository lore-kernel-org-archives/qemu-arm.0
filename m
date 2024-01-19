Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp881269ejg;
        Fri, 19 Jan 2024 03:42:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErP3XHufETkWFfoqdHfAR6MkPtt5ihNuCXy7CG9KbaIkZe/dxITuZs7IdZmMHlakZSCLoo
X-Received: by 2002:ac8:5d55:0:b0:42a:2a4f:429f with SMTP id g21-20020ac85d55000000b0042a2a4f429fmr270066qtx.21.1705664564292;
        Fri, 19 Jan 2024 03:42:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664564; cv=none;
        d=google.com; s=arc-20160816;
        b=z2Dy8RPWRrHmCUYIlSkiZ9Ex5li/oFK/GnWU2L1Y8CCBYIH1giI66YVzLsNCX56NIV
         VVeJcI8V0GOWYfUDddjkOmsFJKy19+ewqzkR+wCqrhocxqUlPYzmbB5SYbpBw17dIiLc
         rQMZliXyfM6we11Kekz8nQoXs5vl71eALlJb5G/EzXWpaWSH5Dxj1wIIGMILxVH9E9de
         5nYyye02UjY+e24fxoZRmwl7HzIrMGqKaESQe/8j76uZe48yhq3X8YV9oHV8Ai8Raxs7
         kc16O+nGOghji9xEnCzAzQYE/KxU65dgV82jLYi0jMmO5DH3AFwm9umYnuDvCUpge5X4
         TEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8IaNDObNAqYNxlZ9PNSQWTtp9Qeox0bgAC84EDezcoU=;
        fh=AgN8TvM7pMmL5RKrQhAJxXwOmBywzcClhFxW1SQC+/4=;
        b=RwVfMGyeJLgbNKf7IAZLJKLUZc5DKLX0PENEkZpoHvWIaeIsNYrZS+4cQ3x7gX7Ojj
         StanrOXF8/8sJ1wL0u//aLT1OM8IDa5rbqOPnLEWBfbbSlgmxc0yqe4G0q1McJsg/Skp
         IaXlJgWY8z5DAEzY88PTWm6iXf1UrvOB1ZqQZ7ca7uv2nRVWFmuHrYBvuJmdSGA/zLMo
         1+1zWIFJZFxvK1gydOUcPQm0j95EgGQqqh4hUBURrZfD1Tv1I66hUTzatWpa9T/SKoPN
         Rfrb9bjnI9R8VmVrTcnBOf5VO+mE+rg5PumBhIHEptEY+tH8SEv8WZBBu1LzpEPGkLfI
         1WTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zk7EHrNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14-20020ac85e4e000000b0042a032f984bsi7363696qtx.630.2024.01.19.03.42.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:42:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zk7EHrNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnBo-0007PC-IY; Fri, 19 Jan 2024 06:37:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBn-0007Nz-Gs
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:35 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBl-000375-Vh
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:35 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e490c2115so10789315e9.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664252; x=1706269052; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8IaNDObNAqYNxlZ9PNSQWTtp9Qeox0bgAC84EDezcoU=;
 b=zk7EHrNrHwfkJ05cCktdOV2Es7vmqZ6eSiF9Bv5eyosrcE+eZRp86WzGl5kt1cp7QM
 IxJCCw4q4vnfe4nrMZo+SDRYMtaUO57aA5Kq0wYhk2mu1lzml/weaXP2u1EMvUaoxAtK
 P2a9CtyIQq9R8YyaBhe+VbhlMgbKcRlT721PKoVyCdoWJQ1/Hnp0pQo4aVzwVk/NGZ6q
 k7xXktBh8e6fN1Eict/W9HYJcWPo+HJwrCdqRiY4Yj69UUrJ6aL73dXUY67LNz2dN20w
 rRt0XEE1pihrlicjJGU4f8GGv/VKOBDlq7SE8IM3aI++nJXvoCEHa/USFNPFYOZWSOZG
 COdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664252; x=1706269052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8IaNDObNAqYNxlZ9PNSQWTtp9Qeox0bgAC84EDezcoU=;
 b=gBwrqcEtGFVuZ15U7XtNwUJbnhgrTl2mKiamFrsn+5RmJDX72oFRx0jLxKGIvaAEwu
 fww8APJX56cDXUlsvjGMiDG7TM+dAQbKaixPdA1t8OTmZx6m4PRZ8aofAHDbYiwgjtvt
 ToZtmccbaicaIOhPfH4XVo1nhNQbflhsxN9RIOW+faM6jhplMLAtCp6Vyc/h9XLsqjwG
 CRpHyLqsO5xkE1tr4TsWr0BOWa/VvKDxQk7SlxSwaEzXDikE8uAairChGvdzz5QZ/DOh
 0CFGRBRxjliFkd8ydQuxR6yUtz13fMLusRmogW1zW+nc5u+0/jTBiWfanutZWJoH+wgV
 tVYA==
X-Gm-Message-State: AOJu0Yz0rRXfzVEIpPX0WCJD+Xi5ONyslOGLi6fAW0X5kYN9z7IWzhu4
 Xi44wYmBnahGi9RUF/Q2XHgJ4/UQo0Lzhr7SsVNkl+810SKQMi1V3YoPsN29saMPGAoCNhhWP5S
 AZste5Q==
X-Received: by 2002:a05:600c:1388:b0:40e:43ba:cf3f with SMTP id
 u8-20020a05600c138800b0040e43bacf3fmr505422wmf.1.1705664252716; 
 Fri, 19 Jan 2024 03:37:32 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 j6-20020adfb306000000b00339208ecb30sm1294065wrd.68.2024.01.19.03.37.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PULL 32/36] hw/scsi/esp-pci: set DMA_STAT_BCMBLT when BLAST command
 issued
Date: Fri, 19 Jan 2024 12:35:01 +0100
Message-ID: <20240119113507.31951-33-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
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
X-TUID: B0n6qgSUMnmN

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Even though the BLAST command isn't fully implemented in QEMU, the DMA_STAT_BCMBLT
bit should be set after the command has been issued to indicate that the command
has completed.

This fixes an issue with the DC390 DOS driver which issues the BLAST command as
part of its normal error recovery routine at startup, and otherwise sits in a
tight loop waiting for DMA_STAT_BCMBLT to be set before continuing.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20240112131529.515642-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/esp-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 875a49199d..42d9d2e483 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -124,6 +124,7 @@ static void esp_pci_handle_blast(PCIESPState *pci, uint32_t val)
 {
     trace_esp_pci_dma_blast(val);
     qemu_log_mask(LOG_UNIMP, "am53c974: cmd BLAST not implemented\n");
+    pci->dma_regs[DMA_STAT] |= DMA_STAT_BCMBLT;
 }
 
 static void esp_pci_handle_abort(PCIESPState *pci, uint32_t val)
-- 
2.41.0

