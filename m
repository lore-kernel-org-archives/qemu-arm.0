Received: by 2002:a2e:b168:0:0:0:0:0 with SMTP id a8csp67491ljm;
        Mon, 26 Sep 2022 10:41:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ZLyRncpTi5njf2/GP027B5vlyMlqExQf+lxsCJ/Qi5wuyIqs0Irxm6vOVxXJurId0GLrU
X-Received: by 2002:a0c:8d09:0:b0:4ac:6f1b:3a13 with SMTP id r9-20020a0c8d09000000b004ac6f1b3a13mr17841068qvb.98.1664214067586;
        Mon, 26 Sep 2022 10:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664214067; cv=none;
        d=google.com; s=arc-20160816;
        b=Cabfhqyg9+CcNbXBB3gfvUitYqpFIizjWVyYd5y1I7YCb6ACSqxyUmUtzU2f3h26fl
         zjbIwK6E65Gn1OMGIy/C37KVgZoAbqZdUWDx7j2GUjruRhSgXn3TLow5BlVlJMF8cvbK
         rwW5N1+8A6MsH9kpYQgKchdHt4GhR+kE92N3wGj/ZEANj6XG7IdjS4lsPW1K1vpvZd2i
         +2jnpCSTFt2Gdip7Hub6ujMefIaCGfnjHVz1riPLtzciRgSc80SZX7xKiV9k0DTY3ETT
         XSA55Ab8Ven9je3RupAyIULOtY8plEsgrx/Wo7suCranJ4IiWdOosUwmYLmq/y8Ebl+y
         Rmnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V15rvRZKZ2cJu12JzYc4O3nQDWFfSAbiLD5gXBTKdAA=;
        b=Gfc85wulTOKu5vZ7EK2CctLeRCQsGNdYXhZURtSxCCwHwUNTgE/o+asSUhkKC7rBri
         PQTMZe3688tzmwK6DZR90tyrrTgFKSnbj8pR4Qzek6RY5UxAy5EeL8pA6ZBgxlXT3fe/
         5JJhirRCSbRqw3Q6nMpzE73y67dYgUrLvBgjtZomE+OdPzcTJcrdSQlYdjkOsxp0vDNO
         LIAhyANvlBYGTzvNQjm/6q+fc2PEAqRZrrfNRwZ6Yn0tGdIZvwEYEcU4PFnKIgJSG7kj
         nHNqvQVfGLUuGwjntMjpbX6DXHYMauqDa329f/Z9MD/BViPcZy2+ETf0TnCCvRpqn/96
         QisA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=iwljlsh3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l28-20020ac8459c000000b0035baf834a59si9368131qtn.221.2022.09.26.10.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Sep 2022 10:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=iwljlsh3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ocs6N-0000S7-1O
	for alex.bennee@linaro.org; Mon, 26 Sep 2022 13:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4W-0008Ag-8q; Mon, 26 Sep 2022 13:39:13 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:40693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4U-000265-Ms; Mon, 26 Sep 2022 13:39:12 -0400
Received: by mail-oi1-x22e.google.com with SMTP id n124so9114340oih.7;
 Mon, 26 Sep 2022 10:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=V15rvRZKZ2cJu12JzYc4O3nQDWFfSAbiLD5gXBTKdAA=;
 b=iwljlsh3W/Iwiu1jFMT1r8M2psmL1jtQKPjbI5JrdSfkKn3h28GSYC3MZejkh6gH9L
 H1baLT/Diy0J11XEsW2Se9cYP8b0OTNDj52RLJzn0TIx/XKEUS/s6q/2iW95KBrt4lJR
 kv8SjYycpAr5+rzBf6MQOKFxwLoQh1Jr0ASDSMNA/kwoLyCPWaXiuvUBSpPaQajh3X7h
 c9PNEVqdqsox7F96OVTtoFdhYKeLKVeQhd08fZfVGMAdA04qcpyrOC3QASy4IdaoEw/l
 EX1QBJHinjtbTuyZdG5wVaQjw+jfpvt919jg7DGZ+xKyE0wyveJ8yxKnsREN/68QeJcT
 WXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=V15rvRZKZ2cJu12JzYc4O3nQDWFfSAbiLD5gXBTKdAA=;
 b=umULU00I950shcXye/I9NgjuZRIH0JdwTY7nIutLmXuLp2NC5tFCMiecc3iddIP6hG
 WfrosxOctqRDWgJUXIv2VkOPvPEsXthwblmuSXUJDTu1D2WpnYSP8JJGIhTCybeeMhQJ
 USsIdGHOAkM6Z8HHKeEsO0pNARSHEzzQK8xGEcLG2QNwRxJDtjWRrvDh2YNwMd0ehXTs
 tZwlzKDRFZY2W2VaT6TrawgG/sJsWtgl5C67VVgoN8B2YVLUNz2ve/0Z8AKHn8D34mW6
 rl9XZfgox+evyD1QRlWCX2Msyhu+3LWgDD+szslJzZdct2a/rhmJ2Ja8SbB3MAHSk8Ws
 a22g==
X-Gm-Message-State: ACrzQf1xB2CcNlMP8zIEEFJP73QW/ZsGC6Fo3W3Ms4fbDPE6i9iQxwBv
 J0gmBODND1jTVOWUEys8pYHxqd0w87M=
X-Received: by 2002:a54:4e92:0:b0:350:fc35:2fd7 with SMTP id
 c18-20020a544e92000000b00350fc352fd7mr10298972oiy.59.1664213948635; 
 Mon, 26 Sep 2022 10:39:08 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:08 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v8 03/16] hw/arm: do not free machine->fdt in arm_load_dtb()
Date: Mon, 26 Sep 2022 14:38:42 -0300
Message-Id: <20220926173855.1159396-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +XBkqtKc1arG

At this moment, arm_load_dtb() can free machine->fdt when
binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
machine->fdt. And, in that case, the existing g_free(fdt) at the end of
arm_load_dtb() will make machine->fdt point to an invalid memory region.

This is not an issue right now because there's no code that access
machine->fdt after arm_load_dtb(), but we're going to add a QMP/HMP
FDT command that will rely on machine->fdt being valid.

Instead of freeing 'fdt' at the end of arm_load_dtb(), assign it to
machine->fdt. This will allow the FDT of ARM machines that relies on
arm_load_dtb() to be accessed later on.

Since all ARM machines allocates the FDT only once, we don't need to
worry about leaking the existing FDT during a machine reset (which is
something that other machines have to look after, e.g. the ppc64 pSeries
machine).

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/arm/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..60bbfba37f 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -684,7 +684,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
 
-    g_free(fdt);
+    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
+    ms->fdt = fdt;
 
     return size;
 
-- 
2.37.3

