Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2502051lfc;
        Fri, 13 Mar 2020 11:38:10 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuQ7wt/SXq/1QNFJAshIwxur8TUlLc4aXBuCnWi9B10Vwsiv0kkPC0xI3XZOmycd05K5SXa
X-Received: by 2002:a50:d61c:: with SMTP id x28mr14726499edi.344.1584124690630;
        Fri, 13 Mar 2020 11:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124690; cv=none;
        d=google.com; s=arc-20160816;
        b=esS0LEIAKdUPTD0M7CgMtw3D474EJpRbF2hdqYFnD6rFAREEe+gOYGTejmyBm84IHn
         AJN0Z17QoDGI3/siQlni1C3OWAdAPnYDzzXGWvHd4WzfSXV8s+3me/gsVt1ak55CKbrM
         Pbf0JDKjGU3IEBGQFebKB0Ib4D/t4c1HBgmDCKn9BVm2ZTgLqxe8dpjWq1M9+/K0wpp7
         UoDy0bq0ZBAMd/aKhXmfLjA9hjGeNnE/brT+bFWlRyJ6H8YODlU9TkEA59gtR4VzEbZm
         2e2lYIpQXJpUD3Y07dV8c8QsmUtsLwhLMG+7hQYBvnjK1GHjHpc/v1Ot3PfF6E1L1GkN
         ELDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Jc8uJI+fsWVnbFhna2J0NMxSMRDSs2zyN/X211eVidg=;
        b=rKwvYOTs9wpuYNHtheXL2qQJJBU4Bk4+KI6iEIUUiLRpkquvpo/Yp6ckKWVJE6xb8b
         0fX659V4tcFH4oS4Y49P2Y2SwLYsTM73ocg6JK8kY07A+/p75RewyZ2AwdpLw/k2o7zh
         VEH7jwiU+9d6QhkakkmtB7rbSFiEgd7vYWhyM7BI3BoLCREHElRk9T/1fZRpVPHqgTgc
         uwwk2+McwGY6Drn0yU54srpEOT6zDtfbx3U5USq+q2C1KvGLYXuZHuj7YUE51oAcDpjE
         bGUlRfcgkp3m1zrNTQZE8p7UJMe5bGmmE4sS8U64TSx3FdJeqI8xFw64G/dPfjWS/Wdw
         C89Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VJMFgh8w;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id r5si7481839edi.33.2020.03.13.11.38.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:38:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VJMFgh8w;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jc8uJI+fsWVnbFhna2J0NMxSMRDSs2zyN/X211eVidg=;
	b=VJMFgh8wePuhNQlXobRZINQbC7TRe3W7lo54xw1kZogeKfYTqOBj0DJZi/+L4n9FEGoFdc
	t4liTHmtGzaFFQJKmTmpQJxzLQ192LJd8pQHq+vXHrcWy8x68tp5ZjNo7LOP9RE1Y+4h2t
	mbjhJtQKkp8utn9qSzGjfiqUcLIOosg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-4O5eaQ-COQSIvFDOt4YxJA-1; Fri, 13 Mar 2020 14:38:07 -0400
X-MC-Unique: 4O5eaQ-COQSIvFDOt4YxJA-1
Received: by mail-wm1-f70.google.com with SMTP id s15so1720552wmc.0
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oL9lM1TjQ9zbVx8kM0/Y3ow0t+KGUtP0TdO5NgiCTHI=;
        b=nYpU+vlyWiby2o2qrjKVqMvjvVVhaFSFAzmeaaFvRCUVRDKtgbNNSHcIFVXZLv9nQo
         YEF+Lq7xDIlBg1g+WkSMNbI5DhWXuc/PkJIpOzxRtVT9oekmwqCQbE8cwVM4igoWVs1O
         Csra5DTYNHxKH6lrbFGvuTb210v/CUpeaRxL3zONzs4XnN2Hwc63XxfM1QpRw/uHt/W9
         lRUX/CKNdzdXcQHigo1wX9BiRNkNhYiVwJBWH21jUUhTob/bX0UUSj7R0a5GlHYuXxQO
         oQ3mrKnPigne0Zm2aKmDQlp+POWZekACyltLEGtgnCoa6Tfus3OU0MTcDANYGCNvYRMn
         zS8w==
X-Gm-Message-State: ANhLgQ11mPBOfacyYuEzg+ti5//HJ2SmiD188qbXgQR3o2SNmpsIfz85
	dZqfyLbSxm9IpksedreC3frzxiLEjih9QFgfgIA1kYd2yD9mKwT7G2cVpFDIbGzT3EHAAXJJM5r
	FFHHj6fROaod36072
X-Received: by 2002:a05:600c:22d9:: with SMTP id 25mr12481662wmg.41.1584124686791;
        Fri, 13 Mar 2020 11:38:06 -0700 (PDT)
X-Received: by 2002:a05:600c:22d9:: with SMTP id 25mr12481624wmg.41.1584124686545;
        Fri, 13 Mar 2020 11:38:06 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id f17sm59325628wrm.3.2020.03.13.11.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:38:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-ppc@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-riscv@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-arm@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 14/14] hw/core: Restrict CpuClass::get_crash_info() to system-mode
Date: Fri, 13 Mar 2020 19:36:52 +0100
Message-Id: <20200313183652.10258-15-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: w8vppeDnhM6B

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/core/cpu.h | 7 ++++++-
 hw/core/cpu.c         | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 73e9a869a4..48ab5ec3ed 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -492,6 +492,8 @@ bool cpu_paging_enabled(const CPUState *cpu);
 void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                             Error **errp);
=20
+#if !defined(CONFIG_USER_ONLY)
+
 /**
  * cpu_write_elf64_note:
  * @f: pointer to a function that writes memory to a file
@@ -541,6 +543,8 @@ int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, C=
PUState *cpu,
  */
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu);
=20
+#endif /* !CONFIG_USER_ONLY */
+
 /**
  * CPUDumpFlags:
  * @CPU_DUMP_CODE:
@@ -634,7 +638,8 @@ static inline int cpu_asidx_from_attrs(CPUState *cpu, M=
emTxAttrs attrs)
     }
     return ret;
 }
-#endif
+
+#endif /* CONFIG_USER_ONLY */
=20
 /**
  * cpu_list_add:
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index fe65ca62ac..debdd7e670 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -209,6 +209,7 @@ static bool cpu_common_exec_interrupt(CPUState *cpu, in=
t int_req)
     return false;
 }
=20
+#if !defined(CONFIG_USER_ONLY)
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
 {
     CPUClass *cc =3D CPU_GET_CLASS(cpu);
@@ -219,6 +220,7 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu=
)
     }
     return res;
 }
+#endif
=20
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
 {
--=20
2.21.1
