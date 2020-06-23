Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3984176lfm;
        Tue, 23 Jun 2020 03:51:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywkE2kdeBHNjne8H3VfE3Gn+4DOsPW2jXxUCgaEJks4WkOyjV4Ze12aWiWlY61q6y7fMc9
X-Received: by 2002:a50:9a63:: with SMTP id o90mr386761edb.95.1592909496383;
        Tue, 23 Jun 2020 03:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592909496; cv=none;
        d=google.com; s=arc-20160816;
        b=bZf/NkDawjMLZFdboIjhbGQFgYf+qEaL8o8JuGxunMea4xs1oQniSCnHFX7lWk6Ryt
         37btj/6+j5VJOT95+bdGBRMh4MY/s2fwUs4kB6B+FgEQKTv03BlTzUiS8CcY3UUbUcYa
         vpNriWRbPsht11goRGycFTPB1speBXyhiIWMQ0arsbYelIv7dwot1hRBmfwF0rnpYUkL
         k2o/7rG4r+DJOQ6OdBP8YZ7KBV0H/ZdGj3DPJCSnExAna90WDAQ8D5l+xTeriCbuNKTY
         c3FIHNqEGreiVuo7snTPakI6RRzXaqFLIY5CfdXdbQpjcATodzV8QQv7U9L+MFzmJ2cx
         GBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=oZQ1iXj/Bq+YaBfUtLyYjvldkQlNyk/VkfsOF9orImA=;
        b=SNv4ssLmztUi2LA5hXPoqIt7jmaEqKeq9oWdhCBwsnc9ufJI0/sYkZnoQC/1olIG8d
         lcxUZU5wY+NJuHp/Z3p6kbTwVVD8jTf3KGNlAw8d9z3hVuSp9mj7JhfPZcMQ9EdqwWon
         6MPrhwElhF9U5K1O7y4+lZOOpMcaliDByTLnpLgJZF2yjBygxXiy0ivZgLVV8vtpklpH
         mmK4Ck/g4XNnz/+PL4Wy1Kzja+3vwHfHrOsotduBxKljxk1ivp/Bz7vK9BVdAjPJP80f
         e3V4NtvkiCPTGw6lYgpFKLL98Xn84EZGB/TMAAfc8198d1REzysA6f5yiKh8Ux422PHu
         PHzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D39R8s1I;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id nh7si10369109ejb.155.2020.06.23.03.51.36;
        Tue, 23 Jun 2020 03:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D39R8s1I;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732353AbgFWKvf (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 23 Jun 2020 06:51:35 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44046 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732376AbgFWKvd (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 23 Jun 2020 06:51:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592909491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oZQ1iXj/Bq+YaBfUtLyYjvldkQlNyk/VkfsOF9orImA=;
        b=D39R8s1IUWCty/X4Twljt9sshDY57KLhQKF+YJm4v/N88MOGD7JR4oelXthWbVyVRem9aq
        N030MGVXO8GOF4kXnOkZxJM8kG4MJAgRRYagPjS/sIrBku89sOPGicy2Oz1WGThenH2GEZ
        2o3t24C44kBgv6NAgk1aHLcajR8Pu/I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-ap_0rFKiMhSWTzLkyCz2QQ-1; Tue, 23 Jun 2020 06:51:30 -0400
X-MC-Unique: ap_0rFKiMhSWTzLkyCz2QQ-1
Received: by mail-wm1-f72.google.com with SMTP id h6so3452117wmb.7
        for <kvm@vger.kernel.org>; Tue, 23 Jun 2020 03:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oZQ1iXj/Bq+YaBfUtLyYjvldkQlNyk/VkfsOF9orImA=;
        b=lDM2Q5VSywL1veIQKQ5ZTJOhKVgH/MUQ/PQysSPEJ5/L6ImjmmO978II6qimLDqpKh
         J2hXJXUBb7f9tEdCw30fYUEsyS0GzmJmTnwRATiTkZsNhdIBhlQshIMMpl3LFHw1PwqP
         4BJ4CPapKknmxpeWTEwOvGP3OqMKBqjhACK0R3gkU1VR/zVlN0ydVyqTNTw27x/BuJJ+
         uJAW13S2Wo8gtcRNTMBnOHfJGNOs8VfCdZ7roRPgk/M0gKcnbmDNek1F5Jc+nsJZQZOz
         6u26qUsJCPRrRZMYPaFES4x93RbQKNKBbrjsrjwYepRADfPiDYUCWzAyRPAG4DxAnRbF
         Ot4A==
X-Gm-Message-State: AOAM531cKmZhVqndd6c6oQJn4xhF54vLBBWKSl5GDs/vLyw9e2iXSvWl
        dxmTEv8wRx/GJsRzr9jjlUdw1N2ivL0CQVBMizL+07fhcBuEkrZzQgmg7VXQmVRk+U6ADSjmg8k
        K8nPZtTyQr5tu
X-Received: by 2002:adf:e50a:: with SMTP id j10mr26012265wrm.71.1592909489435;
        Tue, 23 Jun 2020 03:51:29 -0700 (PDT)
X-Received: by 2002:adf:e50a:: with SMTP id j10mr26012236wrm.71.1592909489238;
        Tue, 23 Jun 2020 03:51:29 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net. [83.51.162.1])
        by smtp.gmail.com with ESMTPSA id v4sm6965597wro.26.2020.06.23.03.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 03:51:28 -0700 (PDT)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        David Hildenbrand <david@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Richard Henderson <rth@twiddle.net>, qemu-s390x@nongnu.org,
        David Gibson <david@gibson.dropbear.id.au>,
        Peter Maydell <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
        Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Thomas Huth <thuth@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH 6/7] target/i386/kvm: Simplify kvm_get_mce_cap_supported()
Date:   Tue, 23 Jun 2020 12:50:51 +0200
Message-Id: <20200623105052.1700-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200623105052.1700-1-philmd@redhat.com>
References: <20200623105052.1700-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: /lxMH6mXuaJ6

As the MCE supported capabilities should be the same for
all VMs, it is safe to directly use the global kvm_state.
Remove the unnecessary KVMState* argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/kvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 19d3db657a..626cb04d88 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -536,7 +536,7 @@ uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index)
     }
 }
 
-static int kvm_get_mce_cap_supported(KVMState *s, uint64_t *mce_cap,
+static int kvm_get_mce_cap_supported(uint64_t *mce_cap,
                                      int *max_banks)
 {
     int r;
@@ -544,7 +544,7 @@ static int kvm_get_mce_cap_supported(KVMState *s, uint64_t *mce_cap,
     r = kvm_check_extension(KVM_CAP_MCE);
     if (r > 0) {
         *max_banks = r;
-        return kvm_ioctl(s, KVM_X86_GET_MCE_CAP_SUPPORTED, mce_cap);
+        return kvm_ioctl(kvm_state, KVM_X86_GET_MCE_CAP_SUPPORTED, mce_cap);
     }
     return -ENOSYS;
 }
@@ -1707,7 +1707,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
         int banks;
         int ret;
 
-        ret = kvm_get_mce_cap_supported(cs->kvm_state, &mcg_cap, &banks);
+        ret = kvm_get_mce_cap_supported(&mcg_cap, &banks);
         if (ret < 0) {
             fprintf(stderr, "kvm_get_mce_cap_supported: %s", strerror(-ret));
             return ret;
-- 
2.21.3
