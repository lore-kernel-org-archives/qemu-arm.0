Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1516676lfb;
        Fri, 3 Sep 2021 10:47:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHzXGMLLk/8Dvdf6hXhK4yoEKDcxWiHJj6GHVF7M4Oj4qzWR6eiAMzQLB0JME2qMYg7q5v
X-Received: by 2002:aa7:ca14:: with SMTP id y20mr211229eds.2.1630691266224;
        Fri, 03 Sep 2021 10:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691266; cv=none;
        d=google.com; s=arc-20160816;
        b=ekrIEcs8Co1dcrv10AUvU1Y2qY2ISwaoiJ3oxnVwv9gnpNLeK57VCijBIXPUX9P3n1
         XBNNOSFpHB7RkI5IRASGggIzOq3pOJ9rKbI9TiwF4hsZgwv9Lje6476ltddMMmkKpHuv
         or+9R19ndjWL+gY8ACvgSVrDnZKmsbZtZhyHPn3m0eOF9d52XioBzgKrXdAfHXJa6R3/
         5KytB1SV58sOVKJYwi6KTDkiGCuQWcBl8g5wab4NIbQIG66ZuARl3HHioKPKwnsJa8vu
         7BsthoyseeHK9eP7CLJFuTtrmqZJOFzzZnSv0LDD2nTQCWZZFRT1XmCO08vg+jj/uzW3
         Ot1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dThNb9up0Udv82pZnAoy1KC7krZ7htoDQTtIaOGdW3Q=;
        b=ffsRf9iikA+7Ue8RpKNV4xIZcZZckrrqm3/8SXtjV9xKE+UcUT7oYZ4NZsF4QYp8bZ
         c+rUT5U2Bwd072GfoxcmJFYojTRtzfNKR89BGFWNThE/N5IAwfT3bGlemJx32OGHXEVV
         SeCfkuAHT/DoYbqwuln20dGhodR1XGZ1jClhc29xiwOGwVHfnfg5OIikHQ2gyegGu24E
         yRXYmivRynmdUdY+IYHg6Cy4A3t/x6gCel3+DdC9VnMIMsISN3A4wMeDrWtQLtXbS3BE
         84z67lMIPcwcuX1LTQkkVVSDTPGOifVziE7Eu8F52onTEDUijFQj06QrK/WxVEriM6Qz
         hSPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PTe955kO;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id z12si5754959ejc.42.2021.09.03.10.47.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PTe955kO;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dThNb9up0Udv82pZnAoy1KC7krZ7htoDQTtIaOGdW3Q=;
	b=PTe955kO7yqTd1uUxG/tWBNRwrXUuzrPX/FeJJdANxqvz089PagPlRUAFyY+0gZbrp5onW
	cyOu35Yhihr3pksdMt+rLSY2jSviSQX9KwPn25RzHkMl9M1SHgldRVtyJNs+Jw0xUoQLhK
	9UUkjUn9HaHL0kB07zN0S4zuiEZNbxM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-Qq1t8hofPai6BgMpJLC5aw-1; Fri, 03 Sep 2021 13:47:42 -0400
X-MC-Unique: Qq1t8hofPai6BgMpJLC5aw-1
Received: by mail-wm1-f70.google.com with SMTP id j135-20020a1c238d000000b002e87aa95b5aso52940wmj.4
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dThNb9up0Udv82pZnAoy1KC7krZ7htoDQTtIaOGdW3Q=;
        b=ZiimG5SheQl9WLxPMiy0Q/UQ/s4qiffQMljU1B4uPtmaOvqRkMrFmz92dno/bLlwLx
         xayeuxmR/A1VsxzpxpOU5hLg6WUFKIP7L5FR7RDb4glxSIDLk8WWmtTrEQjpwQjsPQkG
         Y6DCbRvJBWcboyXQ0r/DwN56xg4X1hyCoYG7dhp0rfMVZJjRH7CM87Z+QEzDUvq1I3MY
         ufNGbW2ZeaguGGVGnLaVaYwHJtuEGw7OGRmhoS3Nv1ICC8+BP3rtZ56hqbx+kpxa7/FY
         xsrV5n/gjP4GHHcq5C7G2JJOgt5qG73ARhzRQ3kTzlxvyAeO5UW2DGc0l7gRFVrXR797
         UyOA==
X-Gm-Message-State: AOAM533c97+48MIsO8w3L8+BRo9zTIyevddUinSKiVjfANqztv2r5JsF
	F4mP1n4jt6Rd5S//Fbi8BLN+0mwuMkQqHF5Gus7wNO/S6vWNbQQJAR5qrRQIUJRXqaSR1N9tHBH
	A+GSOqc/Cw9wiqkLs
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr12120wmj.169.1630691261148;
        Fri, 03 Sep 2021 10:47:41 -0700 (PDT)
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr12089wmj.169.1630691260951;
        Fri, 03 Sep 2021 10:47:40 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id t11sm38889wmi.23.2021.09.03.10.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:47:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org,
	"Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v3 28/28] checkpatch: Do not allow deprecated g_memdup()
Date: Fri,  3 Sep 2021 19:45:10 +0200
Message-Id: <20210903174510.751630-29-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YRqJsDUyxl6D

g_memdup() is insecure and as been deprecated in GLib 2.68.
QEMU provides the safely equivalent g_memdup2() wrapper.

Do not allow more g_memdup() calls in the repository, provide
a hint to use g_memdup2().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/checkpatch.pl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index cb8eff233e0..5caa739db48 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2850,6 +2850,11 @@ sub process {
 			WARN("consider using g_path_get_$1() in preference to g_strdup($1())\n" . $herecurr);
 		}
 
+# enforce g_memdup2() over g_memdup()
+		if ($line =~ /\bg_memdup\s*\(/) {
+			ERROR("use g_memdup2() instead of unsafe g_memdup()\n" . $herecurr);
+		}
+
 # recommend qemu_strto* over strto* for numeric conversions
 		if ($line =~ /\b(strto[^kd].*?)\s*\(/) {
 			ERROR("consider using qemu_$1 in preference to $1\n" . $herecurr);
-- 
2.31.1
