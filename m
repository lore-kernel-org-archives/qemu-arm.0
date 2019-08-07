Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6695528wrv;
        Wed, 7 Aug 2019 08:34:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzHde3oV/2lkyAfHWBT6zXqVf5EaoKRdhOUEGInP+H9vyh6xNJfqYlvxMVyT6lvYV+Ro4NR
X-Received: by 2002:a37:9944:: with SMTP id b65mr9005741qke.105.1565192043414;
        Wed, 07 Aug 2019 08:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565192043; cv=none;
        d=google.com; s=arc-20160816;
        b=UjfbpgI1HBcbmpLkLYkS4o6z6wWieaq1Dxbh6f/C4CICbsGwvj4FGQ5hOuvCeW3dSj
         lwzgfDYPtX2zAQJFhRN4NPS+4oBVEo6vC35x5W5p2Ok+JKNOarUzbvVS2E9zfSujMe1Y
         DLaPs7kAow6opoIJN+9u8xDyn77Kac1s2oN42gqhtX4gsuw4qB/oCQ3o9Atv3gwj4MHk
         52kxGZ5YbXHNkXRaNwANhW9HzXIxlGIaJRpa3SwEiVftp7bgfarHZD2CDH28+k0r6QDp
         52aFNAGjgkxjl893bdgPj05P1WaL9G3894fnpIsR4zgn8Dc45DsGLWkWfjj0FJkcLGdB
         dICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=YOHdOx7/Stz8Tdbo6EdPl4datS5Q3j4t5VdIxcMP+xM=;
        b=QTRQD+oaBcm74zthXBePhe9/34HhxFL9+13JzfFkQaw6w7F9r7w1dHsAX4TPV0lu8e
         91XW5ghAgfPwgpHw6pYt41sGUx1m2ExgHh+q+HXdedwaLZmSSnmzs8WeshQ0LUEs5gba
         GQgqsvQ0b2FBLxLDL16k/8MYDlzhX9tIuxcbJZvr+NriVn9+xf/OoVfSdG1g6wYIKj/T
         cYZqTqk7lp2TZtLhHZE0rgno1KYV6jdD2ZAZpIbVKVS0n4woqHWNXvmYP4hlxZU637lH
         cMjGfMfSi4Vewom8420eC4zhCFqKONuzrIZ43asERvgv/Rs5z48ZxMyg3ohA0dEW/JVU
         7jhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pm0ASyo6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si890958qkm.188.2019.08.07.08.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 08:34:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pm0ASyo6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvNww-0007qB-Rk
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 11:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55361)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvNw3-0007Mf-DG
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:33:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvNw1-000627-7F
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:33:07 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:40421)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvNw0-0005yi-MC
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:33:05 -0400
Received: by mail-pl1-x643.google.com with SMTP id a93so41296886pla.7
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YOHdOx7/Stz8Tdbo6EdPl4datS5Q3j4t5VdIxcMP+xM=;
 b=Pm0ASyo6gkiTF1odBo/wLrQ9b3UHH+oZYk7XYC9NpzMYsKNFRl52Mu4JBUmbB+BDUC
 kugOta70MyufphqLT2e2rAFQlAMXXx/T62QwK4Lw14rDNpI1qgpWJDlfCh16Bp6y9Xel
 mJXUOrkRGAipCUzXVV/qLiOQXqU0vb99giE+3bio6CSDCZhWKUAVmaCeI0UxJJKXjC+4
 vzIDp/gid/yWVx5jKdm6f4cv+zKGh7V2mpFEm3RFp89koj4WSK+bjzIPfZPscO8D7spO
 Im60t3LUpqFn9Bs+C2BATyFHuRB00RprI8qgwMoyfcTuEdki6RVRyD9HwdrAJ5I1yEZ+
 ZO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YOHdOx7/Stz8Tdbo6EdPl4datS5Q3j4t5VdIxcMP+xM=;
 b=oHGhYWjB6gTPJoJ5wU2ZkvL6lQSTZVyZoaFp/4wGCwX1DEC0HpTyXr49o/tQl0YKyH
 j0g1FwjaDKqOowi9YpGKwbMSDJAktpStJraGAQn1hqfdiwaald5k8Kf/iDYpSw6fPgO7
 1dMBFeiw6Zy2Jq2IX0oOP2D8e8X6hPu2RXzXUYFton66wiF0ovug9gLGXk3wc7DMvK2J
 Ew2GxCfJWXchZj4Mqwa876hFtYgPWvUnfQXmDcSwv7JpbFnc9q+ySLX14znLA3vuJQ5u
 93ISV3GplLoRXFADVlJ9MgRRoyN1fSP7IxxjX01dzYKJwKJ1vktlqrAElX1zM9IJt0rO
 C0pw==
X-Gm-Message-State: APjAAAWpaNyaQEcT/0lMcCcSZjpI/pHq1Syy1VacQJomLgmIOWg2VEcg
 V48ZJazmoQfzwJa9McPiKqFnPA==
X-Received: by 2002:a62:64d4:: with SMTP id y203mr9807270pfb.91.1565191977649; 
 Wed, 07 Aug 2019 08:32:57 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 131sm112852110pfx.57.2019.08.07.08.32.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:32:56 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166562774.65589@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b1ac6757-94aa-2358-2802-4cb3a3aef1d2@linaro.org>
Date: Wed, 7 Aug 2019 08:32:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166562774.65589@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 10/26] cputlb: Access
 MemoryRegion with MemOp
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
X-TUID: IZG1W2XBfPi/

On 8/7/19 1:29 AM, tony.nguyen@bt.com wrote:
> The memory_region_dispatch_{read|write} operand "unsigned size" is
> being converted into a "MemOp op".
> 
> Convert interfaces by using no-op size_memop.
> 
> After all interfaces are converted, size_memop will be implemented
> and the memory_region_dispatch_{read|write} operand "unsigned size"
> will be converted into a "MemOp op".
> 
> As size_memop is a no-op, this patch does not change any behaviour.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  accel/tcg/cputlb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

