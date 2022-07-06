Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4571554lft;
        Wed, 6 Jul 2022 02:33:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1umPz0U9Bq/W5CE03REy3iL2rH2IM2ib5p3C9UjJ29JWnPCzX+7CeCAH1w+w0XI6icwVV8w
X-Received: by 2002:a25:aea4:0:b0:66e:3abd:1abf with SMTP id b36-20020a25aea4000000b0066e3abd1abfmr18714752ybj.512.1657100029000;
        Wed, 06 Jul 2022 02:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657100028; cv=none;
        d=google.com; s=arc-20160816;
        b=UMHspB6X/3RdQcuo5l1TMbytnGQVdhwc6hCVUm0K7WWaxW1OyCTEXLGdvbnuGKoxGZ
         1YuXoFquNmXt7YhArbxeiCZq6cFSV23n9aAfEBz/f4e+NYinHf0UlUcAmebidGIgLg7k
         uRKjJ46SnQiWnzowCS1h+R7Wu4t9GOw9yk7iezIVjTxa/OStQwr6bbsGrLZIRxfqf8Aq
         UFHzDB0mAUdbTFkFTXFzh6i6U6qxmRy2k+sxgWbIsEnRYRqxdTm0Dao59yXSPLcYaj1s
         y51Al1iHC1OW1I5So4PQ/jFm5FgLEGiRY+QrnijXjD6Qunw6reOzSRgtZ4veLznB2yWn
         dEiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
        b=OhSby92Y3Ed0oNERTPo8JQ+w+rV8zeZ5188TwzLh/Bd1dHXTFHzoulmQRAq8vSmhUb
         usiCJT7UikjbRp2iUT/6MztWXQ5TfnZZc8hS+E+A2E7C4w1LqRVg5vB6GVrLVisP0C1Q
         U6LDH+m9eZrZKCfUHBVi4aVSINpni9/4J9Z1DPZmJHcRdozB4jXfY2uwaQl10kYIjiX+
         MTZ1lsEs7ZVt1kBy4pfJZ7l8+EZZomDR1IwbcuTDQUEPsHOfMuaj4W0wcYE62jr7G4zV
         sm3ebCbri0HtVZvJdMK/nGPCfiI2dhjj/N/kibWy98pjpmjQXlwRHYd37KVeooUzuTrZ
         iViw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=klMKO6mv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f64-20020a256a43000000b0066d88250f2asi28455409ybc.416.2022.07.06.02.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=klMKO6mv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o91Po-0006NK-3O
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90MB-0006zc-4f
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:26:01 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M9-0000oT-La
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:58 -0400
Received: by mail-pf1-x433.google.com with SMTP id t3so573424pfq.10
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
 b=klMKO6mvB3KdNJ0CCt4yxZTPLq0lPCN2Mn+ZuwEecFjZv+4BrrjeQx98hWownEMZl0
 TI17Nco3UKMsf673XD9TapV91k00+foSpg5nuCeZ0n/c7O0BI+Ba92NLH2+bQfU4n/GH
 uipRtBKN1xyBAYCSTwKmjdbbZDtAWjeFL7qF2MXt1IGNcdGeLhzPT3s6zv1/vlpiszOH
 SZB+0nFSc/moyUHPKDo2M2z+i6KVFXLhBBma8+g4rvIAAek16ZAJalIDGoVyfRlv0NH0
 aTIkO9XnrSdanPjRqf89LwI+/3QGMrTAGrH8QGcDBY/WKbmfS6jXCE7LVdNEgk6nNz6l
 YSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
 b=jQeQUTp1olRMOxDzDMBM8uhxokuv7kkTIDyPVR50zmAKd7vjBvWivhqjUNmplZ1ClL
 oUp0w/T3ku/qoAt1wkjysE/zoN8H7GyWNB/9EPR+tVSGDQUNgMn85xXabS/gv5OBu1Gb
 t/Fd66mrBljNHFx/Rdc4vHvyOPwEoW4wWNx8aliMXB7C3T8K1ZoF0dX6ZbemNFozTtRN
 e32dRyAhz15yKnBCOMrnsvMxokHxLRWtkuQxh88s9iKeauTmZv+MlRaqBvvFXo+wF6s6
 kDsbOjAAd/aA6K5QFC+hCX9YsfmthcSmQsIqnOdqD8ViEKSb/8QPpRvALpu0uos6ulVX
 4UjA==
X-Gm-Message-State: AJIora9CVe+UnVt8F6zDLS/ftH5HXTxnZntpvhW/0Wq1SEywqw/SHlKT
 mFcvIpJGePjsVV3MiUmbu/V+gwfbk1dpWTvk
X-Received: by 2002:a05:6a00:179c:b0:525:6823:2972 with SMTP id
 s28-20020a056a00179c00b0052568232972mr46256451pfg.60.1657095956404; 
 Wed, 06 Jul 2022 01:25:56 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 37/45] linux-user/aarch64: Do not allow duplicate or short
 sve records
Date: Wed,  6 Jul 2022 13:54:03 +0530
Message-Id: <20220706082411.1664825-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gTSIt+1jjEBo

In parse_user_sigframe, the kernel rejects duplicate sve records,
or records that are smaller than the header.  We were silently
allowing these cases to pass, dropping the record.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8b352abb97..8fbe98d72f 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -318,10 +318,13 @@ static int target_restore_sigframe(CPUARMState *env,
             break;
 
         case TARGET_SVE_MAGIC:
+            if (sve || size < sizeof(struct target_sve_context)) {
+                goto err;
+            }
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
                 vq = sve_vq(env);
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (!sve && size == sve_size) {
+                if (size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
                     break;
                 }
-- 
2.34.1

