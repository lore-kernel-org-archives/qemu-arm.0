Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3513795lfb;
        Mon, 13 Sep 2021 02:59:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFZISdfQH+Q+osslnu7bPgawIGUH2htaHoCXPZmKVwr8/8jCwCE8V/Lv5c7odQgpuP9w09
X-Received: by 2002:a6b:610e:: with SMTP id v14mr8092573iob.70.1631527147893;
        Mon, 13 Sep 2021 02:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631527147; cv=none;
        d=google.com; s=arc-20160816;
        b=gdjAuW0Vcy6g/8BotPecaPRpdTYmVbxd4oCQ/DqGfhKnHsNQt/yDQOM2Q9nY/DLJ0i
         pYgq5mb0wifdFhSgjN86Wxhe9Omg/bFbNDmswdKegmicFHML11+5LH7/xSv83CK65TIQ
         0t+gAzX+pKZT8mobFxXegxnuFX2bmVeJBBrrP/TyKmX+wA9uLgZVFr+UD54KmhTRxWdl
         XBJkJf3onZhTGkjRtp8vgTc1u3Vc2MN30zK4j5d/B89bcLV6jG2jLyiNBIpG/RLSlGA2
         MjWhv8vA9B5BOWOjJ5R78Vn4lOV+P418xLM7Oto5RH6h6CX2i619nZ7TyTefwLzmKz2t
         95KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=F+tOIS44awXR5yx0CVgSMzZ11FU347XCqr0ZLojmfiM=;
        b=conZTZAcxSceRT9s8FrnM/9T5B6aGptL8t/ghmvLrJPoTSnI6zKqcySZWcmzwL87vr
         pWkPAIxcl6JrSv5V5BZbT1iSqR40CLyn0xwaOsQvLjYalzkqjGtGfk2jNskgarF0GKUM
         TTEYJ0JNq+uoJFflc1yDg0bb4VLWvrbzbTC0GEfZo4VQArlGRjSLlrFIyXGGGUSOKT4z
         xbv0YIYasnx3bZFDJv5s71EdfrSa5yhfGpkn5ZmYZaVR+6MBb5oT2X0TmJ3ys+3QvopN
         TC/Wfh23WzYl/faM1rBh7Msnnbfy8atNysRP2pcTnCNujaUVEqsFSwGmm4A9Ccu/h/MW
         /gGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JzIG3PDA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si6108982ioa.54.2021.09.13.02.59.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 02:59:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JzIG3PDA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPijz-0005lF-7g
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 05:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifp-00079D-IE
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifk-0001q3-KK
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:49 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m9so13710840wrb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 02:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F+tOIS44awXR5yx0CVgSMzZ11FU347XCqr0ZLojmfiM=;
 b=JzIG3PDAodo95EfbQpz3FTxnJoJHthvKIa83sSxdb5aDocx/on3dj4EnF8CPb34CwK
 ATFN8g/DPNwrDS9TjoP0xnfsmtrR884jrEgQA+bBJ/jHQENgRqyluDfmZiDamP1/iCuV
 dWFIhJ7lRB/SeXOq0rc6ziQ9h7sVXD64r3WK0UP6C4MdUJ7yOkASPYCC0MGca6WTfs0S
 HaoHNBVYkV1ky4Bpkfv6KQkbGvxPuxvdVhSMGBn67SfHxgZdqTIYVSAwBj72NKqpRGVb
 /PiGvihYNwZJL2BTT2NSq4DTZv5n/gud8KNLP5J7M5NY0Ac21fx3MDDcqxWDhpFL/Qn3
 vXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F+tOIS44awXR5yx0CVgSMzZ11FU347XCqr0ZLojmfiM=;
 b=AzeWefH0uz5Y90W1IAD5iPtqV9NmbhTUsU3kq4s1H4i1jOClLeqX3nZcaaSJXKa5KW
 htbdWEOQQ/NCj5HsaYBGCV2EilxK9lEVMubnw9n/P7etYgamZtZ6/CGicylmp6/eJk9y
 J34DPjK23qnkoBFDSqBMD1ib4Ci51Jznx1Im2SOgB3GvSaZpiRRq21i3B5f+uCZtAwEt
 TTKsbZJt+P6T1WHWgsU3xwQ6h8A5y3mE9D66+EoYhbcI8gWZQKb5KcN1ACXkpiZVlhDK
 YGRij1LUMQLnNaWzps6Nr80h57Jbtm6A1zGGfdUV9GQf6DPGUqokVuGknSNeA0NzBxK1
 HhMw==
X-Gm-Message-State: AOAM531xIJW2oI3iRrOzloL57qDHQca4TJZXVNlseD4Gwm7rzl6KKKpK
 qoHRPbj24na4X/KOEWoip9Z9Z3lf6JLRVw==
X-Received: by 2002:adf:d216:: with SMTP id j22mr11773359wrh.295.1631526883242; 
 Mon, 13 Sep 2021 02:54:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/12] target/arm: Avoid goto_tb if we're trying to exit to
 the main loop
Date: Mon, 13 Sep 2021 10:54:29 +0100
Message-Id: <20210913095440.13462-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oHhirOQZI5IO

Currently gen_jmp_tb() assumes that if it is called then the jump it
is handling is the only reason that we might be trying to end the TB,
so it will use goto_tb if it can.  This is usually the case: mostly
"we did something that means we must end the TB" happens on a
non-branch instruction.  However, there are cases where we decide
early in handling an instruction that we need to end the TB and
return to the main loop, and then the insn is a complex one that
involves gen_jmp_tb().  For instance, for M-profile FP instructions,
in gen_preserve_fp_state() which is called from vfp_access_check() we
want to force an exit to the main loop if lazy state preservation is
active and we are in icount mode.

Make gen_jmp_tb() look at the current value of is_jmp, and only use
goto_tb if the previous is_jmp was DISAS_NEXT or DISAS_TOO_MANY.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 24b7f49d767..3d1ff8ba951 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2610,8 +2610,40 @@ static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
         /* An indirect jump so that we still trigger the debug exception.  */
         gen_set_pc_im(s, dest);
         s->base.is_jmp = DISAS_JUMP;
-    } else {
+        return;
+    }
+    switch (s->base.is_jmp) {
+    case DISAS_NEXT:
+    case DISAS_TOO_MANY:
+    case DISAS_NORETURN:
+        /*
+         * The normal case: just go to the destination TB.
+         * NB: NORETURN happens if we generate code like
+         *    gen_brcondi(l);
+         *    gen_jmp();
+         *    gen_set_label(l);
+         *    gen_jmp();
+         * on the second call to gen_jmp().
+         */
         gen_goto_tb(s, tbno, dest);
+        break;
+    case DISAS_UPDATE_NOCHAIN:
+    case DISAS_UPDATE_EXIT:
+        /*
+         * We already decided we're leaving the TB for some other reason.
+         * Avoid using goto_tb so we really do exit back to the main loop
+         * and don't chain to another TB.
+         */
+        gen_set_pc_im(s, dest);
+        gen_goto_ptr();
+        s->base.is_jmp = DISAS_NORETURN;
+        break;
+    default:
+        /*
+         * We shouldn't be emitting code for a jump and also have
+         * is_jmp set to one of the special cases like DISAS_SWI.
+         */
+        g_assert_not_reached();
     }
 }
 
-- 
2.20.1

