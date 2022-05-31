Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3283680lfh;
        Tue, 31 May 2022 01:13:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymtD2QiAeO7dOOdohIS+ZtPwB8UaODr3GbbskmifpksNUWz6sVNc51g8Wzhqjr5SglXbCq
X-Received: by 2002:a05:6214:2b07:b0:432:f7e6:e443 with SMTP id jx7-20020a0562142b0700b00432f7e6e443mr48267728qvb.125.1653984786632;
        Tue, 31 May 2022 01:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653984786; cv=none;
        d=google.com; s=arc-20160816;
        b=ww7Jym378D+3FAF1mwL/+Yjtg2WxRC8o/lDJD4/O4yrwkBaPM6jGFMusN1iRyKwlEg
         lZmi++Mt0ZnPmp8O4mNJo/w7VxYshBuwa0719uetQT2+3CMomFu8FJFDC6LN5UjZ3akR
         RzT1/kdHygKtGztqyukw4go4K8ckQB5a7XaD7CxWB7zhYUy5ll/3l4hUAAe6o6baWdlI
         0Myn91Pu+JC9twRdrP4N+aHLMvv1ddRpaPjtxJ+1Oe+NoU+uES3Ulq6t6e8ZxLhZBtri
         G7vDUF35D9F+th62hbyQs4ve5YCx3RtXbs5OC789MAZvQXUQSHutlsT7CDRbQOM83zNv
         7ZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=FCF6KghIDt9EGw/B8pqxiXLLOoIe30Ih2/8Txn0PfA4=;
        b=KiFQjIzmC28zc/9Dq7beM4BcC7/7wBWMTGTbt/F5n8FJ68fp2zzM/IehJCrZspxkhH
         4lVv/Hh5e717vEVc4tcXCl8U3jDh6DUYOkotyCqZLk5VpA52Gr+C1rnJ6IH5lOIpgVxx
         9uBfTtH/zYl+YQ3Oq37nemigzoMlifyUzJ8+CayfSM1ypuepqOGKiOsBBgAhnP8UeX6U
         U8vlcaLyNejc3E4GR9YFd3N8qDAxnTN4ySu+bEBtr4dGr6gf1f5YOFi/G4N91SbX9136
         Y7BR/nv/un0LXAQoXSQh7vjnWyN8t/JrrEZHpJ9AlkQWP14UNJi7QUGB67SZ4IcLs/6a
         DjFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=o20G3jEU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020a05620a40c500b006a5b0b8f240si9954308qko.488.2022.05.31.01.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 01:13:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=o20G3jEU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nvwzx-00014y-5N
	for alex.bennee@linaro.org; Tue, 31 May 2022 04:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linmq006@gmail.com>)
 id 1nvwwd-0007C0-3M; Tue, 31 May 2022 04:09:39 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <linmq006@gmail.com>)
 id 1nvwwX-00042L-K0; Tue, 31 May 2022 04:09:38 -0400
Received: by mail-pl1-x62d.google.com with SMTP id b5so12169091plx.10;
 Tue, 31 May 2022 01:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FCF6KghIDt9EGw/B8pqxiXLLOoIe30Ih2/8Txn0PfA4=;
 b=o20G3jEULT3SsjLuEbIIKsTVANMlm0qhUvgm58Zq6up40UQ73wrPy+W+saIYbQfEQT
 OSn6BdPyJK1vbyYplZGnuuCNTbYFrF+hxH0UI4w2hom7CpjdkdDP9h+sAnGRJWjpGdiw
 KEfZQB36Lz2mNKQNCvO5qhIO3ciYhh9vttbGG1BvYCdDTJaY74YvIYhhUqWow4yVRa0E
 V6K4pKO4bf6ivsHPgqHYBJVIkg7DJm7gDBjVHkP3DG6i2S55Td+WpFV1tUcw6whAcmYr
 ASLNMQ06xnCPKwgP6qUrBBHnULU29Inf7iAtHTc07nFCbZlRz+k4+P2cXRUIOlzmz6UV
 ilzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FCF6KghIDt9EGw/B8pqxiXLLOoIe30Ih2/8Txn0PfA4=;
 b=mNC2OdJ4xfnBnzhaiCCQk4rldil7yaKkwfugKitZeOxA6C3PS40xto9RBONPYs9qpb
 TQ2SsoWoY9FN13DwSDid2B6BPmEIDzlYO3USZahIiQOZqOR6MRG2treaJacJJD5eBcLD
 0sfSJXVDTQLtJXpYxAMoa+kpetixGSFGIyFsZAUgEjFiUU+F4JPZpLJsv3lVWJ96WPda
 21Oz5x60b2kRI8SdjjD1oU8taClBl0MV4/LnxjrQYUS+H7R9j0wWuEOBtcNvpyJJxH9k
 8JPoxmUICk6vCR3PVYN2vV3ViydevZnGCcrQxyQOVx3nSFLRoypmYbC67UsfPndmKKPm
 Ksig==
X-Gm-Message-State: AOAM5306d61UW1zJXY+H0Bv+zd1iVlXSVtJPCqW7K3+AC+/r2UNiQ8fC
 RWRGSH177yM/ArALHYr1Gz8=
X-Received: by 2002:a17:902:f34c:b0:163:fa4f:2ff5 with SMTP id
 q12-20020a170902f34c00b00163fa4f2ff5mr4365633ple.174.1653984570653; 
 Tue, 31 May 2022 01:09:30 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 e1-20020aa798c1000000b0050dc76281b8sm10423926pfm.146.2022.05.31.01.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 01:09:30 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: linmq006@gmail.com
Subject: [PATCH] qtest/npcm7xx_pwm-test: Fix memory leak in mft_qom_set
Date: Tue, 31 May 2022 12:09:21 +0400
Message-Id: <20220531080921.4704-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=linmq006@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 57fkDifzjSzI

g_strdup_printf() allocated memory for path, we should free it with
g_free() when no longer needed.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 tests/qtest/npcm7xx_pwm-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index c4a5fdcacd79..e320a625c4b6 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -268,6 +268,9 @@ static void mft_qom_set(QTestState *qts, int index, const char *name,
             path, name, value);
     /* The qom set message returns successfully. */
     g_assert_true(qdict_haskey(response, "return"));
+
+    qobject_unref(response);
+    g_free(path);
 }
 
 static uint32_t get_pll(uint32_t con)
-- 
2.25.1

