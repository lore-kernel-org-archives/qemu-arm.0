Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2044114ejb;
        Thu, 7 Dec 2023 18:33:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXMnoEJmPqAc9EqHDPpIIyZSSllV4RD4E/5SAScMS8RMBFHGiiWcg3y3aFCn7HPHD5qC+s
X-Received: by 2002:a05:622a:118b:b0:417:b55d:dfa0 with SMTP id m11-20020a05622a118b00b00417b55ddfa0mr4185460qtk.0.1702002786699;
        Thu, 07 Dec 2023 18:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702002786; cv=none;
        d=google.com; s=arc-20160816;
        b=fg5GDnglkmUY5zmeimAzRarRLATomkOojVI1hdOYYNk1RYQ4eNnELBtLA6RVV1UvBp
         WSNaSXeIJFi3Z6Fg3N9HShSGNEliOPjfNUipLOqYQ5qIpJtkQ/Ji+Vrvwr6q+b5dLKok
         nGYDagP6Mys9KSQvTs1ysaVCO9ne+48xBZAZoMP/UGeXxkyijOSR3IXPuySBmrOvCctQ
         LfuoDdFG6g58GpKvByoFU0nst6VTxwZo045Kv59CnUZYHrZVz95tghY1OeKzWBGUo3aL
         mVmOrhEi1OkhX+gPE4ihdmcAB1EiizqAgeZuao1BDtCe+oNoWt0s1qRRSaE+bk71n8U+
         ZKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UfD0K0aibjreKo4OGd+o7D2cWSxh06lmc6TQmHfOTns=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=yjIFg35dmZYKBSrPTDvfdeV/wKHBPQd36Dd8lZ9CT7uYkTmrdDR6RhGVQV0oHWFKPe
         1oxOkvxo5pxyCDjr37amle49qiovO479O7XRpzs7NvL5Oq8wSkUD8NkODha9H6+OjJxy
         TgCbyL9URWs2ynjmKghDf7C9FObTghLPaOIoN84W56A7FOllqmyuN3cMaeWE4MmHLf2n
         bo1e3WCF8kjNpe+DywxK9tQtFBq6eb14o7tPvWinjF5Aad/tyzZlxwlBdVWtJQhCjmeS
         j3aQVU5lX463b8dzBfynsH/wXy/ZJLG9vwPI7jainwiHLQ9B9X33n80fmmO6jDjNmZ0F
         5Mtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=c2xQjnfH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22-20020ac85456000000b0042588249e28si1098072qtq.306.2023.12.07.18.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 18:33:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=c2xQjnfH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rBQfJ-00043C-W4; Thu, 07 Dec 2023 21:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQfI-00042b-FH; Thu, 07 Dec 2023 21:32:32 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQfG-0002SG-TJ; Thu, 07 Dec 2023 21:32:32 -0500
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ca0c36f5beso20170251fa.1; 
 Thu, 07 Dec 2023 18:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702002748; x=1702607548; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UfD0K0aibjreKo4OGd+o7D2cWSxh06lmc6TQmHfOTns=;
 b=c2xQjnfHPq/hDUJ8DCVKMVwOgPO1fd7bYEFUKe80eRPCUHuef0Q/poNSPjKs5bs5wS
 4RpJ9XcsHzhMnaGDwDHhIrbYwSECwz1GsmQDGG4JnRH36Gh0VdvxpZ95nQSBTxWPEYya
 jT3cB5fzUeyv1ZbyAlqttsiuDX3/Lset9kNcnp0egLSfxnGjnwzVHjrGUEugrMCBSoxU
 9qphWQeK34Qh99D/cND93vKKhC4oln7+5TLnxKsOR/mudbG/q6hfA/nwnYLV/RwJuzll
 JU4ATNxnGFhA06MgQR6ZgEF+N+HVq7OAZHHn1G7jmBUZKeFT7cseuTbib3NCiws+VxR9
 gz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002748; x=1702607548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UfD0K0aibjreKo4OGd+o7D2cWSxh06lmc6TQmHfOTns=;
 b=sBprWKnWczWYTsk93Fq0XzZXdxtNRqnA3vw24zPzibxvZLkSuRdEcylJDRJ60eNh32
 bbDA3RcjZeKZClpWNfRGF3cQkv0/hx+zCAzRpqz6aJ8Px1mvnTFfDpsu5T3w5biTftS3
 0MCKtH5WOKKtEDpi73xrFaKEbWgUiuXGd04aAALfQvRs4zxnahL1rrzh2Mb9SeHDeHFb
 slibKs7I0KAoELQO2pkXPT+eoVLyvlRonu86OLbHi9q2sh3/WRydKD28WQOltJWwgsK4
 LRXUtlwRm3psSZ/ch2b54AoNyT2Unrfp7z98UfqMojgN86zTGrzDLgFR2ZHAtxbSDCTb
 V3Wg==
X-Gm-Message-State: AOJu0YyN5yILiGoHggSW333jVBTp56wchJcX2vFUtPla3R77MtagL5t1
 B6TDoVzcIXPDNM4oed0IM8PeIL+pJOzCmw==
X-Received: by 2002:a05:651c:19a6:b0:2ca:228d:3830 with SMTP id
 bx38-20020a05651c19a600b002ca228d3830mr2599849ljb.18.1702002748321; 
 Thu, 07 Dec 2023 18:32:28 -0800 (PST)
Received: from localhost.localdomain ([185.200.240.39])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm99062ljh.19.2023.12.07.18.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:32:27 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v4 10/45] Add BCM2838 checkpoint support
Date: Thu,  7 Dec 2023 20:31:10 -0600
Message-Id: <20231208023145.1385775-11-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=serg.oker@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 27Dedro3jwBv

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/bcm2838_peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index c147b6e453..196fb890a2 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -22,7 +22,7 @@ static void bcm2838_peripherals_init(Object *obj)
 {
     BCM2838PeripheralState *s = BCM2838_PERIPHERALS(obj);
     BCM2838PeripheralClass *bc = BCM2838_PERIPHERALS_GET_CLASS(obj);
-    RaspiPeripheralBaseState *s_base = RASPI_PERIPHERALS_BASE(obj);
+    BCMSocPeripheralBaseState *s_base = BCM_SOC_PERIPHERALS_BASE(obj);
 
     /* Lower memory region for peripheral devices (exported to the Soc) */
     memory_region_init(&s->peri_low_mr, obj, "bcm2838-peripherals",
-- 
2.34.1

