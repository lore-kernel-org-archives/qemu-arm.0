Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1546142wrs;
        Sun, 18 Aug 2019 05:46:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKpzxUrHg8BKEMdUMlHhKa/CtoLQGFa9r5LivfggELWJXhbo4FXgSWdlu5wUk0KZLtGaRW
X-Received: by 2002:a50:c908:: with SMTP id o8mr20399167edh.187.1566132416654;
        Sun, 18 Aug 2019 05:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566132416; cv=none;
        d=google.com; s=arc-20160816;
        b=0HtBpiSYP0YdB0IPOrYYwzgUTTFu/vlBayAdQZ9rLkndEnMUhg9ywYgW7IUq3aUtKJ
         LJtk4gtcnGvcz8Q+KkMUdnwr7JFA/Uxg/c+jxj/Af9RMWILf5mi378qp13olw9J+JEU1
         0gcwl61QBfzxajNMfNGn2Nw76pj/bzQ7yLifOS6i0+tK9K7EHMf11ITp1lkktWoMbM5h
         C9Pss6neqqQ59hTrzxcZZT3460hUG7bKR3d2bTgzGVPR5vFrI5X+jutZsfuTVrACw3gE
         gZIx0Nh0MaOCYmkobGBuADJqoAGBHYWiyQKGZGeP1/IGPs1abvG/sPl1kvBS7xazeOn+
         ZmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=1pPjYBqSfFQg89Ld6dVuKQx+pLvJBdztHR4jr4QNGzI=;
        b=qnGa1TJgzoWIHH25XuqsYeuzTi8Kofp4wfF25vB0Veh1Cik9hJKKESZvuuIybppqJH
         cJqPy3eeg4Zxa5pvXAaIIFVEQJdPwvh7MOwkM/Z5pnwK45i/H+Y2U5lmKHBsob4WWMoW
         BpJuhLeeoafw/fobcUu4tGpNVXchYcu+pgHjpeEDJUgsZJsXBbwKLeIXY07VxbXnxOL8
         9d/j3s+9lDxM9mC2kVGWdfmxdhNBuhb2il5+SELvPlEWXjXarVmO9mP3WSEwR5t/j4tB
         v3maED1VWAZiemAgvhX2GK7eonjC1DF306WIrYq3Iyh+0s6wbwRi0y9ytjJV+YGCfRkk
         /e9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NFdyZjYe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si7333405eda.29.2019.08.18.05.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Aug 2019 05:46:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NFdyZjYe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzKaF-0000oD-OA
	for alex.bennee@linaro.org; Sun, 18 Aug 2019 08:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46534)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzKa5-0000nf-KR
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 08:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzKa4-0003Rz-BS
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 08:46:45 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44781)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzKa4-0003QO-0o
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 08:46:44 -0400
Received: by mail-wr1-x430.google.com with SMTP id p17so5890252wrf.11
 for <qemu-arm@nongnu.org>; Sun, 18 Aug 2019 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1pPjYBqSfFQg89Ld6dVuKQx+pLvJBdztHR4jr4QNGzI=;
 b=NFdyZjYeAZNqNaLC48b0zxqT4ew0cYYqgiA7yrp97QLfmtvO+ZgMF10JEnSzxPt27n
 2gTEmdztH2Z2nIfQrAkbPMNuVh1fIWw9RCjeFBkdCdquJik5n8PLsyHocdtWCV27JyVQ
 QX9hzgFLel3K5xlO29rrs0/AnLhkf1tkhEiNMcC6IJ+uHdc1AHkK4VAfGxoH270aoFiW
 jhPmktd1panEyPf1lhzi30D5LtUGZkTzN5K9ND0UGMARBYZKgYMda93vbqZyFk62bHGC
 6VyaP9AJ0HTezxkZgWUZ8C1eitZedl/FAJbdS4/uRxX4kDPgbeWwcccZjtnmQKty3WVJ
 PLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1pPjYBqSfFQg89Ld6dVuKQx+pLvJBdztHR4jr4QNGzI=;
 b=L5cqDtPF+pqfBwu7KVI7kcA5L901B6gJoiqQz75tRQZoNfVe4ettIxSR2ovdiXtVlf
 qgdirMKL0kL+6r+0p5YR9ENS5D8ui0x00Wfq/KDsLtS3jWDPbarzZ25bnkidqyNA2AyF
 s0JasPEo5CDKIX3a0BtnJB7R4IerovdkxD8aKgLTXKbW3QfztlTHW4xciZLbW/f9PBe2
 0AxDQC92LhxGl0CvMXFsUPDSLOPZgbY41oNJeST1ENk029Z992RcziegWmqGmun+ZAwK
 lw8Q8A5myJwq5gySN9DjiccEOHHXvk6vzfkmrHOjCFQW9H0SuZu8uSgtucD3lev/YBt3
 cjPg==
X-Gm-Message-State: APjAAAWbZZ9mxZP24Cj7tYFEEee//WdZ+KWeTjstJTLeU9hF/trHqXLC
 eiKLNf+2TcUJFhFSmiWjGYf1QA==
X-Received: by 2002:adf:ce05:: with SMTP id p5mr21186547wrn.197.1566132402599; 
 Sun, 18 Aug 2019 05:46:42 -0700 (PDT)
Received: from [172.16.53.135] ([82.3.55.76])
 by smtp.gmail.com with ESMTPSA id o16sm13231720wrp.23.2019.08.18.05.46.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 05:46:41 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941122698.46462@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0a8ecb15-e03d-c6fd-e9bd-38b4abc7b316@linaro.org>
Date: Sun, 18 Aug 2019 13:46:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565941122698.46462@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::430
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 38/42] memory: Single byte
 swap along the I/O path
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 gxt@mprc.pku.edu.cn, pburton@wavecomp.com, xiaoguangrong.eric@gmail.com,
 peter.chubb@nicta.com.au, philmd@redhat.com, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, chouteau@adacore.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, jcd@tribudubois.net,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, mreitz@redhat.com,
 hpoussin@reactos.org, joel@jms.id.au, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, david@gibson.dropbear.id.au, lersek@redhat.com,
 green@moxielogic.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 marex@denx.de, jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org,
 qemu-s390x@nongnu.org, sw@weilnetz.de, alistair@alistair23.me,
 yuval.shaia@oracle.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jan.kiszka@web.de,
 clg@kaod.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 shorne@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-riscv@nongnu.org, proljc@gmail.com, pbonzini@redhat.com, andrew@aj.id.au,
 claudio.fontana@suse.com, crwulff@gmail.com, laurent@vivier.eu,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, andrew.smirnov@gmail.com,
 michael@walle.cc, paul.durrant@citrix.com, qemu-ppc@nongnu.org,
 huth@tuxfamily.org, amarkovic@wavecomp.com, kbastian@mail.uni-paderborn.de,
 imammedo@redhat.com, aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wRA5iqN3enue

On 8/16/19 8:38 AM, tony.nguyen@bt.com wrote:
> +static void adjust_endianness(MemoryRegion *mr, uint64_t *data, MemOp op)
>  {
> +    if ((op & MO_BSWAP) != mr->ops->endianness) {
> +        switch (op & MO_SIZE) {

You'll want to use devend_memop() here, as previously discussed.

> @@ -2331,7 +2322,7 @@ void memory_region_add_eventfd(MemoryRegion *mr,
>      }
> 
>      if (size) {
> -        adjust_endianness(mr, &mrfd.data, size);
> +        adjust_endianness(mr, &mrfd.data, size_memop(size));
>      }
>      memory_region_transaction_begin();
>      for (i = 0; i < mr->ioeventfd_nb; ++i) {
> @@ -2366,7 +2357,7 @@ void memory_region_del_eventfd(MemoryRegion *mr,
>      unsigned i;
> 
>      if (size) {
> -        adjust_endianness(mr, &mrfd.data, size);
> +        adjust_endianness(mr, &mrfd.data, size_memop(size));
>      }
>      memory_region_transaction_begin();
>      for (i = 0; i < mr->ioeventfd_nb; ++i) {

To preserve behaviour it would appear that these need MO_TE.


r~
