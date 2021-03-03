Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5583815lfg;
        Wed, 3 Mar 2021 10:32:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwahp5P9mM9+64Qf0rG1DVwfdkw3KaDW7JmMhHzo46LQnDSM4nhKJtZafxNLqRY6e7AdE2q
X-Received: by 2002:a92:c567:: with SMTP id b7mr563277ilj.25.1614796349894;
        Wed, 03 Mar 2021 10:32:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614796349; cv=none;
        d=google.com; s=arc-20160816;
        b=kEPQV4IbNsXAXjuZ6fWXu7DKBuuR/OJDSYMGnFJ74ZVQJRpF9is0T5Tdkquizceqac
         VM/1AX/JvzMWAXpogZLf+/bHpREAyFngtZzJxsibXGqYKPj4YCj6LkFhNvVf7EpumBvG
         qvc2cUo3PHzfsChFp1QDVpVFsxkQSwlXCARmm0s9qZImAEexqHl4iC71AQbaJ93rLujW
         ObjvDeTn/26ZLBlm6HviDUSbHCzGp8fFiedSa72/95fGZeQhPJkW5h4RDlpBZJFaFvFm
         UHEDHYwVQcftINl8NgZYZeFyFBH/m+avNi+vv3Efl/G7sK2vQCIgWDcZDuseuwhXNG+0
         saQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ozgu7uGJ7L5oIFikBv6nOOwVLHj62DaXoZ2b5Z4gqKA=;
        b=AGrns5efyfvk0t7n/grS3kUP0pqapKOVLSBH+T4pVT4cScqEA4WZucSi81j4n5V3On
         OYNV/ocovacMZRpnL+C2fBM+YzrenyoW4hfpWLwDc45hCcrgrmLwCKu5TD3+7aAd7cL7
         JsiEybKQpSBQyrOSMgsArwjdlJniPVz0T8VZxWv8a9ki7oqJlRasrsdS+LUIne9YbfcH
         O95uziC8Krkz4Ya+vdQVphuWVaYdzJdqCex6I+iF2ovVesiqsJ1mxPYawmXZhktqu/au
         okILKWeR9MnTajGcCpelOXgTUqalZU3cLvZ5lr0b8EOp+xkYxx0/W2Ar2m3aHP+u+NuC
         UC1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Sx4UNyG5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si22828065ilh.81.2021.03.03.10.32.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:32:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Sx4UNyG5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHWIP-0003VF-4u
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAc-0007tI-4G
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:24:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAa-000129-Nh
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ozgu7uGJ7L5oIFikBv6nOOwVLHj62DaXoZ2b5Z4gqKA=;
 b=Sx4UNyG5H3PLsXw/TiwykEEwG2tL0087EuORdJNZnAQT1tBJtTH/68kTxP1vrsPvIXAQT3
 K4abWOxu5CezB9rbtvj8wAmgmwMSKrArMy/W2y+U6Q9qo8wM0Zo5g7wyAg1vQNASLqQmp+
 e3DqSdvzx8txVcJ924zGzOETYHdH99Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-AiaBvEytPc2PwvufpUob7A-1; Wed, 03 Mar 2021 13:24:20 -0500
X-MC-Unique: AiaBvEytPc2PwvufpUob7A-1
Received: by mail-wr1-f69.google.com with SMTP id e13so13135146wrg.4
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 10:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ozgu7uGJ7L5oIFikBv6nOOwVLHj62DaXoZ2b5Z4gqKA=;
 b=ZmOwqojO39MAKDcGN2MNeRQSd7ISsc0dnJ121fnH18pGgiezAm1epnM5TwL2OqmFKs
 ivLcznp5woG82+syEaJpqEgJJt+qjhx32GhRiuIGrPLGJy03bnAAoO8rZONjEnqFWexv
 GOCVavoDKSUOHXilmpw+tDsSWBqqWUsU/1yJNgAMrnZHrJf4Adhaz1OTwXKBMOBTZrKI
 xk9T/r1I/3a381F4fzLP0402naM8jmErcnilJPFezkOwSP969/XM8yI+SbK1vOOTk68N
 Oi2tzIYfNshUsG7I8EHwEUd5cFo/ghUvEBCU93Il3xiyh36LJW0YCloPsAjouqRNAXO9
 GECg==
X-Gm-Message-State: AOAM530vasGqd1ijaQVPEC/lOx6MrJVNlxV4XhvObZc6392nJsM8VSdd
 jV/mS6hnOzdMVXxC9QNt8A8J0Q2f/oLYN5Ro2FewzIzSXJddCt/yWZZvTnO6nHuvYRh5m9VFXYp
 bcf5CQBP6TPjU
X-Received: by 2002:a1c:2403:: with SMTP id k3mr290737wmk.130.1614795858909;
 Wed, 03 Mar 2021 10:24:18 -0800 (PST)
X-Received: by 2002:a1c:2403:: with SMTP id k3mr290721wmk.130.1614795858585;
 Wed, 03 Mar 2021 10:24:18 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j12sm23071093wrt.27.2021.03.03.10.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:24:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 18/19] accel/hvf: Declare and allocate AccelvCPUState
 struct
Date: Wed,  3 Mar 2021 19:22:18 +0100
Message-Id: <20210303182219.1631042-19-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PgfTXzCPjhdF

In preparation of moving HVF-specific fields from CPUState
to the accelerator-specific AccelvCPUState structure, first
declare it empty and allocate it. This will make the following
commits easier to review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/hvf/hvf-i386.h | 3 +++
 target/i386/hvf/hvf.c      | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index 59cfca8875e..1f12eb647a0 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -51,6 +51,9 @@ struct HVFState {
 };
 extern HVFState *hvf_state;
 
+struct AccelvCPUState {
+};
+
 void hvf_set_phys_mem(MemoryRegionSection *, bool);
 void hvf_handle_io(CPUArchState *, uint16_t, void *, int, int, int);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index effee39ee9b..342659f1e15 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -451,6 +451,7 @@ void hvf_vcpu_destroy(CPUState *cpu)
     hv_return_t ret = hv_vcpu_destroy((hv_vcpuid_t)cpu->hvf_fd);
     g_free(env->hvf_mmio_buf);
     assert_hvf_ok(ret);
+    g_free(cpu->accel_vcpu);
 }
 
 static void dummy_signal(int sig)
@@ -534,9 +535,10 @@ int hvf_init_vcpu(CPUState *cpu)
     }
 
     r = hv_vcpu_create(&hvf_fd, HV_VCPU_DEFAULT);
-    cpu->vcpu_dirty = true;
     assert_hvf_ok(r);
+    cpu->accel_vcpu = g_new(struct AccelvCPUState, 1);
     cpu->hvf_fd = (int)hvf_fd
+    cpu->vcpu_dirty = true;
 
     if (hv_vmx_read_capability(HV_VMX_CAP_PINBASED,
         &hvf_state->hvf_caps->vmx_cap_pinbased)) {
-- 
2.26.2

