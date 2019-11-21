Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp3282638lfc;
        Thu, 21 Nov 2019 02:22:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqytuRgrn90dkx6tqert9s+dwiYLOeCgFooekEHe6z9hJNqyO2W6AVmFg7GLu7MBYn7PEc5V
X-Received: by 2002:a17:906:9458:: with SMTP id z24mr12538781ejx.289.1574331778954;
        Thu, 21 Nov 2019 02:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574331778; cv=none;
        d=google.com; s=arc-20160816;
        b=KAmdNcc0jRPN4AH1O+PZp9b3MaNvdpqVxHbVG6KCFeUspXyxmZVaXIHPAWUGn3ljVL
         JEwInAOHgZdkMnEVlyncsdCwFCPygX2LArt7q+8ekaq7p+g7VVyIDlrp6QVxtTzm6ptW
         2pbWW6h9jRiax0Ji9pcus3jQNGEU4LQdwQgaDVmZEzPCJna2tgZccep+lq1+NNrU4kRs
         7Vpliav5NYAUoYAycEFNXygtpTOtUew/JiwV9n+y5PAI7Z0kQwmWPc9GxI8XUJqm91Q1
         9amrfsjUOpPnEYyXr7bw5gdm4WFXhLZKuitgwdzC6Csox/GGgAF/S83ufjDuCkswbJHh
         x8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=EjAUpSJzJpegy5ge3A/puoS+rZ0LjJO7CbtLZG9YGL8=;
        b=06BkbX5a+wPeGYm8vtrNHMpLPZonU8tSNEdbbyhjH5cfD4ISE0qeWy5ybmmtHGiFaC
         wrxR02n0/5QcT7L9yFNKyUDmshrG8+eUhfCMsfV7MLckjVGDMZArMaLw+0RUKycau574
         osDDI6gWkYrIvZl4ctZqswAvJ6M9AFr4jkIX9jpE5LjJ0Ejrv3gKtx7eO0vUb42VntcK
         utfgcZU5lYxk8XUT2i3ELiVGshcOECi+Bttyoukfj1+M7yVCl0EDXKMyROZAGGPIK+xa
         1VTrLamQzDOyvMkxn6ihVPP1HR8echZgaqwGzrzX1AswPlWjLGgIXh3yAonKaum2jtlj
         k13A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JIj6tcyn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w54si1866787eda.214.2019.11.21.02.22.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 02:22:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JIj6tcyn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXjc2-00052C-0j
	for alex.bennee@linaro.org; Thu, 21 Nov 2019 05:22:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42237)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iXjVl-0007BL-8Z
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 05:16:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iXjVk-0007VG-55
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 05:16:29 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52362
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iXjVk-0007Ur-1I
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 05:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574331387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EjAUpSJzJpegy5ge3A/puoS+rZ0LjJO7CbtLZG9YGL8=;
 b=JIj6tcyngzqriHChWkFMKj3X9aHMCAPahHQ3SYsS+22yE8n8Y8+q3SVcuMkhlYPK2LxR2S
 DqmwOrRDhmO9tp+EAUfZaU/kwb+ezZr41fBGvqK6Yzf6PDBTD6TjmyGOAav7L9WjCyElK1
 xwHIOEX+wslKrEHRGyuy3ZeeFzcsYms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-45z4v-wnNNWiqZpPQ5UvMQ-1; Thu, 21 Nov 2019 05:16:24 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE6EF1005509;
 Thu, 21 Nov 2019 10:16:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C8866CE50;
 Thu, 21 Nov 2019 10:16:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 830CA16E08; Thu, 21 Nov 2019 11:16:18 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Fixes 20191121 patches
Date: Thu, 21 Nov 2019 11:16:15 +0100
Message-Id: <20191121101618.29289-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 45z4v-wnNNWiqZpPQ5UvMQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: paeYpRrzST4Y

The following changes since commit 39e2821077e6dcf788b7c2a9ef50970ec7995437=
:

  Update version for v4.2.0-rc2 release (2019-11-19 19:34:10 +0000)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/fixes-20191121-pull-request

for you to fetch changes up to c55c974486b0dadf97fe47e2e789d5dba9b77138:

  ui/gtk: fix gettext message's charset. (2019-11-21 09:42:30 +0100)

----------------------------------------------------------------
two audio fixes and one gtk message fix.

----------------------------------------------------------------

Sai Pavan Boddu (1):
  display: xlnx_dp: Provide sufficient bytes for silent audio channel

Volker R=C3=BCmelin (1):
  audio: fix audio recording

yanminhui (1):
  ui/gtk: fix gettext message's charset.

 audio/audio.c        | 1 +
 hw/display/xlnx_dp.c | 9 +++++++--
 ui/gtk.c             | 1 +
 po/zh_CN.po          | 2 +-
 4 files changed, 10 insertions(+), 3 deletions(-)

--=20
2.18.1

