Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2501133lfc;
        Fri, 13 Mar 2020 11:37:15 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsSEyEEc0pgu3h0+0ZQvNeRyG3yq6cULWLn3j9lJOOO9fWzyYOuy7aR/M2VedLAte+Jd9yX
X-Received: by 2002:a25:d80e:: with SMTP id p14mr19037852ybg.196.1584124635330;
        Fri, 13 Mar 2020 11:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584124635; cv=none;
        d=google.com; s=arc-20160816;
        b=s92tVh2TiiBxYqipXssTnbE4cNjKBhijyNvGZVEccBWhwfHAa22Wog1U0q/sFKSJh7
         Q+bEig8qTq6YO/gJiNaGHS3hw+Qe9D/POovUXR+IKcIA6T/w1RtgwnaUv6n5DE9gYZ5a
         YNDTaaSYPX1KzxAyrJ0N4/nZaXtT+VL6GWsBDnECnaw6Wt5INzkxvCqzsUyrT+5O9CJJ
         pBPRMO4SvOb8DaXcrO2oRX/v7nFDyJKyelqBr0gawikZ7jvaTP4zSOlhi7HnB8nl9TQ7
         +s3zUOTeupLZPbUBq1U29JA5Fut63yHA6XbHRJZnEvljA2HN88iLR5q7HVdGnkxTgvB9
         qeKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=S10AEwUkiwmQGgsU4J5LemLC20/NIYdtHAyFHsvDHiI=;
        b=tl2ZUEqIY513QSWYTSF8wuwEpGYs+P66aFO4mrwF4BUoWQSJVZh48Jg7TrJ8XzY3el
         ZBfJcs2/MTvQWtdK2470SiEaBaPcDBPtIrouTwCNcnbU6grcTRq+bP+iO/ANbsjKHW09
         dS9VcY5XUO918/MK9/dS1UNK5Pkmw9kASvPkAvnV1lSR6XoNsGvfQwzt3Ynl8FDnwTwz
         cetDsbsGWpG7g3sRLROch+fk4HlIoXa67zwSYVHdNSVwCbKhnuyLA1HZOcFp18tk2229
         84QbhAdnjoynCZrKLvNk+gYPkG+gDfWwDvVf3rczVl/qbUin4ZY2aQRrfD5cBx3q4qY7
         ZR1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MY+FZcjw;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id d74si6339174ybh.166.2020.03.13.11.37.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 11:37:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MY+FZcjw;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584124634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S10AEwUkiwmQGgsU4J5LemLC20/NIYdtHAyFHsvDHiI=;
	b=MY+FZcjwk7C7bWDPDheuzYTMuaZLybStMwDO4Pw1owHauYQj8upz3KQ0QQWJxw0ojuQkE1
	6KJSG58nUkAGgR+P5IQFXyl/YoEJx1FTcNl/qDY+GbzXYRUMA4ivbrbBnirRlv+iijxjuV
	j42OiPk0I3rtuCMYtpTADx3G9gQ7GQw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-yM3S4_ZWMXC3ANoYAZvYOg-1; Fri, 13 Mar 2020 14:37:12 -0400
X-MC-Unique: yM3S4_ZWMXC3ANoYAZvYOg-1
Received: by mail-wr1-f70.google.com with SMTP id p5so4672996wrj.17
        for <alex.bennee@linaro.org>; Fri, 13 Mar 2020 11:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i8/Rx/aNeBnn+CcI3JJAXpd+80BCLbOpEr5mf5Uimz0=;
        b=FnkM8aD2BbpAocXrxBakp0AXRJYriZrYHtoey3H3CNU7tgqD+5i72ws8L6WjB2oYAQ
         KXg/l/opD88iaweNIp3VH2Ey71do/RUrpvSf8JF7uIn2Z8KQLw9zj/qIOnZJBGfnCplE
         9vfdxaVHbmv+TPsX79ozFbJr2wjb/jJ3Jf3LSKzNFj7lPM/528MJzTYZ8PDD5IbMVXNS
         nKvbs+2mHex/TvotKrRpnACZyjykKBvnBn1EuU3GrA3VOSZ3pbQ2LF8YJyW0Oa9S+FKV
         5ZE8/sJkmWzST8cvhMOc41maoc1RXebkD1uC4UHbcX0dBUqOLYY1chIcpThBhKRDUC66
         Cpow==
X-Gm-Message-State: ANhLgQ2tIDnmFqx6o3UWEV3G7r8EoSKjMfrqzB9Fkr8lrIgxH+NkW1cF
	IGzZPwD26sX70dYzWfLqY6e7bBgzXmdVxLVNTicm2ZrtZRBKlQl/gAZtV9VsAXG9O/nYCFMi6tE
	NAjp5WFMVpMwJv453
X-Received: by 2002:a05:600c:410b:: with SMTP id j11mr12489582wmi.86.1584124631678;
        Fri, 13 Mar 2020 11:37:11 -0700 (PDT)
X-Received: by 2002:a05:600c:410b:: with SMTP id j11mr12489569wmi.86.1584124631400;
        Fri, 13 Mar 2020 11:37:11 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net. [88.21.205.47])
        by smtp.gmail.com with ESMTPSA id q13sm29664354wrs.91.2020.03.13.11.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:37:10 -0700 (PDT)
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
Subject: [PATCH 03/14] tests/Makefile: Only display TCG-related tests when TCG is available
Date: Fri, 13 Mar 2020 19:36:41 +0100
Message-Id: <20200313183652.10258-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200313183652.10258-1-philmd@redhat.com>
References: <20200313183652.10258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 4+86pHPV/sQq

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/Makefile.include | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 67e8fcddda..99db5eb3e0 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -12,8 +12,10 @@ check-help:
 =09@echo " $(MAKE) check-speed          Run qobject speed tests"
 =09@echo " $(MAKE) check-qapi-schema    Run QAPI schema tests"
 =09@echo " $(MAKE) check-block          Run block tests"
+ifeq ($(CONFIG_TCG),y)
 =09@echo " $(MAKE) check-tcg            Run TCG tests"
 =09@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
+endif
 =09@echo " $(MAKE) check-acceptance     Run all acceptance (functional) te=
sts"
 =09@echo
 =09@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test r=
eport"
--=20
2.21.1
