Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2774341lfj;
        Wed, 12 Jan 2022 15:27:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyrQhI2XZOpM2o/5PI7wxWPusRwJ5q3YFXeGlqAtWePgthLRV1tE5sPPHExN/rdYd6JBeE
X-Received: by 2002:a25:d085:: with SMTP id h127mr2568135ybg.323.1642030041584;
        Wed, 12 Jan 2022 15:27:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642030041; cv=none;
        d=google.com; s=arc-20160816;
        b=xHmE+MTbOKyALs2Gi/Pck9BatEfZi6HzCij4Xkmjing3B6jmLi+KUZRd9l1r4PHGRg
         CBSmJ1KfxZE3z5nBOt8xlcZO5PMCOhXYDDF87OXEZ0ECCbk0ozi68pc2+KxyPEjC2crp
         Bf7zHgICAohp0fnEnbt1WEPAkCxnbo0YusBiF4AYDpTyYrDWaU3Z6fXfcdDSaxWVRKG+
         izy0TujxW++BYibYCVctq2hKZ5FoLijwrJZ6rAivjB0xDM3WwfgaOxPo8ePgCU07bMIV
         PHsHAGN+mGtaWLgMvvMh6Nix1Jiy0jkFKl58KiF8+bLfxqcZ5p1xw9ShNrGcnu8IFGWr
         uf+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :dkim-signature:dkim-signature;
        bh=xKbYPG7d/Rm1sy+eNUgdKm5+5wr6EUyI8v9DnqUE/YY=;
        b=HqfDCJP7o+SmuR3zxBZBlo+cxrS5MhONGyP94LUfj2iiHjGhi2hoUkaYnRuiEAAmDP
         Z4pBRIGHfyYFadauIveN5VEn+nvdO/c0q3zRNKM/IiR+VzAgpYNcvRiC8xQNL/ToBfSp
         kc5PQSXgd5m45kryRfGRAhAualCkTZBZTslMmGdQj9SrFvIv0NO8dmTRGdvflEBfqEy9
         yXsWvdM4eJXsipk5YhcSsOelGUfDdPn2L6CZTAldV4Xv5txJ6tQAZpIs8e7OiIX1LU/4
         1CixJJtrh5C2+/RMADjLJxoS7cv0GzitEG3Jp1l331vl4OkjacF19P5i75BfIh+2UEpK
         KWDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nrl.navy.mil header.s=s2.dkim header.b=ppMkQe3X;
       dkim=pass header.i=@nrl.navy.mil header.s=s1.dkim header.b=MhBzkGJl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cmf.nrl.navy.mil
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si1048218ybg.444.2022.01.12.15.27.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jan 2022 15:27:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nrl.navy.mil header.s=s2.dkim header.b=ppMkQe3X;
       dkim=pass header.i=@nrl.navy.mil header.s=s1.dkim header.b=MhBzkGJl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cmf.nrl.navy.mil
Received: from localhost ([::1]:57744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7n1T-0002Xw-9A
	for alex.bennee@linaro.org; Wed, 12 Jan 2022 18:27:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olagarde@cmf.nrl.navy.mil>)
 id 1n7n0Y-0002Xn-Bp
 for qemu-arm@nongnu.org; Wed, 12 Jan 2022 18:26:22 -0500
Received: from [2001:480:a0:f003::234] (port=33668 helo=mfe.dren.mil)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olagarde@cmf.nrl.navy.mil>)
 id 1n7n0S-0004SY-Oj
 for qemu-arm@nongnu.org; Wed, 12 Jan 2022 18:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nrl.navy.mil;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=s2.dkim; bh=xKbYPG7d/Rm1sy+eNUgdKm5+5wr6EUyI8v9DnqUE/YY=;
 b=ppMkQe3XrKDXNSfxXZg2rGAVHnxC2UUbLNtJ2/P/b1cSSrvJx+hbbbcdQeHcNN2bWwPJ
 d5xXAUnwIJ5EofZd99VAmFWCorGgaaQu2U2eITnbL/CfrgmpD60qIRRBs6gM5YHYwMnp
 kHcxnKrx+S4k6taUYCafp4tSwLeBde7Im8rhiTClZkv20uIzBp08N0DetLZqm8odyTMA
 IZMH180Q0Wbmdq3hAowcyCxvGPUOq9KaVq4BnEvjs0Nmpb/42JVRX77j6tgbkRV4qasd
 GuUzVfVcOrWItXcLq2e2Dzl2xXq370btfJM1JuDYGEpXiQ8UtGt+EiNfX8X8aU/lxqBf lQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nrl.navy.mil;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=s1.dkim; bh=xKbYPG7d/Rm1sy+eNUgdKm5+5wr6EUyI8v9DnqUE/YY=;
 b=MhBzkGJlgSiTBUe3Ty9jRdGEyChOesglK8g/tx71YxVSrvMpTBgE22FZ4/OYy3et3E1f
 p9d7eNNr4PaPKk8xFk9XGvqhdgh9DA1Cnels2wSmRTqTl7ieFttHI1EJjGQsUQv0HaI5
 wEtO72kfm+JfTO9qLeevrIdeBcIWlCsXwyk= 
Received: from hedwig.cmf.nrl.navy.mil (hedwig.cmf.nrl.navy.mil
 [134.207.12.163])
 by ppae.dren.mil (8.16.1.2/8.16.1.2) with ESMTP id 20CNQCra017316
 for <qemu-arm@nongnu.org>; Wed, 12 Jan 2022 23:26:13 GMT
Received: from Promethius.fios-router.home
 (pool-72-83-148-227.washdc.fios.verizon.net [72.83.148.227])
 (authenticated bits=0)
 by hedwig.cmf.nrl.navy.mil  with ESMTP id 20CNO566019272
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 12 Jan 2022 18:24:06 -0500
Subject: Re: virt-install on centos 7.9 not seeing qemu-aarch64?
To: qemu-arm@nongnu.org
References: <3e7106d0-7a0d-0482-9dae-42bcbd78aec8@cmf.nrl.navy.mil>
From: Owen LaGarde <olagarde@cmf.nrl.navy.mil>
Message-ID: <15b8ae91-7f6f-6213-dfc4-e47e314f3d4f@cmf.nrl.navy.mil>
Date: Wed, 12 Jan 2022 18:24:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <3e7106d0-7a0d-0482-9dae-42bcbd78aec8@cmf.nrl.navy.mil>
Content-Type: multipart/alternative;
 boundary="------------6FC03966E3C6EBF0F404FAE0"
Content-Language: en-US
X-NRLCMF-Spam-Score: () hits=0 User Authenticated
X-NRLCMF-Virus-Scanned: No virus found
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:480:a0:f003::234
 (failed)
Received-SPF: pass client-ip=2001:480:a0:f003::234;
 envelope-from=olagarde@cmf.nrl.navy.mil; helo=mfe.dren.mil
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YgwRei/KuHf2

This is a multi-part message in MIME format.
--------------6FC03966E3C6EBF0F404FAE0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry, confusing this with another post elsewhere ... meant to say 
"qemu-system-aarch" and "qemu-system-arm", not "qemu-aarch" and "qemu-arm".


On 1/12/22 6:32 AM, Owen LaGarde wrote:
>
> I think I've missed something in the support packages enabling 
> arch=aarch64 guests on a centos 7.9 host, such that virt-install won't 
> accept an arch of 'aarch64' or 'arm' where ubuntu works fine.
>
> I'm trying to create a Rocky 8 aarch64 guest on a centos 7.9 host, 
> coming from an ubuntu host.  I have this working on a minimal popos at 
> home just to verify I'm not insane.  The "real, at work" host does 
> have to be centos 7 x86_64 though it will be replaced with rocky 8 
> x86_64 "soon".  The kicker:  I'd very much prefer to use virt-install 
> because there's a large amount of pre-existing automation I'd have to 
> rewrite otherwise.  I see the arm and aarch64 support added by the 
> expected qemu-user (2.0.0-1.el7.6.x86_64) but virt-install won't use 
> it(?).
>
> Here's the process as currently written into the existing automation.  
> This works fine on the popos 21.10 minimal-plus-indicated-dpkgs, 
> shouldn't be any surprises here (yes, there's some extra garbage on 
> the centos side from my flailing about):
>
>     virt-install \
>         --connect qemu:///system \
>         --name apollo \
>         --metadata title=apollo \
>         --os-variant linux \
>         --vcpus 4 \
>         --ram 4096 \
>         --arch aarch64 \
>         --rng /dev/urandom \
>         --nonetwork \
>         --nographics \
>         --noautoconsole \
>         --controller type=scsi,model=virtio-scsi \
>         --disk pool=apollo,size=20,format=raw,bus=scsi \
>         --location /opt/kvm/media/Rocky-8.5-aarch64-dvd1.iso \
>         --initrd-inject /opt/kvm/kickstart/Rocky8.cfg \
>         --extra-args 'ks=file:/Rocky8.cfg console=ttyS0'
>
>     /opt/kvm/kickstart/Rocky8.cfg:
>         auth --enableshadow --passalgo=sha512
>         cdrom
>         text
>         cmdline
>         poweroff
>         firstboot --enable
>         ignoredisk --only-use=sda
>         keyboard --vckeymap=us --xlayouts='us'
>         lang en_US.UTF-8
>         eula --agreed
>         firewall --enabled --service ssh
>         services --disabled=kdump --enabled=sshd
>         selinux --enforcing
>         timezone America/New_York --isUtc
>         bootloader --location=mbr --boot-drive=sda
>         clearpart --drives=sda --all --initlabel
>         part /boot --fstype='xfs' --ondisk=sda --size=1024 --label=boot
>         part /boot/efi --fstype='efi' --ondisk=sda --size=1024
>     --fsoptions='umask=0077,shortname=winnt'
>         part pv.357 --fstype='lvmpv' --ondisk=sda --grow
>         volgroup centos --pesize=4096 pv.357
>         logvol /home --fstype='xfs' --size=1024 --label='home'
>     --name=home --vgname=centos
>         logvol /usr/local --fstype='xfs' --size=1024 --label='local'
>     --name=local --vgname=centos
>         logvol / --fstype='xfs' --size=4096 --label='root' --name=root
>     --vgname=centos
>         logvol /var --fstype='xfs' --size=4096 --label='var'
>     --name=var --vgname=centos
>         logvol /opt --fstype='xfs' --size=1024 --label='opt'
>     --name=opt --vgname=centos
>         logvol /var/log --fstype='xfs' --size=1024 --label='log'
>     --name=log --vgname=centos
>         logvol swap --fstype='swap' --size=1024 --name=swap
>     --vgname=centos
>         logvol /var/log/audit --fstype='xfs' --size=1024
>     --label='audit' --name=audit --vgname=centos
>         %packages
>         @base
>         @core
>         yum-utils
>         createrepo
>         pciutils
>         usbutils
>         net-tools
>         tcpdump
>         psmisc
>         %end
>         %addon com_redhat_kdump --disable --reserve-mb='auto'
>         %end
>         %anaconda
>         pwpolicy root --minlen=6 --minquality=1 --notstrict
>     --nochanges --notempty
>         pwpolicy user --minlen=6 --minquality=1 --notstrict
>     --nochanges --emptyok
>         pwpolicy luks --minlen=6 --minquality=1 --notstrict
>     --nochanges --notempty
>         %end
>
>     dpkg -l |egrep -i qemu\|libvirt\|aarch64 |awk '{print $2}' ## popos
>         gir1.2-libvirt-glib-1.0:amd64
>         ipxe-qemu
>         ipxe-qemu-256k-compat-efi-roms
>         libnss-libvirt:amd64
>         libsys-virt-perl
>         libvirt-clients
>         libvirt-daemon
>         libvirt-daemon-config-network
>         libvirt-daemon-config-nwfilter
>         libvirt-daemon-driver-qemu
>         libvirt-daemon-driver-storage-rbd
>         libvirt-daemon-system
>         libvirt-daemon-system-systemd
>         libvirt-glib-1.0-0:amd64
>         libvirt-glib-1.0-data
>         libvirt0:amd64
>         python3-libvirt
>         qemu
>         qemu-block-extra
>         qemu-efi-aarch64
>         qemu-efi-arm
>         qemu-kvm
>         qemu-system
>         qemu-system-arm
>         qemu-system-common
>         qemu-system-data
>         qemu-system-gui:amd64
>         qemu-system-mips
>         qemu-system-misc
>         qemu-system-ppc
>         qemu-system-s390x
>         qemu-system-sparc
>         qemu-system-x86
>         qemu-utils
>
>     rpm -qa |egrep -i qemu\|libvirt\|aarch64  ## centos
>         libvirt-gconfig-1.0.0-1.el7.x86_64
>         libvirt-bash-completion-4.5.0-36.el7_9.5.x86_64
>         qemu-system-arm-2.0.0-1.el7.6.x86_64
>     libvirt-daemon-driver-storage-logical-4.5.0-36.el7_9.5.x86_64
>         libvirt-daemon-driver-lxc-4.5.0-36.el7_9.5.x86_64
>         libvirt-python-4.5.0-1.el7.x86_64
>         qemu-common-2.0.0-1.el7.6.x86_64
>         qemu-system-lm32-2.0.0-1.el7.6.x86_64
>     libvirt-daemon-driver-storage-mpath-4.5.0-36.el7_9.5.x86_64
>         qemu-system-xtensa-2.0.0-1.el7.6.x86_64
>         libvirt-daemon-driver-nodedev-4.5.0-36.el7_9.5.x86_64
>         libvirt-4.5.0-36.el7_9.5.x86_64
>         qemu-system-alpha-2.0.0-1.el7.6.x86_64
>         libvirt-libs-4.5.0-36.el7_9.5.x86_64
>         libvirt-daemon-driver-storage-4.5.0-36.el7_9.5.x86_64
>         libvirt-lock-sanlock-4.5.0-36.el7_9.5.x86_64
>         qemu-guest-agent-2.12.0-3.el7.x86_64
>         qemu-system-or32-2.0.0-1.el7.6.x86_64
>         qemu-system-m68k-2.0.0-1.el7.6.x86_64
>     libvirt-daemon-driver-storage-core-4.5.0-36.el7_9.5.x86_64
>     libvirt-daemon-driver-storage-rbd-4.5.0-36.el7_9.5.x86_64
>         qemu-img-1.5.3-175.el7_9.5.x86_64
>         qemu-system-sh4-2.0.0-1.el7.6.x86_64
>     libvirt-daemon-driver-storage-scsi-4.5.0-36.el7_9.5.x86_64
>         libvirt-daemon-driver-network-4.5.0-36.el7_9.5.x86_64
>         libvirt-nss-4.5.0-36.el7_9.5.x86_64
>         qemu-kvm-common-1.5.3-175.el7_9.5.x86_64
>         qemu-system-unicore32-2.0.0-1.el7.6.x86_64
>         qemu-system-s390x-2.0.0-1.el7.6.x86_64
>     libvirt-daemon-driver-storage-iscsi-4.5.0-36.el7_9.5.x86_64
>         libvirt-daemon-config-network-4.5.0-36.el7_9.5.x86_64
>         python36-libvirt-4.5.0-1.el7.x86_64
>         qemu-system-cris-2.0.0-1.el7.6.x86_64
>         qemu-system-mips-2.0.0-1.el7.6.x86_64
>         libvirt-daemon-driver-nwfilter-4.5.0-36.el7_9.5.x86_64
>         libvirt-daemon-driver-secret-4.5.0-36.el7_9.5.x86_64
>         libvirt-daemon-driver-interface-4.5.0-36.el7_9.5.x86_64
>         libvirt-client-4.5.0-36.el7_9.5.x86_64
>         qemu-2.0.0-1.el7.6.x86_64
>         qemu-system-x86-2.0.0-1.el7.6.x86_64
>     libvirt-daemon-driver-storage-gluster-4.5.0-36.el7_9.5.x86_64
>         qemu-kvm-1.5.3-175.el7_9.5.x86_64
>         qemu-system-moxie-2.0.0-1.el7.6.x86_64
>         libvirt-daemon-4.5.0-36.el7_9.5.x86_64
>         libvirt-admin-4.5.0-36.el7_9.5.x86_64
>         qemu-user-2.0.0-1.el7.6.x86_64
>         libvirt-daemon-config-nwfilter-4.5.0-36.el7_9.5.x86_64
>         qemu-kvm-tools-1.5.3-175.el7_9.5.x86_64
>         ipxe-roms-qemu-20180825-3.git133f4c.el7.noarch
>         qemu-system-microblaze-2.0.0-1.el7.6.x86_64
>     libvirt-daemon-driver-storage-disk-4.5.0-36.el7_9.5.x86_64
>         libvirt-daemon-driver-qemu-4.5.0-36.el7_9.5.x86_64
>
> Packages added to the rpm side are the equivs of the dpkg side as far 
> as I'm aware and as numerous docs/blogs/etc imply.  The 
> /bin/qemu-{arm,aarch64} binaries are there, provided by the expected 
> qemu-user package (2.0.0-1.el7.6.x86_64).  But virt-install throws the 
> old "Host does not support any virtualization options for arch {arch}" 
> for any of the expected arch values (arm, arm64, aarch64, etc).  
> Obviously I've missed a support package on the centos side, but what?
>

--------------6FC03966E3C6EBF0F404FAE0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Sorry, confusing this with another post elsewhere ... meant to
      say "qemu-system-aarch" and "qemu-system-arm", not "qemu-aarch"
      and "qemu-arm".<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/12/22 6:32 AM, Owen LaGarde wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3e7106d0-7a0d-0482-9dae-42bcbd78aec8@cmf.nrl.navy.mil">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <p>I think I've missed something in the support packages enabling
        arch=aarch64 guests on a centos 7.9 host, such that virt-install
        won't accept an arch of 'aarch64' or 'arm' where ubuntu works
        fine.<br>
      </p>
      <p>I'm trying to create a Rocky 8 aarch64 guest on a centos 7.9
        host, coming from an ubuntu host.  I have this working on a
        minimal popos at home just to verify I'm not insane.  The "real,
        at work" host does have to be centos 7 x86_64 though it will be
        replaced with rocky 8 x86_64 "soon".  The kicker:  I'd very much
        prefer to use virt-install because there's a large amount of
        pre-existing automation I'd have to rewrite otherwise.  I see
        the arm and aarch64 support added by the expected qemu-user
        (2.0.0-1.el7.6.x86_64) but virt-install won't use it(?).</p>
      <p>Here's the process as currently written into the existing
        automation.  This works fine on the popos 21.10
        minimal-plus-indicated-dpkgs, shouldn't be any surprises here
        (yes, there's some extra garbage on the centos side from my
        flailing about):</p>
      <blockquote><font size="-1"><tt><font size="-1"><tt>virt-install \</tt></font><br>
            <font size="-1"><tt>    --connect qemu:///system \</tt></font><br>
            <font size="-1"><tt>    --name apollo \</tt></font><br>
            <font size="-1"><tt>    --metadata title=apollo \</tt></font><br>
            <font size="-1"><tt>    --os-variant linux \</tt></font><br>
            <font size="-1"><tt>    --vcpus 4 \</tt></font><br>
            <font size="-1"><tt>    --ram 4096 \</tt></font><br>
            <font size="-1"><tt>    --arch aarch64 \</tt></font><br>
            <font size="-1"><tt>    --rng /dev/urandom \</tt></font><br>
            <font size="-1"><tt>    --nonetwork \</tt></font><br>
            <font size="-1"><tt>    --nographics \</tt></font><br>
            <font size="-1"><tt>    --noautoconsole \</tt></font><br>
            <font size="-1"><tt>    --controller
                type=scsi,model=virtio-scsi \</tt></font><br>
            <font size="-1"><tt>    --disk
                pool=apollo,size=20,format=raw,bus=scsi \</tt></font><br>
            <font size="-1"><tt>    --location
                /opt/kvm/media/Rocky-8.5-aarch64-dvd1.iso \</tt></font><br>
            <font size="-1"><tt>    --initrd-inject
                /opt/kvm/kickstart/Rocky8.cfg \</tt></font><br>
            <font size="-1"><tt>    --extra-args 'ks=<a
                  class="moz-txt-link-freetext" href="file:/Rocky8.cfg"
                  moz-do-not-send="true">file:/Rocky8.cfg</a>
                console=ttyS0'<br>
                <br>
              </tt></font>/opt/kvm/kickstart/Rocky8.cfg:</tt></font><br>
        <font size="-1"><tt>    auth --enableshadow --passalgo=sha512</tt></font><br>
        <font size="-1"><tt>    cdrom</tt></font><br>
        <font size="-1"><tt>    text</tt></font><br>
        <font size="-1"><tt>    cmdline</tt></font><br>
        <font size="-1"><tt>    poweroff</tt></font><br>
        <font size="-1"><tt>    firstboot --enable</tt></font><br>
        <font size="-1"><tt>    ignoredisk --only-use=sda</tt></font><br>
        <font size="-1"><tt>    keyboard --vckeymap=us --xlayouts='us'</tt></font><br>
        <font size="-1"><tt>    lang en_US.UTF-8</tt></font><br>
        <font size="-1"><tt>    eula --agreed</tt></font><br>
        <font size="-1"><tt>    firewall --enabled --service ssh</tt></font><br>
        <font size="-1"><tt>    services --disabled=kdump --enabled=sshd</tt></font><br>
        <font size="-1"><tt>    selinux --enforcing</tt></font><br>
        <font size="-1"><tt>    timezone America/New_York --isUtc</tt></font><br>
        <font size="-1"><tt>    bootloader --location=mbr
            --boot-drive=sda</tt></font><br>
        <font size="-1"><tt>    clearpart --drives=sda --all --initlabel</tt></font><br>
        <font size="-1"><tt>    part /boot --fstype='xfs' --ondisk=sda
            --size=1024 --label=boot</tt></font><br>
        <font size="-1"><tt>    part /boot/efi --fstype='efi'
            --ondisk=sda --size=1024
            --fsoptions='umask=0077,shortname=winnt'</tt></font><br>
        <font size="-1"><tt>    part pv.357 --fstype='lvmpv'
            --ondisk=sda --grow</tt></font><br>
        <font size="-1"><tt>    volgroup centos --pesize=4096 pv.357</tt></font><br>
        <font size="-1"><tt>    logvol /home --fstype='xfs' --size=1024
            --label='home' --name=home --vgname=centos</tt></font><br>
        <font size="-1"><tt>    logvol /usr/local --fstype='xfs'
            --size=1024 --label='local' --name=local --vgname=centos</tt></font><br>
        <font size="-1"><tt>    logvol / --fstype='xfs' --size=4096
            --label='root' --name=root --vgname=centos</tt></font><br>
        <font size="-1"><tt>    logvol /var --fstype='xfs' --size=4096
            --label='var' --name=var --vgname=centos</tt></font><br>
        <font size="-1"><tt>    logvol /opt --fstype='xfs' --size=1024
            --label='opt' --name=opt --vgname=centos</tt></font><br>
        <font size="-1"><tt>    logvol /var/log --fstype='xfs'
            --size=1024 --label='log' --name=log --vgname=centos</tt></font><br>
        <font size="-1"><tt>    logvol swap --fstype='swap' --size=1024
            --name=swap --vgname=centos</tt></font><br>
        <font size="-1"><tt>    logvol /var/log/audit --fstype='xfs'
            --size=1024 --label='audit' --name=audit --vgname=centos</tt></font><br>
        <font size="-1"><tt>    %packages</tt></font><br>
        <font size="-1"><tt>    @base</tt></font><br>
        <font size="-1"><tt>    @core</tt></font><br>
        <font size="-1"><tt>    yum-utils</tt></font><br>
        <font size="-1"><tt>    createrepo</tt></font><br>
        <font size="-1"><tt>    pciutils</tt></font><br>
        <font size="-1"><tt>    usbutils</tt></font><br>
        <font size="-1"><tt>    net-tools</tt></font><br>
        <font size="-1"><tt>    tcpdump</tt></font><br>
        <font size="-1"><tt>    psmisc</tt></font><br>
        <font size="-1"><tt>    %end</tt></font><br>
        <font size="-1"><tt>    %addon com_redhat_kdump --disable
            --reserve-mb='auto'</tt></font><br>
        <font size="-1"><tt>    %end</tt></font><br>
        <font size="-1"><tt>    %anaconda</tt></font><br>
        <font size="-1"><tt>    pwpolicy root --minlen=6 --minquality=1
            --notstrict --nochanges --notempty</tt></font><br>
        <font size="-1"><tt>    pwpolicy user --minlen=6 --minquality=1
            --notstrict --nochanges --emptyok</tt></font><br>
        <font size="-1"><tt>    pwpolicy luks --minlen=6 --minquality=1
            --notstrict --nochanges --notempty</tt></font><br>
        <font size="-1"><tt>    %end<br>
            <br>
            dpkg -l |egrep -i qemu\|libvirt\|aarch64 |awk '{print $2}' 
            ## popos<br>
                gir1.2-libvirt-glib-1.0:amd64<br>
                ipxe-qemu<br>
                ipxe-qemu-256k-compat-efi-roms<br>
                libnss-libvirt:amd64<br>
                libsys-virt-perl<br>
                libvirt-clients<br>
                libvirt-daemon<br>
                libvirt-daemon-config-network<br>
                libvirt-daemon-config-nwfilter<br>
                libvirt-daemon-driver-qemu<br>
                libvirt-daemon-driver-storage-rbd<br>
                libvirt-daemon-system<br>
                libvirt-daemon-system-systemd<br>
                libvirt-glib-1.0-0:amd64<br>
                libvirt-glib-1.0-data<br>
                libvirt0:amd64<br>
                python3-libvirt<br>
                qemu<br>
                qemu-block-extra<br>
                qemu-efi-aarch64<br>
                qemu-efi-arm<br>
                qemu-kvm<br>
                qemu-system<br>
                qemu-system-arm<br>
                qemu-system-common<br>
                qemu-system-data<br>
                qemu-system-gui:amd64<br>
                qemu-system-mips<br>
                qemu-system-misc<br>
                qemu-system-ppc<br>
                qemu-system-s390x<br>
                qemu-system-sparc<br>
                qemu-system-x86<br>
                qemu-utils<br>
            <br>
            rpm -qa |egrep -i qemu\|libvirt\|aarch64  ## centos<br>
                libvirt-gconfig-1.0.0-1.el7.x86_64<br>
                libvirt-bash-completion-4.5.0-36.el7_9.5.x86_64<br>
                qemu-system-arm-2.0.0-1.el7.6.x86_64<br>
               
            libvirt-daemon-driver-storage-logical-4.5.0-36.el7_9.5.x86_64<br>
                libvirt-daemon-driver-lxc-4.5.0-36.el7_9.5.x86_64<br>
                libvirt-python-4.5.0-1.el7.x86_64<br>
                qemu-common-2.0.0-1.el7.6.x86_64<br>
                qemu-system-lm32-2.0.0-1.el7.6.x86_64<br>
               
            libvirt-daemon-driver-storage-mpath-4.5.0-36.el7_9.5.x86_64<br>
                qemu-system-xtensa-2.0.0-1.el7.6.x86_64<br>
                libvirt-daemon-driver-nodedev-4.5.0-36.el7_9.5.x86_64<br>
                libvirt-4.5.0-36.el7_9.5.x86_64<br>
                qemu-system-alpha-2.0.0-1.el7.6.x86_64<br>
                libvirt-libs-4.5.0-36.el7_9.5.x86_64<br>
                libvirt-daemon-driver-storage-4.5.0-36.el7_9.5.x86_64<br>
                libvirt-lock-sanlock-4.5.0-36.el7_9.5.x86_64<br>
                qemu-guest-agent-2.12.0-3.el7.x86_64<br>
                qemu-system-or32-2.0.0-1.el7.6.x86_64<br>
                qemu-system-m68k-2.0.0-1.el7.6.x86_64<br>
               
            libvirt-daemon-driver-storage-core-4.5.0-36.el7_9.5.x86_64<br>
               
            libvirt-daemon-driver-storage-rbd-4.5.0-36.el7_9.5.x86_64<br>
                qemu-img-1.5.3-175.el7_9.5.x86_64<br>
                qemu-system-sh4-2.0.0-1.el7.6.x86_64<br>
               
            libvirt-daemon-driver-storage-scsi-4.5.0-36.el7_9.5.x86_64<br>
                libvirt-daemon-driver-network-4.5.0-36.el7_9.5.x86_64<br>
                libvirt-nss-4.5.0-36.el7_9.5.x86_64<br>
                qemu-kvm-common-1.5.3-175.el7_9.5.x86_64<br>
                qemu-system-unicore32-2.0.0-1.el7.6.x86_64<br>
                qemu-system-s390x-2.0.0-1.el7.6.x86_64<br>
               
            libvirt-daemon-driver-storage-iscsi-4.5.0-36.el7_9.5.x86_64<br>
                libvirt-daemon-config-network-4.5.0-36.el7_9.5.x86_64<br>
                python36-libvirt-4.5.0-1.el7.x86_64<br>
                qemu-system-cris-2.0.0-1.el7.6.x86_64<br>
                qemu-system-mips-2.0.0-1.el7.6.x86_64<br>
                libvirt-daemon-driver-nwfilter-4.5.0-36.el7_9.5.x86_64<br>
                libvirt-daemon-driver-secret-4.5.0-36.el7_9.5.x86_64<br>
                libvirt-daemon-driver-interface-4.5.0-36.el7_9.5.x86_64<br>
                libvirt-client-4.5.0-36.el7_9.5.x86_64<br>
                qemu-2.0.0-1.el7.6.x86_64<br>
                qemu-system-x86-2.0.0-1.el7.6.x86_64<br>
               
            libvirt-daemon-driver-storage-gluster-4.5.0-36.el7_9.5.x86_64<br>
                qemu-kvm-1.5.3-175.el7_9.5.x86_64<br>
                qemu-system-moxie-2.0.0-1.el7.6.x86_64<br>
                libvirt-daemon-4.5.0-36.el7_9.5.x86_64<br>
                libvirt-admin-4.5.0-36.el7_9.5.x86_64<br>
                qemu-user-2.0.0-1.el7.6.x86_64<br>
                libvirt-daemon-config-nwfilter-4.5.0-36.el7_9.5.x86_64<br>
                qemu-kvm-tools-1.5.3-175.el7_9.5.x86_64<br>
                ipxe-roms-qemu-20180825-3.git133f4c.el7.noarch<br>
                qemu-system-microblaze-2.0.0-1.el7.6.x86_64<br>
               
            libvirt-daemon-driver-storage-disk-4.5.0-36.el7_9.5.x86_64<br>
                libvirt-daemon-driver-qemu-4.5.0-36.el7_9.5.x86_64<br>
            <br>
          </tt></font></blockquote>
      <p>Packages added to the rpm side are the equivs of the dpkg side
        as far as I'm aware and as numerous docs/blogs/etc imply.  The
        /bin/qemu-{arm,aarch64} binaries are there, provided by the
        expected qemu-user package (2.0.0-1.el7.6.x86_64).  But
        virt-install throws the old "Host does not support any
        virtualization options for arch {arch}" for any of the expected
        arch values (arm, arm64, aarch64, etc).  Obviously I've missed a
        support package on the centos side, but what?<br>
      </p>
    </blockquote>
  </body>
</html>

--------------6FC03966E3C6EBF0F404FAE0--
