Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4952787lfg;
        Tue, 2 Mar 2021 17:23:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYRciczBk70XyBLPnIRM81gf4AXDLwwSKXYSSePX8GTyKWpgkY2mRlzvijECBMb5WyBA8u
X-Received: by 2002:aca:d7c5:: with SMTP id o188mr5467077oig.21.1614734595365;
        Tue, 02 Mar 2021 17:23:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614734595; cv=none;
        d=google.com; s=arc-20160816;
        b=Hp6/N2uKGJjMd7ww4779x/fYWitRUd9En+i7owC8lU0gHeIuyKCObs9sx1DStmaZ0s
         WtkliUE056APK7zgom0MkancKGeC96HrPIUtIptVnVKC8flkIkaZ8HXTezPTD6En0z4K
         oPKPErj38HCDZ/9Vmed/I+S0OPSX6Ir1/yueykSVfyJP5J91LqmQPTfnPxenvtzHovTi
         2rY6siq9Ewfhg80ev9QDmjxN4vIFULZAbBs3gwJNCy3KQhBrNvTSVXle1HfNTijDMlek
         QvYVX4kdavAbRBNFia8xx6N8nbHkLF4SEibzlGvQz//Bn4Zcp5xoxf4CkP9RhTsMQyGn
         lZBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=hUErLV4HiLZnxE7Evw803/5tPFca8Ltc14dVHuHN95A=;
        b=FoRm1iNUtiwyQzO/cuyoqcVB2OFm+QpGo+7h5fFjMOTg/GRPl9qq8vtyWPFuEXVLPE
         E2+DP4Cl6vZFd6xerjt58Rz8BPiyTAoAL+7RbsZZkYlSuX45HYgvjr3bagIjx/a1FnlZ
         ztNzCDdg5fnj9/2CijtLGO6VI5C2GDjqBhrxSXMWzqdR72QpcTqtwDvtOJUOKboNFzAl
         Nf5xPA3jcC3Su8cnIKbF8drxhuoezXoqoRH210FlyibsTrU7Jn8VZIoATnOdzp+Nfycr
         Q4uxXGhRiGFWtPrDyMPUlf1DRUSSZLvIwHa61t0WkEJlfJlbLOuHW3h2HOBv1tRgMWSR
         eNMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UPpJmUtg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7si17780791oik.112.2021.03.02.17.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 17:23:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UPpJmUtg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHGEM-00087Y-HI
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 20:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHGDg-000876-4U; Tue, 02 Mar 2021 20:22:32 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHGDe-0003ay-6I; Tue, 02 Mar 2021 20:22:31 -0500
Received: by mail-pl1-x635.google.com with SMTP id a24so13086659plm.11;
 Tue, 02 Mar 2021 17:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hUErLV4HiLZnxE7Evw803/5tPFca8Ltc14dVHuHN95A=;
 b=UPpJmUtgIswv6DIioD8dweskI1wuIjM4TH30+MBWOCDTUrtGkgF+OSut6G27ZqRcps
 w3z6+sA3zqh82xiCMtOJ1GZHzrrqvgBrt7z9RjBdBJFfnxtUZW1b5i5HyMh5PJBX4G2I
 HyPhEkWfkDzO1Lm5/QZY7uHcYwUCGrOpuBsUUeLb7FHrpfMRVqkUoM+bkGjJpJ9huuo2
 aKoyR69o03giVZdcFsMcSxc6MClzclWnSWvS7Jy5lGYpiBltEB0+fYoGi33L7CPPh5th
 t+9CFvdwbrRsH7SWP+khMunBhZSXP3KfLNipmeeN7i6FMEideNCY5NuMO6Rr6kxdK0rI
 zB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hUErLV4HiLZnxE7Evw803/5tPFca8Ltc14dVHuHN95A=;
 b=N6tL3wxfvssci2jkm8iUSwcgoOAITJfNMiztGbJmXrKbZmqXlw1zUz5/51GgyVki3Z
 O5ZqmNY9ku1Pz+pzNBl2rTxWXSBb+DP8EKLAeFiiP1OdzCN89J5WSgKlUPERi2HR/AF5
 55PVozL/x1Rmy4ebnBYHYWCmBW05BPxoPTzTBYfiJlxMqGNpPURbrUwQODTZzlIUzpM6
 0O7VEU8LF6wvX8P1BECFBdYWIOd7AM20c8IqY+GDWvMyHHUqJXFfh6Y19CHDEokjNoH3
 SXjgqtpOY15u7q0BnDAl9c7PGmLXf2hkV5R64vwsYn4h9JTn8vu5Hvc/T6/BeYZ1IufG
 I8Lg==
X-Gm-Message-State: AOAM530VR3r9o27EioMmpkT3NJRPAsN+yiSnqsVsvEAx1hDx4HbAxFTD
 nea9kniEi4jGwy2TEKUm9uY=
X-Received: by 2002:a17:90b:1213:: with SMTP id
 gl19mr7111094pjb.55.1614734548498; 
 Tue, 02 Mar 2021 17:22:28 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id t19sm14135427pgj.8.2021.03.02.17.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:22:27 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 0/2] tests/acceptance: Test Aspeed ARM machines
Date: Wed,  3 Mar 2021 11:52:15 +1030
Message-Id: <20210303012217.637737-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d+Du+s4m93Y2

This adds tests for the Aspeed ARM SoCs. The AST2400 and AST2500 tests
use OpenBMC images from that project, fetched from github releases. The
AST2600 test uses a Debian arm32 kernel.

Note that the ast2600 test will fail if [1] is not applied. I have
tested locally and all seems good.

I note that checkpatch warns about a couple of lines over 80 columns in
this file.  Can we agree to relax this restriction for this file, as it
helps the readability of the constants such as sha hashes and URLs?

[1] https://lore.kernel.org/qemu-devel/20210303010505.635621-1-joel@jms.id.au/T/#u

Joel Stanley (2):
  tests/acceptance: Test ast2400 and ast2500 machines
  tests/acceptance: Test ast2600 machine

 tests/acceptance/boot_linux_console.py | 72 ++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

-- 
2.30.1

