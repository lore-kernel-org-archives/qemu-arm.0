Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp177842ejr;
        Tue, 10 Oct 2023 07:26:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKhdGON3sd0iaralWRpKUTOGtvfx19/gpXDzzc8yLCGLok+ZoyeYZtL/nZuaz9CdcKh3es
X-Received: by 2002:a05:6a20:7485:b0:15e:e0fd:98e7 with SMTP id p5-20020a056a20748500b0015ee0fd98e7mr22030454pzd.20.1696947975034;
        Tue, 10 Oct 2023 07:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696947975; cv=none;
        d=google.com; s=arc-20160816;
        b=D5a+zgcIkmB8Irmfhosk9Aaa4+wCRaNNY6iJmC4fxmeC0Y2cvZlYU7lVRjfskSEJA6
         MZfum1BwuuBxj2CLuJB3OjoBM5uK0EBB4+l0O8B3cxr7qxdxGnMw1sDVl0v85a1Ssp+P
         jBVlAqHQnErSthAXhN5DhtbRdc6PHjOSrQCdSZ85RX+PqL3MZLR3FqVCESya+SN/O6uh
         IDGbqvQ8XTG6Qqi/Lo2TFfjfQkOnc5Fv6F0r4D7JgU895ARFp45TBfSXawYCQgMk5JSh
         xlh0BkC9nItF0hjJ569l0FtEXvvfXmHiGf0LQ9HW6cuPcO6tURLYoZGb0Wg0u5aTgFwO
         J/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=TApefxjm2WEaxEHFO8rc1HF2nVhBHdzR5dt4+KLCQJ0=;
        fh=ImRerk2y7/YfWKyaAH9Jk8iKMFuTfW2jmHv5mlACdLg=;
        b=NTCDaUfXVXnWETcihZWRmAjHy6nEoqnf/jYVaC3NvK+CwHO4X9s+WHnUfpg8pPwqqN
         2xS88YGEfqrAAgPo06vL+PoNkX7Fs8JY79xsolJyVUsTNkf2ksVfVpow3lSEklAducFh
         dWT7dj/ZR1v9hQjio+y2q+YrxEF77Lf0cLJjq+Bsb2lfjdKlq/CQ7TRnrArJw72toybQ
         ajzh/QwrRWZSlqOFvL5V24/0douI+wUdD9Cw5SeTe+Tt3dkRREP0n5O4CZUh+uMZgwCa
         xquHvNeQX1KWhLtA9d7BiZ8fb0WtZLKtHzoQmpupGEs1yDeL2KDwnSM0kokpFfeqPdzM
         J1iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N4sccOY9;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::3:8 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from fry.vger.email (fry.vger.email. [2620:137:e000::3:8])
        by mx.google.com with ESMTPS id fd10-20020a056a002e8a00b0068fb5b1dee2si10131582pfb.303.2023.10.10.07.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 07:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::3:8 as permitted sender) client-ip=2620:137:e000::3:8;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N4sccOY9;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::3:8 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from out1.vger.email (depot.vger.email [IPv6:2620:137:e000::3:0])
	by fry.vger.email (Postfix) with ESMTP id 0F50081C508D;
	Tue, 10 Oct 2023 07:26:13 -0700 (PDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.10 at fry.vger.email
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbjJJO0B (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Tue, 10 Oct 2023 10:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233080AbjJJOZ5 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 10 Oct 2023 10:25:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724B5A9
        for <kvm@vger.kernel.org>; Tue, 10 Oct 2023 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696947911;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TApefxjm2WEaxEHFO8rc1HF2nVhBHdzR5dt4+KLCQJ0=;
        b=N4sccOY9txyP4BwSWUyFvepDbmkEI1otVnzfIKLJQUJa/vUdzwgc1yDOqA3zKC+Bgaopx8
        IY1ulwBPw9gSmk0FBhsuFfbg2ELqySo5pMMc+Gpl8K5gXbk2JjD1EoKc2pf7+QZwWCNTJf
        Ysc71pJ+77LPJRjM7KVryH1VkDg6884=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-tPeLB-doNmavXo4SrMnqTw-1; Tue, 10 Oct 2023 10:25:02 -0400
X-MC-Unique: tPeLB-doNmavXo4SrMnqTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB18581DA0F;
        Tue, 10 Oct 2023 14:25:00 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-239.str.redhat.com [10.33.192.239])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D0DDF21CAC76;
        Tue, 10 Oct 2023 14:24:59 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>
Cc:     Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 3/3] arm/kvm: convert to read_sys_reg64
Date:   Tue, 10 Oct 2023 16:24:53 +0200
Message-ID: <20231010142453.224369-4-cohuck@redhat.com>
In-Reply-To: <20231010142453.224369-1-cohuck@redhat.com>
References: <20231010142453.224369-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on fry.vger.email
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.4 (fry.vger.email [0.0.0.0]); Tue, 10 Oct 2023 07:26:13 -0700 (PDT)
X-Spam-Level: **
X-TUID: 8pp3wVs7wbfu

We can use read_sys_reg64 to get the SVE_VLS register instead of
calling GET_ONE_REG directly.

Suggested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/kvm64.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 558c0b88dd69..d40c89a84752 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -500,10 +500,6 @@ uint32_t kvm_arm_sve_get_vls(CPUState *cs)
             .target = -1,
             .features[0] = (1 << KVM_ARM_VCPU_SVE),
         };
-        struct kvm_one_reg reg = {
-            .id = KVM_REG_ARM64_SVE_VLS,
-            .addr = (uint64_t)&vls[0],
-        };
         int fdarray[3], ret;
 
         probed = true;
@@ -512,7 +508,7 @@ uint32_t kvm_arm_sve_get_vls(CPUState *cs)
             error_report("failed to create scratch VCPU with SVE enabled");
             abort();
         }
-        ret = ioctl(fdarray[2], KVM_GET_ONE_REG, &reg);
+        ret = read_sys_reg64(fdarray[2], &vls[0], KVM_REG_ARM64_SVE_VLS);
         kvm_arm_destroy_scratch_host_vcpu(fdarray);
         if (ret) {
             error_report("failed to get KVM_REG_ARM64_SVE_VLS: %s",
-- 
2.41.0
