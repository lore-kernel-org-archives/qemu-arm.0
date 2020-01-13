Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4124733lff;
        Mon, 13 Jan 2020 05:27:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqyn4tfBAksUW6h34vefzno4aIBOZC9f0rEKE6+wJdiK7ljurD8HDDakczfXX9Y/kkGePqvH
X-Received: by 2002:a17:906:494d:: with SMTP id f13mr1993337ejt.95.1578922034055;
        Mon, 13 Jan 2020 05:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578922034; cv=none;
        d=google.com; s=arc-20160816;
        b=x8evQalYjFP1WToHxfGoc/JBO/MkOdGC8+szg4EoLvtKC7iNzGwuIM7mYBzudJTEES
         87wxKcoDm4EjT+cX8ueVhpLcKNdm5WaR2ew6PnG0e9pkv71TuLlnhggurNEsTg/FzE4n
         BnmPlvU3ugN53npgsmbJIaNHiaz/P4Yn6v5+8AYKMsVRY7cRki47W+f42qgAJ/6qr2M8
         A97Ol2TsHk72f8vZlH7kTiuhVbSufNh2JUXS2r3gpYeZXQTx0fYG4dUjqa9m8Y19CgHB
         b/+2kVn2/XR5Mj3+fuC8o/TUpbQmGXEfLUKPLZiSbSJ7X11GmhHKCcXE8Q5/WnMz78u5
         3Yyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=r/+G+4sctSzEM3QpekeTrS4Ek9B05Ijfx0vxZfjVpW4=;
        b=m8iP18f4/EEEV3kh1SfooXUWH6XquZUZR+zYU0zum83bJjbHRbu/BPiVCbXAfbkUQW
         6za7PBV5VKwFd2lXtEcLg0NHDDcj5Ow47jlqYo+JdW/m6cBrdm+zqtQ4jPzCyUTANyw5
         /PMiuNeEyQsvQYlOQchLW2vwuY6CP33bZF6l0EGy6PLX0Ymebug4YyxpqYUKMKGAwNiC
         tSTUQiRycS4qa3CFwRpJr1E3Y01NxetsbgqjzC95ZszG8xbgzdrUPnh/rFWgtt7wLPwn
         V+dYupW59q+CapkAL636jCHZon3QoDQuGKTVPQdAurAcxtc755+5t3lQEoHz2nik6RR+
         P6rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZIPfbE3n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s26si5525959edr.517.2020.01.13.05.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 05:27:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZIPfbE3n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iqzkP-0007jT-0l
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 08:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46782)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iqzkB-0007gm-JX
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 08:27:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iqzkA-000547-1h
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 08:26:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27807
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iqzk9-00051F-EQ
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 08:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578922014;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/+G+4sctSzEM3QpekeTrS4Ek9B05Ijfx0vxZfjVpW4=;
 b=ZIPfbE3n+LoSD7KXls0YoXG8csr+dVu+wrO/N6R3QqSCApNmvPcp35/2X3RQw7YwEQOHOR
 2sffcFWSRZNUMS5J94/+Q+NS5E1yFkWUnmBFW27zs/9ypLoGTphb+KjlTI74+CgCcFYJkv
 wbnV5LEzX4nwTIqYJWdfeirfrBL6VcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-qOSdPgHSMLWTs3RnSf8tWA-1; Mon, 13 Jan 2020 08:26:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D64A10054E3;
 Mon, 13 Jan 2020 13:26:49 +0000 (UTC)
Received: from redhat.com (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0565B7E590;
 Mon, 13 Jan 2020 13:26:34 +0000 (UTC)
Date: Mon, 13 Jan 2020 13:26:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/28] Migration pull patches
Message-ID: <20200113132632.GD4033206@redhat.com>
References: <20200110173215.3865-1-quintela@redhat.com>
 <CAFEAcA97ZqynDV6b6YUL_7iF=zsmB2Mwogi0k4ViAUAFTwsTnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97ZqynDV6b6YUL_7iF=zsmB2Mwogi0k4ViAUAFTwsTnA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: qOSdPgHSMLWTs3RnSf8tWA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 648sSPIyfbND

On Mon, Jan 13, 2020 at 01:05:22PM +0000, Peter Maydell wrote:
> On Fri, 10 Jan 2020 at 17:32, Juan Quintela <quintela@redhat.com> wrote:
> >
> > The following changes since commit f38a71b01f839c7b65ea73ddd507903cb948=
9ed6:
> >
> >   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-s=
emihosting-090120-2' into staging (2020-01-10 13:19:34 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/juanquintela/qemu.git tags/migration-pull-pull-req=
uest
> >
> > for you to fetch changes up to cc708d2411d3ed2ab4a428c996b778c7c7a47a04=
:
> >
> >   apic: Use 32bit APIC ID for migration instance ID (2020-01-10 18:19:1=
8 +0100)
> >

[snip]

> I also saw this on aarch32 host (more precisely, on the
> aarch32-environment-in-aarch64-chroot setup I use for aarch32 build
> and test):
>=20
> malloc_consolidate(): invalid chunk size
> Broken pipe
> qemu-system-i386: check_section_footer: Read section footer failed: -5
> qemu-system-i386: load of migration failed: Invalid argument
> /home/peter.maydell/qemu/tests/libqtest.c:140: kill_qemu() tried to
> terminate QEMU process but encountered exit status 1 (expected 0)
> Aborted
> ERROR - too few tests run (expected 14, got 13)
>=20
> The memory corruption is reproducible running just the
> /x86_64/migration/multifd/tcp subtest:
>=20
> (armhf)pmaydell@mustang-maydell:~/qemu/build/all-a32$
> QTEST_QEMU_BINARY=3Dx86_64-softmmu/qemu-system-x86_64
> tests/migration-test -p /x86_64/migration/multifd/tcp
> /x86_64/migration/multifd/tcp: qemu-system-x86_64: -accel kvm: invalid
> accelerator kvm
> qemu-system-x86_64: falling back to tcg
> qemu-system-x86_64: -accel kvm: invalid accelerator kvm
> qemu-system-x86_64: falling back to tcg
> qemu-system-x86_64: multifd_send_sync_main: multifd_send_pages fail
> qemu-system-x86_64: failed to save SaveStateEntry with id(name): 3(ram)
> double free or corruption (!prev)
> Broken pipe
> qemu-system-x86_64: Unknown combination of migration flags: 0
> qemu-system-x86_64: error while loading state section id 3(ram)
> qemu-system-x86_64: load of migration failed: Invalid argument
> /home/peter.maydell/qemu/tests/libqtest.c:140: kill_qemu() tried to
> terminate QEMU process but encountered exit status 1 (expected 0)
> Aborted
>=20
> Here's what a valgrind run in that aarch32 setup produces:
>=20
> (armhf)pmaydell@mustang-maydell:~/qemu/build/all-a32$
> QTEST_QEMU_BINARY=3D'valgrind --smc-check=3Dall-non-file
> x86_64-softmmu/qemu-system-x86_64' tests/migration-test -p
> /x86_64/migration/multifd/tcp
> /x86_64/migration/multifd/tcp: =3D=3D12102=3D=3D Memcheck, a memory error=
 detector
> =3D=3D12102=3D=3D Copyright (C) 2002-2017, and GNU GPL'd, by Julian Sewar=
d et al.
> =3D=3D12102=3D=3D Using Valgrind-3.13.0 and LibVEX; rerun with -h for cop=
yright info
> =3D=3D12102=3D=3D Command: x86_64-softmmu/qemu-system-x86_64 -qtest
> unix:/tmp/qtest-12100.sock -qtest-log /dev/null -chardev
> socket,path=3D/tmp/qtest-12100.qmp,id=3Dchar0 -mon
> chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel tcg -name
> source,debug-threads=3Don -m 150M -serial
> file:/tmp/migration-test-UlotFX/src_serial -drive
> file=3D/tmp/migration-test-UlotFX/bootsect,format=3Draw -accel qtest
> =3D=3D12102=3D=3D
> qemu-system-x86_64: -accel kvm: invalid accelerator kvm
> qemu-system-x86_64: falling back to tcg
> =3D=3D12108=3D=3D Memcheck, a memory error detector
> =3D=3D12108=3D=3D Copyright (C) 2002-2017, and GNU GPL'd, by Julian Sewar=
d et al.
> =3D=3D12108=3D=3D Using Valgrind-3.13.0 and LibVEX; rerun with -h for cop=
yright info
> =3D=3D12108=3D=3D Command: x86_64-softmmu/qemu-system-x86_64 -qtest
> unix:/tmp/qtest-12100.sock -qtest-log /dev/null -chardev
> socket,path=3D/tmp/qtest-12100.qmp,id=3Dchar0 -mon
> chardev=3Dchar0,mode=3Dcontrol -display none -accel kvm -accel tcg -name
> target,debug-threads=3Don -m 150M -serial
> file:/tmp/migration-test-UlotFX/dest_serial -incoming defer -drive
> file=3D/tmp/migration-test-UlotFX/bootsect,format=3Draw -accel qtest
> =3D=3D12108=3D=3D
> qemu-system-x86_64: -accel kvm: invalid accelerator kvm
> qemu-system-x86_64: falling back to tcg
> =3D=3D12102=3D=3D Thread 22 multifdsend_15:
> =3D=3D12102=3D=3D Syscall param sendmsg(msg.msg_iov[0]) points to uniniti=
alised byte(s)
> =3D=3D12102=3D=3D    at 0x53C7F06: __libc_do_syscall (libc-do-syscall.S:4=
7)
> =3D=3D12102=3D=3D    by 0x53C6FCB: sendmsg (sendmsg.c:28)
> =3D=3D12102=3D=3D    by 0x51B9A9: qio_channel_socket_writev (channel-sock=
et.c:561)
> =3D=3D12102=3D=3D    by 0x519FCD: qio_channel_writev (channel.c:207)
> =3D=3D12102=3D=3D    by 0x519FCD: qio_channel_writev_all (channel.c:171)
> =3D=3D12102=3D=3D    by 0x51A047: qio_channel_write_all (channel.c:257)
> =3D=3D12102=3D=3D    by 0x25CB17: multifd_send_initial_packet (ram.c:714)
> =3D=3D12102=3D=3D    by 0x25CB17: multifd_send_thread (ram.c:1136)
> =3D=3D12102=3D=3D    by 0x557551: qemu_thread_start (qemu-thread-posix.c:=
519)
> =3D=3D12102=3D=3D    by 0x53BE613: start_thread (pthread_create.c:463)
> =3D=3D12102=3D=3D    by 0x54767FB: ??? (clone.S:73)
> =3D=3D12102=3D=3D  Address 0x262103fd is on thread 22's stack
> =3D=3D12102=3D=3D  in frame #5, created by multifd_send_thread (ram.c:112=
7)

Missing initialization of     MultiFDInit_t msg; to all zeros

> =3D=3D12102=3D=3D
> =3D=3D12102=3D=3D Thread 6 multifdsend_1:
> =3D=3D12102=3D=3D Invalid write of size 4
> =3D=3D12102=3D=3D    at 0x25CC08: multifd_send_fill_packet (ram.c:806)
> =3D=3D12102=3D=3D    by 0x25CC08: multifd_send_thread (ram.c:1157)
> =3D=3D12102=3D=3D    by 0x557551: qemu_thread_start (qemu-thread-posix.c:=
519)
> =3D=3D12102=3D=3D    by 0x53BE613: start_thread (pthread_create.c:463)
> =3D=3D12102=3D=3D    by 0x54767FB: ??? (clone.S:73)
> =3D=3D12102=3D=3D  Address 0x1d89c470 is 0 bytes after a block of size 83=
2 alloc'd
> =3D=3D12102=3D=3D    at 0x4841BC4: calloc (vg_replace_malloc.c:711)
> =3D=3D12102=3D=3D    by 0x49EE269: g_malloc0 (in
> /usr/lib/arm-linux-gnueabihf/libglib-2.0.so.0.5600.4)

This is the same issue that was reported last time this mulitfd unit
test was proposed for merge. Back then I pointed out the likely cause.
We were allocating  ram_addr_t sized quantity for an array which is
uint64_t, and ram_addr_t is probably 32-bit on this particular build.

  https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03428.html

That suggested fix doesn't seem to have been included


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|

