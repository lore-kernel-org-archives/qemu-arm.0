Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1849719lfm;
        Thu, 16 Apr 2020 07:02:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypIrlN9QrNHRaMOmmLG/IY+inxy9NKO9iaWT8Y/z23GlXkW6WesJCG0wa1V1UFgy/3LRJlUy
X-Received: by 2002:ad4:57ad:: with SMTP id g13mr10479376qvx.89.1587045771821;
        Thu, 16 Apr 2020 07:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587045771; cv=none;
        d=google.com; s=arc-20160816;
        b=S4VG3L97zk/xMpAvqQY/ZCdroI+IhJH4XjwbLR+WeTnEzQF8E1d9bmuOHbIu9ijgpV
         D4BfHJQ/rP0eN8vlz4zIqDJHGaGwaVapQV1uN5f+lBgnHxBdMxfciddLqlC7Z2kCFZ2x
         1GG/aeIsPNKXlPnnmjCd74HO7uOd2RCE5gWiMTcGs/OfqBr/kkPFVhOuIFT3cGAh9tRC
         WU5v8CB4uSqWdt837Dfxa3+FoNU4jho38EUXQmV/rPz/Bl0pUdxC8hsgg5kzhYpj/Pgj
         EdVYizcRtlR0aJv2/GO9nr4FtZ3rY3s235d+NU4O8vST4Vyvjax40ZFvoNcZ219Rp1dQ
         FmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bK7H8mZBC1M9jaa+zdop9zDdD2J3ilKiMpcnXRm9/wc=;
        b=ALj9u77qdNvUrYOnReOmugo7Bo0qHq68GBAXwmJpzadxopXeAgqdbKEApDpP5lui3m
         wEc5J84mHYmDBIZD+4gJb7tPR37yjSVGypZql+/MbJy97fY7/G4EXE1h9H9G2kjSgSt5
         eFLNrfyR9twMm5TDAddnZFg5pWukAIB9uYRenFOBv1lZe/hVCYGABU0V4VV4a07nI4Wv
         BITC37ClJWsd/hfKG22o9X6Wt7uDjaJu7Dc9kUWG55yuiSvwHCSdbUp0nHx2WwcL1/ia
         Jk5HYfxMG7jcti1I6eg0gAVhXiZqvEd4QLggKZwhzAqiqMBvg0o7v4DTGbdL0mvBLF/v
         8svg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S75OjJEU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g26si11029977qtr.112.2020.04.16.07.02.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 07:02:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S75OjJEU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP56R-0005Yi-5d
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 10:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP569-0005XE-4G
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:02:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP567-0007uz-G0
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:02:33 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:33938
 helo=mail-oo1-xc43.google.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP567-0007ta-0N
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:02:31 -0400
Received: by mail-oo1-xc43.google.com with SMTP id q204so670037ooq.1
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 07:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bK7H8mZBC1M9jaa+zdop9zDdD2J3ilKiMpcnXRm9/wc=;
 b=S75OjJEUYpb6Z8Ok91mLrz3lPxofemMNkAQA1i3r6UhQPpDgwDrlfyGb/w8paViyEC
 rQZ0Y39Y1slvIdhcQTdZSJL1qwTFYQRRrjpkU8AjNAcAj1ncnYW9ndpkOVmqMKLRjE0g
 AWuGETJV2o92M9d8JNUDAjw1xnE0JRg1jV4awo8ocR3quYZus/2zojs8IYyEqXToEWwW
 NvKRf8jYYN7Y3M8mkS//cwpUH34XwsEiHhXEGb4O3YLXd9qp8tdGiInT74KWH25l+bax
 xtv701IBjfmMe9ma7ZFjukFwgas2g34GXpaxLXBPwkkY61L5/GraJPoZO+PacRZnvxko
 a9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bK7H8mZBC1M9jaa+zdop9zDdD2J3ilKiMpcnXRm9/wc=;
 b=qtpyl+Ood2P5oVPfZsDy5NMxpIIzhhejdH8/RyRRmkHb+hI/UPpvTboJPWIFMkDgcm
 qakz53x8DE9psoYX1R4kHO9gfMgGAFc1A2+Ho98suVirKVFrhEl38NI7KMi52c6Gavqh
 b87ElEzNRYYYydJFv4exbjV+SxFB7xe6Q/+uFalfeaVAOVgQkRw3X61Sa+2GXEw8HiPh
 SLvSJDZBxB79lm26n1N/0tgNntZTMzJLqIo4LLPHoR80HdF+w+HbEMmcaPJimcyHYTZa
 XTBt7bu0aqgJ4VWQnx09MCUsEyff+aW0JTWvbNkcm/7SmpDfkKp91gu0Tp0S6G+B9/SW
 dmqg==
X-Gm-Message-State: AGi0PuaBZEX7GpkJEW+8uIO417Bk40uBTzfj5BZHmm9wNu7sQr2aRdMK
 k61rJbOsxKcXNilgPUUAIA6+N5QrcdNvB7oPOGEjrg==
X-Received: by 2002:a4a:890b:: with SMTP id f11mr26704869ooi.85.1587045746654; 
 Thu, 16 Apr 2020 07:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
 <5e9863af.1c69fb81.dbe22.5caaSMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <5e9863af.1c69fb81.dbe22.5caaSMTPIN_ADDED_BROKEN@mx.google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 15:02:14 +0100
Message-ID: <CAFEAcA_-fcGUKoo955jeHzNDDVTKCsgvH6QGqUWu0efAyth1rg@mail.gmail.com>
Subject: Re: [PATCH v25 00/10] Add ARMv8 RAS virtualization support in QEMU
To: gengdongjiu <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
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
Cc: fam <fam@euphon.net>, "xiaoguangrong.eric" <xiaoguangrong.eric@gmail.com>,
 kvm <kvm@vger.kernel.org>, mst <mst@redhat.com>,
 mtosatti <mtosatti@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl" <shannon.zhaosl@gmail.com>,
 "zhengxiang \(A\)" <zhengxiang9@huawei.com>, qemu-arm <qemu-arm@nongnu.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, pbonzini <pbonzini@redhat.com>,
 imammedo <imammedo@redhat.com>, rth <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4EtpOGP1vLmD

On Thu, 16 Apr 2020 at 14:54, gengdongjiu <gengdongjiu@huawei.com> wrote:
>
> ping....

Hi; this is on my to-review queue, but so are 25 other patchsets.
(I've built up a bit of a backlog due to concentrating on work
for the 5.0 release while we're in the freeze period.) I will
get to it eventually if nobody else does first...

thanks
-- PMM
