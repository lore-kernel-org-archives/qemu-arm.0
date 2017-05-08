Received: by 10.25.0.198 with SMTP id 189csp1578840lfa;
        Mon, 8 May 2017 15:52:53 -0700 (PDT)
X-Received: by 10.55.209.3 with SMTP id s3mr13131967qki.256.1494283972942;
        Mon, 08 May 2017 15:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494283972; cv=none;
        d=google.com; s=arc-20160816;
        b=OYQP9RPa3CVR7MzDm/KYkk492X74qLmIdfR6JXjLtgUMIUC/NjpqgT3eKgJKhBrQu1
         Hh6Anro/aaJwxVoIvU6l/OXZVcSmU0FkWN9RNiX6b8VhM7cPccYMQXsfeRT9Lc8Elh07
         N2M575fkOQ/E5QmGiqYZOMLIIzJFfV1TLhwGTFNOTh2XHuZspMtI/1uoDKx5mUInqM9i
         yGbFGuQJPbvcus3wvOWrCRR9NiS4oBNQ16idcs4LEnjEHRVbiES7M7xiZEtpQKywUfFR
         NGv80jyP/EV6jPBM/AltQ7RpAtq/HGdtCFuz+88v/ozHk47ltbk4D/CybajJxIwX3mnl
         I05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:to
         :message-id:date:from:mime-version:dkim-signature
         :arc-authentication-results;
        bh=s4k03CcUSf6OBIug2MUrRpmZ+BdQ0Uf/EncZJnbd5WU=;
        b=rJGdU4hrHlrUsI9Ii/eeSYnX7F/kvuqyX1WkMK0gcEflcVWVsmXdjRhK5/C4vbZ0Db
         cS0ncst0yLtsg+24mBbnLrrqUuOILN4pQafS7Ku1YQck5CdF92Xvw9lMFYfrO44RWM4Y
         QHSMy2tx7W6CqITMr9YFiU7LWNLIzAoBxMhqb1DsiMRIbGOm7jKXr37DR7ENcx73XJSc
         ernWppzKy/BtyFAr2O0xalrd2Gxot7HseEwzW6mtX0n+/vYjCqo7fV1kRhLHAiIl2UKV
         2ZBolB2dAKVOypaIA8HYP3Mk8ZD4drfoKhsaNMBMPqaUhUszTnFm+UTpw+zAjDkZ4Sl8
         oQnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d143si13689550qke.153.2017.05.08.15.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 May 2017 15:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34052 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7rWO-00045P-EM
	for alex.bennee@linaro.org; Mon, 08 May 2017 18:52:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <heut2008@gmail.com>) id 1d7lDq-0003k6-6o
	for qemu-arm@nongnu.org; Mon, 08 May 2017 12:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <heut2008@gmail.com>) id 1d7lDo-0002GF-Ex
	for qemu-arm@nongnu.org; Mon, 08 May 2017 12:09:18 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:37235)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <heut2008@gmail.com>) id 1d7lDo-0002FS-4e
	for qemu-arm@nongnu.org; Mon, 08 May 2017 12:09:16 -0400
Received: by mail-wm0-x230.google.com with SMTP id m123so70081215wma.0
	for <qemu-arm@nongnu.org>; Mon, 08 May 2017 09:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:from:date:message-id:subject:to;
	bh=s4k03CcUSf6OBIug2MUrRpmZ+BdQ0Uf/EncZJnbd5WU=;
	b=s3pCtdn2p7Y449NZu0f9o5r7KS6otVOMKMrpjS33s18JiOgwjqUdl1gBEf+rqKot6J
	aJH2k4ArTZPsxaH2M88KNmO0u5vpQsBNj8C7lM0ZeIUnFG08ANR9OTpF6EXbrIIKgrEn
	l6YSB8gpnBjaUQl9hBx2JwwOIqxbQJJ6XyWpBycocbKc4IT1UMkI+ZkUf8Xa9qXpQQWz
	dtnMwX8NC9YZmwLiJixa79a8W72gpktCji4TIfm1IzODYBgczPoCxiBEJ0n3Uq6zXdps
	s2Yj/49xbW4g/Enp51n2Kc5Hp+zKM0OgWBN6MjVbKDWVCfuTxTV0qiRILoQLxG2nt2y4
	GHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:from:date:message-id
	:subject:to;
	bh=s4k03CcUSf6OBIug2MUrRpmZ+BdQ0Uf/EncZJnbd5WU=;
	b=qPPBix2+q/bpE2Gb9NBTOF8v60oUIqUQdpIF9yOEaekkBimD0YyM9m8p+IWsD6sYRG
	FTxz8gF2vc2HiS6U1x7hxU7eMtsgd1c7OJl5n3/onp3ksH2wpI84D4xmilIxJi4LtC1U
	DmnFdavkoOpeyU8DrYU//WkLYk/oAo65+mu1B8xerzkf9r/BUUI8/5gSOl7OHKh0jULR
	IEQhRJSRpDi4GUKEo4l2Ouxz1pSK0UH9AupV/tZD3dNBOi6QKRbOaoTiJAcCQd9LHYTR
	q8MR3qc2RcEcUkeEMiNEPFVMEbN2XhpB5cvqVO1TFJlgcRglcfYKvO3iwD4cF9hplJfu
	zFyg==
X-Gm-Message-State: AN3rC/5cF3VwOWdg4wj4EGmV6WxXeR7EAL1D+CfdKjVvdAXN1PYhmhBb
	XKSqzWme874R+imnJJl6LsPMDHdvVqaLkVw=
X-Received: by 10.25.165.79 with SMTP id o76mr26077565lfe.168.1494259753885;
	Mon, 08 May 2017 09:09:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.196.67 with HTTP; Mon, 8 May 2017 09:09:13 -0700 (PDT)
From: Yaguang Tang <heut2008@gmail.com>
Date: Tue, 9 May 2017 00:09:13 +0800
Message-ID: <CAPP2CaWZ3p5rcry5xvcAoVmji2cpkQffZBvfJqjOsYh4t9VLvw@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=001a114107dad5288c054f057585
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
X-Mailman-Approved-At: Mon, 08 May 2017 18:52:48 -0400
Subject: [Qemu-arm] Qemu qxl support on arm64 issue
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
Reply-To: heut2008@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9aW3tmsfMKRk

--001a114107dad5288c054f057585
Content-Type: text/plain; charset=UTF-8

Hi all,

I am trying to make openstack work on arm64, when setting spice for VM,
qemu complains that qxl is not available, my env:

qemu 2.8 compiled with the following:

./configure --enable-spice --enable-kvm --target-list=aarch64-softmmu
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
        LANGUAGE = (unset),
        LC_ALL = (unset),
        LANG = "en_US.UTF-8"
    are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").
Install prefix    /usr/local
BIOS directory    /usr/local/share/qemu
binary directory  /usr/local/bin
library directory /usr/local/lib
module directory  /usr/local/lib/qemu
libexec directory /usr/local/libexec
include directory /usr/local/include
config directory  /usr/local/etc
local state directory   /usr/local/var
Manual directory  /usr/local/share/man
ELF interp prefix /usr/gnemul/qemu-%M
Source path       /home/etos/git/qemu
C compiler        cc
Host C compiler   cc
C++ compiler      c++
Objective-C compiler cc
ARFLAGS           rv
CFLAGS            -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -g
QEMU_CFLAGS       -I/usr/include/pixman-1   -Werror
-DHAS_LIBSSH2_SFTP_FSYNC -pthread -I/usr/include/glib-2.0
-I/usr/lib/aarch64-linux-gnu/glib-2.0/include   -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv  -Wendif-labels
-Wno-missing-include-dirs -Wempty-body -Wnested-externs -Wformat-security
-Wformat-y2k -Winit-self -Wignored-qualifiers -Wold-style-declaration
-Wold-style-definition -Wtype-limits -fstack-protector-strong
 -I/usr/include/p11-kit-1     -I/usr/include/libpng12  -pthread
-I/usr/local/include/spice-server -I/usr/local/include/spice-1
-I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include
-I/usr/include/pixman-1  -I/usr/include/libusb-1.0
LDFLAGS           -Wl,--warn-common -g
make              make
install           install
python            python -B
smbd              /usr/sbin/smbd
module support    no
host CPU          aarch64
host big endian   no
target list       aarch64-softmmu
tcg debug enabled no
gprof enabled     no
sparse enabled    no
strip binaries    yes
profiler          no
static build      no
pixman            system
SDL support       yes (1.2.15)
GTK support       no
GTK GL support    no
VTE support       no
TLS priority      NORMAL
GNUTLS support    yes
GNUTLS rnd        yes
libgcrypt         no
libgcrypt kdf     no
nettle            yes (3.3)
nettle kdf        yes
libtasn1          yes
curses support    no
virgl support     yes
curl support      yes
mingw32 support   no
Audio drivers     oss
Block whitelist (rw)
Block whitelist (ro)
VirtFS support    yes
VNC support       yes
VNC SASL support  yes
VNC JPEG support  yes
VNC PNG support   yes
xen support       no
brlapi support    yes
bluez  support    yes
Documentation     yes
PIE               no
vde support       yes
netmap support    no
Linux AIO support yes
ATTR/XATTR support yes
Install blobs     yes
KVM support       yes
HAX support       no
RDMA support      no
TCG interpreter   no
fdt support       yes
preadv support    yes
fdatasync         yes
madvise           yes
posix_madvise     yes
libcap-ng support yes
vhost-net support yes
vhost-scsi support yes
vhost-vsock support yes
Trace backends    log
spice support     yes (0.12.13/0.13.3.311-1b9c-dirty)
rbd support       yes
xfsctl support    yes
smartcard support no
libusb            yes
usb net redir     yes
OpenGL support    no
OpenGL dmabufs    no
libiscsi support  yes
libnfs support    no
build guest agent yes
QGA VSS support   no
QGA w32 disk info no
QGA MSI support   no
seccomp support   yes
coroutine backend ucontext
coroutine pool    yes
debug stack usage no
GlusterFS support no
gcov              gcov
gcov enabled      no
TPM support       yes
libssh2 support   yes
TPM passthrough   no
QOM debugging     yes
lzo support       yes
snappy support    no
bzip2 support     no
NUMA host support no
tcmalloc support  no
jemalloc support  no
avx2 optimization no
replication support yes
VxHS block device no

start a vm as follow:

qemu-system-aarch64 --enable-kvm --nographic -machine virt --kernel
cirros-d161201-aarch64-vmlinuz --initrd cirros-d161201-aarch64-initrd
--spice port=5900,disable-ticketing -cpu host -vga qxl

Is there anything I am missing or wrong ?

-- 
Tang Yaguang

--001a114107dad5288c054f057585
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I am trying to make openstack w=
ork on arm64, when setting spice for VM, qemu complains that qxl is not ava=
ilable, my env:</div><div><br></div><div>qemu 2.8 compiled with the followi=
ng:</div><div><br></div><div><div>./configure --enable-spice --enable-kvm -=
-target-list=3Daarch64-softmmu</div><div>perl: warning: Setting locale fail=
ed.</div><div>perl: warning: Please check that your locale settings:</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 LANGUAGE =3D (unset),</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 LC_ALL =3D (unset),</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 LANG =3D &quot;en_US.UTF-8&quot;</div><div>=C2=A0 =C2=A0 are supported and=
 installed on your system.</div><div>perl: warning: Falling back to the sta=
ndard locale (&quot;C&quot;).</div><div>Install prefix =C2=A0 =C2=A0/usr/lo=
cal</div><div>BIOS directory =C2=A0 =C2=A0/usr/local/share/qemu</div><div>b=
inary directory =C2=A0/usr/local/bin</div><div>library directory /usr/local=
/lib</div><div>module directory =C2=A0/usr/local/lib/qemu</div><div>libexec=
 directory /usr/local/libexec</div><div>include directory /usr/local/includ=
e</div><div>config directory =C2=A0/usr/local/etc</div><div>local state dir=
ectory =C2=A0 /usr/local/var</div><div>Manual directory =C2=A0/usr/local/sh=
are/man</div><div>ELF interp prefix /usr/gnemul/qemu-%M</div><div>Source pa=
th =C2=A0 =C2=A0 =C2=A0 /home/etos/git/qemu</div><div>C compiler =C2=A0 =C2=
=A0 =C2=A0 =C2=A0cc</div><div>Host C compiler =C2=A0 cc</div><div>C++ compi=
ler =C2=A0 =C2=A0 =C2=A0c++</div><div>Objective-C compiler cc</div><div>ARF=
LAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rv</div><div>CFLAGS =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -g</=
div><div>QEMU_CFLAGS =C2=A0 =C2=A0 =C2=A0 -I/usr/include/pixman-1 =C2=A0 -W=
error -DHAS_LIBSSH2_SFTP_FSYNC -pthread -I/usr/include/glib-2.0 -I/usr/lib/=
aarch64-linux-gnu/glib-2.0/include =C2=A0 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=
=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wall -Wund=
ef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -f=
wrapv =C2=A0-Wendif-labels -Wno-missing-include-dirs -Wempty-body -Wnested-=
externs -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wo=
ld-style-declaration -Wold-style-definition -Wtype-limits -fstack-protector=
-strong =C2=A0-I/usr/include/p11-kit-1 =C2=A0 =C2=A0 -I/usr/include/libpng1=
2 =C2=A0-pthread -I/usr/local/include/spice-server -I/usr/local/include/spi=
ce-1 -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include =
-I/usr/include/pixman-1 =C2=A0-I/usr/include/libusb-1.0</div><div>LDFLAGS =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Wl,--warn-common -g</div><div>make =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make</div><div>install =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install</div><div>python =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0python -B</div><div>smbd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/usr/sbin/smbd</div><div>module support =C2=A0 =C2=A0no=
</div><div>host CPU =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aarch64</div><div>hos=
t big endian =C2=A0 no</div><div>target list =C2=A0 =C2=A0 =C2=A0 aarch64-s=
oftmmu</div><div>tcg debug enabled no</div><div>gprof enabled =C2=A0 =C2=A0=
 no</div><div>sparse enabled =C2=A0 =C2=A0no</div><div>strip binaries =C2=
=A0 =C2=A0yes</div><div>profiler =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no</div>=
<div>static build =C2=A0 =C2=A0 =C2=A0no</div><div>pixman =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0system</div><div>SDL support =C2=A0 =C2=A0 =C2=A0 y=
es (1.2.15)</div><div>GTK support =C2=A0 =C2=A0 =C2=A0 no</div><div>GTK GL =
support =C2=A0 =C2=A0no</div><div>VTE support =C2=A0 =C2=A0 =C2=A0 no</div>=
<div>TLS priority =C2=A0 =C2=A0 =C2=A0NORMAL</div><div>GNUTLS support =C2=
=A0 =C2=A0yes</div><div>GNUTLS rnd =C2=A0 =C2=A0 =C2=A0 =C2=A0yes</div><div=
>libgcrypt =C2=A0 =C2=A0 =C2=A0 =C2=A0 no</div><div>libgcrypt kdf =C2=A0 =
=C2=A0 no</div><div>nettle =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yes (3.=
3)</div><div>nettle kdf =C2=A0 =C2=A0 =C2=A0 =C2=A0yes</div><div>libtasn1 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yes</div><div>curses support =C2=A0 =C2=
=A0no</div><div>virgl support =C2=A0 =C2=A0 yes</div><div>curl support =C2=
=A0 =C2=A0 =C2=A0yes</div><div>mingw32 support =C2=A0 no</div><div>Audio dr=
ivers =C2=A0 =C2=A0 oss</div><div>Block whitelist (rw)</div><div>Block whit=
elist (ro)</div><div>VirtFS support =C2=A0 =C2=A0yes</div><div>VNC support =
=C2=A0 =C2=A0 =C2=A0 yes</div><div>VNC SASL support =C2=A0yes</div><div>VNC=
 JPEG support =C2=A0yes</div><div>VNC PNG support =C2=A0 yes</div><div>xen =
support =C2=A0 =C2=A0 =C2=A0 no</div><div>brlapi support =C2=A0 =C2=A0yes</=
div><div>bluez =C2=A0support =C2=A0 =C2=A0yes</div><div>Documentation =C2=
=A0 =C2=A0 yes</div><div>PIE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 no</div><div>vde support =C2=A0 =C2=A0 =C2=A0 yes</div><div>netmap supp=
ort =C2=A0 =C2=A0no</div><div>Linux AIO support yes</div><div>ATTR/XATTR su=
pport yes</div><div>Install blobs =C2=A0 =C2=A0 yes</div><div>KVM support =
=C2=A0 =C2=A0 =C2=A0 yes</div><div>HAX support =C2=A0 =C2=A0 =C2=A0 no</div=
><div>RDMA support =C2=A0 =C2=A0 =C2=A0no</div><div>TCG interpreter =C2=A0 =
no</div><div>fdt support =C2=A0 =C2=A0 =C2=A0 yes</div><div>preadv support =
=C2=A0 =C2=A0yes</div><div>fdatasync =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes</div><=
div>madvise =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes</div><div>posix_madvise =
=C2=A0 =C2=A0 yes</div><div>libcap-ng support yes</div><div>vhost-net suppo=
rt yes</div><div>vhost-scsi support yes</div><div>vhost-vsock support yes</=
div><div>Trace backends =C2=A0 =C2=A0log</div><div>spice support =C2=A0 =C2=
=A0 yes (0.12.13/0.13.3.311-1b9c-dirty)</div><div>rbd support =C2=A0 =C2=A0=
 =C2=A0 yes</div><div>xfsctl support =C2=A0 =C2=A0yes</div><div>smartcard s=
upport no</div><div>libusb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yes</di=
v><div>usb net redir =C2=A0 =C2=A0 yes</div><div>OpenGL support =C2=A0 =C2=
=A0no</div><div>OpenGL dmabufs =C2=A0 =C2=A0no</div><div>libiscsi support =
=C2=A0yes</div><div>libnfs support =C2=A0 =C2=A0no</div><div>build guest ag=
ent yes</div><div>QGA VSS support =C2=A0 no</div><div>QGA w32 disk info no<=
/div><div>QGA MSI support =C2=A0 no</div><div>seccomp support =C2=A0 yes</d=
iv><div>coroutine backend ucontext</div><div>coroutine pool =C2=A0 =C2=A0ye=
s</div><div>debug stack usage no</div><div>GlusterFS support no</div><div>g=
cov =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcov</div><div>gcov ena=
bled =C2=A0 =C2=A0 =C2=A0no</div><div>TPM support =C2=A0 =C2=A0 =C2=A0 yes<=
/div><div>libssh2 support =C2=A0 yes</div><div>TPM passthrough =C2=A0 no</d=
iv><div>QOM debugging =C2=A0 =C2=A0 yes</div><div>lzo support =C2=A0 =C2=A0=
 =C2=A0 yes</div><div>snappy support =C2=A0 =C2=A0no</div><div>bzip2 suppor=
t =C2=A0 =C2=A0 no</div><div>NUMA host support no</div><div>tcmalloc suppor=
t =C2=A0no</div><div>jemalloc support =C2=A0no</div><div>avx2 optimization =
no</div><div>replication support yes</div><div>VxHS block device no</div></=
div><div><br></div><div>start a vm as follow:</div><div><br></div><div>qemu=
-system-aarch64 --enable-kvm --nographic -machine virt --kernel cirros-d161=
201-aarch64-vmlinuz --initrd cirros-d161201-aarch64-initrd --spice port=3D5=
900,disable-ticketing -cpu host -vga qxl=C2=A0<br></div><div><br clear=3D"a=
ll"><div>Is there anything I am missing or wrong ?</div><div><br></div>-- <=
br><div class=3D"gmail_signature"><div dir=3D"ltr"><div>Tang Yaguang</div><=
div><br></div><br><div>=C2=A0</div></div></div>
</div></div>

--001a114107dad5288c054f057585--
