Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1317707lfb;
        Tue, 12 May 2020 09:39:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypJaq2vLZcucNCOvkMe6yK38X4o32wEnJrHKpDzpyqGom7leMLTQi9P564l9CuVdRiO7I1Zl
X-Received: by 2002:ac8:3664:: with SMTP id n33mr24056304qtb.363.1589301562180;
        Tue, 12 May 2020 09:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589301562; cv=none;
        d=google.com; s=arc-20160816;
        b=jtN2n4vNPIdsMxYhhWwwfQUICN8p/S9FTkDqUF+AvAOGHM7W4xwewuzkZOgCvR+6i/
         MBZ7j1f0/B9zlD3+xHgYWDMeeWg6l1vFN9pZ/b+j7YRNgK/Q5Hf1SKJbqpsVrlvSSz0K
         Kcp+e1U1TUP2s4gjr7dRJ78hVWjGJbFzJG/irGvo7XyfTrG28ye3HiWa60IiZp0uz1EP
         mpgD96qguIzL+j4/1ARcIqsqQXOIv1j+YcuUi/o+hOzc8fD2Zibj3l0VUTwtThyjNZeU
         vVBkrifnON+dmeeR0G6nm8SSLZ2VieLaPdP0sL0aVaAcmj6jQfGIHhxWkoL8Kdb37DRI
         KRYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=miq5sxrk+TH5OlhT9tqJAy5fKLaSHjQ/CF8bIqx0AcI=;
        b=FbqsARy7rsS0t0KHNAezotjAz4jSfVR7lqtLihv42D5fcxi8elVzXR1ADvr2wuHAvF
         FVf12h7UGUF+gQC5gh+X02EKQoubEBuo96iK27jsOa+/Udr5jy60X5xMkontjgKjO+TQ
         2q5eiCv4R50QSMCsg0DZABXHx++r7PwVpUVLhBrSXN3TklyINPuw3gM/PMk+oUpz9lnN
         GuKLxm/yR/qJxvAUZcJk23Lukd9j1QqLc9CRVkERDA6ZdKog3wAo9ai7mNs5okhj2LhP
         gfBz1wdVbkf4jqnwZeAFKi2dGL1H19cJc7KuAxK1Bd0uvJJ4zHPc2IPI0oUCNqmWnAaB
         r4Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lb4ex40A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si8167336qke.241.2020.05.12.09.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 09:39:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lb4ex40A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYXw9-0006CQ-Gi
	for alex.bennee@linaro.org; Tue, 12 May 2020 12:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXvz-00069o-3e
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:11 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXvx-00060i-GK
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:10 -0400
Received: by mail-wr1-x441.google.com with SMTP id l18so16280761wrn.6
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 09:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=miq5sxrk+TH5OlhT9tqJAy5fKLaSHjQ/CF8bIqx0AcI=;
 b=Lb4ex40AHjQhSCBPsVnhiyp6TueulsCNnYFWNqytO9xKqxoz/2rxsXrcOD2WFRlm37
 4axWh74I88NEiil1u0zk9iaEby+CtF3AUZXDt96juhbLoVujMj2xzZyIAJJQvWvJC+Xe
 xOUUNji1FU+QTRK/j5rEZnMAoUv3WeflNUa9ZHcDM7Xs6o/SBS47WF7QsoBbHAxjXerK
 TWji+5YT3CLgbTQ238ipttB/H3BSHKrYq/te9XKgtn8p7B+ZEPfZQUnexXoZ9PxAwk7t
 Y3nM5IGD7QkZW0GVjhc88R6NiofYyOPER2v4S/7eef5zcluiolfn2pwlSO3EYtiN4Fhi
 rAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=miq5sxrk+TH5OlhT9tqJAy5fKLaSHjQ/CF8bIqx0AcI=;
 b=ZfxGivq1ruu6ugP0QJeLFSYRnxzPozmX2rGJheqm1EubVWv60hGlWiicA/UpSxbLM6
 gyRVhBE4fXLypenm1dlBhNOi+URL8mZgcqSlN5Se5K+adClK7BUEbjSC2l06W9QIR1eC
 nK80oJMPTr60qLWaU+BRO/hLjrGfjU7SmXAYxv9vfwhB/Fe1OnDv4Th/xAMz7Ti4wT0P
 M+BU9QLT7RswSh0nW8q8aAYLUscF6t517X2BM7JyxlMnd83MMUinCbnI/oeV/14kj3H6
 dDKTnwL5GtexHCdecVu/YxKWOUC0qwmKXKWl7Qdfmh/AUGhNZUyb37DwPvngrajfzYfT
 NopA==
X-Gm-Message-State: AGi0PuayYSZEikg64DXkJD/wdxqD0aLGA04cJuuhjsW4GWfbEtOq1cht
 qathBWLOLK+8Rn1KbEUurb+ZK3VL/rTFbw==
X-Received: by 2002:a5d:4806:: with SMTP id l6mr26389228wrq.121.1589301547908; 
 Tue, 12 May 2020 09:39:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm18525981wmo.32.2020.05.12.09.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 09:39:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/17] target/arm: Convert Neon 3-reg-same
 VQRDMLAH/VQRDMLSH to decodetree
Date: Tue, 12 May 2020 17:38:48 +0100
Message-Id: <20200512163904.10918-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512163904.10918-1-peter.maydell@linaro.org>
References: <20200512163904.10918-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I2Zdd/uiDsBX

Convert the Neon VQRDMLAH and VQRDMLSH insns in the 3-reg-same group
to decodetree.  These don't use do_3same() because they want to
operate on VFP double registers, whose offsets are different from the
neon_reg_offset() calculations do_3same does.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: use do_3same() rather than custom do_vqrdlmah() function
---
 target/arm/neon-dp.decode       |  3 +++
 target/arm/translate-neon.inc.c | 15 +++++++++++++++
 target/arm/translate.c          | 14 ++------------
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 6b0b6566d60..04aff438410 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -89,3 +89,6 @@ VMLS_3s          1111 001 1 0 . .. .... .... 1001 . . . 0 .... @3same
 
 VMUL_3s          1111 001 0 0 . .. .... .... 1001 . . . 1 .... @3same
 VMUL_p_3s        1111 001 1 0 . .. .... .... 1001 . . . 1 .... @3same
+
+VQRDMLAH_3s      1111 001 1 0 . .. .... .... 1011 ... 1 .... @3same
+VQRDMLSH_3s      1111 001 1 0 . .. .... .... 1100 ... 1 .... @3same
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 099491b16f3..661b5fc4cf2 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -671,3 +671,18 @@ static bool trans_VMUL_p_3s(DisasContext *s, arg_3same *a)
     }
     return do_3same(s, a, gen_VMUL_p_3s);
 }
+
+#define DO_VQRDMLAH(INSN, FUNC)                                         \
+    static bool trans_##INSN##_3s(DisasContext *s, arg_3same *a)        \
+    {                                                                   \
+        if (!dc_isar_feature(aa32_rdm, s)) {                            \
+            return false;                                               \
+        }                                                               \
+        if (a->size != 1 && a->size != 2) {                             \
+            return false;                                               \
+        }                                                               \
+        return do_3same(s, a, FUNC);                                    \
+    }
+
+DO_VQRDMLAH(VQRDMLAH, gen_gvec_sqrdmlah_qc)
+DO_VQRDMLAH(VQRDMLSH, gen_gvec_sqrdmlsh_qc)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index e3d37ef2e99..1f06cb5a87f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5450,12 +5450,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             if (!u) {
                 break;  /* VPADD */
             }
-            /* VQRDMLAH */
-            if (dc_isar_feature(aa32_rdm, s) && (size == 1 || size == 2)) {
-                gen_gvec_sqrdmlah_qc(size, rd_ofs, rn_ofs, rm_ofs,
-                                     vec_size, vec_size);
-                return 0;
-            }
+            /* VQRDMLAH : handled by decodetree */
             return 1;
 
         case NEON_3R_VFM_VQRDMLSH:
@@ -5466,12 +5461,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 }
                 break;
             }
-            /* VQRDMLSH */
-            if (dc_isar_feature(aa32_rdm, s) && (size == 1 || size == 2)) {
-                gen_gvec_sqrdmlsh_qc(size, rd_ofs, rn_ofs, rm_ofs,
-                                     vec_size, vec_size);
-                return 0;
-            }
+            /* VQRDMLSH : handled by decodetree */
             return 1;
 
         case NEON_3R_VABD:
-- 
2.20.1

