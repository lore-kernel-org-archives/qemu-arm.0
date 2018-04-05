Received: by 10.28.71.155 with SMTP id m27csp5683664wmi;
        Wed, 4 Apr 2018 23:09:58 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49eidRyFXzPdu+c/oLGu+vaycsh76ZkBUrOwxdQrW3uLR0oR8vPSO3w118E0QDSaSmYg3sg
X-Received: by 10.55.143.71 with SMTP id r68mr10645646qkd.296.1522908598674;
        Wed, 04 Apr 2018 23:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522908598; cv=none;
        d=google.com; s=arc-20160816;
        b=iLUDkHyx2W6ue0Ho/LMJx5i+gSDQB3fz+0UQOaCkDneO6PpytIfJYBq7EzcGks6Gq4
         VC2ZlS9ces9osRZylUKm8Q1i66eUxgZeRCYL/YFeM8o5Ar5O7LyUeKaKplW2YWbK7plX
         5mBEakhscRJb9gNOncuKCY3ae00FGzbMwZMxF/RQhWcLxuh/Fw/X6OM1v0vQsXDbvco0
         v6J7vwED6B1/AiZ/jA6VPaWphGTevFFJCe8ayurBU2Uie6edCLA5K2WQdkKbr+q7n9fi
         LPnt/qhMdpFz8hJm5MHKaPCKFV0Wonjg+sp/mpL0Ahw9ZcDkEJSdyeOoMRIU9O9GJEqq
         eahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=npLrmEgvPEjchNtT4F1f3BmzK/CvmffDU9kmJn9r9rc=;
        b=VLVxqKQC5r1m2Gko734qOEwmlts02WAWOL45Z/S70yQLIfUpGLLIG5PXQpF67bWPgo
         Wz0aUBvf+CLIOMJe50Yqq9xI/Xn+tlC5Io8Oxn2yVE/9lDHDKCnlIyFCOLmaSxPxaebY
         2XVAkqWjEOoCV0iQD2rWmmN4kgVgzEJ+YgEs7FGweyJ4QJkV+52L3ZNgQi9MlyXCiteh
         6Aog4ZQsdEn6IDAwbdftpuzAlBORiim27q3R7prGgZ0etnLAK+JVAmHWykB9Qn+cII2K
         SK+RJr+HqKzCESJOTcRsTYsaZ/hTIPIPBgyt2mqH0QoPAj6cxPWMD+FyCZc4Zmg5G5v9
         Krrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xl3v+z4y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n20si5523348qtl.390.2018.04.04.23.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 23:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xl3v+z4y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3y5u-0006wZ-3c
	for alex.bennee@linaro.org; Thu, 05 Apr 2018 02:09:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1f3y5h-0006t0-Rg
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 02:09:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bjsprakash.linux@gmail.com>) id 1f3y5g-00005e-VZ
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 02:09:45 -0400
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f]:35782)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bjsprakash.linux@gmail.com>)
	id 1f3y5e-0008WD-Ng; Thu, 05 Apr 2018 02:09:42 -0400
Received: by mail-oi0-x22f.google.com with SMTP id z8-v6so21536889oix.2;
	Wed, 04 Apr 2018 23:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=npLrmEgvPEjchNtT4F1f3BmzK/CvmffDU9kmJn9r9rc=;
	b=Xl3v+z4ykYsFHqcCpTnK+2zCNoDpwvdoU/MdD1s52EDcpz5fL1wZUzC/cpMkbAOziR
	pw6v9xz1J4q3KfFVfdH/s9Bstl1eZmtt2+1mQCidmT2BRfAVnz/LEC/4xOdqJWDNs0TJ
	qcR6IYelOD6dt08auP2vm9jvwT/ipv+aXyJ+RdFJN0x8AYUF/+PG3DwJ/wXgvtDv5MbC
	t5R310D4upkf+dsIp+JaHiAJHqo+s4DFWE5saycLoazaZYB5/9reUNYPZmLgHGfsBJ2a
	U1cdIciCcdUSM96Aec8Xa8Ka9jAIT5G9xgtRS2sEsNwKXdl4bSMd7PuJmHCJoA1DcuuX
	YR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=npLrmEgvPEjchNtT4F1f3BmzK/CvmffDU9kmJn9r9rc=;
	b=cfJCSly9yWxKUHPWIvIoUBu5odXfpa8WFCbCAzEfwwtQTK1n9/pR0Gk/GKWLssQk8F
	EUnxAH3OTJBCirBL8KsWcQXUiGEVDiVmkzDJhy5xMHlFAnE6zc1Ec4fagKnHj1lbRUYR
	cE0tL+eusxde6ufdfY+m+p8Qv/4bZ3OoPPmooUY5pCAdgQUFHCfSXYCMa/CxkCgzEHpC
	iaUpeKc0Pe+w/+Lo6XMZMNOsZLuvJev/2qXx1g5Vk2AOFJku6WEkv0HrByYwhazkLpi2
	sDk7qG5ZUMte0LOMofBJ6R3rhGs5Gd44l127ozaljZZ4joaN68jXLCKurAZVJBeAgmjB
	GSug==
X-Gm-Message-State: ALQs6tBTijrvIjWMUipQuiRycs/t5YMSbBwV0BN35W24/W3NxnjyFsc5
	7H9/sLnHgok6Vl+DpuJQXW6PF+uzHwKwCOiKBZP/zETC
X-Received: by 2002:aca:32d6:: with SMTP id
	y205-v6mr12310423oiy.146.1522908581717; 
	Wed, 04 Apr 2018 23:09:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4041:0:0:0:0:0 with HTTP;
	Wed, 4 Apr 2018 23:09:41 -0700 (PDT)
From: Prakash B <bjsprakash.linux@gmail.com>
Date: Thu, 5 Apr 2018 11:39:41 +0530
Message-ID: <CACJhumcLYPhMkO5idkL0eW6nsdbwhFv3KMWi9c5Q5bPv_2Rq6g@mail.gmail.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>, 
	Sunil Goutham <sgoutham@cavium.com>, bprakash@caviumnetworks.com,
	berrange@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22f
Subject: [Qemu-arm] Virito devices bridge vs Macvtap performance
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Myc0jhbT81q2

Hi,

I am doing kvm guest network performance analysis to compare relevant
alternatives for  virtio devices on Arrach64.

I have generated bridge tap and macvtap performance numbers  on guest
10G interface
connected back to  another 10G on other host.

The results for guest with  "macvtap" vs  "bridge" are  marginally
differed and the difference is +/- 3%. As per my understanding on
macvtap, expected better performance values with macvtap.


--------------------<Begin of commands > --------------------
for  macvtap device:-
-netdev tap,vhost=on,vhostforce=on,id=macvtap_netdev,fd=3
3<>/dev/tap$(cat /sys/class/net/macvtap1/ifindex)  \
 -device virtionet-pci,netdev=macvtap_netdev,id=net0,mac=$(cat
/sys/class/net/macvtap1/address)

for Bridge tap device:-
-netdev type=tap,vhost=on,vhostforce=on,id=tap0,ifname=tap0,script=no,downscript=no
-device virtio-net-pci,netdev=tap0,mac=12:03:04:05:06:07

-----------------------< End of commands> ------------------------

Anyone please tell me if I missed anything.

Other information.
-------------------------
Kernel sources :  4.14.28
qemu-aarch64 :  2.11.91

Did the same  experiments with ThunderX vnic and Intel 10G nic and
results are as mentioned above.
Tried macvtap in bridge and passthru modes.


Tell me if  you  need further investigations or more data .

thanks,
Prakash B
