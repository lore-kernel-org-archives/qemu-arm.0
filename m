Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1373592lfg;
        Sat, 1 May 2021 15:36:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIbHecfj3+WBxzBeLfFSkbcGWlnDg5DuJAO5NrdXaw0xQOMqsve01nONjCx8GNMH/ZdMGQ
X-Received: by 2002:a17:906:c04a:: with SMTP id bm10mr10298015ejb.521.1619908609730;
        Sat, 01 May 2021 15:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619908609; cv=none;
        d=google.com; s=arc-20160816;
        b=PTMio/tWFnn+bZ2xH+DEQhLb5rXcnMdIfarbpjEW9HzfvOVU74K8KNa5+5KkjGRedO
         NOs0NVp23+4Knv8rYgPcXgdXC8GH0U2BGvtxdhpj3LIjjRkKnuyIGdgm5WjXhWqqivLo
         FsD68q8oGn12mL/mk0xyA+VJfbNhkQLyvT6cfCr/oAQp2dyLEwLp/ftyMxJXT5Vj7TSN
         LMpchz96p6aNDru4ZM8MYiG4aMFiTdsqVAdRAmDyVRfAaEGqkOKT6ijv637IDG760eNA
         r5MfcKKvleu51B+qYj+2tSmYsnH4WDjooCwgxD+u2Y/gwzSGOeml8nMBu9k/Ym55d0mh
         hsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Q6/hT/PIJKMoFbY2PhDO/rAVfPgYfzeV9gjOhaljcfU=;
        b=CAzg0E2+SRWQIffX/7NucT1mpnnTfo80Po0KOEdGzTA/YCYKf8rv948AeCZnMmqUw1
         Ao0Cji/m5RXvpEkQYhBj+3NMkifcYn5xGha2Qs145H3eYmrl01ZC2jKX5tZfNBQUUDvx
         8hcARvyvYukFWj0oHvXMv03YP9AcxUzKeIzaM39/egqIciTq/QhZnT1UwvnPrOyIRKd5
         cse6oNGsxxtXCL+nkmdXfH1Bw8RnwZy/94fw5yhZGdupdwYTBQBfc3bgEmSisTvQFkzY
         Seyz6BUNC/2GejYhFAaaKie+OekULkwe7vmQJAEB14sxJyF9ugDLofwUGxtdPo2wOKZv
         kuMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zy39JdQI;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id y20si5001630edw.173.2021.05.01.15.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 May 2021 15:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zy39JdQI;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619908608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q6/hT/PIJKMoFbY2PhDO/rAVfPgYfzeV9gjOhaljcfU=;
	b=Zy39JdQIqBoZxGXQsfoARkliH8D7S8iE2XufsrJU/trAqScw7HSr42XoZnS6gnYZfrZOtE
	xHqM5pfVte/uyZwrcxmlE/W23M8EzROg/9Z4PZIg5fXRkZhdtJsVTPk2d/CH/fdM5LbUpe
	m2gk0BYHsKYnlmcSjmJOnZcB+8uz4mo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-VlDrXLK-NjGLc8wipO93hw-1; Sat, 01 May 2021 18:36:47 -0400
X-MC-Unique: VlDrXLK-NjGLc8wipO93hw-1
Received: by mail-wr1-f72.google.com with SMTP id 4-20020adf91840000b029010d9c088599so1295822wri.10
        for <alex.bennee@linaro.org>; Sat, 01 May 2021 15:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q6/hT/PIJKMoFbY2PhDO/rAVfPgYfzeV9gjOhaljcfU=;
        b=rtKcOSvjpHdL6lf5Ixmbmr/+RjbYsvOEKQGsD8uc0cJq43g6xZiLIwOMAmMc8Vc5Bb
         m/q1ddK9lsdQ49T3bFGLYYcRUl9ZYCyIpourDot96EYvXOHd/p+ozdKSXgyngNdQqEzO
         V293K8EyuMWiKiT0uzSRCQpnxe6HX6onBQmLYEKzYQSI+HNzX4Do7jGFv+1oqymOvJLX
         pGW4RFn53HicF23e2lYI8ARLUsuy9oNl5pZvuWyFcPzVTULO5jnK6Yah/OD08REEvZAS
         04DH5qj1pKqsa/K6UZfL/HGzXzOwVFM4ivRN6mP1Ktb/mp4pOhaimsjIH9tx8yyi9ug6
         AI9A==
X-Gm-Message-State: AOAM531B+Uleo8Ojv7Q5tuG7EJC+of4X5PI6O2kJCTXO9pSFKeWuNhqG
	GZR/7zp5SsSC3W+EGO23nfyn0azWfUuz5j1287Vxra6Q3XkjBTSGRUM8ceCT6tepfisWu4fZACJ
	YzEF0/PTjYHY6umJ9
X-Received: by 2002:a1c:5945:: with SMTP id n66mr13739555wmb.139.1619908605982;
        Sat, 01 May 2021 15:36:45 -0700 (PDT)
X-Received: by 2002:a1c:5945:: with SMTP id n66mr13739542wmb.139.1619908605850;
        Sat, 01 May 2021 15:36:45 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id z7sm7154737wrl.11.2021.05.01.15.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 15:36:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 01/10] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs section
Date: Sun,  2 May 2021 00:36:29 +0200
Message-Id: <20210501223638.510712-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2CRzeSK8clws

We want the ARM maintainers and the qemu-arm@ list to be
notified when this file is modified. Add an entry to the
'ARM TCG CPUs' section in the MAINTAINERS file.

Acked-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4c05ff8bbab..5f1f59f9b3c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -156,6 +156,7 @@ S: Maintained
 F: target/arm/
 F: tests/tcg/arm/
 F: tests/tcg/aarch64/
+F: tests/qtest/arm-cpu-features.c
 F: hw/arm/
 F: hw/cpu/a*mpcore.c
 F: include/hw/cpu/a*mpcore.h
-- 
2.26.3
