Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp6549428lfk;
        Mon, 15 Nov 2021 14:36:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyexoqpxjgKApcEFsOAzQDpPO1OeTGehoXrn2c00Fw6Zt1mbGQgXKEItGZosBJc3ssKYkQy
X-Received: by 2002:a37:d207:: with SMTP id f7mr2287095qkj.272.1637015816889;
        Mon, 15 Nov 2021 14:36:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637015816; cv=none;
        d=google.com; s=arc-20160816;
        b=Urw+8/WPSqU2NsyZDIj1ZU6a49jrrWd57On3bOkG0FK1PMI4X2jlcdeXPrbljsUktR
         XHO0hFh5lSiFg0SWqW3MekDVruv9jEjZQ9p8ulsEDMH6BDyHGVTlAedkU708M8iMzCch
         zu7HI5rQ3PIAGl1T4JQMuThLLxVM5AuQmlNwjMX37r8SK0oOO60t/g5CXfKsP7CoCFKM
         vA59giqWMxKv71UBUVzLFg43RhY0+q6a4O4ycduYTwaa5KWcJ96FVZY+UDqMgpWQbdcR
         clNDKyOzjE6y0PJbxSePrIQYUaZjopYc1dYkWDo4e0zP4hS7fnXEOLbuM7KqPaeKQLHA
         bVpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=/OPJ8eHGaKUPhjbn+xYxHNLdw0YY9X/lgt43EhZYKAw=;
        b=pg87LXKokv69DjinehAkz391Z5QGmZTpNS0vtc5i1mSuYVJUBBG0c5wEILvCO0H33z
         Hn59rLJY/dIn8GUWwF0ZtOe+dbI73/Cgav4NfolZ1muQ0qviCVBrbGaX8yvLRpLyLDLm
         Uhdl8b8AXGI2ORbDXYQ66ZSH1EIlciF4Q8HLlgzTwIG3KlIsBAG0GSRsYILlbldWgSsN
         BP+vJiKLgvIpRq7AoIhNEuYUex0WsikFY7fRIJ2KVF4JgAGsjnlufxzovhK1gWFL6tK6
         tXLbJItuvAFBSxCUfnZ6GZ4dtzgfwsHJWe8R3ECUFFkWfegfcRYBXtbGW24gJvBwPhTY
         HUhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XwK5b4H2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c27si18901518qtm.51.2021.11.15.14.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Nov 2021 14:36:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XwK5b4H2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmkat-0002Fb-DA
	for alex.bennee@linaro.org; Mon, 15 Nov 2021 17:36:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkaS-0002F8-GB
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 17:36:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkaQ-0002he-GA
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 17:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637015783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/OPJ8eHGaKUPhjbn+xYxHNLdw0YY9X/lgt43EhZYKAw=;
 b=XwK5b4H2H5qiFMAuEDZcBe+yrTIwRKpIyl31mriGsLxvCGtt2GZgRSkfugt7ZIx1lGP2iq
 S+9fa5OLlLEs7WC/j2beAflwM2sS5iBM4BDtiAdFNha5Lpz60MOZvxU2E+mN2cA32BAv4l
 ukfiay2MQZ1Rf/3RqEv4Bm0HKE+e8Io=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-jF_-6VGONGyV46V_Mxbtlg-1; Mon, 15 Nov 2021 17:36:22 -0500
X-MC-Unique: jF_-6VGONGyV46V_Mxbtlg-1
Received: by mail-wr1-f71.google.com with SMTP id
 b1-20020a5d6341000000b001901ddd352eso3273611wrw.7
 for <qemu-arm@nongnu.org>; Mon, 15 Nov 2021 14:36:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/PWOHUZi2PgaSlm9zifAoFcf6hnwEgCyfNfgwKpbKgQ=;
 b=vL7QPth0pfPY4QpmjiRoRtuarwcT+hRVCF8z92j0KiMnCQIxVGYeuw1sLV7FKD71pd
 /RnoH0qgXePRdSE1gX5zvp/ddSVlVop9Db7So/VcJo/h6SEEMjwoI60OZ0IqP74vpZfi
 B/DMWdyNe8ZOf3bTEQflzRrftJyqhj4nRVt6YAhmySrl0Pb8Sov9fed8FKlKL6bZvkGI
 Egy4Co3ZdyEyjh84cyW1U1ak+n0o+rjWa76SzDhMvu1SjMPVS1tRkRnDgAG3Tyb2zXEs
 jjFlfvrecvBfHeaUVOWnXWrEHsQZ7Sp/hYecKRbRiPfZifMBMD12Mc1KZiFB00JWSihg
 3x6g==
X-Gm-Message-State: AOAM532VoSUUHHln/Ge2NPALPdjaU23/IrKsv8VAQ4rR5+eFoCQzsLtk
 MHd6pOGwCQEPy53D2gKy5Bpqsm2MxvELvvkKayQxFIXbBqBXI5uEXQNyK7qfvrnHfjToeoNwPk+
 Qje/yyCJDyLCU
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr3164194wry.261.1637015780863; 
 Mon, 15 Nov 2021 14:36:20 -0800 (PST)
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr3164163wry.261.1637015780604; 
 Mon, 15 Nov 2021 14:36:20 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 c5sm16570147wrd.13.2021.11.15.14.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 14:36:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? 0/2] hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG
 Kconfig selector
Date: Mon, 15 Nov 2021 23:36:17 +0100
Message-Id: <20211115223619.2599282-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gx+b9hCIsfJ0

The GICv3 ITS support has been introduced uring the 6.2 development=0D
window (commits 18f6290a6a9..17fb5e36aab). This device is for=0D
emulation. When building virtualization-only binary, it might be=0D
desirable to not include this device.=0D
=0D
Introduce the CONFIG_ARM_GIC_TCG Kconfig selector to allow downstream=0D
distributions to deselect this device.=0D
=0D
Based-on: pull-target-arm-20211115-1=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/intc/arm_gicv3: Extract gicv3_set_gicv3state from arm_gicv3_cpuif.c=0D
  hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector=0D
=0D
 hw/intc/arm_gicv3.c              |  2 +-=0D
 hw/intc/arm_gicv3_cpuif.c        | 10 +---------=0D
 hw/intc/arm_gicv3_cpuif_common.c | 22 ++++++++++++++++++++++=0D
 hw/intc/Kconfig                  |  5 +++++=0D
 hw/intc/meson.build              | 11 +++++++----=0D
 5 files changed, 36 insertions(+), 14 deletions(-)=0D
 create mode 100644 hw/intc/arm_gicv3_cpuif_common.c=0D
=0D
--=20=0D
2.31.1=0D
=0D

