Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp3429912wrq;
        Fri, 25 Oct 2019 00:52:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZl+M72eXjlZkDro+AQPU/I01ls6FKzmP6CjJ/+MGTz3AiR9TBWWVruLZaQxPEgPQ55NgP
X-Received: by 2002:aa7:d358:: with SMTP id m24mr2438313edr.204.1571989940952;
        Fri, 25 Oct 2019 00:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571989940; cv=none;
        d=google.com; s=arc-20160816;
        b=klv1YdYzDY3Cd5VPuxBW1Z6hN2KtF0bvoybv6ELg3sSBDdpAzatJW5Zal85/C4Opev
         BKjVlrbbBLmLvRL0MFDMeD0hIgaEDKRP/nZc5S6mLmm22HeMN9h2H3IRBmVNWIpv+xMD
         rTwcGAQPrG38WhBf47tjNh5h1zi+6hNJoZXx/0z5p8p/Ozz57ykkAa1GG3kkEIRRWZlb
         sRl9XvFe3FcwNPw/d9LnxI7qzA5NYHibFtu/84c8s9VamtYRB+X/gjnhV2pT75uIrp6X
         tAhlP8ewlAoGnO7q1Xe29Z5l6u33E0/SEg3OTp2ruTYcJlVGGtIoO+yUpWRCcrmeAP8q
         V6pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=XP//ryC5zdvWs+33gGGnpYah1Dow+rivue6x0IfqQuQ=;
        b=ADr9sQSORwbzkWyHOXMdXUS1BIymsRnvxYTU8n5NTfGAXR0crpAvQKZWxeJfZYuilP
         3HS+58QOqz2ZqCnl9hQjnQei7Xq2ZGtjpwb1QFo7ScDp97AIoGk0eREkqgMid289GJJN
         Z7KGx6S768Hr9vSy8Yk99FY+mtK6hfZ1rT8v4qrrPCyz2K3qmg5kth7JRpnlBNxEu4FT
         K9wh2LYVaLmZANsL+BVyXbuKgqHx6zLyPVC2EbX5B4oTUA01yRl4PqtGrQVPEO9MFdbn
         aU+KLH5f68lPuf0BSTWpoLBe1FVrnT/3CbfXXbCeIMjSI/CKt/4Vw6xUENWLnbIBCOaM
         DsoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lp7KW+xR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12si657632ejp.425.2019.10.25.00.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 00:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lp7KW+xR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNuOR-0004O5-Mw
	for alex.bennee@linaro.org; Fri, 25 Oct 2019 03:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNu7c-0003k5-6w
 for qemu-arm@nongnu.org; Fri, 25 Oct 2019 03:34:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNu7b-00082F-6Y
 for qemu-arm@nongnu.org; Fri, 25 Oct 2019 03:34:56 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40521)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNu7a-00081v-W4
 for qemu-arm@nongnu.org; Fri, 25 Oct 2019 03:34:55 -0400
Received: by mail-ot1-x344.google.com with SMTP id d8so1328903otc.7
 for <qemu-arm@nongnu.org>; Fri, 25 Oct 2019 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XP//ryC5zdvWs+33gGGnpYah1Dow+rivue6x0IfqQuQ=;
 b=lp7KW+xRYk4T5+j8gUO0S7NXqcQ2uAct/CDr+DUJQ+5FQiXCJc+45lzUsoUufLtfFr
 uWdkrAe2Q/xrOM23gVMOkYzaN0dZ+knqXPvWXmOFrQTZvO2QE3chRbt04BuAtrH+MNiX
 cc0l0QkWYL02dOQ00fVyGBhNPjHft2QIyMTpAvo7Hhg1iwWRNFdDNNyVS+98PUV+KKXU
 CQUtwP7xH0HLFQrx4Sqyc1d8MqJR0o7aHzr/2rv52vWF/MQvE9Ov3vPQCZBeVXNAW/3P
 +wQAzXtALS63A5dmGD6lq+vagCG0SJcwpaE72TgLwLwCmhlxDlJOtL2TrNW4WjkPN1+Y
 aD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XP//ryC5zdvWs+33gGGnpYah1Dow+rivue6x0IfqQuQ=;
 b=dSks4b3rtYP6MhBf8Dop/AK+sJoPtlFXZ6H52QEElBF8UdMf4baI/jfTjd2wZ3zRsK
 vQ+2NodEqHeSdvulTjKgc5FnFP1yQDJvBMfegCoIUw7JTcugEQo57PfnLIMlIQ+nd7sh
 ZvE8QKh5K8xEqHarTfeRtlVzYM1NfKD8ZPuXk3whVw4tRJJr1GwmdoFzV0IhSP5aM3CD
 LUkQhY2kxldfUSC+6s6Fx1BnZ+HuwC89KeHzyilx4ztfvWoK2U/WTlO7lSqh6uaK7O3E
 725c6q4hElgcBBXaWpmaNb6k+xVp5pDy/wesRvkcjdEYWZL2UTVFJugFzr8Jp7TnQTkd
 DSow==
X-Gm-Message-State: APjAAAUIfzwHvVGEMuswJCu+K2J5F89A3kdwblStRUDXynA0rQC9gYPa
 W04aFbDg+Hhs3AbcwQ/mQm/wwInsAwVJLV5qu0MVRA==
X-Received: by 2002:a05:6830:4c1:: with SMTP id
 s1mr1622740otd.232.1571988894396; 
 Fri, 25 Oct 2019 00:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191019234715.25750-1-f4bug@amsat.org>
 <CAFEAcA_WTyJ2AWZfKQSipFmn46ztG1XTL9sE9P2QDD7ob-FKFg@mail.gmail.com>
 <CAFEAcA-0qg+VbE6VQpdCAX5g6=GzZG18j_FoiamHR8YrKHrmFg@mail.gmail.com>
 <345d8200-6b8d-2708-ef16-c34698a5bd9f@amsat.org>
In-Reply-To: <345d8200-6b8d-2708-ef16-c34698a5bd9f@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Oct 2019 08:34:42 +0100
Message-ID: <CAFEAcA_Xnc=barPvVe5=+KFdo5ibJdmuqRkX21zZ4a9n4q5Wbw@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] hw/arm/raspi: Add thermal/timer, improve address
 space, run U-boot
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Rob Herring <robh@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Pete Batard <pete@akeo.ie>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hHfLpb+XJIFi

On Thu, 24 Oct 2019 at 20:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> In my patches I stop using system_memory, each CPU use its
> own AS view on the GPU AXI bus.

That seems an odd thing to do  -- is there really no
common baseline view of the physical address space
that the CPUs all share ?

thanks
-- PMM
