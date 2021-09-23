Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp938673lfp;
        Thu, 23 Sep 2021 00:38:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvS2b6r2uQ4Qh8N7QT6uwvMVm0J2rWA4hUa+01FpsHu9mhUezBUA/8sDVEsPa5wGtclqu6
X-Received: by 2002:a02:a46:: with SMTP id 67mr2742544jaw.142.1632382732229;
        Thu, 23 Sep 2021 00:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632382732; cv=none;
        d=google.com; s=arc-20160816;
        b=nBP1gcCrDf9LV1zCDYys2RrWSQMZkAVnP9wHEplbBuuXaKHeagRETazcv1GvmWmVtD
         Trf/NXVe2ho9orcLNIIF+s9HYby+G8wxJkZqHcXLR9rfD6hbweovVqdLleyp8nTUhS7q
         /CieAfy0XxQSKYBpsTH1K8mqFxDv5TPuyF9a3xiz1RWmAd+vbb2ocP3oP0qhubVnxf0j
         Xigy+a19yA8ENr3v/jKmfZ4UEBWkMk+r/MRnqFaE9bnjQIocwfPahixsdacw+esDAlpw
         ZbGBn1FqDfyq3lofli5MeBgaUUZU/StFyxRWTxYD9GttkFpiG+GI/3I6oP9ZHGJz6dLa
         njTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Th0IJsK4jb2kueIvDdWkAm/nVtPPOkhCJi8OLCBVSFU=;
        b=aEubHJL4vhsL1UcqEk82bZl4mqMQnbsvW8/lSdPn6ZhzXXalJ+9sK/zUBSTDHCLnBg
         zL4JEwhhrNz4QovCBo1juEBAKJoQ4ywhIk3yEFNEX99QhCDWs3s6uD+j/iCgiP9xJS1m
         JCW20EHOudzs7HfV5tYrXU4bCAg9RPc0XziX2OeHt8053NQkEVoOus/EETtDnWdilKjJ
         ryG4KDWTebhn+kazWKuwXQGbzOfQO10K2DLQftk2BvuDoUNHYQDoFwEWbyFddOjqVHd4
         eTpKSDkjrMGzNMQV4fu7jyMCItaXaMd1XAklptLjW4XZ9VCr7p2Cj4njc2wBEEhey5Mz
         yzBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VZvk1eAX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19si5643609jat.22.2021.09.23.00.38.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Sep 2021 00:38:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VZvk1eAX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTJJj-00012v-Kw
	for alex.bennee@linaro.org; Thu, 23 Sep 2021 03:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irakatz51@gmail.com>)
 id 1mTJJc-00012k-IL
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 03:38:44 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:46744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <irakatz51@gmail.com>)
 id 1mTJJa-0000nL-Sz
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 03:38:44 -0400
Received: by mail-lf1-x131.google.com with SMTP id z24so23405274lfu.13
 for <qemu-arm@nongnu.org>; Thu, 23 Sep 2021 00:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Th0IJsK4jb2kueIvDdWkAm/nVtPPOkhCJi8OLCBVSFU=;
 b=VZvk1eAXaXxi6uyFRuceUcrOKL/BugrOVQ5A0U+A2ispzoc6Q2nnwSdLeSBdjYT7ql
 hYdi6reB+pPN2XCjrW9cv9Idu/mnbPdsSZxaZ2zUO9meDJWg1i6Lub9psYKd37bpJrjP
 zNhOt9HYdiRPcn6pDJs83ddxH42BP17pe+weCaNeb/rTCUL2CiVehcP8kU6qk6V6eQcv
 3sWJ49f9GuB0phEcAFUhW0F87S/RCglaZykJkj0fI3R8yhfPoGmuyq9f0f/gboISsG2I
 0JBiz+H2wlI2eijPHkDaKhVmC+Hil/2V3u9gcvdwQ7wYJOZQSGveWYfvm7FMyIormZVt
 4nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Th0IJsK4jb2kueIvDdWkAm/nVtPPOkhCJi8OLCBVSFU=;
 b=7mDp6DgsChza06HRRTTl1aa3jIKA+vxdYpnBsCIIiF2xsbo3bXiukRSR1u6l0p6wHz
 4YC2LMEEakeb8l3RUdz7Ik/z+xTBSrpWP4x7Ms2+zBIwCZKKBRPIYTV6EdLggUodzg1c
 ECP+bYp9/f7ETt8azgv93v89XTFXqVfxsrLoZIi7yVN5+1q9G1ChgEGdutZV5Yp3PXwZ
 LKZtnUhHkGr+ogjxf1NHisMU0ssZiVlDHTcDAvr/F1CJgT/yrgpVOGtOa21Ren4HXVz3
 +ifeKos4HzVodn9kJ19u7wZHgSEa8aRzknQmk4uQUnpuKbv+yoFUB8Wm2lXUV6efJp8x
 q3Ow==
X-Gm-Message-State: AOAM532cV1QWn5FyDBnm8XxorMvyeb2BKG7cyyc4Zuf7RGiYAAK9yBGo
 yAiX9hFBnKM5ykh0QbduZTZSgBn+Ui/blhKu5wQO5NigRGQUWQ==
X-Received: by 2002:a2e:4e12:: with SMTP id c18mr3818536ljb.260.1632382720347; 
 Thu, 23 Sep 2021 00:38:40 -0700 (PDT)
MIME-Version: 1.0
From: Chenxu Wang <irakatz51@gmail.com>
Date: Thu, 23 Sep 2021 15:38:29 +0800
Message-ID: <CAFLP=uCeyj+MK_a_BgC27Gr_=MC7w+-_08xJsrUC+bHvV8KWWw@mail.gmail.com>
Subject: Failed to execute "SMC" call on Guest OS.
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002f105505cca4b8ab"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=irakatz51@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: saeXd/qs/B8E

--0000000000002f105505cca4b8ab
Content-Type: text/plain; charset="UTF-8"

Hi all,

In the Host OS, I make a smc call and get the correct return.
Also, the Host OS enables KVM support. (specifically, it supports VHE, so
Host is running on EL2)

Then I run a qemu-system-aarch64 to run a guest OS, with KVM support. Here
I use a QEMU v2.9. I pre-load a helloworld module in the ramdisk.img, in
the module it contains a SMC call.

My booting instructions are listed below.

./qemu-system-aarch64 -nographic -kernel Image -initrd ramdisk.img -m 512
-machine virt,accel=kvm -cpu host -append "console=ttyAMA0 init=/liunxrc
root=/dev/ram0 rw rootfstype=ext4"

Then I execute the module, it says

insmod[1086]: undefined instruction: pc=ffff0000008b5060
Code: 95e2c44a 580002e0 95e2c448 18000360 (d4000003)
....

Why? How to solve this?

Sincerely,

Wang Chenxu

--0000000000002f105505cca4b8ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>In the Host OS, I make a smc ca=
ll and get the correct return.</div><div>Also, the Host OS enables KVM supp=
ort. (specifically, it supports VHE, so Host is running on EL2)</div><div><=
br></div><div>Then I run a qemu-system-aarch64 to run a guest OS, with KVM =
support. Here I use a QEMU v2.9. I pre-load a helloworld module in the ramd=
isk.img, in the module it contains a SMC call.</div><div><br></div><div>My =
booting instructions are listed below.=C2=A0</div><div><br></div><div>./qem=
u-system-aarch64 -nographic -kernel Image -initrd ramdisk.img -m 512 -machi=
ne virt,accel=3Dkvm -cpu host -append &quot;console=3DttyAMA0 init=3D/liunx=
rc root=3D/dev/ram0 rw rootfstype=3Dext4&quot;</div><div><br></div><div>The=
n I execute the module, it says=C2=A0</div><div><br></div><div>insmod[1086]=
: undefined instruction: pc=3Dffff0000008b5060</div><div>Code: 95e2c44a 580=
002e0 95e2c448 18000360 (d4000003)</div><div>....</div><div><br></div><div>=
Why? How to solve=C2=A0this?</div><div><br></div><div>Sincerely,</div><div>=
<br></div><div>Wang Chenxu</div><div><br></div><div>=C2=A0</div></div>

--0000000000002f105505cca4b8ab--
