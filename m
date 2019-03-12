Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp173970wrs;
        Tue, 12 Mar 2019 00:37:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzV6xl9+9IBFq2w3Ouq0baFZmOfayzsqrw+ppCtbirSaA1yzFBvp9+ikvLUxr7VfLhPwd08
X-Received: by 2002:a0d:ee42:: with SMTP id x63mr26814367ywe.97.1552376279861;
        Tue, 12 Mar 2019 00:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552376279; cv=none;
        d=google.com; s=arc-20160816;
        b=Eik6IKKOFNJBi8Zlfx5i+KOmIENAaTqhFr4mTtXMubAx/GCqAZ1yzWC2lBAeP9Wlhp
         bKvYNC+Ih1VhGqvmlxsN/IQTto82iAoeN33WbxBsgszlW5HuIH9hRb+Ccb1BsFUhGW4k
         IK/T+8IJIOyruLKEY5nqoSqFBvKxzvSlsw/0Fi9SMvL+fe6e4hLlfiAE1SJvtHYNsrss
         iamBBrJUlNzJfDdbgxpeqcIPkz9o46jJ6H+SzzEr/ruc1lH0CZRCSWOoYcgtSMAXudiX
         8xD/cCEhNH+neidvzVgZYidUvmivYUNaV/0oeqjs3kOG0yGIU7vyV06tqa7nq9BP33qZ
         2+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=1bpd8BA/S2GPg8fkL1t9QE6DoX++w+6MLWLPGEV1CAc=;
        b=vwugKamZJs9s819IRpy3MIqxyqRY8xn4GksBJqIxS7ohVB2YelprsYRUlJtr0Ntp8D
         xYezWW9MCBx+/uUkkPiYnWyXrT6CnI7eXMNiUmlv0MAv11vJnGDTeMTr7IqADI5rt09P
         zk2APYTD85qfHxTk1OR80TSmbYRWm6lSeX5+o4rooc+69QzW1V0Ga8NqE8mbO7ZimMbw
         /IPNKSVgPyVQaKF8HV2F83EHtWBKJybzsdHig+DaMWkX8jxsJikCiIPGjYA8Qh00dNWq
         IF7lImqWueTFxVJeoZZiDt6CyvkTU9Xaz+YoFTVNsyM7kkJI4asdhqPIPdSk4W/gn3Oh
         Qffw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 191si4427218ybk.243.2019.03.12.00.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:37:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46671 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3bz5-0007Z9-5q
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:37:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3btD-0002UC-HG
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:31:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bhm-0001Mw-5Y
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:20:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40812)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1h3bhl-0001Me-T1; Tue, 12 Mar 2019 03:20:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98967C049E24;
	Tue, 12 Mar 2019 07:12:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F21760A9A;
	Tue, 12 Mar 2019 07:12:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 2D68011AA4; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:36 +0100
Message-Id: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 12 Mar 2019 07:12:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 00/14] Audio 20190312 patches
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /IXLyB8pY/p8

The following changes since commit e2a18635a400b0e68679614132e9ef63161055=
90:

  Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2019-03-08' i=
nto staging (2019-03-09 20:55:44 +0000)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/audio-20190312-pull-request

for you to fetch changes up to 05d2f2a64dbcaa50370d344ab12081d776ed0f03:

  audio: -audiodev command line option: cleanup (2019-03-11 10:29:27 +010=
0)

----------------------------------------------------------------
audio: introduce -audiodev

----------------------------------------------------------------

K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n (14):
  qapi: qapi for audio backends
  audio: use qapi AudioFormat instead of audfmt_e
  audio: -audiodev command line option: documentation
  audio: -audiodev command line option basic implementation
  alsaaudio: port to -audiodev config
  coreaudio: port to -audiodev config
  dsoundaudio: port to -audiodev config
  noaudio: port to -audiodev config
  ossaudio: port to -audiodev config
  paaudio: port to -audiodev config
  sdlaudio: port to -audiodev config
  spiceaudio: port to -audiodev config
  wavaudio: port to -audiodev config
  audio: -audiodev command line option: cleanup

 audio/audio.h             |  30 +-
 audio/audio_int.h         |  37 +-
 audio/audio_template.h    |  42 +-
 audio/dsound_template.h   |   6 +-
 audio/alsaaudio.c         | 368 ++++++----------
 audio/audio.c             | 859 +++++++++++++-------------------------
 audio/audio_legacy.c      | 544 ++++++++++++++++++++++++
 audio/audio_win_int.c     |  18 +-
 audio/coreaudio.c         |  51 +--
 audio/dsoundaudio.c       |  61 +--
 audio/noaudio.c           |   3 +-
 audio/ossaudio.c          | 191 +++------
 audio/paaudio.c           | 111 ++---
 audio/sdlaudio.c          |  50 +--
 audio/spiceaudio.c        |  11 +-
 audio/wavaudio.c          |  75 +---
 audio/wavcapture.c        |   2 +-
 hw/arm/omap2.c            |   2 +-
 hw/audio/ac97.c           |   2 +-
 hw/audio/adlib.c          |   2 +-
 hw/audio/cs4231a.c        |   6 +-
 hw/audio/es1370.c         |   4 +-
 hw/audio/gus.c            |   2 +-
 hw/audio/hda-codec.c      |  18 +-
 hw/audio/lm4549.c         |   6 +-
 hw/audio/milkymist-ac97.c |   2 +-
 hw/audio/pcspk.c          |   2 +-
 hw/audio/sb16.c           |  14 +-
 hw/audio/wm8750.c         |   6 +-
 hw/display/xlnx_dp.c      |   2 +-
 hw/input/tsc210x.c        |   2 +-
 hw/usb/dev-audio.c        |   2 +-
 ui/vnc.c                  |  26 +-
 vl.c                      |   7 +-
 audio/Makefile.objs       |   2 +-
 qapi/Makefile.objs        |   6 +-
 qapi/audio.json           | 304 ++++++++++++++
 qapi/qapi-schema.json     |   1 +
 qemu-deprecated.texi      |   7 +
 qemu-options.hx           | 236 ++++++++++-
 40 files changed, 1834 insertions(+), 1286 deletions(-)
 create mode 100644 audio/audio_legacy.c
 create mode 100644 qapi/audio.json

--=20
2.18.1

