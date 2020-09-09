Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp250429lfq;
        Wed, 9 Sep 2020 02:11:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj0G0oqTtKRU67tI++INqDX1TTB6/cR5WGT7ZEudQql6PPpRtJayd+azRLTjm1SCYTB3EL
X-Received: by 2002:a25:586:: with SMTP id 128mr4331997ybf.484.1599642660470;
        Wed, 09 Sep 2020 02:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599642660; cv=none;
        d=google.com; s=arc-20160816;
        b=FDiMYUWgKw9q1rlHAzc9XaCLo3vg+9U4rlJWNUbTdQ0bCFFMUDv9Oc4AXeKR4vKrJ7
         4gc+CHRJrAYGsnglbsg6V44/mvWoCxuEyiMzUh3oTaxj4mSViPTCfka18FS7d5D8Cgeg
         HTzJg7DFjyeagQIMqJRRqBWyPiaLEifkWHnPNp4RXUyOa0vBGWVnvshMGHLRHjB4j8Jh
         dwsFiuLdXS0kWpUHKzr3J6eQDtpSe4QVxIyehDOiee51TI5YD59voWue9kLrcB0OA+3E
         RKIJ6H+aEw37GnlDtRA3dxe9zg33LGUcMdvfJtXhDdG0v2VSJRPujV7E1vx21tvGyeBo
         l+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=ZoaBmQuq3e1glWPV4O7HDAB04OT4Z6WPDaR+P4B/4Nk=;
        b=nyhVyZcUHuqP1iFjh3B8kCufkU0wKqsxLRdOPcnXHjESa/tsI7ELBeHnlRLFOxLY0j
         VwLtvTWGRghJ42n9N1sxdwemE7nyfinMtJbnR3iyre9gvGT06iBpO4zP6LddG4D1ov9G
         MGq4QJCqiWxGqep2fQEQfPwO0ELxvch9c0vOaZaiWvTjNDngEMtAajkg5jgpIl3NWQQ3
         q+3S6OIMKo/eX2Z+K2VNyH11zS5ZRpROuWXJ1KLq2ZfENGrQj5Ragewcu94xETjUkxNC
         51MvOUX+gW/k2sVrb4woXklYE4PUwy0+J53AI7YVk9MtaEEh9o1onXAXuMu7eXpkVaoF
         rMgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Or+4dQw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8si2384596ybb.412.2020.09.09.02.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 02:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Or+4dQw2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFw83-0004tj-Sj
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 05:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFw7w-0004sl-48
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 05:10:52 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:50762
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kFw7t-0003Hr-Fr
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 05:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599642648;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZoaBmQuq3e1glWPV4O7HDAB04OT4Z6WPDaR+P4B/4Nk=;
 b=Or+4dQw2FeoJKZpj1GEt8DwbyRSjptid+v1oNwV525vCu9k8fe7yxuEhBBsI4UmrmjRYSD
 2/G3K1oD/frfx6EwTFb2A4Nyp6fxJaMfECWzE8uEat91laJ/ee/H0wkJOVjF6rvmaiLOzt
 Ha4a1eyTqQbmySb2s7Ho+fRn0BQki2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-cOgMueI5NX6ftvv3qcJfnQ-1; Wed, 09 Sep 2020 05:10:44 -0400
X-MC-Unique: cOgMueI5NX6ftvv3qcJfnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4622F18BA285;
 Wed,  9 Sep 2020 09:10:43 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.ams2.redhat.com [10.36.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78E8C838AE;
 Wed,  9 Sep 2020 09:10:37 +0000 (UTC)
Date: Wed, 9 Sep 2020 10:10:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH 1/5] hw/smbios: support loading OEM strings values from a
 file
Message-ID: <20200909091034.GL1011023@redhat.com>
References: <20200908165438.1008942-1-berrange@redhat.com>
 <20200908165438.1008942-2-berrange@redhat.com>
 <c7ecee55-64a3-5a46-26d9-6a1cc4c7889c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c7ecee55-64a3-5a46-26d9-6a1cc4c7889c@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:20:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PLpJATr1z/T3

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Sep 09, 2020 at 10:18:47AM +0200, Laszlo Ersek wrote:
> On 09/08/20 18:54, Daniel P. Berrangé wrote:
> > Some applications want to pass quite large values for the OEM strings
> > entries. Rather than having huge strings on the command line, it would
> > be better to load them from a file, as supported with -fw_cfg.
> > 
> > This introduces the "valuefile" parameter allowing for:
> > 
> >   $ echo -n "thisthing" > mydata.txt
> >   $ qemu-system-x86_64 \
> >     -smbios type=11,value=something \
> >     -smbios type=11,valuefile=mydata.txt \
> >     -smbios type=11,value=somemore \
> >     ...other args...
> > 
> > Now in the guest
> > 
> > $ dmidecide -t 11
> > Getting SMBIOS data from sysfs.
> > SMBIOS 2.8 present.
> > 
> > Handle 0x0E00, DMI type 11, 5 bytes
> > OEM Strings
> > 	String 1: something
> > 	String 2: thisthing
> > 	String 3: somemore
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  hw/smbios/smbios.c | 72 +++++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 59 insertions(+), 13 deletions(-)
> 
> (gearing up to test this / look into the edk2 problem, just one question
> in passing: could we / would we simplify this with g_file_get_contents()?)

BTW, to test this, I'm doing the following.

See the attached 'make-tiny-initrd.py' script. It expects "busybox" on
the host OS and builds a tiny initrd containing busybox.

It can optionally copy in arbitrary other commands, and shared libraries
they link to.  By default it will launch an interactive shell in the
guest, but you can tell it to run a specific command, after which it
will poweroff.

I want to run dmidecode, so I'm using

 $ make-tiny-image.py --run "dmidecode" dmidecode

which both copies dmidecode into the initrd, and also runs it by
default.

It creates 'tiny-initrd.img'

Then I simply boot the host OS kernel using this initrd.


  ./build/qemu-system-x86_64  \
      -kernel /boot/vmlinuz-5.7.14-200.fc32.x86_64 \
      -initrd tiny-initrd.img
      -append 'console=ttyS0'
      -m 1000
      -serial stdio
      -display none
      -blockdev '{"driver":"file","filename":"/usr/share/OVMF/OVMF_CODE.fd","node-name":"libvirt-pflash0-storage","auto-read-only":true,"discard":"unmap"}'
      -blockdev '{"node-name":"libvirt-pflash0-format","read-only":true,"driver":"raw","file":"libvirt-pflash0-storage"}'
      -blockdev '{"driver":"file","filename":"/home/berrange/src/virt/qemu/OVMF_VARS.fd","node-name":"libvirt-pflash1-storage","auto-read-only":true,"discard":"unmap"}'
      -blockdev '{"node-name":"libvirt-pflash1-format","read-only":false,"driver":"raw","file":"libvirt-pflash1-storage"}'
      -machine pc-q35-4.0,accel=kvm,usb=off,smm=on,dump-guest-core=off,pflash0=libvirt-pflash0-format,pflash1=libvirt-pflash1-format,smbios-ep=3_0
      -chardev file,path=firmware.log,id=firmwarelog
      -device isa-debugcon,iobase=0x402,chardev=firmwarelog
      -smbios type=11,path=smallfile.txt


I have a file 'bigfile.txt' that contains 14 MB of plain text.

I then create 'smallfile.txt' from this

  $ dd if=bigfile.txt of=littlefile.txt bs=1 count=130863

If count=130863 or smaller than EDK2 succesfully boots the guest.

If count=130864 or larger then AFAICT it gets stuck in EDK2 or
very early boot - the guest OS never runs.

If smbios-ep=2_1 (or is omitted), then the size limit is smaller of course
but QEMU validates that for you.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="make-tiny-image.py"

#!/usr/bin/env python3

import re
import sys
import glob
import argparse
import os
import os.path
import stat
import subprocess
from tempfile import TemporaryDirectory
from shutil import copy

def make_busybox(tmpdir, runcmd):
    usrsbin = os.path.join(tmpdir, "usr/sbin")
    bin = os.path.join(tmpdir, "bin")
    os.makedirs(usrsbin, exist_ok=True)
    os.makedirs(bin, exist_ok=True)

    busyboxin = "/usr/sbin/busybox"
    busyboxout = os.path.join(tmpdir, usrsbin, "busybox")
    copy(busyboxin, busyboxout)
    subprocess.check_call([busyboxin, "--install", "-s", bin])

    init = os.path.join(tmpdir, "init")
    with open(init, "w") as fh:
        print("""#!/bin/sh

mkdir /proc /sys
mount -t proc none /proc
mount -t sysfs none /sys

mount -n -t tmpfs none /dev
mknod -m 622 /dev/console c 5 1
mknod -m 666 /dev/null c 1 3
mknod -m 666 /dev/zero c 1 5
mknod -m 666 /dev/ptmx c 5 2
mknod -m 666 /dev/tty c 5 0
mknod -m 666 /dev/ttyS0 c 4 64
mknod -m 444 /dev/random c 1 8
mknod -m 444 /dev/urandom c 1 9

%s
poweroff -f
""" % runcmd, file=fh)
    os.chmod(init, stat.S_IRWXU)

def get_deps(binary):
    out = subprocess.check_output(["ldd", binary]).decode("utf8")
    deps = []
    for line in out.split("\n"):
        m = re.search("=> (/[^ ]+)", line)
        if m is not None:
            deps.append(m.group(1))
        else:
            m = re.match("\s*(/[^ ]+)\s+\(.*\)\s*$", line)
            if m is not None:
                deps.append(m.group(1))
    return deps
    
def make_binaries(tmpdir, binaries):
    bindir = os.path.join(tmpdir, "bin")

    seen = {}
    libs = []
    for binary in binaries:
        if binary[0] == '/':
            src = binary
            dst = os.path.join(tmpdir, binary[1:])
        else:
            src = os.path.join("/usr/bin", binary)
            if not os.path.exists(src):
                src = os.path.join("/usr/sbin", binary)
            dst = os.path.join(bindir, binary)
        if os.path.exists(dst):
            os.unlink(dst)
        copy(src, dst)

        libs.extend(get_deps(src))

    while len(libs):
        print("Pass libs")
        todo = libs
        libs = []
        for lib in todo:
            if lib in seen:
                continue

            dir = os.path.dirname(lib)
            libdir = os.path.join(tmpdir, dir[1:])
            os.makedirs(libdir, exist_ok=True)
            dst = os.path.join(tmpdir, lib[1:])
            copy(lib, dst)
            print(lib)
            seen[lib] = True
            libs.extend(get_deps(lib))

                              

def make_image(tmpdir, output, binaries, runcmd):
    make_busybox(tmpdir, runcmd)
    make_binaries(tmpdir, binaries)

    files = glob.iglob(tmpdir + "/**", recursive=True)
    prefix=len(tmpdir) + 1
    files = [f[prefix:] for f in files]
    files = files[1:]
    filelist = "\n".join(files).encode("utf8")

    with open(output, "w") as fh:
        subprocess.run(["cpio", "--quiet", "-o", "-H", "newc"],
                       cwd=tmpdir, input=filelist, stdout=fh)

parser = argparse.ArgumentParser(description='Build a tiny initrd image')
parser.add_argument('--output', default="tiny-initrd.img",
                    help='Filename of output file')
parser.add_argument('--run', default="exec setsid cttyhack /bin/sh",
                    help='Command to execute in guest (default: "exec setsid cttyhack /bin/sh")')
parser.add_argument('binary', nargs="*",
                    help='List of binaries to include')

args = parser.parse_args()

print (args.output)

with TemporaryDirectory(prefix="make-tiny-image") as tmpdir:
    make_image(tmpdir, args.output, args.binary, args.run)

--UlVJffcvxoiEqYs2--

