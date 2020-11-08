Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3075021lfb;
        Sun, 8 Nov 2020 12:48:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVAzvase8oHQmh0fZjkenfDZ1G5Ybgr05gRSTvboa0XHfNGJE/vRX9XmmmJojy6YngYVrJ
X-Received: by 2002:a17:906:3a8c:: with SMTP id y12mr11512271ejd.531.1604868504099;
        Sun, 08 Nov 2020 12:48:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604868504; cv=none;
        d=google.com; s=arc-20160816;
        b=FGc4t7dDVLe5N43zISjK6RH1IMa4Bbk2FND//Rg+h/9Xht7EeSK7tdsO46Qlm5zlwW
         3xN/mP/VjAqFCObEKZ7T9CZRIfIBA+709h0DGokPtHoR2ZhpOvaGkkh869cJkq1BOg0r
         7rtNWK8fuFshdrS91bpybnpBZgQFwfyA3MVeiw2Wxg/rzENq5sNX5xm/GXpHq4ruSZWX
         il71qujog4PBp7lXCT7G9S5Uc4iglJUjUMdV6Zswy/6ZN9LB0OLSndTjd4M0KFJ7L3Dd
         wtxIKGLN4R2K/Q0WoHWuuskcFAaKEZEHnJKFm9XolwysasYwJCaMjHIc91sj9J2ftvOs
         +IIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fzWt1qDKwVED4KYkWX6MIPCKsj2TKTK/b4JiHS7BZWA=;
        b=R5KNXFrmsA7xFOTc16W9+YIx+tHROm7CItgWZ1e/3SzTiZ3YQsUJ2xkpxVzdB3byE4
         LLi3+gV+fmwVrMOOmirfdIG0MA3FjSqSwNYY3PLgYP10IGdbxRgyKvviAkkppd63faEX
         T0zdtIU7YNFaZ1yAwRrepK+FL1eRC9pwZVTW95iTtJ8sLXFVHJbgai0oDeD5SBwmcEPr
         5S00Dj0TpzXAwvR1p4CopSTepriMLU6UlmUcZMmdH7a+irxNJOsNekAkGKzM9p3xaMni
         TIni4JHzPp5jK2dabb3i4OYstWuHmQvQfFrT7RTM7jyqJhke7068wGD8yhgRJMQ2t79H
         m1DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h6LtN4pl;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id p25si6573165ejc.412.2020.11.08.12.48.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 12:48:24 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h6LtN4pl;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604868503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzWt1qDKwVED4KYkWX6MIPCKsj2TKTK/b4JiHS7BZWA=;
	b=h6LtN4plwCs5djLtC7bRwksW1xla147Sf6A25IHd8UH0PIGLvjjyhdmvayxM07nkrGDPkn
	RIn6bGvc1eyt0CLaWTppsbUs8dyo1ohbCFgRtCgeHrLQFmvUfJhpIMhF6tiQdxjqmk8qOs
	Obmrr6ukLn84FAW+Ro7rU0SkEHVlrTY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-6s2YIpCSMGWXYk1km9mvxQ-1; Sun, 08 Nov 2020 15:48:21 -0500
X-MC-Unique: 6s2YIpCSMGWXYk1km9mvxQ-1
Received: by mail-wr1-f70.google.com with SMTP id w6so3388538wrk.1
        for <alex.bennee@linaro.org>; Sun, 08 Nov 2020 12:48:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fzWt1qDKwVED4KYkWX6MIPCKsj2TKTK/b4JiHS7BZWA=;
        b=o6lOZO0WvlT/IwGg2RJgZ+PHrH64eNlv+lE6953NmM4GvpuO/IGXw7ropx8ZLUxNTw
         mHGEYf6Oq2GfkdzrUy02fSqqkuBg9WeLiCK7zfKqQKa9gTBlXX2i9dmg8Zn8I9W8HGql
         Hxz1xJya8yygilnCxP3IbcWivpd/Sp+9vVdq96XWeUZ43bDTUiW+cOLaiomeu+QNfky3
         m+AlKgnHVCd13wnkGboEy+yT+ngjEPUaoqIgUR/F1unQT+zi8gODKnkGHdIe1h2lwMJT
         pShLGL+iPzI/7V604dDLE8NQ83+yKPWHDVpVcXI4qK4uTfkGnbw19nBMOd7ksI6Duz2J
         vhLQ==
X-Gm-Message-State: AOAM531ubEYluwekJwt0HCBkykmae+A60fe8NImYBOsyxOOJscBFh+vS
	abJMOKY30CWMcyCpO9ne9rNh+9TNUPiRTlkV+nKlrRq3YGg2uJ9xFEq571mGVMMiiNA6YYc6mWl
	hmEGMwZfeegdUYAJH
X-Received: by 2002:adf:e992:: with SMTP id h18mr4849144wrm.356.1604868500416;
        Sun, 08 Nov 2020 12:48:20 -0800 (PST)
X-Received: by 2002:adf:e992:: with SMTP id h18mr4849129wrm.356.1604868500284;
        Sun, 08 Nov 2020 12:48:20 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id s9sm12227336wrf.90.2020.11.08.12.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 12:48:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Richard Henderson <rth@twiddle.net>,
	Fam Zheng <fam@euphon.net>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH-for-6.0 v4 16/17] gitlab-ci: Make some ARM 32-bit jobs optional
Date: Sun,  8 Nov 2020 21:45:34 +0100
Message-Id: <20201108204535.2319870-17-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201108204535.2319870-1-philmd@redhat.com>
References: <20201108204535.2319870-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5ZDJoeFvHnu9

The armel/armhf targets have a lot in common. Instead of
testing both user/system emulation on each target, test
each one once. Mark the other combination optional, so
user can still run the tests manually.

We now test system-mode emulation on armel target, and
user-mode emulation to armhf target:

- armel-system          Yes
- armel-user            Optional
- armhf-system          Optional
- armhf-user            Yes

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: qemu-arm@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
---
 .gitlab-ci.d/crossbuilds.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 03ebfabb3fa..e4526e98232 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -32,11 +32,17 @@ cross-armel-user:
   <<: *cross_user_build_job_definition
   variables:
     IMAGE: debian-armel-cross
+  rules:
+    - when: manual
+      allow_failure: true
 
 cross-armhf-system:
   <<: *cross_system_build_job_definition
   variables:
     IMAGE: debian-armhf-cross
+  rules:
+    - when: manual
+      allow_failure: true
 
 cross-armhf-user:
   <<: *cross_user_build_job_definition
-- 
2.26.2
