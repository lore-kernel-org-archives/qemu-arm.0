Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp784048lfq;
        Wed, 6 Jan 2021 04:13:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+hu0wa2F5ppp0L0su0+TKaCdKjIC4bdSHIJNaOMo7gSuPvCPl8U0KFsn52auWYf3TaikJ
X-Received: by 2002:a25:40cb:: with SMTP id n194mr5595461yba.30.1609935235274;
        Wed, 06 Jan 2021 04:13:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609935235; cv=none;
        d=google.com; s=arc-20160816;
        b=ikto5mXvWnWorUMblUVVpcj7HTUqItPAdbAh4Nw0lAtmjIRS02izk+h1L+SlECKT86
         B1zAmU1Mg9uR8agPCmub1U4aeGtlwhgE1Z2y6jaVkeOEBsbqIeg8DUe8kyxNVQoDRDEA
         CVid7rpxnoE0q+hqKpaamgvwWeS8DV+HgaF83NxAYOfRMesfd6G/0fUFx1Lc1djggnug
         jFbveCw7v++tVDXw7/0H50lH5AmU/U6HZiKhq6xHZPCuDbVP4YM+UjUM9DdxAsq2lW8p
         LB6Fnzw6WgL+6qr8slHKOhkzQNDNwBIijmIBJurEz6vU7Z/7bZs76n+otDRbyazvFO8l
         2QPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=c+EzoNODPzaBLH17xv1nNpILReIYs1e3B66+EmkgoMM=;
        b=Lws90TxfEpvufRdRZHIWNgz1aidlay4B9zGWCvP4MXuEph8aupPQxkLZaPwxnVF0qu
         GZ+gXEgMu44to2WAH8Zk9jCaNCTVJ6lgsEB1tQBE/8dIaW8XlnjyhYEiInPsKnIpQ5r6
         wAQ3WYLpyeJOkjJsm77KoWI+d6ApTLPat5zaxPlyjxNFpkeN+66mmNKfKe77t4E0J5a9
         n47k1TVp4W41FXRH9byUMhNjmOr3Z1o4j+0/cirBRQFOttdbF9WwZdXEkxYmtCUreG0K
         6l+o/J89kSwPghOSAkfnB0CkkPqR9Uggh4Bp2LWtKyrHvQTO6IDqqvGMZhLqaK7WHSUb
         k4cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SOaUizf7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si2617187ybo.210.2021.01.06.04.13.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jan 2021 04:13:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SOaUizf7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kx7hK-0002jO-Mv
	for alex.bennee@linaro.org; Wed, 06 Jan 2021 07:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yunextus@gmail.com>)
 id 1kx4PZ-0001o0-6A
 for qemu-arm@nongnu.org; Wed, 06 Jan 2021 03:43:21 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yunextus@gmail.com>)
 id 1kx4PW-0007OX-M8
 for qemu-arm@nongnu.org; Wed, 06 Jan 2021 03:43:20 -0500
Received: by mail-ej1-x62e.google.com with SMTP id lt17so4064297ejb.3
 for <qemu-arm@nongnu.org>; Wed, 06 Jan 2021 00:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=c+EzoNODPzaBLH17xv1nNpILReIYs1e3B66+EmkgoMM=;
 b=SOaUizf7Moe+GVf2RJ/oAuNWu5tiZdf9MsA79cizt5BczfuH/4Z3rfDKXRuxoZsi6y
 07KdWbt7mCF7LatGNvfNH77Ow9OK7Rcx0spmOBEy4KkoExUfV6IOfuP1xA4AGzbFUbFS
 SB+Hch4kVMs0vkF2yrTNJx1vabi6Of7mcnL2/VR0HxTXW5BiaPjDITHDxoJzoHQGqNLA
 PmtugTYuBe0+FP/9CdbM//e9zAzt3EDd7BLRbo3Q5SUlV/poWL4Bzxs6BSM8nb0YALAN
 Byp49QNjU6yKqJExInQ56wjNoPAnmsD7aoZ2COujcU3DCkgj1gRmjy4D+phyJIvekkM/
 57ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=c+EzoNODPzaBLH17xv1nNpILReIYs1e3B66+EmkgoMM=;
 b=sXXfyPHxSh6VqyXvF2TJUPen+CbJ1vA/VHX3mUxY0TQo/UqSHEhBcp98zX2TctS1g3
 ct/w/FshW5g/z62H7QxPMoEnmUTGNNlk4E/ScdXrqtzpn1Tb0bvAV5zWnXWhfIWNqlGT
 ooFPr7YM6VWnrBX4DAvd5cGKvOpefNjOstAKw4AcyA0Lgcwm+cCTgoOeQ3JsVStP7A+/
 siA+55hF99NhXdpVo+La4W+9UoXazYO6bpvEcivHBIyfnTBekYlW0zp3aauXltgOihTx
 mMIQGDXJmBtM49hHlHlKgxvt1qGd0qxMGsKup4sdHa1on7IHmSRARUrNVapdukHsfggf
 Vsaw==
X-Gm-Message-State: AOAM533TUChXyC/GzBVI1BZvUeKOkGEu+UNENUnzFuMgDlTRt1/EQRiX
 mD9OvehN2UYVIhaf99/50In8MV7nIJlFiCCyk5hcAYbhMRzKig==
X-Received: by 2002:a17:906:1f07:: with SMTP id
 w7mr2117055ejj.519.1609922596661; 
 Wed, 06 Jan 2021 00:43:16 -0800 (PST)
MIME-Version: 1.0
From: Yu Nexus <yunextus@gmail.com>
Date: Wed, 6 Jan 2021 09:43:06 +0100
Message-ID: <CABUrsp+wLFdSDPrHX66gQSXyk1GKS0M29x1g3sOw0UBK9MOe2Q@mail.gmail.com>
Subject: MTE support inside QEMU?
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007d700e05b8375073"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=yunextus@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 06 Jan 2021 07:13:44 -0500
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V+j2LB0pIwak

--0000000000007d700e05b8375073
Content-Type: text/plain; charset="UTF-8"

Is there full support for ARMv8.5 Memory Tagging Extensions (MTE) inside
QEMU?
So is this MTE example code supposed to work inside QEMU?
https://www.kernel.org/doc/html/latest/arm64/memory-tagging-extension.html

--0000000000007d700e05b8375073
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Is there full support fo=
r ARMv8.5 Memory Tagging Extensions (MTE) inside QEMU?<br></div><div dir=3D=
"ltr">So is this MTE example code supposed to work inside QEMU?=C2=A0<a hre=
f=3D"https://www.kernel.org/doc/html/latest/arm64/memory-tagging-extension.=
html" target=3D"_blank">https://www.kernel.org/doc/html/latest/arm64/memory=
-tagging-extension.html</a></div></div></div>

--0000000000007d700e05b8375073--
