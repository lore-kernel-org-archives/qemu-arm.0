Received: by 2002:a05:7022:7e0d:b0:70:a3b7:dfe7 with SMTP id ut13csp6659378dlb;
        Tue, 2 Jan 2024 08:05:25 -0800 (PST)
X-Received: by 2002:a05:600c:4886:b0:40c:3664:aeaa with SMTP id j6-20020a05600c488600b0040c3664aeaamr5794150wmp.148.1704211525124;
        Tue, 02 Jan 2024 08:05:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704211525; cv=none;
        d=google.com; s=arc-20160816;
        b=TcAggQ1Ik0snLUp+flOAt20o0JeGQWhclEFc27HlUwU5/ynBmEGSXYMk5G75uVXMDf
         jK9XJHNUc6DmoDotuNuXadTWn+4P3cP723aMZUsEmgE++hRykb6MMfCS0jSvHSStZhrU
         utXzfJ16nJxYbWbRhMK+6JtWqvDLJrP0sBaG2ZzrUpA6C6y6uuzg6sN8vru5eLRiyixs
         dDwFpmI8oOVKSWP9h+TlHBXWs9HipTJ7YwHotBQVlhS9Ys3LZbU+8UY4eq8QGuVXhwbg
         0PRFg9WEW3ZKg1P5s1g34LVPRnTvMFUl4au8weWVnUx7Vahpu/jJWwUn5f/fO48nqGmg
         H21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6BwjC+ujFoVcnh1DxjxgU1C6te3MWe6aqORUUnNaIGM=;
        fh=Fbl4rt7vNadFyu+mhE5sPZ2m5GJmVL0UTbP+h3uuTlY=;
        b=Vj4rWzylxr4qXPqD7qasLAUHfnJsZqNq30lic3r0BdfUDkmjrsJnIfI4V9VKIkD7O2
         j4YX+XPwfeVDx7Yr962acVVR+cUtzHy4VxI6w/DVAswuRzx5TuXvoctAh05MHd5VkqH2
         zzraD96vygtd8r0RrF5BTeJ8m/V8xpHU/VON3Rqd14OENU3k58dizvOjEdv56TvEZ347
         B6qbqqZCRIFcibXY8ofVQDxn11bcYbHWwYEZUf4JZBNRJ8u0wRAGEMEzq6liJKjvmYaC
         Ro/cel3yXbLRYmWmi56zlNmel7nVqXmxT+4H4is0k4do61Vzlgv847DMPzjNy/yy5u0d
         4pww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqV1fILj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u14-20020a05600c19ce00b0040d87192b73sor1630958wmq.3.2024.01.02.08.05.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jan 2024 08:05:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqV1fILj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704211524; x=1704816324; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BwjC+ujFoVcnh1DxjxgU1C6te3MWe6aqORUUnNaIGM=;
        b=FqV1fILjUew8RTBzjNjFuH6QHnfrFvk7s9qIzTN1vPCG6XlDqpu3CpO5rUxRQRUbgo
         FHcLZgDelfUkTXrlHaOnRZ3de8uOofPPSttqOWrcMu33aVk+FNFb0Gxw8wl6FtMZB00I
         hcFhKy9BVG8TbteUHw1Yft4JEfZew48/gQ6eDrmZHjNRhueyFvAwUOICkbEQe+i+Lizu
         KpA+DBjgIQi7uUcWjtSOuI7Fwlat+HQd47yTMnRN1lELDXXyKh+Y3yLD8yKAnc+17Pao
         BtIqyh1qNOP7AvlAahOQPZp3tEljKY00ffwMKdF5VW9zOQD6+cJZaLAd+ETSydnzjZMG
         65Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704211524; x=1704816324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BwjC+ujFoVcnh1DxjxgU1C6te3MWe6aqORUUnNaIGM=;
        b=wi6TUtspdzoGBqouOLGXSCV9IpVPHexLPqU1oVv7MgD7WglShaOfHL7O0SbIZwlxqc
         nw3QE7wi0nYiRhhxzCRK20aMJcI9ExksblC/+s8XEjgjYVCLexi5/8qvgJoKy+SFdTUA
         LVMgA49PR94FuoGgJhu43cfawl07cFiF3hxZZEqC8W+BPGmasFMuDAzVN8P3vBPvzGxp
         zVW9E6h8qswFKU5S/YFJFsbG/uR/QP1crxIoeCDa8J592/GrVjW4ydPC6DndrfTtk1lM
         QpVb2jAqA2xKJE59LOg1Qfx8gR2oN5tvM2cYi/khEvKz76qWhcoUso6ENyClpCDF1/F9
         vVSw==
X-Gm-Message-State: AOJu0YxGIITFeGfjtliLefoZI0fKsnJVzZStGsqYlWqpcSOTXkOvfc2D
	DP9MJp36i2AI0zbB5sj/ois4UOmmnefRJvgK
X-Google-Smtp-Source: AGHT+IEr2Xaz+dnCGfu3Wh34558swFw/Oy2LhA/afKeYUi5+1wP3jjMtyLhrgd0jbz6osbxKK7xh4g==
X-Received: by 2002:a05:600c:a44:b0:40d:7822:bf54 with SMTP id c4-20020a05600c0a4400b0040d7822bf54mr2417553wmq.132.1704211524670;
        Tue, 02 Jan 2024 08:05:24 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (sal63-h02-176-184-16-71.dsl.sta.abo.bbox.fr. [176.184.16.71])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c314f00b0040d5f466deesm22836750wmo.38.2024.01.02.08.05.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 02 Jan 2024 08:05:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Luc Michel <luc.michel@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	Frederic Konrad <fkonrad@amd.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 4/5] hw/arm/armv7m: Error if trying to set unavailable ARMCPU::vfp property
Date: Tue,  2 Jan 2024 17:04:53 +0100
Message-ID: <20240102160455.68612-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240102160455.68612-1-philmd@linaro.org>
References: <20240102160455.68612-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Bh39KYlVxSfG

Do not ignore impossible configuration requested by the user.
For example, when trying to enable VFP on a Cortex-M33 we now get:

  qemu-system-arm: 'cortex-m33-arm-cpu' does not support VFP

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 3610f6f4a1..12cdad09f9 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -328,6 +328,9 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
         if (!object_property_set_bool(OBJECT(s->cpu), "vfp", s->vfp, errp)) {
             return;
         }
+    } else if (s->vfp == OPTIONAL_BOOL_TRUE) {
+        error_setg(errp, "'%s' does not support VFP", s->cpu_type);
+        return;
     }
     if (object_property_find(OBJECT(s->cpu), "dsp")) {
         if (!object_property_set_bool(OBJECT(s->cpu), "dsp", s->dsp, errp)) {
-- 
2.41.0
