Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp795580ejo;
        Fri, 5 Jan 2024 07:50:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVWcEFG80KXGeBOi68FLCPP1gbOWVgebxgj9cdC8Vj+TvOQ20+cHb5VAlJT6ncWPyBkxVg
X-Received: by 2002:a05:6808:23c1:b0:3bb:d736:5575 with SMTP id bq1-20020a05680823c100b003bbd7365575mr2296648oib.0.1704469859678;
        Fri, 05 Jan 2024 07:50:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469859; cv=none;
        d=google.com; s=arc-20160816;
        b=dAnfAielbQMAuYal0hTMCjvOX6OldyyInjPNdVaWvImwgIsBSpQALNlKmR2nb5iGw2
         ly20BrNK0eoZcn5S5Z4O1SMt42TRTgMa7z2S2XWZVICH+zQLJQc8qHVqyIZaCu8RJMq2
         Rz/6ph4J+qsp9xbbOuoiYoLsACyuHs7TAimZAQEI5lhxQFa4yI15oiM/J6GpwQv8rGmD
         CEBFscHwDLXQs2QTihjKYtMOr+TrxYf85uXIatStXwhuTkLV8VHEhaUs9gYgnf17ehGe
         k4/V3plmm/5gM5khHPRA75hrQgzUNUtsH3ekeIrv1QLrGlllAnWYWJZH/964F4pQYinv
         y2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=c9DCMj7pY2pO17D+FqBvL8kwEDleUW00T3E/JGiYz/k=;
        fh=81NhLE2m/KZ6CtPYKaqP63dEzTQeY0b9aypae7xj+Rg=;
        b=1KmigeMpURAlzcUBImtuUhMufbnw9DaUVDc+whKv1aGPqeZawe8fDjP59O29kZwmEa
         C3gj1M55KE5yhEBdd26VqKHGbfbpPJL3aZoYk9z9dzJntgYma7vaNKmti+huOLm5y/1c
         BotE15V4qoYD08tXNoQdbA4OJrlFqDLaLPYLvz0BsdmcxdQqpXd1GP+VKPi0pATXeiyh
         Z69uft35mB4teW6JGK9RU2eY/xL1/07Q7KmSr16KPdtbUZVrhX53V+bURvqSg99iafXU
         Pjw3tvxzj3rfvxjDVOLdswGD9d5FUcSgfFRiUdQLW7g4/ERaLkTL1kdYA5TXCIw081d0
         70Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U54if9m0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18-20020a0ce312000000b0067f2fca6cb7si1995475qvl.22.2024.01.05.07.50.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:50:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U54if9m0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmSU-0000An-RJ; Fri, 05 Jan 2024 10:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRQ-0005Du-Bs
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:49:00 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRO-00074f-F9
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:49:00 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d2376db79so13006815e9.0
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469737; x=1705074537; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c9DCMj7pY2pO17D+FqBvL8kwEDleUW00T3E/JGiYz/k=;
 b=U54if9m0B4jYXM4rDTogAYwijQfmaWRbyeNV7pFxhFHddn9l0IDHgqC9Cilhz5VgDl
 bQn7UZX+V4CFJNfZFyhm7isRTf7+aIu9AXB1alsa3icILbPnLv1oyhOXMhzZlLSgi9Z4
 BOIBinMngYba1t1jnPZP805CP73T5tad2dPqgWOzkksGNGezv2eUco/wmNgY5R9a5+Uf
 Mw9BuSBNuYOTc3qGMWOsOFjZwi/mP8UC7zcUgSnJnKoRS9LWQdnr5npbPDzoa6j4EkLG
 x32opXu7JdXwIg70Uivz7cchEEeQIGslAjeCFyDb0zRXUTRYb6/WZszJ0vKSj10N1atN
 ouFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469737; x=1705074537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c9DCMj7pY2pO17D+FqBvL8kwEDleUW00T3E/JGiYz/k=;
 b=H7vhk/N4UZ1fcM/+xcNnluSDXBnD5Sx/3CQVUvhp6jr+DWpOCV5nkOjdB8JEXbp/hB
 bTkgDn4ttSxu4BGC18FXX2xV0sZjy/RootabvtAdVPyUzb2dDsFNkbnoeeIkhEujP+Yl
 4d+0/26cbto2shuDdFrAk4Xe/C2ewk5JSnWY843bHFAHTt81x6tVe7Itd2YvYp5rbcQR
 i+yPoBe5sscKI5RCybHd0nxmkFcvHaD1UX5PL8j/C0Q/6ndGCFcLgZA5mMK/FFW/TF+h
 mDDmP8PLzz/qa1floSl+zJFG83s3xXsbzuwtmbA6Eq3jTsoG33Cnvqg5PcA0pckkDbHC
 Z4Sw==
X-Gm-Message-State: AOJu0Yx5sM9S5z6ZPonpEoIcsFGH8vAEjXONpRkmNu23h9OKtxlpotT8
 TZDRLPgfwfaXb2qbmnf+CtubAppkxRQ7Ug==
X-Received: by 2002:a05:600c:4a13:b0:40d:8ddc:b443 with SMTP id
 c19-20020a05600c4a1300b0040d8ddcb443mr1540873wmp.50.1704469737001; 
 Fri, 05 Jan 2024 07:48:57 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 az29-20020a05600c601d00b0040d87b5a87csm1965144wmb.48.2024.01.05.07.48.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:48:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [PULL 56/71] memory: Have memory_region_init_ram_from_fd() handler
 return a boolean
Date: Fri,  5 Jan 2024 16:42:49 +0100
Message-ID: <20240105154307.21385-57-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: MC6nMLWPX1sm

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have memory_region_init_ram_from_fd
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-14-philmd@linaro.org>
---
 include/exec/memory.h | 4 +++-
 system/memory.c       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index c39819ec75..48c11ca743 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1406,8 +1406,10 @@ bool memory_region_init_ram_from_file(MemoryRegion *mr,
  *
  * Note that this function does not do anything to cause the data in the
  * RAM memory region to be migrated; that is the responsibility of the caller.
+ *
+ * Return: true on success, else false setting @errp with error.
  */
-void memory_region_init_ram_from_fd(MemoryRegion *mr,
+bool memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     Object *owner,
                                     const char *name,
                                     uint64_t size,
diff --git a/system/memory.c b/system/memory.c
index e05d88aa67..9ceb229d28 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1633,7 +1633,7 @@ bool memory_region_init_ram_from_file(MemoryRegion *mr,
     return true;
 }
 
-void memory_region_init_ram_from_fd(MemoryRegion *mr,
+bool memory_region_init_ram_from_fd(MemoryRegion *mr,
                                     Object *owner,
                                     const char *name,
                                     uint64_t size,
@@ -1654,7 +1654,9 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
         mr->size = int128_zero();
         object_unparent(OBJECT(mr));
         error_propagate(errp, err);
+        return false;
     }
+    return true;
 }
 #endif
 
-- 
2.41.0

