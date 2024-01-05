Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp796700ejo;
        Fri, 5 Jan 2024 07:53:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXsJ8sCcTVZAzFcwfFBw8wnBxVL79A94vOfu1bNrqZfmVYdPHG1qXmp+2yK7ypGZFfh8Vb
X-Received: by 2002:ae9:e014:0:b0:781:a8db:3444 with SMTP id m20-20020ae9e014000000b00781a8db3444mr2369574qkk.125.1704469986528;
        Fri, 05 Jan 2024 07:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469986; cv=none;
        d=google.com; s=arc-20160816;
        b=gC1m/YatryZUQVwCqprhNxgjoz/2TCVotLGSSYn38RZEZW2PDpkxPJoDug8yyupmos
         PVkxUR/MdtwfIxq496XAss/PvC8EfolZn2rH2stkSoxxIEzPutZmqXy7wyX7JiFGrep/
         DgNAHNT/wFsthPFw1WKXPdaQ/qo3clIHk0HwXf2ri5WVxdM4zjjZ6NF6T1EcVH6eAL/K
         ycmEfeIFF7iy1rVa+LrWZ3lDM23uxRe5l5qUqSdzfDrRXHkP35vukmsGMiWryto7Rwfs
         lldbyQ9jnxor5118d3vw8voCvDPpAEYcOp3+yS6v0NlHzq02fHMAdMhstiaNIQaZTOx3
         3v+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e8zWpxEGvFP2nXrr978iIGsIcrnYa4bpuJyK2GzP0xE=;
        fh=bAtNkVgv7qoy5BttpF5et4l4pnNgrQnvD80xBkOr5LE=;
        b=U8yGRVxe89JQ3LeINBHH3gcWGCRvdxT5w0w24J/7b5ioh5zSXp08QbPZWlKEIATOd1
         vUrlrrCSEbcrn6dGQrCUdzTb/LXJW3jsz66Ouz4Lof79AuojgOpNpqoT0puDOGxZQB5B
         iHkf4vw9dHykE5NbbI1mmO/sm3OY8Jh8nwzbdRwA2lSjmueGS363aFzWAMJ7nIb6mkXW
         TWIPNUYTgo/g0GuMcxz9NjcLPZSlWjnSuZILh1UgE/8iZm8cCkWoHKOT5O751sZjKDb9
         pG8SUk8BdCnaHwtb/0P2WCkI6uMDcuiLKZrUaX/H4Ksam4hapllaVY+GEoaWmrpiypGo
         FvJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IAMpRvyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020ae9e303000000b0078192520d69si1897918qkf.544.2024.01.05.07.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:53:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IAMpRvyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmRT-0005fy-UZ; Fri, 05 Jan 2024 10:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQv-0001PR-Gh
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:48:29 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQs-0005Zs-6z
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:48:28 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-336dcebcdb9so1504329f8f.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469705; x=1705074505; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e8zWpxEGvFP2nXrr978iIGsIcrnYa4bpuJyK2GzP0xE=;
 b=IAMpRvyxjYt7mxulDGfnO4xq1nBMc2bgamuqFO/XC0qzfPozrQmPnU+eGuOF25jDT6
 SZkhNLmfFk+xdjj0Yy4Fz9r2YtXKeFF4+XJKPR+fSqlytfpLpoiFifAz6iTL3YPPH5pN
 AF1DIPNxlGrJHpAQGe4H1uoZnBPDKCHVcjXl2xf8H4/rq5v5wp3DR6kAMyHi51/EbF1r
 Gg2e9aqMTrxBw5HNc31UmQhI/95NyGFvqYPKYtTySiTKx0snwKUP11833f6aAlDAHdU+
 c8CWQq2KhB5zMGyYYCeO0BO2PdWeNPoNCVbe3zypFlF3MjgDMClFblKPN1JavVmoIgpE
 7Hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469705; x=1705074505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e8zWpxEGvFP2nXrr978iIGsIcrnYa4bpuJyK2GzP0xE=;
 b=jYBgWM7/vk8po2eq4OO8YpaIDbLN9KQ/KSFja/05VoY+7kVcJU1AM9mkMjR36JihU2
 51inoXbYD59mqqRXGknjVOoDglbcb3Uhzf5JWPdl5tW3GCXQG/BNJcdK663hqGo0KsrW
 cPT5l6EafS670D/XbnPEs2BiZ7GOdsoxSEdEuLAVLMt2itdX5a08l4QiGc2kxJ8RSW/G
 SKh7aA9HI3qN1wedQvq4u0a90sYgoNpvyMx+8uibg2kqIy+tw12IieUsfsj3gYRUvOpc
 eSITQaHu9GUmyPDLUtISkcX+WhUyLTVP5g5iunoqPy296OtbBz1Nf1Q09lTmGCAabOF4
 kTpg==
X-Gm-Message-State: AOJu0Yzk2IkpHFkcLoZfstnyUix/ImrIq+KGEc9wDfGQTDuvFjkh1Hcb
 AI7pr/VSC4vncYrObEJyW7Ye2facYzZJaw==
X-Received: by 2002:adf:ef04:0:b0:336:4b78:f81c with SMTP id
 e4-20020adfef04000000b003364b78f81cmr590302wro.123.1704469704861; 
 Fri, 05 Jan 2024 07:48:24 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 x17-20020a5d6511000000b0033743c2d17dsm1612853wru.28.2024.01.05.07.48.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 50/71] memory: Have memory_region_init_rom() handler return a
 boolean
Date: Fri,  5 Jan 2024 16:42:43 +0100
Message-ID: <20240105154307.21385-51-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: NOjci/pJQWQx

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have memory_region_init_rom()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-8-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index b2dce73e7f..9f54bc4af8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1611,8 +1611,10 @@ bool memory_region_init_ram(MemoryRegion *mr,
  *        must be unique within any device
  * @size: size of the region.
  * @errp: pointer to Error*, to store an error if it happens.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_rom(MemoryRegion *mr,
+bool memory_region_init_rom(MemoryRegion *mr,
                             Object *owner,
                             const char *name,
                             uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index 45ce6fd6c1..069aa5ee08 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -3593,7 +3593,7 @@ bool memory_region_init_ram(MemoryRegion *mr,
     return true;
 }
 
-void memory_region_init_rom(MemoryRegion *mr,
+bool memory_region_init_rom(MemoryRegion *mr,
                             Object *owner,
                             const char *name,
                             uint64_t size,
@@ -3602,7 +3602,7 @@ void memory_region_init_rom(MemoryRegion *mr,
     DeviceState *owner_dev;
 
     if (!memory_region_init_rom_nomigrate(mr, owner, name, size, errp)) {
-        return;
+        return false;
     }
     /* This will assert if owner is neither NULL nor a DeviceState.
      * We only want the owner here for the purposes of defining a
@@ -3612,6 +3612,8 @@ void memory_region_init_rom(MemoryRegion *mr,
      */
     owner_dev = DEVICE(owner);
     vmstate_register_ram(mr, owner_dev);
+
+    return true;
 }
 
 void memory_region_init_rom_device(MemoryRegion *mr,
-- 
2.41.0

