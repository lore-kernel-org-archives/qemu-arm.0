Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4193934njb;
        Wed, 11 Dec 2024 08:37:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXsNtrAFA8LXYQs6isJ4IDV97J3uOpHTawQT+j8YbsIFYNOf5S5IXepaLJl2Tqy5R7Kq2xRD23L0X7Oww==@linaro.org
X-Google-Smtp-Source: AGHT+IHAlCoD+hfIYSl65Lks2mPyybcBA+AdKmCGBMhQeebJliIChDB5yt7hBeOaTRyf7eiVXeoU
X-Received: by 2002:a05:6214:2685:b0:6d4:257a:8e with SMTP id 6a1803df08f44-6d9348d32e6mr63610356d6.4.1733935078317;
        Wed, 11 Dec 2024 08:37:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935078; cv=none;
        d=google.com; s=arc-20240605;
        b=lka2pwfI8XGdV1q5ZASiUXYJ74AxGSqwsXmr/0eXVNYbNvxg4ZjUwUIhR8Ry03xzRL
         PQA/XX9TA+2ZtUuwXZ0Lmz4e7obMfc/brWKUVendBl71t3cBHZaEoa1YBAJ0IHLNp8eP
         Th9Fc/0mCphC78tLWokTSjRVaePYfLrQSfHnXMtQiwFO8pXogsofkBRXlbBD6PaMwvZF
         OiWK7/QB0zzCWeGkME1Dq78kHYbzYXB4VPZXeBgGIQHJGPnOLcAXwuimtwBF/SiHis1N
         2Rw99w+MCFqLGSGsUmwXwstY5v6VnQ3GxtIDGRlhInL20jjOy7LhavZvsIGI4jgIGPBA
         lxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5H3jwXfSbdwnrjmx1RnKwqYLaWQdsoJQozLgKgKkG/o=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=h1AJ8mbxwhOdwcmaObJJRtvO7scilOvxZRg/n7vncYaHiJg0tfeVOq1StGDWzywyDZ
         kuHAvYjjNgF9Wp0I3+XHp5o071dBtnSmeeC+1ncsEilPkFFJFEFiUok2W4QTkes3CfID
         7M05RNIfQs+grRG3Nk5XrTUvojWegLSHPXdMTiXIP6R6YCeSpfTYSfxD1dTHftwLAaTv
         o3TCjhEfaMCsh76SxXWgPe69qGTd6t11krQo98rddz8bI6WjafV6Ext7BNSjC5PPiQOU
         2KxvLls4VmrDINfSH/akT0Swr26vGK5nhjED4JHO2rvHU4prSB6ODX7/53g4Lf0j2ig4
         kRiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HyHBxhX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d91e108060si60125166d6.253.2024.12.11.08.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:37:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HyHBxhX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPhf-0000yR-C1; Wed, 11 Dec 2024 11:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhT-0000RX-Lu
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:35 -0500
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPhR-0002E0-T5
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:36:35 -0500
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7b6c36490e5so346430685a.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934993; x=1734539793; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5H3jwXfSbdwnrjmx1RnKwqYLaWQdsoJQozLgKgKkG/o=;
 b=HyHBxhX3wQISuGjFraVHytqOY524Bvyy5nXUh0RQiGONhNcdk9i0gb3tfpz+SlWRDb
 p6AaAQj3OfPEuovCLaGUOg1urvJGzLM8nQUNRpoiQl4VEzdtl0DljxnJ7M7KAWR2NkuO
 1KCNOoyYm9IXQV6NsAnKVw+3I3tTeaK6uhqRJq/NeAmcjqmWmnphjBo88KXq6BdN5NdO
 d5kg4sSg3Q/YM9ZnPON9AOR+tqZugPIPJYSOFLxtzN8rzER3r9rnExTTcCaPZKvrKSCE
 bOSPARwXjL42kpXakeOABgLKHjEZhHi0mm944GTTli7Qf+86gusBUjsG0n9H2PkRn0Fb
 h6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934993; x=1734539793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5H3jwXfSbdwnrjmx1RnKwqYLaWQdsoJQozLgKgKkG/o=;
 b=KyzDJxb2F6vhB9OyD/nMzh/Y6KaW8FG5sxa13TVDHmYuNiEKVabV6fJDx+15RmOdMQ
 tiq7e9FfAYSUkGTtJwJjvmtMXYQEPIA/wVbbzvVz6lCFNoSVSaTQov6pMIIr31tDNN21
 iBJ12i14Uw5a7u30R3sXmWgZeeAys16KS+1rveECo8DB8oZEQr6ZV/eYHDgG7Ar7bu5d
 sm1u5j4bUZHfWNki/ab1UtWdvUJqH4sWq3VGLRaoQfn4o/cg7d8EWZKpRNrU/aZaVaww
 TNd6Va1sQHaRMdCaFUVf1yUNKG+r9vEN032lpUT//0O0rIAwOUBUqs3PtyCnsVEoV5Kp
 XfxQ==
X-Gm-Message-State: AOJu0YzdGQwrUbHGuxIx5vfwYd3QPacOz3QwnMCHszrJpQfgMxmM6RkO
 Rpo4uhNy9tR1QXtsA/P9y6LFbyDOuWq/iYXrMOrPMIRu3d9DWLhDHArjyLk8cS4=
X-Gm-Gg: ASbGncuYB+to0+OQv4d0tYPgP/Ho0YScS/a7vh+uzRq8jQoP8uSFgj7vmZMQfowNfBM
 lt7LLGVgCQCL/J2XGDRM5ZyfpNWullGxjmRZsCDY+E//r4uKS+ZmckSq8DGAWN1fYlTTf2btLJG
 lr2dAkSruhK5bYuhRshqkJYyyjqj2RZEOkqcJHT7IGpcs6eRV+tXVd9O0wr8pypULSMfuC3lYgm
 W7GIpkR1w2XWsq1UeMJjIaDNSs9ARbIN981P7O2LvYoB+NbhI7C8PGA18XlFA==
X-Received: by 2002:a05:6214:d87:b0:6d8:7d6b:cb78 with SMTP id
 6a1803df08f44-6d934ba8d99mr66207276d6.47.1733934992912; 
 Wed, 11 Dec 2024 08:36:32 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8da675214sm71856276d6.11.2024.12.11.08.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:36:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 53/69] target/arm: Implement gen_gvec_fabs, gen_gvec_fneg
Date: Wed, 11 Dec 2024 10:30:20 -0600
Message-ID: <20241211163036.2297116-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
X-TUID: lOcb9alFxAVu

Move the current implementation out of translate-neon.c,
and extend to handle all element sizes.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h      |  6 ++++++
 target/arm/tcg/gengvec.c        | 14 ++++++++++++++
 target/arm/tcg/translate-neon.c | 20 ++------------------
 3 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index edd775d564..b996de2c15 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -602,6 +602,12 @@ void gen_gvec_uaddlp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 void gen_gvec_uadalp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                      uint32_t opr_sz, uint32_t max_sz);
 
+/* These exclusively manipulate the sign bit. */
+void gen_gvec_fabs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                   uint32_t oprsz, uint32_t maxsz);
+void gen_gvec_fneg(unsigned vece, uint32_t dofs, uint32_t aofs,
+                   uint32_t oprsz, uint32_t maxsz);
+
 /*
  * Forward to the isar_feature_* tests given a DisasContext pointer.
  */
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 2755da8ac7..01c9d5436d 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -2697,3 +2697,17 @@ void gen_gvec_uadalp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     assert(vece <= MO_32);
     tcg_gen_gvec_2(rd_ofs, rn_ofs, opr_sz, max_sz, &g[vece]);
 }
+
+void gen_gvec_fabs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                   uint32_t oprsz, uint32_t maxsz)
+{
+    uint64_t s_bit = 1ull << ((8 << vece) - 1);
+    tcg_gen_gvec_andi(vece, dofs, aofs, s_bit - 1, oprsz, maxsz);
+}
+
+void gen_gvec_fneg(unsigned vece, uint32_t dofs, uint32_t aofs,
+                   uint32_t oprsz, uint32_t maxsz)
+{
+    uint64_t s_bit = 1ull << ((8 << vece) - 1);
+    tcg_gen_gvec_xori(vece, dofs, aofs, s_bit, oprsz, maxsz);
+}
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 0821f10fad..b9b3d1c1fb 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -3041,14 +3041,6 @@ static bool do_2misc(DisasContext *s, arg_2misc *a, NeonGenOneOpFn *fn)
     return true;
 }
 
-static void gen_VABS_F(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
-                       uint32_t oprsz, uint32_t maxsz)
-{
-    tcg_gen_gvec_andi(vece, rd_ofs, rm_ofs,
-                      vece == MO_16 ? 0x7fff : 0x7fffffff,
-                      oprsz, maxsz);
-}
-
 static bool trans_VABS_F(DisasContext *s, arg_2misc *a)
 {
     if (a->size == MO_16) {
@@ -3058,15 +3050,7 @@ static bool trans_VABS_F(DisasContext *s, arg_2misc *a)
     } else if (a->size != MO_32) {
         return false;
     }
-    return do_2misc_vec(s, a, gen_VABS_F);
-}
-
-static void gen_VNEG_F(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
-                       uint32_t oprsz, uint32_t maxsz)
-{
-    tcg_gen_gvec_xori(vece, rd_ofs, rm_ofs,
-                      vece == MO_16 ? 0x8000 : 0x80000000,
-                      oprsz, maxsz);
+    return do_2misc_vec(s, a, gen_gvec_fabs);
 }
 
 static bool trans_VNEG_F(DisasContext *s, arg_2misc *a)
@@ -3078,7 +3062,7 @@ static bool trans_VNEG_F(DisasContext *s, arg_2misc *a)
     } else if (a->size != MO_32) {
         return false;
     }
-    return do_2misc_vec(s, a, gen_VNEG_F);
+    return do_2misc_vec(s, a, gen_gvec_fneg);
 }
 
 static bool trans_VRECPE(DisasContext *s, arg_2misc *a)
-- 
2.43.0

