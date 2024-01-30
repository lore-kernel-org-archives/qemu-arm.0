Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp940423ejk;
        Tue, 30 Jan 2024 08:39:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDmL94kgQ9AdstMOFeF5ndJL7uDriR8sD/flZe+Krzibi9eszVpsNf0zi9iJKjCGqDZGIA
X-Received: by 2002:a05:6214:f25:b0:682:85f9:163e with SMTP id iw5-20020a0562140f2500b0068285f9163emr9903646qvb.121.1706632769474;
        Tue, 30 Jan 2024 08:39:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706632769; cv=none;
        d=google.com; s=arc-20160816;
        b=ZYcY5V8yLOEqDu8muTnQ7JIeVrBDjczrDiyBLAmn5MOxFpoyEQBd/71OWvKeynitGp
         JvhEe4ge7COxPfTny7sV7FTPrGDm0265+awu1Bb8TTQU/3NBJGE95p8jNYSswL2yMF0u
         PZ2sRDFdMMtxwOerFKXTlXt+QNzervLF95t0aUSXRomdtfGLYuYBZu78Lv9Xh3jnuNEe
         +exhlZKoxCXXDk098xYJddp0nZAnTfjlJYwSWZHK5zpwv9SxUdcES/j+kuhmy+ky7Nut
         MqYLCWD/cxNumGLMXB88pqESWFJ5nOB2vrqSEpy0uWL1PVmo9N3JzfUopPQouAWTcfRp
         df+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=j9V6CgxGZhDtMTHKVYDt6zEGjKJjt+YCyLDePP7/980=;
        fh=Urq1RoTyO+OOBujohoC2Jqp5tJKPVqUlfF3DhFITF+E=;
        b=JFqRewErCdNMBXN/v0ULvD8YasmaZIVMOS+pNfv1EHSz8g0RU4uElmt6InsvI0f9qG
         7zq7U6EbtdIMhNcISz7I7SHvnepILz4Ky31Jvk4bm2+1k1Cz/R320PshVfJLJK2DHiqT
         Mf2rSG52kPSueHDdY5hgoytFeuXIxXBJZqp/oEi/zCF9hMZ4QkohiD+f74nol2bWdWIG
         mUICLqi+CWXWAmk89d2M8TK/K2v8eOg7G1LAZpWnuxHG8eh8oNGDVzHiohuTgqwT8p+z
         O+9uwZMtmLa0A50n9bVKWxdHfMIMDABkQYIAw+DJndvMf1L5S8xh9cNQ0HCMeBD+V2Pb
         XH0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020a056214194900b0068c56e7e713si3318707qvk.236.2024.01.30.08.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 08:39:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUr7b-0001bS-E3; Tue, 30 Jan 2024 11:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1rUr7Y-0001Q0-QF
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 11:38:00 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1rUr7V-0005px-I1
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 11:38:00 -0500
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-0Cq1PfI_MEqMDL4w0X1CrA-1; Tue, 30 Jan 2024 11:37:45 -0500
X-MC-Unique: 0Cq1PfI_MEqMDL4w0X1CrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25D45837227;
 Tue, 30 Jan 2024 16:37:45 +0000 (UTC)
Received: from bahia.redhat.com (unknown [10.39.192.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 761988C11;
 Tue, 30 Jan 2024 16:37:42 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 0/3] acpi-build: Fix hint messages
Date: Tue, 30 Jan 2024 17:37:38 +0100
Message-ID: <20240130163741.145925-1-groug@kaod.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jMkxpz1czQXV

ACPI build for ARM, i386 and Loongarch all have the=0D
same warning report with a hint for the user. The=0D
hint is printed with error_printf() as expected but=0D
it lacks the terminating '\n'.=0D
=0D
v2:=0D
- s/error_fprintf/error_printf in commit logs (Ani)=0D
=0D
Greg Kurz (3):=0D
  hw/i386: Add `\n` to hint message=0D
  hw/loongarch: Add `\n` to hint message=0D
  hw/arm: Add `\n` to hint message=0D
=0D
 hw/arm/virt-acpi-build.c  | 2 +-=0D
 hw/i386/acpi-build.c      | 4 ++--=0D
 hw/loongarch/acpi-build.c | 2 +-=0D
 3 files changed, 4 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.43.0=0D
=0D

