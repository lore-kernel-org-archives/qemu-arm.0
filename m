Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2501652lfc;
        Fri, 13 Mar 2020 11:37:47 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvBAupkV3maoewAVAfIXTpW05hVnVKnwttlGeDsMrAIAjZf8oQD0Fodsyv8pG5UP7fDjnr0
X-Received: by 2002:a25:da89:: with SMTP id n131mr4410419ybf.130.1584124667042;
        Fri, 13 Mar 2020 11:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124667; cv=none;
        d=google.com; s=arc-20160816;
        b=Vi0qT5LI/D0NLTrrT8W7wnt2l8TfNq8ChZ2sacbwmrNNs2oAy1mCevQN4bEogc/Ll/
         DhrSK21635BW7GY32YUNFw8/6jCcgldRxAwrr7IcvvPDnzdwr8A6JwTWyJk45FDRvUw0
         2FsjAHCymn7lSS9qJzofukwUm6gt2HimIlHwvYUIMMH4ONmpg/8WiqCYO7au1bydlypd
         z6xjs5FYP92v++Q69swyaE5X3JCvi2DgmvsaXQnRnpeuoz+fh37m/pYekSorXvxwmscM
         nLNn6fJg8jezib2lxvgPSXGvuHhbbOn7kKSueAkExbsSGtPchf3mmiEeNf3+Wizz24kO
         bbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wGoD8B/E7ALRdyPVkuOPFi6qepohKGtXhwvJlBp3QNU=;
        b=Ronb/WfQV4+pMzAgb//hbKIW60zhMO6qHI2Fx7ByzcWyG4CdjyA72p/YYY1axEqk2c
         ammkj3fVv44aqVZjbDrWkqC/w6SvYsqcpgQe/fIrwNCsVP8LXyn0yV+BSJOGtRoYBXBB
         /ljVtw7KHdzA2+1a0fwTeHmdQVNY/HsyWAgt/UOXk3vuDGgbUzt2EHsOiG3ABbsuSQGt
         Z451is86Lqk2/Rzx53beIvK4knCvTBv3CCNkepQRVDMCxeNanf7Cmz7zjC30rYzWsnGR
         OMJFF+QL4XOqQ3VIyVMYDzYpJObFxTVIAoHJ+0P7xGmEVhimPfnm7trkdOFlIghb106y
         9ktQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MuGN3hhh;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id s123si4173982ybs.470.2020.03.13.11.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:37:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MuGN3hhh;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wGoD8B/E7ALRdyPVkuOPFi6qepohKGtXhwvJlBp3QNU=;
	b=MuGN3hhhOAUWPmxolrhHGQ+OIPjeMecalDMRM6SujmlXH6DwsS+rpAItgx+053iIDSMGHd
	EwG1WxFZK+2xlzBXmXqif604jiUe2VfQ8HVLGj29QUzm9x8t5u+MoKiYiLAOV1Nbh/4uz9
	62p69J2v7d0KAL+Kp5kswQFkieA1hDA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-GQwB5vEWOHO9L05_tR0sbg-1; Fri, 13 Mar 2020 14:37:42 -0400
X-MC-Unique: GQwB5vEWOHO9L05_tR0sbg-1
Received: by mail-wm1-f71.google.com with SMTP id n25so3297929wmi.5
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T76tUQ+vOJYR7iIj3p+P6wqlEgQ0pagAj6PhTCTXdsc=;
        b=EuHx6y4752+wYkk+IkSPbZLrf2HGEx0+2jYe59FvWLPOqHBdKvCGxj8VTY+uUvaRht
         qjHAYCldY7GoGmUJldxWn8Fsv9AF2JoeyJoPeY2r4KwKFy+CIFW4bTo6UVwAhOzEdG/M
         gQJjk6vt0WdWUYyQVD1TcM/BKbL37cqO2rztxuculV6bYL1wl+m9djAYOlyzVqL25xEw
         r0EOTWb4dhFR1GDGHUpcJz5qec/KVkCBPM34KEJiWM4F5G9ZtH2b6PbJIGUaA/QbO+0S
         qnpjzM7RTgAQ/qJt6W1byOztEI7YU5foodlLerLNrN6c6e78Dh9f4ssl+SzZ52ggPLCE
         7qWw==
X-Gm-Message-State: ANhLgQ3S7xD3LDimb0HHLKxCBd8RwJXyyWPM0hi+3c5aSM7l8O2F6S17
	95vJ6uyBykz3MBQlB3q9bbIJqVOQ8Ji6yciVSksROctFGhsxBG+hVfwQNkuXH/u/WB+PHp0A/Yp
	0MVFYXzI1czVD0grG
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr11560606wmj.157.1584124661706;
        Fri, 13 Mar 2020 11:37:41 -0700 (PDT)
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr11560582wmj.157.1584124661544;
        Fri, 13 Mar 2020 11:37:41 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id w10sm4132784wrr.49.2020.03.13.11.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:37:40 -0700 (PDT)
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
Subject: [PATCH 09/14] exec: Drop redundant #ifdeffery
Date: Fri, 13 Mar 2020 19:36:47 +0100
Message-Id: <20200313183652.10258-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: V2PDQbtnR4RH

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 exec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/exec.c b/exec.c
index 7bc9828c5b..f258502966 100644
--- a/exec.c
+++ b/exec.c
@@ -185,10 +185,6 @@ struct DirtyBitmapSnapshot {
     unsigned long dirty[];
 };
=20
-#endif
-
-#if !defined(CONFIG_USER_ONLY)
-
 static void phys_map_node_reserve(PhysPageMap *map, unsigned nodes)
 {
     static unsigned alloc_hint =3D 16;
--=20
2.21.1
