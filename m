Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp198501ejt;
        Tue, 20 Jun 2023 04:08:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6VIZDkw5c1N2Iu2lqZQ1xfOpsQMKpv2+dKfFqHG0qduGKtR6tsKGYfeULlaoom4Jx19w5v
X-Received: by 2002:a05:620a:2b38:b0:762:3c85:d44c with SMTP id do56-20020a05620a2b3800b007623c85d44cmr11061665qkb.71.1687259333947;
        Tue, 20 Jun 2023 04:08:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259333; cv=none;
        d=google.com; s=arc-20160816;
        b=xKwwIMjy+6ShroxHpkKCxFZvo3JHRMyOHhBi6nIss1InXfFxH39e/qvoeMinIOvy40
         MMRz5XcDu78YECFmEptQJ2k9xchVPRpOjU1PV6q9k7J7xPL8evgg93DCWUA7l88Y4405
         f2VjJZA7GZER0vyTHWQI6Hx3fRXqjPXvQrATFK98jKFNjyTcaTRxQ88pDVGWzPLDkTpg
         1OCUJHRtj8Kxmh76KXL1RE6IiEqy9sfSyQt9M/lmyxj3JaQkqCxrooB8kmexYnOM2uwV
         aY0nstmT/EiZGEh2aN41WyXDNoPJ+aGZkL4FVO36jn6ShFQJD2z49POQgrqtSL5mA9y3
         WX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
        b=D7TpITqzm2kMjpPJKPXOEgYSxm/oiG9z8t/i8d4cWVVVfOkp+ZdXCdRKosPvql0rRY
         niDlvroLgWrQtjkNPavrDKirXnU6iVQG16jwlyF4VXegyyszBfJ7+RFbcai8V5hAsbw2
         L8kuU/w0Jo90bwdMP0MrDatLFoG7osnNiWz49jcQA6aHTe8LNdiQBmPSA2b42JGc9vUu
         1P30klWoMssEsXn021ujROZHImxu3lhV0z5bxizytvmvLmr3dVb1RmweAlGhO9HLh8o5
         WPiW0c2CFm5x/JPhfJO9HJXN5c0qrlr1KXDs52c2W5tmbUh1dBHy5v3giyg0ih1dFP0p
         d7og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aWp/iwox";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ox17-20020a05620a829100b0075cc05fcbb3si690903qkn.462.2023.06.20.04.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:08:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aWp/iwox";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBZDq-0006I0-HR; Tue, 20 Jun 2023 07:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDl-00069T-J5
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:25 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDj-0004L9-H7
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:25 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9883123260fso329999866b.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259302; x=1689851302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
 b=aWp/iwoxUbkQolVQKW6qGvPmtiWB/WaMvGJvQaoaJUJXr2aRSCbSXU/LPxwFV8lLTS
 /M5D3laZG6F95r6RJP7kHJ2jYlEBCxIKHLWS+Dl+cxq+ETau5ofZaeadoskTY7rT63mp
 OclFYSl6GK9j/JvgLaEN15/zR607mB6L+FIePPygL4P5kSG7rDAJEIsZ2ji/iDVlZuAm
 B+ZAm4fAPBB0ChlkMzsoTBQpRQ2lcrtTCfqX9boJADTspm6d0aiYkNGiOAOY+zNtFv8W
 ocPabNcOjMN5pCSJv4ROaMtI32+6HwZK/hTKH4y+pBNsT7UaNLywZIxBanBIQqz02sXx
 OBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259302; x=1689851302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
 b=RLf9hLCVhsihjgCoTPIs4DvWfNtbl1JbPHzeF/EvUgC6+SkUzmfB4RQBHHjyF94gvc
 tDFWeQtpNn3frhDFopxa1ztIcq4950tYPNBc1OiXg5WhX2U3Lp2C3RTU+lSpHoRw0HxI
 kolf+XZtPz5Bc9tSAlRf/lXa6lMGOL6uzLHWGrAnZ1QwMwx9fNw7ge2xLwof+bKvnhgk
 sLxqgW4d7wNGSy/4W/tAGcwoVYL74+DEk0qSCPNcTjFMvnmDZPzH2Xh+etb4fbpdzwy5
 //V9zDvMQSdJ9ABxtIabbavCdDnW6yQq1tC1XF4I7MGxLzW7RpVofvZXLe+nqf36Hbs4
 6Mxg==
X-Gm-Message-State: AC+VfDyNJzBKnhltjHZjNx2z3SxQDTvPLfDmnhu/lr3FEGwlrh3Rt/Uu
 b+GHNcT8bFgCuSrQgVeSxlEqbTEvxPh8HIEPmoSOOQvV
X-Received: by 2002:a17:906:f84d:b0:965:6a32:7de6 with SMTP id
 ks13-20020a170906f84d00b009656a327de6mr7917240ejb.30.1687259302192; 
 Tue, 20 Jun 2023 04:08:22 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 15/37] target/riscv: Use aesdec_ISB_ISR_AK
Date: Tue, 20 Jun 2023 13:07:36 +0200
Message-Id: <20230620110758.787479-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x632.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1St0fyhaofEQ

This implements the AES64DS instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index b072fed3e2..e61f7fe1e5 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -213,7 +213,12 @@ target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
 
 target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, false, false);
+    AESState t;
+
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesdec_ISB_ISR_AK(&t, &t, &aes_zero, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1

