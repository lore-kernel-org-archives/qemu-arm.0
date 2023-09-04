Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1444840ejb;
        Mon, 4 Sep 2023 09:15:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoXkuWA6zpP8GeJFGqDnvijNDVHk4Jh6RduP3T2EBcNEl3gsjHqOj2VczpDwqU7LknHXd5
X-Received: by 2002:a05:6808:b12:b0:3a7:4a89:752c with SMTP id s18-20020a0568080b1200b003a74a89752cmr10528777oij.31.1693844114514;
        Mon, 04 Sep 2023 09:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844114; cv=none;
        d=google.com; s=arc-20160816;
        b=wYpDaNohJ6T2eFXG/EE9zmCo7Ys5vR6+nl62YR0DixNfqDL6zNTkYUMLRynZ9itSuS
         HWbyg6uncrTY7fzR3BNKKdtEEj1H0Wr4Fb4pOMx3Sjb02eRK/O/YEelfPdg+meBsj5qs
         KpXNfnp1B3KG/4GmXP1e6No0qyauVMaZduAcWJ87R5M4q1wYSYZ4WZgS9KyVyIYdrVnY
         YFiIShp1osjy7DksAUPG5mORUyI8sI2afTgsO087ZacPrSzMWsx5YGF2rwottTv0CEHG
         wCrUM6uOf8Zb3RK2bVkbv50QmTD2zAiWAIz0BmOIThYjPq6BHLOFGz1GHa09lVJTgXtw
         JI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=07RpMt5MApgRw9NJGh9PZXX3Pgabrwsg/tvmA1poNBo=;
        fh=M4+wifAeNQ6fagA7lq67eYgVVAfcj+heqTkZZhMPaG0=;
        b=MxtqZQntx5pUHsZiID7lhnZlekPZSMHvAm5N8tevaedS1pII56wrjvMI7YAv1fHQIZ
         M1xeUyUa9KJ/u8ut4Vopr3OyzcLx/ZhgxZHL2ApwdHbIY8tJbVyvFPUWd/+8UxZDO3i5
         eprqJpLMv5ituCMPfDjcOH4f+2+PistfmKFpu0kyrECO7Y2eKNhAAR+VFNWI0b+R/3Ta
         NFx7CjiwNBF8wBsygqmG34/HpvZnVHo4JXbbTZU6hBc6UTCxTscGC2chckIf0uekN1Dr
         h3Y4oa+kYmKSKs4bq48lnTAHvGgzgO/sDYMcyToqoAUWVksoNtR9yO3fgZJAAEk+KUMj
         1rSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="c/973/uT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020ac85c09000000b00403cecf35bfsi6800496qti.297.2023.09.04.09.15.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:15:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="c/973/uT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCDJ-0003wJ-Iw; Mon, 04 Sep 2023 12:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCD2-0003H3-1J
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:13:52 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCCx-0007dK-NZ
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:13:51 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52a0856b4fdso2192674a12.1
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693844026; x=1694448826; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07RpMt5MApgRw9NJGh9PZXX3Pgabrwsg/tvmA1poNBo=;
 b=c/973/uTe+N/IQykusnsMFRVUVB2N7JThDoD1ZZmid2KoFWyS206xgELMhWyjUvzhn
 Nj+656nMRl2zkTuSE9/MBHrlQn6kGelrB4clh1Sj8r1ZeaCCKqTEGt4JxeiZxAImz8zR
 w9tJNqlj7zvwEVPzW6SK/HR05/TJImooitZZiyeilD+0YMsqZJsMoljA8fGZW23exoVk
 /RWH+8ZNPQQmL9JAIBSWFWRvRWXt9czo6jVNryq6C+ddIYjXsY0c28t1Qe5eegAUn9B3
 Th+J3uBcEZgGsbGGb1AjKTNMWhOlBuf6NbSUWxm9ooPaIBdtKE8+Erv/uNyKewQ+kuV4
 +sSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693844026; x=1694448826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=07RpMt5MApgRw9NJGh9PZXX3Pgabrwsg/tvmA1poNBo=;
 b=Mmqx62hhia52b6jkdPHj8LJQ5l8b+I/jXKGFuHugGM/mc+qhrLLzcQ10u2khcP0nup
 bzBPCod97mSCSSpuN9Ya8LABxJ28QJoyk6vHBURjLeJaf4QDWDUKCZX8TQ5vy2Lb709q
 3ny1I8al+4sHUX0d2Be7ITGBMuAPCpJblqWvHx1euXqxj1Ramq3v01X0iQ83hNnDByJM
 HraL4MvgNZ/ha6amV/2z45cijohPUk/TEiCoZH6YqGiEfEKsPqwEDeCGK3oPJLSKMOmy
 UaZBpU+Qxauf4+5VFo/l91d2w3Q0lFQw/6A2uYnlOOidSIjVZAk4ldzdr1Gfz7Wc3wrT
 tBHg==
X-Gm-Message-State: AOJu0YyZO1/YFX5ss1ye1fj0+pij55ddTYn4brlDtxAYQRF8mWF89Ih3
 NZBqBtLVR6q0JIelI9vYqreHLw==
X-Received: by 2002:aa7:d6cb:0:b0:523:d8bf:3298 with SMTP id
 x11-20020aa7d6cb000000b00523d8bf3298mr6739551edr.17.1693844026378; 
 Mon, 04 Sep 2023 09:13:46 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 b22-20020aa7d496000000b0051dd19d6d6esm6048130edr.73.2023.09.04.09.13.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:13:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 12/22] hw/m68k: Clean up local variable shadowing
Date: Mon,  4 Sep 2023 18:12:24 +0200
Message-ID: <20230904161235.84651-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org>
References: <20230904161235.84651-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Qu/1Subi5GON

Fix:

  hw/m68k/virt.c:263:13: error: declaration shadows a local variable [-Werror,-Wshadow]
            BOOTINFOSTR(param_ptr, BI_COMMAND_LINE,
            ^
  hw/m68k/bootinfo.h:47:13: note: expanded from macro 'BOOTINFOSTR'
        int i; \
            ^
  hw/m68k/virt.c:130:9: note: previous declaration is here
    int i;
        ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/m68k/bootinfo.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
index a3d37e3c80..0e6e3eea87 100644
--- a/hw/m68k/bootinfo.h
+++ b/hw/m68k/bootinfo.h
@@ -44,15 +44,14 @@
 
 #define BOOTINFOSTR(base, id, string) \
     do { \
-        int i; \
         stw_p(base, id); \
         base += 2; \
         stw_p(base, \
                  (sizeof(struct bi_record) + strlen(string) + \
                   1 /* null termination */ + 3 /* padding */) & ~3); \
         base += 2; \
-        for (i = 0; string[i]; i++) { \
-            stb_p(base++, string[i]); \
+        for (unsigned i_ = 0; string[i_]; i_++) { \
+            stb_p(base++, string[i_]); \
         } \
         stb_p(base++, 0); \
         base = QEMU_ALIGN_PTR_UP(base, 4); \
@@ -60,7 +59,6 @@
 
 #define BOOTINFODATA(base, id, data, len) \
     do { \
-        int i; \
         stw_p(base, id); \
         base += 2; \
         stw_p(base, \
@@ -69,8 +67,8 @@
         base += 2; \
         stw_p(base, len); \
         base += 2; \
-        for (i = 0; i < len; ++i) { \
-            stb_p(base++, data[i]); \
+        for (unsigned i_ = 0; i_ < len; ++i_) { \
+            stb_p(base++, data[i_]); \
         } \
         base = QEMU_ALIGN_PTR_UP(base, 4); \
     } while (0)
-- 
2.41.0

