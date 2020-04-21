Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5085731lfm;
        Tue, 21 Apr 2020 06:20:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypKj8p3ZLfWVs4q9GW9ljxoBeTKKjH2k7UIofmQ3ZkvT+MQDlmaiN0rhyJXOuQKShDjC+aJX
X-Received: by 2002:ad4:42b1:: with SMTP id e17mr20248678qvr.149.1587475215334;
        Tue, 21 Apr 2020 06:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587475215; cv=none;
        d=google.com; s=arc-20160816;
        b=qnP3GEtz8OdGrZYmEyO2DDC4Xgf7ISFBFOcg39hcIyKVXHHQK0XsKKiFL/jSLAHI8i
         PZ4kfNCPjTxFrtsYQYpnkzf6va8d1LBMMeKcndLVKbwEUu4FefOaV8X+7DbNg7FqwklT
         yMdjonCVc/3W8SvcYQXeLLEfkGMBvS//SUt/Ywkxn7c2IPYHod2suzSlafd0njSkDJID
         +Us87NnKmscvPq3Iis+WmLzGDBGzZfieSVKePqpbCoJH5DO9XELvUGuyReUBGboRMOxb
         JicWHLSu5GSJ7QCJ3bZctmJSkNY91CHdJyjwOiSXLrRFWjusXfY+vmjrnoU7C6iJ2w2d
         FsPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qfG1iMoMuVJK3ytJuPp4jkcsIuLSkap1NwXNvJU0GUg=;
        b=SHxYvd3AgLs1+XB0vGVYAAWnb0fmqEvRq5cCY4Koi83Ius2zXVIHD1q2lwcQX2krOy
         64oWtu8X/PZ7fwgr0XZFAQqwxb0r84qZxET+4Vg9iM4Ul0D0tZyz2NVi+ZH6x7NQPM53
         ec23o4fduB0GGHf4liVmTd3oh4BHsPhqfzAwzM9BYlrrBeQykQqZLRhNgnZzcWLQ8AZV
         H3Pzylssm2N2nEeH3150xZPYTt+nB88oljLmK+flHtCGxr/JQCPFV0kkGguHgYXh57Z+
         zuoUtWSHvweCKqe2NXQkli8iacB3+BQpNR+sbLzhi4mMKCYY15sfMu2UHNOP+SVHSwpQ
         dCmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I828Jxlh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si1469853qki.345.2020.04.21.06.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 06:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I828Jxlh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQsov-0001WJ-MT
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 09:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQsob-0001Fr-9S
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:19:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQsoa-0007jL-M7
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:19:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31351
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jQsoa-0007gM-8o
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587475191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qfG1iMoMuVJK3ytJuPp4jkcsIuLSkap1NwXNvJU0GUg=;
 b=I828JxlhqWpiHP91/W7hiQrC6LAMtFc3NtNsNPvP35vH4iaD4u3AvfbjOwbknzOz985Qgc
 nhCcNblcZXup2Xr51VM0Dt9lzvY1C3MDzpQWHBN06+e8NSnYCKek1cvgblauU5tpV+YcxP
 Q9+Rt3ghqh57DiQBBOfMOc0cZHw8f9I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-MMTfYP71NNGIe2YyCfozxA-1; Tue, 21 Apr 2020 09:19:49 -0400
X-MC-Unique: MMTfYP71NNGIe2YyCfozxA-1
Received: by mail-wm1-f70.google.com with SMTP id 14so1343384wmo.9
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 06:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6xQD+3rOPF5ujK6YzLWEuyxUGl4uZx+Lu/2zv1O3wM=;
 b=fjtQ0xPkCXaUHs3DmJjenXGd1+O25/RXbvSKEgr314y8ug+VTWNde8Aq2B7Jj50LX8
 oLxZnxHgKY00pQmgk3Tn89ETe5ayIKyCcrekD53COQqcjgpFx/jz6waVoV8vVGzWaz2H
 F7HlMV34VEbt6t5jWspnI3HYnitF0326jn28nONAU1Voa9Unx0wWAxbh6VDVCqhpxxBI
 QlGg+V5Gk24pr7qT4FpTn/Ldn9ToDOafQyGcUqzQ84LwSZbVijRmLUS9xNy8xxvLv0Nw
 H9pYKRYsusHXfF0TdT1EVhkoHhw0zWW1nRBFNz5cs73NQZOxt/95JBeM7UCnk/ad5M3h
 mZJg==
X-Gm-Message-State: AGi0PuaoRqWT/zs8XAuW7sHkKzGrOf+hlCYAXlL0X3A2iewlm+KNgYdV
 PDM00G1jhoSbchJztevZ/pm3RUxhBocMTz0oyEJu7TJ6o9IXfPVnaeprh3Eb02aAxzvqhXeymNZ
 FsWbroJ/bbdrY
X-Received: by 2002:adf:aad4:: with SMTP id i20mr20368773wrc.47.1587475188193; 
 Tue, 21 Apr 2020 06:19:48 -0700 (PDT)
X-Received: by 2002:adf:aad4:: with SMTP id i20mr20368754wrc.47.1587475187984; 
 Tue, 21 Apr 2020 06:19:47 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id q184sm3549887wma.25.2020.04.21.06.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:19:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] target/arm/cpu: Use ARRAY_SIZE() to iterate over
 ARMCPUInfo[]
Date: Tue, 21 Apr 2020 15:19:24 +0200
Message-Id: <20200421131926.12116-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200421131926.12116-1-philmd@redhat.com>
References: <20200421131926.12116-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 03:31:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JnQrwRkzqvWi

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu.c   | 8 +++-----
 target/arm/cpu64.c | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6c84e99a38..9023d9e2cf 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2735,7 +2735,6 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "any",         .initfn =3D arm_max_initfn },
 #endif
 #endif
-    { .name =3D NULL }
 };
=20
 static Property arm_cpu_properties[] =3D {
@@ -2883,14 +2882,13 @@ static const TypeInfo idau_interface_type_info =3D =
{
=20
 static void arm_cpu_register_types(void)
 {
-    const ARMCPUInfo *info =3D arm_cpus;
+    size_t i;
=20
     type_register_static(&arm_cpu_type_info);
     type_register_static(&idau_interface_type_info);
=20
-    while (info->name) {
-        arm_cpu_register(info);
-        info++;
+    for (i =3D 0; i < ARRAY_SIZE(arm_cpus); ++i) {
+        arm_cpu_register(&arm_cpus[i]);
     }
=20
 #ifdef CONFIG_KVM
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index e89388378b..5daafba937 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -733,7 +733,6 @@ static const ARMCPUInfo aarch64_cpus[] =3D {
     { .name =3D "cortex-a53",         .initfn =3D aarch64_a53_initfn },
     { .name =3D "cortex-a72",         .initfn =3D aarch64_a72_initfn },
     { .name =3D "max",                .initfn =3D aarch64_max_initfn },
-    { .name =3D NULL }
 };
=20
 static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
@@ -839,13 +838,12 @@ static const TypeInfo aarch64_cpu_type_info =3D {
=20
 static void aarch64_cpu_register_types(void)
 {
-    const ARMCPUInfo *info =3D aarch64_cpus;
+    size_t i;
=20
     type_register_static(&aarch64_cpu_type_info);
=20
-    while (info->name) {
-        aarch64_cpu_register(info);
-        info++;
+    for (i =3D 0; i < ARRAY_SIZE(aarch64_cpus); ++i) {
+        aarch64_cpu_register(&aarch64_cpus[i]);
     }
 }
=20
--=20
2.21.1

