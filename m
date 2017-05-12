Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j133sm2346233wmg.26.2017.05.12.06.14.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 May 2017 06:14:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id DA0083E0157;
	Fri, 12 May 2017 14:15:25 +0100 (BST)
References: <CAPP2CaWZ3p5rcry5xvcAoVmji2cpkQffZBvfJqjOsYh4t9VLvw@mail.gmail.com> <87lgq68ot2.fsf@linaro.org> <CAPP2CaWv-SEipA-_3VQ7wSLAx0MGE9VyqEHeCK1jci5u2apa2A@mail.gmail.com> <CAPP2CaUzzyCJcAm8BH7szD=E56TCZoNAR93SpNHoqQwc_Vpxpw@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.17
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: heut2008@gmail.com
Cc: qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] Qemu qxl support on arm64 issue
In-reply-to: <CAPP2CaUzzyCJcAm8BH7szD=E56TCZoNAR93SpNHoqQwc_Vpxpw@mail.gmail.com>
Date: Fri, 12 May 2017 14:15:25 +0100
Message-ID: <87inl643o2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: b98CAvKn4Mba


Yaguang Tang <heut2008@gmail.com> writes:

> Hi Alex,
>
> Thanks for your suggestion, I am successfully connect to guest using spice
> with virtio-gpu graphic driver, but the next problem is that can't use
> keyboard in spice client, when trying to add a usb keyboard
> device to guest, libvirt show's   *ibvirtError: internal error: No free USB
> ports,* note that I am adding this usb device using virt-manager . is there
> any specific to USB device in arm64 ?

It's hard to tell without knowing what virt-manager is doing.

However the general thing with the arm64 virt machine is it is fairly
bare by default (compared to a PC which includes a bunch of stuff in its
default device model). As a result you need to declare all additional
devices you wish to use.

There is no particular reason why you shouldn't be able to instantiate a
virtio USB hub for your device although you would want it to be
discover-able so on a virtio-pci bus.

Can you include you current QEMU command line?

>
> On Tue, May 9, 2017 at 6:38 PM, Yaguang Tang <heut2008@gmail.com> wrote:
>
>> Qemu shows QXL is not available,  if I use virtio-gpu, does it require
>> specific driver or kernel version in guest ?
>>
>> On Tue, May 9, 2017 at 3:36 PM, Alex Bennée <alex.bennee@linaro.org>
>> wrote:
>>
>>>
>>> Yaguang Tang <heut2008@gmail.com> writes:
>>>
>>> > Hi all,
>>> >
>>> > I am trying to make openstack work on arm64, when setting spice for VM,
>>> > qemu complains that qxl is not available, my env:
>>> >
>>> > qemu 2.8 compiled with the following:
>>> >
>>> > ./configure --enable-spice --enable-kvm --target-list=aarch64-softmmu
>>> > perl: warning: Setting locale failed.
>>> > perl: warning: Please check that your locale settings:
>>> >         LANGUAGE = (unset),
>>> >         LC_ALL = (unset),
>>> >         LANG = "en_US.UTF-8"
>>> >     are supported and installed on your system.
>>> > perl: warning: Falling back to the standard locale ("C").
>>> > Install prefix    /usr/local
>>> > BIOS directory    /usr/local/share/qemu
>>> > binary directory  /usr/local/bin
>>> > library directory /usr/local/lib
>>> > module directory  /usr/local/lib/qemu
>>> > libexec directory /usr/local/libexec
>>> > include directory /usr/local/include
>>> > config directory  /usr/local/etc
>>> > local state directory   /usr/local/var
>>> > Manual directory  /usr/local/share/man
>>> > ELF interp prefix /usr/gnemul/qemu-%M
>>> > Source path       /home/etos/git/qemu
>>> > C compiler        cc
>>> > Host C compiler   cc
>>> > C++ compiler      c++
>>> > Objective-C compiler cc
>>> > ARFLAGS           rv
>>> > CFLAGS            -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -g
>>> > QEMU_CFLAGS       -I/usr/include/pixman-1   -Werror
>>> > -DHAS_LIBSSH2_SFTP_FSYNC -pthread -I/usr/include/glib-2.0
>>> > -I/usr/lib/aarch64-linux-gnu/glib-2.0/include   -D_GNU_SOURCE
>>> > -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
>>> > -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes
>>> > -fno-strict-aliasing -fno-common -fwrapv  -Wendif-labels
>>> > -Wno-missing-include-dirs -Wempty-body -Wnested-externs
>>> -Wformat-security
>>> > -Wformat-y2k -Winit-self -Wignored-qualifiers -Wold-style-declaration
>>> > -Wold-style-definition -Wtype-limits -fstack-protector-strong
>>> >  -I/usr/include/p11-kit-1     -I/usr/include/libpng12  -pthread
>>> > -I/usr/local/include/spice-server -I/usr/local/include/spice-1
>>> > -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include
>>> > -I/usr/include/pixman-1  -I/usr/include/libusb-1.0
>>> > LDFLAGS           -Wl,--warn-common -g
>>> > make              make
>>> > install           install
>>> > python            python -B
>>> > smbd              /usr/sbin/smbd
>>> > module support    no
>>> > host CPU          aarch64
>>> > host big endian   no
>>> > target list       aarch64-softmmu
>>> > tcg debug enabled no
>>> > gprof enabled     no
>>> > sparse enabled    no
>>> > strip binaries    yes
>>> > profiler          no
>>> > static build      no
>>> > pixman            system
>>> > SDL support       yes (1.2.15)
>>> > GTK support       no
>>> > GTK GL support    no
>>> > VTE support       no
>>> > TLS priority      NORMAL
>>> > GNUTLS support    yes
>>> > GNUTLS rnd        yes
>>> > libgcrypt         no
>>> > libgcrypt kdf     no
>>> > nettle            yes (3.3)
>>> > nettle kdf        yes
>>> > libtasn1          yes
>>> > curses support    no
>>> > virgl support     yes
>>> > curl support      yes
>>> > mingw32 support   no
>>> > Audio drivers     oss
>>> > Block whitelist (rw)
>>> > Block whitelist (ro)
>>> > VirtFS support    yes
>>> > VNC support       yes
>>> > VNC SASL support  yes
>>> > VNC JPEG support  yes
>>> > VNC PNG support   yes
>>> > xen support       no
>>> > brlapi support    yes
>>> > bluez  support    yes
>>> > Documentation     yes
>>> > PIE               no
>>> > vde support       yes
>>> > netmap support    no
>>> > Linux AIO support yes
>>> > ATTR/XATTR support yes
>>> > Install blobs     yes
>>> > KVM support       yes
>>> > HAX support       no
>>> > RDMA support      no
>>> > TCG interpreter   no
>>> > fdt support       yes
>>> > preadv support    yes
>>> > fdatasync         yes
>>> > madvise           yes
>>> > posix_madvise     yes
>>> > libcap-ng support yes
>>> > vhost-net support yes
>>> > vhost-scsi support yes
>>> > vhost-vsock support yes
>>> > Trace backends    log
>>> > spice support     yes (0.12.13/0.13.3.311-1b9c-dirty)
>>> > rbd support       yes
>>> > xfsctl support    yes
>>> > smartcard support no
>>> > libusb            yes
>>> > usb net redir     yes
>>> > OpenGL support    no
>>> > OpenGL dmabufs    no
>>> > libiscsi support  yes
>>> > libnfs support    no
>>> > build guest agent yes
>>> > QGA VSS support   no
>>> > QGA w32 disk info no
>>> > QGA MSI support   no
>>> > seccomp support   yes
>>> > coroutine backend ucontext
>>> > coroutine pool    yes
>>> > debug stack usage no
>>> > GlusterFS support no
>>> > gcov              gcov
>>> > gcov enabled      no
>>> > TPM support       yes
>>> > libssh2 support   yes
>>> > TPM passthrough   no
>>> > QOM debugging     yes
>>> > lzo support       yes
>>> > snappy support    no
>>> > bzip2 support     no
>>> > NUMA host support no
>>> > tcmalloc support  no
>>> > jemalloc support  no
>>> > avx2 optimization no
>>> > replication support yes
>>> > VxHS block device no
>>> >
>>> > start a vm as follow:
>>> >
>>> > qemu-system-aarch64 --enable-kvm --nographic -machine virt --kernel
>>> > cirros-d161201-aarch64-vmlinuz --initrd cirros-d161201-aarch64-initrd
>>> > --spice port=5900,disable-ticketing -cpu host -vga qxl
>>> >
>>> > Is there anything I am missing or wrong ?
>>>
>>> What error does it give?
>>>
>>> Regardless I think -vga is a legacy option for x86. If you want a display
>>> adaptor for an ARM vm machine you'll need to instantiate virtio-gpu
>>> device and then connect it to your spice display.
>>>
>>> --
>>> Alex Bennée
>>>
>>
>>
>>
>> --
>> Tang Yaguang
>>
>>
>>
>>


--
Alex Bennée
