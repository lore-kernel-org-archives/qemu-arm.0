Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp796005ejo;
        Fri, 5 Jan 2024 07:51:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtZsh9zSeCo/3ySUsYjthmhtHNOeeWXL9cxgKm1PX+9JuPN7Z+BB/cf4XZr2cEKMC9rlkj
X-Received: by 2002:a05:622a:1989:b0:427:9fad:8971 with SMTP id u9-20020a05622a198900b004279fad8971mr2332538qtc.70.1704469912674;
        Fri, 05 Jan 2024 07:51:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469912; cv=none;
        d=google.com; s=arc-20160816;
        b=aJfZuBPXJzZOJpKSS3IlIRnItlKbovBXD+P79UBpJCbAD/gTezr9N+iIdf/HhH6Hf0
         IbJ1VChUurG2wyYqegOcmn/1bDTKtRFw/MGkY9gpFn7NDoo8eGeqldrvbKUwEai1+I3u
         tW06XuEj4hKBfxFum0rUkwGiCf5ZA8LHkY9LrN6g18w5EIjRZ7/MvlPoqnM8nok0UKc7
         2HJSRVv8SOTeTxoxCY0mTa/0ix7n6hMJBRXeicgrWmU+FkB8OiUfL8bBRXEW6B3XMEgY
         kMYZfsOkSyfGZnQJpwdpRLhbm3EwWPX6A6c64u1AjlI1/VMTv4lwDWzSmx7S+IIM7kWA
         W5sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Dn8kXCOFTNbdwpGvjXbfKLmnnB9Pg2Sf7+jbS80Xsv4=;
        fh=81NhLE2m/KZ6CtPYKaqP63dEzTQeY0b9aypae7xj+Rg=;
        b=buRjeWahzyC2fgWKfixavJLf06exZbVKCLakBDaBYVYweurOZBkvHSBBNo7dUo8q/o
         gtSefsHyvjWQzuBnFKpnI43IxXnkttcx1xajA1PNNQehNE/ZZRiG5cYvONByoysKqKAv
         2tF9Tb4oRU8RjxXRu0hhNU+2E+5eahs9+P0IxnPeL1Ut+SYgrv+DhvhAh3HQxRqLmacY
         XvzX1doaWtcovQSKTXFlfloJWr6vEU6VOiYYGADIyvtIQ1jM+UmIF9hrUJ+8JARI4RG3
         GKkuahAoGHJMO99yp7PQ/Kh+3YO/t+Ar1eCKBn4792TcYnJkvD6S7VVxC05BqaXI4t+M
         Wrkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yNiFcMBI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv5-20020a05622a0a0500b0042976889dcfsi1935082qtb.395.2024.01.05.07.51.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:51:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yNiFcMBI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmRt-0007kd-BU; Fri, 05 Jan 2024 10:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRN-0004lG-Ep
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:48:57 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRJ-0006pO-9y
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:48:57 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d87df95ddso14955215e9.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469731; x=1705074531; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dn8kXCOFTNbdwpGvjXbfKLmnnB9Pg2Sf7+jbS80Xsv4=;
 b=yNiFcMBIatYGftSM5AGjnqdqSpfEHnDy0FfkdPfkcA3QBAZqmMnGBqeBzlsFTr2uQA
 IhgxgWfVc9rCH7BBJTfpjlcrVGgw0l64eNy4TFI6L+8I+jpZV06K1GBtBYD98GkLEAXD
 qGT4HFCkKhvspbG5gm8GeP1CNPhSg9oX84gGMvSZl0n2UpdFYLMSLsMXCBtO0xGQnLut
 tYxq82Ldsg2P2ZwEwx3Tun/iuoVrz3Jp3iAtvaq4GRvpFtqJOf6FslqMHWfk7owGRQXb
 yVrdQQ6UKNKEmnCA18hpoqfl0yZKMi8BZCHQApcWUegyXfVju59biFNGDKnT3l6a/Td5
 mJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469731; x=1705074531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dn8kXCOFTNbdwpGvjXbfKLmnnB9Pg2Sf7+jbS80Xsv4=;
 b=hfhZsz9+nWAenCyDhcgSOZcEPzqMxjFTP5xoVGSs5nrahrd5rvQGC5ci2YXgtq+EyM
 HBxKvCEUwImfZ1dfotNBBoHIm2HPhpCED+Hcf9F0U4eFy8m+hYSxstyTSPa8s79n4Pbg
 ltDGzeUakKkn0OzsFMcwvEFMEnMK27cifpFBsSR4+bdWrp/gF0vE5/SLrGqLeZj711zx
 B1UMV7zL2ZTav1axkRxYUiyLB8a48xf8rKNQgZjIRsG5DOPgyEZrkwLsGBxENqdQeO6/
 FFc9tQ1aEPUu9ca3fIwQ453KRtESPWi0pwJ7PrfWf8RyfnJMfxxeLwTe9itJZnGfXY0l
 F3jQ==
X-Gm-Message-State: AOJu0YxFVafH6/nV5Bx/JGaYCfLebzfDYivT9oQcjZ3Q5/xMY/kBaowt
 8qk15uS5XAnd4cdmIYfVpFy2B4+NJ4CejH0hWEqsbEwRVrA=
X-Received: by 2002:a05:600c:5188:b0:40e:375f:6929 with SMTP id
 fa8-20020a05600c518800b0040e375f6929mr311928wmb.40.1704469731598; 
 Fri, 05 Jan 2024 07:48:51 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 s7-20020a5d6a87000000b0033680f7be5fsm1610144wru.87.2024.01.05.07.48.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 55/71] memory: Have memory_region_init_ram_from_file() handler
 return a boolean
Date: Fri,  5 Jan 2024 16:42:48 +0100
Message-ID: <20240105154307.21385-56-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
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
X-TUID: a3iAivpjMSzN

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have memory_region_init_ram_from_file
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-13-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index faddf8f073..c39819ec75 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1376,8 +1376,10 @@ bool memory_region_init_resizeable_ram(MemoryRegion *mr,
  *
  * Note that this function does not do anything to cause the data in the
  * RAM memory region to be migrated; that is the responsibility of the caller.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_ram_from_file(MemoryRegion *mr,
+bool memory_region_init_ram_from_file(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
                                       uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index 75303484e1..e05d88aa67 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1605,7 +1605,7 @@ bool memory_region_init_resizeable_ram(MemoryRegion *mr,
 }
 
 #ifdef CONFIG_POSIX
-void memory_region_init_ram_from_file(MemoryRegion *mr,
+bool memory_region_init_ram_from_file(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
                                       uint64_t size,
@@ -1628,7 +1628,9 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
         error_propagate(errp, err);
+        return false;
     }
+    return true;
 }
 
 void memory_region_init_ram_from_fd(MemoryRegion *mr,
-- 
2.41.0

