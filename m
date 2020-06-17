Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp559707lfm;
        Wed, 17 Jun 2020 05:20:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYhfgDYq1ABL3mAMJWL8VfZRyoKYy67XzK0UDu7gbuc+KVibVNcATBZmVQYw5ItxmSXghn
X-Received: by 2002:a25:8603:: with SMTP id y3mr11724373ybk.407.1592396407315;
        Wed, 17 Jun 2020 05:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592396407; cv=none;
        d=google.com; s=arc-20160816;
        b=PekYANUDPxADgN5EC+HkL0MNJjxJA5Rp8mdvHGp6gAuBS1XY6KXtXDnl9dfrZ8w0X9
         yWnGaq5bidCwn961XLi/bynIegb+ZXfpvXv6Q+hnoUhygVvLoP5WEnjs3kD92Yw/TG5b
         bXEbH58yiYAtLi7UT5X+SZO7dlZPm47PtjXncoTZin7cDqD9zbDZBfd61hnI+PeBlxtQ
         nhFwVlmRfsBkJI5V90db157f3Y75+9chnEAKkWebe49eWsKU7XUhaStTo42fUBnlGoT+
         ehHtAg6lfx1ZwhTD4EB6VeCS5XRAfFzjw9L7zv5g0rfeXewSMBTo+FWFepB38MkfFpgH
         PRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=whoKVKOavAwBaxp5hl5i8pg9jmoJibFAMNjrEHt3EWE=;
        b=s4NjjcmlxZ9arA7mun9eq8k2jF2ueJlvRHnLJOXK1ut6UPo8MCMZ1wlJ3i8e3vB4jI
         lHWqkX4OWfK95pGPIKgoa/phq9z2lRdxrGEdA8ZWig+FuNH64dO7UooqJgNc4Hmt57NN
         V16PlaSo939j2dldY//iSogiMwCohBCXMmIzofeNuKP8inVP969xNJj8NB6zXNQZcB5K
         GaCy5ifZ6pwnmMKhmOyhgm99/Xw0Uotl40s2lV37hR40HgiMdQm9ne4z+kWNyjShyCEr
         m59+fshO6dXicRlfoc3VmiK4zEaSNOlYyFyw3udnQ8NLuu5aT1d9IgA8s2NVTxpRqslO
         C93w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YYnbcNDA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o139si19930764ybc.250.2020.06.17.05.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 05:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YYnbcNDA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlX30-000402-LN
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 08:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jlX2o-0003xF-Ok
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 08:19:54 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29739
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jlX2n-0000ss-2Q
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 08:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592396391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=whoKVKOavAwBaxp5hl5i8pg9jmoJibFAMNjrEHt3EWE=;
 b=YYnbcNDAW2WAXvIdm35lzF0fuvKwmaX5tTUKm+g5grE+7kH7tV6gntTFBS/miG22kwHjKj
 YNs67Q3NT+q6wggEcWMIjW1mmR2JlDryFkJvzEoEDljUoRNya9leyT1T1dvOjErbQKc4BS
 MkOZ7ZrjzNCdJp+PRwqmRHdmljOr54U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-gHP_WIxTPeC6JJ0c4lohgg-1; Wed, 17 Jun 2020 08:19:48 -0400
X-MC-Unique: gHP_WIxTPeC6JJ0c4lohgg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34EC81052502;
 Wed, 17 Jun 2020 12:19:47 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 533B460C80;
 Wed, 17 Jun 2020 12:19:45 +0000 (UTC)
Date: Wed, 17 Jun 2020 14:19:42 +0200
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: Core dump happened when starting a VM on arm64 server
Message-ID: <20200617121942.udtinijxcx373vc3@kamzik.brq.redhat.com>
References: <CAJc+Z1Eb815hroFPY+9Ai_9hh=+eje+X2ENtGj9XA+_F0XUPqg@mail.gmail.com>
 <20200611091419.e2rfcurztmlajlwr@kamzik.brq.redhat.com>
 <a6740274-1bd7-460c-7011-244cdf2fc945@redhat.com>
 <e47664d7-a13e-7f60-975d-97f085036067@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e47664d7-a13e-7f60-975d-97f085036067@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 02:02:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s+oJ1RhcDWvt

On Wed, Jun 17, 2020 at 12:32:09PM +0200, Philippe Mathieu-Daudé wrote:
> On 6/17/20 10:23 AM, Philippe Mathieu-Daudé wrote:
> > On 6/11/20 11:14 AM, Andrew Jones wrote:
> >> On Thu, Jun 11, 2020 at 04:46:45PM +0800, Haibo Xu wrote:
> >>> Hi,
> >>>
> >>> I met a qemu core dump issue when starting a VM with cpu feature
> >>> "pmu=on" on an arm server.
> >>> The commands to start the machine is:
> >>>
> >>>   ./qemu-system-aarch64 \
> >>>            -cpu host,pmu=on -M virt,accel=kvm,gic-version=3 -nographic
> >>> -m 2048M \
> >>>            -kernel ./Image \
> >>>            -initrd /boot/initrd.img-5.6.0-rc2+ \
> >>>            -append "root=/dev/vda rw console=ttyAMA0" -nodefaults -serial stdio\
> >>>            -drive if=none,file=./xenial.rootfs.ext4,id=hd0,format=raw \
> >>>            -device virtio-blk-device,drive=hd0
> >>>
> >>>
> >>> And here is the stack dump:
> >>>
> >>>  Core was generated by `./qemu-system-aarch64 -cpu host,pmu=on -M
> >>> virt,accel=kvm,gic-version=3 -nograph'.
> >>>  Program terminated with signal SIGSEGV, Segmentation fault.
> >>>  #0  kvm_ioctl (s=0x0, type=type@entry=44547) at
> >>
> >> s=0x0 means cpu->kvm_state is NULL
> >>
> >>> The root cause is in the arm_get_pmu() operation which was introduced
> >>> in ae502508f83.
> >>
> >> Actually the root cause is d70c996df23f ("target/arm/kvm: Use
> >> CPUState::kvm_state in kvm_arm_pmu_supported()"). ae502508f83 used
> >> the machine kvm_state, not the cpu kvm_state, and that allows pmu=on
> >> to work. d70c996df23f changed that saying that "KVMState is already
> >> accessible via CPUState::kvm_state, use it.", but I'm not sure why,
> >> since kvm_init_vcpu() doesn't run until the vcpu thread is created.
> >>
> >> Philippe?
> > 
> > Sorry for some reason I missed this email. I'll look at this today.
> 
> Quick reproducer:
> 
> $ qemu-system-aarch64 -cpu host,pmu=on -M virt,accel=kvm,gic-version=3
> Segmentation fault (core dumped)
> 
> Eduardo, I thought we had a 'machine' qtest testing for various
> combination of properties, but I can't find it, do you remember?
> Or maybe it was Thomas? Or Markus? =)

For arm cpu properties we have tests/qtest/arm-cpu-features. We can
add a regression test for this and other properties there. I just
tried it. I needed to add a new macro (see below), but otherwise it
worked to reproduce the problem.

Thanks,
drew

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 469217367661..d6bdbc171893 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -159,16 +159,35 @@ static bool resp_get_feature(QDict *resp, const char *feature)
     qobject_unref(_resp);                                              \
 })
 
-#define assert_feature(qts, cpu_type, feature, expected_value)         \
+#define resp_assert_feature(resp, feature, expected_value)             \
 ({                                                                     \
-    QDict *_resp, *_props;                                             \
+    QDict *_props;                                                     \
                                                                        \
-    _resp = do_query_no_props(qts, cpu_type);                          \
     g_assert(_resp);                                                   \
     g_assert(resp_has_props(_resp));                                   \
     _props = resp_get_props(_resp);                                    \
     g_assert(qdict_get(_props, feature));                              \
     g_assert(qdict_get_bool(_props, feature) == (expected_value));     \
+})
+
+#define assert_feature(qts, cpu_type, feature, expected_value)         \
+({                                                                     \
+    QDict *_resp;                                                      \
+                                                                       \
+    _resp = do_query_no_props(qts, cpu_type);                          \
+    g_assert(_resp);                                                   \
+    resp_assert_feature(_resp, feature, expected_value);               \
+    qobject_unref(_resp);                                              \
+})
+
+#define assert_set_feature(qts, cpu_type, feature, value)              \
+({                                                                     \
+    const char *_fmt = (value) ? "{ %s: true }" : "{ %s: false }";     \
+    QDict *_resp;                                                      \
+                                                                       \
+    _resp = do_query(qts, cpu_type, _fmt, feature);                    \
+    g_assert(_resp);                                                   \
+    resp_assert_feature(_resp, feature, value);                        \
     qobject_unref(_resp);                                              \
 })
 
@@ -464,7 +483,10 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         return;
     }
 
+    /* Enabling and disabling kvm-no-adjvtime should always work. */
     assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
+    assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
+    assert_set_feature(qts, "host", "kvm-no-adjvtime", false);
 
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
         bool kvm_supports_sve;
@@ -475,7 +497,11 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         char *error;
 
         assert_has_feature_enabled(qts, "host", "aarch64");
+
+        /* Enabling and disabling pmu should always work. */
         assert_has_feature_enabled(qts, "host", "pmu");
+        assert_set_feature(qts, "host", "pmu", true);
+        assert_set_feature(qts, "host", "pmu", false);
 
         assert_error(qts, "cortex-a15",
             "We cannot guarantee the CPU type 'cortex-a15' works "

