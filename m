Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp135691wri;
        Fri, 1 Nov 2019 01:26:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdfzAvpPyXOJDZwlsH3YOdVEdEpZkvV2aie2uVHEDQuNbFfJ9+MVnjRrsgSKOAqEvFawjC
X-Received: by 2002:a17:906:913:: with SMTP id i19mr2136811ejd.23.1572596779134;
        Fri, 01 Nov 2019 01:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572596779; cv=none;
        d=google.com; s=arc-20160816;
        b=BqAsBKqY01kMfEl5EhejOQOlBjEpAdWa9g4NDJtJXCnfSSJKv7YwjtS3fhHyilBpXG
         F6lrJjb6IOIWe0OgDq5iV2yh6DBQpBGchRVMTyQEDsPrm9dNjl1Wu7erY3+pbYOAoGK7
         +7Folbx/8sWi2X6RcZGDOSNSy4ILftJmaZvt5JYqO+aW1MhqaP6Z2AazFqccOttoKnYk
         ZEtFi8/v1cvCRkU2vtyc/+jF2HxWVsXVGBZk5/qjQ9edqFuIgMLZkzcfHIm9EeaAg2nU
         wdxcj+m3rb/FgLRVT2e0mTGnZn+tCvhTzjbGbZDvzqLGyFFP6sF/x7ubTyCjuZDyA4l+
         pkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sbeKhEjQCX+T18ZQtx1UfiIxbNkhOWlH/7+HDAJnBtA=;
        b=VXSwliwL/PT64UJ8+96J95h44zrPbZgrm8wN+t+lDig570trXTxE6arKj/lSkqEmUq
         g75zSXTY4k175PH39Db1QvwmxG3p84gg2vUob/iv+fcSrKSvYujX5akEa6hmd+Zzn+wb
         G3zZCjCUhY5gXG4NoZlnA2zMQEzTWIdDFd0APJPH4RbXupLcwhhd4Gq7apq2s/NDbIDj
         o9oKyqVb3qjjHMFEFRzpMsUs/XYxCrMEMGqd5fQh1zpv6wdOZ6KWg99m+uGw3jNdDZ+2
         PkZ44UsEdW4Yr4+EOCvPNnxBXZSzW9hDXkLCriSPNajL3WSAlJNad1MgI33+mvVDT2VP
         V4gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xtIEuVoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 25si1954933ejw.349.2019.11.01.01.26.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Nov 2019 01:26:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xtIEuVoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iQSGA-0000i1-56
	for alex.bennee@linaro.org; Fri, 01 Nov 2019 04:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52354)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iQSFx-0000h3-SZ
 for qemu-arm@nongnu.org; Fri, 01 Nov 2019 04:26:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iQSFw-0005Hx-L1
 for qemu-arm@nongnu.org; Fri, 01 Nov 2019 04:26:05 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iQSFw-0005BW-Ek
 for qemu-arm@nongnu.org; Fri, 01 Nov 2019 04:26:04 -0400
Received: by mail-ot1-x344.google.com with SMTP id 89so7698417oth.13
 for <qemu-arm@nongnu.org>; Fri, 01 Nov 2019 01:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sbeKhEjQCX+T18ZQtx1UfiIxbNkhOWlH/7+HDAJnBtA=;
 b=xtIEuVoGLlX3GhEYev9F5T1M4u9orpchY60p8++2qmASwIzBy32vRiTKkfiIyOXAnr
 6JXIXxJW2K9dr1jG5uhu5CeeyH0Pghs3QY2tEv9YxR202TN58vKVJBAqMFPYjU1DrFf6
 3qAXhLBhWQYwuHojSFEfxbRZxz0fkOE7tYFhLb19jHUIj9ANOzTa0HjurQKNrbVcCeSI
 ntv1JYLUHu0wTx3ySXdY9eZkBxq6cJc3WfCuAXI1O/ALoGc2c6BBStdVUoxMVBOr26+R
 8d6G6CLnsiwBHSQ2QT1jmcI/XL2UlB62yK2/V3Pc3UydfAw2CWAG0lnU0wOcFattr3T6
 p0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sbeKhEjQCX+T18ZQtx1UfiIxbNkhOWlH/7+HDAJnBtA=;
 b=KS1T2gAb48koWqMiB265wtEcVJigTvnQNmomHZEyalYFeJB0H9c45MbQrkVcAk2ugA
 uLzjNmsUky69V57w2dZpFVqVqYh543S+rs2vnu4IvK4rCN8tLPD8U8CI8JpaInmegT2P
 bK6cMMKAGeqS2R/v3dyo4DItSkW/uHw3CFi3USj0oz/zs4gvIUvm0YdbSoDRMHo8boXo
 +DIl1l+BtM7OoAfNgmfEhHkoLuog2WWhM9T/BKAzOxozsdK/kQXIOtwzhjgs9/iSrByF
 2qYyx/p1epDoG0GI2LSrVSfvIrtoE1tLxE2JiHvG5tkeYuYm5z7jNh6al/RS71brDxdC
 7afw==
X-Gm-Message-State: APjAAAUFesl4OETiiQvOJ+qRnaEJCwwPvWEcsJU3fsLifvambd8LRkpS
 BkIw503nH0xzoshaxmHqxTq9qAS7BZPrUHSRllwriw==
X-Received: by 2002:a05:6830:1b71:: with SMTP id
 d17mr7830338ote.232.1572596762929; 
 Fri, 01 Nov 2019 01:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191031040830.18800-1-edgar.iglesias@xilinx.com>
In-Reply-To: <20191031040830.18800-1-edgar.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Nov 2019 08:25:49 +0000
Message-ID: <CAFEAcA9HJR+YDrfDYvH02vn1sofuhFt0=Avs1XDfJnHr3rcwOg@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] hw/arm/boot: Rebuild hflags when modifying
 CPUState at boot
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: figlesia@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
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
X-TUID: 1Nsl6TUPK5R7

On Thu, 31 Oct 2019 at 04:08, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
>
> I'm seeing asserts with missmatching hflags when doing direct boots
> on versal. This patch fixes the problem for me, rebuilding hflags
> after boot code modifes the state.
>
> Cheers,
> Edgar
>
> Edgar E. Iglesias (1):
>   hw/arm/boot: Rebuild hflags when modifying CPUState at boot
>
>  hw/arm/boot.c | 1 +
>  1 file changed, 1 insertion(+)
>


Applied to target-arm.next, thanks.

-- PMM
