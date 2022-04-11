Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1433273lfq;
        Mon, 11 Apr 2022 00:16:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV3wMe84iYkmceR+h9bzLo0uyK+vwyEwK+HxcwujIIA5UNyZfF8YXLRc9AdayZ6S6xgjqi
X-Received: by 2002:ad4:58c9:0:b0:444:4bb4:651a with SMTP id dh9-20020ad458c9000000b004444bb4651amr996825qvb.49.1649661404880;
        Mon, 11 Apr 2022 00:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649661404; cv=none;
        d=google.com; s=arc-20160816;
        b=UGjzlk5bDR6s31LY92qC/FunlQsJy2uSWt04BfZKWyegJRb0obQKMio0z+XVp4j00F
         we2cZxSqrA+4wArlmFnRlaXMYE0cVy3ERRSDuX0uxxBp6ihResNMvHlLt0O6Ph8j7955
         tOFF/fCyFPGMEVPdD0XzubpoxVUxoDeeJCZrOR4d7zatSbDlhLFWrIuGuQw4mhMIiiKx
         rj7seap1TJLzAK9i0V6cx1lEC2IR2heI6rfg3GXz7tCDOtcsDrnUbVYPw8X/wpzvCMtF
         lYk9nGXZfZNm8NpbBdd5vyAdCghYLIR/0Mh3iaHr90bI6EG2c0eCyWzaJunQbhAdsltm
         vHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1k22XN/WGANFpo8X0qRkJi3jP/iJeublxk7IYC0mwTM=;
        b=C1fQ+vxrhfNPybVrkgSkm9/3VIqRWKeYqIR8XhLmFOK+GRshTwxHZaZ9MkTPdbSE7U
         y+oquM9hcTbqyCeuuUDG2K1GLeXziB7zaCjomORa7P//WQ7H5N26CwOFSDAf8khxupKB
         DgFQyw0Hrn2GP9J+Z9vuHuCijBy/4kRJkY4BTg8lEbqnKwt/vZ/pHZP7c+rnho/TYeG7
         YTrJaTGWQTDKRm9oIr7ZK7T0pDKiubGzgyDUZIIq1RkCRJ+gL59PTQNhogZ76XpKfw0Q
         OSvIn6OFR3+keoqc4J8QjA8SQAepX9MnJKJYdF/YZWlD2RS7RegapwAPdVGiJJuwE9up
         uxBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FKzo+O9G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22-20020ac81116000000b002e1fbf3c06esi3562994qtj.607.2022.04.11.00.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 00:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FKzo+O9G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndoI0-0004jz-9S
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 03:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo1L-0000Tz-2z
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 02:59:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ndo1H-00078N-FA
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 02:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649660366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1k22XN/WGANFpo8X0qRkJi3jP/iJeublxk7IYC0mwTM=;
 b=FKzo+O9GZtA1vrSVP+DoBNhnh5CaLTARM90wfT+C0eLBATfRe5VW7TEuQoYpajzXOLW5Tp
 HTJC+P4nb1LLIgqsKvTiGZrnC/kWdthlz+Sypid5Jq12vyRbHp1SQdSLAiGAvo06GljJw0
 aYrIsOmoUCbXxDvB4Ejf00jdz3rjUjE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-T9fqq_ivPeOiVHoqCPbUww-1; Mon, 11 Apr 2022 02:59:23 -0400
X-MC-Unique: T9fqq_ivPeOiVHoqCPbUww-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73A613C14100;
 Mon, 11 Apr 2022 06:59:23 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-73.pek2.redhat.com [10.72.12.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EB484029AD;
 Mon, 11 Apr 2022 06:59:18 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 5/5] target/arm/kvm: Support coprocessor register with
 variable size
Date: Mon, 11 Apr 2022 14:58:42 +0800
Message-Id: <20220411065842.63880-6-gshan@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, agraf@csgraf.de,
 shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: obmdfAQvWP+F

With the indirect addressing mechanism, we can support large-sized
coprocessor registers. This calculates the length of @cpreg_values
and allocate the storage space accordingly. @cpreg_value_indexes
is also initialized according to the coprocessor register size.

For those registers whose sizes are less than 8 bytes, we always
reserve 8 bytes storage space for it, to gurantee the storage
space address is aligned to 8 bytes. On the other hand, the storage
space size for other registers are allocated based on their sizes.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/kvm.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 5d1ce431b0..71f602fd81 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -471,8 +471,18 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
             continue;
         }
         switch (rlp->reg[i] & KVM_REG_SIZE_MASK) {
+        case KVM_REG_SIZE_U8:
+        case KVM_REG_SIZE_U16:
         case KVM_REG_SIZE_U32:
+            value_arraylen++;
+            break;
         case KVM_REG_SIZE_U64:
+        case KVM_REG_SIZE_U128:
+        case KVM_REG_SIZE_U256:
+        case KVM_REG_SIZE_U512:
+        case KVM_REG_SIZE_U1024:
+        case KVM_REG_SIZE_U2048:
+            value_arraylen += KVM_REG_SIZE(rlp->reg[i]) / sizeof(uint64_t);
             break;
         default:
             fprintf(stderr, "Can't handle size of register in kernel list\n");
@@ -481,7 +491,6 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
         }
 
         arraylen++;
-        value_arraylen++;
     }
 
     cpu->cpreg_indexes = g_renew(uint64_t, cpu->cpreg_indexes, arraylen);
@@ -507,7 +516,13 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
         cpu->cpreg_indexes[arraylen] = regidx;
         cpu->cpreg_value_indexes[arraylen] = value_arraylen;
         arraylen++;
-        value_arraylen++;
+
+        /* We validate the size just now and no need to do it again */
+        if (KVM_REG_SIZE(rlp->reg[i]) < sizeof(uint64_t)) {
+            value_arraylen++;
+        } else {
+            value_arraylen += KVM_REG_SIZE(rlp->reg[i]) / sizeof(uint64_t);
+        }
     }
     assert(cpu->cpreg_array_len == arraylen);
     assert(cpu->cpreg_value_array_len == value_arraylen);
@@ -535,12 +550,28 @@ bool write_kvmstate_to_list(ARMCPU *cpu)
     for (i = 0; i < cpu->cpreg_array_len; i++) {
         struct kvm_one_reg r;
         uint64_t regidx = cpu->cpreg_indexes[i];
+        uint8_t v8;
+        uint16_t v16;
         uint32_t v32;
         int ret;
 
         r.id = regidx;
 
         switch (regidx & KVM_REG_SIZE_MASK) {
+        case KVM_REG_SIZE_U8:
+            r.addr = (uintptr_t)&v8;
+            ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &r);
+            if (!ret) {
+                cpu->cpreg_values[cpu->cpreg_value_indexes[i]] = v8;
+            }
+            break;
+        case KVM_REG_SIZE_U16:
+            r.addr = (uintptr_t)&v16;
+            ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &r);
+            if (!ret) {
+                cpu->cpreg_values[cpu->cpreg_value_indexes[i]] = v16;
+            }
+            break;
         case KVM_REG_SIZE_U32:
             r.addr = (uintptr_t)&v32;
             ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &r);
@@ -549,6 +580,11 @@ bool write_kvmstate_to_list(ARMCPU *cpu)
             }
             break;
         case KVM_REG_SIZE_U64:
+        case KVM_REG_SIZE_U128:
+        case KVM_REG_SIZE_U256:
+        case KVM_REG_SIZE_U512:
+        case KVM_REG_SIZE_U1024:
+        case KVM_REG_SIZE_U2048:
             r.addr = (uintptr_t)(cpu->cpreg_values +
                                  cpu->cpreg_value_indexes[i]);
             ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &r);
@@ -572,6 +608,8 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
     for (i = 0; i < cpu->cpreg_array_len; i++) {
         struct kvm_one_reg r;
         uint64_t regidx = cpu->cpreg_indexes[i];
+        uint8_t v8;
+        uint16_t v16;
         uint32_t v32;
         int ret;
 
@@ -581,11 +619,24 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
 
         r.id = regidx;
         switch (regidx & KVM_REG_SIZE_MASK) {
+        case KVM_REG_SIZE_U8:
+            v8 = cpu->cpreg_values[cpu->cpreg_value_indexes[i]];
+            r.addr = (uintptr_t)&v8;
+            break;
+        case KVM_REG_SIZE_U16:
+            v16 = cpu->cpreg_values[cpu->cpreg_value_indexes[i]];
+            r.addr = (uintptr_t)&v16;
+            break;
         case KVM_REG_SIZE_U32:
             v32 = cpu->cpreg_values[cpu->cpreg_value_indexes[i]];
             r.addr = (uintptr_t)&v32;
             break;
         case KVM_REG_SIZE_U64:
+        case KVM_REG_SIZE_U128:
+        case KVM_REG_SIZE_U256:
+        case KVM_REG_SIZE_U512:
+        case KVM_REG_SIZE_U1024:
+        case KVM_REG_SIZE_U2048:
             r.addr = (uintptr_t)(cpu->cpreg_values +
                                  cpu->cpreg_value_indexes[i]);
             break;
-- 
2.23.0

