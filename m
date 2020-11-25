Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp154871lfb;
        Tue, 24 Nov 2020 20:09:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNbVS8rWnngMx38V16OgxCzcdi2aK59N80BMxZHk6R0ci5/Q5JCVDWYca+v1EnMrKi0bDn
X-Received: by 2002:a25:b9c4:: with SMTP id y4mr2175387ybj.357.1606277377128;
        Tue, 24 Nov 2020 20:09:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606277377; cv=none;
        d=google.com; s=arc-20160816;
        b=twydXTQNLM4qy8juDA6ump4dI1idct4+9jvnOD3CFnnmWBrAx1N4pPEQZ7nQlWbGKR
         NHgqo9ljb3yCKjwAOUT5enZReipXWUEsbsTn5obMksfgCTKCUicWCmba34BXPzwsb0tv
         DRXnlo02MnLjnAVubk2T/IUiiL1nCQ8pA+SRVq2M8KDzrd2SuGYdI/398e+EXafNZHoL
         o8B3jMG+HocEDbP2SrQ80UVctVKLEY2cRPoXK062OBr50C4ETF3OmCh88nLOHF8shzCw
         uRLiLgojjTEbzdPEUHlVj143+VRy2kxssNM7eGgD3LJcnZplez+JKlo0L9gOp3x5jlCv
         MqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dUvIZnJazJaOEZboAW1OJSDBnVf8XIUz/RaJk/SSM4M=;
        b=cy+KHPK06EPIVWxbUR+ZSru59gf3qjN8z4sPpDC1DyJTIwPzmYZwbF6N89ZNn6A54d
         giQ5unKtyn1zFJaf4NVNFoVUls6rqH+gb7jVxeaAxqSCdkiBPbydIpnN6NgjJUPOwi5P
         cMYkayTJzXjg7fKcTQadbU4bShEQxXsA9MJvcSzCskyvFD6P8VPmncO2/L5czXsGeqM1
         F9xU2ZpOkp7UwL98AQM2YqZaKY60TS0MOYQ1WeS08pRsun+0q0+PBVMM74Hgm6vu2rR5
         ABKAHBzm4+HzopvLICd49nia9p/kFG8YIajZ/loUxpLJ3C3dBteFF44VQ0Gj0KBjg6nR
         NWFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gKo6nG+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11si1089044ybj.181.2020.11.24.20.09.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 20:09:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gKo6nG+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khm7c-0000DV-Fu
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 23:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4w-0004g8-M9
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:50 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:32826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4v-00061c-0v
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:50 -0500
Received: by mail-pl1-x644.google.com with SMTP id t18so465476plo.0
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2020 20:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dUvIZnJazJaOEZboAW1OJSDBnVf8XIUz/RaJk/SSM4M=;
 b=gKo6nG+2jXZE3ogTrnzyGe3McgptHnSF8F6CBBoMM2Q1cJxRZP3ua3mgjowIt5vE0k
 6/P+GHygWDH8cuUMEizCIhUO+NAGIEdLWg5j9m3fZE+8DXpLtvMpTRnqTOOvZj5F/5du
 kY6L/SlyQUevSvHLir/mAQSfl8ImPXj+jQ9EYnBVWKgyX5HDxj9MQp2hUoZ7ILfFNS1C
 vg2y0LoVj5dEC9I/fp3r0wh6Ts48kwG0FOu4ocODVVPAqYVXiLdcndY5i5Nf6uUgZ6zu
 z6o2nnk17tpk61aCnII1ZMBu11tYs9VM9ePmcRs2xRYPM+grCB1wB/dhLDmEP3b2HZ02
 hFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dUvIZnJazJaOEZboAW1OJSDBnVf8XIUz/RaJk/SSM4M=;
 b=jPtzdmwGHqN0S7DaIBwonY5iSh7I45AHvCxPvzWVTeScIX7sX8dMnrZtH7eWLEKbKy
 /uxVrDgbw7ueq2ynkNLtJaeWMyq0N3Ix1vBFXPCiwY3vkve7SU2mT4allBLyMfn/P5W5
 CblL1QQqTddTK6ip4DLNTAYF1TzBYlMLmLMWIfT27B0bvOEO+R5Ql2AxkRWfkyrnOLk9
 XZnOO0CC6YB0JROBLboH1OIeCAe5273GkTGHvPfxzq4Q4xsjGsExzksU08R3RNvICWgZ
 coUJEcXDPcDAZPrvInQlt0P0OhQT2PE//xg/TU8I27CG1KarJBCfv0ZHUtBrVrv22NWX
 OHKA==
X-Gm-Message-State: AOAM532U2JxKILTjurSOOK4Y+O5XoYGxfPJeB99I7TEAg4/zXUplXy44
 b8Yc/FivYi8LAIiyrHwxJQ0QUw==
X-Received: by 2002:a17:902:9a8e:b029:d8:d989:4f80 with SMTP id
 w14-20020a1709029a8eb02900d8d9894f80mr1514185plp.32.1606277207801; 
 Tue, 24 Nov 2020 20:06:47 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] target/arm: Enforce alignment for LDA/LDAH/STL/STLH
Date: Tue, 24 Nov 2020 20:06:33 -0800
Message-Id: <20201125040642.2339476-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j0+KWrn9n7yW

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 17883d00f4..73b3d8cbbf 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6876,7 +6876,7 @@ static bool op_stl(DisasContext *s, arg_STL *a, MemOp mop)
 
 static bool trans_STL(DisasContext *s, arg_STL *a)
 {
-    return op_stl(s, a, MO_UL);
+    return op_stl(s, a, MO_UL | MO_ALIGN);
 }
 
 static bool trans_STLB(DisasContext *s, arg_STL *a)
@@ -6886,7 +6886,7 @@ static bool trans_STLB(DisasContext *s, arg_STL *a)
 
 static bool trans_STLH(DisasContext *s, arg_STL *a)
 {
-    return op_stl(s, a, MO_UW);
+    return op_stl(s, a, MO_UW | MO_ALIGN);
 }
 
 static bool op_ldrex(DisasContext *s, arg_LDREX *a, MemOp mop, bool acq)
@@ -7033,7 +7033,7 @@ static bool op_lda(DisasContext *s, arg_LDA *a, MemOp mop)
 
 static bool trans_LDA(DisasContext *s, arg_LDA *a)
 {
-    return op_lda(s, a, MO_UL);
+    return op_lda(s, a, MO_UL | MO_ALIGN);
 }
 
 static bool trans_LDAB(DisasContext *s, arg_LDA *a)
@@ -7043,7 +7043,7 @@ static bool trans_LDAB(DisasContext *s, arg_LDA *a)
 
 static bool trans_LDAH(DisasContext *s, arg_LDA *a)
 {
-    return op_lda(s, a, MO_UW);
+    return op_lda(s, a, MO_UW | MO_ALIGN);
 }
 
 /*
-- 
2.25.1

