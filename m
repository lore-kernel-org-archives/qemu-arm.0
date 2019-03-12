Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp172186wrs;
        Tue, 12 Mar 2019 00:35:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyWEuGe3Z3oodBmZFRkju9anRcYu3ll5rzNiM/UCWnAy9kypVdmmoVRXtYEE8CjegKr81K+
X-Received: by 2002:a25:2c58:: with SMTP id s85mr31754655ybs.4.1552376127851;
        Tue, 12 Mar 2019 00:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552376127; cv=none;
        d=google.com; s=arc-20160816;
        b=gh2YldIdDMmiwgdbawViDz+rKi+6zW0ILHwfwElNpqLgiuomUk4PSn35P8yXKkJJxT
         Y0puc+44/3g3aJsCW0EgJ7q/PG5/nQb6NSjyvPAbamqBeKWSbjZE87rrug2ecVOWHNnG
         L1pwphI5ix+9UlZ2vcOLtljNtpRmdmbfQuFH2NKCKzqFg5mmDayW221jHMhkOsP6yBni
         mwGcHzhOISWFc7yqrBiHwwCbHHijwq89glun6H9uIg3Cqwr2NUp0TxBsYAcqDxhNhnc+
         B+JYBxmULUf9SHmSwc8EwJXKMaF2trFr0JmsT2xftsERaTW44FvYbr1MfrpeIvJep32/
         egIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=9toSRJNYKvIYQDNnqIlEMYUHcuwEVQrYw9SuFqBsLJ8=;
        b=c8Z6daouIJrRk1RTFNkoEMp5Q6hzuxrCc6khDOU46Ei1SSpHqwU8KvImSz2vBesAtf
         472Kc/Y/uWV+bY2DsDpcwy0Oivt0v+RUY49X4nOTdXylHbz8LbiL+oT6szqOMx9LaG5B
         5t111y3B19/e4AG6JlFCeBTBd8M0p6eGL5s2C0cFLekrcTnlOg4Kv5C97BeIardta/8e
         HGbXNMmmVVBShsOKYEgnXbi/J8hYN79QFTY+N9oasub290UhUCzaiTHJ3ZCM4Rem37F7
         kipM9mfdWg12znhjrwGgflJ9jk1PymlJwPKXXqlF18faAGcgPCu+tlQLCeYnTSJYrexL
         k+Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v63si4548593ybv.324.2019.03.12.00.35.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:35:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46623 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3bwd-0005LM-3i
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:35:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3btK-0002Ug-Re
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:32:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bh4-00018T-VB
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:19:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48984)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1h3bh4-000182-LB; Tue, 12 Mar 2019 03:19:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33476307D874;
	Tue, 12 Mar 2019 07:13:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F11860C99;
	Tue, 12 Mar 2019 07:12:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 37CA117534; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:37 +0100
Message-Id: <20190312071250.12168-2-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 12 Mar 2019 07:13:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 01/14] qapi: qapi for audio backends
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
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?q?Zolt=C3=A1n?= <DirtY.iCE.hu@gmail.com>, Kővágó@redhat.com, libvir-list@redhat.com, Andrzej Zaborowski <balrogg@gmail.com>, Alistair Francis <alistair@alistair23.me>, Markus Armbruster <armbru@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>, Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sZBT81rpZukS

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

This patch adds structures into qapi to replace the existing
configuration structures used by audio backends currently. This qapi
will be the base of the -audiodev command line parameter (that replaces
the old environment variables based config).

This is not a 1:1 translation of the old options, I've tried to make
them much more consistent (e.g. almost every backend had an option to
specify buffer size, but the name was different for every backend, and
some backends required usecs, while some other required frames, samples
or bytes). Also tried to reduce the number of abbreviations used by the
config keys.

Some of the more important changes:
* use `in` and `out` instead of `ADC` and `DAC`, as the former is more
  user friendly imho
* moved buffer settings into the global setting area (so it's the same
  for all backends that support it. Backends that can't change buffer
  size will simply ignore them). Also using usecs, as it's probably more
  user friendly than samples or bytes.
* try-poll is now an alsa backend specific option (as all other backends
  currently ignore it)

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-id: 5461b514dbf3e0bc31b0abb6498a9b3a008c271e.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qapi/Makefile.objs    |   6 +-
 qapi/audio.json       | 304 ++++++++++++++++++++++++++++++++++++++++++
 qapi/qapi-schema.json |   1 +
 3 files changed, 308 insertions(+), 3 deletions(-)
 create mode 100644 qapi/audio.json

diff --git a/qapi/Makefile.objs b/qapi/Makefile.objs
index 77acca020991..729e5185c5e8 100644
--- a/qapi/Makefile.objs
+++ b/qapi/Makefile.objs
@@ -5,9 +5,9 @@ util-obj-y +=3D opts-visitor.o qapi-clone-visitor.o
 util-obj-y +=3D qmp-event.o
 util-obj-y +=3D qapi-util.o
=20
-QAPI_COMMON_MODULES =3D authz block-core block char common crypto intros=
pect
-QAPI_COMMON_MODULES +=3D job migration misc net rdma rocker run-state
-QAPI_COMMON_MODULES +=3D sockets tpm trace transaction ui
+QAPI_COMMON_MODULES =3D audio authz block-core block char common crypto
+QAPI_COMMON_MODULES +=3D introspect job migration misc net rdma rocker
+QAPI_COMMON_MODULES +=3D run-state sockets tpm trace transaction ui
 QAPI_TARGET_MODULES =3D target
 QAPI_MODULES =3D $(QAPI_COMMON_MODULES) $(QAPI_TARGET_MODULES)
=20
diff --git a/qapi/audio.json b/qapi/audio.json
new file mode 100644
index 000000000000..97aee3728835
--- /dev/null
+++ b/qapi/audio.json
@@ -0,0 +1,304 @@
+# -*- mode: python -*-
+#
+# Copyright (C) 2015-2019 Zolt=C3=A1n K=C5=91v=C3=A1g=C3=B3 <DirtY.iCE.h=
u@gmail.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or lat=
er.
+# See the COPYING file in the top-level directory.
+
+##
+# @AudiodevPerDirectionOptions:
+#
+# General audio backend options that are used for both playback and
+# recording.
+#
+# @fixed-settings: use fixed settings for host input/output. When off,
+#                  frequency, channels and format must not be
+#                  specified (default true)
+#
+# @frequency: frequency to use when using fixed settings
+#             (default 44100)
+#
+# @channels: number of channels when using fixed settings (default 2)
+#
+# @voices: number of voices to use (default 1)
+#
+# @format: sample format to use when using fixed settings
+#          (default s16)
+#
+# @buffer-length: the buffer length in microseconds
+#
+# Since: 4.0
+##
+{ 'struct': 'AudiodevPerDirectionOptions',
+  'data': {
+    '*fixed-settings': 'bool',
+    '*frequency':      'uint32',
+    '*channels':       'uint32',
+    '*voices':         'uint32',
+    '*format':         'AudioFormat',
+    '*buffer-length':  'uint32' } }
+
+##
+# @AudiodevGenericOptions:
+#
+# Generic driver-specific options.
+#
+# @in: options of the capture stream
+#
+# @out: options of the playback stream
+#
+# Since: 4.0
+##
+{ 'struct': 'AudiodevGenericOptions',
+  'data': {
+    '*in':  'AudiodevPerDirectionOptions',
+    '*out': 'AudiodevPerDirectionOptions' } }
+
+##
+# @AudiodevAlsaPerDirectionOptions:
+#
+# Options of the ALSA backend that are used for both playback and
+# recording.
+#
+# @dev: the name of the ALSA device to use (default 'default')
+#
+# @period-length: the period length in microseconds
+#
+# @try-poll: attempt to use poll mode, falling back to non-polling
+#            access on failure (default true)
+#
+# Since: 4.0
+##
+{ 'struct': 'AudiodevAlsaPerDirectionOptions',
+  'base': 'AudiodevPerDirectionOptions',
+  'data': {
+    '*dev':           'str',
+    '*period-length': 'uint32',
+    '*try-poll':      'bool' } }
+
+##
+# @AudiodevAlsaOptions:
+#
+# Options of the ALSA audio backend.
+#
+# @in: options of the capture stream
+#
+# @out: options of the playback stream
+#
+# @threshold: set the threshold (in microseconds) when playback starts
+#
+# Since: 4.0
+##
+{ 'struct': 'AudiodevAlsaOptions',
+  'data': {
+    '*in':        'AudiodevAlsaPerDirectionOptions',
+    '*out':       'AudiodevAlsaPerDirectionOptions',
+    '*threshold': 'uint32' } }
+
+##
+# @AudiodevCoreaudioPerDirectionOptions:
+#
+# Options of the Core Audio backend that are used for both playback and
+# recording.
+#
+# @buffer-count: number of buffers
+#
+# Since: 4.0
+##
+{ 'struct': 'AudiodevCoreaudioPerDirectionOptions',
+  'base': 'AudiodevPerDirectionOptions',
+  'data': {
+    '*buffer-count': 'uint32' } }
+
+##
+# @AudiodevCoreaudioOptions:
+#
+# Options of the coreaudio audio backend.
+#
+# @in: options of the capture stream
+#
+# @out: options of the playback stream
+#
+# Since: 4.0
+##
+{ 'struct': 'AudiodevCoreaudioOptions',
+  'data': {
+    '*in':  'AudiodevCoreaudioPerDirectionOptions',
+    '*out': 'AudiodevCoreaudioPerDirectionOptions' } }
+
+##
+# @AudiodevDsoundOptions:
+#
+# Options of the DirectSound audio backend.
+#
+# @in: options of the capture stream
+#
+# @out: options of the playback stream
+#
+# @latency: add extra latency to playback in microseconds
+#           (default 10000)
+#
+# Since: 4.0
+##
+{ 'struct': 'AudiodevDsoundOptions',
+  'data': {
+    '*in':      'AudiodevPerDirectionOptions',
+    '*out':     'AudiodevPerDirectionOptions',
+    '*latency': 'uint32' } }
+
+##
+# @AudiodevOssPerDirectionOptions:
+#
+# Options of the OSS backend that are used for both playback and
+# recording.
+#
+# @dev: file name of the OSS device (default '/dev/dsp')
+#
+# @buffer-count: number of buffers
+#
+# @try-poll: attempt to use poll mode, falling back to non-polling
+#            access on failure (default true)
+#
+# Since: 4.0
+##
+{ 'struct': 'AudiodevOssPerDirectionOptions',
+  'base': 'AudiodevPerDirectionOptions',
+  'data': {
+    '*dev':          'str',
+    '*buffer-count': 'uint32',
+    '*try-poll':     'bool' } }
+
+##
+# @AudiodevOssOptions:
+#
+# Options of the OSS audio backend.
+#
+# @in: options of the capture stream
+#
+# @out: options of the playback stream
+#
+# @try-mmap: try using memory-mapped access, falling back to
+#            non-memory-mapped access on failure (default true)
+#
+# @exclusive: open device in exclusive mode (vmix won't work)
+#             (default false)
+#
+# @dsp-policy: set the timing policy of the device (between 0 and 10,
+#              where smaller number means smaller latency but higher
+#              CPU usage) or -1 to use fragment mode (option ignored
+#              on some platforms) (default 5)
+#
+# Since: 4.0
+##
+{ 'struct': 'AudiodevOssOptions',
+  'data': {
+    '*in':         'AudiodevOssPerDirectionOptions',
+    '*out':        'AudiodevOssPerDirectionOptions',
+    '*try-mmap':   'bool',
+    '*exclusive':  'bool',
+    '*dsp-policy': 'uint32' } }
+
+##
+# @AudiodevPaPerDirectionOptions:
+#
+# Options of the Pulseaudio backend that are used for both playback and
+# recording.
+#
+# @name: name of the sink/source to use
+#
+# Since: 4.0
+##
+{ 'struct': 'AudiodevPaPerDirectionOptions',
+  'base': 'AudiodevPerDirectionOptions',
+  'data': {
+    '*name': 'str' } }
+
+##
+# @AudiodevPaOptions:
+#
+# Options of the PulseAudio audio backend.
+#
+# @in: options of the capture stream
+#
+# @out: options of the playback stream
+#
+# @server: PulseAudio server address (default: let PulseAudio choose)
+#
+# Since: 4.0
+##
+{ 'struct': 'AudiodevPaOptions',
+  'data': {
+    '*in':     'AudiodevPaPerDirectionOptions',
+    '*out':    'AudiodevPaPerDirectionOptions',
+    '*server': 'str' } }
+
+##
+# @AudiodevWavOptions:
+#
+# Options of the wav audio backend.
+#
+# @in: options of the capture stream
+#
+# @out: options of the playback stream
+#
+# @path: name of the wav file to record (default 'qemu.wav')
+#
+# Since: 4.0
+##
+{ 'struct': 'AudiodevWavOptions',
+  'data': {
+    '*in':   'AudiodevPerDirectionOptions',
+    '*out':  'AudiodevPerDirectionOptions',
+    '*path': 'str' } }
+
+
+##
+# @AudioFormat:
+#
+# An enumeration of possible audio formats.
+#
+# Since: 4.0
+##
+{ 'enum': 'AudioFormat',
+  'data': [ 'u8', 's8', 'u16', 's16', 'u32', 's32' ] }
+
+##
+# @AudiodevDriver:
+#
+# An enumeration of possible audio backend drivers.
+#
+# Since: 4.0
+##
+{ 'enum': 'AudiodevDriver',
+  'data': [ 'none', 'alsa', 'coreaudio', 'dsound', 'oss', 'pa', 'sdl',
+            'spice', 'wav' ] }
+
+##
+# @Audiodev:
+#
+# Options of an audio backend.
+#
+# @id: identifier of the backend
+#
+# @driver: the backend driver to use
+#
+# @timer-period: timer period (in microseconds, 0: use lowest possible)
+#
+# Since: 4.0
+##
+{ 'union': 'Audiodev',
+  'base': {
+    'id':            'str',
+    'driver':        'AudiodevDriver',
+    '*timer-period': 'uint32' },
+  'discriminator': 'driver',
+  'data': {
+    'none':      'AudiodevGenericOptions',
+    'alsa':      'AudiodevAlsaOptions',
+    'coreaudio': 'AudiodevCoreaudioOptions',
+    'dsound':    'AudiodevDsoundOptions',
+    'oss':       'AudiodevOssOptions',
+    'pa':        'AudiodevPaOptions',
+    'sdl':       'AudiodevGenericOptions',
+    'spice':     'AudiodevGenericOptions',
+    'wav':       'AudiodevWavOptions' } }
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index a34899c626b2..4bd1223637be 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -99,3 +99,4 @@
 { 'include': 'introspect.json' }
 { 'include': 'misc.json' }
 { 'include': 'target.json' }
+{ 'include': 'audio.json' }
--=20
2.18.1

