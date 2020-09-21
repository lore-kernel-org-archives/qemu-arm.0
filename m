Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3875315lfq;
        Mon, 21 Sep 2020 04:12:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOpGir05zO68fHN3BrCP/EATqZlJ+GswlM7iWCRuKg7ZgbzO6FQScVmlFYIXhOHBUhF8nX
X-Received: by 2002:a25:c709:: with SMTP id w9mr5563238ybe.327.1600686742353;
        Mon, 21 Sep 2020 04:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600686742; cv=none;
        d=google.com; s=arc-20160816;
        b=I8OzJ5IqUIOB8LeUkTe55B7BAT/N30RF+qLDW+j8zDmBT4hl8PSux9vZW5onn06cDW
         kUu7fmxvmuM7Ss2lVtPDGP8JbKpgWBu+YzTwIbCFxbxF7xkazIRjHVZPCYagvPO0RK9u
         TvBvn6tkzFdNCryf4/JRKb77Q9mltl10WvqSo14SU7gQ9gp07Ionzpgi1CWlb3qhgEE2
         U8fBQrqU3zDdUid5MECp1FbH7dDVoqWU1e+KsR3Xh/11ymwxXBXe5E3X7CxDufo0Tn0v
         GQCfiiRSUrzRqYesh/8fUglhIeEBtdlKPXtyj1tWSfksI02RnmZnF6vmZTk7rOZS2TiH
         WKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=5wd8WNnpfJf9iOm8rs3WN1lw4U99ZWxrdas1R804ckE=;
        b=uyNnw+m6E6/jqMVHhh1uzi9RW4fs6rjMNdKu9GcLAMMwbu8wJH0ItbTUVpXsMraEEC
         T7pgA1UdOYtLic5RriADp6hhBrDfKEHjYwzyGn6i9LPXEIAeOpOMWVRzr5upX08lcq7r
         Mrivk8yqedkh0v4e9v9AH4YS5wnN37H4BGDxwmALNT5zSEllU+7xQk9bXEAvS0/dR+b0
         Ey/925lzleHwGYBg09Q1pE4bBWujpCCNKM82K7hQ27FY1frVFb4Pjr7wnVIjEU55W8gZ
         8wU1gmuzOnQseW1KfD/qRKtjvX9TiaTf8Rx3m9HZcwNgMypi6/BXaNWPkWshe1+rWHpD
         xRkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dwGaE0ZZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2si12334292ybs.415.2020.09.21.04.12.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 04:12:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dwGaE0ZZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKJk5-0003R5-Oe
	for alex.bennee@linaro.org; Mon, 21 Sep 2020 07:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kKJhW-00012c-TB
 for qemu-arm@nongnu.org; Mon, 21 Sep 2020 07:09:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33642
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kKJhU-0006SN-Jj
 for qemu-arm@nongnu.org; Mon, 21 Sep 2020 07:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600686578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5wd8WNnpfJf9iOm8rs3WN1lw4U99ZWxrdas1R804ckE=;
 b=dwGaE0ZZLzPQBn4MxliXD6BtVM17rwCXtyS1RbApKkTUtpkp/Mwq8bfOs3TP19Wu93qsvk
 olJPhhwN9XhijkmR9heUmGIPEQjTSfAGuvZOnLWCZyWXYwwC9a6FTda+wsepnccxo2QPOz
 CtXEtRNmSLKJ9/aKoGwuB3K161/jnv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-WTFLyxwRO_-1bDRkoEvw-A-1; Mon, 21 Sep 2020 07:09:34 -0400
X-MC-Unique: WTFLyxwRO_-1bDRkoEvw-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABF6418B9F83;
 Mon, 21 Sep 2020 11:09:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4626755773;
 Mon, 21 Sep 2020 11:09:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C44F16E0A; Mon, 21 Sep 2020 13:09:29 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Input 20200921 patches
Date: Mon, 21 Sep 2020 13:09:28 +0200
Message-Id: <20200921110929.7410-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 04:38:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.501,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YNxFNykKrEeH

The following changes since commit 053a4177817db307ec854356e95b5b350800a216=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/fw_cfg-20200918'=
 i=3D=0D
nto staging (2020-09-18 16:34:26 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/input-20200921-pull-request=0D
=0D
for you to fetch changes up to 38b01a997e6678b4ba86ab12a78a39b7d94ee7d0:=0D
=0D
  hw/input/tsc2xxx: Reduce MouseTransformInfo structure exposure (2020-09-2=
1 =3D=0D
11:22:34 +0200)=0D
=0D
----------------------------------------------------------------=0D
input: tsc2xxx fix.=0D
=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (1):=0D
  hw/input/tsc2xxx: Reduce MouseTransformInfo structure exposure=0D
=0D
 include/hw/input/tsc2xxx.h | 8 +++++++-=0D
 include/ui/console.h       | 8 --------=0D
 2 files changed, 7 insertions(+), 9 deletions(-)=0D
=0D
--=3D20=0D
2.27.0=0D
=0D

