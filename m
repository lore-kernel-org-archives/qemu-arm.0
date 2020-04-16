Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2024436lfm;
        Thu, 16 Apr 2020 09:42:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypIJnCz8dq+tk6yk/jpmpeaceXiuIBjfDS9oJnETWYLtwEiaG2d8vQte6z+e10AXurmRHpNe
X-Received: by 2002:a0c:aa51:: with SMTP id e17mr10678044qvb.95.1587055372794;
        Thu, 16 Apr 2020 09:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587055372; cv=none;
        d=google.com; s=arc-20160816;
        b=FxPmjCUdvesBxlU7e0JU+4nIP1zmDSsQ2SGHA/f2/MpV4e7HCouFPtkSMPBfA5alT3
         TlBH271hfPOzbzOf7ql/haWrgfHoukw+0Q00wM8ZQ6F7kVPh0aHrVqvUhCtI+e4H6lSJ
         GQdfo+n7S6vsEx+h1329s1GKNJIRT2L8EsGxm/cq4sEt1yKEB0isYeWPDC0y73YT5Nhx
         Dw/svK6AQXeavkIo3qrwOZ4ZsgOhUaYVpsCE2kD5ak+xl4Ot9QPDmO7/CMLe9xDeyVyc
         Ud9DwiBxP/Na9DmllDIbAPpek8ZVeJKapTlniWq43ZgO1OIWtJUm0NQAVsd37H0pOg1O
         h6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5BdeQP5buwuaCPoSnZDcP6t1GFG6iOsZDMGobvDcraM=;
        b=wj83R8dbuUT8VI438QiJM6irl4rli/71fHxK7lN4ocvyGHzC/0iMEx2mPF7cGrqzSC
         Jsfma+AyQeFy2lFqqQ59GjeMoHrcs8GK5ho0XrXgJI03l2Se1UM/0bVuxhi8jYXszmw9
         hEq1gC4dIPEuU3wk7M2FBcJrxqGd4MZ0X+I+2/8YqpWSBwQ2ZNKMv3KV44A0sKya4oGV
         r5ZdeATV95xMzirEIBNRWZ357KMefNTkvQniCkQZCkBbWoo+prT2JAgyle2vDxzA1iYx
         GyZTF0TGcfNUasg0ed0uuQxVZzdyc0quv3Sc8L0KidXnhFw09nVBJByo6rFi9WEdljE0
         GX/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IvxpVh3P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3si8634679qkm.254.2020.04.16.09.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 09:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IvxpVh3P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP7bI-0003N4-5y
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 12:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60249)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP7bA-0003Mh-95
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 12:42:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP7b9-0003t5-CX
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 12:42:44 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34137)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP7b8-0003sC-LR
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 12:42:43 -0400
Received: by mail-oi1-x244.google.com with SMTP id x10so7674917oie.1
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5BdeQP5buwuaCPoSnZDcP6t1GFG6iOsZDMGobvDcraM=;
 b=IvxpVh3PssQTt53pZ6eR2pKhdO72MPeJTr328mcvrTn09JhX56KTI8yvpr+Lq9n6ok
 p0Ik9L1B2XiHJzm2cUDDPf9u8Pg/1ym4sW2THVs1KLDF49SMZyNd5l3hz7Z5azslFfBx
 3Cgjpes7+MUFKvVTzdzx0Q9sx+ZX968P+AnVw+076i8BBT52ofaFKpIomYD3GGBwuGm5
 dOT19YyHsZJPCrI9LLkSJlcHnDkB2R5t/ETIzo2oKp1ucmXme4XxTxFH4KH8LXfBu4Md
 mPbPWvDeKy94Gv0RNlybzddWTUkwtZey53pMasEcU3QXddj+nKK5/5PEor2sk4piUxIL
 JBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5BdeQP5buwuaCPoSnZDcP6t1GFG6iOsZDMGobvDcraM=;
 b=Mdjq+sfT4LW5AJOWcipHfYPYcVQ7HwsVzay9Ajx0EXHXuAhJfrqKhJLSsbvsqhloxG
 +rba4q/f1+XfEUJzXKZH2IsmZD5EpQHafmxmOGm/ooCEHN4gXcA8z0bTqC2ZkrLB3/w1
 Jft5BNnQB5sS2x7JTbXhtXkMKDuE58VomBfpK2w8KTeNW4ZF3ohzaBePlyau3jjpfnZT
 kiO1Ll+/imVnXsSnhvltDDmukkcyNiJqwisoIVT5k6IVKsC7y9/WWkasFYRW1sIE1S3g
 NiJWHqdNRGvqwjXaq79f0TbgH17pLfTphj4ygeAABRQDf9yc2zg2I/okonsapVsLnD2A
 xvfA==
X-Gm-Message-State: AGi0PuZRGy10XLObJ15w1C/vHezRg5jum6vuJWVNHSEkr/e2inSNbmTp
 DPgEtNhzW5ZRjJaS3BW6P7m4F7fKYWpNP4kfsknHDQ==
X-Received: by 2002:aca:dc56:: with SMTP id t83mr3349854oig.48.1587055361541; 
 Thu, 16 Apr 2020 09:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200404122718.25111-1-edgar.iglesias@gmail.com>
In-Reply-To: <20200404122718.25111-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 17:42:29 +0100
Message-ID: <CAFEAcA8JFo=-zUYE6gp3Dg2wux-cHGhHZ5hG6BhrhJvwtRyRUw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] dma/xlnx-zdma: Fix descriptor loading wrt host
 endianness
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: plKRq7CD93R4

On Sat, 4 Apr 2020 at 13:26, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Hi,
>
> This fixes the endinannes related bugs with descriptor loading
> that Peter pointed out.
>
> Cheers,
> Edgar
>
> Edgar E. Iglesias (2):
>   dma/xlnx-zdma: Fix descriptor loading (MEM) wrt endianness
>   dma/xlnx-zdma: Fix descriptor loading (REG) wrt endianness



Applied to target-arm.next for 5.1, thanks.

-- PMM
