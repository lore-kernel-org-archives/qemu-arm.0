Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp64787ejy;
        Mon, 20 Nov 2023 13:34:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaJ9Fj4n90c7QUq21wWgHPEQoghEGM3qBKY2kkjuj016NPQQxnfBDOAEixxqIu/d4pEst+
X-Received: by 2002:ae9:e647:0:b0:775:9e9d:6186 with SMTP id x7-20020ae9e647000000b007759e9d6186mr8823961qkl.18.1700516056496;
        Mon, 20 Nov 2023 13:34:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700516056; cv=none;
        d=google.com; s=arc-20160816;
        b=YbOxdrNGiFDhLliVAJ6YvPFiGe+fXZQBsP3swuYFx9jPM/IfUmSc8Ny0ANIX0X+33B
         2ZacfowSEbmaQRnjIug6hMN9/h2vNa+SUQkUscW5uiEEZU2P9YSnajLM6Jv8P6Y0vhNx
         FM2Q7bzHvPrTEA6GTC+K+1S8un7sTyrUUtWuIWp+zyYANxtyd7JQS1e8zdNfuEkJaGkR
         +EaWDoWc6lcFoEkePIxh1roCag/G3GI8KgYXnRXbo0l+/Qp/VzuWnci6Fq/Mgxa8LPlv
         YY5v8GvY2BGE1ANryYx2kH+bGhiufvRNMMzJURSW8YEs5J/Ol5K2Qt01EUvAiVssN80E
         kC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yy1snK9B+SCgWiCxmQTHuCxjH+9ISs/0CoWZHoMFEnQ=;
        fh=toXMQ9nuJ3L4CLQ8EKaTQ8L/ltDlD3GauRZSJpgYVzU=;
        b=TIrn0JXF/GenTIycbvMr2fMXDXNggg5myE+ky71atrBUqIrSoGeM3p2J4t54ULLrvF
         JcGoigwCNtic8bCnRgauRLxotkzIXoavWBsRl4ZW8/So39qNCiDz7saisbal5U+A3Pfb
         9AOGMM44Gh/19wmIDDdHnO81brG2wdGTOD+/Efw929oLvmuILYG9P0eo8U7pGJYkf8ol
         aLTw+zSmAk5pX3hJAWGXN3rt1HaXXNpP6xDJor3LgbgrEPOVaoLiCqeNzLYCiQ9S/VGC
         38m7lXzy5Mcoq1FtAYt2QIVHEtfz5czhOCPZg0avKcena5jL7OzFW6o69GA+tdg5YeFC
         +arA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nBb/tg7v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea21-20020a05620a489500b0076d1c784892si7891757qkb.478.2023.11.20.13.34.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 13:34:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nBb/tg7v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5BtY-0000sY-AS; Mon, 20 Nov 2023 16:33:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5BtW-0000s0-TG
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:33:26 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5BtU-000388-N2
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:33:26 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32d895584f1so3480568f8f.1
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 13:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700516003; x=1701120803; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yy1snK9B+SCgWiCxmQTHuCxjH+9ISs/0CoWZHoMFEnQ=;
 b=nBb/tg7vnqbGh4qi0HIlSVpJFdSijMscvVO5AeDmwK9EtEwD1XMFB2FHFA8C0msjNz
 QMUXEDuqMQs6de49qxwMW6sH/+Y3/wqm95tMX8dKKSYtg2Q0mj5wOPU/dWM9vxl0TJMz
 dDIHvxplGtKyyXBvEV+X7eUxdTjRa7UxwRczhAii9OpXfUpLiga1tyvmBMfdNQB8UD+B
 nJdy8Ty9b5UIAJArKxC84DiQUq5fLsN4G6hwCx8r2zJO0ijcZs9IJcwvMqEZrp11+a8d
 QnFvC50goDhyyybdecjtSMmop3UkE6t3STiZ1WZTP7gu3UrFtFkm2KBRaYY+wnXwZbo/
 zY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516003; x=1701120803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yy1snK9B+SCgWiCxmQTHuCxjH+9ISs/0CoWZHoMFEnQ=;
 b=g5DP6Z0oPjrK9zs0neeI2BNB96LFiZg8IXODicDCaeqAbBMhvo7n5TfItAMUk9tlCr
 ILkCruIwu8J5k/I02A5P3ntwQmbzFvZ/O9lIeJN2sFRDQZoBsUbuIjVIIoRd4IDucAxE
 p79/nV96itRkf4s6FNBlYJrSGX0Vd9B2Jk/Sd0fuOxZOKOdboEQ/WmkNKHgILTyNqlBK
 X/bk9saCTokJW5waoFup42TY/s5Qtpbm/5uS9oKaWSOtowEe+NtjQ2vRgyijObpOKxr7
 981BJk4uxm2OK1Ojwn9k53OMwPHSglGvy1SuWQHKpND4VS+FdaOZ97vNg4ao/vz6A3Ys
 +ZKw==
X-Gm-Message-State: AOJu0YzgANcZXFquq2TxsKNkhnjM/4QY8h+JnaX9obNtKy3ivOKUJPFd
 FSumrCB3UMb8s617igv3iR0hrQ==
X-Received: by 2002:a05:6000:18a2:b0:32f:a3fb:835b with SMTP id
 b2-20020a05600018a200b0032fa3fb835bmr7271877wri.44.1700516003375; 
 Mon, 20 Nov 2023 13:33:23 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a5d518f000000b00332cba50ac3sm1859981wrv.45.2023.11.20.13.33.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Nov 2023 13:33:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH-for-9.0 01/25] memory: Have
 memory_region_init_ram_flags_nomigrate() return a boolean
Date: Mon, 20 Nov 2023 22:32:35 +0100
Message-ID: <20231120213301.24349-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120213301.24349-1-philmd@linaro.org>
References: <20231120213301.24349-1-philmd@linaro.org>
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
X-TUID: DBvpok8LUXaW

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have cpu_exec_realizefn()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 831f7c996d..f038a7e5cf 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1310,8 +1310,10 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
  *
  * Note that this function does not do anything to cause the data in the
  * RAM memory region to be migrated; that is the responsibility of the caller.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
+bool memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
                                             Object *owner,
                                             const char *name,
                                             uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index 4d9cb0a7ff..313dbb2544 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1583,7 +1583,7 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
     memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0, errp);
 }
 
-void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
+bool memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
                                             Object *owner,
                                             const char *name,
                                             uint64_t size,
@@ -1600,7 +1600,9 @@ void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
         error_propagate(errp, err);
+        return false;
     }
+    return true;
 }
 
 void memory_region_init_resizeable_ram(MemoryRegion *mr,
-- 
2.41.0

