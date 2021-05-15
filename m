Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1435542lfg;
        Sat, 15 May 2021 10:52:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzabBItJYiWsPcX+FkipcTN4M1iF+WWVk2Yjz+tXrYuO4K3GyaaFp59U7ktvVGXKCZjuIym
X-Received: by 2002:a6b:6c18:: with SMTP id a24mr39979766ioh.21.1621101148900;
        Sat, 15 May 2021 10:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621101148; cv=none;
        d=google.com; s=arc-20160816;
        b=r67jCx88BI5JfsjKfIkk+8865SoH+6slsEtFTAPI+cjJTjLyHOpnyG9xyO8zTZ6sEl
         vx932qJepw9OzXnKcf63h/PAmUEh3jd8Ql8wjcb41aHRa63VMZBYuVaaz0Hy2DwAXM9I
         OR/S5Jq2I3B2gjT8hkTxmG9FgB0LAdC0POqOBCfIhGqFhw+cDADsIP2kOAlaF18FKz9G
         pJAuwhfHTOmXisIacz8VQPnh/RMETiP6WU/i3DqboQFb0K9kErcMxHAw2E5hKvuRcwZE
         5F+UukI+pfUut4UYy1gtiCW+g6faQpnrxAdFEkNUkAM5iTI8DkHfm7XbpJPWZwyDNwku
         WZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yMKbvRHD0VVgAl/shSsvEL3fFV0zSLsEZF6v1iEj1U8=;
        b=Y6XBU3J11EZPlMfgM3nJKXU2V+E4PGq9mFLkBwka61+HbRMho1tRa0kWAMuNoz70G/
         SCG1L3RVGsUAjwTMlhLQttIWSkSAhxyROKAhovO5AaKdTiDSNLZGwAdfZ402rt5Fgyj2
         /CbNCS/5EJlq73P3L4bN4p6z2w50lJTQDvJ4vDFAQKriEIvGoK0DCietusgrW7U8pttP
         /1bKQWm3uXkwyA+ZD9sssQe2gjzE8nIU8/w0PKhNgYZcJld01KdpHqXAd0K5Ex5CMI/S
         nU1Gr4RzE6ALVd2SEWxsB/VGmzF4REKpn+Zc8vb53tL48SHRYnIxB8LX4WqvKy7eVJ7d
         J/FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GecnskS1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si12999997ilv.29.2021.05.15.10.52.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 10:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GecnskS1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhySi-00005f-98
	for alex.bennee@linaro.org; Sat, 15 May 2021 13:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEp-0001E8-71
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEn-0006R5-DC
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMKbvRHD0VVgAl/shSsvEL3fFV0zSLsEZF6v1iEj1U8=;
 b=GecnskS1W4y3lxaZnmGbTFOL6jTM6nh82s3mCtmZdDsqUbd2gITQWaCVDGBGkTbPs9AJ8U
 24ag4/DDxk5i7LByYgArbYJVRAAQrJFXWkhgG/r8atH6D8KvlNOaWwAXnhO7BxN45DQFgx
 qrtHygs8gP5i7QPvMaDnttY37YUFYHE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-sohscvu3Pn6ctlfOEonVTw-1; Sat, 15 May 2021 13:38:02 -0400
X-MC-Unique: sohscvu3Pn6ctlfOEonVTw-1
Received: by mail-wm1-f69.google.com with SMTP id
 u203-20020a1cddd40000b029016dbb86d796so1679480wmg.0
 for <qemu-arm@nongnu.org>; Sat, 15 May 2021 10:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yMKbvRHD0VVgAl/shSsvEL3fFV0zSLsEZF6v1iEj1U8=;
 b=ZxiRRNki3+y0QRa0IPsL0YvsaVqtpP7xNu9PuQaH2vsNyjMgcgGacO/hQn1CoUM+qC
 NQVFwuXTVVwsar9PjZKAZ2H3PoU7WT096ppIedp700FpfH/R85Y2H+Tk4aXGBq0lzXta
 mi+Hu3gIv39r02vI2nE8BdAMVUWCVRENLYuWssq7tj3Bk8oI9Ad4xC4z69Ef3Prx+cWz
 WEJug8drXOpQi126gxdQz76EwC1+9H8UZ7gOvOj+QcXM35qLpGhygvsRngIJ8gRs9HMM
 LOTXAtIRzFy5UrI6LuxI049cuKuhTs4WsvEDAI5ffAhHP+gaQ5k09df5Bzb0hsuPdssq
 yY6Q==
X-Gm-Message-State: AOAM533yoFvA+NQqva0fCMqCVpLt/+jJj5l0UmjR2z9tz9WthI+z49Ok
 MIojmWV71+ZhuXKewu1cYX03lUSQlATcKwG0leZHDK5VEEr0AQE254Gr00H+MvAj4HhExOY0Kwi
 JsfndZ0IvAT3a
X-Received: by 2002:a05:600c:4ca1:: with SMTP id
 g33mr19751665wmp.7.1621100281680; 
 Sat, 15 May 2021 10:38:01 -0700 (PDT)
X-Received: by 2002:a05:600c:4ca1:: with SMTP id
 g33mr19751656wmp.7.1621100281560; 
 Sat, 15 May 2021 10:38:01 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k6sm14457835wmi.42.2021.05.15.10.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:38:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] hw/pci-host/Kconfig: Add missing dependency MV64361
 -> I8259
Date: Sat, 15 May 2021 19:37:13 +0200
Message-Id: <20210515173716.358295-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tdn1lXlT8ILD

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Looking at the MV64340 model source, there is a dependency on the
8259 interrupt controller:

  523     case MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG:
  524         /* FIXME: Should this be sent via the PCI bus somehow? */
  525         if (s->gpp_int_level && (s->gpp_value & BIT(31))) {
  526             ret = pic_read_irq(isa_pic);
  527         }
  528         break;

Add it to Kconfig to avoid the following build failure:

  /usr/bin/ld: libcommon.fa.p/hw_pci-host_mv64361.c.o: in function `mv64361_read':
  hw/pci-host/mv64361.c:526: undefined reference to `isa_pic'
  /usr/bin/ld: hw/pci-host/mv64361.c:526: undefined reference to `pic_read_irq'

Fixes: dcdf98a9015 ("hw/pci-host: Add emulation of Marvell MV64361 PPC system controller")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 79c20bf28bb..9dc0d761815 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -76,3 +76,4 @@ config SH_PCI
 config MV64361
     bool
     select PCI
+    select I8259
-- 
2.26.3

