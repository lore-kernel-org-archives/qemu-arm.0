Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1281138ejb;
        Thu, 25 Apr 2024 04:06:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYnTP0xB/5Rpnv2C6JrAvbIHsidTPthQEkCdyZ8u9IZ4GoBuDhtiAj/C6tFW1DYz/dHIkhx6R5sBCtDVTmAXL4S8pD4wkg
X-Google-Smtp-Source: AGHT+IHgnDkV2z+5R6a9OkYY0G7nGrhlZGidMuYyX+rc6pSik8ZCMchUNhz0iAdO/bPTEGFWWLXN
X-Received: by 2002:a05:6122:4122:b0:4d8:7339:4c35 with SMTP id ce34-20020a056122412200b004d873394c35mr6407484vkb.13.1714043202063;
        Thu, 25 Apr 2024 04:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714043202; cv=none;
        d=google.com; s=arc-20160816;
        b=GoIX+T6RBZcJ1DWOG8lw8C++JOKEPidYIrjxRn9IcGYzkOEpmQ60LY1M1U8XUoWNUY
         aWGuX98F6X5EVODYDNn6wEJDdGS/Tz33+k920ajwgD68bUN8vUaMiAZcp/UlAs7YzDxj
         xxfD4YhrIwYjuoUS1d86SqDcGWJ2YCvKgf/zhvplTBv+NwBIeB/TLEYGeoUJ+w82zX3T
         ArKV71HoQvCkY3ubOWjbRGnPtsm9ZSchNput/kcx/eNmRjFfmq6K2PC0pYqegAZ1LpIm
         176q70X1j9OMpwFvqwy007HMuQGvdMcIiiqEq1RJkMjuUVX6QX8TUoyTjR/iJhOQ54Cm
         7IcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LU/r9zSSWOAgtXVFmIxCt1qMAeFSfB+B8bTVtMRUbL4=;
        fh=YaFzJHnfr4s4+lgFhoRlxsI0waUg79h7Fa3VEBwlLPM=;
        b=qrURUqtsjLQuwLg2BNgWdxr3dm2ymQuK8L0rKkP2e1gAaFColgBs18VRfl3WGC12Mr
         7Qutr1AUbhlCtbAfTxkfxtgFgeQ/YAUMyhkhcn3Db++1hfH0i8yoYGlTlDk1ce39ProF
         iBAlBKolyCgVPz7APsKTlZAkPNCs5VtDbSd3uiBenWPgflIJmgz9q2yx70MW0/E+sLpi
         FpunqNpRrAVfadRZwTA2Et8YZ0wI8o2KQECkABlbn1CQQWxleiUJjvuv4FTcSjhexUTi
         AQWOTbEHhK2M3hrFq6DZl2lD56jvp9Z+XX9uh38zSkGElANfL6gjZFCZvvH493JgWHkC
         r3dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WrXR9xds;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm21-20020a056122421500b004daa7878371si3012557vkb.297.2024.04.25.04.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 04:06:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WrXR9xds;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzwuE-0002ll-NQ; Thu, 25 Apr 2024 07:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwsn-0008VQ-Mq
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:03:38 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwsk-00007E-9K
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:03:16 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2def8e5ae60so4591271fa.2
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 04:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714042989; x=1714647789; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LU/r9zSSWOAgtXVFmIxCt1qMAeFSfB+B8bTVtMRUbL4=;
 b=WrXR9xds2luym4J6tztK66DnJaf/wuj2yu2EDa583PaxoSFJwEWk1s2L1aNchIx+/r
 bbR9UZz7iFtrCvMuaaKDwy3TZsSwGW9zzUFnkKUtVogRlNYkQ18amTlZR9yb/pPExQ2j
 fjGvhqmzFGItbBbAjuHVlaCBQNbmXskDV7Snl6aLxO67SwCZGLsYvUI6KWzLAQQ/obJ8
 MeQ9254Ek3cXhnTeh1ApAZ9/J5mkzleH+K9rKInF3B7Y1sQ4VXjXN0HdV+sqQ7CRQsXS
 xsVN1HokLi5KiqQA+3m7jZXt90Xy2TAVok0I9hsD2cFYXLzuWsODMcI6TuDobnVQOdTP
 5GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714042989; x=1714647789;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LU/r9zSSWOAgtXVFmIxCt1qMAeFSfB+B8bTVtMRUbL4=;
 b=HBK5rGM/71pXYZ9gC1VGbZVkktKAsRE9/q7qHdwsNvr7/XO0KQqcRL6OGhRXk/Iroq
 68nEfzDIpVWH3Pg8h8YYX3IW8LYjm/Rssjcd07ydHFIl9Gxob70+T9we/Bgdgh4X72Qp
 b+FiwdPcSr2s4cSJlpvulKW3/E8xI4xaxqhTYGE6PlV5vldHVT7wL9Y/LU4s+2llu4ZA
 IRr/yAw2+73EP9smTiUPnuGze7vDoskyDzRBwzpHeYhrOBFehKOG45CTkV6usf6ZDgIa
 +DPNCPAU+wZiDHW53LNSwefWtyjBypZqBIszzS/SvQJu10KYJ9o52mbgPgcuBdHd9tMZ
 AzGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX711dlX2U0KbXfIlDYR+1L9KL+pTtKpcg9OIftE+ofiSL5ldgOJFk7vJCMWxEK5I0qEfo2Gio/jA68VibAtyYury0a
X-Gm-Message-State: AOJu0Yx8iVmIlLKZ6lmvjvpB0jhBrPv4mtdGF0U/HS48DfKPcfDUeznZ
 wZYfWo3oHuSpJJtDIRcGnazO40aG3WuX5kX2fFuyjRE6Lh+RBeow716KWxWSvGo=
X-Received: by 2002:a2e:954f:0:b0:2de:81c9:14b3 with SMTP id
 t15-20020a2e954f000000b002de81c914b3mr2837508ljh.35.1714042988935; 
 Thu, 25 Apr 2024 04:03:08 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c511400b0041a49b10a13sm14955302wms.11.2024.04.25.04.03.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:03:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Fan Ni <fan.ni@samsung.com>
Subject: [PULL 12/22] hw/cxl/cxl-cdat: Make ct3_load_cdat() return boolean
Date: Thu, 25 Apr 2024 13:01:45 +0200
Message-ID: <20240425110157.20328-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: BsQPxFtwUi7o

From: Zhao Liu <zhao1.liu@intel.com>

As error.h suggested, the best practice for callee is to return
something to indicate success / failure.

So make ct3_load_cdat() return boolean, and this is the preparation for
cxl_doe_cdat_init() returning boolean.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-ID: <20240418100433.1085447-2-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cxl/cxl-cdat.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
index 551545f782..b3e496857a 100644
--- a/hw/cxl/cxl-cdat.c
+++ b/hw/cxl/cxl-cdat.c
@@ -111,7 +111,7 @@ static void ct3_build_cdat(CDATObject *cdat, Error **errp)
     cdat->entry = g_steal_pointer(&cdat_st);
 }
 
-static void ct3_load_cdat(CDATObject *cdat, Error **errp)
+static bool ct3_load_cdat(CDATObject *cdat, Error **errp)
 {
     g_autofree CDATEntry *cdat_st = NULL;
     g_autofree uint8_t *buf = NULL;
@@ -127,11 +127,11 @@ static void ct3_load_cdat(CDATObject *cdat, Error **errp)
                              &file_size, &error)) {
         error_setg(errp, "CDAT: File read failed: %s", error->message);
         g_error_free(error);
-        return;
+        return false;
     }
     if (file_size < sizeof(CDATTableHeader)) {
         error_setg(errp, "CDAT: File too short");
-        return;
+        return false;
     }
     i = sizeof(CDATTableHeader);
     num_ent = 1;
@@ -139,19 +139,19 @@ static void ct3_load_cdat(CDATObject *cdat, Error **errp)
         hdr = (CDATSubHeader *)(buf + i);
         if (i + sizeof(CDATSubHeader) > file_size) {
             error_setg(errp, "CDAT: Truncated table");
-            return;
+            return false;
         }
         cdat_len_check(hdr, errp);
         i += hdr->length;
         if (i > file_size) {
             error_setg(errp, "CDAT: Truncated table");
-            return;
+            return false;
         }
         num_ent++;
     }
     if (i != file_size) {
         error_setg(errp, "CDAT: File length mismatch");
-        return;
+        return false;
     }
 
     cdat_st = g_new0(CDATEntry, num_ent);
@@ -185,6 +185,7 @@ static void ct3_load_cdat(CDATObject *cdat, Error **errp)
     cdat->entry_len = num_ent;
     cdat->entry = g_steal_pointer(&cdat_st);
     cdat->buf = g_steal_pointer(&buf);
+    return true;
 }
 
 void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp)
-- 
2.41.0

