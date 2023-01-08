Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1327574ejc;
        Sat, 7 Jan 2023 18:45:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvSjx9xKeTDqaNC+kFaw7VlEcTmv607L7liWMTP3hUwcw9keKA31ioemt0THFfN/9G2gjBS
X-Received: by 2002:a05:6214:1cc4:b0:4c7:5b:75ba with SMTP id g4-20020a0562141cc400b004c7005b75bamr104085801qvd.31.1673145902861;
        Sat, 07 Jan 2023 18:45:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673145902; cv=none;
        d=google.com; s=arc-20160816;
        b=HrxzlpFCt/iDIbjNMl/4iBAxXFsaso4YXts/c6qWuFCBebklYUE6gewnvTnqIOiq0+
         sCnm4cx4aNYqNlrz8GcN5Lwm0EIbjsUlabiXwshM0O0F3AZqB/5zflgdxztCOeg+V2Ci
         +IZ9DEsd6LX93yMmZtxr6xVh5FQqxRlze3C2GPoFaNpKPz+2QW79pe4Yj3DgXB5/H/aL
         kd41Pk8Gw721c4oBzoO+w+9Q6OFBujyURuvMW8HkNcKkXXkFun8c7mHg56McvMhdkCCD
         e0ezZBMbRlSSub3yYmw9D1RE0RnVsI2fL+nPHEgDsby+Fj7Mx24hmcB8df8J3Wz4WPyW
         GmyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uy+1LYtKetQWFHYH8PaN7/XbqnFh4isIp+PwWLyalNo=;
        b=mQp4eeY/u/7EGtGBdYE6UPgRMLsw440WnNoBqbfmWKIXbljCEoxTgdYLBhr51b0pim
         2rbhXmKZSaO9VH8q9BCsC9HWj0TMxboVK02nd13sk4AWxGikZngER344zuAyOhSwAbVK
         bvM52SHZ0skgOLf16hxolGeHMfGrP0vsPYsATR6F9P77UBHsJ2l+IDLnzYzxDWigvYXp
         XGcpE4nUW1VAxhajq8y9qbBXyKn7v707Qb7psKN1TNJs5YuQz8wrQQ/zilJ59NtyYThA
         BwlWyPdxAkB0sa8FCz3apJ+4PhtMms6ZWZI6beY7lA8yXgu/M5rSTZ2MNZ+m40sZv5Yk
         PEAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gTpYFrpt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7-20020ae9f807000000b006bbbdefd8a1si2515510qkh.727.2023.01.07.18.45.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:45:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gTpYFrpt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELZ1-0004e7-5Q; Sat, 07 Jan 2023 21:37:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYz-0004cu-Pq
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:37:33 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYr-0004VI-5g
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:37:33 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso5836979pjf.1
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uy+1LYtKetQWFHYH8PaN7/XbqnFh4isIp+PwWLyalNo=;
 b=gTpYFrptaAB6DVGm8liAVvYlvcGaeThZF2mSsuwEqS4MEeWIVtzmrjxAPkfyqo81wt
 Wf/8VzoDmI7kIwUgNmIojeIsEiDh0lPa9YTDX4ihp52j2MYtu8zzNnn/+ypAM4+6pCuP
 s1KGmVCKigKUA7/mWjpExzTJvNbyFQZ7yjF+kd/xYJtvOjZyvG8e0RxwLSKuGd40GEzm
 wOF6s3JhjJt0rkH3ZTkzyvvrZ/tUWmpfOK+Hxm4CAEyEH3lV6A+jD3hZyJARCsxC1owi
 eq8kyYx4F6v2rnsMHgRxqROpU85Tx+xa9ES1PhMKKRdhGHJyxaXqMAVMI1ImrlanDKrp
 xOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uy+1LYtKetQWFHYH8PaN7/XbqnFh4isIp+PwWLyalNo=;
 b=QhhK3j2ACNGTHo8h9k2F5jvpikDuLkdQxcdcYtcnqFa2XZsOp1zT0aUnbxVlxuzZVM
 /3JrThrwhr1KFv47dd1dUEl5b8PRr9murHxEDquXT1gvDfL4pFwouk6arCWEETYQ7eoQ
 YusxT7/E2j7iHFv+Wae3Td5q01t0XNAXW0cKqN3Jd4DK65jJjTJB37tDnpXJBO2FDr4W
 5CttpQPqQ1BTMu20iwJLBV2s6easQgAHujIG0BKCE/ZrK6Rnzzm/fj9zLszg4u4D1boo
 DujeNoBZcyMUb15P/FynMv9hv9TZ1ooFAs8QXOhsk8OaPFrAeokrS5XFs0d3X+o3IAt9
 ABSg==
X-Gm-Message-State: AFqh2koTBBEsIjna6I6MVzICnQShKQSN2j9pDzGVcvGNQJuCd/RwsN8E
 A5FnkjnGhs+gzHbn71MO8iHtgVcgRo8Tk7mQ
X-Received: by 2002:a17:902:aa8e:b0:189:abdd:400a with SMTP id
 d14-20020a170902aa8e00b00189abdd400amr62371783plr.15.1673145443887; 
 Sat, 07 Jan 2023 18:37:23 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 02/36] tcg: Handle dh_typecode_i128 with TCG_CALL_{RET,
 ARG}_NORMAL
Date: Sat,  7 Jan 2023 18:36:45 -0800
Message-Id: <20230108023719.2466341-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +mAZ48JpoiM0

Many hosts pass and return 128-bit quantities like sequential
64-bit quantities.  Treat this just like we currently break
down 64-bit quantities for a 32-bit host.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index da91779890..99e6e4e1a8 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -686,11 +686,22 @@ static void init_call_layout(TCGHelperInfo *info)
     case dh_typecode_s64:
         info->nr_out = 64 / TCG_TARGET_REG_BITS;
         info->out_kind = TCG_CALL_RET_NORMAL;
+        assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
+        break;
+    case dh_typecode_i128:
+        info->nr_out = 128 / TCG_TARGET_REG_BITS;
+        info->out_kind = TCG_CALL_RET_NORMAL; /* TODO */
+        switch (/* TODO */ TCG_CALL_RET_NORMAL) {
+        case TCG_CALL_RET_NORMAL:
+            assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
+            break;
+        default:
+            qemu_build_not_reached();
+        }
         break;
     default:
         g_assert_not_reached();
     }
-    assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
 
     /*
      * Parse and place function arguments.
@@ -712,6 +723,9 @@ static void init_call_layout(TCGHelperInfo *info)
         case dh_typecode_ptr:
             type = TCG_TYPE_PTR;
             break;
+        case dh_typecode_i128:
+            type = TCG_TYPE_I128;
+            break;
         default:
             g_assert_not_reached();
         }
@@ -751,6 +765,19 @@ static void init_call_layout(TCGHelperInfo *info)
             }
             break;
 
+        case TCG_TYPE_I128:
+            switch (/* TODO */ TCG_CALL_ARG_NORMAL) {
+            case TCG_CALL_ARG_EVEN:
+                layout_arg_even(&cum);
+                /* fall through */
+            case TCG_CALL_ARG_NORMAL:
+                layout_arg_normal_n(&cum, info, 128 / TCG_TARGET_REG_BITS);
+                break;
+            default:
+                qemu_build_not_reached();
+            }
+            break;
+
         default:
             g_assert_not_reached();
         }
@@ -1668,11 +1695,13 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         op->args[pi++] = temp_arg(ret);
         break;
     case 2:
+    case 4:
         tcg_debug_assert(ret != NULL);
-        tcg_debug_assert(ret->base_type == ret->type + 1);
+        tcg_debug_assert(ret->base_type == ret->type + ctz32(n));
         tcg_debug_assert(ret->temp_subindex == 0);
-        op->args[pi++] = temp_arg(ret);
-        op->args[pi++] = temp_arg(ret + 1);
+        for (i = 0; i < n; ++i) {
+            op->args[pi++] = temp_arg(ret + i);
+        }
         break;
     default:
         g_assert_not_reached();
-- 
2.34.1

