Received: by 2002:a05:7022:6984:b0:85:21:bd5b with SMTP id cj4csp615842dlb;
        Tue, 27 Aug 2024 17:51:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhPBP0sD9gFwbCMI63QGblI1eXm6wcO+TV7PWqlsq7EfAJJVGsDx9xgaqS+iHYPYDP7jT1H974gCsFfA==@linaro.org
X-Google-Smtp-Source: AGHT+IGrGKxrLqJJhfR/ISwOcXNE/8IcVB/L1y1AIqrp5/RxpH/MSNRvJO7wvjWgkzmhIMXeELNV
X-Received: by 2002:a05:620a:3908:b0:7a3:78ac:827d with SMTP id af79cd13be357-7a6895d8d28mr1513375885a.0.1724806262997;
        Tue, 27 Aug 2024 17:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724806262; cv=none;
        d=google.com; s=arc-20160816;
        b=0qXTFN/CkFfdZ2xEM2e5osrQhbTDscLNerpEtYGo829vic0rcai2Q1SBq2tH5TPkmK
         2ekUqcxdAOO4ljZ+PHibdkouC57RkPOJpx1NyLR3b/0bqkFxqeJJO9pkiEfUeLo7aACL
         PP+Ic0BFGvT/SwwTvGKYus8QfVM6di4y0X8gGwhYlrzsHuHWwPv/Jm5Vk9oD2kP9/ppa
         6urOCAGFyPvwqzGpzkYsAtYF+JzRFFI3A42NbbrUwni3OVKsH16RR09k0dfY0bjj03pb
         JGhFRXKL3SvxfQL8UNUTLCisx6BjaRCexbHBmGNu+rhVEmZBtL5zTW0P3Vnb+WshVc0w
         /ybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=8mT2X/+mHBAvLZNVcKPeLnwpTgYRQyqxibTWUC7TAQA=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=VYyNs46Qb3IpTO6wSTEhbLBlj26E4h96iwM6LFmCZ/Q7mPdMf9c2xT2fU9ZoL961mt
         AllR6VpWEvyoFxYrSbeHh7Ba2OWlGixHW6dTQlqwGwpg+BXDK5Fv6LSrjbE8l0jUo9qQ
         sSdpf/kLpSTKpml36sRvcWY5O9lkzU7lsHDPR24bwaYLJETbFWYuK1DnaKX3L1mE+//z
         m45FCSwWeBtmwRFR77EYJd9aqgc3LuxlTXr6umXqDlQ5nrw63VvVp+RKsK/jzYRfHl+X
         kgwhIpUzdGsRmhCuj3YTdtA9dQZCJVhA6J8tzjMwVcJi4AlhsQ0nlbdnlgD3iYwE1pUN
         lCSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f4297c7si1485398085a.641.2024.08.27.17.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2024 17:51:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sj6td-0002JA-W2; Tue, 27 Aug 2024 20:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sj6tb-0002FN-1e; Tue, 27 Aug 2024 20:50:47 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sj6tK-0003I3-DL; Tue, 27 Aug 2024 20:50:46 -0400
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sj6tD-000CRY-0j; Wed, 28 Aug 2024 02:50:23 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy04.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sj6tD-0002Rk-0l; Wed, 28 Aug 2024 02:50:23 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id C8C0448015D;
 Wed, 28 Aug 2024 02:50:22 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id pefpws2yJ89o; Wed, 28 Aug 2024 02:50:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 8F5AC48016E;
 Wed, 28 Aug 2024 02:50:22 +0200 (CEST)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id brf1dOEB05-A; Wed, 28 Aug 2024 02:50:22 +0200 (CEST)
Received: from zimbra.eb.localhost (unknown [192.168.96.242])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id 7700A48015D;
 Wed, 28 Aug 2024 02:50:22 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/xilinx_zynq: Enable Security Extensions
Date: Wed, 28 Aug 2024 02:50:19 +0200
Message-Id: <20240828005019.57705-1-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 1.0.5/27380/Tue Aug 27 10:58:07 2024)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XzutGUFcFvts

The system supports the Security Extensions (core and GIC).  This change =
is
necessary to run tests which pass on the real hardware.

Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
---
 hw/arm/xilinx_zynq.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 3c56b9abe1..37c234f5ab 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -219,14 +219,6 @@ static void zynq_init(MachineState *machine)
     for (n =3D 0; n < smp_cpus; n++) {
         Object *cpuobj =3D object_new(machine->cpu_type);
=20
-        /*
-         * By default A9 CPUs have EL3 enabled.  This board does not cur=
rently
-         * support EL3 so the CPU EL3 property is disabled before realiz=
ation.
-         */
-        if (object_property_find(cpuobj, "has_el3")) {
-            object_property_set_bool(cpuobj, "has_el3", false, &error_fa=
tal);
-        }
-
         object_property_set_int(cpuobj, "midr", ZYNQ_BOARD_MIDR,
                                 &error_fatal);
         object_property_set_int(cpuobj, "reset-cbar", MPCORE_PERIPHBASE,
--=20
2.35.3

