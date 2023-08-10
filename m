Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp366264ejc;
        Wed, 9 Aug 2023 19:37:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuZ0JXiR/66nk+SVGktC87qSOxz8Ugk7IlynA7b3iyC5wHO+53UOCxWnTDtn+umfiv1WDl
X-Received: by 2002:a05:622a:248:b0:40f:e946:a3d6 with SMTP id c8-20020a05622a024800b0040fe946a3d6mr1685591qtx.31.1691635027515;
        Wed, 09 Aug 2023 19:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691635027; cv=none;
        d=google.com; s=arc-20160816;
        b=cvvry06UuoCXFKNGARSLfKgagsvxEQww5V6FcwmzFODgdWsAcCKJmTJjDJOQePSSxR
         EK4ivcPws9lclWXvNBP4dxnJ+72WcmyXXLuP43f5781Z1LH/784c8W5WEPe6v2REHFcz
         r4cVBR0wofgHgheszgbXt6ulLdR6LGtgKJ5mZcWeNJQfX4nljF313Nb6Rui7IHQqdP3s
         BvVzBjWQgUWa3QFLhqQkcDyDKlvfvNkkjDkvQd+TBPNqeMFM08RlTLX4p3MqSHnuSB2c
         Y76QuOJNK429w6u5ud7Kyxji+z0NqNK8Vv+v9aClT8mRhAZy46qpg8O2vkghmev98jI0
         IL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UIUuncYK5LuF874bLlgv9Sndabs4GqkeEig1nWblAF4=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=O/00JRNcizJvdCopObsCsc8dMSdgjjIOP4w2+I6rM5ccYeU+bsd6xFh6RJE+2Y0762
         cbFHPcj2axdhfC+1+bPfiPGGGPYmpdhXuGD/AU2dCUMhjwFDi42g/VhY0iBPvdL7JKED
         AAD8P0yVaXAmeMn+SiC4jTwObyVzf0aFQRQYmd+TOdz2WHLYRnNqoY2i9/7+bYJmjF15
         hSPTLlQo4AZ61b1u9DcgsAxpSXr5KWUgeNB25yvNqOkG67WM3Us2reG8PG788zAHKJrg
         LTroEHQzWMAKhvQlI6qGOR3bNW8a55nBsJPbWVNeb3U0B28MlFMRM+f1OAxO3VMJfCOo
         KZ1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J14rMj2a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a05622a198700b00403b4cd7311si327021qtc.236.2023.08.09.19.37.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Aug 2023 19:37:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J14rMj2a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTvWr-00011O-Kd; Wed, 09 Aug 2023 22:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTvWl-0000w0-55
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 22:35:55 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTvWj-0004xP-H7
 for qemu-arm@nongnu.org; Wed, 09 Aug 2023 22:35:54 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-686f090310dso384577b3a.0
 for <qemu-arm@nongnu.org>; Wed, 09 Aug 2023 19:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691634952; x=1692239752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UIUuncYK5LuF874bLlgv9Sndabs4GqkeEig1nWblAF4=;
 b=J14rMj2aacj5EX9ezHdfTZFOQTc/yhy+QR3vqDVS+RdKti+m6kXabo1mjwCdIYysEq
 USjXsFOrRhtjwnD6dpZV2zQ8PFEPdgA8g+WZa92hxeXeHrl1j1HLW6oBIJ69a9Y/CpHy
 H9YHx8OevAaKxQHWcaRLAIePumywdmXHd/bfP6XkM/NHlj3TDlQV3KhapA5KgNjpvNpW
 jD2fXlXoTXppb6dN94vlYjioEuClCbZI/0ChNZ8NMFWqo91GCR2uTzlmx2BQB/qZNr3D
 0x6qwhbS+PfxXzcSNkKAiQfal5ptWj+AUxQqlsg5ef+OSZrmNhWp6XPzMh0BQt3x4hs5
 7CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691634952; x=1692239752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UIUuncYK5LuF874bLlgv9Sndabs4GqkeEig1nWblAF4=;
 b=PgkBxRuFdQU4yxWpZnbPIm5CIIMlOzLeNDYc7+h1wjmw29kz+8UAf77AdnVGasCK/G
 fSXuS1tYoplcIcOUaGF6Q0UkRv5/wfQFmvnmxHgljesoIeeSP0/4iiFurXdf8qOfzwSJ
 Q+mrvOC+zSTV0t4pQWhDxLb+QoYUF11HDXOR8AbX6pDDFdIgosjjjQXK6MsSGerE/u3i
 7btkG45ONb9Mk29kIQ5kdfTr74dVvcrdAcMJy7hgMQ1P+eVtEaP8AGY61icSWeopVXQZ
 Ct8svPhyptLTpzqQ+1vKS+t8svPcFxrGxhEusull7RODwDbtYNafYngdWnbQVoe7FKmo
 khYQ==
X-Gm-Message-State: AOJu0Yyl3eLNkDkB7v+GXvfmlLCtkOh+drAB4w1lWhNep1llCN0w8aj2
 QhVTTMBK3Uz/XRU2+C8+hbDEho0rMxq3C/jFkf4=
X-Received: by 2002:a05:6a00:14c8:b0:687:5c3f:d834 with SMTP id
 w8-20020a056a0014c800b006875c3fd834mr1585369pfu.11.1691634951983; 
 Wed, 09 Aug 2023 19:35:51 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:6bf0:9674:6ac4:f74c])
 by smtp.gmail.com with ESMTPSA id
 z7-20020aa791c7000000b0066ebaeb149dsm287283pfa.88.2023.08.09.19.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Aug 2023 19:35:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/5] target/arm: Reduce dcz_blocksize to uint8_t
Date: Wed,  9 Aug 2023 19:35:45 -0700
Message-Id: <20230810023548.412310-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810023548.412310-1-richard.henderson@linaro.org>
References: <20230810023548.412310-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-TUID: Jc5ceJ4dST4y

This value is only 4 bits wide.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 88e5accda6..7fedbb34ba 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1074,7 +1074,8 @@ struct ArchCPU {
     bool prop_lpa2;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
-    uint32_t dcz_blocksize;
+    uint8_t dcz_blocksize;
+
     uint64_t rvbar_prop; /* Property/input signals.  */
 
     /* Configurable aspects of GIC cpu interface (which is part of the CPU) */
-- 
2.34.1

