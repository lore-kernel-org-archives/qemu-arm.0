Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1813588lfm;
        Thu, 23 Apr 2020 05:12:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypJIChP8qA/FPy54cQyNWmUfuNKCpwjWuZDCX7Nbr5lcy4iTK/6icZUZA3VTZLZVsflNIJ9Y
X-Received: by 2002:a05:6214:4f:: with SMTP id c15mr3855461qvr.8.1587643927446;
        Thu, 23 Apr 2020 05:12:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587643927; cv=none;
        d=google.com; s=arc-20160816;
        b=Z8GyaDjNWuNZLRYirtxIaJPJOrx89mRKEg4851SgGt8L32PY5rUIAR6BNvPa67wHl8
         XjsRD+hDRGxBoVfgH/10XTnMBdHgrbiohBmt2OIhVIoR/6X6j/baCsAtEmEhFsY7CdTn
         SUbhVUtjQ1+0hBEv5kXBZKJj4+Ad7YTTXxefRvb+T3F2PW5fF2HnfZQiTA7HPnmVp1+H
         7BdlPrDaz/7C1ZnUbM9M0PTz8h9P6z3Y2tH/3OA7bsyL2RnzonJRPUO2k95SKbSHtn0F
         RGEwIMR2pX/cWczt30560zS34DjhHUVFNNNnqikyI7SQYky1vi/aY+sErg7eNz0M826m
         hSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YVkWkfMLZqJjeUY/UkhC2JqEDudQAewY227aecSIcQA=;
        b=01ygKSLselIo3YvfMvMybSLfyvrxcJE/BnU+O+uDy9rexSwBbT6Nw7ex5c8loqaTs+
         +zh4Nj/CpxIlZhbqn1RRWdf900AOIcuoB2t3K3lr00zUnvY6gwQ2smCoKqOpxZ2iIdcN
         jPNwJ/H9Z1s1etNR5oRRI4VcKfIyzE6OAHocIFfVkNkpAc0Qc8QfPhuW79Xh2Zc/RG10
         RvJtpXHOqnBXync9cliSaY8A5UwBrXGtXncoZIWm2YlCWjx2hwFstFCQtQ963vPLvFxp
         3phQo/5MRisahQufw2+6kVJPAbkZ2eAr+UYfjRcnA7U0fLbgLVkpFkbookMDd3VhUvNw
         k1AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QvLz5bKf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21si1349914qtz.3.2020.04.23.05.12.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 05:12:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QvLz5bKf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRai6-00026I-US
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 08:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jRahN-00024X-Cj
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 08:11:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jRahN-00085v-2F
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 08:11:21 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:46061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jRahM-00085N-LE; Thu, 23 Apr 2020 08:11:20 -0400
Received: by mail-lj1-x244.google.com with SMTP id n6so5907840ljg.12;
 Thu, 23 Apr 2020 05:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YVkWkfMLZqJjeUY/UkhC2JqEDudQAewY227aecSIcQA=;
 b=QvLz5bKfJ7ZkPBA+xQ7RXcsCxhiu4FopAVwgqaytywA6rFfM/yIE2GWFQysTQ6Mzdy
 vO83kZjsNAGSEtdAPl9QlrVGPM0kj/igm2rKRavryTRUhi0UCbKRHZmxiUcinVxBRxpm
 bLuq9wbDeJPysVu3kH9VBTOl5QuKi4wVOfYzJcOW/rXLvNqJrzr95jNJZwdYmU5rED2/
 o/VdAaPW6H98n6E9S+/2aRGSIUTu7BjzsZYya39dgJGnvfb44E4MOYnkwd76TO+E3PS6
 HvoV99sD7KR9vOI0nNu5Mm8t/nxs3E+6cEx4oDMiRVKztJEYiMKv0rsULccDcT2XRFHH
 ZJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YVkWkfMLZqJjeUY/UkhC2JqEDudQAewY227aecSIcQA=;
 b=oiFULWgTHNoZRvAlLsQgEaVmb/zL0d6npdAo44hiF3SOelsKiMlqRv6zlZy0WicRlg
 acl1gnkN815i2ee1nYTOeB4mWdYGD+lGvfTduRuCkrQL1rodfvCWg+9jwEY2JUzgewqW
 kw7vboLSprWXJTNA1aBofN+vml8yAr9xXK4nmveE47O5APIJw7b2NzJIGeqhrzFMOoO7
 taLc5W+TEgXu1pqEnLfscSPcn8ENC35RWtI0rvfHBlt+wKQ9U/eRSa7NID3loh+LPgbK
 FdM8BZ3IaM7z6anNd5NSCmddJfHBn/ytYngdoXkGeML2O4lN/AhjAwBQn6Ajdx0Bd40N
 y4ew==
X-Gm-Message-State: AGi0PubuABfx/P5yrovNEQhnGdIX7yJWLoSfiGi551YwvBUaag+MxCF4
 l0D1xomalNKq8x5N/2tP7X6NV6BtQNw=
X-Received: by 2002:a2e:a40b:: with SMTP id p11mr526774ljn.148.1587643876676; 
 Thu, 23 Apr 2020 05:11:16 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id u21sm1639447ljo.61.2020.04.23.05.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 05:11:15 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] device_tree: Allow name wildcards in
 qemu_fdt_node_path()
Date: Thu, 23 Apr 2020 14:11:11 +0200
Message-Id: <20200423121114.4274-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423121114.4274-1-edgar.iglesias@gmail.com>
References: <20200423121114.4274-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::244
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /AfmKFMBrww5

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Allow name wildcards in qemu_fdt_node_path(). This is useful
to find all nodes with a given compatibility string.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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

