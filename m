Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2282515lff;
        Mon, 14 Jun 2021 13:10:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoOd68InZvqwiGFtFzal4gjVhsNN+MmxTsySk4CLVRCM55NkBO8TJdzjvHE35WxPHDl3Xc
X-Received: by 2002:adf:9031:: with SMTP id h46mr20919312wrh.125.1623701403388;
        Mon, 14 Jun 2021 13:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623701403; cv=none;
        d=google.com; s=arc-20160816;
        b=d2saeAGWYGnmM+OOhOg59nzVoQQt/IiLiFLGCl9Jw0u/SGMO2c6oNEwzHvaYrrDHe3
         oy0zhpwYiHU13++q5hO+JddbDWwot57SHKxHAmlb/tsXBLfXkGCbgSE6vFZG7AXXCYFK
         V7Fwb621LosuVY7qcNTVCCkUkCiuH5RZviyTmNIaHaB1LktE2TG8uQm1o5SfR3qj91su
         cpW2XmnjT9DxTW+xahLdO5/80rLYi5LJtrvB7EVEPAfoCAqsPiwqmLPmXIchh/RSiclI
         /gOHwNt5tB1IkpHbkg0KXb0rZeSGx9NaSz9/K31AzrOA7urZbQzV39h0K+Wx9AqZOJQb
         qqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=3A9XQpUbpdyJ+8EY8vqWmSLu6gFPDNUkcoJ1JkTzveM=;
        b=AO5K7bmA8tHwAibD5f1n24Va0pyPfbsvR9LiAM81reMYj4NRrJy306z5GvxBtxXejV
         RsuuMQyUE8rKrkpab7TxbaV5AgEv476GHx5stgfkfHq0KOK/F9OWuU1QDYxb4h0vF2vw
         aVczxPt8Pw1NSB5f4PDS0MVSaBS8U0I1vXwfI0w2HLiL6e6nTg3N2jJwTF70rB1tDPmG
         LWZCTrkr6EyRGK/AifstLqB7KBIVAkoNIKJjhtXldgwQjdkkLnXEwwsxCHx+82oI6o1f
         JoS6vfzYz0ImQ1lcOB5WVy6gJ2q7Wftc2jgQoTH1wbD1mCbns+Zbc8wEdXDxIWUjgP3B
         LXOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cbydDYoJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si16790714wrq.498.2021.06.14.13.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 13:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cbydDYoJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lssuI-00014m-BS
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 16:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssu6-00013n-8V
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 16:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssu1-0002nS-R3
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 16:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623701384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3A9XQpUbpdyJ+8EY8vqWmSLu6gFPDNUkcoJ1JkTzveM=;
 b=cbydDYoJmm9uCHRG16joL8cVphulY/yxfWs7tB8wqlIMKQ3lySNAY59DTOfStrtmuacAnV
 Pk/ji7bo2RmUxYGxvxNN1S+i3lzF8Qz0l7obOm3HR91wORAiFr9GwSmRiqoiXM+ORZwpe8
 oeUR+t2acUSKaHcbQdp8vH3K30wEGPs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-6SJ-CNecO12I9iRo-rdqvw-1; Mon, 14 Jun 2021 16:09:43 -0400
X-MC-Unique: 6SJ-CNecO12I9iRo-rdqvw-1
Received: by mail-wr1-f72.google.com with SMTP id
 n2-20020adfb7420000b029010e47b59f31so7436988wre.9
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 13:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nbVl2zhzIPoNrOU/Bzhb3zaz1wZUkviYsQ5osFjyS50=;
 b=b1vPgIda3NKn2YdSklH8wc9+E7OjGdpOecEe19chVdMgnUE4cTwbO1QpZgdegUDB0A
 eMei8cZsXWcskusIsmSDfkhhRbbyP6iVazpsx8zZOSK+0JVcAeReaT5UGGSsYA4ltAN3
 XzQuYUYz2yKov2Qg3TyqAXVB1Yb1gUK225uOb76jBrH8X4TUhuOGdbdDnoE6wPE5LMBp
 3xvmpgeYhklnUGaVI/ZsZOuGeuhAuEDablXRfeAhXy34e+SX4YKftNbl+q/YmrZOIW9A
 PnklFtv761lEPIqk2OmXKVtJelDfvmmPjLcWsyfOY/QW46sW5M2PLSodwCeiEd9l6Mul
 lT4A==
X-Gm-Message-State: AOAM532dYm8RVforTqwMKQD1XEHuu7PepKzFjuZuxpQU64ROkbqTwQOY
 PD7T7TSTgQrvlvM9QZvemoc7eGKpo7vwx1uXFhFRF4O4w/JQEACYFcFsp8Rx+UAoV6S54aqHqhu
 6rGcU4Gwtb+hf
X-Received: by 2002:a1c:7418:: with SMTP id p24mr930903wmc.80.1623701382003;
 Mon, 14 Jun 2021 13:09:42 -0700 (PDT)
X-Received: by 2002:a1c:7418:: with SMTP id p24mr930882wmc.80.1623701381851;
 Mon, 14 Jun 2021 13:09:41 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id u15sm344802wmq.48.2021.06.14.13.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:09:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] tpm: Eliminate TPM related code if CONFIG_TPM is not
 set
Date: Mon, 14 Jun 2021 22:09:35 +0200
Message-Id: <20210614200940.2056770-1-philmd@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OBUUkr63MnXE

v3=0D
- make the qapi schema conditional (Marc-Andr=C3=A9)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  tpm: Return QMP error when TPM is disabled in build=0D
=0D
Stefan Berger (4):=0D
  i386: Eliminate all TPM related code if CONFIG_TPM is not set=0D
  arm: Eliminate all TPM related code if CONFIG_TPM is not set=0D
  acpi: Eliminate all TPM related code if CONFIG_TPM is not set=0D
  sysemu: Make TPM structures inaccessible if CONFIG_TPM is not defined=0D
=0D
 qapi/tpm.json                | 28 +++++++++++++++++---------=0D
 include/hw/acpi/tpm.h        |  4 ++++=0D
 include/sysemu/tpm.h         |  9 +++++++++=0D
 include/sysemu/tpm_backend.h |  6 +++++-=0D
 hw/acpi/aml-build.c          |  2 ++=0D
 hw/arm/sysbus-fdt.c          |  4 ++++=0D
 hw/arm/virt-acpi-build.c     |  6 ++++++=0D
 hw/arm/virt.c                |  2 ++=0D
 hw/i386/acpi-build.c         | 20 ++++++++++++++++++=0D
 monitor/hmp-cmds.c           |  4 ++++=0D
 stubs/tpm.c                  | 39 ------------------------------------=0D
 stubs/meson.build            |  1 -=0D
 12 files changed, 75 insertions(+), 50 deletions(-)=0D
 delete mode 100644 stubs/tpm.c=0D
=0D
--=20=0D
2.31.1=0D
=0D

