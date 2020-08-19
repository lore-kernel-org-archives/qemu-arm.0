Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp546602lfy;
        Wed, 19 Aug 2020 08:23:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCZHB7BtKltQn8Ckfi1buUjrCdvETtk1P1+PCwZ3RDPms1s17Cr3UTmxL/2uByJcHE9A7V
X-Received: by 2002:a25:5d7:: with SMTP id 206mr35955405ybf.512.1597850601572;
        Wed, 19 Aug 2020 08:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597850601; cv=none;
        d=google.com; s=arc-20160816;
        b=PILslNl/B1U6i9C/jVJKu39M64G9G0J1ealxkFK5GcJs3lUJeNe/UvkmLzme3Y++NU
         IV1kZs5vJHaOTdOB7/rJiffx7jpUfH/MGiegalIwRJ5Ups9Hc+KIC2xN1Ti7S0teEwt8
         qx8HRNjXL8s0q1X0c05U8cIFWpluNIG/mRG3S0kXy/QhaPLDR2WlJwJknX7MSi7mkkKY
         3lzLgx8dCI1VrsbpscsiMBWdZatNfJhk8XdB+kbsUdIC3gl9B0DU5wmt1Szq3Z1tZJOY
         jEZbTr+b96Qn35jvqct4fRI2aHJupKJRwpZBo1wxepcfP2O7M6YMFP7eIERR0dJxf1eA
         nYtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=yf58fg/tNBwH7gFmXGBMkZ0JpF5EzIaDXQDlC2M/yGU=;
        b=RhiAyEnmK8/41zo6kAa1mSwOylLwB/qkJtAcCx3Y4w9GUg4sv8YdSu8+w4xaOwlEiX
         +yZa+TPukf4aGZsEyxYENA9f6y9LyB+TCnrKtDgkDGOp3DdRA3XHPlh+ZcdT6SLN+AE4
         uR5DFFOXbWcv0fFNG4rySBLnM2zjWj3VeGfgMzpuHF2IgBHdN46eP3WbZuxhhu8mwcGe
         iYA4PMdh8Npon/1CUtf4hTOfbPIA3Ehpw+Chs+MeJBafdhJulKfKlPemy9eAdN5sMh0v
         PBsWjJmD/TGAQO8oaJ62WxkFlopZAnrkZIXCtP1SZCyDH57lSn1upsGMO7thapiGm58n
         5lkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TioO3/o5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r189si25457485ybr.284.2020.08.19.08.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 08:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TioO3/o5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8Pvs-000837-Rp
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 11:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8Pvk-00081Q-Qf
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 11:23:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32126
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k8Pvj-0000G9-B1
 for qemu-arm@nongnu.org; Wed, 19 Aug 2020 11:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597850590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yf58fg/tNBwH7gFmXGBMkZ0JpF5EzIaDXQDlC2M/yGU=;
 b=TioO3/o5clJjvjwqVdzrsjZPG/Jg05HMiAQ/nhnsxEFQPW7UFeTCF152vPzUsZlWWcWDUS
 UDEpc4zycw4zgNYLTaYuD8ai8hdZhYl3TmzwJHz2ZYoDfnprqVIohcvIap19ARwlgs8gg7
 +7rcopgRaPJa9ZLGQGXffW2Q/Ie7FMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-sVfsufHnOfePao5d5qoFDA-1; Wed, 19 Aug 2020 11:23:07 -0400
X-MC-Unique: sVfsufHnOfePao5d5qoFDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 611C78030B7;
 Wed, 19 Aug 2020 15:23:05 +0000 (UTC)
Received: from localhost (ovpn-117-244.rdu2.redhat.com [10.10.117.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0168E5D9D5;
 Wed, 19 Aug 2020 15:22:58 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/3] Machine queue 2020-08-19
Date: Wed, 19 Aug 2020 11:22:55 -0400
Message-Id: <20200819152258.703874-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 04:00:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zzs7z2GpNWVP

The following changes since commit 672b2f2695891b6d818bddc3ce0df964c7627969=
:=0D
=0D
  Open 5.2 development tree (2020-08-18 13:44:04 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/ehabkost/qemu.git tags/machine-next-pull-request=0D
=0D
for you to fetch changes up to 3ff3c5d31740484b0e19007843094483fb393e80:=0D
=0D
  hw: add compat machines for 5.2 (2020-08-19 10:45:48 -0400)=0D
=0D
----------------------------------------------------------------=0D
Machine queue 2020-08-19=0D
=0D
Regular post-release changes:=0D
* hw: add compat machines for 5.2 (Cornelia Huck)=0D
=0D
Features:=0D
* qmp: Expose MachineClass::default_ram_id=0D
  (Michal Privoznik)=0D
=0D
Cleanups:=0D
* qdev: Document qdev_prop_set_drive_err() return value=0D
  (Philippe Mathieu-Daud=C3=A9)=0D
=0D
----------------------------------------------------------------=0D
=0D
Cornelia Huck (1):=0D
  hw: add compat machines for 5.2=0D
=0D
Michal Privoznik (1):=0D
  qmp: Expose MachineClass::default_ram_id=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  qdev: Document qdev_prop_set_drive_err() return value=0D
=0D
 qapi/machine.json            |  5 ++++-=0D
 include/hw/boards.h          |  3 +++=0D
 include/hw/i386/pc.h         |  3 +++=0D
 include/hw/qdev-properties.h |  2 ++=0D
 hw/arm/virt.c                |  9 ++++++++-=0D
 hw/core/machine-qmp-cmds.c   |  4 ++++=0D
 hw/core/machine.c            |  3 +++=0D
 hw/i386/pc.c                 |  3 +++=0D
 hw/i386/pc_piix.c            | 14 +++++++++++++-=0D
 hw/i386/pc_q35.c             | 13 ++++++++++++-=0D
 hw/ppc/spapr.c               | 15 +++++++++++++--=0D
 hw/s390x/s390-virtio-ccw.c   | 14 +++++++++++++-=0D
 12 files changed, 81 insertions(+), 7 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D

