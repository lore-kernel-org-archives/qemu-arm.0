Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp1234937njb;
        Tue, 6 Aug 2024 07:20:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvKbKWB8Ni6D2B55UVb01L5f+c7ppM7tjuUq7IHKw9JB8hrj3bvsvaJIyt3MYNhs52maa9UEm4GxOs6w==@linaro.org
X-Google-Smtp-Source: AGHT+IHcVzcXD6gF5aENbvn11VI6qF8n57QOdpGCSV45XBtL/yiGyuiIpA0/BR7loqkV+N53d6QH
X-Received: by 2002:a05:6102:2acc:b0:494:3a8d:c793 with SMTP id ada2fe7eead31-4945bf155a5mr18343442137.28.1722954049244;
        Tue, 06 Aug 2024 07:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722954049; cv=none;
        d=google.com; s=arc-20160816;
        b=qk7eJFbst9dzZ2f0Egw0y4bZdGwAFc4o9y1zgcfA8aQscyL8+4CncpBaCuPyvjf5bs
         7O1CL365fWju3B5o5419Xhnoga/DSUNAAlWu+gWDaC6mgswAEDc5Go+l8JbKBgq2jwni
         DlBa+Iu6hHBi4k9w8DpIYfUyPa2DSH14OthbtEaTVcEXbl5PGrAXMRhDgjwX/ZeKvdGx
         BwD7htmGo45mIasOdAF6ahGGH3CwEQgEcRtJI01jpn2P+3omYL9XvojTbwGJ7xv+U716
         +Dh+UYN0Wb+kCReZbuDKVPY8v1dwgn0QpoMTh4Q6VI6iw/9hEk1sgkooV2PwIJYbhC8j
         Bp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=FMOBByQTuB0kCr54Tn1SiXD/gk4GGph9q20Pk/9oV3w=;
        fh=rhLQJBD/JZE6Qkn2D37e1nK7wCGHVDV5nnYSqFoGUtY=;
        b=iJs+xqRaIKwNbY31rTiv+KqBX9k+molRXa1Zqm2mtHjNUwRbSnaH0aXTMZSc97TeRc
         1AjJUTaB88kaSfOKwOxb9bihVdiRP6KTH8GXvPVcPZVZ/aDVvDru9cpf1pOfys9Zps97
         fAdvU6HDJNg//9kq4eEDbP5jXPudrC/3Jwe0JUDYiMSc6WeOD4kO+xPf8/QPNKBNIcPi
         cLWJIn4ea1/3XF5NmEsA3yuItL0pZ8bXFDnC3lAzXa/k5E48rlger85MiSHajYkZWpp4
         zDzuo0k0eFHMkl+WG18EOg5Cyyngsvclk7GJR2JAsLclaOmlIciDzQY67w66Ft+Z2iMG
         y4SQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DCOgigUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4945dbbbe54si1949610137.249.2024.08.06.07.20.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2024 07:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DCOgigUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbL2c-0001IG-FZ; Tue, 06 Aug 2024 10:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sbL2R-000169-4W
 for qemu-arm@nongnu.org; Tue, 06 Aug 2024 10:19:48 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sbL2P-0004RO-DE
 for qemu-arm@nongnu.org; Tue, 06 Aug 2024 10:19:46 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7ab76558a9so140537966b.1
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2024 07:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722953983; x=1723558783; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FMOBByQTuB0kCr54Tn1SiXD/gk4GGph9q20Pk/9oV3w=;
 b=DCOgigUraxR9bRKdIWS0mcOrJGh1RvZq57TaldoYUSumHipPu7Wrd7pLZZuqpG7QPH
 suX+Y/n6DejOLoVPI5MrchxrBLdl8gbA1liHagd1a8GsAchvRhDygGHWj8DA7R8wn0aD
 4VPOsO+PQpEZdyI2hTTawpmUgCre5v1up3/svWHVWY9+zlpuG7Q4qouaFBJEL1ZWPdsq
 z10wRzDwIkzXNGFgVyRBzT/yBIUNPHU4vuVJs0rgjel/i7TEetNsPMToXML/l2Yp4QU4
 QEvmg6T+chP4d0w+4oVzaawxc8qoi+p7zzxZVpaQP9zJyWAT3VKJCyDexp2kIuQHPIlb
 xk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722953983; x=1723558783;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FMOBByQTuB0kCr54Tn1SiXD/gk4GGph9q20Pk/9oV3w=;
 b=EUPuR5WvoUIlIQ4ZKJ/u5HNdo/G7811gj9wP9cfugygi/LXTn3pgWOPFPo/ik+ku+L
 sBMFshaOv91NU73lWoa2pJ3iA8jBmeGai5GqUkwFlx4i69U9k6F4KmB6yhgLeCGMJml5
 KW8XfRKFE74JbSJbTFKAJfXCurSgDz77n2rSbvIoF0vMdE+IStqzJs5LAR0yzCLpDCa9
 mcW+orlZlCMCt1YJmmMGfGiAuiFMOoJso8SnS4UZfiS/Hr/BOFJpaQpCgDRU84KC80xN
 Kbt79oCHZeRo2eOVbokYu9l7AKZjl1xk+fSPfKA7xx7xRyCesYv2gX91jukNsTcPQIpz
 ePvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWH+78hLCX22LF4+Yoe9sFU5/61IOTb9N99I8UcgyeLorDqiUfFsGoYrvvOqeF1npbYX5r0XtOgag==@nongnu.org
X-Gm-Message-State: AOJu0YzV/Y1pYL1++Bme43rG3jCSv3jc2opyAnoTmFZCXCUME3DrpXrn
 TQR7Ssjr9Q2u/+TgjqmXVuoLmhzBD33XVTz6RnIMMhXw7DWzVTTBCPSaVEZPSOc=
X-Received: by 2002:a17:906:d257:b0:a6e:f869:d718 with SMTP id
 a640c23a62f3a-a7dc600f98cmr1244020266b.21.1722953983306; 
 Tue, 06 Aug 2024 07:19:43 -0700 (PDT)
Received: from m1x-phil.lan (cor91-h02-176-184-30-206.dsl.sta.abo.bbox.fr.
 [176.184.30.206]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0c0e0sm555953866b.67.2024.08.06.07.19.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 06 Aug 2024 07:19:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1? 0/2] hw/intc/arm_gic: Only provide
 query-gic-capabilities when GIC built-in
Date: Tue,  6 Aug 2024 16:19:38 +0200
Message-ID: <20240806141940.22095-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: FqHHSW+NdjF7

Attempt to clarify confuse output from the
'query-gic-capabilities' QMP command when
no GIC devices are built in.

Philippe Mathieu-Daudé (2):
  target/arm: Move qmp_query_gic_capabilities() to hw/intc/
  hw/intc/arm_gic: Only provide query-gic-capabilities when GIC built-in

 qapi/misc-target.json     |  4 +--
 hw/intc/arm_gic_qmp.c     | 61 +++++++++++++++++++++++++++++++++++++++
 target/arm/arm-qmp-cmds.c | 52 +--------------------------------
 hw/intc/meson.build       |  1 +
 4 files changed, 65 insertions(+), 53 deletions(-)
 create mode 100644 hw/intc/arm_gic_qmp.c

-- 
2.45.2

