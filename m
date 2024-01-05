Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp798738ejo;
        Fri, 5 Jan 2024 07:56:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3VgUi3d7oBrw5BaB2SsLgFxZOdm+i2CSNVWLKjarO0PTfWF4WFwUVQi3n9FErqZin55du
X-Received: by 2002:ac8:5715:0:b0:429:7643:dd24 with SMTP id 21-20020ac85715000000b004297643dd24mr1338980qtw.101.1704470214948;
        Fri, 05 Jan 2024 07:56:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704470214; cv=none;
        d=google.com; s=arc-20160816;
        b=ia5DY9H96kXuoi6WiWaJ3Kb87nekfcPGUrR5T3CqAe1t9u8pi+wEJPJMQh76M3cIj7
         jzazC9yGLrgAkhb7ePwtSFxe4j2breXofch4eygzaAtvul9EkkyQRRf1CemkPGEXI6lg
         b4ezTGL+pcxgEEpVrlDIpd3Ku6x+jldWpY1tZGFtpHFE2L1CDU2LPFyyNaskp3fpgAfC
         IjqTYWtJgFu1q5sEXQk9idfza/nbAqbfutNGKx2GC9JY3w56lzQNx6WeD0LyCfskv+95
         akvwhQwBdUNimL0nslW/AyRv0ax3/5GoueGj3t602RzD/IZhHJAbUJS0br2jb2ExjUmk
         ihQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9bo0EnTBB3RSA39/U6I4CQ9tWQh3q7HE8iXyXM+NS6g=;
        fh=81NhLE2m/KZ6CtPYKaqP63dEzTQeY0b9aypae7xj+Rg=;
        b=G668fXNV4lk1lIreJp6MD9eBPo9hg+oE8r2M+2wk2gmco9233Hb7z43MvOjzeC5Zba
         4I49tceY3/5uGyMhX1qIiF9VZbEEhynbiXnEhBL1J6rgX6gIWt2YYFb4hMON0meKXtoA
         Kh3CsHac3W+QVKuCOTDCDqxLHkQHhTk/PcSantkd5eEUail+28DgOUH4SP+qph2ZoRZC
         y8A6giL1ttqtZTIwBby/3aOjXHVnhwUvhkIo1/mJkrPz3el+xkyCgVeGxG5zwrJ/0NH0
         VENwGcthOFCm3l6YmyzfUS9qp9X8moHDt+btEscke3umnkbYEJQ8N+G5NYny9PdUrqaR
         jGGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zysmM0Mz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16-20020a05622a145000b00421b4dedaf6si2073245qtx.296.2024.01.05.07.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:56:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zysmM0Mz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rLmRE-0003qR-MA; Fri, 05 Jan 2024 10:48:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQh-0000Zl-MH
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:48:20 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmQZ-00051j-PP
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:48:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d5b89e2bfso16308585e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 Jan 2024 07:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469683; x=1705074483; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bo0EnTBB3RSA39/U6I4CQ9tWQh3q7HE8iXyXM+NS6g=;
 b=zysmM0MzPDmI2w6M74MLyNnQMRZxVdkG59Hhf81CuNJDkx1ELkQ9yqyi4EmGn+AcDc
 l5W07oKCdBQXI6AHyZ1SPm9rEJhL0BGuDnQCunnNQqvwT+12ml02is3J6rynkarxg8d+
 FBJ1EfSqok6ztz5ZKy2NglkCeILhA6JYZq2ueONHmf57iqB+E4cHB3sFnSb/53KvchVS
 ilOy06iIP0MOf+jU4K13yIDU+vK2ZbJ52rRZEz3+kEDvQNS4Rj+29xolz0noHHlfxKCp
 opBOVoYf6ms9v4YjtDvUoI1qSqZrahxH9M8UZn98kqGw5KWcAIobDqyuP3vqcQWS2IPM
 Ha0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469683; x=1705074483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9bo0EnTBB3RSA39/U6I4CQ9tWQh3q7HE8iXyXM+NS6g=;
 b=KKMBx6pvefCnzkabWgx3WbaXe51Da5lyXioqUsT9h5ZcK+8l8jShBmoh10I3qJh96z
 4MDgDjO5mg7L8gR9J0T+R7QFFrZdgU9Ly581QQY+LxktFSAda2rBNRZz+Fi02lEerqYV
 FMWgrei4QsREmBrTOHCDVWps8a2IiUFNezcHQSc6plmE1B8YF233Nka52dFMSLYMcWLB
 D2qLq+zBekCAaY5/1qOZifoly1HtZPx8s3v7AtnpD6D7vG0HK49YCZDMc6/uRyQdjrXX
 Iy31QoIh8HevTiuGwEsTdoJfwNPaJKsgKkKEP+PhLZvdAfLAq8zYI4jtB1if+/ZoANl0
 VjXg==
X-Gm-Message-State: AOJu0YxEDjEW+lH8tYvLB6AP4SDW1j1V7HaDutjdk6Q68sNYAYgeh6cV
 Vcd9uPb85VbHv3/T/RomWLAn/C/2YgQB8LvQgd3klqcDAQ4=
X-Received: by 2002:a05:600c:181b:b0:40d:3a32:7d51 with SMTP id
 n27-20020a05600c181b00b0040d3a327d51mr1222446wmp.119.1704469683198; 
 Fri, 05 Jan 2024 07:48:03 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 i16-20020a5d5230000000b00333404e9935sm1615796wra.54.2024.01.05.07.48.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 46/71] memory: Have memory_region_init_rom_nomigrate() handler
 return a boolean
Date: Fri,  5 Jan 2024 16:42:39 +0100
Message-ID: <20240105154307.21385-47-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: uvTpQbEOLUyI

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have memory_region_init_rom_nomigrate
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-4-philmd@linaro.org>
[PMD: Only update 'readonly' field on success (Manos Pitsidianakis)]
Message-Id: <af352e7d-3346-4705-be77-6eed86858d18@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 9 +++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 413fbda089..f3a4a76817 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1498,8 +1498,10 @@ void memory_region_init_alias(MemoryRegion *mr,
  *        must be unique within any device
  * @size: size of the region.
  * @errp: pointer to Error*, to store an error if it happens.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_rom_nomigrate(MemoryRegion *mr,
+bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
                                       uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index f9e5ae22d5..72c6441e20 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1701,14 +1701,19 @@ void memory_region_init_alias(MemoryRegion *mr,
     mr->alias_offset = offset;
 }
 
-void memory_region_init_rom_nomigrate(MemoryRegion *mr,
+bool memory_region_init_rom_nomigrate(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
                                       uint64_t size,
                                       Error **errp)
 {
-    memory_region_init_ram_flags_nomigrate(mr, owner, name, size, 0, errp);
+    if (!memory_region_init_ram_flags_nomigrate(mr, owner, name,
+                                                size, 0, errp)) {
+         return false;
+    }
     mr->readonly = true;
+
+    return true;
 }
 
 void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
-- 
2.41.0

