Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1995272lfb;
        Fri, 27 Aug 2021 15:37:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI4jEV8z2wZIwZ3k5Z7e0AJgEq3mhpMoVsUObwQdcQ/fldreqMZ3NLPuZTJ5HJvbgPJqt/
X-Received: by 2002:a67:f14d:: with SMTP id t13mr9481145vsm.29.1630103859841;
        Fri, 27 Aug 2021 15:37:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630103859; cv=none;
        d=google.com; s=arc-20160816;
        b=zac4m4iedEkLP5zTyTiCj8+e7v0Wp8caIFk+tvuTD3aOQ3+y7rJZ02Jj5yAOtr/Yak
         b5yCSnIQMqj5JZ+ghvw2uA5gTU00M/AO5bL5KIaVZraE5EYncQ+y3mmoHqVnMPFU3Ye0
         4kz4LMGay0K1ltUQfLPAe0FuPG9QSr/bFcSFTZOWpYwKpW5J1jdbNDFQyvoJU5+AYM8s
         wFP+bFEWtaF9Zd+VIMZ0gwXZj74LKNFMFxSyJW6Tf/v0GqcHXxTHvtjZOO8UeJPIoE2a
         Y64PhuVc74hB8GCMmJUTWPWvSeXw2iCOAmsBjpArLse7XSLnOAqqmG+P5mjzkZxzfubz
         04XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=48G+dcTzvJQezWxTggyi6qtUfUfRkYPM7E/x7/W4Kjc=;
        b=MPvZLT/7B2FoEqXHhPxWVGziMvSu4KWjQDy0XW2la8Q9bFZR12/xcPlMZPeHfkUtuH
         7AAgucXYnFwp6yPYIHt058/4s+U9mTZ7SG7oEkIRveubsjmQRavsmhxFedrZcnKgWoC4
         QxnuSD9LutgNt9zIlijqEpLWpbeM/521qTGnQrfGqo2HlJjvsQa44gcBJO32724kACao
         ZMn6kbpo8GdhmF1+r4y2VUuzdqfRwAoqiD+TWrcd/mMMwHoqgXjhSKbQZuTjCNKU98d8
         W01Wuc4kUdvtQ1zpZ4ofRLuSeEyM4kba04TDlOWo4yARIvrloJjtJwxt5tCDEFH1ucqP
         Tp7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=TZpIy358;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si4379135vsf.261.2021.08.27.15.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 15:37:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=TZpIy358;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:39292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJkTj-0005Us-49
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 18:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=78736a82b9=pdel@fb.com>)
 id 1mJj3R-0006WJ-Co
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 17:06:26 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:35416
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=78736a82b9=pdel@fb.com>)
 id 1mJj3O-00038O-Cu
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 17:06:25 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.43/8.16.0.43) with SMTP id 17RL2vgm023210
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 14:06:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=48G+dcTzvJQezWxTggyi6qtUfUfRkYPM7E/x7/W4Kjc=;
 b=TZpIy358Vroq/P54TChMGSV6GaZ7qT8VTZQkwQTTFT7hgvNSBotu6r9E/8PMYD/YX/cL
 ARJ3cIhY/y6lsDJdHejuyQ0uVqcoZRiwgIID/Mlq6B4gUZJ8NRmsB2viRue3X+ZLBUP3
 Nzszvj9Pr43LtCvyWvTTP+fEuDQbrxaDM2k= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net with ESMTP id 3apmvtphuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 14:06:12 -0700
Received: from intmgw001.27.prn2.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 27 Aug 2021 14:06:11 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 0AC51E74BFD; Fri, 27 Aug 2021 14:06:07 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH 0/5] hw/arm/aspeed: Add fuji machine type
Date: Fri, 27 Aug 2021 14:04:12 -0700
Message-ID: <20210827210417.4022054-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: yiuQqBVibpo8VhnjkY16MFHJSDLyTzW1
X-Proofpoint-GUID: yiuQqBVibpo8VhnjkY16MFHJSDLyTzW1
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-27_06:2021-08-27,
 2021-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0 phishscore=0
 clxscore=1011 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108270124
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=78736a82b9=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Aug 2021 18:37:28 -0400
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
X-TUID: tWFA+irfNcKT

From: Peter Delevoryas <pdel@fb.com>

Hello!

This patch series creates an Aspeed machine type for Facebook's OpenBMC
platform "fuji".

The first 2 commits do some refactoring, to allow Aspeed machines to
configure the first serial device. Most board configurations use UART5
for the console, but fuji uses UART1. Neither of these should change the
behavior for any machine types.

The third commit adds the fuji machine type definition, utilizing the
"serial_dev" option from the previous two commits to configure the
console device as UART1 instead of UART5.

After the third commit, you can test booting a fuji image as follows:

    # Build a fuji image from Facebook's OpenBMC repository.
    git clone https://github.com/facebook/openbmc
    cd openbmc
    ./sync_yocto.sh
    source openbmc-init-build-env fuji build-fuji
    bitbake fuji-image

    dd if=3D/dev/zero of=3D/tmp/fuji-image.mtd bs=3D1M count=3D128
    dd if=3D./tmp/deploy/images/fuji/flash-fuji of=3D/tmp/fuji-image.mtd \
        bs=3D1k conv=3Dnotrunc

    git clone https://github.com/peterdelevoryas/qemu
    cd qemu
    ./configure --target-list=3Darm-softmmu
    make -j $(nproc)
=20=20=20=20
    # Attempt to boot the fuji image: you should not see any console
    # output.
    ./build/arm-softmmu/qemu-system-arm -machine fuji \
        -drive file=3D/tmp/fuji-image.mtd,format=3Draw,if=3Dmtd -serial std=
io

You shouldn't see any serial console output, because U-Boot hangs in
clock rate initialization due to a divide-by-zero. The last 2 commits
fixup the clock registers to avoid the divide-by-zero, and fuji boots
successfully after that.

I organized the patch series with the clock rate fixes last because it
was more natural to test the behavior before and after the fix, but I
can understand if you'd like those patches to come first, or to even be
added completely independently from the fuji patch series.

This is my first contribution to QEMU, and I tried to follow the
wiki/etc as best as possible, but I'm sure I probably made some
mistakes, so let me know how best to submit this.

Peter Delevoryas (5):
  hw/arm/aspeed: Add get_irq to AspeedSoCClass
  hw/arm/aspeed: Select console UART from machine
  hw/arm/aspeed: Add fuji machine type
  hw/arm/aspeed: Fix AST2600_CLK_SEL3 address
  hw/arm/aspeed: Initialize AST2600 clock selection registers

 hw/arm/aspeed.c             | 20 ++++++++++++++++++++
 hw/arm/aspeed_ast2600.c     |  6 +-----
 hw/arm/aspeed_soc.c         |  6 +-----
 hw/misc/aspeed_scu.c        | 15 +++++++++++++--
 include/hw/arm/aspeed.h     |  1 +
 include/hw/arm/aspeed_soc.h |  1 +
 6 files changed, 37 insertions(+), 12 deletions(-)

--=20
2.30.2

