Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp195153wrt;
        Fri, 11 Jan 2019 06:23:50 -0800 (PST)
X-Google-Smtp-Source: ALg8bN75s9HKQOSWTKGA+3WKlUvhH1bVKYhR3nwmM3iKlgGL9TULqiP7s6LhyxsOfGXeKKG3/yIp
X-Received: by 2002:adf:f091:: with SMTP id n17mr11456603wro.292.1547216630547;
        Fri, 11 Jan 2019 06:23:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547216630; cv=none;
        d=google.com; s=arc-20160816;
        b=bAh+aoi7wLwVBoiA2Q0IjZOH03hGAJy7beS5hoY+ZM0AP//uLhm6+mxzwjdYyKa+/n
         PN615QEqt5Zmbh+nlVDN2SdmuiDJU6kgem3t+yl3SmBi2OsRCeZzchZAO9YjrTGBO8yu
         d7uY8cm8xRzZsKXyeGQAysFXICChM9AGYaIysKuEPtZ0oTWmDssHpl8kz6UqNjPu3UTi
         mBDsr/Q6dic6hepeVORSXb/5SixMP8qYE0cYwNr1Ca95kXAp8I3K3RQzMBfAw7Xo5bmd
         rOXKVxXRALHhqCdrj/kpUdZ3YaliKtl/6zqLLeGsgo/ES8BMZaoirxvab75fu8jyncdU
         uGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=l/mX2I05btGyS0RaqhNTmciVblgpVjn+KNoVxKwoQCw=;
        b=SRi1OXlGlNiftI3AGCtRV+O5A0/VK1LJzDoUfxMzL5Vtnu3gkmhD3U09RzX0PLlmCw
         wfMnz3yMyr21ePN4QJisWZL/SCU2u2dtfSPfYoFZKj7bjte0DEJEXrgEoq6mFMv95rTJ
         8oyIuT/4qFNH75B43vokUCssSNTXCDXRXFLeamymfElfIir5sVNeY0nJbuT0v1sdhuhn
         pfCV9/ail9Flj/czAGRIOH00SAEVig8UHWG64W6pMpxfhmfvBNg+SxOoBXvDuVt+qX8D
         OXtPDf6vCZOZx5uMJfl+5ScwXzhQfWGplOiGp+zG5l0YgbzF9hgtSYmTtWzxM6Hsgh+T
         HZfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si37295946wro.117.2019.01.11.06.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:23:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxiv-0001z8-FN
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:23:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxe1-0005uM-K8
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:18:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxW9-0003La-8p
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:10:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42632)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxW9-000358-3M; Fri, 11 Jan 2019 09:10:37 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4EEDC0BF2A2;
	Fri, 11 Jan 2019 14:10:31 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E04C5D6B3;
	Fri, 11 Jan 2019 14:10:27 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:49 +0100
Message-Id: <20190111140857.4211-8-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 11 Jan 2019 14:10:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 07/15] hw/bt: Remove HCIInfo from
 "qemu/typedefs.h"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S/U8iyEcHsRj

Files requiring HCIInfo already include "sysemu/bt.h".

To clean "qemu/typedefs.h", move the declaration to "sysemu/bt.h"
(removing the forward declaration).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/qemu/typedefs.h | 1 -
 include/sysemu/bt.h     | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 4524e14d03..92f9996107 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -31,7 +31,6 @@ typedef struct DriveInfo DriveInfo;
 typedef struct Error Error;
 typedef struct EventNotifier EventNotifier;
 typedef struct FlatView FlatView;
-typedef struct HCIInfo HCIInfo;
 typedef struct HVFX86EmulatorState HVFX86EmulatorState;
 typedef struct I2CBus I2CBus;
 typedef struct I2SCodec I2SCodec;
diff --git a/include/sysemu/bt.h b/include/sysemu/bt.h
index ddb05cd109..2fd8c0f14b 100644
--- a/include/sysemu/bt.h
+++ b/include/sysemu/bt.h
@@ -3,7 +3,7 @@
=20
 /* BT HCI info */
=20
-struct HCIInfo {
+typedef struct HCIInfo {
     int (*bdaddr_set)(struct HCIInfo *hci, const uint8_t *bd_addr);
     void (*cmd_send)(struct HCIInfo *hci, const uint8_t *data, int len);
     void (*sco_send)(struct HCIInfo *hci, const uint8_t *data, int len);
@@ -11,7 +11,7 @@ struct HCIInfo {
     void *opaque;
     void (*evt_recv)(void *opaque, const uint8_t *data, int len);
     void (*acl_recv)(void *opaque, const uint8_t *data, int len);
-};
+} HCIInfo;
=20
 /* bt-host.c */
 struct HCIInfo *bt_host_hci(const char *id);
--=20
2.17.2

