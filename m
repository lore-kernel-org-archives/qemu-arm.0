Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2392899lfa;
        Tue, 13 Oct 2020 16:08:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDSd4jIbhK5Sf9oU9Ap49ZBcKOZhC7+nxUAf2sip8V0ZPTfgc/2ZVeRF6P16kbfdF1Av0G
X-Received: by 2002:a25:c68b:: with SMTP id k133mr3404904ybf.11.1602630519031;
        Tue, 13 Oct 2020 16:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602630519; cv=none;
        d=google.com; s=arc-20160816;
        b=dHXjAnpRXVWpJp4Psq6s8CodMYcZbUU0fV6tmJKygBQqSRqfw/+F3Y4ULI4C6Zkldd
         39sOFuvVXEAg6wyBBR0xQPa0p8/D7wOZRSf82o6FVRpAxgWCALYWVVcjgKob//vXNz/X
         zBwpmUz2fdkCU9Lo+z6A3e4SeLao5SS79l8zfCrFTBBlnuzJL/N70MkTA4ne3UaOoQFx
         0Z56+w1qhJaO/oUbsDvNmqDj3ZPmcd5yUQflBIIyTATnw1o8u8zdRwd5IpdeiA9nS7OZ
         QcRwf8p69WQxXHu6+nCKupw2Vryy81BjZn3S/o+BLm3d/SPvHJv7SZmjZP0kq3/M4OgH
         wsDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/NUlmtHh+wg3YX9I3nJkvoDiBlyD3K/LW9vdgi90W2E=;
        b=FB1I++S9V9wLfE2KOFXZPF11R8nj8sNCczeptU1OR/Dn8TjoOrGAeSr88RPd8QT2Gk
         N4mNy5ZpSu35naYrk/CPQz0ov6Lo955BCL1ihmqitchVw6cDbpPMuW7Zyp5n9EDt+qiM
         Ab77ChHhhXHGuJt19CEreVEsbTlwB7OHtQ/OroJzkImPk5KDujedCo8sl/eWtPk0yWxF
         zZ86FenenT2DF8DPOZuCehBLTh2tMHqoHO44DitXEPUhr8+CUQ2pKfGC6vISu2qMt6Ap
         vuZy0cPanQRACDuzasYg9ZTnsFhhlN6dQRIf930qoLzUPxweKODfihrAH73bosS7iLPu
         lMYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ud8hNeM+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si1407717ybk.465.2020.10.13.16.08.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 16:08:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ud8hNeM+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSTPK-0000lo-Ch
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 19:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kSTMI-0006S4-K0
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 19:05:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kSTMF-0003a7-82
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 19:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602630325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NUlmtHh+wg3YX9I3nJkvoDiBlyD3K/LW9vdgi90W2E=;
 b=Ud8hNeM+k/GXOwQSViN3iVlgQxRnLrDgBpMQlsKPoEsXrZdKNHKydirbh3uG+4/Dq2j03U
 QRJRwxX7ErINhFcrmMxSH3F/BubFkU2SwMRTmE3+G3qvLWnIRap9DtV68ni3ZWjjxkfKqe
 CSb4dnFWwXJ89X+xy5qCr9Ia5Dar7pY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-LfAEKcXSPtSzUnvCpPx-Ig-1; Tue, 13 Oct 2020 19:05:22 -0400
X-MC-Unique: LfAEKcXSPtSzUnvCpPx-Ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2039801FDA;
 Tue, 13 Oct 2020 23:05:19 +0000 (UTC)
Received: from localhost (ovpn-66-44.rdu2.redhat.com [10.10.66.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 993DF55790;
 Tue, 13 Oct 2020 23:05:19 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] i386: Add X86CPUModel.alias_of field
Date: Tue, 13 Oct 2020 19:04:52 -0400
Message-Id: <20201013230457.150630-3-ehabkost@redhat.com>
In-Reply-To: <20201013230457.150630-1-ehabkost@redhat.com>
References: <20201013230457.150630-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 19:05:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FgLqFkhwUDnZ

Instead of calling x86_cpu_class_get_alias_of(), just save the
actual CPU model name in X86CPUModel and use it in `-cpu help`.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9eafbe3690..43e633ddd3 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1647,6 +1647,12 @@ struct X86CPUModel {
      * This matters only for "-cpu help" and query-cpu-definitions
      */
     bool is_alias;
+    /*
+     * Valid only if is_alias is true.
+     * If NULL, actual alias depend on machine type.
+     * If not NULL, name of actual CPU model this is an alias to.
+     */
+    const char *alias_of;
 };
 
 /* Get full model name for CPU version */
@@ -4927,14 +4933,13 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
     X86CPUClass *cc = X86_CPU_CLASS(oc);
     g_autofree char *name = x86_cpu_class_get_model_name(cc);
     g_autofree char *desc = g_strdup(cc->model_description);
-    g_autofree char *alias_of = x86_cpu_class_get_alias_of(cc);
     g_autofree char *model_id = x86_cpu_class_get_model_id(cc);
 
-    if (!desc && alias_of) {
-        if (cc->model && cc->model->version == CPU_VERSION_AUTO) {
+    if (!desc && cc->model && cc->model->is_alias) {
+        if (!cc->model->alias_of) {
             desc = g_strdup("(alias configured by machine type)");
         } else {
-            desc = g_strdup_printf("(alias of %s)", alias_of);
+            desc = g_strdup_printf("(alias of %s)", cc->model->alias_of);
         }
     }
     if (!desc && cc->model && cc->model->note) {
@@ -5418,6 +5423,7 @@ static void x86_register_cpudef_types(X86CPUDefinition *def)
     m->cpudef = def;
     m->version = CPU_VERSION_AUTO;
     m->is_alias = true;
+    m->alias_of = NULL; /* depends on machine type */
     x86_register_cpu_model_type(def->name, m);
 
     /* Versioned models: */
@@ -5436,6 +5442,7 @@ static void x86_register_cpudef_types(X86CPUDefinition *def)
             am->cpudef = def;
             am->version = vdef->version;
             am->is_alias = true;
+            am->alias_of = g_strdup(name);
             x86_register_cpu_model_type(vdef->alias, am);
         }
     }
-- 
2.28.0

