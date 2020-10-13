Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2391971lfa;
        Tue, 13 Oct 2020 16:07:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyt9nW2w2ljhdRrvzAC11wXecLFwxjFeG1ZLht1pLESLbShV6r1xk0nAMlbMg5T/L0tQjtg
X-Received: by 2002:a25:2a04:: with SMTP id q4mr3400122ybq.186.1602630428418;
        Tue, 13 Oct 2020 16:07:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602630428; cv=none;
        d=google.com; s=arc-20160816;
        b=k2MWPA06+ztvuaRwN8v8dkMjDQ1YLHwbsxrfOpAqKwMBtpIGk3v4R8lhFRY5uIfaGK
         R/lCOI1dTjTg7XTLnMGo23TVbs0fFfb1/iuzoaqhwrx0m1GLyD4jqGbAmRXqiSOWaDWq
         S3FUk5UKczt8rA/SzysTFfzRaGv/j2Vt25vbtBEWAeH9hMqXgrDoExvocdBn1/r4GoBI
         suZNdK2X/TduO25PKYkIQJ9NLA5oM00Z9+scLY/slu8jJ3cIrN29czku6IpoAayR5FUM
         qd1iFQkHeoRjJy4ZZnFy7e5QOc2PlKMcqh5iJKtshe4zrURsgQkKXy84qP+42AIzfxgg
         z71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=orSIgJvDF9xxjYGHgN+WlMbsHDPWVWiupoDqov+tdLA=;
        b=wTSEMFHGrTEoDN4eQiMVnTfa9gJctzGftqGchVSbq3O+7aa3H+aQzWpXivonCBJ+/H
         kJLe5e/2AWW4rGMzXqFFbXYrmqeOaW/KLR7n/f4r4nJn1eb/xwAENaHmrH1Xq8kyPfzm
         mY6GUjqLyjxcEwEcyR66jcoHEnqyM8DTRvhg60rFfnPd1fesqzCmvq28Au2tRLxMQuW+
         UwYblQ3OBmEA0MLNMiwY8pKdK3zK8GsW/x9JouID+02237rl5tJf27BuV+V80DoKzKBF
         IhHNr4MeJIDT1+cpjpoKx73l2nVe/z9r1a1YctDcmdrqpjhYiCfl2i73b2SaEYPMgjy2
         j60g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YKv1ewQz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 139si1247733ybd.368.2020.10.13.16.07.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 16:07:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YKv1ewQz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSTNr-0007TS-QN
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 19:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kSTMa-0006gX-AY
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 19:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kSTMX-0003hq-K9
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 19:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602630341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orSIgJvDF9xxjYGHgN+WlMbsHDPWVWiupoDqov+tdLA=;
 b=YKv1ewQzvPJYfCJ45o75HNCzIaWzdxlX1wMzo3C/MAsMyfvFckhD8ypPHP/ULBCxv3bDf0
 kNAcLxjx740c63+KXRgkMGkhfJy/JQzHLUyzbBSG2T2JA+IopmRIxBLRqjXQhk75JcWlqj
 juWUyjO9UhXOHyB/y0+eIY+oxYmVAS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-xFOAd2c9P8-16GGMaZ4lVg-1; Tue, 13 Oct 2020 19:05:40 -0400
X-MC-Unique: xFOAd2c9P8-16GGMaZ4lVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEAFB80B71A;
 Tue, 13 Oct 2020 23:05:37 +0000 (UTC)
Received: from localhost (ovpn-66-44.rdu2.redhat.com [10.10.66.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C9075C1A3;
 Tue, 13 Oct 2020 23:05:30 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] i386: Wrap QMP code in !CONFIG_USER_ONLY
Date: Tue, 13 Oct 2020 19:04:55 -0400
Message-Id: <20201013230457.150630-6-ehabkost@redhat.com>
In-Reply-To: <20201013230457.150630-1-ehabkost@redhat.com>
References: <20201013230457.150630-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-TUID: blFcmg7gW3QM

The QMP code was never called by *-user, and we will add
machine-type-specific code there, so add #ifdefs to make it safe.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index c78b2abfb8..bf4b4a4812 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4171,6 +4171,7 @@ static X86CPUVersion x86_cpu_model_resolve_version(const X86CPUModel *model,
     return v;
 }
 
+#ifndef CONFIG_USER_ONLY
 /* Resolve CPU model alias to actual CPU model name */
 static char *x86_cpu_model_resolve_alias(const X86CPUModel *model,
                                          X86CPUVersion default_version)
@@ -4186,6 +4187,7 @@ static char *x86_cpu_model_resolve_alias(const X86CPUModel *model,
     }
     return x86_cpu_versioned_model_name(model->cpudef, version);
 }
+#endif
 
 void x86_cpu_change_kvm_default(const char *prop, const char *value)
 {
@@ -4838,6 +4840,7 @@ static void x86_cpu_get_unavailable_features(Object *obj, Visitor *v,
     visit_type_strList(v, "unavailable-features", &result, errp);
 }
 
+#ifndef CONFIG_USER_ONLY
 /* Check for missing features that may prevent the CPU class from
  * running using the current machine and accelerator.
  */
@@ -4876,6 +4879,7 @@ static void x86_cpu_class_check_missing_features(X86CPUClass *xcc,
 
     object_unref(OBJECT(xc));
 }
+#endif
 
 /* Print all cpuid feature names in featureset
  */
@@ -4985,6 +4989,7 @@ void x86_cpu_list(void)
     g_list_free(names);
 }
 
+#ifndef CONFIG_USER_ONLY
 static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
@@ -5025,6 +5030,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
     g_slist_free(list);
     return cpu_list;
 }
+#endif
 
 static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
                                                    bool migratable_only)
-- 
2.28.0

