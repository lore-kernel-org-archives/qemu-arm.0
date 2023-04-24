Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2595735ejm;
        Sun, 23 Apr 2023 22:42:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350YOnNxbVpE1PVDh0Zl7d8M5kWadx7haR5xa3GoJDROn+t2zC+RmVQj47FPAfgVPwstFh/Rq
X-Received: by 2002:ac8:5bd0:0:b0:3f0:a426:5f33 with SMTP id b16-20020ac85bd0000000b003f0a4265f33mr962852qtb.34.1682314926494;
        Sun, 23 Apr 2023 22:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682314926; cv=none;
        d=google.com; s=arc-20160816;
        b=g8UowW3IWU7SOBdJLNK70xWpojtsPVs50OzqjTynTiyh3qA71Ujj9Ythnur5g3FNOX
         vE+prnpsHfsHuZkjIX45AIixBa1z4AHlpGCtS77qSI31tNBh/DtEOBi4zvTbrum5a03T
         R//BeBF4k7XGnRab+plUL3Lai6wBeBjwzWyjwT6U9Je7PftFMIl5e8y7JCNhITkDSUCG
         CASUPvr7bKrG3ULgPp1ilMNSx5bjVVNI4td+947Buy3WuWJF+w69+wMvofKsCKuD6sVH
         lFzqo1Si20lvZ/ySQaqMPiBME9WgB2qoUQ+/0el/iDG0aeCCAstxBDAlgi8SiXv7iURI
         MWFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eP2UcvTSjxkcvSWlSrM0QTbqla0I8aaMQCx8SFdrxDo=;
        b=WJX0xaJxRmGYEel6JC5KXUc+QeUjhEBBVi9vc5kjXbVAcq4as7VSYYOu5SimOcT0hD
         KEAZGkrDQ/zUttFZGwYp6bj2CW5ORdH6a9KpkRaY9ZouiyL8+jXE8WPNDhUILnozfrua
         P4qbnRJlo9/b/+pVQXIq1T6VJrWOBFROMzuK8nfrYkez5C6ttp0L/1Px2Hu1UADCuC1r
         82LQkQ5sGR9UzxXOiJiJSwpWPra/mINdxe5AcBkAE5LJbfZM9Vg9mCu5edv03wzR6cj4
         rB/PTw4OnhZKfuEu4Ww53/a00QaZH8LIvTwlIVsy+0bKseHySUGHQk5fyOSIba72sT4v
         5krA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IlCNtRwB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020a05622a034900b003b9c44e0341si6729435qtw.392.2023.04.23.22.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:42:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IlCNtRwB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqox9-0005OH-QE; Mon, 24 Apr 2023 01:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox3-0005Ik-Mu
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqowr-0004Fu-52
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:41:24 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19afc4f60so8931665e9.1
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314870; x=1684906870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eP2UcvTSjxkcvSWlSrM0QTbqla0I8aaMQCx8SFdrxDo=;
 b=IlCNtRwB1/xQU7iLzHM5XbtmCDFsCOjgZJmIipafeiIB9+1OrNeOkGdrqZYeQSwhKt
 Hy8GuUI4mthHOr1I8q4SjUqNqv59sQuw4X5cqQuPo2F4N3eA1YVEvygVUzz4/XT11iVk
 T0sMF0/j7IVmdIubK7vkDSuUDEmoYbmzqMPvOAXtboeEesfuFXp8N/NxnYoGVmkuIp5K
 h5fAbPcPwIoPR0swog010AFsfdl092RuKQlPGLNOtEaIZl/NOCMSKegu2oYJ0rtBbPnE
 qUWn7rMbyscmsuqGwjOjeatYjYqaampTEwkFqMyty4MypGZOa0AR0Ky7tgSiGexwDtLF
 PDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314870; x=1684906870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eP2UcvTSjxkcvSWlSrM0QTbqla0I8aaMQCx8SFdrxDo=;
 b=hn9Y087ELQaGXnswOEUaR57tRFDZqRvVuFrJeAs76DnjFX2X1PZQHc8mDmQuQeFFfL
 wdc74tcLFC22BBydjlkX4WIxs4M9Un1+5H2gAX1ipNeoObw1sllA5oTiEFeR7meRm7f+
 BWg/2+8XbUVgUSEzJucSah0uWtz/FFJgu4ETYZh+eip6vOaAuwC+RO1JEzxfBORT1YDK
 QwSFL/lVJs+DTcHC/QMEjYX3b0iIxUi46aLp97kHGWihmcEPVRq9OBxqEBJtAlOutvGK
 vStK/2BpU+NTwx4PqNvOGTXDizaZXAk/uEpmlFQZ6K5mkjmbdmh4l9zKhhVrAsb+zYU2
 J5tQ==
X-Gm-Message-State: AAQBX9e4z7sOIwy20RrX1h82ME+2xZcMTZ0sZK00EV07/heBfjDq8zPy
 6DNUUXtMtf/gPHULCt3Pzh5mYQ==
X-Received: by 2002:a5d:6e06:0:b0:2ce:fd37:938c with SMTP id
 h6-20020a5d6e06000000b002cefd37938cmr8682496wrz.50.1682314869885; 
 Sun, 23 Apr 2023 22:41:09 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 06/57] tcg/i386: Generalize multi-part load overlap test
Date: Mon, 24 Apr 2023 06:40:14 +0100
Message-Id: <20230424054105.1579315-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: MEpA0KlA9i+T

Test for both base and index; use datahi as a temporary, overwritten
by the final load.  Always perform the loads in ascending order, so
that any (user-only) fault sees the correct address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index b986109d77..794d440a9e 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2223,23 +2223,22 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_modrm_sib_offset(s, movop + P_REXW + seg, datalo,
                                      base, index, 0, ofs);
+            break;
+        }
+        if (use_movbe) {
+            TCGReg t = datalo;
+            datalo = datahi;
+            datahi = t;
+        }
+        if (base == datalo || index == datalo) {
+            tcg_out_modrm_sib_offset(s, OPC_LEA, datahi, base, index, 0, ofs);
+            tcg_out_modrm_offset(s, movop + seg, datalo, datahi, 0);
+            tcg_out_modrm_offset(s, movop + seg, datahi, datahi, 4);
         } else {
-            if (use_movbe) {
-                TCGReg t = datalo;
-                datalo = datahi;
-                datahi = t;
-            }
-            if (base != datalo) {
-                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
-                                         base, index, 0, ofs);
-                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                         base, index, 0, ofs + 4);
-            } else {
-                tcg_out_modrm_sib_offset(s, movop + seg, datahi,
-                                         base, index, 0, ofs + 4);
-                tcg_out_modrm_sib_offset(s, movop + seg, datalo,
-                                         base, index, 0, ofs);
-            }
+            tcg_out_modrm_sib_offset(s, movop + seg, datalo,
+                                     base, index, 0, ofs);
+            tcg_out_modrm_sib_offset(s, movop + seg, datahi,
+                                     base, index, 0, ofs + 4);
         }
         break;
     default:
-- 
2.34.1

