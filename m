Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp172797wrs;
        Tue, 12 Mar 2019 00:36:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwfly8NAD3qp8xiUlVzzZ6hWk71bZeLDhhsh41tG23kIHLc/hq8XErIPbBlJoFBCNfb0Ru
X-Received: by 2002:a25:bb42:: with SMTP id b2mr30990495ybk.253.1552376180262;
        Tue, 12 Mar 2019 00:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552376180; cv=none;
        d=google.com; s=arc-20160816;
        b=GsCkHSWDhfcdU8aLh3lmxcxbKODQaCteOqa7bY1AAMUAT+EyAanEY2NCcAHkVngBTt
         3ZPxbec3cYBjcMPOUqaa4ANxDPXpQvB/MFmHALHZumJiG3bd1e1kibvfKpyXghP3Xm4a
         fQBGC7ceNXURWQeJvTAn1Hg9iGhZis/rHc8WVSygXyuvlgDTjNE2yqkfxh6mtANy/TjY
         UJtiYnC4U7EWPfcYabn5yl+Glz4RqIxqtO/6aAHu9wWcZPiY9bxNKAUTLQGDC75jTPuX
         83TxMitij8inRlm9C/YTvYrqK7P8jd0ykjaFyJ1OStpDm0N+ZQrFqMiEHUV5AiSqbYcm
         mVIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=HNNhZiEC2TYEu9lTN1iJQ1GbypuxkIvO8ynpRPh2Mag=;
        b=v86O4qhJYtWkLhVcttUQrBUhBwmBGZMiF/ixhBpx/CxemZPvqQgnZT6rIHkbCF238T
         1+PqJsYApdIn3+uiHDp9Kj8BvBeV+2TMcJShHH8bwvd6WYDtgVN28kpuji9hCodbR542
         aX6u8O1/iB5787zTOZEZdXsl8p+a/EuMNTMpuhawnPnIZ3tPGNcjf5oPoGtz++wiu+cR
         wYmXmaFcuZCIU4u08EYbIfMZfvKyGt+5S+bH+VHKDb03wgj109FyEFT7eMwL0gX1bWPo
         c++aKlXXIN+/7st/G6mQjhVryXwBIz0V8+CO7zoH/Sr8TxTxffsOprYBXImfANojTAWe
         +s0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t206si4270009ywc.8.2019.03.12.00.36.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 00:36:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3bxT-0006Aj-HN
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 03:36:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3btY-0002fy-68
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:32:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1h3bgK-0000sO-8z
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 03:18:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1h3bgJ-0000s3-VE; Tue, 12 Mar 2019 03:18:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED387308FB8A;
	Tue, 12 Mar 2019 07:12:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-175.ams2.redhat.com
	[10.36.117.175])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 848CC648CD;
	Tue, 12 Mar 2019 07:12:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6C19417536; Tue, 12 Mar 2019 08:12:50 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Mar 2019 08:12:39 +0100
Message-Id: <20190312071250.12168-4-kraxel@redhat.com>
In-Reply-To: <20190312071250.12168-1-kraxel@redhat.com>
References: <20190312071250.12168-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 12 Mar 2019 07:12:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 03/14] audio: -audiodev command line option:
 documentation
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
X-TUID: /ECE+MtxDE63

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

This patch adds documentation of an -audiodev command line option, that
deprecates the old QEMU_* environment variables for audio backend
configuration.  It's syntax is similar to existing options (-netdev,
-device, etc):

  -audiodev driver_name,property=3Dvalue,...

Although now it's possible to specify multiple -audiodev options on
command line, multiple audio backends are not supported yet.

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Message-id: ca5e761e58dcfaf591cf46080af3548551b42bb2.1552083282.git.DirtY=
.iCE.hu@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-deprecated.texi |   7 ++
 qemu-options.hx      | 236 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 240 insertions(+), 3 deletions(-)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 45c57952da56..5c07ad4acb2e 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -60,6 +60,13 @@ Support for invalid topologies will be removed, the us=
er must ensure
 topologies described with -smp include all possible cpus, i.e.
   @math{@var{sockets} * @var{cores} * @var{threads} =3D @var{maxcpus}}.
=20
+@subsection QEMU_AUDIO_ environment variables and -audio-help (since 4.0=
)
+
+The ``-audiodev'' argument is now the preferred way to specify audio
+backend settings instead of environment variables.  To ease migration to
+the new format, the ``-audiodev-help'' option can be used to convert
+the current values of the environment variables to ``-audiodev'' options=
.
+
 @section QEMU Machine Protocol (QMP) commands
=20
 @subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)
diff --git a/qemu-options.hx b/qemu-options.hx
index 1cf9aac1fe35..52ea13e6a2b0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -416,14 +416,244 @@ The default is @code{en-us}.
 ETEXI
=20
=20
+HXCOMM Deprecated by -audiodev
 DEF("audio-help", 0, QEMU_OPTION_audio_help,
-    "-audio-help     print list of audio drivers and their options\n",
+    "-audio-help     show -audiodev equivalent of the currently specifie=
d audio settings\n",
     QEMU_ARCH_ALL)
 STEXI
 @item -audio-help
 @findex -audio-help
-Will show the audio subsystem help: list of drivers, tunable
-parameters.
+Will show the -audiodev equivalent of the currently specified
+(deprecated) environment variables.
+ETEXI
+
+DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
+    "-audiodev [driver=3D]driver,id=3Did[,prop[=3Dvalue][,...]]\n"
+    "                specifies the audio backend to use\n"
+    "                id=3D identifier of the backend\n"
+    "                timer-period=3D timer period in microseconds\n"
+    "                in|out.fixed-settings=3D use fixed settings for hos=
t audio\n"
+    "                in|out.frequency=3D frequency to use with fixed set=
tings\n"
+    "                in|out.channels=3D number of channels to use with f=
ixed settings\n"
+    "                in|out.format=3D sample format to use with fixed se=
ttings\n"
+    "                valid values: s8, s16, s32, u8, u16, u32\n"
+    "                in|out.voices=3D number of voices to use\n"
+    "                in|out.buffer-len=3D length of buffer in microsecon=
ds\n"
+    "-audiodev none,id=3Did,[,prop[=3Dvalue][,...]]\n"
+    "                dummy driver that discards all output\n"
+#ifdef CONFIG_AUDIO_ALSA
+    "-audiodev alsa,id=3Did[,prop[=3Dvalue][,...]]\n"
+    "                in|out.dev=3D name of the audio device to use\n"
+    "                in|out.period-len=3D length of period in microsecon=
ds\n"
+    "                in|out.try-poll=3D attempt to use poll mode\n"
+    "                threshold=3D threshold (in microseconds) when playb=
ack starts\n"
+#endif
+#ifdef CONFIG_AUDIO_COREAUDIO
+    "-audiodev coreaudio,id=3Did[,prop[=3Dvalue][,...]]\n"
+    "                in|out.buffer-count=3D number of buffers\n"
+#endif
+#ifdef CONFIG_AUDIO_DSOUND
+    "-audiodev dsound,id=3Did[,prop[=3Dvalue][,...]]\n"
+    "                latency=3D add extra latency to playback in microse=
conds\n"
+#endif
+#ifdef CONFIG_AUDIO_OSS
+    "-audiodev oss,id=3Did[,prop[=3Dvalue][,...]]\n"
+    "                in|out.dev=3D path of the audio device to use\n"
+    "                in|out.buffer-count=3D number of buffers\n"
+    "                in|out.try-poll=3D attempt to use poll mode\n"
+    "                try-mmap=3D try using memory mapped access\n"
+    "                exclusive=3D open device in exclusive mode\n"
+    "                dsp-policy=3D set timing policy (0..10), -1 to use =
fragment mode\n"
+#endif
+#ifdef CONFIG_AUDIO_PA
+    "-audiodev pa,id=3Did[,prop[=3Dvalue][,...]]\n"
+    "                server=3D PulseAudio server address\n"
+    "                in|out.name=3D source/sink device name\n"
+#endif
+#ifdef CONFIG_AUDIO_SDL
+    "-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]\n"
+#endif
+#ifdef CONFIG_SPICE
+    "-audiodev spice,id=3Did[,prop[=3Dvalue][,...]]\n"
+#endif
+    "-audiodev wav,id=3Did[,prop[=3Dvalue][,...]]\n"
+    "                path=3D path of wav file to record\n",
+    QEMU_ARCH_ALL)
+STEXI
+@item -audiodev [driver=3D]@var{driver},id=3D@var{id}[,@var{prop}[=3D@va=
r{value}][,...]]
+@findex -audiodev
+Adds a new audio backend @var{driver} identified by @var{id}.  There are
+global and driver specific properties.  Some values can be set
+differently for input and output, they're marked with @code{in|out.}.
+You can set the input's property with @code{in.@var{prop}} and the
+output's property with @code{out.@var{prop}}. For example:
+@example
+-audiodev alsa,id=3Dexample,in.frequency=3D44110,out.frequency=3D8000
+-audiodev alsa,id=3Dexample,out.channels=3D1 # leaves in.channels unspec=
ified
+@end example
+
+Valid global options are:
+
+@table @option
+@item id=3D@var{identifier}
+Identifies the audio backend.
+
+@item timer-period=3D@var{period}
+Sets the timer @var{period} used by the audio subsystem in microseconds.
+Default is 10000 (10 ms).
+
+@item in|out.fixed-settings=3Don|off
+Use fixed settings for host audio.  When off, it will change based on
+how the guest opens the sound card.  In this case you must not specify
+@var{frequency}, @var{channels} or @var{format}.  Default is on.
+
+@item in|out.frequency=3D@var{frequency}
+Specify the @var{frequency} to use when using @var{fixed-settings}.
+Default is 44100Hz.
+
+@item in|out.channels=3D@var{channels}
+Specify the number of @var{channels} to use when using
+@var{fixed-settings}. Default is 2 (stereo).
+
+@item in|out.format=3D@var{format}
+Specify the sample @var{format} to use when using @var{fixed-settings}.
+Valid values are: @code{s8}, @code{s16}, @code{s32}, @code{u8},
+@code{u16}, @code{u32}. Default is @code{s16}.
+
+@item in|out.voices=3D@var{voices}
+Specify the number of @var{voices} to use.  Default is 1.
+
+@item in|out.buffer=3D@var{usecs}
+Sets the size of the buffer in microseconds.
+
+@end table
+
+@item -audiodev none,id=3D@var{id}[,@var{prop}[=3D@var{value}][,...]]
+Creates a dummy backend that discards all outputs.  This backend has no
+backend specific properties.
+
+@item -audiodev alsa,id=3D@var{id}[,@var{prop}[=3D@var{value}][,...]]
+Creates backend using the ALSA.  This backend is only available on
+Linux.
+
+ALSA specific options are:
+
+@table @option
+
+@item in|out.dev=3D@var{device}
+Specify the ALSA @var{device} to use for input and/or output.  Default
+is @code{default}.
+
+@item in|out.period-len=3D@var{usecs}
+Sets the period length in microseconds.
+
+@item in|out.try-poll=3Don|off
+Attempt to use poll mode with the device.  Default is on.
+
+@item threshold=3D@var{threshold}
+Threshold (in microseconds) when playback starts.  Default is 0.
+
+@end table
+
+@item -audiodev coreaudio,id=3D@var{id}[,@var{prop}[=3D@var{value}][,...=
]]
+Creates a backend using Apple's Core Audio.  This backend is only
+available on Mac OS and only supports playback.
+
+Core Audio specific options are:
+
+@table @option
+
+@item in|out.buffer-count=3D@var{count}
+Sets the @var{count} of the buffers.
+
+@end table
+
+@item -audiodev dsound,id=3D@var{id}[,@var{prop}[=3D@var{value}][,...]]
+Creates a backend using Microsoft's DirectSound.  This backend is only
+available on Windows and only supports playback.
+
+DirectSound specific options are:
+
+@table @option
+
+@item latency=3D@var{usecs}
+Add extra @var{usecs} microseconds latency to playback.  Default is
+10000 (10 ms).
+
+@end table
+
+@item -audiodev oss,id=3D@var{id}[,@var{prop}[=3D@var{value}][,...]]
+Creates a backend using OSS.  This backend is available on most
+Unix-like systems.
+
+OSS specific options are:
+
+@table @option
+
+@item in|out.dev=3D@var{device}
+Specify the file name of the OSS @var{device} to use.  Default is
+@code{/dev/dsp}.
+
+@item in|out.buffer-count=3D@var{count}
+Sets the @var{count} of the buffers.
+
+@item in|out.try-poll=3Don|of
+Attempt to use poll mode with the device.  Default is on.
+
+@item try-mmap=3Don|off
+Try using memory mapped device access.  Default is off.
+
+@item exclusive=3Don|off
+Open the device in exclusive mode (vmix won't work in this case).
+Default is off.
+
+@item dsp-policy=3D@var{policy}
+Sets the timing policy (between 0 and 10, where smaller number means
+smaller latency but higher CPU usage).  Use -1 to use buffer sizes
+specified by @code{buffer} and @code{buffer-count}.  This option is
+ignored if you do not have OSS 4. Default is 5.
+
+@end table
+
+@item -audiodev pa,id=3D@var{id}[,@var{prop}[=3D@var{value}][,...]]
+Creates a backend using PulseAudio.  This backend is available on most
+systems.
+
+PulseAudio specific options are:
+
+@table @option
+
+@item server=3D@var{server}
+Sets the PulseAudio @var{server} to connect to.
+
+@item in|out.name=3D@var{sink}
+Use the specified source/sink for recording/playback.
+
+@end table
+
+@item -audiodev sdl,id=3D@var{id}[,@var{prop}[=3D@var{value}][,...]]
+Creates a backend using SDL.  This backend is available on most systems,
+but you should use your platform's native backend if possible.  This
+backend has no backend specific properties.
+
+@item -audiodev spice,id=3D@var{id}[,@var{prop}[=3D@var{value}][,...]]
+Creates a backend that sends audio through SPICE.  This backend requires
+@code{-spice} and automatically selected in that case, so usually you
+can ignore this option.  This backend has no backend specific
+properties.
+
+@item -audiodev wav,id=3D@var{id}[,@var{prop}[=3D@var{value}][,...]]
+Creates a backend that writes audio to a WAV file.
+
+Backend specific options are:
+
+@table @option
+
+@item path=3D@var{path}
+Write recorded audio into the specified file.  Default is
+@code{qemu.wav}.
+
+@end table
 ETEXI
=20
 DEF("soundhw", HAS_ARG, QEMU_OPTION_soundhw,
--=20
2.18.1

