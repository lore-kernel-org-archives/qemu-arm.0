Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4186041lfm;
        Mon, 27 Apr 2020 07:32:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypLybvksv64X6YpvzkOSgLRRP2WXMCx1gOujZlcgoKn80kMs3cBXKCeqq1Bntzk7DCua5muA
X-Received: by 2002:a05:620a:249:: with SMTP id q9mr22585909qkn.389.1587997944408;
        Mon, 27 Apr 2020 07:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587997944; cv=none;
        d=google.com; s=arc-20160816;
        b=fOqtPmEP0AiFAiEdofSrG7f1Hzny2zlW+FBNXGfoGgi/nU1TGmfZYMzAAvkZQna5H0
         vVzsKv0UHxDwuEoVq5xW7y+YEoPVLZvbyhFLW0tm98HCQC1xRB4PmuL8djx0+KN4qvuS
         ELeFeUWYxrZP4EId6CIlSDuK+pBPeiI05i76uhoeJbVwpckEE09iIJmlqTzWqBwHVlgt
         SixStnit9F/nttYyS+qbUCAZ5osrBdYgpsain36Rfo2V0fc9MpMxE8eR2olPYNeBBRjk
         RfV8+ZcLDxYd8u0vbYEvTVLMPjVDInxf1/RyJbbLZYqM0kylkLkGR9zaQrf0o2g+NHzT
         Wzlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wF53oQKHsTYpLrSDR4DejZ9174KDt94gCTwACYMoD4Q=;
        b=Y4flxPycOw9oSj0iFr1moFuMDZIBVo6dTvESz38hULjXWlfghuEW5USRzh+9dybl2e
         pDU8PnP6byQoMQFVV4bH/w0XL6C3PpELMOAnnEFiAIK/+d/irlnMhgYFYwemGyk9YgCh
         nPa7TKprm6Px18S+1xpP8XuLOPhP1S1BTti1/9KrgJtFFodfE3CbK612d7TET+4/WosG
         s4ICJj84cnaBbzEEiO2HGJ3h2tvxxfAcCpmmgKR+K1J2+4MQ1WfBe63UEUPgw3jr0EoZ
         s/Pc2G3TDcDsPuUug8NIdI8FUDDmuNrfoEjmLjNSZav39h28bv/LuWvKT7All5rFBmsb
         2g/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SBdJajfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si8830638qkk.305.2020.04.27.07.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 07:32:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SBdJajfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT4o3-0000bl-Nd
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 10:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jT4np-0000aR-TV
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 10:32:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jT4no-00017o-6G
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 10:32:09 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50256
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jT4nn-000157-Oa
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 10:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587997926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wF53oQKHsTYpLrSDR4DejZ9174KDt94gCTwACYMoD4Q=;
 b=SBdJajfxXoG/Pgw+HBP6CkyI5CMGEHtg5O6+OI8hFnToEYaqheXS42I+lS4QhYV+SnOTn1
 7BknFFwvhFQgl8qZE84HOOGSjvXokr01ygogsv9ZPqDT70VHbRRWZkGJ9d6eaIMVBIbJzu
 FErBKayj7xB7gDje5J8nSMAdQ0rIrXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-hjOcA5zrNPO-cMdOVnHuyw-1; Mon, 27 Apr 2020 10:32:02 -0400
X-MC-Unique: hjOcA5zrNPO-cMdOVnHuyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2F76100A61D;
 Mon, 27 Apr 2020 14:32:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-115-95.ams2.redhat.com [10.36.115.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 719B36062C;
 Mon, 27 Apr 2020 14:31:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 cohuck@redhat.com
Subject: [PATCH 1/2] tpm: tpm-tis-device: set PPI to false by default
Date: Mon, 27 Apr 2020 16:31:44 +0200
Message-Id: <20200427143145.16251-2-eric.auger@redhat.com>
In-Reply-To: <20200427143145.16251-1-eric.auger@redhat.com>
References: <20200427143145.16251-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 23:32:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tWK6dPnTQITE

The tpm-tis-device device does not support PPI. Let's
change the default value for the corresponding property
instead of tricking this latter in the mach-virt machine.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/tpm/tpm_tis_sysbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
index 18c02aed67..eced1fc843 100644
--- a/hw/tpm/tpm_tis_sysbus.c
+++ b/hw/tpm/tpm_tis_sysbus.c
@@ -91,7 +91,7 @@ static void tpm_tis_sysbus_reset(DeviceState *dev)
 static Property tpm_tis_sysbus_properties[] =3D {
     DEFINE_PROP_UINT32("irq", TPMStateSysBus, state.irq_num, TPM_TIS_IRQ),
     DEFINE_PROP_TPMBE("tpmdev", TPMStateSysBus, state.be_driver),
-    DEFINE_PROP_BOOL("ppi", TPMStateSysBus, state.ppi_enabled, true),
+    DEFINE_PROP_BOOL("ppi", TPMStateSysBus, state.ppi_enabled, false),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.20.1

