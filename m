Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1427987lfq;
        Mon, 11 Apr 2022 00:05:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjdd7BCY9nAEx4KSnYVggv6DArI+b6K0rw4vp5fmTWjmUmdzjbcWyALbU6x6caaIHG3S5p
X-Received: by 2002:a05:6214:2a8e:b0:443:8a10:c1ca with SMTP id jr14-20020a0562142a8e00b004438a10c1camr25698170qvb.88.1649660708668;
        Mon, 11 Apr 2022 00:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649660708; cv=none;
        d=google.com; s=arc-20160816;
        b=yD2AQOjYKOrhWROHbrzg/3KFzHT43i5qqH1mRyyaRRhRPwWNXfpDil570MZXjwZ10a
         X+OOsI8g8UBApojJtDB2TlFXc6kSjYtiHeND99VJJ0pxUU/JKnrfBMxZY/l88JuTHqTi
         mxQo7moxNO2j5iwMv6xbE1zfKDo8aa3FrQNKB6L0B05163LtQpxFi6YyCsNhuhSoFLOX
         VfHvRlDZzu7mXnupffyTAKWmJk7oCMIgeOmmha95wuWnfKWGrPjSfib265Q3/PdE/jmk
         o9lbjQgeWLgs8hLshQtXMZjKjSMO4AsVPgifvHwFv5g3L/mTSVXpPJRXNH7TpTk0NIxi
         aT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=q785mq9ApuEsWrBluYEOnSDLZoBJxtoDzrY7DWxqW7g=;
        b=mmvs1B8dzXlEvh9llAFQlhYcY4SYEtbNXzBGvtk0wxXHlOupac2HdN3xzXv3+omak0
         JZWVaMpPbtR+x/lzeGdMTou55x8nbM09ePr+3+81O8AOKFdoJHRAXMf/Vq4uVuff6s/f
         w8GQoy7nusvvUle2azfqA7eMpzpYQWmOjkdV770X6CbDh+i5G2sG0EkAjXx2TM2wLGIh
         NhO2+pQy8RxpGoqJX1T5TRTNFTJX+jVAN/fV7Xg5gRFj2ojb1/Ynzzqtt/6sIqmyQS/d
         ofdE/Xlq1VFGB+HUBP0qrDBecWL5IkQzPnMeAWoWhLvM/I4P9iycRq/Zja4DKhIN/rb4
         CYDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Lymc1AJh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw5-20020a056214238500b00440e46a7d90si4002923qvb.558.2022.04.11.00.05.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 00:05:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Lymc1AJh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndo6m-000332-5U
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 03:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo0y-0008FZ-LC
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:59:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo0w-00076P-Rj
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 02:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649660346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q785mq9ApuEsWrBluYEOnSDLZoBJxtoDzrY7DWxqW7g=;
 b=Lymc1AJhU/tgpROXDyP1nOI0AGu5RHdG3GMLigGyAEh95T/8EcqJuoXxY9q0Sdvq1FI+cK
 WbL4fnA/T8GzJODEaNFUCnjZ2Kp8OVC+lwhDW+u4djo9h1fOukB88pfVNnezaHO1HUe3Sx
 psb1hWq7Pcrz6FmY3LVJsehnqPJe6g0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-yjngtxPoOpycc_5cz9oYhA-1; Mon, 11 Apr 2022 02:59:00 -0400
X-MC-Unique: yjngtxPoOpycc_5cz9oYhA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BBDC101A52C;
 Mon, 11 Apr 2022 06:59:00 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D681C4029AD;
 Mon, 11 Apr 2022 06:58:55 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/5] target/arm/tcg: Indirect addressing for coprocessor
 register storage
Date: Mon, 11 Apr 2022 14:58:38 +0800
Message-Id: <20220411065842.63880-2-gshan@redhat.com>
In-Reply-To: <20220411065842.63880-1-gshan@redhat.com>
References: <20220411065842.63880-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, agraf@csgraf.de,
 shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p8KlPtMUeltH

Currently, there is an array used as the storage for the coprocessor
registers. Each element in the array occupies for 8 bytes. It means
we have the assumption that the size of coprocessor can't exceed
8 bytes. The storage mechanism is used by KVM either. Unfortunately,
the assumption is conflicting with KVM's pseudo firmware registers,
whose sizes can be variable and exceeding 8 bytes. So the storage
scheme isn't working for KVM's pseudo firmware registers.

This introduces another array (@cpreg_value_indexes) to track the
storage location in @cpreg_values for the corresponding coprocessor
register. @cpreg_value_array_len is also added to track the total
storage size for all coprocessor registers. After that, the storage
is addressed indirectly by @cpreg_values[cpreg_value_indexes[i]].

For TCG case, each coprocessor register still has fixed 8 bytes
storage space. So the old direct addressing mechanism and new
indirect addressing mechanism can co-exist and interchangeable,
even in migration circumstance.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/cpu.h    | 12 ++++++++++--
 target/arm/helper.c | 27 +++++++++++++++++++--------
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 23879de5fa..0129791b3f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -795,17 +795,25 @@ struct ArchCPU {
      * 64 bit indexes, not CPRegInfo 32 bit indexes)
      */
     uint64_t *cpreg_indexes;
-    /* Values of the registers (cpreg_indexes[i]'s value is cpreg_values[i]) */
+    /*
+     * Values of the registers
+     * (cpreg_indexes[i]'s value is cpreg_values[cpreg_value_indexes[i]])
+     */
+    uint32_t *cpreg_value_indexes;
     uint64_t *cpreg_values;
-    /* Length of the indexes, values, reset_values arrays */
+    /* Length of the indexes, value indexes and values arrays */
     int32_t cpreg_array_len;
+    int32_t cpreg_value_array_len;
+
     /* These are used only for migration: incoming data arrives in
      * these fields and is sanity checked in post_load before copying
      * to the working data structures above.
      */
     uint64_t *cpreg_vmstate_indexes;
+    uint32_t *cpreg_vmstate_value_indexes;
     uint64_t *cpreg_vmstate_values;
     int32_t cpreg_vmstate_array_len;
+    int32_t cpreg_vmstate_value_array_len;
 
     DynamicGDBXMLInfo dyn_sysreg_xml;
     DynamicGDBXMLInfo dyn_svereg_xml;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7d14650615..e8cb4a9edb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -163,7 +163,7 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
              * item in the list, we just recheck "does the raw write we must
              * have made in write_list_to_cpustate() read back OK" here.
              */
-            uint64_t oldval = cpu->cpreg_values[i];
+            uint64_t oldval = cpu->cpreg_values[cpu->cpreg_value_indexes[i]];
 
             if (oldval == newval) {
                 continue;
@@ -176,7 +176,7 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
 
             write_raw_cp_reg(&cpu->env, ri, newval);
         }
-        cpu->cpreg_values[i] = newval;
+        cpu->cpreg_values[cpu->cpreg_value_indexes[i]] = newval;
     }
     return ok;
 }
@@ -188,7 +188,7 @@ bool write_list_to_cpustate(ARMCPU *cpu)
 
     for (i = 0; i < cpu->cpreg_array_len; i++) {
         uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
-        uint64_t v = cpu->cpreg_values[i];
+        uint64_t v = cpu->cpreg_values[cpu->cpreg_value_indexes[i]];
         const ARMCPRegInfo *ri;
 
         ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
@@ -222,8 +222,12 @@ static void add_cpreg_to_list(gpointer key, gpointer opaque)
 
     if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
         cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
+        cpu->cpreg_value_indexes[cpu->cpreg_array_len] =
+            cpu->cpreg_value_array_len;
+
         /* The value array need not be initialized at this point */
         cpu->cpreg_array_len++;
+        cpu->cpreg_value_array_len++;
     }
 }
 
@@ -238,6 +242,7 @@ static void count_cpreg(gpointer key, gpointer opaque)
 
     if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
         cpu->cpreg_array_len++;
+        cpu->cpreg_value_array_len++;
     }
 }
 
@@ -261,26 +266,32 @@ void init_cpreg_list(ARMCPU *cpu)
      * Note that we require cpreg_tuples[] to be sorted by key ID.
      */
     GList *keys;
-    int arraylen;
+    int arraylen, value_arraylen;
 
     keys = g_hash_table_get_keys(cpu->cp_regs);
     keys = g_list_sort(keys, cpreg_key_compare);
 
     cpu->cpreg_array_len = 0;
-
+    cpu->cpreg_value_array_len = 0;
     g_list_foreach(keys, count_cpreg, cpu);
 
     arraylen = cpu->cpreg_array_len;
+    value_arraylen = cpu->cpreg_value_array_len;
     cpu->cpreg_indexes = g_new(uint64_t, arraylen);
-    cpu->cpreg_values = g_new(uint64_t, arraylen);
+    cpu->cpreg_value_indexes = g_new(uint32_t, arraylen);
+    cpu->cpreg_values = g_new(uint64_t, value_arraylen);
     cpu->cpreg_vmstate_indexes = g_new(uint64_t, arraylen);
-    cpu->cpreg_vmstate_values = g_new(uint64_t, arraylen);
+    cpu->cpreg_vmstate_value_indexes = g_new(uint32_t, arraylen);
+    cpu->cpreg_vmstate_values = g_new(uint64_t, value_arraylen);
     cpu->cpreg_vmstate_array_len = cpu->cpreg_array_len;
-    cpu->cpreg_array_len = 0;
+    cpu->cpreg_vmstate_value_array_len = cpu->cpreg_value_array_len;
 
+    cpu->cpreg_array_len = 0;
+    cpu->cpreg_value_array_len = 0;
     g_list_foreach(keys, add_cpreg_to_list, cpu);
 
     assert(cpu->cpreg_array_len == arraylen);
+    assert(cpu->cpreg_value_array_len == value_arraylen);
 
     g_list_free(keys);
 }
-- 
2.23.0

