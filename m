Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp2175923lfn;
        Tue, 26 Oct 2021 21:59:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXByqoVOIKOaI+7J8/raNRkGUtZkaOdZXnl+Z31faGsyMcgEjaP/6MI0eBdkGVwtp7ih14
X-Received: by 2002:a05:6808:144c:: with SMTP id x12mr2261384oiv.6.1635310761985;
        Tue, 26 Oct 2021 21:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635310761; cv=none;
        d=google.com; s=arc-20160816;
        b=pvw5NYhCsFO632GwJp7f/P8cZ9DpvdnKIFOBLbPwCykfmtN0vfPmEuMRCMk6cCF1sX
         2HEk3+Q9zmkLYovaBZPuzUL9HLPeG+SRZZlrKicKu8ckDbzW4CFxi3toEKBmMIlI7OtA
         Q/MCbx6P+NGKhr5gNdAtlNunUwRvs6f+Ovqo6/UTv2nEIBIf+AOypuB55CCFSwz0M49j
         QTnzzJYKULJKXbBt8+WHDDrr4udqqEhazK85LIjBOARG+a9/JjIGut8SqmKm3+4omlUh
         oCFhKx2sA5DUsDX7FLeURwBVnKgm0xBIBWbRLrp9s8xCk6z6YSoLCcQ4JBkVa3aHY1af
         hiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Zo5TdWihX0fqFGQkJwGnLAD68vX5IqLcZuqWCOpy/Ho=;
        b=NW4b0CY3Z/9c5WK/ZQE0+w64xPgWp9aAtAkbmtrtyy1Pc5t9eDswGgXQf3yF3jmezc
         lUMeaN/DcIJh2MLEut6R5+4OT4sSq1WgE+TV0LzMrlVQ7fsLYGmUi3LQbBfsL586wQ94
         yefEijc5BRIe4n71ixj7D1NiRdj/YjU0eXrqoBhWmqKEFRNt9omQRAA+WRSR0bogEwgs
         BZwYjlym0rlFUlXj4vZhrcO9HTiUcEh+1GmVeYTEY+paM+ju/q1hdTIbgY1ljHKL8sNR
         fYAqHdPlp2wHK02htqgglssNDnPa23VNDMw/r3+pRuU9ArcLxEMyljEu1ucEKtEHPaSM
         kYlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=EEs301cb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i28si23646670ota.131.2021.10.26.21.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Oct 2021 21:59:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=EEs301cb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mfb21-0000W4-5x
	for alex.bennee@linaro.org; Wed, 27 Oct 2021 00:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaz4-00059j-F8; Wed, 27 Oct 2021 00:56:18 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaz2-0004v8-MM; Wed, 27 Oct 2021 00:56:18 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso5134372wmc.1; 
 Tue, 26 Oct 2021 21:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zo5TdWihX0fqFGQkJwGnLAD68vX5IqLcZuqWCOpy/Ho=;
 b=EEs301cbturZRJCI1X6xYwruY/+L+oGeqviC8Aw0CJp4Mf+BV06OKL+1DzQpHXy9zn
 O0y7xp0mU2y1qpn7LaATDY/OwJLlxHL5GMzVT4h6VQzjtb9ayUAlyi0g3uhahWliCGe1
 Osg2fRJ3eiXdDXpsecnsY2FbBoMFcfeorh2s+F2HflHTB49YnY7siJqXKrFCgPwamBs0
 nB9LUIh3s7Lzs8eBXnYsHzW60dWCz7GP770HUH/POBtAz+flawV/kjNQNOHsl2MZ3jaA
 mTKInCqBstpod1GvMOB/A8zHJ/RYZNhDo9tvTBu+83FOf0J6Gpd/pr59ZCRSvCvM4Wx/
 OsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Zo5TdWihX0fqFGQkJwGnLAD68vX5IqLcZuqWCOpy/Ho=;
 b=NLHL70lME79m6mqbsnrYErW2QJBlKsji+QRQQs58fIoKccCdtMzSqj/hTEkQlHde8V
 f8LujgYBxxxUhmuNs+ezAX/Pw+2goBcfTTnfXdLsVkD6ih2lc7tCjUZpVDytFuzjPx7q
 VR2IKLzRBByu+Ug6TfTcUioc6wDfr/0dhUVx58Z6hWf2Bk5sMj1VefM75CJqkZ9Hi3Qv
 C3YYp87tZvjp1Xh5wxGX108jZDlQF8/Aohe1x+5qpu42WyvFX0SZPHXpobDS7FxEzn6o
 Ok+gZgFAmEaOIQVmR0xSmfUXWninKP9Gr5o6IKAGacg+4FB12ubO84GboZljm0xnIJFw
 5JUg==
X-Gm-Message-State: AOAM5338UMvvrGyjXbWo9NxVOpkyceiXK0Pm3tdESKK5GA6WXYGuzYHM
 HCKkr9kzqdkMscovUx3zw8euGVBlmXs=
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr3303175wmr.118.1635310574725; 
 Tue, 26 Oct 2021 21:56:14 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h14sm2429034wmq.34.2021.10.26.21.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:56:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] target/arm: Use tcg_constant_i32() in op_smlad()
Date: Wed, 27 Oct 2021 06:56:04 +0200
Message-Id: <20211027045607.1261526-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027045607.1261526-1-f4bug@amsat.org>
References: <20211027045607.1261526-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8vu+o+h+z0PT

Avoid using a TCG temporary for a read-only constant.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d6af5b1b039..083a6d6ed77 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7849,10 +7849,9 @@ static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
         t3 = tcg_temp_new_i32();
         tcg_gen_sari_i32(t3, t1, 31);
         qf = load_cpu_field(QF);
-        one = tcg_const_i32(1);
+        one = tcg_constant_i32(1);
         tcg_gen_movcond_i32(TCG_COND_NE, qf, t2, t3, one, qf);
         store_cpu_field(qf, QF);
-        tcg_temp_free_i32(one);
         tcg_temp_free_i32(t3);
         tcg_temp_free_i32(t2);
     }
-- 
2.31.1

