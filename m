Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2138380wre;
        Sat, 2 Jun 2018 17:11:26 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK36WnjSTzPmKPEdTHvpBcdKfssNQO+gI9ghEe5aizTGSXGCt1ay9VhsN2LMpX0yMbqVqFK
X-Received: by 2002:ac8:6612:: with SMTP id c18-v6mr16227599qtp.343.1527984686404;
        Sat, 02 Jun 2018 17:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527984686; cv=none;
        d=google.com; s=arc-20160816;
        b=d7VuId7C9O2DalwA7kNZ2NYS085GlcIvgLbCH64ssjMC3EJjoxz2lUsl95zHLopiva
         /Lrj1hzaFp5DynQ1870Iz25FuxOsm1SPWO68CYEZWRdMdRwJ34XgTnjQUM174ddd+dZp
         tc/uwh9Jatf5v/egMTTu82nXidwYmWDOpd3m1Z1U4l5lXOcZh1xiPIF5TsIunOvbos42
         DqUBajEA014nCTwakd7WES+ZRcSnGSqXjloA1s0S2IgMvntk/gfPuwth1JWa9vXpIxLh
         I+sQUMust/gj19x23I0oamfwIRNJXMZ3sRPV/yaQnEoYXgt3XrgHHSmnmV+ybGNZ9nRO
         6i6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=cfu73oyW3jgGsFJAn7fsAKURyltF/hX9sO8Jgz7miTc=;
        b=ucveJJqk2NUzahLcfRFdR89JhENBBoTYaHm87WRQBNSoLQTzpBYcV6/irXhYn97C2R
         5IzaL4+2VCV8I9AngJ+2DheucBxHHkRICk2ilXxgf2eRcpzLaMkqM4f1r/sE/UBCKCgR
         Ab2uN3IzSWi+DqMeyaxyHenKfonOQ1yfDxZ7JguzYLxMnw2BztZQDTyol1hZvym7t7zg
         q3oYjxjznpgo13VZ0jVP08+OPKlO60DNp9ECZu+apVmtdw5Ef0sftCKEMn8Zlg3z4Hox
         wwjNHZtI3YTwkGWPxEpGP9g158KIm2O4Z0SvUHmNwqsJRofiMixANaJ5UYNpiCD6O6so
         PKKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bpHmXS67;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v62-v6si7840230qkh.232.2018.06.02.17.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 17:11:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bpHmXS67;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPGcH-0005Jc-Sr
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 20:11:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZo-0003vR-8y
	for qemu-devel@nongnu.org; Sat, 02 Jun 2018 20:08:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZn-0002xR-EJ
	for qemu-devel@nongnu.org; Sat, 02 Jun 2018 20:08:52 -0400
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:37352)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZn-0002x6-9z; Sat, 02 Jun 2018 20:08:51 -0400
Received: by mail-qk0-x231.google.com with SMTP id j12-v6so19310251qkk.4;
	Sat, 02 Jun 2018 17:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cfu73oyW3jgGsFJAn7fsAKURyltF/hX9sO8Jgz7miTc=;
	b=bpHmXS67IAAtlS2T1ghZvwwlQczWQ+8ZNHKjRS50qBbVUmfoe+BK7tJKb5PVwxpCxP
	7/7Eyg97BQ7dvMnEBLcFqA77Y0jsPa6BwdG4Bax1OEmitp7450lxB6Vha77lt+7e1WqS
	y/VXE+HjQ6wQpS0mioGy+DxFnwBHF27HN8hYEINvcZxe8WdQH4EiMJMdfajL51z+AiVU
	RlMxGunJAxSB3C3LqNMrvB6rEqGO/ERLxVk9Rs9g/ofATDZ3iS6WNE3hEilNy4FoqIoz
	esEhyVz6eJPZtTwurNhAnuU64W4jSh/ax2YhFpe4hm6fXu8IN5CNF+V8MfhyVxkhgUH2
	9VOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cfu73oyW3jgGsFJAn7fsAKURyltF/hX9sO8Jgz7miTc=;
	b=L1ifkF9Z9uK2MtDJ0SP0FLpNFnafuCUphaAFMnsPtrOGXE2KpTXjG6jrnlisBf66ti
	IE24NYpfwrGw3kxPtoTr+/cKWTf8RgCH0j5s7wU8mL8sUjKiGnmV+ppf6bDPNzze5a+e
	9fP1CrqwILdQ8NpfoNK69pFld5pichqRpJ6SQHe3da5kE8kxn+vzjRi/P2PbalPCyfzI
	vhSyLez/QDWdm9LDOs94rRP7NfyAmMPadR9By2ZNAA8JNCGXhSFrjAD6G0aK4GmvDd48
	HzF/83lp+3EL9rG09uucObrgm1Yl1lByrUJULlAmwcJiI0JItB2iV5S1SpljGuOA6uYU
	/WZA==
X-Gm-Message-State: APt69E2oNNpw2THb5H3C1PvqqR+CS4QTo7Q/zX3SZ4tUNuLTdJT5WTgY
	6nOszQnrps8M+ORm4Hl/5bU=
X-Received: by 2002:a37:80c7:: with SMTP id
	b190-v6mr14965234qkd.212.1527984530894; 
	Sat, 02 Jun 2018 17:08:50 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	17-v6sm10610894qkg.97.2018.06.02.17.08.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 17:08:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  2 Jun 2018 21:08:24 -0300
Message-Id: <20180603000827.30872-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180603000827.30872-1-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::231
Subject: [Qemu-devel] [PATCH 5/8] hw/sd/ssi-sd: Force cards connected in SPI
 mode to use Spec v1.10
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tRclc5YaHMOE

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/ssi-sd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index ae04b6641b..c62fdc871c 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -253,6 +253,8 @@ static void ssi_sd_realize(SSISlave *d, Error **errp)
     /* FIXME use a qdev drive property instead of drive_get_next() */
     dinfo = drive_get_next(IF_SD);
     carddev = qdev_create(&s->sdbus.qbus, TYPE_SD_CARD);
+    object_property_set_uint(OBJECT(carddev),
+                             SD_PHY_SPECv1_10_VERS, "spec_version", &err);
     if (dinfo) {
         qdev_prop_set_drive(carddev, "drive", blk_by_legacy_dinfo(dinfo), &err);
     }
-- 
2.17.1

