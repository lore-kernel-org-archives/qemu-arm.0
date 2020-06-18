Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1271762lfm;
        Wed, 17 Jun 2020 21:48:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr1e/ups9wz9VoeepRese9cAmXa+yM/6KSDc601HFE+GU5fE57FVaTd/WsF7tuCJxMqkQG
X-Received: by 2002:a25:3851:: with SMTP id f78mr3660131yba.212.1592455680507;
        Wed, 17 Jun 2020 21:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455680; cv=none;
        d=google.com; s=arc-20160816;
        b=B+oNRRkeCVbTXFAPHKQ/NwydkL22T0m25XGhrblmhdXXPwlTuFTEdHHcDViDqI63G+
         VmXSMnK+sKO87lcvh+Rc/DhUuqH7ef7xFkNoXNK53pAd4tP0JdajMP6VdI8R+eJUZJi3
         uWLxl9jB3Dq7JtoseAPogD6ZB63G3oQv7Wt0qt+9Glrw4CXKELLjGc/H7qFnzZxQ3nPx
         3aS39hV2DKoTYzed7d0uMrDPx3n93FeHPleKF4jH75fzBzak4W9sJVJf12sw5qGBM9lb
         u+PyLpGYSx80VmFXf+Fw9bKaxhV6Dqr6bpejjep2pT3fzY8z5rFF7EM7EGtuIVyffK78
         Lx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NtZuo563GEEgh3r3rqbTdmgm0tBrXJmij7aOVi/8e+k=;
        b=DgVlpdlYVKhSpn9asSUzhdCNsK2e8qB2d1bpdfEzAXu3k3WmP9R6XxyNanRyDFcvgx
         5ql8upR6K0B/zoRSeaC74RuAtbEBjKog/NOBYgYRBQcAnDAOU87Wq7r3TERk4ada3diC
         rCUvD2oDMVgzf7cP2eW7Vb5zQ4NfPiM3gcs/zFQPeuDActVErE43aVINvOfd2JezeXAL
         96pZ/ns0JP4bCjwT1Vnb4J9KMqsTOkrXhEnmqNvMc4qKrhAB3Zp6/RYcf+7DQCiajeRp
         f7xtG0gAtVg3TdnM9UoLhJzVaKJqbQzkWkdXEXdKLeOJCI2GeWnqVZt7CYoKeJy5ZZIX
         /q4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z15sDeMV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 139si1542098ybn.306.2020.06.17.21.48.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:48:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z15sDeMV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmT1-0001HD-QJ
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmAq-0006VL-2p
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:12 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmAo-0002r2-CZ
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:11 -0400
Received: by mail-pl1-x62b.google.com with SMTP id k6so1901509pll.9
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NtZuo563GEEgh3r3rqbTdmgm0tBrXJmij7aOVi/8e+k=;
 b=z15sDeMV4nqal4zoyDFLzDS/IyrcC0UH8DHVZibhhhmvI1lBO65fQO/LpaQwOAWC/F
 zzg/nVzdjp/L0njsaQBHEv1cOjzcgGvXWO9H97fcMrZuttaqLkjVrT+aYQI0waDZBug4
 OXuHzrVJNyXlLY4HZo+DzvEe+v/yjRArVtvQaXvOiegO7KM3Vs9HstijjO6KJjk5JH00
 9nXmlMY1++dKvrsZsuOYQ/LQdRru9lcf8oGNt+U0U/kHDWGAEza67AT0BwQZVGz0LShN
 CTtse/OlOyLsdYc9doagHfC0gZJcOYSntkQm0fgWmMbPZxK8mxGfPk9VZ9BBgfgps24n
 fB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NtZuo563GEEgh3r3rqbTdmgm0tBrXJmij7aOVi/8e+k=;
 b=jt4jYxhzkJtOw4BsNTIv0UT0Lu9roV/1T/uiIBLDnUcUH8xPzqaaDzRpD3Lzz3P1iX
 PxTa9NL2fGaHOWIQ0+vNhc+YFcJy0+z2MonjomJEbKVIhPoAVoF6lIOnDbDc9m/J1ksW
 2lQ6/c2KpF9CuRStUCrhH+eLGGrAGEfTlYKuWK8FMj8f/Pfj3j84TjyLVjpoq0U6aiUh
 GTZZvRmCaiV1BCN/aJ4eHn9AoBW00a93ZIqK1JgliYv1ePPUdCZThluXnPHcfGndDhaO
 dtMMGMhfU2TQ9PO+DdPfGusdslhaO+bJKA3LwfpLSpZx7oe97l3mq/hgYJ+5bgXWFTNi
 Eopw==
X-Gm-Message-State: AOAM531M5gupQsOCODi++Pp/dSktO+g1cnuUI2zxnuj6uKjuk01RuLXv
 hQnOn+WPjs//iISgPVs4LHzjpg==
X-Received: by 2002:a17:90a:bf13:: with SMTP id
 c19mr2181320pjs.186.1592454549117; 
 Wed, 17 Jun 2020 21:29:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id mu17sm972324pjb.53.2020.06.17.21.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:29:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 038/100] target/arm: Implement SVE2 integer absolute
 difference and accumulate
Date: Wed, 17 Jun 2020 21:25:42 -0700
Message-Id: <20200618042644.1685561-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wOUQJU7KwUhD

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 21 +++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 90a9d6552a..b5450b1d4d 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1266,3 +1266,9 @@ URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
 
 SRI             01000101 .. 0 ..... 11110 0 ..... .....  @rd_rn_tszimm_shr
 SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
+
+## SVE2 integer absolute difference and accumulate
+
+# TODO: Use @rda and %reg_movprfx here.
+SABA            01000101 .. 0 ..... 11111 0 ..... .....  @rd_rn_rm
+UABA            01000101 .. 0 ..... 11111 1 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2bc20503e7..45b24826ac 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6004,3 +6004,24 @@ static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
 {
     return do_sve2_fn2i(s, a, gen_gvec_sli);
 }
+
+static bool do_sve2_fn_zzz(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
+
+static bool trans_SABA(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_fn_zzz(s, a, gen_gvec_saba);
+}
+
+static bool trans_UABA(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sve2_fn_zzz(s, a, gen_gvec_uaba);
+}
-- 
2.25.1

