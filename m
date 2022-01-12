Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2458799lfj;
        Wed, 12 Jan 2022 06:22:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynxkNoR9aV+sFLZce76Rnoa0cZMScdruuHlUD3ktNVKPlU6kzRa8BUq+eJySZxcz46xsfe
X-Received: by 2002:a25:c056:: with SMTP id c83mr2053821ybf.410.1641997349711;
        Wed, 12 Jan 2022 06:22:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641997349; cv=none;
        d=google.com; s=arc-20160816;
        b=0QodjOU8HgomCsdMbGWITcQKoh5kixvBs3euA0vCcoWcaDhKyTxg09G4ISBJ6rmx2U
         /Ns4V3VyUc5pDVkP5Hy0nFVQU3uZsbVmf4Lku5Pavea+gHcO33RD08HBDGLSe/RgD5kl
         xw4uAdad+Ol9R2Qnx6QwXIdZ6Uo6zEshRme+aR8ttC7tZWdi3kbXSpvRBAHoyH1aFMQZ
         7po3MFaR1Mfrg3CMMy5pxczIPdIEvOdO1/eryIPV2o3nlT9kPrestNtyboM8QVFrs2Vy
         Q82k+8FHa8fEsOxQJ0l3Omsk7PJx/ObGYjcMfEUH/lkHF2WQGkI8mYGJD8PKhw+BufvE
         ap7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:dkim-signature
         :dkim-signature;
        bh=zijU5Zu5iCGXszi6HiMjgBnbTYlZN3OV1ZkWXsUCpO8=;
        b=nZjEa1ioxv8fQafzwXzEHJ0FxiPhAeMwlnx+S6J+QNaHHu4QqOg3KbcNeMi3DaXZTy
         3Cz5eXVa8TdGfXUqhyj61Dj4vVxkpzAAv8O0doUTd5k2pu3952VOx1cMjm4/RTvBnBl6
         ust4o6NMoEE9I+NPTdBBpBB33sQCh76ALIjW1BIGG1Arwlaf0rRvHJDRV1P8g7AC1MbZ
         JrMzkt+M8O/u9oAVN0MCpCfy1gqBBnmldVged/L55Eem1a++GfXx5W47GuA6K8j0MAd+
         zIl47SWUXVcj7nciKTYmsPHYfGQP6HKs2kfnkQ3TYwULA18u5KNpfwcBtoHDri7BXVEr
         YktA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nrl.navy.mil header.s=s2.dkim header.b=gmMpCzZh;
       dkim=pass header.i=@nrl.navy.mil header.s=s1.dkim header.b=gW73kXSs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cmf.nrl.navy.mil
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si10554412ybm.312.2022.01.12.06.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jan 2022 06:22:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nrl.navy.mil header.s=s2.dkim header.b=gmMpCzZh;
       dkim=pass header.i=@nrl.navy.mil header.s=s1.dkim header.b=gW73kXSs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cmf.nrl.navy.mil
Received: from localhost ([::1]:59836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7eWD-0002r7-28
	for alex.bennee@linaro.org; Wed, 12 Jan 2022 09:22:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olagarde@cmf.nrl.navy.mil>)
 id 1n7dYr-0007uV-H7
 for qemu-arm@nongnu.org; Wed, 12 Jan 2022 08:21:09 -0500
Received: from [2001:480:a0:f003::234] (port=36168 helo=mfe.dren.mil)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olagarde@cmf.nrl.navy.mil>)
 id 1n7dYk-0004Uy-QX
 for qemu-arm@nongnu.org; Wed, 12 Jan 2022 08:21:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nrl.navy.mil;
 h=to : from : subject
 : message-id : date : mime-version : content-type; s=s2.dkim;
 bh=zijU5Zu5iCGXszi6HiMjgBnbTYlZN3OV1ZkWXsUCpO8=;
 b=gmMpCzZhNbcXdqOa7FQZj+zozph73GT55J8czlrN9RnVYxcwNNwlUP6L/mVDshz9n2uw
 Gq7DgD7eHRAgpDzMvFZmBJ8zUR019O7xXxI5+GSArsA/Yxsau/5kRbIfzV8Q0A9h0uJ4
 k/rLLM4vJFpkeTa8lDUqIdbypgl2ObAu0u1jxAn9JWn/z4OPQQW1rjBwFWqk0PXEQtoI
 jB0Jtm52Y5QG6XteK3x59vxU1AxAKzetvHvaHh61DaizxTD/coW1u+3vWHLYzZtq3fZr
 1JZsGLRQXkL8ynXH5U432XQ6gV/E+EF5hjI45LcdqCRuwFWcblrp6RsdSFLifcpnmfcJ Xg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nrl.navy.mil;
 h=to : from : subject
 : message-id : date : mime-version : content-type; s=s1.dkim;
 bh=zijU5Zu5iCGXszi6HiMjgBnbTYlZN3OV1ZkWXsUCpO8=;
 b=gW73kXSsMyjd7fnR42NW2U6j0iB+P6NPk0xnMYBAEcP/qbc1yplMmDV39RhSEdFUQtmp
 hXMBXU+BW+NMmVmU4F1wwcvASeoWy9cZZuUtzJetd37I11FRLPOEBSn+xc2W8ublrz3I
 tQcy8KQqsdmGHSHZCHRPhpHg1SxZH7CsXmo= 
Received: from hedwig.cmf.nrl.navy.mil (hedwig.cmf.nrl.navy.mil
 [134.207.12.163])
 by ppae.dren.mil (8.16.1.2/8.16.1.2) with ESMTP id 20CBX0cf020606
 for <qemu-arm@nongnu.org>; Wed, 12 Jan 2022 11:33:00 GMT
Received: from Promethius.fios-router.home
 (pool-72-83-148-227.washdc.fios.verizon.net [72.83.148.227])
 (authenticated bits=0)
 by hedwig.cmf.nrl.navy.mil  with ESMTP id 20CBWrDj014288
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 12 Jan 2022 06:32:53 -0500
To: qemu-arm@nongnu.org, Owen LaGarde <olagarde@cmf.nrl.navy.mil>
From: Owen LaGarde <olagarde@cmf.nrl.navy.mil>
Subject: virt-install on centos 7.9 not seeing qemu-aarch64?
Message-ID: <3e7106d0-7a0d-0482-9dae-42bcbd78aec8@cmf.nrl.navy.mil>
Date: Wed, 12 Jan 2022 06:32:53 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------4CAD42E081D14D72B9073FE0"
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
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: BjpmYWeumE3s

This is a multi-part message in MIME format.
--------------4CAD42E081D14D72B9073FE0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I think I've missed something in the support packages enabling 
arch=aarch64 guests on a centos 7.9 host, such that virt-install won't 
accept an arch of 'aarch64' or 'arm' where ubuntu works fine.

I'm trying to create a Rocky 8 aarch64 guest on a centos 7.9 host, 
coming from an ubuntu host.  I have this working on a minimal popos at 
home just to verify I'm not insane.  The "real, at work" host does have 
to be centos 7 x86_64 though it will be replaced with rocky 8 x86_64 
"soon".  The kicker:  I'd very much prefer to use virt-install because 
there's a large amount of pre-existing automation I'd have to rewrite 
otherwise.  I see the arm and aarch64 support added by the expected 
qemu-user (2.0.0-1.el7.6.x86_64) but virt-install won't use it(?).

Here's the process as currently written into the existing automation.  
This works fine on the popos 21.10 minimal-plus-indicated-dpkgs, 
shouldn't be any surprises here (yes, there's some extra garbage on the 
centos side from my flailing about):

    virt-install \
         --connect qemu:///system \
         --name apollo \
         --metadata title=apollo \
         --os-variant linux \
         --vcpus 4 \
         --ram 4096 \
         --arch aarch64 \
         --rng /dev/urandom \
         --nonetwork \
         --nographics \
         --noautoconsole \
         --controller type=scsi,model=virtio-scsi \
         --disk pool=apollo,size=20,format=raw,bus=scsi \
         --location /opt/kvm/media/Rocky-8.5-aarch64-dvd1.iso \
         --initrd-inject /opt/kvm/kickstart/Rocky8.cfg \
         --extra-args 'ks=file:/Rocky8.cfg console=ttyS0'

    /opt/kvm/kickstart/Rocky8.cfg:
         auth --enableshadow --passalgo=sha512
         cdrom
         text
         cmdline
         poweroff
         firstboot --enable
         ignoredisk --only-use=sda
         keyboard --vckeymap=us --xlayouts='us'
         lang en_US.UTF-8
         eula --agreed
         firewall --enabled --service ssh
         services --disabled=kdump --enabled=sshd
         selinux --enforcing
         timezone America/New_York --isUtc
         bootloader --location=mbr --boot-drive=sda
         clearpart --drives=sda --all --initlabel
         part /boot --fstype='xfs' --ondisk=sda --size=1024 --label=boot
         part /boot/efi --fstype='efi' --ondisk=sda --size=1024
    --fsoptions='umask=0077,shortname=winnt'
         part pv.357 --fstype='lvmpv' --ondisk=sda --grow
         volgroup centos --pesize=4096 pv.357
         logvol /home --fstype='xfs' --size=1024 --label='home'
    --name=home --vgname=centos
         logvol /usr/local --fstype='xfs' --size=1024 --label='local'
    --name=local --vgname=centos
         logvol / --fstype='xfs' --size=4096 --label='root' --name=root
    --vgname=centos
         logvol /var --fstype='xfs' --size=4096 --label='var' --name=var
    --vgname=centos
         logvol /opt --fstype='xfs' --size=1024 --label='opt' --name=opt
    --vgname=centos
         logvol /var/log --fstype='xfs' --size=1024 --label='log'
    --name=log --vgname=centos
         logvol swap --fstype='swap' --size=1024 --name=swap --vgname=centos
         logvol /var/log/audit --fstype='xfs' --size=1024
    --label='audit' --name=audit --vgname=centos
         %packages
         @base
         @core
         yum-utils
         createrepo
         pciutils
         usbutils
         net-tools
         tcpdump
         psmisc
         %end
         %addon com_redhat_kdump --disable --reserve-mb='auto'
         %end
         %anaconda
         pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges
    --notempty
         pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges
    --emptyok
         pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges
    --notempty
         %end

    dpkg -l |egrep -i qemu\|libvirt\|aarch64 |awk '{print $2}'  ## popos
         gir1.2-libvirt-glib-1.0:amd64
         ipxe-qemu
         ipxe-qemu-256k-compat-efi-roms
         libnss-libvirt:amd64
         libsys-virt-perl
         libvirt-clients
         libvirt-daemon
         libvirt-daemon-config-network
         libvirt-daemon-config-nwfilter
         libvirt-daemon-driver-qemu
         libvirt-daemon-driver-storage-rbd
         libvirt-daemon-system
         libvirt-daemon-system-systemd
         libvirt-glib-1.0-0:amd64
         libvirt-glib-1.0-data
         libvirt0:amd64
         python3-libvirt
         qemu
         qemu-block-extra
         qemu-efi-aarch64
         qemu-efi-arm
         qemu-kvm
         qemu-system
         qemu-system-arm
         qemu-system-common
         qemu-system-data
         qemu-system-gui:amd64
         qemu-system-mips
         qemu-system-misc
         qemu-system-ppc
         qemu-system-s390x
         qemu-system-sparc
         qemu-system-x86
         qemu-utils

    rpm -qa |egrep -i qemu\|libvirt\|aarch64  ## centos
         libvirt-gconfig-1.0.0-1.el7.x86_64
         libvirt-bash-completion-4.5.0-36.el7_9.5.x86_64
         qemu-system-arm-2.0.0-1.el7.6.x86_64
    libvirt-daemon-driver-storage-logical-4.5.0-36.el7_9.5.x86_64
         libvirt-daemon-driver-lxc-4.5.0-36.el7_9.5.x86_64
         libvirt-python-4.5.0-1.el7.x86_64
         qemu-common-2.0.0-1.el7.6.x86_64
         qemu-system-lm32-2.0.0-1.el7.6.x86_64
    libvirt-daemon-driver-storage-mpath-4.5.0-36.el7_9.5.x86_64
         qemu-system-xtensa-2.0.0-1.el7.6.x86_64
         libvirt-daemon-driver-nodedev-4.5.0-36.el7_9.5.x86_64
         libvirt-4.5.0-36.el7_9.5.x86_64
         qemu-system-alpha-2.0.0-1.el7.6.x86_64
         libvirt-libs-4.5.0-36.el7_9.5.x86_64
         libvirt-daemon-driver-storage-4.5.0-36.el7_9.5.x86_64
         libvirt-lock-sanlock-4.5.0-36.el7_9.5.x86_64
         qemu-guest-agent-2.12.0-3.el7.x86_64
         qemu-system-or32-2.0.0-1.el7.6.x86_64
         qemu-system-m68k-2.0.0-1.el7.6.x86_64
         libvirt-daemon-driver-storage-core-4.5.0-36.el7_9.5.x86_64
         libvirt-daemon-driver-storage-rbd-4.5.0-36.el7_9.5.x86_64
         qemu-img-1.5.3-175.el7_9.5.x86_64
         qemu-system-sh4-2.0.0-1.el7.6.x86_64
         libvirt-daemon-driver-storage-scsi-4.5.0-36.el7_9.5.x86_64
         libvirt-daemon-driver-network-4.5.0-36.el7_9.5.x86_64
         libvirt-nss-4.5.0-36.el7_9.5.x86_64
         qemu-kvm-common-1.5.3-175.el7_9.5.x86_64
         qemu-system-unicore32-2.0.0-1.el7.6.x86_64
         qemu-system-s390x-2.0.0-1.el7.6.x86_64
    libvirt-daemon-driver-storage-iscsi-4.5.0-36.el7_9.5.x86_64
         libvirt-daemon-config-network-4.5.0-36.el7_9.5.x86_64
         python36-libvirt-4.5.0-1.el7.x86_64
         qemu-system-cris-2.0.0-1.el7.6.x86_64
         qemu-system-mips-2.0.0-1.el7.6.x86_64
         libvirt-daemon-driver-nwfilter-4.5.0-36.el7_9.5.x86_64
         libvirt-daemon-driver-secret-4.5.0-36.el7_9.5.x86_64
         libvirt-daemon-driver-interface-4.5.0-36.el7_9.5.x86_64
         libvirt-client-4.5.0-36.el7_9.5.x86_64
         qemu-2.0.0-1.el7.6.x86_64
         qemu-system-x86-2.0.0-1.el7.6.x86_64
    libvirt-daemon-driver-storage-gluster-4.5.0-36.el7_9.5.x86_64
         qemu-kvm-1.5.3-175.el7_9.5.x86_64
         qemu-system-moxie-2.0.0-1.el7.6.x86_64
         libvirt-daemon-4.5.0-36.el7_9.5.x86_64
         libvirt-admin-4.5.0-36.el7_9.5.x86_64
         qemu-user-2.0.0-1.el7.6.x86_64
         libvirt-daemon-config-nwfilter-4.5.0-36.el7_9.5.x86_64
         qemu-kvm-tools-1.5.3-175.el7_9.5.x86_64
         ipxe-roms-qemu-20180825-3.git133f4c.el7.noarch
         qemu-system-microblaze-2.0.0-1.el7.6.x86_64
         libvirt-daemon-driver-storage-disk-4.5.0-36.el7_9.5.x86_64
         libvirt-daemon-driver-qemu-4.5.0-36.el7_9.5.x86_64

Packages added to the rpm side are the equivs of the dpkg side as far as 
I'm aware and as numerous docs/blogs/etc imply.  The 
/bin/qemu-{arm,aarch64} binaries are there, provided by the expected 
qemu-user package (2.0.0-1.el7.6.x86_64).  But virt-install throws the 
old "Host does not support any virtualization options for arch {arch}" 
for any of the expected arch values (arm, arm64, aarch64, etc).  
Obviously I've missed a support package on the centos side, but what?


--------------4CAD42E081D14D72B9073FE0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
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
      pre-existing automation I'd have to rewrite otherwise.  I see the
      arm and aarch64 support added by the expected qemu-user
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
          <font size="-1"><tt>    --extra-args 'ks=<a class="moz-txt-link-freetext" href="file:/Rocky8.cfg">file:/Rocky8.cfg</a>
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
      <font size="-1"><tt>    bootloader --location=mbr --boot-drive=sda</tt></font><br>
      <font size="-1"><tt>    clearpart --drives=sda --all --initlabel</tt></font><br>
      <font size="-1"><tt>    part /boot --fstype='xfs' --ondisk=sda
          --size=1024 --label=boot</tt></font><br>
      <font size="-1"><tt>    part /boot/efi --fstype='efi' --ondisk=sda
          --size=1024 --fsoptions='umask=0077,shortname=winnt'</tt></font><br>
      <font size="-1"><tt>    part pv.357 --fstype='lvmpv' --ondisk=sda
          --grow</tt></font><br>
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
      <font size="-1"><tt>    logvol /var/log --fstype='xfs' --size=1024
          --label='log' --name=log --vgname=centos</tt></font><br>
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
          dpkg -l |egrep -i qemu\|libvirt\|aarch64 |awk '{print $2}'  ##
          popos<br>
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
    <p>Packages added to the rpm side are the equivs of the dpkg side as
      far as I'm aware and as numerous docs/blogs/etc imply.  The
      /bin/qemu-{arm,aarch64} binaries are there, provided by the
      expected qemu-user package (2.0.0-1.el7.6.x86_64).  But
      virt-install throws the old "Host does not support any
      virtualization options for arch {arch}" for any of the expected
      arch values (arm, arm64, aarch64, etc).  Obviously I've missed a
      support package on the centos side, but what?<br>
    </p>
  </body>
</html>

--------------4CAD42E081D14D72B9073FE0--
