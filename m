Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp754029lfb;
        Thu, 19 Nov 2020 14:03:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOPlWG9AE2A0YMviEWWYRFmF3SHzEyIWt5m8J49WYhDr3GZpVzWwlI1dSgD2esClAtcpfE
X-Received: by 2002:ab0:64cf:: with SMTP id j15mr11757136uaq.106.1605823399743;
        Thu, 19 Nov 2020 14:03:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823399; cv=none;
        d=google.com; s=arc-20160816;
        b=sLf9wbOQUG4LMguHjDkZq6ujmyxV65jic/ZkgXG3IokBv8UTPHNc6XqOeO3CBf7Oje
         isqck6u8mkADBiyd9twYCEdnf6sc9nKuS3BppPqZ7QFDkkgYavbGOQLzTosy9s81WzIe
         FDzF9d9eHeQMtRxuIsVKZb6duy6Mkvd08BxmzlaH8culqhg33ya6kd9RIpfSl5H95fLs
         7Q7G2/xQ9XS5Ss5yJLncg+7MVJnbvJoLoGBAa3J3LbRfVmhck3GS38kqSbwQAsVkBG8f
         W9riNV5Ve1EHCj8z92eyR9S9qaOqIe/mtJJjmpH7oZ2RuiNER3rqYor0uCqx4OtQJlhS
         KYKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pBBk6mf/A2FWnkWRPu0U5rVmHOGw6pK6O+R7FycG+J4=;
        b=PJeQaXIcW4kBueiBWM6PR9xLJ1HFs72wEsT8YqvncpT+nTLwr6dYe5vCDb9GTGVf3d
         ASH8bSVy1LEhoj0IOrbjMTfAbds/ygrcONvw5lVzf7kHP/dHxtPQs53YXqMSLEwMGydQ
         0hIq/HqqcepMaG7me4FmmCCuwZMVOpAp4nzWtmxhzznjM2IlM29WKnShUdcj+Ld7zrQW
         KL9sYYWeNn/Gq9pWvekVjK1tTzUPfQ/MsH46QN4Y6C5lIzP8R5pRSKB6+lt8G3g4H1Sf
         q/KnZhKUbmFLD0gSCt1A28gBdXwcb7StON6/sIwRvSKGbrHizBgUM+gHtBeHuwHAuinD
         NtFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uKudqnU4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8si311754ual.193.2020.11.19.14.03.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:03:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uKudqnU4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs1P-00087S-1A
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrur-0000it-3D
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:33 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:35209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrup-0004Am-5O
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:32 -0500
Received: by mail-wm1-x341.google.com with SMTP id w24so8079741wmi.0
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pBBk6mf/A2FWnkWRPu0U5rVmHOGw6pK6O+R7FycG+J4=;
 b=uKudqnU42FlYuQmcmnn0JAepZ84v+zOrFmL2CBY+tmVuapBpFyIwl1Zw0CMnih7qAv
 vgmugTgYALwSDZeTBsw5D6PWNDB/R6lhkdO6nLyspdfyEA5WlGYWau0GDTYnfapF0pBC
 JVn2eUxAqpW0wQC9KVCj7MPkr5d0/nt6HuSatSMMaeN+eJkuL169r7Dxo2KUrcxvsJ0+
 x6w3IICBzpB9z2ORWei9kgoEieawgfLYzmylNvwUGcfTTwBJW6afLOqWQnxDDPD+IMN/
 N78Y5rRfnpZ1XgEMBfgSWfAfwRsFjOUdo0qx+16kkq+h8Y4Jk0JFp2UbpVKv4rv4feEB
 leHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pBBk6mf/A2FWnkWRPu0U5rVmHOGw6pK6O+R7FycG+J4=;
 b=fVikNhA4aeAgNchIgQY65+BiR1tbq4wWg6gDKg/ttp5l8d9hDrS531B4icLbxSAbYf
 jUoGaen3Lk+N1NJHTPa1sttT3OEPk81ol4aExwlccvnVxgnFkgc5F/r1yArtKFdB9p6h
 OmgwpWk4OlLF9CY6GsfMQ5FBXVrQoU1TSRulfl2/+C75wwO8IB0drTo8cQI9KnCqVAYQ
 kU9xqQLwhHKcmrVFkrVJG0u0GfOqu8bGlCqg9nPm43wC+C/3vcYazaZevWEo0e1aO5JQ
 U1BYEuhflnJ8isO+xoSTHnVg++f5FA/UOsRHn0odDCcIhxNxBC5ce0sNTmxaUf0QYPFs
 +wtg==
X-Gm-Message-State: AOAM532wdfbQq2KELZ8OcSSiM6bh9SN4V2ANpNMVFBdzhwp1bvXtdvWL
 iDwdY1v7G8pzwqnHZecm3pd6FQ==
X-Received: by 2002:a7b:c11a:: with SMTP id w26mr6886742wmi.78.1605822989504; 
 Thu, 19 Nov 2020 13:56:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/28] target/arm: Move general-use constant expanders up
 in translate.c
Date: Thu, 19 Nov 2020 21:55:57 +0000
Message-Id: <20201119215617.29887-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oak3HOMJB1lH

The constant-expander functions like negate, plus_2, etc, are
generally useful; move them up in translate.c so we can use them in
the VFP/Neon decoders as well as in the A32/T32/T16 decoders.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 46 +++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 47a1a5739c8..f5acd32e76a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -109,6 +109,30 @@ static void arm_gen_condlabel(DisasContext *s)
     }
 }
 
+/*
+ * Constant expanders for the decoders.
+ */
+
+static int negate(DisasContext *s, int x)
+{
+    return -x;
+}
+
+static int plus_2(DisasContext *s, int x)
+{
+    return x + 2;
+}
+
+static int times_2(DisasContext *s, int x)
+{
+    return x * 2;
+}
+
+static int times_4(DisasContext *s, int x)
+{
+    return x * 4;
+}
+
 /* Flags for the disas_set_da_iss info argument:
  * lower bits hold the Rt register number, higher bits are flags.
  */
@@ -5177,29 +5201,9 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
 
 
 /*
- * Constant expanders for the decoders.
+ * Constant expanders used by T16/T32 decode
  */
 
-static int negate(DisasContext *s, int x)
-{
-    return -x;
-}
-
-static int plus_2(DisasContext *s, int x)
-{
-    return x + 2;
-}
-
-static int times_2(DisasContext *s, int x)
-{
-    return x * 2;
-}
-
-static int times_4(DisasContext *s, int x)
-{
-    return x * 4;
-}
-
 /* Return only the rotation part of T32ExpandImm.  */
 static int t32_expandimm_rot(DisasContext *s, int x)
 {
-- 
2.20.1

