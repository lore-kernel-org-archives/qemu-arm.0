Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3262516njn;
        Wed, 15 Jan 2025 10:16:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXEotYbxXW7lQtyc25yf6v0QyrdK1QyQjoXr2DUQnYkQrSgvxS5KhlYC/a/Lqvj/xFy24uLJUwhErQERQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFK8ahM72Uu8fVMh/RsyrZqHcW+PfLPiPXzBGrzmlJY+yKv51RDnKfXotEUiE4k9aBKL4CQ
X-Received: by 2002:a05:622a:1342:b0:467:6e45:218d with SMTP id d75a77b69052e-46c70fd4538mr488273591cf.3.1736964996641;
        Wed, 15 Jan 2025 10:16:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736964996; cv=none;
        d=google.com; s=arc-20240605;
        b=PiLM0kmspj9SLlXrMTojXv+oi6R02xUQX298eaCQGD3YpTpnamslQdh8Lcd5WP7jVl
         WYN0XB+RNquP6xT1fJGBulYcgT58ollDtwF3gAFwhC4s8LzeJltr3H/Ntnv3hzBk+oM8
         Gld/BZ+20SJmk9r0m3JtwpamnUMbvYuQwngxrHja6Bauly5KOlBA8U48uL2gh2t3PjkQ
         srNxRzJsw+zxCWZTN5iSHyA8gieohPqHwjxVw1RmJ5FQP/xETgBcJK8ehAz7mj2t4wZ4
         GejsIymDwZ573X/lXJ4EUnKyUpZXq2u+Kveq8w9ThSfmKfT/YrT9dKKMAk8qXJAhdUq+
         3Ehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=V/dUCsKb0TMFSGFh+lNfPFs4aoQ4JRtV+rc4QjtcMiM=;
        fh=59XnuQC6iDOx9DZo/D2miAMC+wUgC14I6Tv9mkhzjMg=;
        b=Ugmf6wDOe5TRfUb4UFsSVTaa8dZVnvRQbofXWEVWiHR1nw46RN5q0+LrF7COHjYJrI
         lnjidkQVZr+AvQRJP/DEicsqAUqbIbGg7BGbF1h5t5FAwb1iiTqFSc0s1nDDMsFfie0J
         dfqPvxWP/8Hp2Plq0oX/Erh+9RJY9KsEzgNSTFr1lPI4eRdGf2hHjz5OsrL0wS9WZQED
         CpC/8Ma+B+9bH/mjuHFvXhgYdnd7efbbRFjT1J0QsxEKNsx5B31nPXuLxTRe0JkW3/Bv
         X6XGS/8+bUy4QGd/S1yxLH0MpFOV7CncAl7ddHfUqusJB4N69IPIfQSWdlA/J8McYKEk
         QgyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FUx7KNXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c873e5427si149520561cf.317.2025.01.15.10.16.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 10:16:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FUx7KNXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY7sJ-00077H-MY; Wed, 15 Jan 2025 13:12:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qt-0008Sw-Vf
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tY7qq-00074s-JA
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 13:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736964647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V/dUCsKb0TMFSGFh+lNfPFs4aoQ4JRtV+rc4QjtcMiM=;
 b=FUx7KNXsclSqiojYsajlDBNSYu3ubz8DE5qXjHyRg1z5UuJNqQn9QTZobyWeQ6184q+1ff
 erIoyS8wuZONQ1uA0tYeolSqfZ72W2rp/n4wJXPGXc3P4CGZeKYzab8+I0YbU9ds1ooM0u
 XXLn/rBF88MI6nkAQ+F+p3wBoJvzQNQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-dOm3YdUfOAOae40-mBhF4w-1; Wed, 15 Jan 2025 13:10:46 -0500
X-MC-Unique: dOm3YdUfOAOae40-mBhF4w-1
X-Mimecast-MFC-AGG-ID: dOm3YdUfOAOae40-mBhF4w
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38a684a096eso40420f8f.2
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 10:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736964645; x=1737569445;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V/dUCsKb0TMFSGFh+lNfPFs4aoQ4JRtV+rc4QjtcMiM=;
 b=pVvaKYaplwVrCMeYAxW/lvqvgJp4DRZVkW5ID1BgHRlXHustUkJE7NUVaayvY7jCnO
 iLMV9P1cFLj09eXr+0cDwmaEzo0xRa6wcGdlGe4pGIxstS1Z3L3eQ88azycR6iAhquub
 pdl/HH2tngAld9Mv9TsPnWJqbrKsc2jjPM1jsEinyXFoVz0oVvzDCpIN9HIUiFEBAhD2
 +ouV4K/i/1RKRl4ACXOnOiSW9uLG0cG06u/F+SBnLRgeHKIPaZNYiRSegOuUQWhqJhjZ
 CcUDCtbaFW7D+zXOVX3+X92Y4D4rBjQ92b8NUanPqmbT4efrvXzbRCh5JTzr1e6UU+dG
 UjEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP1pMu7hvM0RJbj+6dP8Ogz0cRJmfN6gGbt4/Q3UE9QozNpuiYIOyfnQ1J0iYFxDQlnsD4PKnlVA==@nongnu.org
X-Gm-Message-State: AOJu0YyLqwS49sp6KK3F9fex4Kc2NuU4SMPWpqaL50EyQMWgcw9xKnKj
 bcx3Xj16KaVWeQwAL4b0etrL5xA4HJQy1FA7t0KlKu6bY+5KZ3aBIi7jvQLfwk3ExH2Z3FTk0IZ
 xLQobuZMm2/zJjaXeYIxVd8/ecAaoR5KGkTum/vDWm6I5XimI+Q==
X-Gm-Gg: ASbGncvyOXbY3pOWrm4vZpS9Y0G8Y3XkWSRkJu5ujWoantOzg+lFbBUA9GAQAcsLQEo
 l05v8ZCvQ11ogK8HkkNwnNFI2TMNCkBhvbTC/x1ONcztxfJewV/OtR0c+osO5sFSZ/ihAJ2k/UQ
 FSESnWv/E2IJ4gIp3Xv0EFQmwRQoXZW9ymt9KdRPZ12ulCoOkQkHdL0LI8xEn7GO5G5sPfACRxN
 9HtLYyEbhje7S6AojOMqW4gb9kMZrXlhnX/bvhzAqsrNsBwJege
X-Received: by 2002:a5d:598d:0:b0:385:e8aa:2a4e with SMTP id
 ffacd0b85a97d-38a872ec201mr26677160f8f.31.1736964644932; 
 Wed, 15 Jan 2025 10:10:44 -0800 (PST)
X-Received: by 2002:a5d:598d:0:b0:385:e8aa:2a4e with SMTP id
 ffacd0b85a97d-38a872ec201mr26677139f8f.31.1736964644607; 
 Wed, 15 Jan 2025 10:10:44 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:342:db8c:4ec4:322b:a6a8:f411])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38bf65sm18074120f8f.49.2025.01.15.10.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:10:43 -0800 (PST)
Date: Wed, 15 Jan 2025 13:10:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 42/48] docs: acpi_hest_ghes: fix documentation for CPER size
Message-ID: <84c146758d79b3689b6c9c7815b6bfbb70ba06b0.1736964488.git.mst@redhat.com>
References: <cover.1736964487.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1736964487.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XukLFWAc-jJc1352LbTX88aOO7UmI4mF5sx_qowOSEM_1736964645
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: p5Lm6mNz51vM

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

While the spec defines a CPER size of 4KiB for each record,
currently it is set to 1KiB. Fix the documentation and add
a pointer to the macro name there, as this may help to keep
it updated.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <f7e94433bec19a9d6b23ecccc24b5fe3a6f7f52b.1736945236.git.mchehab+huawei@kernel.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/specs/acpi_hest_ghes.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
index 68f1fbe0a4..c3e9f8d9a7 100644
--- a/docs/specs/acpi_hest_ghes.rst
+++ b/docs/specs/acpi_hest_ghes.rst
@@ -67,8 +67,10 @@ Design Details
 (3) The address registers table contains N Error Block Address entries
     and N Read Ack Register entries. The size for each entry is 8-byte.
     The Error Status Data Block table contains N Error Status Data Block
-    entries. The size for each entry is 4096(0x1000) bytes. The total size
-    for the "etc/hardware_errors" fw_cfg blob is (N * 8 * 2 + N * 4096) bytes.
+    entries. The size for each entry is defined at the source code as
+    ACPI_GHES_MAX_RAW_DATA_LENGTH (currently 1024 bytes). The total size
+    for the "etc/hardware_errors" fw_cfg blob is
+    (N * 8 * 2 + N * ACPI_GHES_MAX_RAW_DATA_LENGTH) bytes.
     N is the number of the kinds of hardware error sources.
 
 (4) QEMU generates the ACPI linker/loader script for the firmware. The
-- 
MST

