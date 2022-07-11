Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1113002lfp;
        Mon, 11 Jul 2022 15:01:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uoMrXnx/NrUl8KzHcN26BPvcCxLa8sj8+CYaGplrL624khiyn3XS+8w1JRyOpz/OJbZmt5
X-Received: by 2002:a05:6214:2302:b0:470:2d10:b6e4 with SMTP id gc2-20020a056214230200b004702d10b6e4mr15409980qvb.72.1657576879939;
        Mon, 11 Jul 2022 15:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657576879; cv=none;
        d=google.com; s=arc-20160816;
        b=dk9hEWtawJ/f9AD/Ba+5APZd/YafqmVX1t7EQTbHUh6yABiSmwmZAtyUqq9UfNkAqw
         DP9x2hJoQnE6PDYcrPxoXziP7603GLgoDWCJuLF+Csev/xs+Z8Fq8PqQw5OSIcOvlddx
         leWMgX1nWHlfQ1iCm1UBxCC5Ojaj8VVUfgqLYhX7pmT6fHazfNAYIhSQXHb284xsCtzY
         oK6lHxxhMgQoenVmetnl9otQuD5pmDqggnvYvQ8DTxJ1pjoUQp2CFSITREfjbfaDlrfw
         7x+ZG3sq8Se7WOx/d7P6u3Um2h/FYYPwBmqQN1c3N3iG8Aqok/NQyEUGV32fF6yvyW3e
         5CRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=ha/fBOQkFNZTTXgSAWqd3aCaZr8aABJoRAfLAYgjl3Q=;
        b=JHMXRWKTh+s6U0JYuXU26+zAftfg0VaaV/8ZquE5l8RzqEiITfHipnChqI9+F+zITh
         alz6kqnc67OvbuW7u1+YIXt0vEk88P1W0RR7oTcny0ja7U2XtN+f9Q8XrxEd9MwGghko
         fueHI+C1r1D7vSS6rvNVwRACZ/0QJVa7q2UFr9RD38VfrFtMQsyz/lWT/azQGC/qgX6z
         y28TisDPeqCAtC07/gOxA4c/9rj7XEsB/WdP0TVZlFkh7TujVnyYgeMwlhxBJHN8IFnE
         FWuZvnzk69xPaIKkgonUhJvzOqWvAL70PfDpC9ySbZZutgPfsfAfKX/1V05AsFvCgl1b
         bwfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Sl34ywdO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs36-20020a05620a472400b006b5749a3d87si5134017qkb.148.2022.07.11.15.01.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jul 2022 15:01:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Sl34ywdO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oB1Sx-0006fJ-Fg
	for alex.bennee@linaro.org; Mon, 11 Jul 2022 18:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gZ3MYgoKCAw7u5mxAn6wms00sxq.o0y2qy6-m3yz0zsz6.03s@flex--vitalybuka.bounces.google.com>)
 id 1oB1Sa-0006er-2A
 for qemu-arm@nongnu.org; Mon, 11 Jul 2022 18:00:56 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a]:53843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gZ3MYgoKCAw7u5mxAn6wms00sxq.o0y2qy6-m3yz0zsz6.03s@flex--vitalybuka.bounces.google.com>)
 id 1oB1SQ-0002V9-N1
 for qemu-arm@nongnu.org; Mon, 11 Jul 2022 18:00:49 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-31c88e36c0bso54596897b3.20
 for <qemu-arm@nongnu.org>; Mon, 11 Jul 2022 15:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ha/fBOQkFNZTTXgSAWqd3aCaZr8aABJoRAfLAYgjl3Q=;
 b=Sl34ywdO2tSXUtCt8x/vXyXJFu+H2D/TXmrhCM7PAajQpmO0yhNc08DWDTXqmWLKzN
 LAoNpRTw4zxb7w6gPxgh8TfmD2qE0zRJ1yYtsRX2lez+OjeyL9Miu1YFpnEowSXlGIfK
 x4Ts7UeOT252jaQRrESQZ+QoVNyTGFWWZIJwPAejcxtBC5SKqemvRyt99LFcdpUCsSsA
 tjS1e+5XA9Bl8Nkz1m6blXdz7n9HJSI5Hp8p5mHqMOvFnj9d1EarfFFH4xCSxX7NI5kt
 IRnEB9dYF0D9o4nX+ieRJZX4LsEaoWf/7liSgA0KIXxUJHj/zyAa6765n0iEYqdfwCBL
 A0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ha/fBOQkFNZTTXgSAWqd3aCaZr8aABJoRAfLAYgjl3Q=;
 b=TNlO7CqsC0TImMEuTUcqD7Av0hwOhoORQXttJNYXrkE53h64VA3IOg1KW1x1grvP9k
 /KEV1aTa6+LzUnt/ycRX31H1LtktW3M9I0esAe4ioYTwPEMc/elNYePfbKk2OBbOmqh+
 EynqZhnwQsvPuCM9fhCAy5w910fyOxSJMAGr98x/Bkw+HDas7l5PMONN3dfyesLo0p3O
 VBH5X3pOXh4BJemqfmBTWs3JWAKCE2haw6sz2bQl2N6qgB1MozE7foDm3cgQr9MDIa4Q
 tTHACKMz4XNc5RwFTqKNJmDA9OZXYokM9qgHLHzHfKgaY3j+CpL+fnwkFaHXT7ssiUno
 bV6A==
X-Gm-Message-State: AJIora/Vj0VNRj5Wd/w9xsD3NYT8q02mKJIdTSwUKJjvwAORBsVPCqPD
 L6YVFoaAheeLaalHxuRTken5YBOf5TDLwPME
X-Received: from vvv.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:56c])
 (user=vitalybuka job=sendgmr) by 2002:a05:6902:72a:b0:66e:b863:1eb1 with SMTP
 id l10-20020a056902072a00b0066eb8631eb1mr19095010ybt.406.1657576833538; Mon,
 11 Jul 2022 15:00:33 -0700 (PDT)
Date: Mon, 11 Jul 2022 15:00:28 -0700
Message-Id: <20220711220028.2467290-1-vitalybuka@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [PATCH] [PATCH] linux-user/aarch64: Reset target data on MADV_DONTNEED
From: Vitaly Buka <vitalybuka@google.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Vitaly Buka <vitalybuka@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3gZ3MYgoKCAw7u5mxAn6wms00sxq.o0y2qy6-m3yz0zsz6.03s@flex--vitalybuka.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5dsVEhIKaYhd

aarch64 stores MTE tags in target_date, and they should be reset by
MADV_DONTNEED.

Signed-off-by: Vitaly Buka <vitalybuka@google.com>
---
 accel/tcg/translate-all.c | 24 ++++++++++++++++++++++++
 include/exec/cpu-all.h    |  1 +
 linux-user/mmap.c         |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ef62a199c7..d6f2f1a40a 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2314,6 +2314,30 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     }
 }
 
+void page_reset_target_data(target_ulong start, target_ulong end)
+{
+    target_ulong addr, len;
+
+    /* This function should never be called with addresses outside the
+       guest address space.  If this assert fires, it probably indicates
+       a missing call to h2g_valid.  */
+    assert(end - 1 <= GUEST_ADDR_MAX);
+    assert(start < end);
+    assert_memory_lock();
+
+    start = start & TARGET_PAGE_MASK;
+    end = TARGET_PAGE_ALIGN(end);
+
+    for (addr = start, len = end - start;
+         len != 0;
+         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
+        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+
+        g_free(p->target_data);
+        p->target_data = NULL;
+    }
+}
+
 void *page_get_target_data(target_ulong address)
 {
     PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index f5bda2c3ca..491629b9ba 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -271,6 +271,7 @@ int walk_memory_regions(void *, walk_memory_regions_fn);
 
 int page_get_flags(target_ulong address);
 void page_set_flags(target_ulong start, target_ulong end, int flags);
+void page_reset_target_data(target_ulong start, target_ulong end);
 int page_check_range(target_ulong start, target_ulong len, int flags);
 
 /**
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 4e7a6be6ee..c535dfdc7c 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -894,6 +894,8 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
     if ((advice & MADV_DONTNEED) &&
         can_passthrough_madv_dontneed(start, end)) {
         ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
+        if (ret == 0)
+            page_reset_target_data(start, start + len);
     }
     mmap_unlock();
 
-- 
2.37.0.144.g8ac04bfd2-goog

