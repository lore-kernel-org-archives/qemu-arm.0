Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5582456lfg;
        Wed, 3 Mar 2021 10:30:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiddB4o1sSw7YUg/JDBmbEaRHjCpU6x/f3gK1K1yP25w9/IlXsUrD1HKd5hf8VqPmXJOL3
X-Received: by 2002:a05:6e02:1aa8:: with SMTP id l8mr525053ilv.251.1614796238215;
        Wed, 03 Mar 2021 10:30:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614796238; cv=none;
        d=google.com; s=arc-20160816;
        b=yxUXKn3NVK8Lu6UgsIsPw6pgGnScgj4Dwyw9buM+OQ3XM7R9mAsGQc4n4blit0E4zE
         HrrsfXifjiXk95c5A/PpedX1orBFeFbgwBc7rSfdjfpQwugcCBEUbLDnCclQzsidmYRk
         1uzuZfiJWq9z7AdaiI4XK8qcQHtqtY64NkEmf/rKr68WtwLeAMj8TkQDCTqmshjffgri
         brW8VKeHMVKb4kN7K7CHQ9guuVoQnB3fICyx08mjFWikjNbFbDZbYn0x1F0/rh45A/z3
         aa/WbL8iUtS8aGg508i8QLTEUhfThQDDlqHJKeQACp9bhl/wRrSskkrsT0iXqo1kLZ0r
         iXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gcmU4EwKx07Tin9L5OLokG4d2/Qw/rC/JleGsw0pME0=;
        b=nMJXJPvIFH7Y1ql5fY7cdfXibDBz5ujDSI3PJdfz2jHLEymdIhsZ2Kz6/QhXPrkT32
         LOwOai/qE0ZbAVVgN6/ZXpEhHC2ZEVxZrZnhSTiPuwDtcC9pFPY293H/nePbbobCGsvC
         zu+XHmwV/9OYJ566eJGLnkgBwJmAmFGrLhoblbYp9Wcgt0lUV9O+e8hpSYyZQFmTpPhH
         j4tjpdEexswDTnbc3V4RR+7tC7czku/IxmnMZ2cbJxkk4fhiFNWAU4qOspgl1j9ckOGw
         Qz+ZgIEGhoau+aTtZZC583es6IjtNNb/ijUl29gtknptO6mX6JLAGqmAB8P3Fve/TYgW
         RLuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="FAXPyh/v";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22si14550279jao.25.2021.03.03.10.30.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:30:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="FAXPyh/v";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHWGb-0008Mb-Fk
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:30:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9V-0005pM-V2
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW9T-0000fB-OH
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gcmU4EwKx07Tin9L5OLokG4d2/Qw/rC/JleGsw0pME0=;
 b=FAXPyh/vCevIQO1McSdA2XjF5P8wjrVJFe+kA+HKf+Nj1y64rktIJbe/opDifn4y59jMco
 Tgsgmz4n370aGOfM7Md3SBfWtpE1f7VqI52WtoIX14bRwzJuR7q/7dSmBrhSDo8onHGq0w
 IQi1dhIg3Ywj6B2zlrznaDoZurn/Fuo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-YQXUE0qmMkykkr9R8ZH0cg-1; Wed, 03 Mar 2021 13:23:13 -0500
X-MC-Unique: YQXUE0qmMkykkr9R8ZH0cg-1
Received: by mail-wm1-f70.google.com with SMTP id h20so2159928wmq.9
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gcmU4EwKx07Tin9L5OLokG4d2/Qw/rC/JleGsw0pME0=;
 b=Yju87NBsxeysrx1f9mav6yq/zdsl37JZ0ABtT/RUXxdtJS+CLMAqIT7LOYs2/ZCYHL
 D71BFmba/leHmewsea7CqXIHyYfZnViS16+LqIxDMQhCsx0WABdmqPEGZVw8fNDkhmrp
 Tfm23dRt5aZhNkvAdox/8dM2gF6gvCyjoKWp+6yqD5NAwUWfAmFc+J9/MZw3dz5sN+HL
 tCLALxHiMZS+1QB+5zGEGNO42pWpSo4IydSuaagqlM9UCchhGTvvbFoN62HXYJSAkHyo
 qaIbQwTInF51m/4fSWPV0ztoGt7byaSUqxTBFnbH7cvGvIPH1D1WIB/oX9DtwnGO3Y42
 3RwA==
X-Gm-Message-State: AOAM530LHjS2ezBGz1G/nCZdmI+aEYQ4VeULJmVMvMmmX3+Duc/EbgEP
 tWLQQ2MFOWeXx1Sbdp8fV/1xRCkqjmMHtoMQk1SnpqsNHYoKl4tOejMMGo2xBngHqMucOa7kiyB
 6ga++t7bFqyWhhBTzPw6Jfm1GSRDzx91M+JrQXaHDPrfYxkp/MVGMAjih41FSUdIj
X-Received: by 2002:adf:f512:: with SMTP id q18mr28690262wro.61.1614795792420; 
 Wed, 03 Mar 2021 10:23:12 -0800 (PST)
X-Received: by 2002:adf:f512:: with SMTP id q18mr28690224wro.61.1614795792253; 
 Wed, 03 Mar 2021 10:23:12 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l22sm34033345wrb.4.2021.03.03.10.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:23:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/19] accel/whpx: Use 'accel_vcpu' generic pointer
Date: Wed,  3 Mar 2021 19:22:08 +0100
Message-Id: <20210303182219.1631042-9-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VlbSoJxLmgCo

Instead of naming the HAX accelerator in WHPX, use the
'accel_vcpu' field which is meant for accelerators.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/whpx/whpx-all.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index f0b3266114d..56ec82076cc 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -177,7 +177,7 @@ struct WHPDispatch whp_dispatch;
 
 static whpx_vcpu *get_whpx_vcpu(CPUState *cpu)
 {
-    return (whpx_vcpu *)cpu->hax_vcpu;
+    return cpu->accel_vcpu;
 }
 
 static WHV_X64_SEGMENT_REGISTER whpx_seg_q2h(const SegmentCache *qs, int v86,
@@ -1439,7 +1439,7 @@ int whpx_init_vcpu(CPUState *cpu)
 
     vcpu->interruptable = true;
     cpu->vcpu_dirty = true;
-    cpu->hax_vcpu = (struct hax_vcpu_state *)vcpu;
+    cpu->accel_vcpu = vcpu;
     max_vcpu_index = max(max_vcpu_index, cpu->cpu_index);
     qemu_add_vm_change_state_handler(whpx_cpu_update_state, cpu->env_ptr);
 
@@ -1481,7 +1481,7 @@ void whpx_destroy_vcpu(CPUState *cpu)
 
     whp_dispatch.WHvDeleteVirtualProcessor(whpx->partition, cpu->cpu_index);
     whp_dispatch.WHvEmulatorDestroyEmulator(vcpu->emulator);
-    g_free(cpu->hax_vcpu);
+    g_free(cpu->accel_vcpu);
     return;
 }
 
-- 
2.26.2

