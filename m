Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp799718ejo;
        Fri, 5 Jan 2024 07:58:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNCmVePSOrG5c3scGfwjD3BLZDhOhEIBpnlfMUgu82bbvK5rQ3bk+tGoTt+uPyxq3jmg46
X-Received: by 2002:a05:622a:307:b0:429:75d7:d5b9 with SMTP id q7-20020a05622a030700b0042975d7d5b9mr1441911qtw.113.1704470333564;
        Fri, 05 Jan 2024 07:58:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704470333; cv=none;
        d=google.com; s=arc-20160816;
        b=STwjcfXnuxTAJJpP61ubdGNf94oh45it//tYSaMHJWP5uIfPWO7otjdCaujnB2ZGXp
         PBe1NUbX7toz/zAXIKvdr6ERPme589Ew3dGkD7WcETh6Dz+zSdCyJ/6EhsKXP498GD9A
         VfApXn5J2yET0uYcoVALUyGTBYcU5hwBmsPoo3YJp+SOFccq/yfCuiI9DV50GhNKtrV2
         +O41+2sfNk34la34RoUODZb19VcMrOkJUTBEPr20BA7EDDVogbrKBhQU7ashe1qiraC8
         NdFwmYASSzjShtF/UWwE6o1QvItBiwdgiB68RlgPRHjZjcOW0843Srr36VQ9Gk9u/6yw
         dFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=p7B3Mf2i+vPlyYoqstgqm0gsIkR8x0JtmN/V8QC/eVg=;
        fh=81NhLE2m/KZ6CtPYKaqP63dEzTQeY0b9aypae7xj+Rg=;
        b=oiQ/Xuwt5BG9uihkRfI77ZD0/QVKep4GRVAbY5wCt35pdoquDkEbv4TE+htK0bXzcf
         ryqX5FF5EKjGujPPUtJJixBrj8EXDbzHhSf71E2HMu86WfVb0xhmmYJrjojMsB7Re36I
         Ipl3ynYdv7nihQ77LG0fNuYM5S9diH6LGbYZMjFehuv2xx9InfaaP8seilj+Fc/HzqEP
         J2/kzBNjVh07GyDOabV24OOJYsK5xfNba/XhdcriGlYvhNUX4lsgC3ar8z98oCVEYVYN
         KWcJ9XONhLNG7OkoBl8JJ0ekNNeE7vjxuc3geUndxUcqYfACs80oYgi6a1eiD57uGet5
         Fidg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cdLnvVql;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020a05622a039100b0042581a7c1a5si1986338qtx.631.2024.01.05.07.58.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:58:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cdLnvVql;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rLmRX-00064g-Fi; Fri, 05 Jan 2024 10:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRB-0003TT-UF
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:48:46 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmR8-0006Lo-QA
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:48:45 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-336c9acec03so1302926f8f.2
 for <qemu-devel@nongnu.org>; Fri, 05 Jan 2024 07:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469721; x=1705074521; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p7B3Mf2i+vPlyYoqstgqm0gsIkR8x0JtmN/V8QC/eVg=;
 b=cdLnvVqlynralpvs1HCYe6v256jrxlMu+z79oOS/fgwnfJMv3D7f38wmCsBG0oSPvW
 pdCXlhwHrFqZe3RkuEh23fi/jq0gG0zW3ht2225OLehC8oxO4O+ugXUfRkNjyKCpCHRi
 HjBwxRSOfos1jAoa4TzBFJiE/0poYZiHJ+KwLwebj1zfuPskmDX0oA9Bwvg8zJGoU5Z6
 eg+R0EBYynKmiADOH9TBtJ2gYm+UvPOd83eBZXWRp/jDmIcUrJmWpdc4H44HvJ/YRJyM
 T/MXuEI3Gm2OJNSfJ08vhfI4KOHLk8jjalmesmw3sB/PrD19W8BaBBT9NbbuFaqtDieb
 NjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469721; x=1705074521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p7B3Mf2i+vPlyYoqstgqm0gsIkR8x0JtmN/V8QC/eVg=;
 b=vEs0npBeAqonHmGtdvuQF7V2QAmtx5XZI29JsE+sFk1Mb5xBad11maTQ2jeD5adtHo
 ywVTL5ICVos7SThb4gSgCaDGMqhyyvInPpIpZlfqAnw8iuKLQK/yQ7xLDgEuEkuxKuyZ
 zRA6mMx8Kv0+bF6JLiLEO83Hk+dGE5KS7oAILjhD9HI1JtK62BmHwpUuSbSyChvxU/ny
 A49uEzPiEH7E7juHHZWbSf5xeAlwCoISyihR17p3I10aIWpDMo+pVIPy2zL6QeDG9KQT
 QHHd7g/TFs0DIrUoIUuAc1DExyTyMyjBYuAQ8hYKr1Tvo82eKtrQ4sSgmLQ/Z8rzTev2
 Hujw==
X-Gm-Message-State: AOJu0YySzjQAKeZomiQESu0LYyAlbGCcy5BqOfzkCM2jF0WRVMQp9gwF
 QRd+zPIEHOay9bLvr9ZQXVhVINCNo/zPZfYvM/TZYLIbJDs=
X-Received: by 2002:adf:ef81:0:b0:336:70ed:4cc with SMTP id
 d1-20020adfef81000000b0033670ed04ccmr1129456wro.95.1704469721129; 
 Fri, 05 Jan 2024 07:48:41 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 df14-20020a5d5b8e000000b0033677aae2e2sm1601439wrb.107.2024.01.05.07.48.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 53/71] memory: Have memory_region_init_rom_device() handler
 return a boolean
Date: Fri,  5 Jan 2024 16:42:46 +0100
Message-ID: <20240105154307.21385-54-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: nLuydzTG8NPX

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have memory_region_init_rom_device
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-11-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 6 ++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 6d7b49b735..6209458f56 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1646,8 +1646,10 @@ bool memory_region_init_rom(MemoryRegion *mr,
  *        must be unique within any device
  * @size: size of the region.
  * @errp: pointer to Error*, to store an error if it happens.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_rom_device(MemoryRegion *mr,
+bool memory_region_init_rom_device(MemoryRegion *mr,
                                    Object *owner,
                                    const MemoryRegionOps *ops,
                                    void *opaque,
diff --git a/system/memory.c b/system/memory.c
index c6562f5e86..e5193d4623 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -3618,7 +3618,7 @@ bool memory_region_init_rom(MemoryRegion *mr,
     return true;
 }
 
-void memory_region_init_rom_device(MemoryRegion *mr,
+bool memory_region_init_rom_device(MemoryRegion *mr,
                                    Object *owner,
                                    const MemoryRegionOps *ops,
                                    void *opaque,
@@ -3630,7 +3630,7 @@ void memory_region_init_rom_device(MemoryRegion *mr,
 
     if (!memory_region_init_rom_device_nomigrate(mr, owner, ops, opaque,
                                                  name, size, errp)) {
-        return;
+        return false;
     }
     /* This will assert if owner is neither NULL nor a DeviceState.
      * We only want the owner here for the purposes of defining a
@@ -3640,6 +3640,8 @@ void memory_region_init_rom_device(MemoryRegion *mr,
      */
     owner_dev = DEVICE(owner);
     vmstate_register_ram(mr, owner_dev);
+
+    return true;
 }
 
 /*
-- 
2.41.0

