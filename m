Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp59267njb;
        Fri, 6 Sep 2024 05:27:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwQPUAiKw6I2mqQpzMtvMw+1JUAiEtMZe59YE5tNodICTTPL3iZvknJ9ZQKv99Rn3ezl6SB1KkGeiyxg==@linaro.org
X-Google-Smtp-Source: AGHT+IEDcz4PcK5ZPiSQWPlmbaQ09hZE+lxKDcgYrf+6CezsVjUXWRugLefmWr2Q6mj//hNe4fNv
X-Received: by 2002:a05:620a:1a1b:b0:79f:420:5a0e with SMTP id af79cd13be357-7a99732f57dmr234565485a.18.1725625646757;
        Fri, 06 Sep 2024 05:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725625646; cv=none;
        d=google.com; s=arc-20240605;
        b=OnKKcPUQpJQofVx9hc3dcHbQfxBjER1keifhw62XkKXkW/AOZf4JxUTiWsw7sQ5GQv
         GxUTOwLqW4MYT7kUvqtAt4e6p92X3ip8mNnd2mll1xm4eL7f75TU7TgWfnq8Tythsgsv
         RTqOU9lAUoMSGLs8mh3/7zUgrSuFyPlypzWFnjOwMrogtEXlQDRozj66+72NYIs/fzmu
         dsKm2lDRf8nNRy/7OT007bq/mdORWfa1hw7xVVbp4+eOZzsA5EGBqG3amMC0SUrMXZ7D
         MSKmlVwYfkjNtTDA/wcezXnFDrg7BikazKGQWfgjN0nv4ooeK8oWEZr46/4jy5AR36fb
         wvwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=i25WBbXOE7bseAptFMJcoqMmGcDx0hm5DdRbe5SEl9s=;
        fh=Fk11+ovE0s35IoskRMxnwbGBtkwBLIKLvCJznjzOpnE=;
        b=Ck6xyJNN6CmHTvj+4hHUwKqFFlBfOIfgzFWxGVCnaOt5Wu8AO+pM6Oz1/uRzEXLldR
         d8X3frcv0o17MlqrLBecaCfesRx3wQYAUERZgtebTh5tsRoulPANUF61cXPF4X0TdUJj
         CGHJR7up9v91TSAcx38oTz/HDDzU3wa1nUJaUAcUemV0ATk8M6J32VDBxMYVUQ99ue5g
         MMEHWRMwZMZs8uP1jpgqRlDSO7NrSLbx4BkkXxJBA/JA2Oh6nsTEjp2WNnrfYRpLVJpG
         fm3+25GynR2dfGu+e/Z656NuG6/eccZ7khR5ZSznvrc2GTtF3bnuBXjAKmom1TjNIslw
         A1sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=IR63ydKT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45809c8cb1fsi26291081cf.442.2024.09.06.05.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2024 05:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=IR63ydKT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1smY2X-0001e3-9H; Fri, 06 Sep 2024 08:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1smY2F-0000YA-LZ; Fri, 06 Sep 2024 08:25:59 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1smY2C-00022c-Qt; Fri, 06 Sep 2024 08:25:54 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-206f9b872b2so3178885ad.3; 
 Fri, 06 Sep 2024 05:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725625546; x=1726230346; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=i25WBbXOE7bseAptFMJcoqMmGcDx0hm5DdRbe5SEl9s=;
 b=IR63ydKTMk7k5oaCoZpJqMpw96CkJMG8u9rh8pz/8gChE7gSR0S+D7sI4TpgY4j45V
 dxjnFAoSI1HR5Bfo4HiM3wrnHNJPC76F1MJK7F+G0vcRj0j8IA6Rmf0lbikygGc2B0AC
 srNVtBGI+BrX9Fie8PFE4zEqx6xFXIAIoXiL+wQV+Ta+SpG/o4m6Gmrxojl5wJ/Lc/qV
 1l4pO+bmdotUPMV0K0YHfvvzcEc65Qm3noyqq1Bewx40DNrXvw1Hy2dQdrCM9E7HvJAL
 KkOrhBN1lwR8uqcY25+XpD2ywI9XwzgH+EtsVl2w1y9lX1GAdNlRLHN8h7M3hge/obN2
 FrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725625546; x=1726230346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i25WBbXOE7bseAptFMJcoqMmGcDx0hm5DdRbe5SEl9s=;
 b=AhKuwripM6SPfMNxnrwkeKHDo9Rc6E2y7MS7NCmM8/6JNO9kqD8CXDrpXESmYvE0QB
 KSF81e2R0xh44jP+2zXPFddtTkP5d0jOJz7udEOT5VCCAsaCD+Z7LG/SWiHC7d74fQbM
 JbawUqr6z8AmdVisUZoxXyInGyuCz9TOVFXbpAatqB6BIyhYPyfUyvms2EIUOWFZe9oA
 kp0poERva6imnNv3+tDrT0FmwEucc8GHRBjfuE+bLw6gBKlnsc2AIvcxdnHxypzsyh1M
 8Ljt4V1aLaHP4q7MZwXO6NFyc57zkVPy6TL2g5A67yt9LkiCe/ACFoMyD3Z810iThGZn
 8YKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYt0UGJiHkrYoUzLLP1uQ+qMWyQrqPtNIVyDtRrCRAsaZkBTyNLdbL9CoKF5+IBW3b+PLgkHCLHA==@nongnu.org
X-Gm-Message-State: AOJu0YxvURKuVR0iRs4WbcansLkn3+eB+SokqrxcfBor2hZ01s02VQ/x
 cm9y2+JrwDqJv4MsccLEbmiEm1j3+GU7s8Hwt6lWOl7PZlwhWbTjw3G2PA==
X-Received: by 2002:a17:903:228f:b0:202:4a35:a803 with SMTP id
 d9443c01a7336-206f053b370mr22382405ad.31.1725625546284; 
 Fri, 06 Sep 2024 05:25:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206aea55d42sm42193535ad.204.2024.09.06.05.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 05:25:45 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, BALATON Zoltan <balaton@eik.bme.hu>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH 0/8] usb/uhci: Add UHCI sysbus support,
 and enable for AST machines
Date: Fri,  6 Sep 2024 05:25:34 -0700
Message-ID: <20240906122542.3808997-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=groeck7@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R9AkwEX1NO1U

Some machines (like Aspeed ARM) only support a sysbus UHCI controller.
The current UHCI implementation in qemu only supports PCI based UHCI
controllers.

This patch series separates basic and PCI functionality from the hcd-uhci
implementation and then adds uhci-sysbus support. This is then used
to implement and enable sysbus based UHCI support for Aspeed machines.

The series is submitted as RFC since I am quite sure that I didn't get
everything right. All code surrounding VMStates deserves special scrutiny,
as well as the changes outside hw/usb/ and hw/arm/.

A side effect of this patch series is that all Aspeed machines will now
instantiate UHCI, even if the machine does not actually support it
(it also always instantiates both EHCI ports, so that is not really
different). This means that the default USB bus is now the UHCI bus,
not the second EHCI bus. The bus number must therefore now be specified
explicitly when attaching a device unless attaching it to the UHCI port
is ok. I don't know if it is possible to avoid that and to ensure that
the default USB port is still the second EHCI port.

The code was tested on x86 machines to ensure that the existing UHCI
implementation still works. It was also tested on various Aspeed machines
with enabled UHCI ports (ast2500-evb, ast2600-evb, and rainier-bmc).

----------------------------------------------------------------
Guenter Roeck (8):
      usb/uhci: checkpatch cleanup
      usb/uhci: Introduce and use register defines
      usb/uhci: Move PCI-related code into a separate file
      usb/uhci: enlarge uhci memory space
      usb/uhci: Add support for usb-uhci-sysbus
      usb/uhci: Add aspeed specific read and write functions
      aspeed: Add uhci support for ast2600
      aspeed: Add uhci support for ast2400 and ast2500

 hw/arm/Kconfig                |   1 +
 hw/arm/aspeed_ast2400.c       |  14 ++
 hw/arm/aspeed_ast2600.c       |  13 ++
 hw/isa/Kconfig                |   4 +-
 hw/isa/vt82c686.c             |   4 +-
 hw/usb/Kconfig                |  10 +-
 hw/usb/hcd-uhci-pci.c         | 255 ++++++++++++++++++++++++++++++++
 hw/usb/hcd-uhci-pci.h         |  63 ++++++++
 hw/usb/hcd-uhci-sysbus.c      | 201 +++++++++++++++++++++++++
 hw/usb/hcd-uhci-sysbus.h      |  34 +++++
 hw/usb/hcd-uhci.c             | 337 +++++++++++++-----------------------------
 hw/usb/hcd-uhci.h             |  30 ++--
 hw/usb/meson.build            |   2 +
 hw/usb/vt82c686-uhci-pci.c    |  18 +--
 include/hw/arm/aspeed_soc.h   |   3 +
 include/hw/southbridge/piix.h |   4 +-
 include/hw/usb/uhci-regs.h    |  11 ++
 17 files changed, 737 insertions(+), 267 deletions(-)
 create mode 100644 hw/usb/hcd-uhci-pci.c
 create mode 100644 hw/usb/hcd-uhci-pci.h
 create mode 100644 hw/usb/hcd-uhci-sysbus.c
 create mode 100644 hw/usb/hcd-uhci-sysbus.h
