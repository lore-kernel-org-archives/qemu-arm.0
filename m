Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp315761lfg;
        Thu, 28 Jul 2022 07:36:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ttudnpv4Cfu8te1K7EHx9+GKbLFWV8XugUqoq6wAEuH0INmz3BicfvGEWpeIkvsbM6AehJ
X-Received: by 2002:ac8:5a48:0:b0:31e:f288:3d68 with SMTP id o8-20020ac85a48000000b0031ef2883d68mr22620575qta.111.1659018992363;
        Thu, 28 Jul 2022 07:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659018992; cv=none;
        d=google.com; s=arc-20160816;
        b=I5vferbnopHuVxjccuonO3y10tGwfgg4ZnR/CRth/LlEa3sbSbnbaFNg/n+WwuH6Wj
         0cPESgiyZSbQOEm7RhynMz3laSiC7jVW2L2EWMI2BoURSNBFnkV0WWKGvuOooQJMtHc/
         vYcHZgA5n66OngNNjEx+FAuEVTWQRedvN1Y4FBvwOsp0PNeumv5+f+0WTQu9OqMm2ZF5
         rBJbcXxGbCKXNQBHOsbSB/bBdlYHAWFSgIEzlyduhmvrOYNe9XBaWr6S12GRGvpiJQ3P
         4rvFw/sBNv4luPMYQfm+xSfjg0VsAaDGKNEQNwIW9Icdk1xz5kbJLGUaGI/O3zUWGVN0
         BhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=fglnNCosP9QgBJWtrBjvGJmWv4b9V9TVGXzTPP4S5WY=;
        b=CRBK37WkOmvfSxDC0myORuzv2Ej1xu7GdJcXIOsDRirePyx6fKhhsUeBWD0NamBmFy
         I1ME8sTilDbxVTyMial0WiwdXZurXRNcU7pGHpIFBPrOFQX+7xE1sbPf7NwrhXDUHuWL
         DIOWGxhAc5/eBFUujuvP678IrvZeFGchPDWTar2CX8oy94jgWPuXmlu2uDteZV5nFcNO
         BsjJPG58HZ+MAPP7R+V/ysPwbRS5jfsn4JKlVeVLw1aQ9c+yjrOUfS0W8QJUcB1qsvDJ
         kjoE7ZmlHqWumI8Ao4e+JlgR1weT9NS+vtHPAVLHls7pHiNnS0t3+dN9fopeTrXRxVdr
         J++g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QwjLuDYW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf10-20020a056214250a00b0047469cbc395si573986qvb.385.2022.07.28.07.36.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jul 2022 07:36:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QwjLuDYW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oH4cp-0008Ui-Ob
	for alex.bennee@linaro.org; Thu, 28 Jul 2022 10:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oH4Rr-0007Fd-4t
 for qemu-arm@nongnu.org; Thu, 28 Jul 2022 10:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oH4Rk-00024t-QU
 for qemu-arm@nongnu.org; Thu, 28 Jul 2022 10:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659018300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fglnNCosP9QgBJWtrBjvGJmWv4b9V9TVGXzTPP4S5WY=;
 b=QwjLuDYW8+d4d+jquPMKbIxjD+6MKGxYkLlN0OnWqxtgZmAgJgTz/FDZaJh84VTzBeglRl
 9yz7XldO/vD4hvmo4FHxfnPpFyNB7FsXZptGyW1pgqL218dtd4eC+s7s76GviUwtnxCjaU
 S9I74ish4JXgjpAEofIJVIxbYi9oMWk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-q5mOU6PBO_aqT1DD5oCukQ-1; Thu, 28 Jul 2022 10:24:57 -0400
X-MC-Unique: q5mOU6PBO_aqT1DD5oCukQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C9941019C8E;
 Thu, 28 Jul 2022 14:24:56 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C73418EB7;
 Thu, 28 Jul 2022 14:24:53 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH for-7.1?] kvm: don't use perror() without useful errno
Date: Thu, 28 Jul 2022 16:24:46 +0200
Message-Id: <20220728142446.438177-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qzrbmTCrwSy3

perror() is designed to append the decoded errno value to a
string. This, however, only makes sense if we called something that
actually sets errno prior to that.

For the callers that check for split irqchip support that is not the
case, and we end up with confusing error messages that end in
"success". Use error_report() instead.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

Not sure if that is still 7.1 material; on the one hand, it's a small
fix; on the other hand, it has been like that forever...

I've kept the Arm-specific message in place, although it might be redundant.

---
 accel/kvm/kvm-all.c | 2 +-
 target/arm/kvm.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 99aede73b7cb..6955c0b23a22 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2265,7 +2265,7 @@ static void kvm_irqchip_create(KVMState *s)
     ret = kvm_arch_irqchip_create(s);
     if (ret == 0) {
         if (s->kernel_irqchip_split == ON_OFF_AUTO_ON) {
-            perror("Split IRQ chip mode not supported.");
+            error_report("Split IRQ chip mode not supported.");
             exit(1);
         } else {
             ret = kvm_vm_ioctl(s, KVM_CREATE_IRQCHIP);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 4339e1cd6e08..e5c1bd50d29b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -959,7 +959,7 @@ void kvm_arch_init_irq_routing(KVMState *s)
 int kvm_arch_irqchip_create(KVMState *s)
 {
     if (kvm_kernel_irqchip_split()) {
-        perror("-machine kernel_irqchip=split is not supported on ARM.");
+        error_report("-machine kernel_irqchip=split is not supported on ARM.");
         exit(1);
     }
 
-- 
2.35.3

