Received: by 2002:a05:7022:ef03:b0:7c:9548:a19d with SMTP id qy3csp2006709dlb;
        Tue, 7 May 2024 06:04:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaLYCY21N/IHkqPKZX413o80Jmt1S7Ome37qywMkjiizAFbwh71iBjredZ8S/2J9ay8wypjEk5ro+B74yJjTvM2SPEFqPI
X-Google-Smtp-Source: AGHT+IGBiEAQp+liMgzFbC3uNTl9GkzAJaAkSmAC7iKEdmOXmv1GRlv6mK/+Wo/Q3vc27Gksy7eh
X-Received: by 2002:a05:622a:164f:b0:43a:452d:68c2 with SMTP id y15-20020a05622a164f00b0043a452d68c2mr17858619qtj.40.1715087062712;
        Tue, 07 May 2024 06:04:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715087062; cv=none;
        d=google.com; s=arc-20160816;
        b=fu84UY0OmvxzG9VXK1wBbeoukYFIs7caNbGSO16oWJ9AygeYG/gPtAa9ID3wrEybS8
         38hz7un1XFjeX4i7nenz0KB/e50rUfsCU8ltGPuDsws3gy1+KQfhqIchjaSKB8PRs5oJ
         GCgh8t7EZH/mMZYwykTw8Ar+LgqPlwZ1UmvrguUuxLhQqu36ilZY2CzQ33jKyh0EzDgT
         CsbTgu/uPM6xGBUAN+JmjLozR+eURBGGKbz4b+F4fm3wJd1Z/hA1RwTGM5Y8/CYcYlgI
         2HuUPG3beI2OT2cnTJgBtFl0xqgCUaNRuLZeSb2s+rRHuagLUzEg2UgWVmJk2usRDPtG
         UFnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=tRJrCcdQD24Mbm01qesk4RFF9E2v1PrP8NURoQ8kwXY=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=PwFRLpmGwMZh/hmaUnQiH7L74dCJcbA9LxUqeheI2XpMf+x5NsI7Mjx0mozf0BMxtw
         lxk/jE7voh6Fvk3CkXTp0poO2BwI8KMwNzGd1t2h8hI82AcFKxlRHiuB8QfCwx3FISRX
         cX0hIDSFAfTmuWHhi1hemzxThu6vzzj9MyXDQ5FLcDXBg3A6MhoZhvDDBrwo5aKfw7bM
         69/21NcoFsbtfGdjlNA6EcjbdJ4Gq60qU3RkDKwmFppoSFmvy6b9YNz5EpOim0Uxsnku
         UYH5UBJQDWRXk+fT938+3+EWIjwrdU2iniaL6oIq5hANRFwDc9FW3cui6nsVc+CNrq9O
         Ku4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21-20020a05622a119500b0043ac90e0b07si11813943qtk.258.2024.05.07.06.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2024 06:04:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s4KUD-0008Rx-2t; Tue, 07 May 2024 09:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1s4KUA-0008OM-Ns; Tue, 07 May 2024 09:03:58 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1s4KU8-0007vm-Hc; Tue, 07 May 2024 09:03:58 -0400
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1s4KU5-000MRi-8F; Tue, 07 May 2024 15:03:53 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy03.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1s4KU4-000Oxd-2J; Tue, 07 May 2024 15:03:53 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 848F44801C4;
 Tue,  7 May 2024 15:03:52 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id coLy0hcI8Veq; Tue,  7 May 2024 15:03:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 46BFD4801C8;
 Tue,  7 May 2024 15:03:52 +0200 (CEST)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 1cp1o9Swq9VE; Tue,  7 May 2024 15:03:52 +0200 (CEST)
Received: from zimbra.eb.localhost (unknown [192.168.96.242])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id 2098B480045;
 Tue,  7 May 2024 15:03:52 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] Zynq 7000 SoC improvements
Date: Tue,  7 May 2024 15:03:47 +0200
Message-Id: <20240507130349.86851-1-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 0.103.10/27268/Tue May  7 10:25:13 2024)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bChoXy2psOTH

Add support for the cache controller and up to two Cortex-A9 MPCore.

Sebastian Huber (2):
  hw/arm/xilinx_zynq: Add cache controller
  hw/arm/xilinx_zynq: Support up to two CPU cores

 hw/arm/xilinx_zynq.c | 43 ++++++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 15 deletions(-)

--=20
2.35.3

