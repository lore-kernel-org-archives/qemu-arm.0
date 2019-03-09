Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9722979wrx;
        Sat, 9 Mar 2019 10:19:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqwvba0dHj+xXEQFO3nwqztp5pM/3OuIS6PNtmm6Vu0ZsnMZPenJWlJLN2RqOxmANl5B28v+
X-Received: by 2002:a25:ec0b:: with SMTP id j11mr2500177ybh.316.1552155598710;
        Sat, 09 Mar 2019 10:19:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552155598; cv=none;
        d=google.com; s=arc-20160816;
        b=Jb3vz+q0EldRKMkg3/3G6iA7yjq+GgOy6MxWzEvdhkMi5kYAD4pqFI96Bu+0qiRs9f
         lBZ224jR6yZjm5t9CxV1UD1b44O8YQYlMgWZD+khzXxkiiQ+5ki6x8kNTJAwWCMX2/uQ
         3pMHIukVjdOrdfnU4mccNrlu8ysDSk/wgqFGHGvpcpbtt7IP4emOAAd/4dAZvU8ozJnk
         ctAVIi1+47dBbZ83CxxVWDqdZXor0pDxvqITbX2fUWQtPXlHn9LpgNdxXpGz3jhQV9ts
         5ZKOUynhZq2PyVUl9DIe0eeGgWvksE33HXeSlnvIIki9OcLiA3kHhwSKsMe2TVKBnBSa
         OkyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=o6DnPxDmcc7QgYkm/w9yzrictZOtl5zWr5g0Td8+4AM=;
        b=QMZy4ZYR99MjDGaWPRV4FSRKzmx/ei+n8yIbQsguV+ADYrYOVXRPFDnZ4CTKEpP8OE
         RdL4LmERP1RDkdxhjbv+h29UsTxB2kNkTv9c7+SLMQUZdKFwsGE9SjVukP/+KdCZWInX
         qBgpfqQ85/cycevJ54WX0pTpdCcl92ygKppHQ5VivBD9vtiDpDEkoekW/7kiqewM5/DD
         /6WrBkAtv88fqiScbcZJN4Y7tiSsLtTYCFmI2EsuWe09WxDxGxG1/vtSs4inZ2f8xCmR
         P1iK9g9XKbfALcwP3Y1xoCoOiBajnhm6jzn06nyo3q/nrYyW3T39ooPDzGkOXC4bCK2h
         12Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si560149ywe.71.2019.03.09.10.19.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Mar 2019 10:19:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2gZi-00012Q-2o
	for alex.bennee@linaro.org; Sat, 09 Mar 2019 13:19:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2gZN-00011B-2u
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 13:19:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h2gZL-0004AG-A6
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 13:19:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60178)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h2gZK-00049F-3K; Sat, 09 Mar 2019 13:19:34 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59613C057E68;
	Sat,  9 Mar 2019 18:19:33 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-28.brq.redhat.com [10.40.204.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB28060A9F;
	Sat,  9 Mar 2019 18:19:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat,  9 Mar 2019 19:19:19 +0100
Message-Id: <20190309181920.30553-2-philmd@redhat.com>
In-Reply-To: <20190309181920.30553-1-philmd@redhat.com>
References: <20190309181920.30553-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Sat, 09 Mar 2019 18:19:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 1/2] hw/arm/virt: Remove null-check in
 virt_build_smbios()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sNCFx7a28knv

Since commit 578f3c7b0835 ("arm: add fw_cfg to "virt" board",
2014-12-22), the machvirt_init() unconditionally creates the
fw_cfg object.  Later, commit c30e15658b1b ("smbios: implement
smbios support for mach-virt", 2015-09-07) added a superfluous
null-check on it.
Remove this superfluous check.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Corrected commit reference (Laszlo)
v3: Dropped 'Fixes:' (Markus)
---
 hw/arm/virt.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7f66ddad89..377e95a4cd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1281,10 +1281,6 @@ static void virt_build_smbios(VirtMachineState *vm=
s)
     size_t smbios_tables_len, smbios_anchor_len;
     const char *product =3D "QEMU Virtual Machine";
=20
-    if (!vms->fw_cfg) {
-        return;
-    }
-
     if (kvm_enabled()) {
         product =3D "KVM Virtual Machine";
     }
--=20
2.20.1

