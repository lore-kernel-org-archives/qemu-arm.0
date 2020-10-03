Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2303560lfq;
        Sat, 3 Oct 2020 01:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgBhijVafLEgiOVr7/j9uGwl/59bKwm7wuF6HEiFIZEGv8XAniNSUbBdgrwIec1cjCRSHJ
X-Received: by 2002:a25:ca85:: with SMTP id a127mr7999419ybg.184.1601715180444;
        Sat, 03 Oct 2020 01:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601715180; cv=none;
        d=google.com; s=arc-20160816;
        b=HBQLGHSo1PFIAzYlbVf8YoP+Z/2xKInKVeERQp/UHidYoulBxKw6D4DP7MqpzWrO3y
         cRus47WYuTLU4IcC/pY//nWvBpJr6jsJ33FAfJjV74WeEGWWYTRgnPHzgPwBxJfQVf7t
         5H4ccuwHnCtGUW/MUYahF+a4Go/eFmmZ40fdglMlW4FOJeOfEj/fF30Sk/IPmpiC/1iJ
         FNy6eaT91KoWCTxD6dGSFMobAgcXYE5ETCsGb6poVqYVhMO6kJ8C552vManQ3vS81jYa
         XVZUyt04KEEozwfkmdMrGAg+tT5z6FiSdwDvE6CFaKVHUQQILb5geylxOPXTYEczKeWn
         B2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:subject:to:message-id:from
         :date:dkim-signature;
        bh=1RuDpK0scaImWU+uLXOa+HiCC2ftD3uYDo2swBJr5CY=;
        b=mwTOcGQuuO5ejG6vq+Oq6O53EkxWSMLQn3TBgmh4Y8DHEzQ/DUtAgbZqWVjcRBxUFv
         f872y47O53GXrkaSx37t3zK0wZkRKeZJ9kKRxI7/3p7K806/nzocKpA7aXTJglc8s3NP
         j3ONMlIa+cCHw387uNw8sSgj1Id3+pCeOHRGqzVvU3hoeXFyp2ES/njal7uMQGKz3m+u
         OffzeT0tdi2hACxWQ+hEIbrCllGiJecWuFM8W9btpHpafaEx8rfxl8jh78I67dOu6qB0
         +xArAcIfbQ2r5Mengpg3DEmfhivUOgzogYdomDqb4S/RI2KbwDTsRry+MC2cvj9QWLWl
         YdOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@mail.ru header.s=mail3 header.b=JF4FFPQ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=mail.ru
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si4853326ybg.291.2020.10.03.01.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Oct 2020 01:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@mail.ru header.s=mail3 header.b=JF4FFPQ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=mail.ru
Received: from localhost ([::1]:55124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kOdHn-0005Uj-TP
	for alex.bennee@linaro.org; Sat, 03 Oct 2020 04:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dims12@mail.ru>) id 1kOdHV-0005Tj-8o
 for qemu-arm@nongnu.org; Sat, 03 Oct 2020 04:52:41 -0400
Received: from smtp10.mail.ru ([94.100.181.92]:33020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dims12@mail.ru>) id 1kOdHS-00049G-3F
 for qemu-arm@nongnu.org; Sat, 03 Oct 2020 04:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:Message-ID:Reply-To:From:Date:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=1RuDpK0scaImWU+uLXOa+HiCC2ftD3uYDo2swBJr5CY=; 
 b=JF4FFPQ2edbu9zOB7p3lsiartrJlx/ElTBmmYakGXNo+D2T+XdbsI79NYKcKuRlupQvCmclire1QqoMRQM7DFBKqA/gKAG5VKjaV22C4Dv9jz/HIvud8ChmtMY9GoOeeB1WZJIiWWWvdoS5BeFdF03/Rfv7/744lt6xIfDdivws=;
Received: by smtp10.mail.ru with esmtpa (envelope-from <dims12@mail.ru>)
 id 1kOdHN-0007At-Go
 for qemu-arm@nongnu.org; Sat, 03 Oct 2020 11:52:33 +0300
Date: Sat, 3 Oct 2020 11:52:33 +0300
From: Dmitry S Kravchenko <dims12@mail.ru>
Message-ID: <818484776.20201003115233@mail.ru>
To: qemu-arm@nongnu.org
Subject: How to pass-through USB when Running Raspberry Pi image?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Antivirus: Avast (VPS 201003-0, 03.10.2020), Outbound message
X-Antivirus-Status: Clean
Authentication-Results: smtp10.mail.ru; auth=pass smtp.auth=dims12@mail.ru
 smtp.mailfrom=dims12@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9E98D729206725230F4632E9A98CB8CA84C82A46976C49F1F182A05F53808504097A3488A38C3F0227DB0B14FBE991496849908669D0116FB96C755FFF76A5925
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7AC43A7B4C36B769DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637835928C62272F24E8638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC87C4C53F983B2025AAAB9790E22C35E3CF4FD0D6B9E93C49389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C07E7E81EEA8A9722B8941B15DA834481FCF19DD082D7633A0E7DDDDC251EA7DABA471835C12D1D977725E5C173C3A84C362968DCAA3E4B45B117882F4460429728AD0CFFFB425014EFE57002F862A6B6676E601842F6C81A19E625A9149C048EE38D4DC57D478E688098B145E00970258D8FC6C240DEA76429449624AB7ADAF37B2D370F7B14D4BC40A6AB1C7CE11FEE37BF93E671518182AC0837EA9F3D19764C4224003CC8364767A15B7713DBEF166A7F4EDE966BC389F9E8FC8737B5C22497393CE827C55B5F775ECD9A6C639B01BBD4B6F7A4D31EC0BC0CAF46E325F83A522CA9DD8327EE4930A3850AC1BE2E73557739F23D657EF2BB5C8C57E37DE458B4C7702A67D5C3316FA3894348FB808DBA1CE242F1348D5363B503F486389A921A5CC5B56E945C8DA
X-C8649E89: E34E851992FCED65B5688C51040EC3923E052F59D1986B4474884381DD1CAD5B55B84F4C62AE5C43
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXiGEZTr0S5mT2tGLatOGNeQ
X-Mailru-Internal-Actual: B:0.87796206762262
X-Mailru-Sender: F16D9CAFEEA6770ECAF442C8E1739AC0FE7BBB421EA3499B1882D6238A6B754723486710E24E14016490C8872583B4AB3DDE9B364B0DF289D0242E59F813069D7652F063092A458AAE208404248635DF
X-Mras: Ok
Received-SPF: pass client-ip=94.100.181.92; envelope-from=dims12@mail.ru;
 helo=smtp10.mail.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/03 04:52:33
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO_END_DIGIT=0.25, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Reply-To: Dmitry S Kravchenko <dims12@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3iE1gzNZEdDt

I  am  trying  to  emulate  Raspberry  Pi image on Linux host and have
access to host USB ports and failing

My basic command line is

qemu-system-arm \
    -kernel qemu-rpi-kernel/kernel-qemu-4.4.34-jessie \
    -cpu arm1176 \
    -m 256 \
    -M versatilepb \
    -append "root=3D/dev/sda2 panic=3D1" \
    -hda 2017-07-05-raspbian-jessie.img \
    -usb \
    -redir tcp:5022::22 \
    -redir tcp:5080::80 \
    -serial stdio \
    -no-reboot

And I also tried to add some combinations of options such as

-usb \
-device qemu-xhci \
-device usb-ehci,id=3Dehci \
-device usb-host,hostbus=3D1,hostport=3D1.3

and so on, but failed.

I have no any usb on guest and also have

$ lsusb
unable to initalize libusb: -99

My host is Ubunto 18.04, my device is serial-based custom USB device

On host:

$ lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 5000M
    |__ Port 6: Dev 2, If 0, Class=3DMass Storage, Driver=3Dusb-storage, 50=
00M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/12p, 480M
    |__ Port 3: Dev 2, If 0, Class=3DVendor Specific Class, Driver=3Dftdi_s=
io, 12M

last one is interested

How to investigate and fix?


-- 
=D0=AD=D1=82=D0=BE =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B5 =
=D0=BF=D1=80=D0=BE=D0=B2=D0=B5=D1=80=D0=B5=D0=BD=D0=BE =D0=BD=D0=B0 =D0=B2=
=D0=B8=D1=80=D1=83=D1=81=D1=8B =D0=B0=D0=BD=D1=82=D0=B8=D0=B2=D0=B8=D1=80=
=D1=83=D1=81=D0=BE=D0=BC Avast.
https://www.avast.com/antivirus

