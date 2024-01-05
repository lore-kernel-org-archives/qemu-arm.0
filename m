Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp795170ejo;
        Fri, 5 Jan 2024 07:50:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXWtzJAgS4yKHsnhgOuRun+1Wv7arSxFqD8TVx5prIheeWUCvqy5pbXIhDVvgm0SqkPve0
X-Received: by 2002:a5b:14e:0:b0:dbe:a6da:204d with SMTP id c14-20020a5b014e000000b00dbea6da204dmr1946758ybp.81.1704469812387;
        Fri, 05 Jan 2024 07:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469812; cv=none;
        d=google.com; s=arc-20160816;
        b=TzYXbqQNM27ZCCon0MjGgAv5BK6Qff/tmjiQg1MHCTbDp2m7jUXd4WS/yXX+fw5jc3
         jAtOKY19doeahmWww4qfMzf4WNVjNcMbEHv+4SFGeZeHHqs90mLLcHXVvAfxYg1QC1lR
         /T4S/LnSFCS101PB8KCTJIzEO9F3+7yAEnoKEnuD7J+GkWLvyzISg+jmxldzcQHPz7LH
         MQXd2LFAvAGOmzhkHUhQL/pnklkyhBGg5TKApolHJAdVv3baqLMh665eH5NOZly8RtiI
         EFESPua+bAbzv1CXc96s9dd8b5VRyZOuUgXay16uESHx0RdbIcpkEjP9m5u4V2TiJF/F
         nC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ImxUabCyGAsbEkeWSJUeGE5vK4aQJgpXA7LrF1s1fHM=;
        fh=ommUZV3lVI8TSdtrCh+lREq94RlB1kCBJbnpVILHDbk=;
        b=WAbLNdHIY0xsXSE6DHD90qYraTGCZB3yCcroMZKi8d/wBThs4UCXhhxAbIa7U4LQsc
         WSdNIV+RdxVhN/Djmx3kDDhxfRK+r0265sP1F0IeoNChqStR46TOK+TTxwpMH8epBPC4
         Daev1LjsVjvIFwjif6+FoMy+tRPiLJsf7Z+uKQLp2Waj1Ge/KYq9hpK2AH4LWS+hBmvk
         IyCle5LG012MKwa8VYI+jJBByCH2XNP6CLq7VpZmDPnhMN6NrT5XGI3x8wzoJeukI+aH
         06JqCACKHAyiqhxUVMpvxD4itiBDTchbDJ0JHD8YyKzD9iCPwbmAOE5DZmbfWBT0wOCa
         o+6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oVNdv/uW";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv5-20020a05622a0a0500b0042976889dcfsi1931869qtb.395.2024.01.05.07.50.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:50:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oVNdv/uW";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rLmRR-0005Ny-Uz; Fri, 05 Jan 2024 10:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQP-00088H-27
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:47:59 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQL-0004uG-QU
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:47:56 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d5d898162so12849695e9.3
 for <qemu-devel@nongnu.org>; Fri, 05 Jan 2024 07:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469672; x=1705074472; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ImxUabCyGAsbEkeWSJUeGE5vK4aQJgpXA7LrF1s1fHM=;
 b=oVNdv/uWyOZgf1GY0aF6VlQRLpBiHwoX7YB0A4ap1RtTb/F1bzgUxCpbFhkWVN+9c8
 QjGBR2OknXGcGFjboXKq4lrWLmUsqW5GIEk2/K0fiXsR4lGNQtJD2aKbzaSw9IBsps2I
 Zm8PtmmmYn4FAb42ZA7A50/fzThFEp+xntWu7dRCaQlNEFmAm1eQg0Jlh1GFsXffJYcl
 FeHo2Kgar8qj9R3knAc4ZSOOEfb5SRHuQhkjbmar5LUqpGmcpNZmppOPIT+8D+g4LUZ/
 HWaAWtL65O2AuD/pR0ihX/U3wieCBDdoZEajRoNTHccSgb3LxgAntb105+ZTRUfLiSeU
 vz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469672; x=1705074472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ImxUabCyGAsbEkeWSJUeGE5vK4aQJgpXA7LrF1s1fHM=;
 b=abQOQYE+H8bHTsSKOPIl1Z/AV30Uqo618cHSzMvj/RTlfgKtW9DOrDQLd1r8foU1pM
 INVi7/6JeKuQnWWVZzDFhMyzsmz0H0ucZt0J+0SmArmfx2hpVrCclsuRqDXQzkEXfq3W
 awuk7z/esqyza2EX6IbQpjNQGSR86XP5i1flnUgWyquXJ/kpNaIZazVbh0yDR2BIVI2+
 7i39TNPre2pQ1cc+oG1kKNx/sWkkWoNfky1sRISrGn+emUN0IJsiQCZbzzid1RIIp54r
 06JUKjtPLL0VGovYei2jDT9BSIxDKX2XA5NFcxazjiAJD7DbFbGpA42CQSNNthwoeYaJ
 AMGw==
X-Gm-Message-State: AOJu0YxjHMiJ23sn1pm51on9fgMKAKKT7NQ/9CBgwItTvf+XZW8V+6Fh
 mZ4NzsQw/nZ0Hl/4SL0wXnEkoMXnCg2YVOPWohFL3YFuXIE=
X-Received: by 2002:a05:600c:4686:b0:40d:5cea:895f with SMTP id
 p6-20020a05600c468600b0040d5cea895fmr1291944wmo.115.1704469672293; 
 Fri, 05 Jan 2024 07:47:52 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 f8-20020a5d4dc8000000b003367ff4aadasm1612817wru.31.2024.01.05.07.47.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:47:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 44/71] memory: Have memory_region_init_ram_flags_nomigrate()
 return a boolean
Date: Fri,  5 Jan 2024 16:42:37 +0100
Message-ID: <20240105154307.21385-45-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: 8mZNguKC/yA3

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have memory_region_init_ram_nomigrate
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-2-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index f172e82ac9..1df7fb0fed 100644
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
index 798b6c0a17..6110e851f1 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1555,7 +1555,7 @@ void memory_region_init_ram_nomigrate(MemoryRegion *mr,
     memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0, errp);
 }
 
-void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
+bool memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
                                             Object *owner,
                                             const char *name,
                                             uint64_t size,
@@ -1572,7 +1572,9 @@ void memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
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

