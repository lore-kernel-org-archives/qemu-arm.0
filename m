Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3006515lfg;
        Mon, 3 May 2021 14:10:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkPqWXtbPffyqhfD/3u8G4MmwNeY2qSk1kzIIwRJ+vLQhRhwjU8M4GKE5HijiTqS1Fc4fo
X-Received: by 2002:aa7:d408:: with SMTP id z8mr8121534edq.286.1620076230659;
        Mon, 03 May 2021 14:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620076230; cv=none;
        d=google.com; s=arc-20160816;
        b=hJrYuCnttOZUyk/mnfvtwT8N4dEE+uvtl4NRiSKdp/8CbbeY+oUHH3H7TV1CMWFS7H
         fvmE6NSiojC69GvksrIqqtUwCBUnXTUqcEHn9hD1U3Zp5sUoT8HOsNSHdjblYiDoV0yC
         ejeXrB16I3+JbAFYjk3wX/INdrS+rkw5VMMKUZ98SG0StDpoIu9//LGtq7I2T/9jCqcy
         U8RiPBemt5dDeAAhoj3VroWnGB8HZ4dlgEslaeh4u5vhFC0PEDbNMPJXfH2Y617HAQ2Z
         rA6TSY4lwF466BRuetpA+1NRxSKrg6AGFjSg+6dqZosBIz+Tge+W/xR9jC7Y4lasm/ZR
         biNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Q6/hT/PIJKMoFbY2PhDO/rAVfPgYfzeV9gjOhaljcfU=;
        b=mvQWOF6SydXLrXuv4ycS/XCUvLCrb0nb1drXmk4tFtBkGEEEjs9NsdF5O941hHV/XX
         Uk+MGYaSMG9cWUK4YDoELHHvg2LPDAZ2iiqVZke/ZrIrbbR85MXodnC0HSu2YVl6zAOo
         kGFH0MKYFPMRBCUwLAQCKkTYXy0tjDGwTfaWgSLJXW1rufkrgfsiRwIY15f8FFRkkHSf
         QH9EuliFdAU7Wc1gYWNgz/+k8KMj+Q6gAEAhmTXdOCi+YtMCfTpKKHad8hOwJHOf2x72
         Kw3q4qPTbFSp6U4of64v6/xfV8x79yNlRvBkHJJl4SHKNvCXv4b3Z0B6ea7cQ7ojZn8U
         QRKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=foOMzHQ6;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id hc43si1067889ejc.529.2021.05.03.14.10.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 14:10:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=foOMzHQ6;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620076229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q6/hT/PIJKMoFbY2PhDO/rAVfPgYfzeV9gjOhaljcfU=;
	b=foOMzHQ6ijK1s+dOYc2H/uLK0Y4MQX5x2CY07jAHXSjLOFggkF6NZlDtr4rCghXcivPRvR
	yCjWFU9yCUj8koEgKcKLvpexwdSuZEWBDzA1du3FZTjn3HHkh26MVJzBETgQ6SuylrY94p
	osp7g944ZYSPLDZdetfli0LRc4zdQig=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-UKHzVux9P7S3jFUG3uO9hA-1; Mon, 03 May 2021 17:10:28 -0400
X-MC-Unique: UKHzVux9P7S3jFUG3uO9hA-1
Received: by mail-wr1-f72.google.com with SMTP id 93-20020adf93e60000b029010d9bb1923eso4665535wrp.4
        for <alex.bennee@linaro.org>; Mon, 03 May 2021 14:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q6/hT/PIJKMoFbY2PhDO/rAVfPgYfzeV9gjOhaljcfU=;
        b=AkvAFb+c4gTIMTRQHPtDKZ4+Qi+pTE9nCAuMq9RJNA/JG/i313+k73Vb0PoKa92uTK
         DsJu4uviZ8Y211eZAb3Boq7YYwtRdi+hQ2Ge/VbEMsJYUbxJSp4I0EsfhDKsYP0Gh+1Z
         fdIw5x7vCWoTExM9jXDPM6Wf0ENciJDNUSwrSjx/i6EVittnxuC26sJa2iNpoN/GJqi9
         pfBc4K4wi9vNtzTCIrMuC7h2dBxYE2Kp7XgiWpHP4ckuByQoPE/AV8BOWkOctQSPmorD
         L9pOU5mPPp2PL7oJL4NBsCg2hl+Lu4fxi3TRaPq3qMLZ4b8csnL0px40R1wfFOxA0+JC
         wntw==
X-Gm-Message-State: AOAM530S45wCYwVjZQWSYn+5rRcm8KQL6/MqAdaIDvBiaZPTWnIAdeEC
	zTwTWWe+jhLmsO2qegPjOoNKmUsfA09RYSqqeabe4ZF8aLzIvdfUgE26i2CtzgfVfWdMnNClcUC
	oxDM+EricCgtC6tjL
X-Received: by 2002:a05:600c:4ecd:: with SMTP id g13mr22800397wmq.173.1620076227385;
        Mon, 03 May 2021 14:10:27 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecd:: with SMTP id g13mr22800386wmq.173.1620076227278;
        Mon, 03 May 2021 14:10:27 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id a15sm13328777wrr.53.2021.05.03.14.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:10:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v6 01/12] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs section
Date: Mon,  3 May 2021 23:10:09 +0200
Message-Id: <20210503211020.894589-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: B6+kVEW94BBv

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
