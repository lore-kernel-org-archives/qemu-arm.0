Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp636533lfb;
        Sun, 18 Apr 2021 14:50:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTBqFghxuxCufBvvcco5MESTz3sJFwWcyjJ2AhDk+whcC/K7PnhHKS5LQIDt9tGYfgWKet
X-Received: by 2002:a25:7752:: with SMTP id s79mr13477112ybc.522.1618782636464;
        Sun, 18 Apr 2021 14:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618782636; cv=none;
        d=google.com; s=arc-20160816;
        b=mzGVGOu2m1N2HapvEZCzmAO4dM3gKtCOJwRqr4X68p+HijzK5BASnCm3jE2UwhA1ue
         eGb4C4RW72lTcdLU+9fQ++sn493tulAfN54HfZMWkvhkMAfdTAcxiwR7iP03nqgEwNfz
         8D9SREe8RCJ2adqNo26CopUrR756/k4VGmdg987wmK4NIpbpnVfyR3LW0HrawAzicnqr
         MR5u1sSbB6YFuZaUCsBLqOaBVqneo2nwoQzPwkNpZFH2x1gQKWISBagE5nrXrtiz2+j9
         OY8FRRhwrBHLz0Lx6XtaFp/wfZN365hnSktRJHQu/NK7fwu5+B6dyNMPX/cqxQByNETc
         4eHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject;
        bh=gUzKvOr7Z5g/MXOmdFdr89Bw1J4SdEZtO//k9XLhp40=;
        b=WjdXuWJVtW8wQ0kl6Z8D/B1BcocaSMs5sgAuMONIoPJgfJl8l+XKhDInuPiQaTYLSM
         rHxIUBA66Py5dPmLzNT7NOVqEL8crmXQBLfOJBezYnqbVxkpBAFtE9R/NSzjIGLsRJ89
         zJB1SoYM5EYE5UnUaVAzNt1RV6bZ0hXdJnk/Uj4UJgSwEg80dtoHRiVsBDegUXu9CX1l
         mZe7n7t43EIG7BE4BqseTSzBUkLfwmGWC4VYkLrfp+hLmVX+nQQHooZYr/avVv1o8SXd
         ZeN3U/gr91sAUwLDSfmM1MHLK83slED+2m5WjWdg62TP9K+pPmjrM6ms6MJxM6Ip3MXa
         yAWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v90si13024226ybi.36.2021.04.18.14.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Apr 2021 14:50:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYFJL-0007ck-Ld
	for alex.bennee@linaro.org; Sun, 18 Apr 2021 17:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steve@freyder.net>) id 1lYFJ6-0007cb-Iq
 for qemu-arm@nongnu.org; Sun, 18 Apr 2021 17:50:20 -0400
Received: from mailman.freyder.net ([45.27.155.9]:43750)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steve@freyder.net>) id 1lYFJ1-0006DQ-UE
 for qemu-arm@nongnu.org; Sun, 18 Apr 2021 17:50:18 -0400
Received: from mailgate.local.freyder.com (mailgate [192.168.1.207])
 by mailman.freyder.net (Postfix) with ESMTP id 779266601A6;
 Sun, 18 Apr 2021 16:50:13 -0500 (CDT)
Received: from mailgate.local.freyder.com (localhost.localdomain [127.0.0.1])
 by mailgate.local.freyder.com (Proxmox) with ESMTP id 6B8D281133;
 Sun, 18 Apr 2021 16:50:13 -0500 (CDT)
Received: from kungpow.freyder.net (kungpow [192.168.1.204])
 by mailgate.local.freyder.com (Proxmox) with ESMTP id 55B42801BC;
 Sun, 18 Apr 2021 16:50:13 -0500 (CDT)
Received: from [127.0.0.1] (kungpow.freyder.net [192.168.1.204])
 by kungpow.freyder.net (Postfix) with ESMTP id 2B227440341;
 Sun, 18 Apr 2021 16:50:13 -0500 (CDT)
Subject: Re: Emulation of armv7+e1000e+/dev/sda or /dev/mmcblk0 devices
To: Peter Maydell <peter.maydell@linaro.org>
References: <b5aa5292-5088-fb31-24b4-c8fc202413fd@freyder.net>
 <CAFEAcA_cm2diBGVwLvXGrSLb5ATXN++sbGQWcQ8wknDjtUiVhA@mail.gmail.com>
From: steve freyder <steve@freyder.net>
Message-ID: <cacc92ad-5544-7e88-674f-80a57a9e1a5b@freyder.net>
Date: Sun, 18 Apr 2021 16:50:11 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_cm2diBGVwLvXGrSLb5ATXN++sbGQWcQ8wknDjtUiVhA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------AA33B5CF1F8F12B811AA56C2"
Content-Language: en-US
Received-SPF: pass client-ip=45.27.155.9; envelope-from=steve@freyder.net;
 helo=mailman.freyder.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm list <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 14KD4EMjH+7a

This is a multi-part message in MIME format.
--------------AA33B5CF1F8F12B811AA56C2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/18/2021 7:48 AM, Peter Maydell wrote:
> On Sun, 18 Apr 2021 at 02:42, steve freyder <steve@freyder.net> wrote:
>> I'm a new qemu-arm list member and looking to get an emulation of an
>> armv7 processor with a PCI bus, supporting an e1000e NIC, and some form
>> of storage device preferably SATA and [e]MMC - I have an iMX6 SOM custom
>> board with an e1000e on the carrier board via PCI that I'm attempting to
>> approximate.  I want to boot U-Boot (I've built U-Boot 5.2 with support
>> for MMC, SATA, and e100e networking).  I have the "virt" machine able to
>> boot U-Boot and see the e1000e, but I have found nothing that allows the
>> booted U-Boot see any MMC or SATA devices.  All attempts to use -sd, or
>> -drive to create some kind of MMC/SATA device have failed with what
>> appear to be (as I have been able to understand) the standard reasons,
>> missing busses, missing properties, etc, etc. A majority of searches
>> result in documentation from developers that's 5-10 or more years old,
>> so I'm hard-pressed to determine whether this is my own lack of
>> knowledge (probably YES), or whether I'm simply looking at stuff that's
>> been overcome by events.
> You have a couple of options:
>   (1) if one of the existing iMX6 board models (like sabrelite)
>       has enough of the devices that you need, you could use that
>   (2) you could use the 'virt' board. You don't say what command line
>       you've been trying, but it sounds to me like the problem is that
>       you aren't passing the command line options to either:
>        * use a virtio blk device (this is usually good if you just want
>          "some kind of disk storage"; u-boot should support virtio-blk
>          over pci, but I don't know if it's compiled in by default)
>        * provide a PCI emulation of some kind of disk controller
>          (eg scsi, ahci) as well as an emulation of the disk itself.
> Using a -drive option alone is sort of like asking to emulate "a board,
> and a disk drive on the table next to it, but not actually plugged into
> anything" :-)
>
> The upstream 'u-boot' has support for a qemu-arm board type which
> is documented to work on the 'virt' board and to support SATA disks
> via AHCI, including the command line options to set that up:
>
> https://github.com/u-boot/u-boot/blob/4f48163201f991de6d4a31b1c98a79e19971f57f/doc/board/emulation/qemu-arm.rst
>
> Have you tried those? If they don't work, what is the error that
> QEMU reports?
>
> thanks
> -- PMM
>
Peter, thanks for the quick response, I'm doing what you said and that's 
working much better, here's what I have now:

./qemu-system-arm -machine virt -bios u-boot.bin -nographic \
     -drive  if=pflash,format=raw,index=1,file=envstore.img  \
     -drive  if=none,format=raw,file=disk.img,id=mydisk -device 
ich9-ahci,id=ahci \
     -device ide-hd,drive=mydisk,bus=ahci.0 \
     -netdev user,id=net0 -device e1000,netdev=net0 \
     -device usb-ehci,id=ehci

I started with the example, got some errors about format on the disk.img 
and that ide-drive was unknown, so I added the ",format=raw" for 
disk.img, and changed what was originally "ide-drive" to "ide-hd".

This gets u-boot booted (excellent!), and it seems to be able to read 
the MAC from the E1000, and it's able to read and write the environment 
flash in "envstore.img".  When I go to access the SATA, (sata init) 
u-boot appears to be attempting to do so, but then a reset occurs:


U-Boot 2021.04-00640-g3f2e3c7845 (Apr 17 2021 - 19:34:25 +0000)

DRAM:  128 MiB
Flash: 64 MiB
MMC:
Loading Environment from Flash... OK
In:    serial
Out:   serial
Err:   serial
Net:   e1000: 52:54:00:12:34:56
        eth0: e1000#0
Hit any key to stop autoboot:  0
=> sata init
Target spinup took 0 ms.
SATA link 1 timeout.
SATA link 2 timeout.
SATA link 3 timeout.
SATA link 4 timeout.
SATA link 5 timeout.
AHCI 0001.0000 32 slots 6 ports 1.5 Gbps 0x3f impl SATA mode
flags: 64bit ncq only
prefetch abort
pc : [<e59ff010>]          lr : [<47f5853c>]
reloc pc : [<9dab7010>]    lr : [<0001053c>]
sp : 46e07d60  ip : 00000000     fp : 47f6be2c
r10: 00000002  r9 : 46f07ec0     r8 : 47fe5cc0
r7 : 46f0a190  r6 : 00000000     r5 : 47fe3dd8  r4 : 00000000
r3 : e59ff014  r2 : 00000002     r1 : 00000000  r0 : 46f09378
Flags: NzCv  IRQs off  FIQs off  Mode SVC_32
Code: data abort
pc : [<47f4a14c>]          lr : [<47f4a138>]
reloc pc : [<0000214c>]    lr : [<00002138>]
sp : 46e07c70  ip : 47fdb961     fp : 47f6be2c
r10: 00000002  r9 : 46f07ec0     r8 : 47fe5cc0
r7 : 47fd5ac2  r6 : 47fd5aca     r5 : e59ff010  r4 : fffffffc
r3 : 09000000  r2 : 46f08eb0     r1 : 00000000  r0 : 00000006
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32
Code: e59f706c e59f606c e3c55003 e3540000 (e7952104)
Resetting CPU ...

resetting ...

U-Boot 2021.04-00640-g3f2e3c7845 (Apr 17 2021 - 19:34:25 +0000)


My physical board's u-boot outputs this when I do "sata init":


U-Boot> sata init

AHCI 0001.0300 32 slots 1 ports 3 Gbps 0x1 impl SATA mode
flags: ncq stag pm led clo only pmp pio slum part

So I'm thinking the timeouts are probably understandable and then the 
"prefetch abort" and "data abort" with those accompanying register dumps 
must be coming from QEMU perhaps because of some device register 
accesses that u-boot performed during its sata init processing, is that 
a reasonable interpretation?


Thanks Peter, this is very encouraging!

Steve



--------------AA33B5CF1F8F12B811AA56C2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/18/2021 7:48 AM, Peter Maydell
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFEAcA_cm2diBGVwLvXGrSLb5ATXN++sbGQWcQ8wknDjtUiVhA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Sun, 18 Apr 2021 at 02:42, steve freyder <a class="moz-txt-link-rfc2396E" href="mailto:steve@freyder.net">&lt;steve@freyder.net&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I'm a new qemu-arm list member and looking to get an emulation of an
armv7 processor with a PCI bus, supporting an e1000e NIC, and some form
of storage device preferably SATA and [e]MMC - I have an iMX6 SOM custom
board with an e1000e on the carrier board via PCI that I'm attempting to
approximate.  I want to boot U-Boot (I've built U-Boot 5.2 with support
for MMC, SATA, and e100e networking).  I have the "virt" machine able to
boot U-Boot and see the e1000e, but I have found nothing that allows the
booted U-Boot see any MMC or SATA devices.  All attempts to use -sd, or
-drive to create some kind of MMC/SATA device have failed with what
appear to be (as I have been able to understand) the standard reasons,
missing busses, missing properties, etc, etc. A majority of searches
result in documentation from developers that's 5-10 or more years old,
so I'm hard-pressed to determine whether this is my own lack of
knowledge (probably YES), or whether I'm simply looking at stuff that's
been overcome by events.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You have a couple of options:
 (1) if one of the existing iMX6 board models (like sabrelite)
     has enough of the devices that you need, you could use that
 (2) you could use the 'virt' board. You don't say what command line
     you've been trying, but it sounds to me like the problem is that
     you aren't passing the command line options to either:
      * use a virtio blk device (this is usually good if you just want
        "some kind of disk storage"; u-boot should support virtio-blk
        over pci, but I don't know if it's compiled in by default)
      * provide a PCI emulation of some kind of disk controller
        (eg scsi, ahci) as well as an emulation of the disk itself.
Using a -drive option alone is sort of like asking to emulate "a board,
and a disk drive on the table next to it, but not actually plugged into
anything" :-)

The upstream 'u-boot' has support for a qemu-arm board type which
is documented to work on the 'virt' board and to support SATA disks
via AHCI, including the command line options to set that up:

<a class="moz-txt-link-freetext" href="https://github.com/u-boot/u-boot/blob/4f48163201f991de6d4a31b1c98a79e19971f57f/doc/board/emulation/qemu-arm.rst">https://github.com/u-boot/u-boot/blob/4f48163201f991de6d4a31b1c98a79e19971f57f/doc/board/emulation/qemu-arm.rst</a>

Have you tried those? If they don't work, what is the error that
QEMU reports?

thanks
-- PMM

</pre>
    </blockquote>
    <p><font face="Courier New, Courier, monospace">Peter, thanks for
        the quick response, I'm doing what you said and that's working
        much better, here's what I have now:</font></p>
    <p><font face="Courier New, Courier, monospace">./qemu-system-arm
        -machine virt -bios u-boot.bin -nographic \<br>
            -drive  if=pflash,format=raw,index=1,file=envstore.img  \<br>
            -drive  if=none,format=raw,file=disk.img,id=mydisk -device
        ich9-ahci,id=ahci \<br>
            -device ide-hd,drive=mydisk,bus=ahci.0 \<br>
            -netdev user,id=net0 -device e1000,netdev=net0 \<br>
            -device usb-ehci,id=ehci<br>
        <br>
      </font></p>
    <p><font face="Courier New, Courier, monospace">I started with the
        example, got some errors about format on the disk.img and that
        ide-drive was unknown, so I added the ",format=raw" for
        disk.img, and changed what was originally "ide-drive" to
        "ide-hd".<br>
      </font></p>
    <p><font face="Courier New, Courier, monospace">This gets u-boot
        booted (excellent!), and it seems to be able to read the MAC
        from the E1000, and it's able to read and write the environment
        flash in "envstore.img".  When I go to access the SATA, (sata
        init) u-boot appears to be attempting to do so, but then a reset
        occurs:</font></p>
    <p><font face="Courier New, Courier, monospace"><br>
      </font></p>
    <p><font face="Courier New, Courier, monospace">U-Boot
        2021.04-00640-g3f2e3c7845 (Apr 17 2021 - 19:34:25 +0000)<br>
        <br>
        DRAM:  128 MiB<br>
        Flash: 64 MiB<br>
        MMC:<br>
        Loading Environment from Flash... OK<br>
        In:    serial<br>
        Out:   serial<br>
        Err:   serial<br>
        Net:   e1000: 52:54:00:12:34:56<br>
               eth0: e1000#0<br>
        Hit any key to stop autoboot:  0<br>
        =&gt; sata init<br>
        Target spinup took 0 ms.<br>
        SATA link 1 timeout.<br>
        SATA link 2 timeout.<br>
        SATA link 3 timeout.<br>
        SATA link 4 timeout.<br>
        SATA link 5 timeout.<br>
        AHCI 0001.0000 32 slots 6 ports 1.5 Gbps 0x3f impl SATA mode<br>
        flags: 64bit ncq only<br>
        prefetch abort<br>
        pc : [&lt;e59ff010&gt;]          lr : [&lt;47f5853c&gt;]<br>
        reloc pc : [&lt;9dab7010&gt;]    lr : [&lt;0001053c&gt;]<br>
        sp : 46e07d60  ip : 00000000     fp : 47f6be2c<br>
        r10: 00000002  r9 : 46f07ec0     r8 : 47fe5cc0<br>
        r7 : 46f0a190  r6 : 00000000     r5 : 47fe3dd8  r4 : 00000000<br>
        r3 : e59ff014  r2 : 00000002     r1 : 00000000  r0 : 46f09378<br>
        Flags: NzCv  IRQs off  FIQs off  Mode SVC_32<br>
        Code: data abort<br>
        pc : [&lt;47f4a14c&gt;]          lr : [&lt;47f4a138&gt;]<br>
        reloc pc : [&lt;0000214c&gt;]    lr : [&lt;00002138&gt;]<br>
        sp : 46e07c70  ip : 47fdb961     fp : 47f6be2c<br>
        r10: 00000002  r9 : 46f07ec0     r8 : 47fe5cc0<br>
        r7 : 47fd5ac2  r6 : 47fd5aca     r5 : e59ff010  r4 : fffffffc<br>
        r3 : 09000000  r2 : 46f08eb0     r1 : 00000000  r0 : 00000006<br>
        Flags: NzCv  IRQs on  FIQs on  Mode SVC_32<br>
        Code: e59f706c e59f606c e3c55003 e3540000 (e7952104)<br>
        Resetting CPU ...<br>
        <br>
        resetting ...<br>
        <br>
        U-Boot 2021.04-00640-g3f2e3c7845 (Apr 17 2021 - 19:34:25 +0000)</font></p>
    <p><font face="Courier New, Courier, monospace"><br>
      </font></p>
    <p><font face="Courier New, Courier, monospace">My physical board's
        u-boot outputs this when I do "sata init":</font></p>
    <p><font face="Courier New, Courier, monospace"><br>
      </font></p>
    <p><font face="Courier New, Courier, monospace">U-Boot&gt; sata init</font></p>
    <p><font face="Courier New, Courier, monospace">AHCI 0001.0300 32
        slots 1 ports 3 Gbps 0x1 impl SATA mode<br>
        flags: ncq stag pm led clo only pmp pio slum part</font></p>
    <p><font face="Courier New, Courier, monospace">So I'm thinking the
        timeouts are probably understandable and then the "prefetch
        abort" and "data abort" with those accompanying register dumps
        must be coming from QEMU perhaps because of some device register
        accesses that u-boot performed during its sata init processing,
        is that a reasonable interpretation?</font></p>
    <p><font face="Courier New, Courier, monospace"><br>
      </font></p>
    <p><font face="Courier New, Courier, monospace">Thanks Peter, this
        is very encouraging!</font></p>
    <p><font face="Courier New, Courier, monospace">Steve</font></p>
    <p><font face="Courier New, Courier, monospace"><br>
      </font></p>
  </body>
</html>

--------------AA33B5CF1F8F12B811AA56C2--

