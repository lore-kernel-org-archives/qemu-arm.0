Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4985959lfq;
        Tue, 29 Sep 2020 15:44:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTqzUiUA2enBRxU76Fr/PFBZ8DKmHIaFoq+tS6yiYoUCt5v3OQG+5BV/09ekschMhSvRMD
X-Received: by 2002:a25:cc45:: with SMTP id l66mr8975552ybf.112.1601419446759;
        Tue, 29 Sep 2020 15:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601419446; cv=none;
        d=google.com; s=arc-20160816;
        b=lxg4r7rYlwSBmdlHDar8rVmikB5LDMzFUYmO7IPcDwz/F3xUJrfjmCtlb7jvHuy3PX
         h1JzI+vnLaSYnCB7lrCcg0kh2Nwj16MPhuAa6dHCS5VGLr3mdBqoS1MLDX5BAizPgfQF
         3YJWMj9bP0ue/2zDyO/Mf1gD+saD9QUv2ya1QtqgIkZlF6T54FQ9hSBDtWYgzgwJkjVM
         P6xBCWYuyPGpLT9N+vgaqDoeqmJKIBzr9VEIk5+0kYQypS8jbY3Cb029G89gGJyx7xCj
         cp7WT4672qg86C1JYQqpEiFaV0OBh67BkL0syoCGdGL/PigppXf5/Smn5wDnNkiitSZ7
         wmDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=66DSIrlhCeV+xyo2otn2L+hQAxSXyWg/ic5Sp/vZwto=;
        b=J0y09LR7P+QkkyO5EgSU+9o/QeDXRlqRDsQSLK2rJM+gQiEG1Lyiy8n2IcXtQuL+4N
         sOqkLI+DWmbBpYXr0ykSyh80Wi5qtypNMktruAY/5uJrK6PRoBTfDy6rA5pLtXBcdpY3
         jfNcVCqLbq4HavFQJ9y+ch1fkpUJQj6s3Jb9chlE0068bW52ZveENCbKvz71MGLPYQ84
         jCVd4LLjrVxmu2A3q4/uUcWhsRC6eDV4UzHCacWdf7c4nypjVOUSBFJZkYZY2KfS7nUZ
         K3qTO8+akGQ6xoWNpk305A+/MdGWkJ36x+ZIDyuUeRc3fpsq+8cTsUqPZHrOICvq0l4L
         1KJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P2gRsD4z;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id l6si6087403ybc.66.2020.09.29.15.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 15:44:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P2gRsD4z;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601419446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66DSIrlhCeV+xyo2otn2L+hQAxSXyWg/ic5Sp/vZwto=;
	b=P2gRsD4zgeBbihXz4fdnsT263Af1b1iWdxljRPd2Imco4dBS/Q97k+XbZjEvctfXCOp+BI
	ErFSt0zN/xtYeIgiPkbAYakV7L5o9vvFA30drPAr221/duEBx6LopbDz5XMS2XUD2eX6Wi
	mSw05E4yybQ1YlC4YHpdYERyC9wgkes=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-jGsPbo9MNV21zncHqo84DQ-1; Tue, 29 Sep 2020 18:44:04 -0400
X-MC-Unique: jGsPbo9MNV21zncHqo84DQ-1
Received: by mail-wr1-f69.google.com with SMTP id b7so2359471wrn.6
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 15:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=66DSIrlhCeV+xyo2otn2L+hQAxSXyWg/ic5Sp/vZwto=;
        b=PZY3NeQqA4WGohjoS88C3qRVPjVn82bU2aH7DRLeDOOfpGSoJp5ZooDFRIV9gH78rJ
         PXgwrnZo0W92UgJQLk4N5lJoWtVfGRnib7ubKqr9Grqd4LEvzMzmuNy/rMGHDev0MWHI
         XMmGIrdkqYPL0LWWO4pVG6UZ4/ACC6VxR8B1fVhdypBUXEM65GQQ1027lEznjQInUmAW
         cVe0IGH8O6O2n696r57FpT+ZxmvgucqUJPSLdykJ7V0Jo7/UxQ4Rz6Evp3a81WIsWdoC
         iieLLmhX/+0r5NwLO8mv5eonnFr0U8DlVz6d9SzhC3T943XqyGn8pOuYE2vC4dP+3eSw
         Ca4A==
X-Gm-Message-State: AOAM532cyJl7CdUXd28hzNGNzP+pq2QY3UrTSzsv49GfPjgtXXVKVhSF
	4RqJbXiOcrcLhmX4Atggn2d2bGtO1Zu5jYhGJBIw5jZuW/nxVm/HWgi9jjxyiiVSyVudB+gu7J/
	4A7GDes/cVCiTyKjr
X-Received: by 2002:adf:efc9:: with SMTP id i9mr6933027wrp.187.1601419443106;
        Tue, 29 Sep 2020 15:44:03 -0700 (PDT)
X-Received: by 2002:adf:efc9:: with SMTP id i9mr6933012wrp.187.1601419442929;
        Tue, 29 Sep 2020 15:44:02 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id t202sm7798963wmt.14.2020.09.29.15.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:44:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH v4 01/12] accel/tcg: Add stub for cpu_loop_exit()
Date: Wed, 30 Sep 2020 00:43:44 +0200
Message-Id: <20200929224355.1224017-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200929224355.1224017-1-philmd@redhat.com>
References: <20200929224355.1224017-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: B8xdw1Qo0u2S

Since the support of SYS_READC in commit 8de702cb67 the
semihosting code is strongly depedent of the TCG accelerator
via a call to cpu_loop_exit().

Ideally we would only build semihosting support when TCG
is available, but unfortunately this is not trivial because
semihosting is used by many targets in different configurations.
For now add a simple stub to avoid link failure when building
with --disable-tcg:

  hw/semihosting/console.c:160: undefined reference to `cpu_loop_exit'

Cc: Keith Packard <keithp@keithp.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 accel/stubs/tcg-stub.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index e4bbf997aa..1eec7fb90e 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -29,3 +29,8 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
      /* Handled by hardware accelerator. */
      g_assert_not_reached();
 }
+
+void cpu_loop_exit(CPUState *cpu)
+{
+    g_assert_not_reached();
+}
-- 
2.26.2
