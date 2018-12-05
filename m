Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9831831wrt;
        Wed, 5 Dec 2018 12:58:56 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Xtd25Yvg5sW86SuEAEkmJZfJ9vVjZTED+o5XIurszmplVyAyDF0FxZvhmwQFs6mW10sCN6
X-Received: by 2002:a37:4792:: with SMTP id u140mr24523755qka.301.1544043536499;
        Wed, 05 Dec 2018 12:58:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544043536; cv=none;
        d=google.com; s=arc-20160816;
        b=IbPkWfK1mOm2ISIlVBUw17pPwjBWGe2ziM4rlwuk3tQIgrCCy+NFkqbn1/z3srUiRx
         pmp3H4WZuOk8QtguRduyOEMW8ZcwQSjyyFRYQO1QLw8MR5dbBh9XoQq5sQOLpmjt6lpC
         gfj71IORZsqkA4a1l19xsEherpBbOiC3sKvQ1ks6JeN4RakW4zB7X6Us17NEuPERhWQH
         TY3PIsiEuY+5bZ0g1x75VQCO6LEnZqL+UMivfvcHNoKQuxHWjldiUpoeuHNKXra9NTRM
         7BdPlXao4Wzy+saVCc1lkUepiipjAVXBcSTbKyU0Fu7qJDxeca1Tos6sG+nLsEo/qG8Z
         7VSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=LMY6ASg5CU59wqtZ6Br1CE2cHbcYXwDULTTkZAAEhH8=;
        b=yA2fmO8/q4LW+p1FUm2CrE1QWnD+P+oW/bOzBKn6mBu+JN8Y6zM902LQp459rwymMh
         Nw4DKJpsnvItldemhsUeZo2G9MQSqqbDQ+Abl1pivQfUVUQ76p1y6WiVXWSVJzZJk4gA
         9yDfkNVsIx0t9byWDnjvBmE6KPgyoFgCUI6Pp5KNhwZvOQR6gSAbPtiJ66Lp1lJ7s0ds
         JbymYe+StcL7hAyeRemw0RTotLBH144ZhfhBY8JR9cfLjRFp0j/CwkyAvqTcF+2BVAtX
         YecYBGwqiSBTcLIZgBY221X5MFFQFaFMNFW6KqZHQ8vG0Ka7CGUQGZtGg60l/GaytS1P
         CVjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y188si484413qke.85.2018.12.05.12.58.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 12:58:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUeFz-0007po-TA
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 15:58:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUeFp-0007op-5A
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 15:58:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUeFn-0001Lo-0C
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 15:58:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57354)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gUeFj-0001Dh-3k; Wed, 05 Dec 2018 15:58:40 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34FDF3078A38;
	Wed,  5 Dec 2018 20:58:37 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E18195C5FD;
	Wed,  5 Dec 2018 20:58:28 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Dec 2018 18:58:22 -0200
Message-Id: <20181205205827.19387-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 05 Dec 2018 20:58:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-4.0 0/5] spapr/virt/pc: Eliminate custom
 instance_init functions
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UXjdZMEGtvc7

Based-on: <154385451622.17724.12272989665681200621.stgit@gimli.home>

To help us make machine-type version differences introspectable
by QEMU, the info need to be available at class_init time, and
not require instantiating a machine object.

This series moves machine-type version differences to class_init
functions, and let us eliminate version-specific instance_init
functions from spapr and virt.

On PC the pc_compat_*() functions still have some KVM-specific
code that needs to be moved to class_init before we delete the
pc_compat_*() functions.  We will probably be able to implement
this using AccelClass::compat_props later.

I also plan to move default_machine_opts data to
MachineClass::compat_props, after the compat_props/globals
cleanup[1] being implemented by Marc-Andr=C3=A9 Lureau is merged.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg576381.html

Eduardo Habkost (5):
  virt: Eliminate separate instance_init functions
  spapr: Use default_machine_opts to set use_hotplug_event_source
  spapr: Use default_machine_opts to set suppress_vmdesc
  spapr: Delete instance_options functions
  pc: Use default_machine_opts to set suppress_vmdesc

 hw/arm/virt.c     | 87 +++++++++++---------------------------------
 hw/i386/pc_piix.c |  2 +-
 hw/ppc/spapr.c    | 91 ++---------------------------------------------
 3 files changed, 24 insertions(+), 156 deletions(-)

--=20
2.18.0.rc1.1.g3f1ff2140

