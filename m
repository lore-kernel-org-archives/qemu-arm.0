Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp795793ejo;
        Fri, 5 Jan 2024 07:51:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8NwVyLBog3+EKYRG88Z+CCBEy8WZ8VU7zp8rPdjOxJjSbteGGmW7xAbImoe2++Se+oHUv
X-Received: by 2002:a05:6102:158d:b0:467:b1c2:ab8e with SMTP id g13-20020a056102158d00b00467b1c2ab8emr1645373vsv.34.1704469884082;
        Fri, 05 Jan 2024 07:51:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469884; cv=none;
        d=google.com; s=arc-20160816;
        b=ol/QQwQUcekpazHr3Z+GFhAlKA3Y7oOI6P6kasg1wOB8+gU4h7FcmnMdPmJ3p0Vcfo
         YxUIJ7pgsQumnJLShUXsaZmLZ/mwfpvOSiSM8jqOkh329u3tAPtuSbKi9cxykJHICnde
         cIU8TqSAEYm6D2tVpvQ20gyhDwJVdTS/bhj7ETSzyXhbxjcTTKlAFlqdKf2R/varxYe2
         DRZxezgHCtq1XTgTd+2Za2qeunZtQLe+7ERR3Jr8tCizwhpCXT9b/ewP6h7YQFykoJrV
         9qT77QwoF1LjaImezVOOH5x51TnmHoBqxzkCLxsgvItfM8SE1MimXa8Jd+tCbk1rBvCu
         OWzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ts6/p06DbcZO3DzbdTMKNYyTx2gw5NVQT7hGpH+Yf50=;
        fh=ommUZV3lVI8TSdtrCh+lREq94RlB1kCBJbnpVILHDbk=;
        b=eLvdeldXDY1R1D2NxdW9QvELocy+TRjvHfJE2Q+vyIAeMdb0DdS7XRdoJCAAA/TICm
         25M+P2git/mzXUQdOsZ5R70SWbHjpuW6y+RkwLAxiBOlyffFwbjaD8rO3WP0ZZyItitl
         zGARO6VI4nMCKKb0mXzi9imknwowlaxHyhuy/+sESIjJtU+vJB8BmgwBdZ7h+Vds9rJJ
         gUgvKo4vDPfXzzTVedmwW/0xrHZO/Nlet/llezHiGqRrGM9PvvfFy6LcLBu2j/d8lhG6
         YRGhVEIiQy+WLRsZbUUpRyCMXgxPZk8IYm18FoGQ5WiYQLMRSHHko9whLNlSoN5ZGdt8
         nyXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zEu7/IrG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11-20020a0cdc8b000000b0067f87ec5939si2019171qvk.324.2024.01.05.07.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:51:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zEu7/IrG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmRF-0003tE-8q; Fri, 05 Jan 2024 10:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQT-00006n-KR
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:48:01 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQR-0004vd-AU
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:48:01 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d3352b525so16208985e9.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469677; x=1705074477; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ts6/p06DbcZO3DzbdTMKNYyTx2gw5NVQT7hGpH+Yf50=;
 b=zEu7/IrGDpDeIr2dIyiR40b6RX7Rw5UhbZ6q/QeeQvsdv03PzLd3jldCm7pSJMuLLv
 SjmnKVdLeKEXJfesS3NLTJbhxto3zAlomPsnYD0Csd5QGfCbF7Evk1M8jLzGnKuEBqzS
 b6H8SKBm4DKSfFXyzxSHeUqiShDU1BZDb8QkYlw6QVwAlJqHw7wp2XtauZPqCLAB+FaK
 aZ/d8YmaWrm6yp9Nb58HzkmyvqEPN7b3Wkk7lQPHHJ4YT3lPxcFvYtTNa36QOzcDuIzC
 1Wvrc9TbagoepY2xHIdgxmQ8yuBBeeNRNWGypPlS1hr0mflAmRF2yUXN6tLyqYvIqeCl
 hFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469677; x=1705074477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ts6/p06DbcZO3DzbdTMKNYyTx2gw5NVQT7hGpH+Yf50=;
 b=mW+JqZfGZXGwgmubFbnYPU38BLJ6MFlF7to9fkzfGL7wKUKaeJSTcwXapeOwZPPU2k
 YLiEsQlSviJOFElCo+b4RnPxkZhFkrS+MnJRyV0eQVLwPI2qiBccjXbKUsDNYJRcqMBG
 /GAD2Y2W9cpdvHAu2mCuDNNNx/ugg0Y6tzCujS+vHdLNgRN7uvSYYhVHV51YhwSy3JJc
 8DYtusfeFUnXD2aSzCUMgFcbDKX+PiGCtBvHCN3zBwk8f6CRq8zfb/QXLAkQ0qZcgXsv
 rctmqJenFI7q+KrzWvfbCAoDNRdAVQdz1tbdoGfgpAssdH1wVwsS1FxxLMkWypWItavw
 TCuw==
X-Gm-Message-State: AOJu0Yxq26oAf0s1ODstzEtIQF9/OZv76G/8ZQLUB1+9tmU5pi6z0+ge
 HhEtJzWtyTcnqK640cs0ZOVWa1AB4zUCTw==
X-Received: by 2002:a05:600c:1c0d:b0:40d:7f71:3f4f with SMTP id
 j13-20020a05600c1c0d00b0040d7f713f4fmr1300112wms.176.1704469677641; 
 Fri, 05 Jan 2024 07:47:57 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 o16-20020adfcf10000000b003364a0e6983sm1601482wrj.62.2024.01.05.07.47.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 45/71] memory: Have memory_region_init_ram_nomigrate() handler
 return a boolean
Date: Fri,  5 Jan 2024 16:42:38 +0100
Message-ID: <20240105154307.21385-46-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: asUXin9z92w5

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have memory_region_init_ram_nomigrate
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-3-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 1df7fb0fed..413fbda089 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1288,8 +1288,10 @@ void memory_region_init_io(MemoryRegion *mr,
  *
  * Note that this function does not do anything to cause the data in the
  * RAM memory region to be migrated; that is the responsibility of the caller.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_ram_nomigrate(MemoryRegion *mr,
+bool memory_region_init_ram_nomigrate(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
                                       uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index 6110e851f1..f9e5ae22d5 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1546,13 +1546,14 @@ void memory_region_init_io(MemoryRegion *mr,
     mr->terminates = true;
 }
 
-void memory_region_init_ram_nomigrate(MemoryRegion *mr,
+bool memory_region_init_ram_nomigrate(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
                                       uint64_t size,
                                       Error **errp)
 {
-    memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0, errp);
+    return memory_region_init_ram_flags_nomigrate(mr, owner, name,
+                                                  size, 0, errp);
 }
 
 bool memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
-- 
2.41.0

