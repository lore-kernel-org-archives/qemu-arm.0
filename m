Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2501696lfc;
        Fri, 13 Mar 2020 11:37:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsVRtergftfG5DJhk/Z8TUe5iycDLr8/LGuoLY9b0fdvMYyEPKNLZUJWSliKLSZx3Eyt18A
X-Received: by 2002:a25:858e:: with SMTP id x14mr19343358ybk.94.1584124670126;
        Fri, 13 Mar 2020 11:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124670; cv=none;
        d=google.com; s=arc-20160816;
        b=Pb8EOfdDHrubGOBcOabMrFPC4X7qVVP40l1vu7eq7cT4aoYSaYeocUrMvYSU9pfCi0
         0dReufduRMmDdHqmWbh3feqmZO0fa6bm7Oh5N050KAhfZhGmAatQjYIl14foVSsFpgJZ
         LwU3PW50yavB4msAQdArCcSMh8ioTDcW1RH7xKxLid6gs/m3q2UM389OL8AOnIhnnR4P
         Mji3kEsD1GqRooYcNJIOSlxXkUbWewy6zXTvORqwoFsga1SwFLQQRdrH+bt50AdyjwUm
         BXoNlHx3WiHkag1D2Qrz1yFc+0KfxWrwbcSyWB3mheKABBmnVw5CbUORSKlDkZLVeHuy
         WIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4rpQjl/4AvtYAvRXnGhGAakMCQznzosD1UbxsdwPAhc=;
        b=QN5VERJjfRbggUnbSRY4Vd9gFm9ef2owAUGeDxIoa5V0UxV695NT93uV+Ybp0pYeeJ
         eBeWqtR6yqxbo8yhcDn1gtZtAbdDyHkOgBR+yfcMQZX0ZiKUaUMmBx0gO8Go/uPIV9Bm
         RuxIFSNPAuhaLSHKXCgrlME2iOTlLMt/YrfFqpl4mQj7kWqUpfl1vdiTJam6YJlK6doD
         T8emTUXHt343u55raytra87iGHfsCtEeepq+nVQmEk0KOg53//oTlJ7zvkICCRZgca3Y
         0tdcqHf/fpdLusd1gjqrZZpCq+FUegiFn89A1kl5L9u/1R1xJwYkDPa9gkHOtIjCEQNB
         PV7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PUgg4MU4;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id v4si7207245ybi.35.2020.03.13.11.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:37:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PUgg4MU4;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4rpQjl/4AvtYAvRXnGhGAakMCQznzosD1UbxsdwPAhc=;
	b=PUgg4MU4yaoTxeMJUx68Xa9xrhnB+Z1tqPpyhnGQ0vu5tiAuF6AcNWidFLHRpuT+cUMpr8
	nqPoIuEot4mFX73dE5PCYiRvEJy99Xg8HjS6sm5OMImPkLcORy+5L0U6IQ+YC7QbrkL1pn
	3J5KCLoGyMFx2vOkZaYo+uf+MLPO8fs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-D81zzpfTMQieFTMmQORL_w-1; Fri, 13 Mar 2020 14:37:47 -0400
X-MC-Unique: D81zzpfTMQieFTMmQORL_w-1
Received: by mail-wr1-f69.google.com with SMTP id p2so2183786wrw.8
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5D+mNrA7Q9tvp/FL52Wgm2fEGpMf3trSL+14VYf2HSA=;
        b=hCJWFsHf7D+9dWnVI0mGNL+UNO0XkI+ufUUuschrAzUgLSuw3kf+LYwESye6V/5vGZ
         yW4anX2QwugUyRE50oIFKqg02+zzNz7ME9dwbjMYkkIbLKCY+3HeoQulhdVZT9bY1QvU
         83QLAQ9C9RdYHuZqT+XDQgl4yzmdfKYI+M0IZ0BlVNDqNPsyRrhE/ZXsZJROz+ORiYvS
         3uO8WJcopJZcoZWPBA8dPI+IIxODwJlj2sJo2kabU8RmS8uBk+q/04xYZ7fATlZm1GxX
         MACCCGPja3lgWzQSGD+Ua0rS3sjmdhRfEPcscgxrgWca6Ogt+OcOu2ZWIyFQi4GrMCad
         KC/w==
X-Gm-Message-State: ANhLgQ2twhnypb9NiVFu/a7xDweE+MRvn0aP44Ljucz7Ir8NhysXBTLx
	x27outfe/Bqgbji7gCLd1F73KnBVRV8WWYL8yDRleFv5K1YiubWiOPwrzNUz5iWv+cZOB2dZQW7
	C9xB0C837/GvUjV3o
X-Received: by 2002:adf:b650:: with SMTP id i16mr7761462wre.316.1584124666610;
        Fri, 13 Mar 2020 11:37:46 -0700 (PDT)
X-Received: by 2002:adf:b650:: with SMTP id i16mr7761438wre.316.1584124666470;
        Fri, 13 Mar 2020 11:37:46 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id n14sm6761179wmi.19.2020.03.13.11.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:37:46 -0700 (PDT)
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
Subject: [PATCH 10/14] arch_init: Remove unused 'qapi-commands-misc.h' include
Date: Fri, 13 Mar 2020 19:36:48 +0100
Message-Id: <20200313183652.10258-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: SpTRhL8dLK/I

Commit ffaee83bcb2 moved qmp_query_target but forgot to remove
this include.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 arch_init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch_init.c b/arch_init.c
index 705d0b94ad..074fa621b6 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -27,7 +27,6 @@
 #include "sysemu/arch_init.h"
 #include "hw/pci/pci.h"
 #include "hw/audio/soundhw.h"
-#include "qapi/qapi-commands-misc.h"
 #include "qapi/error.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
--=20
2.21.1
