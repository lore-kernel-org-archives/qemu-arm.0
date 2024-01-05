Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp795184ejo;
        Fri, 5 Jan 2024 07:50:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoL7TjgwfMwxh4M3Hrf5zFc3q1FDhJBgQS8MoSfO3DTdCtEKCt/cNvN7WRTQtgJCOlXhze
X-Received: by 2002:ad4:5c6e:0:b0:67f:621:11d with SMTP id i14-20020ad45c6e000000b0067f0621011dmr2217646qvh.25.1704469813732;
        Fri, 05 Jan 2024 07:50:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469813; cv=none;
        d=google.com; s=arc-20160816;
        b=Jo4aLU7coLuevbqKrQXyDlQQAfjlCcuCMW7uYAciVQxQ2Tkx35bXFhzXKkccHl5bXc
         Y+GF8+LfJii0AbDddl+UnM8Ys7G+JvAqy4rkhAwLIqkvCAvqgYxvVuKv2XPCfvY/rfcx
         uadP2RcDzTft2o4HXwS7Hv738HEWKqcpSDB0+gQ79OKHBrppPAEQtWBKbM18+HkyX5PT
         vVIgBcwWIqIyOXHo+NYdNxTyI2kIJAEqPSVD7i+zUmkRM3GioCdFcmDDxLMGWqJLIv02
         2kG6+9OgVyOamFIA8wXYSLlE1FXvSIbqyX7fHJNBA7RyPQhP1j/47WquT2WDC99F48Q6
         wCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KS/EWIqcckkOMDkJJEhaku50ApzyYMzhGT/LMkqQfVg=;
        fh=81NhLE2m/KZ6CtPYKaqP63dEzTQeY0b9aypae7xj+Rg=;
        b=MQJJw5VdRoT3CONiblj4QEReODpSZiXWpFy8icfHBH5NayuYJWdFikxLSVcuCcybWI
         nTSeomBUU4jzMyIW0pQd9CevlDlfFuJ+QZaAx0W0BE2zVR6oC7xjrDozKyN7GghwZy4V
         JV8LF6omfiQQintm1c7BA0I0+laiwJ6yy5ZpDwC0O5jbaa93h/J76puxHGABPWocl97g
         CD6qDPxPq6Yo4mtKNMntBb7IZRNoiGKZ+++XodO9s/V8KLBfTI4oKSnd3UK6Rvx4B0yr
         p1XmwLbOIFbP7Ah+aQ7MfyzDwX/3lXI2c5f/DMJRRh6Pp0bPxjMAeIHwxRFObxoFn350
         ArQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQKmNGjJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10-20020a0ce3ca000000b0067f86df1ed8si1964905qvl.238.2024.01.05.07.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:50:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQKmNGjJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rLmRh-00076m-Sl; Fri, 05 Jan 2024 10:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRI-0004Ko-89
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:48:52 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRE-0006e3-NY
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:48:51 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3368ae75082so386061f8f.1
 for <qemu-devel@nongnu.org>; Fri, 05 Jan 2024 07:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469726; x=1705074526; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KS/EWIqcckkOMDkJJEhaku50ApzyYMzhGT/LMkqQfVg=;
 b=TQKmNGjJDide/9Oo07D/i+Oegvwn/RSRSI59Ceub2ho3TaO4cn2Trm+/h85KIULEd1
 uDo5PXFPKWCOEzscu1P9ttuVXBZbwVNDAyjazNoxIz6bs9uh5n6L9Wdbk53e0vIKic2f
 56NfS7iUqm11yTHxUGYKJUF8SckZo04uXXfIZ4tmhaZw9du/4fhE+RzBZbQHatM/GT/q
 1l3E2+VlQ5P/PZBdTbGquBCt56l9XE/7Ec3IarLInKDq7MNcp1TPMIcC/6LOgfgrNhCm
 inJoRD0PGS3Nbrybxa58hlv+Y5GU2V3V5+8gambOdZszPyG7T+QBcOgIzR1cpMbP2v5K
 O2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469726; x=1705074526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KS/EWIqcckkOMDkJJEhaku50ApzyYMzhGT/LMkqQfVg=;
 b=mlNml2t9fPDrFbwcAP/Y7vAjI2s+lMmqAMnxc3nDvHYwcrpaDVw1bNP79VxPZVS4qX
 pnYXCXAA7CSFNejF6XbuzIRc0GogqqjjQIoN3WdBws5iEvMGB15hIwxhnSz5IcUVcK90
 dHNlCu+plis9wzjxTzolvFtMzH34wGckZv9cu2McisdmSqGjiqokbDlHuVrlwqUjN8jR
 w9qg5s70H0QzG1yI7uQ07N8DqqE226Yu/SWEwGnUNMdhNlOwpvJFYfrIAvyyH3A8qpFc
 myNlUgoKfflRfXLMbb9aqsIEcdbw30mT+jiXRyXP0yVnrfG49YGyq4M+cbn5AILZF0uI
 vbGg==
X-Gm-Message-State: AOJu0Yw9WfBDID21mGeRmY3rWjh7acYcKVp/07h2MgBxHfAOvA+vIyMc
 QinssGrq3jkst5n4SmC9Jkx7nIPmZWUXijpXc2Jm8IzDJWI=
X-Received: by 2002:a05:600c:1ca4:b0:40d:8bc8:3566 with SMTP id
 k36-20020a05600c1ca400b0040d8bc83566mr1247666wms.145.1704469726365; 
 Fri, 05 Jan 2024 07:48:46 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 jb13-20020a05600c54ed00b0040d86e89abfsm1891493wmb.43.2024.01.05.07.48.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 54/71] memory: Have memory_region_init_resizeable_ram() return
 a boolean
Date: Fri,  5 Jan 2024 16:42:47 +0100
Message-ID: <20240105154307.21385-55-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: MRODyA5cc3zy

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have memory_region_init_resizeable_ram
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-12-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6209458f56..faddf8f073 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1342,8 +1342,10 @@ bool memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
  *
  * Note that this function does not do anything to cause the data in the
  * RAM memory region to be migrated; that is the responsibility of the caller.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_resizeable_ram(MemoryRegion *mr,
+bool memory_region_init_resizeable_ram(MemoryRegion *mr,
                                        Object *owner,
                                        const char *name,
                                        uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index e5193d4623..75303484e1 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1578,7 +1578,7 @@ bool memory_region_init_ram_flags_nomigrate(MemoryRegion *mr,
     return true;
 }
 
-void memory_region_init_resizeable_ram(MemoryRegion *mr,
+bool memory_region_init_resizeable_ram(MemoryRegion *mr,
                                        Object *owner,
                                        const char *name,
                                        uint64_t size,
@@ -1599,7 +1599,9 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
         error_propagate(errp, err);
+        return false;
     }
+    return true;
 }
 
 #ifdef CONFIG_POSIX
-- 
2.41.0

