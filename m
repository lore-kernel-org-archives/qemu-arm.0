Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2905899lfy;
        Mon, 17 Aug 2020 07:03:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn+ebFbwY5QHYVWLRVTdoVSuUvjwFpaJxx7S2mgdYw+IU5saciZSdNny5LKc+A1iZL/CDL
X-Received: by 2002:a25:414:: with SMTP id 20mr20706372ybe.97.1597673002227;
        Mon, 17 Aug 2020 07:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597673002; cv=none;
        d=google.com; s=arc-20160816;
        b=Jk9b4PzqCQsBs5UTakkbrHNCylgYB8AH1j3auzggfQUSfI65L2Ahm8y8d5MmNUD+In
         EsBtlQeiftzR/3JyGer3nEXXsp96CMFPHh+hyUcYR+uY179jyEWHOF+Ac1tonv/6dKId
         f0PrzsORJTnrWAlOykITy8/rAT0nZNRsaEnJCsc2A+nHdPB4ca2gucTj+vd8W3D5Ki8g
         S1DUFwgWsNMkwUYe8euFWePK5BHSH4Sl5bx1bbHmeAO0aUBBrlitK/uBXjKuAg6zJ480
         aTcERfLD7pYVYdQ5kkM5dtCZ/pG3YFVJ9BV8pv07P/egyHfapDmjTdSnXo16JJMsJHpM
         eWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YijezSjj37b3KI8DzXtGc07DWsdbUe75Toiwcts1NQA=;
        b=rUtZhLkk4NXJrEPn15JsYl6SToYpS62HE4cJLZE8Ep+FSkT0H4daXSeZrwg6uwiQf4
         qUaFaAn1JDpvolSVa26ZhN94vDu3ZjoJAt5oAvxHbt+eIMtRvqTiNU1fiFARIIFIzw62
         wz+hliCSQL1xKnI4WfbSjm56RsqGKypqjcmuYwz+DVlTPuo4uh1CW0+GEcV7TQSoS20i
         OweBFEOcbpZdfDOisPW+VGeuQtjj0h9vPdOWp8ZACQPwZrWNrww7exWbKg7qBghgNcCc
         0I8MRyxuFs5DDP2D3R4/E8Swf3OGhRkDhvMHQ6xfonEF15EIxy9ZmG0js3LDASHIAtIC
         6o3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="YF/rUwhG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si23934875ybt.339.2020.08.17.07.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 07:03:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="YF/rUwhG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7fjN-00051M-IF
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 10:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7fhx-0003Hv-J8; Mon, 17 Aug 2020 10:01:53 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:35510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7fhv-0001We-0L; Mon, 17 Aug 2020 10:01:53 -0400
Received: by mail-lj1-x242.google.com with SMTP id i10so17606858ljn.2;
 Mon, 17 Aug 2020 07:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YijezSjj37b3KI8DzXtGc07DWsdbUe75Toiwcts1NQA=;
 b=YF/rUwhGmFUPujnQ7vq2K4GiXayIL+d1C3l7mjkgDdTVho3yD9xIOoiz5U8AM8aqPF
 8iWs1m2cK79vVFH+b9yDbmxCRxGBNtcQM8bjztfAKnfnAARhK/3Dzt+vF1d81V2+1gBu
 P00+ciwOq2zFSFEFVtLccCBpq4eB62qgLDd1BuRVLwLDXjqS4t4OXZvlKAzaOqG3grNO
 P5mTWOkKvenav7Dkr5p7waOvbjd6CKzY9ocK0NQ5Z1vJRWhI0nZSlmDNPUmZ4znDF+iR
 UOJaoFql9QYDiwgXznV0bU7QW+iVHUA9x5mIP6sv/FLKcxBCuIlwos6QVUwn9TTvRul4
 xIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YijezSjj37b3KI8DzXtGc07DWsdbUe75Toiwcts1NQA=;
 b=E4G4YHseFqpSG/XoGxzrE7FM+H6RxN8exKWlrXhRKGfGY60GAyEWxztE0dEy7ev0Ds
 rGmvWwDA07TdR/SMCSlSavyrPWETu4rmkCaSHuG9uz5WU49ptJTXdpdhaz3OMoI4Ptff
 CLwad5XCrX+gjkHoTvoEYyRHufZcMsL3XdeVt5bvrTv3nyPl0VDp+y+GbZFDgWCuyg43
 z+uZX8cao8MhtcT0ETWIJ0JrCmnmdMn3qdkWXPWaMIBLRcIvCYzRuJIiqV2zf+mQVj0/
 q7vzfhl31X/w+xosE7W4n7QkJcTp52g+SiAeTx8ulhk+2oClIzN7y0UhtTm0+p+mZwu6
 sN9g==
X-Gm-Message-State: AOAM5338rwBDlZkwNz93lgHkEZ4nf1rZM1eUWhK71HDgNGdZLYAyxv2q
 REEoV5F6L3e4ejWnHOKWYv54V3rXidb8cWi6
X-Received: by 2002:a05:651c:110:: with SMTP id
 a16mr7987230ljb.152.1597672908652; 
 Mon, 17 Aug 2020 07:01:48 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id b16sm5063513ljk.24.2020.08.17.07.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 07:01:48 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/5] target/microblaze: mbar: Move LOG_DIS to before sleep
Date: Mon, 17 Aug 2020 16:01:41 +0200
Message-Id: <20200817140144.373403-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200817140144.373403-1-edgar.iglesias@gmail.com>
References: <20200817140144.373403-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GRueixqoWHQg

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Move LOG_DIS log to before sleeping handling so that it logs
for sleep instructions aswell.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/microblaze/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 47637f152b..c1be76d4c8 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1231,6 +1231,8 @@ static void dec_br(DisasContext *dc)
     if (mbar == 2 && dc->imm == 4) {
         uint16_t mbar_imm = dc->rd;
 
+        LOG_DIS("mbar %d\n", mbar_imm);
+
         /* mbar IMM & 16 decodes to sleep.  */
         if (mbar_imm & 16) {
             TCGv_i32 tmp_hlt = tcg_const_i32(EXCP_HLT);
@@ -1248,7 +1250,6 @@ static void dec_br(DisasContext *dc)
             tcg_temp_free_i32(tmp_1);
             return;
         }
-        LOG_DIS("mbar %d\n", mbar_imm);
         /* Break the TB.  */
         dc->cpustate_changed = 1;
         return;
-- 
2.25.1

