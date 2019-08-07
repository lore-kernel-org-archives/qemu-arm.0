Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6732507wrv;
        Wed, 7 Aug 2019 09:07:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz81HXvvTleg0RX6OP6gJ+qdJZPUaDtXoYg1dMxdfHpG2WOqdS2qt637w4tk3d0E6mBGDAv
X-Received: by 2002:ac8:290c:: with SMTP id y12mr8658834qty.141.1565194033632;
        Wed, 07 Aug 2019 09:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565194033; cv=none;
        d=google.com; s=arc-20160816;
        b=CbmBU/314VFkKHhEnDSvV9pV50iG1Y9q0qx++Uah/6Ai9YlwBN4uSgaUYt8wTNTAAN
         c0zP0J6K+Baq46lLbCaiPeY9USFlGUa9p2yKU+O+yjVf3UmogBA56H470OuDh65yAm5e
         HqH0PatDMAB1t7sWoGi7PEOUxyTqXI0B/fLWa2JzxOJfR5Kk0WsCbO0ZwpzCr2TUM085
         54iR8h4JUP7o7Tdu0tSGpl9ADdqhRUtRGjYeAkDZdWg4sCd3Kf7iOr+RStvINRcgyDFk
         Kk8cE2Gx+EuPWpS5WFCj1QA8d9QA1aFF/7G79yF2B0kh8KwSfVZFl3TfjLPpdTp83Kd0
         9V8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature;
        bh=Qq/q21S2LfN6NAbxzP2jsTBKJ3m4kjYanegGNmLakzQ=;
        b=W9EXdnhZy7FKfiptl/QSmE5J3B8ysJqWz/mmGc7HI8Ud0wNoOCx6ma/CXZ6FYvjLtH
         WhLu+yRDF8FCUfLLEp/ugvlHgngVwUNj/2dWtVuHpCI5t3J4EJQ0w22Un98OBDgtXz7T
         eReRTDXmCblYOAw8yrB+69wvXVvW2xr1F+vgRw3PU3JyRHCY38wmoATEeawf5cArq28w
         q/6B56HhHaF2CjPQZh6uJ0D759LNQnar5XwwpaBduFR03njcrXqDOns5nx83MpjOPXqK
         9UBxvRzJ4Ys7pKDytDMGKiqN6fZl37PXN0VSXEruWCHYwwOe/Ll4U+CqWyjk4nvwRu9y
         Wdgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BO7jbmlK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s62si4357449qkb.42.2019.08.07.09.07.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 09:07:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BO7jbmlK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvOT3-0007MH-6a
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 12:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38458)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOSo-00074P-2e
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 12:06:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOSl-0004bT-Q2
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 12:06:57 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:47041)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOSk-0004Xj-Ab
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 12:06:54 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c2so41464608plz.13
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 09:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qq/q21S2LfN6NAbxzP2jsTBKJ3m4kjYanegGNmLakzQ=;
 b=BO7jbmlKDGnmlVwJmKWpYGu5SzuK5OHVlaXrkA/URamXOvPNdz5i9VL4nijoJaodKb
 dBmxAjVjIPrBV0v+f4UtFAEDLm7vG2ee5xgC/nx9forbO/73E5hOFrL+fyteD/tSRWpm
 SxH+rHiWUkXv62yj5kZEehx89ae8+sV1R3zIuH0S0taDYZTUCEDve3u5X5GjTiWkhALQ
 ROoRVqEuegZBEEVzcJJ0kiI/jd6ubTgbGSFTlP1WhZ+6nybVROugiGBMQU2+UmSju6az
 iRxMbr8fgGyzmZFnG/t/73sXpNiEYgwBiCUlMp46lnVkKEOmlpGgp519W68+Hlbq1xsU
 Bhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qq/q21S2LfN6NAbxzP2jsTBKJ3m4kjYanegGNmLakzQ=;
 b=LEfXISFYPze6fVBLkvsFCBJJa8huYWbm/omYAaR4LgAWclKV/PiZdcEU/lov/1ZS78
 1xD7ON6uAhBXtiqQkoFKowA81xfnCiuAwd0v7YB66UmTPggkLagFWpc65cUhYWJRMFLZ
 FNEy0tpkYTcklOLc5W5Rueb33vw+CEFhk1fmr1iVLa8HiN98yqlTNz0l9fqgRGaH+HPz
 JpbpYHbxYMLiIYjaUMrAOOaQwuEXW48eIpvTnv461TQUnL3v3nsZtTuk6HxGoYQ7Dcvi
 32e2cK3Sb1wrMzUI42emNHE3M74l+tUbNXe/AnI4nOPCeAmeDAn9+K4Q5Zrb8DuDk04b
 sZkg==
X-Gm-Message-State: APjAAAXxfoEpWw+KX6TxXqM99wPnsr3mTmF3cFQmr/oXFztV+oGUjT+u
 kYDFE++HLgk8r9YDsmYCrVQOOw==
X-Received: by 2002:a63:1455:: with SMTP id 21mr8320380pgu.116.1565194012775; 
 Wed, 07 Aug 2019 09:06:52 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s43sm387653pjb.10.2019.08.07.09.06.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 09:06:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166687895.25037@bt.com>
 <83a4f4ab-03ca-c81d-b7fc-d69a6c2f37fb@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <82ad9758-4afb-251d-383b-802c59b48d6a@linaro.org>
Date: Wed, 7 Aug 2019 09:06:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <83a4f4ab-03ca-c81d-b7fc-d69a6c2f37fb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 16/26] exec: Map
 device_endian onto MemOp
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
 dmitry.fleytman@gmail.com, imammedo@redhat.com, sagark@eecs.berkeley.edu,
 david@redhat.com, jasowang@redhat.com, palmer@sifive.com,
 mark.cave-ayland@ilande.co.uk, laurent@vivier.eu, keith.busch@intel.com,
 jcmvbkbc@gmail.com, frederic.konrad@adacore.com, pbonzini@redhat.com,
 kraxel@redhat.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com, marex@denx.de,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 proljc@gmail.com, qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz,
 deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, mreitz@redhat.com, hpoussin@reactos.org,
 joel@jms.id.au, anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 rth@twiddle.net, philmd@redhat.com, green@moxielogic.com, atar4qemu@gmail.com,
 antonynpavlov@gmail.com, jiri@resnulli.us, ehabkost@redhat.com,
 minyard@acm.org, sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, yuval.shaia@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, shorne@gmail.com,
 sundeep.lkml@gmail.com, jsnow@redhat.com, david@gibson.dropbear.id.au,
 kwolf@redhat.com, crwulff@gmail.com, qemu-riscv@nongnu.org,
 xiaoguangrong.eric@gmail.com, i.mitsyanko@gmail.com, lersek@redhat.com,
 cohuck@redhat.com, alex.williamson@redhat.com, Andrew.Baumann@microsoft.com,
 jcd@tribudubois.net, andrew@aj.id.au, michael@walle.cc,
 paul.durrant@citrix.com, qemu-ppc@nongnu.org, huth@tuxfamily.org,
 amarkovic@wavecomp.com, kbastian@mail.uni-paderborn.de, jan.kiszka@web.de,
 stefanb@linux.ibm.com, andrew.smirnov@gmail.com, aurelien@aurel32.net,
 clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Q0LbNp3n4fc

On 8/7/19 8:59 AM, Richard Henderson wrote:
> On 8/7/19 1:31 AM, tony.nguyen@bt.com wrote:
>> +                          &serial_mm_ops[end == DEVICE_LITTLE_ENDIAN ? 0 : 1],
> 
> This is of course "end != DEVICE_LITTLE_ENDIAN".

And by that I mean drop the ?: operator.


r~

