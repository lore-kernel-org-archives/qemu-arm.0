Received: by 2002:a05:6214:9cd:0:0:0:0 with SMTP id dp13csp1649670qvb;
        Thu, 15 Apr 2021 05:33:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo+n6QtYrkGKFCRkDuO9OPA8Kfzbcag/ieyBJtZKrIDSVlsW/T6Qo/rM2SV+NPJgRdGZ6o
X-Received: by 2002:a67:f758:: with SMTP id w24mr1677091vso.28.1618489982319;
        Thu, 15 Apr 2021 05:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618489982; cv=none;
        d=google.com; s=arc-20160816;
        b=N/4Wy2Sdb6orLV+7srGyR5kJhEB983aNB6M/uzpw+behUug6O57S2LFYwCHyytXrPS
         vFOTbuxdQkGV/iI1RLhl5o2CVW723X+8KVWru+ciGOTOxcAP9nidwjVdzVDAcBUFzZtv
         KlLMmMWkTU5QTnqEq/YSAV/dL3ChZkn9w6/YnV3oxbwM/WYFuf+RWYIbYX0E4EsClsJj
         m9CpLciBXesAx02yrTK7PQkO9r1lgGgA9b2tlW5XcoMssDGO75b+U1uuWFtfaretqUL3
         l9MMv/lDkRHxAZZcPXH/B1umORz75hRhP/7vr+cZr2UWt51nkPEph3+wZEIplKunSKd8
         cCpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gXF3I2HiTrXmapky2sFUIdU4HSA6Nendcs7h4VxHKIw=;
        b=l1Nm5uW2LoNXJzEH/E3vPu0FVRpb3JFI9eGn3jYkcp8PjQ09QPSKQpbTuviWwKqGmJ
         j6hp6owVg69izQLtgRAIn8yD0/5sHI/NJmnoNhMnoWZT2UAf/qWsXt3KHRr7de0VnNU7
         3eKag1TaOSQDaxXgkBGC5lbUEsHgQ9oesXTX4ImWCFzCzSVXYtDrjB2l/q6/XclAa3OS
         vmoEdlzplOc+zQjlU/OP7qOiXw8hoRp0O8h90ucGbQYssqc0YW6yCtPx0rJc+trihvav
         jMuJP3Oh97YE90hDxrwR8XI7RrWzzRrUifPyz945+F8yB8G0Z53GWwywcc1EuyTE+oqY
         OP+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QO53Uo0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si1191824uae.148.2021.04.15.05.33.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 05:33:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QO53Uo0Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX1B7-0007cW-Lk
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 08:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX15N-000352-3Z
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 08:27:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX15I-00066y-1s
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 08:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618489619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXF3I2HiTrXmapky2sFUIdU4HSA6Nendcs7h4VxHKIw=;
 b=QO53Uo0Qxst3ihpSFgXhzVBh1Da8fSlmetQ7QIsGDfKJTA92X9XRfM2ronEZGCExdq4LB5
 ZSp+Ul4w9WYvubAza03mcXdi5w+OdU02QTscQYXYkmAnbpHhhkpp8u4RUrGhF2eWCxt0Bi
 P3f0anBqyDPYskN593thUUIr1H/FzJA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-zyLea9YnOFKlgkpdo14KPA-1; Thu, 15 Apr 2021 08:26:57 -0400
X-MC-Unique: zyLea9YnOFKlgkpdo14KPA-1
Received: by mail-wr1-f69.google.com with SMTP id
 t14-20020adff04e0000b0290103307c23e1so2688338wro.8
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 05:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gXF3I2HiTrXmapky2sFUIdU4HSA6Nendcs7h4VxHKIw=;
 b=dWVQKXV8MiBC92s6a2y2Ne6s3iG/ri5skooP8x4fvK7A8RcG4tOpHlM9NrFfIV7JTz
 GvMlEHBDeKzLXlydu//Aecwg0o9ugPhb+bdybElAaFiCgh553DJ14Up4rFRrx6QqCRDb
 c9hG38N7AMIgCXVcdZoLn6rKXN7txSyfA5CmljNMDAYV7GREbLq4cZktNRyfBIaHm5cP
 bWYkunpYQggH0wJ7ACKA2+2274Qg/KL0G1YNOAYWb+dNp2uQRfQSS58924nXbsX9Y5jx
 JaoVGJ35n3IJrCD6TdlsHd/ob3+9eIGmDUfASuTza5yJB3DhK26bZ4miRIXpYS2EmGAB
 w49w==
X-Gm-Message-State: AOAM533zMV0Po+KrPQFAr+Y4uQqeCt09iE+qclAh+hgZHTJtVL08Jhhr
 eRi4qv86I0/s50tYOntr5nxtgnJenndhXYZNLTfTPjPI97miArM5Wd8HwV4IhR5smpiS95R2sbk
 L0oaeJMT8+8z2
X-Received: by 2002:a1c:6244:: with SMTP id w65mr2923510wmb.27.1618489616704; 
 Thu, 15 Apr 2021 05:26:56 -0700 (PDT)
X-Received: by 2002:a1c:6244:: with SMTP id w65mr2923493wmb.27.1618489616564; 
 Thu, 15 Apr 2021 05:26:56 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p18sm2754498wrs.68.2021.04.15.05.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:26:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] qtest/qmp-cmd-test: Make test build-independent from
 accelerator
Date: Thu, 15 Apr 2021 14:26:31 +0200
Message-Id: <20210415122633.4054644-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415122633.4054644-1-philmd@redhat.com>
References: <20210415122633.4054644-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7F5H+y1l3r8z

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, do it once at the beginning
and only register the tests we can run.
We can then replace the #ifdef'ry by a runtime check.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/qmp-cmd-test.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index c98b78d0339..8902d2f169f 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -21,19 +21,24 @@ const char common_args[] = "-nodefaults -machine none";
 
 /* Query smoke tests */
 
+static bool tcg_accel_available;
+
 static int query_error_class(const char *cmd)
 {
-    static struct {
+    static const struct {
         const char *cmd;
         int err_class;
+        /*
+         * Pointer to boolean.
+         * If non-NULL and value is %true, the error class is skipped.
+         */
+        bool *skip_err_class;
     } fails[] = {
         /* Success depends on build configuration: */
 #ifndef CONFIG_SPICE
         { "query-spice", ERROR_CLASS_COMMAND_NOT_FOUND },
 #endif
-#ifndef CONFIG_TCG
-        { "query-replay", ERROR_CLASS_COMMAND_NOT_FOUND },
-#endif
+        { "query-replay", ERROR_CLASS_COMMAND_NOT_FOUND, &tcg_accel_available },
 #ifndef CONFIG_VNC
         { "query-vnc", ERROR_CLASS_GENERIC_ERROR },
         { "query-vnc-servers", ERROR_CLASS_GENERIC_ERROR },
@@ -51,6 +56,9 @@ static int query_error_class(const char *cmd)
     int i;
 
     for (i = 0; fails[i].cmd; i++) {
+        if (fails[i].skip_err_class && *fails[i].skip_err_class) {
+            continue;
+        }
         if (!strcmp(cmd, fails[i].cmd)) {
             return fails[i].err_class;
         }
@@ -334,6 +342,8 @@ int main(int argc, char *argv[])
     QmpSchema schema;
     int ret;
 
+    tcg_accel_available = qtest_has_accel("tcg");
+
     g_test_init(&argc, &argv, NULL);
 
     qmp_schema_init(&schema);
-- 
2.26.3

