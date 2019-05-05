Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1612668wrh;
        Sun, 5 May 2019 10:46:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3wwoEOuFCXmCfJq55GQEeLPSLIAy7ebMw4MFnH8uqcdQ9U8Epz+USahR4Kmfb9n61NdDF
X-Received: by 2002:adf:fb11:: with SMTP id c17mr14825617wrr.237.1557078418702;
        Sun, 05 May 2019 10:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557078418; cv=none;
        d=google.com; s=arc-20160816;
        b=uSJedTcF30ryMOxWqq1moMar4Hu3XEleFRFU8kTVTsfGHWy8UAoKIkW74hgxFKQOPb
         zXeIZncrYn+ppLWgU/sxJirN/J/KIMyozorgrIR4WXi5s7pgCZO9/jjy8UuOHxF4vpjg
         rL0qO/I/JNj5RzBgjWPTd4NV+UeBwbvnKp3LMZ30G8bBXRi1T54y0bn2zhakW82Knq0p
         i8UBJDWenib54HVOgUm1FXa/1aWA8GIvfv1CAdaWzAoCJ8wi8CTFkIWcKN34soBmfJ+j
         RmIzBuM7arCZzaQ33Nhz159ENHbeo498Nbfs6LVXOrUE3g6wDCfJ1d9Vajpop9BPjj5f
         Q+WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7/riqTtpVRAycoSDL9k++8liU4MWIWs5kuolpVyaGw=;
        b=Ajs5bOWci4Y5romVX97O/fSaQtp9xa0jMyhh0IJm3lQsQYx8Tqm8jbwhMl4eFaDsIP
         c4/clAkk57sp4DnhdHe3oSgg5xyQl5rUd+oWaw61GcExxftkFsRJTC/RI034QPT32p4f
         5sXppip3PMt6Lk+LEv9LasTUyBhKr+k3EMBrYOD7jeldrsje5Eb/H9ThOVP4Z2Ilajpv
         llY5pT3w24Flcnd9yfBGMSLXAH59Qp3q506W2TH3HRePdnWxTPLV6C+3d/2u1bKPtu2Q
         mNBriXLpQZe0aWevI7sl2/AZ9hZqmjixHHnhe2b4YM/+mEc7IAldzk4+ku3zJTwkm2s9
         y0jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SS7dkB77;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si6005005wrv.40.2019.05.05.10.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 10:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SS7dkB77;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:44123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNLE1-0001rA-Ox
	for alex.bennee@linaro.org; Sun, 05 May 2019 13:46:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas2025@gmail.com>) id 1hNLDs-0001qt-Sf
	for qemu-arm@nongnu.org; Sun, 05 May 2019 13:46:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas2025@gmail.com>) id 1hNLDr-0006Qf-CW
	for qemu-arm@nongnu.org; Sun, 05 May 2019 13:46:48 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46884)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andreas2025@gmail.com>)
	id 1hNLDr-0006Nq-6f
	for qemu-arm@nongnu.org; Sun, 05 May 2019 13:46:47 -0400
Received: by mail-ot1-x342.google.com with SMTP id v17so1457444otp.13
	for <qemu-arm@nongnu.org>; Sun, 05 May 2019 10:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O7/riqTtpVRAycoSDL9k++8liU4MWIWs5kuolpVyaGw=;
	b=SS7dkB77SlsztwLjzYPVRgi3qvwvsSxxP/0TgLjA8FKbYV2GNKgswMTqoXdtYjOxL1
	uBnLy9fds6U7thUY54FWfbx1UG+EMP8/9Z4IaZgtQx1mdmWZckStTX1rW0E5MWS1Q64f
	aNE9DMgeuByP0sKDPWt5CjKWy1hem9GT9+9nuBWxwRGPfBvQkM0kQocLZ5HWE2Od9ufK
	2a+9jkJNVtXTu/8yYX3Z6UKbcojqtQi05en8qV1Ib4BlqkwfAMwCgEMslHVrXAs79h6m
	ZLS6Lz98+EdRIAs0vMqQM7zmt7kFHoGb8GRsMHm+YqxRI2eDXZDIAMz4doyVy+ghTirb
	M4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O7/riqTtpVRAycoSDL9k++8liU4MWIWs5kuolpVyaGw=;
	b=Z3n9zKx35u4CmffyNf2cLTXFOuIEES2OJMmvHGLaopV7b+0gQ0BOtTgWuPPtIDAhMX
	fI/p2+vwe5UOxsOaSOSLYS7L7jxtztLUmk3z1rSw+zuQX4Vj7qwg4IIp7aT57upwiZNZ
	WvRAQhZaiGbOq5qfSGTGA+3cbWegI52nBQ3FQ4OYtoTL0RTrvXH1fRQ0XNDFC7j1JRXB
	fBH+XYRdvBoW22/ZnczVKYOYf8BpSBCZwnsfFo6oi+UwEjPwQAhgexNjltocVK4+yJD3
	GzhkmGJjqBuw4j8Z+ceJbEjOLRxyxPFJGEPun+TMezIhA31jzy+VsRuW0162qn3pnIAg
	6B+g==
X-Gm-Message-State: APjAAAWwYy/ethRU5+yiWCkyBK49FlyE/8EWv7jeKANCTAYeGshVLfSb
	6ka7vrvMTcyli8pIK+gW2ltS/C4QxO7y+DmY9NE=
X-Received: by 2002:a9d:5a14:: with SMTP id v20mr15009123oth.342.1557078405781;
	Sun, 05 May 2019 10:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAAVaN8zqOM4Fz3NfJ1gL9-G8WCBQyBt+p+Fgnrj3kgUwx2cKiA@mail.gmail.com>
	<CAFEAcA_YU-MdnrCcSTyL3b93wTCCDzN0GcbSRe28ZPh14FPB6A@mail.gmail.com>
In-Reply-To: <CAFEAcA_YU-MdnrCcSTyL3b93wTCCDzN0GcbSRe28ZPh14FPB6A@mail.gmail.com>
From: Andy Ng <andreas2025@gmail.com>
Date: Sun, 5 May 2019 18:46:34 +0100
Message-ID: <CAAVaN8xxU7ZzDZ=-TMe8_U5z8Zoiq4ny-Z1VK8bgUyAJ8YdPXg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] qemu-system-arm with GPU support for QT with OpenGL
 on
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gt7O7Y4Wa/xH

Thank you for the reply.

I have seen the link you mentioned, I just try to reproduce the same
thing. I am using gemu 4.0  I have the following config:

Install prefix    /usr/local
BIOS directory    /usr/local/share/qemu
firmware path     /usr/local/share/qemu-firmware
binary directory  /usr/local/bin
library directory /usr/local/lib
module directory  /usr/local/lib/qemu
libexec directory /usr/local/libexec
include directory /usr/local/include
config directory  /usr/local/etc
local state directory   /usr/local/var
Manual directory  /usr/local/share/man
ELF interp prefix /usr/gnemul/qemu-%M
Source path       /opt/linux-arm-qemu-versatile/qemu-4.0.0
GIT binary        git
GIT submodules
C compiler        cc
Host C compiler   cc
C++ compiler      c++
Objective-C compiler cc
ARFLAGS           rv
CFLAGS            -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -g
QEMU_CFLAGS       -I/usr/include/pixman-1 -I$(SRC_PATH)/dtc/libfdt
-pthread -I/usr/include/glib-2.0
-I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fPIE -DPIE -m64 -mcx16
-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
-Wstrict-prototypes -Wredundant-decls -Wall -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
-std=gnu99  -Wendif-labels -Wno-missing-include-dirs -Wempty-body
-Wnested-externs -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wold-style-declaration -Wold-style-definition
-Wtype-limits -fstack-protector-strong  -I/usr/include/libpng12
-I$(SRC_PATH)/capstone/include
LDFLAGS           -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -pie -m64 -g
QEMU_LDFLAGS      -L$(BUILD_DIR)/dtc/libfdt
make              make
install           install
python            python -B (2.7.12)
slirp support     internal
smbd              /usr/sbin/smbd
module support    no
host CPU          x86_64
host big endian   no
target list       arm-softmmu aarch64-softmmu
gprof enabled     no
sparse enabled    no
strip binaries    yes
profiler          no
static build      no
SDL support       yes (2.0.4)
SDL image support no
GTK support       yes (3.18.9)
GTK GL support    yes
VTE support       no
TLS priority      NORMAL
GNUTLS support    no
libgcrypt         no
nettle            yes (3.2)
libtasn1          no
PAM               no
iconv support     yes
curses support    no
virgl support     yes (0.6.0)
curl support      no
mingw32 support   no
Audio drivers     pa oss
Block whitelist (rw)
Block whitelist (ro)
VirtFS support    no
Multipath support no
VNC support       yes
VNC SASL support  no
VNC JPEG support  no
VNC PNG support   yes
xen support       no
brlapi support    no
bluez  support    no
Documentation     no
PIE               yes
vde support       no
netmap support    no
Linux AIO support no
ATTR/XATTR support yes
Install blobs     yes
KVM support       yes
HAX support       no
HVF support       no
WHPX support      no
TCG support       yes
TCG debug enabled no
TCG interpreter   no
malloc trim support yes
RDMA support      no
PVRDMA support    no
fdt support       git
membarrier        no
preadv support    yes
fdatasync         yes
madvise           yes
posix_madvise     yes
posix_memalign    yes
libcap-ng support no
vhost-net support yes
vhost-crypto support yes
vhost-scsi support yes
vhost-vsock support yes
vhost-user support yes
Trace backends    log
spice support     no
rbd support       no
xfsctl support    no
smartcard support no
libusb            no
usb net redir     no
OpenGL support    yes
OpenGL dmabufs    yes
libiscsi support  no
libnfs support    no
build guest agent yes
QGA VSS support   no
QGA w32 disk info no
QGA MSI support   no
seccomp support   no
coroutine backend ucontext
coroutine pool    yes
debug stack usage no
mutex debugging   no
crypto afalg      no
GlusterFS support no
gcov              gcov
gcov enabled      no
TPM support       yes
libssh2 support   no
TPM passthrough
TPM emulator
QOM debugging     yes
Live block migration yes
lzo support       no
snappy support    no
bzip2 support     no
lzfse support     no
NUMA host support no
libxml2           no
tcmalloc support  no
jemalloc support  no
avx2 optimization yes
replication support yes
VxHS block device no
bochs support     yes
cloop support     yes
dmg support       yes
qcow v1 support   yes
vdi support       yes
vvfat support     yes
qed support       yes
parallels support yes
sheepdog support  yes
capstone          internal
docker            no
libpmem support   no
libudev           yes
default devices   yes

I tried :

sudo qemu-system-arm -m 1024M -M virt -drive
if=none,file=OSMC_TGT_rbp2_20190424.img,id=hd0 -device
virtio-blk-device,drive=hd0 -netdev type=tap,id=net0 -device
virtio-net-device,netdev=net0 -device virtio-gpu -display gtk,gl=on

But I get the error "Guest has not initialised the display (yet)"

Not sure what may be going wrong.. I am still investigating.


Thank you

On Sun, May 5, 2019 at 4:31 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 4 May 2019 at 21:42, Andy Ng <andreas2025@gmail.com> wrote:
> > I have tried to create Cortex-A9 images based on vexpress, however
> > qemu will complain about the PCI. I have tried to use -M virt, but
> > this one brings up cortex-A15, compatibility issue.
> >
> > Any ideas what would it be the best way forward to make it run on
> > Qemu?   Do you know what is the best -M type that I have to use.
>
> Our recommendation is to use "virt":
> https://wiki.qemu.org/Documentation/Platforms/ARM#Guidelines_for_choosing_a_QEMU_machine
>
> > realview-pbx-a9 ? I do not want to recompile the code in different
> > architecture of CPU model.
>
> Cortex-A9 and -A15 are very close -- any application level
> code built for the A9 should run fine on QEMU's A15 model.
> The kernel will obviously need to be built with "virt" board
> support and Cortex-A15 support enabled, but you need to
> build a kernel that works for the board model you select anyway.
>
> thanks
> -- PMM
