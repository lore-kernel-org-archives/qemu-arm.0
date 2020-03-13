Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2501557lfc;
        Fri, 13 Mar 2020 11:37:40 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtOFYWQJPcmX6j0BiI1060KBMqkiYR0k/In5PfP4V0VIvzvb3dL9z1XNfpfkdIlFldpihpq
X-Received: by 2002:a25:ba42:: with SMTP id z2mr17407680ybj.451.1584124660295;
        Fri, 13 Mar 2020 11:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124660; cv=none;
        d=google.com; s=arc-20160816;
        b=VLLMkBE/0nVaYQpNJRwJ1oRrGOCkEQSRocvJQL8G2tJxrjPowUPZmrUFMxtuZ3WZex
         a1UEEVSIsZcJLxc0Y4EIDctQA7nRF5lLDu3hy3fyq/En/4ulcDWpXAfxs0eYFPRXnK+M
         SWMnLDQuxuz+L8rtTPFz0C0oHhS2G7xEuzycbeGl0VgyfzWzz/JmiAabSUMbDxhTTYSZ
         gX9DjV9cyK3UP4LRcEvtL/Mln4GACd8y38e2MlFnJf2IL+u9wfBS/Y47Kl8+UFrD1Xz/
         aXIVWFg2d2gyJtC7ekNkkqjb6EWjteFmSOkzVUHzV3aQ1Y+T1oSgmG7UPhUL2SubX7B0
         tMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3SuVECRO5K7Gvy7TFYYgJaxwMNPrKIUm0bQrl4kHjTk=;
        b=qcFuELBoFiEG81W5DJuy3Yumk9pHI8y5NcsmebThy/+TD9UaMMBQBTjitNFrJE0W+/
         w5FeWaGN2CpwgIT7p6WhFkiTpXCyVfTymR5+tczGwKWjCsyOTj+K92aeGX/+JpHtMyVh
         9JATUl8kd/3vBmIV91Tdky1G0d8nf9bEZkMhAfTZ6rXAiF7HZA8+nDIfAcDadC13Bua5
         1EgMkPBmOiWL97xHLmXpYiaFU6xTuKN/eGVVTLwx0vB1OpFfsz4AjSggUxhz9wrzBmi3
         B1ilcuFVRl7aiXVzqAOwvYyulVFy6Esw4LTdld6m+PA53lfN8nj7KehFmRlicWAQiulq
         O00Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bl1XhSYV;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id t18si6299534ybk.192.2020.03.13.11.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bl1XhSYV;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3SuVECRO5K7Gvy7TFYYgJaxwMNPrKIUm0bQrl4kHjTk=;
	b=bl1XhSYVoMl2TreOxlRdsvtqiNdmlrpa0tFISeeesUCi2Xr5rlQ3KmtEVlP6GT+lbEBJX2
	3DdKPMW1Pp6pHx11IqTWE/OrkqnN0lE8Oi9d+QlJeQcCLTml6/n/RDmgg/zYfi2DADjRxl
	fwk7HHO7AWyu9aKRcxLLJSFYyI9eiew=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-SyopTkYBN6WDC0f8z5UPGg-1; Fri, 13 Mar 2020 14:37:37 -0400
X-MC-Unique: SyopTkYBN6WDC0f8z5UPGg-1
Received: by mail-wr1-f69.google.com with SMTP id h14so4016723wrv.12
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7qrHY3POAwgPR/yw4WHGaOw9mwemlFbyLT5p0JEbbnw=;
        b=H44hAIB44cqJuxny/IdaAxTmA2xclNtV4xD0oZABDVd2xCAtbAdThbo/HkxthQToHs
         kmlwCIZ73oa111fwYE7BVSFpHdDoNNyQPG1ry1HHxR63crXV7GqStRU7PVmIvn4U0mgO
         62oN4jP7js0z4AVXVks55otHYqpl5hkUokTFL/bTfg4A9ldO7/yVcLpduVYHKYYCiGB5
         ir/tRWoXLRtvwMV/wjdfeEyJJHoH8PNyi3NoUGXgCsOLWDk7s2BJB0ppVHcESlUWLb4n
         d/VRWclc3hihBze+KOkYzvCsPrMDeCHRpSFJXLq3oSltVydolzypB/0aZjT4BNcRlZsG
         45Mw==
X-Gm-Message-State: ANhLgQ3TM02HNbsxU6t7jn5erYeWqakmGDASrSt0h4hwROFAMKMsdLrm
	MBT4iNoXR/yE+sCKc6+SS9eJUAlDnOpLyDtPrejG/7p1tcanKo8OwByYGCZ85ab70Cc2wDqzOH0
	/w6cw7cNQUFR/Sbm5
X-Received: by 2002:a1c:9cd1:: with SMTP id f200mr10863179wme.80.1584124656633;
        Fri, 13 Mar 2020 11:37:36 -0700 (PDT)
X-Received: by 2002:a1c:9cd1:: with SMTP id f200mr10863153wme.80.1584124656402;
        Fri, 13 Mar 2020 11:37:36 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id b6sm24047514wrv.43.2020.03.13.11.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:37:35 -0700 (PDT)
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
Subject: [PATCH 08/14] exec: Assert CPU migration is not used on user-only build
Date: Fri, 13 Mar 2020 19:36:46 +0100
Message-Id: <20200313183652.10258-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: OVpc/3HO12w8

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 exec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 0cc500d53a..7bc9828c5b 100644
--- a/exec.c
+++ b/exec.c
@@ -946,7 +946,9 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
=20
     qemu_plugin_vcpu_init_hook(cpu);
=20
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    assert(cc->vmsd =3D=3D NULL);
+#else /* !CONFIG_USER_ONLY */
     if (qdev_get_vmsd(DEVICE(cpu)) =3D=3D NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
--=20
2.21.1
