Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp65561ejy;
        Mon, 20 Nov 2023 13:35:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRlfQwpisHgHZwEHG4Iguwi+v7jBTZQIKEEJH/5rWfvlNMY6Af0+gUMYTJfyxa2njeBT4F
X-Received: by 2002:a05:622a:14d1:b0:418:125b:2cfb with SMTP id u17-20020a05622a14d100b00418125b2cfbmr10462429qtx.3.1700516157513;
        Mon, 20 Nov 2023 13:35:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700516157; cv=none;
        d=google.com; s=arc-20160816;
        b=FW+8nSbCRfvy4I039PhCEavLqsyouFVN2fNz1YS4EN74X/RSHghTwhfUzu5d9c0ZP/
         +VOFYyQTTWHwXAq1rWezEI7+vyaT4bbyfyECvswG9WUra5ON8SdJPFAEc5ropzsfTxrJ
         W1vE2K/2INWnpt+CypI/DHGdZGT0vGpLPFc0v2BWI/l1fv0IDbI0sBa+RFi8pLoqaGPe
         uqqTJDXbjOm76KnPUOVxG99NfekTl+eugWkj4S01BQv/H0I20S2HZ70xvP74JV/mQnkZ
         7izQWhYec6g8pdM+3N7rdVCkGH5E3LH2zfy9Vltoi4XL2nqw3AmKKJQ/c+A157BXgovx
         JySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7Db5rVC7IYaMSjFIzhw37gGhb/kt8tXVyhffbU+sslQ=;
        fh=toXMQ9nuJ3L4CLQ8EKaTQ8L/ltDlD3GauRZSJpgYVzU=;
        b=khjf2axtWasNamQB7o639HCjU1v16kbeb5mqeEMZ11yUl8KeMriBs8rQmrMGeR0krY
         fdbUkCG1/3ckIDCs2EyIzZ4XwUwa6vzhMlJsjK+v12PSoglDq/kTZXo3reUcpj05Q+St
         87Wr5OYVaEsCtxBStCFMJokA7xsNN1GeAC8HUgU0jWtbuaNMcSdL7NnPotrg4fczg0F9
         jdL4EJhdq1pVT5RPcXmLpV3+heIYDXRP7TlTVBUegKyHJjp3gxhjYwejCEj6PXkW/jDz
         iGO6Nti5GpzFUNQ/D/AMtQ23T5HSezGS3eLhIf3oz85FV93hEjQyqeYxd8SknXpptPYW
         OaOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eqWZvHHq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bt3-20020ac86903000000b004236db95a33si438584qtb.790.2023.11.20.13.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 13:35:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eqWZvHHq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5Buw-0002LX-6O; Mon, 20 Nov 2023 16:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5BuZ-0001vB-4L
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:34:32 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5BuV-0003Xs-WD
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:34:29 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32fadd4ad09so3649609f8f.1
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 13:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700516060; x=1701120860; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Db5rVC7IYaMSjFIzhw37gGhb/kt8tXVyhffbU+sslQ=;
 b=eqWZvHHqCa+ofTZ70YtFMAOY0fivaadnc9qLJjDhm3HkjFL5+MlNTSvtwFqp96aNaK
 Qq8rryfyVDyjXvBO0D+eVYZJzefV5lcUcaN9DC1YFh96BdXWTkIUF4tk6hFg8cDlja8o
 ZogAmQfa9BD3FbQqwCsUqQUmOYhTsqO+3ofWpUYlMIJoc6CZsr+sqnW1LcFP8+VVHMNQ
 xXGDPPgAseDn3wZ/nOWSmJrELLEwSxBcaFbWlh8/a+gVBN4e00cxRULX7cdqnBurmnWv
 VtmxQSU05l5LJorhE7IMgw0IZ/CW9xf57yhIF3E8CLDmxK/9JuiyItcMEmMl/Wy6Wfmo
 140g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516060; x=1701120860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Db5rVC7IYaMSjFIzhw37gGhb/kt8tXVyhffbU+sslQ=;
 b=eEwdWbhTco9FTixkOjxS3OnarwFe8DxGYcq9s6KQYqAh4qypE+tu0WgxK9v9+W4KE5
 VZtPvvPLu38YpUOLPEZibYSsWrsPURKL6nJ3stHZkb3iFwSsCafILpnV1yUiRiP7oo1Z
 JtPUQFHT2V4ysQcTxE3VufhhNResLyUZDb/yoZfovpl6iYYZuD9M8xp3HefhNZhVaGwr
 cY4UYZlrLpjNGbITjKtY3MnpVTvW9mar+1+823lqE8s64maJ694eVGXncTnY3ptVyDuN
 0xYtMdAoo0ldX3xHniotnKTXcXXIvGJfMmsshHzHQJs8tW/SNgoTx8HO3QUQj/rPQcQr
 jmSg==
X-Gm-Message-State: AOJu0YzSU6VQyQOvxT47oTQCW/YKFbrQr9KjSJEEsmxuMLwVq3TPt1Wb
 KBUcckQ82tijuZ9PMyDti/uZOA==
X-Received: by 2002:a05:6000:1acd:b0:332:c2ae:ca4f with SMTP id
 i13-20020a0560001acd00b00332c2aeca4fmr4041008wry.46.1700516059836; 
 Mon, 20 Nov 2023 13:34:19 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a5d5381000000b0032f7f4d008dsm12298763wrv.20.2023.11.20.13.34.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Nov 2023 13:34:19 -0800 (PST)
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
Subject: [PATCH-for-9.0 08/25] memory: Have
 memory_region_init_rom_device_nomigrate() return a boolean
Date: Mon, 20 Nov 2023 22:32:42 +0100
Message-ID: <20231120213301.24349-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120213301.24349-1-philmd@linaro.org>
References: <20231120213301.24349-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: DuRO3i2cf44K

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have cpu_exec_realizefn()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 9d9798a527..e2cf3e58de 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1523,8 +1523,10 @@ bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
  *        must be unique within any device
  * @size: size of the region.
  * @errp: pointer to Error*, to store an error if it happens.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
+bool memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
                                              Object *owner,
                                              const MemoryRegionOps *ops,
                                              void *opaque,
diff --git a/system/memory.c b/system/memory.c
index 2c764947fa..1cccc4b755 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1743,7 +1743,7 @@ bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
     return rv;
 }
 
-void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
+bool memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
                                              Object *owner,
                                              const MemoryRegionOps *ops,
                                              void *opaque,
@@ -1764,7 +1764,9 @@ void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
         error_propagate(errp, err);
+        return false;
     }
+    return true;
 }
 
 void memory_region_init_iommu(void *_iommu_mr,
-- 
2.41.0

