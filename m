Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp580674lfb;
        Wed, 20 May 2020 06:29:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys4H/O92Ig/OF2gfj8+HJdoW4JOoPs4jPTLLzQ2IDUMjHGVqWJNT5Ny/Dv2Fe5WAr85FLa
X-Received: by 2002:ac8:1e16:: with SMTP id n22mr5278552qtl.78.1589981358680;
        Wed, 20 May 2020 06:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981358; cv=none;
        d=google.com; s=arc-20160816;
        b=v122maSyFhYNyHu+MduuvKoJ6Bc//RK5RIfiJtQDtpZMqQstfEQUvJ+VHXzOYa0rx7
         nv5Pq7yLMj1BJ4LHOuG4tc4S10GeTOIOBjTfebL/UKTDlrIru9F910ifcARXEqoWkHHN
         9sy1cn/jO086f/f5X8Vq9ZhdtWvuA921pJXocISZFBzxSziF8Fl/ney7pFaak9ZovBo7
         l5cgucbS/YNfJirL9cVUv64DfOuccps5V5ho9TqnTmR2Bz3chWCXKLxDYDUhRtXdt1v1
         kXZd7PBYXOGrKR8shD4iWwwkGPBmcVqWramjcXWBgyF2rs2aSuA4C+LlNzTDHGd9zd/p
         yHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=DhTu4SHuEE+qnNe/cas8B3sShJ0o08ypXNC4O0JdhEc=;
        b=HXcvt9r5foLKKVlLcQwW1AeGUaB+D8bADkVXKDQ4z4ZF38OhqobqyYnO+N75lyOQ3B
         jKHbrz3hOQJqCLCpZfl3wuDCtot2tSjSRk3uc1b87j/8AC/g8jw1FTiFf1y2ZejuhEbE
         P5Idjc402kzg8XjKk55v9igXiSodXVMtF1uftIIFqywRlPlK07MnCmez1m0rzzB62XXt
         n3Uan8HrMZHnx13Ly0SWgiXLqdLqML3tN86uQqXx7xPNsIHsiDrGHJBw2kr1z5Bv8Hk4
         0mAsPJcy+SyYCkNiSAsyY8jmXJ6iW/hvC2887wNx8UsX7u8UWHF+EFIiawxGQmwO1vJ2
         PmUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a8knkYXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14si1610787qth.54.2020.05.20.06.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a8knkYXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOmc-0003RC-3P
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOeM-0002Sg-Dx
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:46 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48924
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOeJ-0000N9-1f
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=DhTu4SHuEE+qnNe/cas8B3sShJ0o08ypXNC4O0JdhEc=;
 b=a8knkYXH8WEjgk1RHmXavmagjQ+g2x80EHTucRDTG6YkwfmUw0l4VKrRR3/4KTCiMjsUNx
 plPvBHSXGH302vDo3kQXYjOiGwD4ogI9SpGWCkjk3TVFF7GH9QJuBjeguKfAAe6D8d0pOY
 6aNBpCZOtQyB8PO4wGpugp3uyUU7iFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-LJnAUd0KMz--apsdEF2McA-1; Wed, 20 May 2020 09:20:37 -0400
X-MC-Unique: LJnAUd0KMz--apsdEF2McA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EC98EC1A7;
 Wed, 20 May 2020 13:20:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B00A6EA22;
 Wed, 20 May 2020 13:20:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 26D349D60; Wed, 20 May 2020 15:20:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/22] x86: coldplug cpus
Date: Wed, 20 May 2020 15:19:54 +0200
Message-Id: <20200520132003.9492-14-kraxel@redhat.com>
In-Reply-To: <20200520132003.9492-1-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NuAyzJZwLMh7

microvm needs this, for correct madt creation
(make sure enable bit is set).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/x86.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 7a3bc7ab6639..ac7a0a958781 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -118,6 +118,7 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
 
 void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     Object *cpu = NULL;
     Error *local_err = NULL;
 
@@ -126,6 +127,16 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
     object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
     object_property_set_bool(cpu, true, "realized", &local_err);
 
+    if (!mc->has_hotpluggable_cpus) {
+        /* coldplug cpu */
+        MachineState *ms = MACHINE(x86ms);
+        int i = 0;
+        while (ms->possible_cpus->cpus[i].arch_id != apic_id) {
+            i++;
+        }
+        ms->possible_cpus->cpus[i].cpu = cpu;
+    }
+
     object_unref(cpu);
     error_propagate(errp, local_err);
 }
-- 
2.18.4

