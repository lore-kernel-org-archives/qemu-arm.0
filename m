Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2391614lfa;
        Tue, 13 Oct 2020 16:06:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKBu4SLjsbFgnMpcdsQCo2Xr8bxw8VD7iMojP399+or7IV03P81UrPEs2+HIwtjslQHWAP
X-Received: by 2002:a25:1042:: with SMTP id 63mr2889128ybq.480.1602630395982;
        Tue, 13 Oct 2020 16:06:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602630395; cv=none;
        d=google.com; s=arc-20160816;
        b=Ar0dJngf9JOln4JrKFQcqHeLReEWUrp6EK99Qvz/kcRPHawIX7wDvgjqsPgAibKAsI
         onboWGQ+PPQHYW7lWLjqL55JSZe4jvvO5utYI5/VoV45bpImC423UhVFSA9OznMM1Che
         xowIBds7ynprDyWyj8WgICx7VuSw63ENoKiHrbATJpepA2zvTFs/NZHYHB8/ueVOzK+c
         51zfUTzquG8Aq6bf5Xw1DOBoPwt3+nnHVDwst3za+VtdcAcduLN/gUzeNDObSmrd8mMP
         A29EidzRp7z6u3SLfo8xFuOBvqSTkEXrUx3Vsm79s9gEwEmFXsaCwR/tg162zqDWEFwL
         rqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3m5u6RznFsKtqBBV59KVWcpK1ey1DAx8fco18NzU/lc=;
        b=v/dRrn1B7AEevSiijY9+bJB5QBIYfF4DQpfqOCmj3nhyhQ6d/bsFvrbrwpN9xUOypU
         UVkDXm7mUNEdm0nl4PKiig4NKua46y797SexEdDUVOwucZs9Qo/96yqN9zefdQWXqjXO
         +O5BHy3gZAk3mKWCtdTKM6Yp0jWQx1DG2PryMfRBT6nugugc2XuT4zyaQYRAeHkfeNDY
         S2vLwr0gwoJnnnTSOmm6mJrHTfv3kh6uv9zXTDi5WDmsJc257ey4CjsKxRShvsGoHtuC
         nkgD84KJuAYHor+7t0xg8mrqbkmSnY4R7K0OgPPM2quOHvdG4Ww3KHWuN3z1X8iP6MV+
         5Y+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Eyqh2A30;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si1341434ybk.130.2020.10.13.16.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 16:06:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Eyqh2A30;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSTNK-0006wl-KK
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 19:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kSTMV-0006Yc-Dt
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 19:05:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kSTMP-0003cE-VE
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 19:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602630333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3m5u6RznFsKtqBBV59KVWcpK1ey1DAx8fco18NzU/lc=;
 b=Eyqh2A308DywvqJ0Ji6mEuwi2gVAh4lsEWkbBx2Fuwqd3TDW0u3aPglH+45lb1h7SxG0H8
 LHfbTZGCFtBvgDXlXl/tNjY3yys3fpCrY9SjKs1lkEFPjZi7Qk885R+6NaH0SxBSY43DuT
 Vjdq6MUgb2ASxgsFNDmU+FGuEpU7vBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-lX_C_LU4OYSt0zi8ng3Fjg-1; Tue, 13 Oct 2020 19:05:31 -0400
X-MC-Unique: lX_C_LU4OYSt0zi8ng3Fjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D0EB56BE6;
 Tue, 13 Oct 2020 23:05:29 +0000 (UTC)
Received: from localhost (ovpn-66-44.rdu2.redhat.com [10.10.66.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 227BE76663;
 Tue, 13 Oct 2020 23:05:28 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] i386: Add default_version parameter to CPU version
 functions
Date: Tue, 13 Oct 2020 19:04:54 -0400
Message-Id: <20201013230457.150630-5-ehabkost@redhat.com>
In-Reply-To: <20201013230457.150630-1-ehabkost@redhat.com>
References: <20201013230457.150630-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Jiri Denemark <jdenemar@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p7Xju+Z6Jbpr

Currently, the functions that resolve CPU model versions
(x86_cpu_model_resolve_version(), x86_cpu_model_resolve_alias())
need a machine to be initialized first.  Get rid of this
requirement by making those functions get an explicit
default_version argument.

No behavior changes are introduced by this patch, as all callers
are being changed to use default_cpu_version as argument.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2c8dd3fa32..c78b2abfb8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4158,11 +4158,12 @@ static X86CPUVersion x86_cpu_model_last_version(const X86CPUModel *model)
 }
 
 /* Return the actual version being used for a specific CPU model */
-static X86CPUVersion x86_cpu_model_resolve_version(const X86CPUModel *model)
+static X86CPUVersion x86_cpu_model_resolve_version(const X86CPUModel *model,
+                                                   X86CPUVersion default_version)
 {
     X86CPUVersion v = model->version;
     if (v == CPU_VERSION_AUTO) {
-        v = default_cpu_version;
+        v = default_version;
     }
     if (v == CPU_VERSION_LATEST) {
         return x86_cpu_model_last_version(model);
@@ -4171,14 +4172,15 @@ static X86CPUVersion x86_cpu_model_resolve_version(const X86CPUModel *model)
 }
 
 /* Resolve CPU model alias to actual CPU model name */
-static char *x86_cpu_model_resolve_alias(const X86CPUModel *model)
+static char *x86_cpu_model_resolve_alias(const X86CPUModel *model,
+                                         X86CPUVersion default_version)
 {
     X86CPUVersion version;
 
     if (!model->is_alias) {
         return NULL;
     }
-    version = x86_cpu_model_resolve_version(model);
+    version = x86_cpu_model_resolve_version(model, default_version);
     if (version <= 0) {
         return NULL;
     }
@@ -5004,7 +5006,8 @@ static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
      * doesn't break compatibility with previous QEMU versions.
      */
     if (cc->model && default_cpu_version != CPU_VERSION_LEGACY) {
-        info->alias_of = x86_cpu_model_resolve_alias(cc->model);
+        info->alias_of = x86_cpu_model_resolve_alias(cc->model,
+                                                     default_cpu_version);
         info->has_alias_of = !!info->alias_of;
     }
 
@@ -5075,7 +5078,8 @@ static void x86_cpu_apply_props(X86CPU *cpu, PropValue *props)
 static void x86_cpu_apply_version_props(X86CPU *cpu, X86CPUModel *model)
 {
     const X86CPUVersionDefinition *vdef;
-    X86CPUVersion version = x86_cpu_model_resolve_version(model);
+    X86CPUVersion version = x86_cpu_model_resolve_version(model,
+                                                          default_cpu_version);
 
     if (version == CPU_VERSION_LEGACY) {
         return;
-- 
2.28.0

