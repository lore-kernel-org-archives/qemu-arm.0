Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1395923lfb;
        Fri, 20 Nov 2020 07:21:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUEzFma928de4QyzJlC3nV6TPO+axaSjD47IkPYHE7atekRGtxHVqmRcKyu8UuQxxJ6y2K
X-Received: by 2002:a9f:3ecc:: with SMTP id n12mr8378094uaj.120.1605885716460;
        Fri, 20 Nov 2020 07:21:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605885716; cv=none;
        d=google.com; s=arc-20160816;
        b=PxqP62G7ShSNsvZkQfm7cCocX8FLfvfYBHBJDv27LkBgScWEN7MYzgZfktNffe54T7
         KCf3uTfAVuV/aL2Bvb2dw6s+pdD2RXkcQpAdlKXrAEx2veGM5kiemZqJHZ/QoeaOlZOX
         M7Hr+ySQTnbYrxZ6ij9LyQqg8Eo03SndhqR+uhbsmxjrD/5HdmTj03IZFSnYkXZhSG6t
         IMelbfF9NLwQp4RM+JnZzGSE9Hezh6A9ny6cCJw5itXePsAf2fNUHA5Uf4yJ9i0cxTeW
         e7NSS1CNpb3cgnifsT4YGSCBPJ3O0gJH6T8Qdm8s5AoMq7tpctQc8jh1SVnWNpEyQ4QY
         xkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=b36foE2z2+ELvPR0ScV0lu7udR5DUMLEnrlAbMPNCVY=;
        b=MCJUqbu0m6Xne5F5ioNRDtjUoyQixDq+O0P2G6zUkt9mKVEHUzwpbt2FQuG/t5eG1p
         q5IyvYVpHnNOnYrR1QTzJ5MuhDwT+eqBZ3MeUd0dNfET9mf/CUqJ2WXHv09/2nAgR4xP
         IWdcL+rmuHiyDuElwUpf0J2TMI35hsVIF29gpK+0WHsxr/vQxc4r7p86ntyAy2EiuaZO
         ds7gPpLETwkO4kmcgmE1GCZ2HV+H4qV+kE8QTN0iEfOLLuudugxk0F1eesuQGc+kMNpW
         EeJwG9PQEmyhEVmeoskSom1TeF6WK53XUyjm76oDmRQbvHctOxUK4LhLuX+8D6IDQGhB
         R+GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hbBPAko2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a138si605421vke.24.2020.11.20.07.21.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 07:21:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hbBPAko2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg8EV-0004sE-Qi
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 10:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8EM-0004ry-SL; Fri, 20 Nov 2020 10:21:46 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8EL-0001rj-EU; Fri, 20 Nov 2020 10:21:46 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o15so10412781wru.6;
 Fri, 20 Nov 2020 07:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b36foE2z2+ELvPR0ScV0lu7udR5DUMLEnrlAbMPNCVY=;
 b=hbBPAko2iNa3XTAPQX9+AqfUd9e2NgsJna8K6lwGFnO96We+9aKCKoGsS1a79GIAaj
 ukpk/JQGgyRlKK2C2hlgWNWWE//ZUiPZTQWeXCD6Jvzrrsp6FYqT/i7ggV7v7rtHUuGi
 jx0Y1ph8pzGFT0nsbp41MOjDPMfY3O9Bv7ciS0MGqK7WbhiMLLUffGHX2Ug6KGGscbtO
 IXHGqM5g6Tw1Z0M3JR0u2NcgbqQjSEW19i9zaXXUdQZOHJQ3CBrxTktmUSJL4yJGLoLw
 wgkSyFi4ToaMzPBOdc6b1qDnOD2eX5wk8JInvi3xFXG3oF7Yd0EnNXOOh1rRxpnnpx7F
 zS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=b36foE2z2+ELvPR0ScV0lu7udR5DUMLEnrlAbMPNCVY=;
 b=cGgWheeGgkIg6UHZiVoHVjdr3/SB+YEeya//qTQEHBNzickSBZr0/yiqmRBhn1eEtK
 ZCROcSp7hbKVrcWa4DsX/1u+2LTL7+JMsb1H81LIXetVj4fokzff8aOo9Xgw2THZvfyt
 Sm1Joq2r06T+VF/Uqjfv1pUaEd091IIB2Ddb3g699jznJ4wv0vUlEVAD7TYIfgoiJ5Ty
 Vc9rmtTUb9tswsLJPtcPWLoZmsKNxxGcPw6XquH9xwONjylsVohV1XiTSQRbWqgrmpaB
 KrWmG4jbxMk1TELTcCHSJ9Znt60/4O8ikbSVz8QGJr45yBTn8SIRwOl2EdKOMfyo0bqc
 /x+w==
X-Gm-Message-State: AOAM532SIaOQCrKq+LRQz86jADQD8DJrhgopLDQPUM31wDxpaFGH7caW
 od4AMvUlgXGfXd3+DA3cny8Kknon2lA=
X-Received: by 2002:adf:9e4c:: with SMTP id v12mr15957151wre.22.1605885702918; 
 Fri, 20 Nov 2020 07:21:42 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id o13sm4492002wmc.44.2020.11.20.07.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:21:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 0/4] docs/system/arm: Document raspi/tosa boards
Date: Fri, 20 Nov 2020 16:21:36 +0100
Message-Id: <20201120152140.2493197-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kkO5YVtRAY1T

- Deprecate raspi2/raspi3 machine aliases=0D
- Document the Raspberry Pi boards=0D
- Document LED on OpenPOWER Witherspoon=0D
- Document Sharp Zaurus SL-6000 Tosa=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  docs/system: Deprecate raspi2/raspi3 machine aliases=0D
  docs/system/arm: Document the various raspi boards=0D
  docs/system/arm: Document OpenPOWER Witherspoon BMC model Front LEDs=0D
  docs/system/arm: Document the Sharp Zaurus SL-6000=0D
=0D
 docs/system/arm/aspeed.rst |  1 +=0D
 docs/system/arm/raspi.rst  | 44 ++++++++++++++++++++++++++++++++++++++=0D
 docs/system/arm/xscale.rst | 13 ++++++-----=0D
 docs/system/deprecated.rst |  7 ++++++=0D
 docs/system/target-arm.rst |  1 +=0D
 5 files changed, 61 insertions(+), 5 deletions(-)=0D
 create mode 100644 docs/system/arm/raspi.rst=0D
=0D
-- =0D
2.26.2=0D
=0D
