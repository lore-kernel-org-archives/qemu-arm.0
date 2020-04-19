Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2896119lfm;
        Sun, 19 Apr 2020 09:27:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypJwh6yEEgv0EQNtjN/dBORM+F1/O9HhQxGUuo4gUy1ZX7BkK/lXASq+s6j/Xbtdr76fRl4D
X-Received: by 2002:a37:5e47:: with SMTP id s68mr11643170qkb.411.1587313661672;
        Sun, 19 Apr 2020 09:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587313661; cv=none;
        d=google.com; s=arc-20160816;
        b=bzEEr1V1YzY2Dz4pzG+++K3l7QMuPEMVZWOnJUJLxTbF4ccCiH3hcBdPqrwArkgHQK
         c1wKnfTA3jjSgs1XD3ufe0rg6vo/c36LeOqdgFwxtp5/K0i84pFCviQlcVu+828TSxGO
         OWfIdC1NkhGo4COsvpS99T5gDeL2hS6XckUn3CH0d9eR5Ph8GZ7uj38xBVIYpfPWgsf0
         LDlCpW84lXvMbi3OKC9SGoHOHe4jgTwDw9Vh5fZwJHXCLnGWRXl2Zqu0OwRS5/5Lxd2S
         mFEjPGTYLzqq9RYBJN7fWzfjFojWJmQ6QvSUEXVPgHAyOaoqqRJEzZYRFtI+Hra+31SZ
         AkjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3HaUgFQJn75EXnF4xu27e05BkwttmkjB/KLaOVhe5Zc=;
        b=u5o+eoA+xmMGKVgsJhHdLDl4fkW3BhXQEEyJZ1q4o5AIs6zdpB631dJhXzXUf9bCY3
         apET9AYb8OFj0qlYrlfEIb7l7P9gZ43SPqj35oUMUu1FQZe0APXGFtZg8SKFjV75lmoZ
         3s5zzQJKUM2ATCssFX4HrkuKww1qbZqYA617K4yxIxhXoAXQjMhLF1zYga99zBHovDV8
         qN8KuRaKwwNokOCTO5lBSqzn9yy0rQT8A0DG4EDBe574vlgBRbPANn3D8Rinb8uC8qyw
         Nhe8PY7l+P0rK4oF2u5+lqgQljFIYeNm9khGZVZcHFhTKjoXVG+MbYDp9LioTvEenDCQ
         p/rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kML072Bv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o63si9140022qkb.257.2020.04.19.09.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Apr 2020 09:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kML072Bv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQCnF-0006uO-3V
	for alex.bennee@linaro.org; Sun, 19 Apr 2020 12:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42260 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jQCn7-0006sq-Tc
 for qemu-arm@nongnu.org; Sun, 19 Apr 2020 12:27:34 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jQCn7-0006jh-Hx
 for qemu-arm@nongnu.org; Sun, 19 Apr 2020 12:27:33 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:45104)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jQCn6-0006es-8k; Sun, 19 Apr 2020 12:27:32 -0400
Received: by mail-lj1-x242.google.com with SMTP id n6so3890449ljg.12;
 Sun, 19 Apr 2020 09:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3HaUgFQJn75EXnF4xu27e05BkwttmkjB/KLaOVhe5Zc=;
 b=kML072BvLIF/DC/wAPBh3bMx7Vg+4cwbVq3/M9/Emmqc9+lKzLijTccIZO8f21f5mX
 /MpVlUhDyhLGad5Whetnd/jJ6g/Cl8miESQgcGDG3Y8APVj9izcGOLWsj/kXOS2+CSXt
 sRNEtoaan+wwCHDwxsGcOHhsMoyL/cEJqwqWecRybcdXmfppkshlcsUT8E/ZxEbjiie5
 1rhs4ZEupEw1A5CfxbsMm3G12X7A+34piSTxmCF8Z65AAVDIofBPoe68LaektMZSEHLs
 YCKBDovf6oERR+Le1eYBGLLoRA3kfgob4bBU9teC4hbLhHjxmP0svPOsE/Lsj72UPrrk
 4YVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3HaUgFQJn75EXnF4xu27e05BkwttmkjB/KLaOVhe5Zc=;
 b=dMjBZkvV1/0MW95H6PB03rypNZJUmFxpGwG3SU7wSsiWe2qlRYIfDdJRmVHXC0Rqh7
 0rT0tZ4ml7BUh9eyF2W+zSY4u4pRm7ke5VJdo0adrc+BRWdSCgGI3eVX3BPX0oxORufC
 KJZH28oEqnTUNeOCZmihaKnh428atcxAFjEXdWblWkSN4etMAequKBLDa52PWAdtiGXq
 D7U8OtC3Yi9DL/bFjFrUsUyPdFFPUGzug1279R6dsWIHP6DqWSxHmKF3SM+FepNDatAr
 h1mqRWv5kxvy6NkJYr9KhuR7cqlzUtjZkHqeVvh8+T9qbdTZhQI0bLArwHcLQpcsPCT+
 1ndw==
X-Gm-Message-State: AGi0PuaQy+3H8ifxoSApIe5u9Gyb1eWyStZWDz2PhQm7Trv5Rctb2N/h
 mmAWn2kefjtGc1SlWNEgbida8vwSRgI=
X-Received: by 2002:a2e:9455:: with SMTP id o21mr7735340ljh.245.1587313650037; 
 Sun, 19 Apr 2020 09:27:30 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id m13sm23341469lfk.12.2020.04.19.09.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Apr 2020 09:27:29 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/3] device_tree: Allow name wildcards in
 qemu_fdt_node_path()
Date: Sun, 19 Apr 2020 18:27:25 +0200
Message-Id: <20200419162727.19148-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200419162727.19148-1-edgar.iglesias@gmail.com>
References: <20200419162727.19148-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x242.google.com
X-detected-operating-system: by eggs1p.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s4H/DK+nuNpQ

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Allow name wildcards in qemu_fdt_node_path(). This is useful
to find all nodes with a given compatibility string.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 device_tree.c                | 2 +-
 include/sysemu/device_tree.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/device_tree.c b/device_tree.c
index bba6cc2164..f5b4699aed 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -308,7 +308,7 @@ char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
             offset = len;
             break;
         }
-        if (!strcmp(iter_name, name)) {
+        if (!name || !strcmp(iter_name, name)) {
             char *path;
 
             path = g_malloc(path_len);
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index c16fd69bc0..7c53ef7634 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -39,6 +39,9 @@ void *load_device_tree_from_sysfs(void);
  * NULL. If there is no error but no matching node was found, the
  * returned array contains a single element equal to NULL. If an error
  * was encountered when parsing the blob, the function returns NULL
+ *
+ * @name may be NULL to wildcard names and only match compatibility
+ * strings.
  */
 char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
                           Error **errp);
-- 
2.20.1

