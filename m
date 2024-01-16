Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp750326ejf;
        Tue, 16 Jan 2024 00:50:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBHPy1Gpo/ptQDOCioEEuRRZN2OAKrHExoYFR7M4qhOEwUNuZVQjtCFrKza73tA6bS3RKl
X-Received: by 2002:a05:622a:1386:b0:429:c526:92bd with SMTP id o6-20020a05622a138600b00429c52692bdmr8602701qtk.28.1705395029365;
        Tue, 16 Jan 2024 00:50:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705395029; cv=none;
        d=google.com; s=arc-20160816;
        b=fxigGR8nW11Mx/RjZe9bliL/RPj4aAyypFsscuzxU2W/+obln3LBlon3jiBL8S4gTJ
         kGVwLul2PYLZe0BOgf5RZ8zw60Tk92KA74k7ThxYGvBL3Mp3CcUVlfTxPyRi2Qtn2W2F
         YPb+6+Fl5BKLi7mG18icjmOlbsXUVDJgvRfMgoHa+hhJwU/Ho/j/swV3jhUOzi3nQBlb
         nwUY0Q9acFyKj+NJvjapaGSMwb/htNFRw5L2Dfy+6pTVgt6krILUE8UFAFkeww9RATU5
         zOMzkrD3PXuLkr3GeRp3jWXpTv5Lv+xg/S+8vieUeMfXj61agW4crIjr1XcIH84Q8ESP
         Gl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:mime-version:user-agent:date:message-id
         :subject:cc:to;
        bh=7NhM7MwHcgQSsRtLGzzoVmBue3ZR7kyzW5x3ZtElHvk=;
        fh=PIbGBagwLpv6m0icLWEhwafnC4co/H/Kz+HEUUEdBUE=;
        b=yvlBRiqg5ejE8ROdrfDok3/Rv/J1iQkgmh8ZorCMTVxxH6pmZ6BGQbkoMuYGRSm60B
         4FsXS/C6kAcC2UFMuibEhVg25EAudv46fA+qsfs3do2QIGfwPqntoiJbzSpFskK6IJFd
         8fV3du6epB0OS7S6auvp+Z2UHapo+hLJZSzqG5cZ6QP6Y1xGpI32B9QAPTOBl3F0EMJD
         iUOamJDrXGIcDCX2e5DSYLnoQ0glB2PmkqCJnsSgO+L5J2fOT8Mzu71mWmIT0+k4rbtf
         8Sk2zK7Mj65c40ynQeRkt2B+55FxTX9IR3kUgDKUY2XdvdMxDQX34j5Qw+VVdZZn7/ar
         jvYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i10-20020ac85c0a000000b004298c93b0e2si9494530qti.683.2024.01.16.00.50.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jan 2024 00:50:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPf9E-0007yc-A7; Tue, 16 Jan 2024 03:50:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezengruan@huawei.com>)
 id 1rPf9C-0007yP-Pe; Tue, 16 Jan 2024 03:50:14 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezengruan@huawei.com>)
 id 1rPf9A-0008TL-DS; Tue, 16 Jan 2024 03:50:14 -0500
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TDjNV5lTFzWmYZ;
 Tue, 16 Jan 2024 16:48:58 +0800 (CST)
Received: from canpemm500001.china.huawei.com (unknown [7.192.104.163])
 by mail.maildlp.com (Postfix) with ESMTPS id ECFEA180071;
 Tue, 16 Jan 2024 16:49:58 +0800 (CST)
Received: from [10.174.185.33] (10.174.185.33) by
 canpemm500001.china.huawei.com (7.192.104.163) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 16:49:58 +0800
To: <qemu-devel@nongnu.org>, <qemu-stable@nongnu.org>, <qemu-arm@nongnu.org>
CC: yuzenghui <yuzenghui@huawei.com>
Subject: [Qemu-arm] Windows11 guest Fast startup cannot work
Message-ID: <6dad82d6-2722-3a07-03ee-6dea6d74ba47@huawei.com>
Date: Tue, 16 Jan 2024 16:49:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500001.china.huawei.com (7.192.104.163)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=yezengruan@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 URI_TRY_3LD=1.999 autolearn=ham autolearn_force=no
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
Reply-to:  yezengruan <yezengruan@huawei.com>
From:  yezengruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: P3TZEsIPHCrO

Hi,

I want to improve the startup speed of Windows VM. On the x86 
architecture, QEMU's Windows11 VM can enable the Fast startup function, 
but it cannot work on the ARM architecture. By the way, the Fast startup 
function of Windows on ARM physical machines can work normally.

Is there anything missing in QEMU's ARM architecture for Windows guest?

My environmental information:
Linux 5.10
QEMU 6.2.0
Guest: Windows11 ARM

QEMU command line:
qemu-system-aarch64 -nodefaults -machine 
virt,kernel-irqchip=on,virtualization=off,gic-version=3,its=off -accel 
kvm -cpu host -m 6144 -smp 6 -bios 
/usr/share/edk2/aarch64/QEMU_EFI-pflash.raw -drive 
if=none,id=system,format=qcow2,file=/data/images/win11_disk.qcow2 
-device virtio-blk-pci,drive=system -device 
nec-usb-xhci,msix=off,msi=off -device usb-kbd -device usb-tablet -device 
ramfb -display gtk -name Windows -qmp unix:/tmp/qmp.socket,server,nowait 
-d all -D /tmp/qemu.log -msg timestamp=on

Refer to the Fast startup link below:
https://learn.microsoft.com/en-us/windows-hardware/test/weg/delivering-a-great-startup-and-shutdown-experience

Thank you.
Zengruan Ye

