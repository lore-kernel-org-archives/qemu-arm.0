Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4189219lfm;
        Mon, 27 Apr 2020 07:35:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypKQqPnoYZoSN0WSar6vR4Lm1B+1d7HLAXJlQB0mcIxzAaSU5pdkns4IitrsKeZZir0SZDhz
X-Received: by 2002:a05:620a:556:: with SMTP id o22mr22919024qko.166.1587998101080;
        Mon, 27 Apr 2020 07:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587998101; cv=none;
        d=google.com; s=arc-20160816;
        b=iF7l7jOxi84Sq+zQ3WkvGKkyT7nUFSuAMhW0eeqJl7g/J7i9XEHIpQI1KPe2QehuQC
         Fi055dkVRXVM2YlfCm6oYg2X8aUOvyObY3QxD2tNbxxDHyjXMuMYsB2Rzb44kLkZxIoo
         77RvZJa3JeOvVytcpYtwoFzVg2IdQGGsuRkQKq8qeyGV8F4dAhfbC5CIeGFpOGWBoZHk
         V6dhnvpprp7s7+Vy4O/L165bHLGGLAm6Mqy9kA1Wwjayn8PdZLGazmOpS6VdTpdBcVJD
         e6QcAwBiNbR8cfOxMl/mW+NklYXe8NXdqbuD3MOa+diBC/E7IS273rU6mxhJV7L03a0A
         NjeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6DSoist89sLde+5SYreI/3BC1hTgpbC4HndD/VV2RXg=;
        b=mKoLZFQEyNIqhfmnTBLLUwDmU4IOb2JOADLvZZqAGSJVCaAtZ9y8+JxfkLq0D09TSq
         4tRrICvvRh0l/fdBLrSVkSIiRaBH/HtHqEn/gxme6PjdGTzwMmdHjr3ZFBKoFUDE5d05
         XCrHUwMmQx9dpyowwR1+pk0PC8hA5Y5wNZeIUUqLAm9vie3zZzlFfpsv42RdEH9X3iid
         dvr+p3z6KtG1F2zDiCdIgwDOPUbuqNSt2q1Bdx6rpQ0WRVnf0wBO4fSG35UmJqgNLIgO
         f+IkX77jg30SY8/QDgY/Cu3oZmiRd0Q9rQ5IVGC5cwhnGEHXQP190i7u0h1dzn0UfP+O
         vvJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/4AdATj";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g57si8698047qtk.241.2020.04.27.07.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 07:35:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/4AdATj";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT4qa-0004Vh-Ft
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 10:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jT4nr-0000bm-Pl
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 10:32:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jT4nr-00018M-AD
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 10:32:11 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37328
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jT4np-000182-Rb
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 10:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587997929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DSoist89sLde+5SYreI/3BC1hTgpbC4HndD/VV2RXg=;
 b=g/4AdATjFIPEgs1rMT4oYYcCnRRjhPCz9X1JprJXd6Qd7VQWFmLvGKujdhxFVmRLPdwg0Z
 jSNjgFaxXjMUwHwy49O/8iqEj4jgVekP3KbVC0D+3Naa9xaL7tbMv/Au7mGUAyJ9RRjjPo
 cGOPp2Qeiumbc5LVMDTYfIXJ7yj2pTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-oQocEFixNfCA6zbhkX8ufw-1; Mon, 27 Apr 2020 10:32:06 -0400
X-MC-Unique: oQocEFixNfCA6zbhkX8ufw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A72551B18BC2;
 Mon, 27 Apr 2020 14:32:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-115-95.ams2.redhat.com [10.36.115.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDE0A6062C;
 Mon, 27 Apr 2020 14:32:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 cohuck@redhat.com
Subject: [PATCH 2/2] hw/arm/virt: Remove the compat forcing tpm-tis-device PPI
 to off
Date: Mon, 27 Apr 2020 16:31:45 +0200
Message-Id: <20200427143145.16251-3-eric.auger@redhat.com>
In-Reply-To: <20200427143145.16251-1-eric.auger@redhat.com>
References: <20200427143145.16251-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/27 02:05:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K/z9HnMNXh7s

Now that the tpm-tis-device device PPI property is off by default,
we can remove the compat used for the same goal.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7dc96abf72..2a68306f28 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2311,11 +2311,6 @@ type_init(machvirt_machine_init);
=20
 static void virt_machine_5_0_options(MachineClass *mc)
 {
-    static GlobalProperty compat[] =3D {
-        { TYPE_TPM_TIS_SYSBUS, "ppi", "false" },
-    };
-
-    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
 }
 DEFINE_VIRT_MACHINE_AS_LATEST(5, 0)
=20
--=20
2.20.1

