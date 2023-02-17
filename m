Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1535818ejb;
        Fri, 17 Feb 2023 06:20:04 -0800 (PST)
X-Google-Smtp-Source: AK7set+CP7iGKDjMwC3x+11q06h0IBqJZPwqCG/9Qy4NqyR0j5HIsqEQamk3AIA2jZIjaPQjTSdn
X-Received: by 2002:ac8:7dc9:0:b0:3b9:a60f:b2bb with SMTP id c9-20020ac87dc9000000b003b9a60fb2bbmr986810qte.56.1676643603808;
        Fri, 17 Feb 2023 06:20:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676643603; cv=none;
        d=google.com; s=arc-20160816;
        b=n6nGgRsuJnWXTZ25xTP0Yabw7dwefsFGJOa1iyamQ27eUOgn2TQioUMoeJPM14Hh2u
         ZLgxCi79E5y56zTgHMJAEWjXwmzJVvSM0VelUtfHMRqi3eG54I8qQLc2lAAux6i+9KyP
         BhGnxGJAq3DWszRLV/N6lh7DYuyMTG3KFjj7/UzNwHERrqGbOnAs3+ipPdrwPRdUl2Oz
         cLe2uvUIwNNxGKB/qEq0r5SvySjq/2EwpVx7c3ym51RNa/Ndv242GAgOQPVcuXD8m/a7
         ACLVQwosR0z2B4li476CAlE7CP6xhvXDtEahXH2bANGdqZZAM8jHGujWbQaFgcMPVkg4
         qEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AmdraG6wSunb7ZlzZqyn0FBRFU3it2FPZJFh0CF4PdM=;
        b=H9WBtY6iOb+T4VuFyjdHn7w69zcC9eTEc8GthKjfVemQSqHVP23C+jUt9TCVeT2aGs
         xyTkU7Ga0A6TIaiYF1bv6MTpTHezQCZ+Da2M/HHv3zkq5vVaujW6qezgQtFR3Kklhqke
         Z8Abjy+lBe6nr8BbB0QGRwEw7+f19qVZeeUmoIlGapuUVS/z0HBBCKgMx3B1osFtXqyQ
         /XvHfjIVizQqvJy3Xq7TP72b/THc8R10hJhl59wnUzoblAKlAUp61oQ2notXI2wj0ZZ9
         Ym9bGuXJ0pO/GTvAGFG+JBjLVQeTQdxa4zLj1HdTOYSHMWKD8LIJn+T9NT1ghHqRXvRl
         t+sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xwfHSGzJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12-20020a05620a288c00b0073b6ee15dc2si3634906qkp.317.2023.02.17.06.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Feb 2023 06:20:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xwfHSGzJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pT1Zs-0004z5-Ep; Fri, 17 Feb 2023 09:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT1ZT-0004Ze-OZ
 for qemu-arm@nongnu.org; Fri, 17 Feb 2023 09:18:46 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT1ZR-0005UZ-KA
 for qemu-arm@nongnu.org; Fri, 17 Feb 2023 09:18:43 -0500
Received: by mail-wm1-x336.google.com with SMTP id p5so1075481wmg.4
 for <qemu-arm@nongnu.org>; Fri, 17 Feb 2023 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AmdraG6wSunb7ZlzZqyn0FBRFU3it2FPZJFh0CF4PdM=;
 b=xwfHSGzJNDhMKANmdgxutSeNW6nER18v9Kq4VVOVjXfogo878eiPUKNmJb7y/BU6Bq
 k669jq4sWZo1QXeM5hzkg9tK2yxvZulQeN7RkFf4CRpE1cjXFOgUT3HxEKPt8L8Xcsqf
 P+EKN5C8BljcTZZI3aEsEV2jXQn66sCtOmmMkA++Ac9SiSoA1c/zEiRFuW5xM5ZQYNLH
 R6NIR63JpdoPfzO4leifcCP/AUz9zUd7rIZ4YBhXw/+2unZwGLYVum7z13162T9o/c2u
 uksKF5NRAoPDGncZ6+z2oLRHqep+nzy0D5mWyWT1/EfYDdzgwv7zXVS8SpDTVwWATI4o
 kXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AmdraG6wSunb7ZlzZqyn0FBRFU3it2FPZJFh0CF4PdM=;
 b=dSkGXk7Ns7afviVvIaHegGOBVEKORBRzjVSaf7eglPaS3Lyj+w5CGA0+kHXBiFDUMx
 pWFme7SRo2jqLbHAwXjAmBWitFoVb6VtmghMAhHE8eI+y4cam7/bpoCXIXmY5h8joWx9
 8uzPlBemR1kWFM5vr6Xs8I70Wyy5s+P4yzoMnKMi/iP5yWKr4LK5t0PHS2MmPs5rZ00w
 2pIDJWnB3C71y6LHLGCtoDyybUm7xIOkOGacIWP6aArrmu6yqkMLoBwEZp+65Rhbx1/9
 iV/eRGyjZ+4nEk3F7Ugn0xzby5KEHqFJC8Lk5/l76S/pYrEihA2lnR2QRKDGiKY3HOwP
 ec5Q==
X-Gm-Message-State: AO0yUKUIR+AoUHFWECCYDYHii5Rg3Au9gXjI3wUbrpRv33mLNJjnLdM5
 nO2qCgiZN6KmVbyeGjMVLrsmYQ==
X-Received: by 2002:a05:600c:181a:b0:3e1:f8b3:6333 with SMTP id
 n26-20020a05600c181a00b003e1f8b36333mr616746wmp.27.1676643519998; 
 Fri, 17 Feb 2023 06:18:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a7bce11000000b003e209b45f6bsm5682410wmc.29.2023.02.17.06.18.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Feb 2023 06:18:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] qemu/typedefs: Sort in case-insensitive alphabetical
 order (again)
Date: Fri, 17 Feb 2023 15:18:31 +0100
Message-Id: <20230217141832.24777-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230217141832.24777-1-philmd@linaro.org>
References: <20230217141832.24777-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: xUy99pk2u8Z8

Following the recommendation added in commit a98c370c46
("typedefs: (Re-)sort entries alphabetically"), and similarly
to commit 64baadc272 ("Sort include/qemu/typedefs.h"), sort
again the type definitions (in case-insensitive alphabetical
order, using 'sort --ignore-case').

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/typedefs.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index c7c8a85315..df4b55ac65 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -49,6 +49,7 @@ typedef struct DeviceState DeviceState;
 typedef struct DirtyBitmapSnapshot DirtyBitmapSnapshot;
 typedef struct DisplayChangeListener DisplayChangeListener;
 typedef struct DriveInfo DriveInfo;
+typedef struct DumpState DumpState;
 typedef struct Error Error;
 typedef struct EventNotifier EventNotifier;
 typedef struct FlatView FlatView;
@@ -56,6 +57,7 @@ typedef struct FWCfgEntry FWCfgEntry;
 typedef struct FWCfgIoState FWCfgIoState;
 typedef struct FWCfgMemState FWCfgMemState;
 typedef struct FWCfgState FWCfgState;
+typedef struct GraphicHwOps GraphicHwOps;
 typedef struct HostMemoryBackend HostMemoryBackend;
 typedef struct I2CBus I2CBus;
 typedef struct I2SCodec I2SCodec;
@@ -90,10 +92,10 @@ typedef struct PCIDevice PCIDevice;
 typedef struct PCIEAERErr PCIEAERErr;
 typedef struct PCIEAERLog PCIEAERLog;
 typedef struct PCIEAERMsg PCIEAERMsg;
-typedef struct PCIESriovPF PCIESriovPF;
-typedef struct PCIESriovVF PCIESriovVF;
 typedef struct PCIEPort PCIEPort;
 typedef struct PCIESlot PCIESlot;
+typedef struct PCIESriovPF PCIESriovPF;
+typedef struct PCIESriovVF PCIESriovVF;
 typedef struct PCIExpressDevice PCIExpressDevice;
 typedef struct PCIExpressHost PCIExpressHost;
 typedef struct PCIHostDeviceAddress PCIHostDeviceAddress;
@@ -106,6 +108,7 @@ typedef struct QBool QBool;
 typedef struct QDict QDict;
 typedef struct QEMUBH QEMUBH;
 typedef struct QemuConsole QemuConsole;
+typedef struct QEMUCursor QEMUCursor;
 typedef struct QEMUFile QEMUFile;
 typedef struct QemuLockable QemuLockable;
 typedef struct QemuMutex QemuMutex;
@@ -132,9 +135,6 @@ typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
 typedef struct VMChangeStateEntry VMChangeStateEntry;
 typedef struct VMStateDescription VMStateDescription;
-typedef struct DumpState DumpState;
-typedef struct GraphicHwOps GraphicHwOps;
-typedef struct QEMUCursor QEMUCursor;
 
 /*
  * Pointer types
-- 
2.38.1

