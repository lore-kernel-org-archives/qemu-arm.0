Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6700723wrv;
        Wed, 7 Aug 2019 08:38:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVgAF5O/9dweA7N6xt+Z0Z1UOKmmalTFkv83hM1s72SP1HCtd7aTpD6QQt8KjJUJs84J5A
X-Received: by 2002:a50:ac07:: with SMTP id v7mr10463367edc.205.1565192329797;
        Wed, 07 Aug 2019 08:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565192329; cv=none;
        d=google.com; s=arc-20160816;
        b=GWwcz0lC+ioAvSYMuFVh+0gvjzu0aRbApMDxoh7W5r8j3AVBgXvane/aS4gtzUoBce
         j2iyn+eB6PBuab+JBHvr0m/74Y0NXMIiQgcbd3YCH+PAHnERPwLE6qpYlgPL1DdOnwey
         lEWHrSE5Oz3IHV90fRlBzI/EAMXGw9pFYDY0XLle+04sf6D4JqhFlYbnP07ZRVS37oHA
         hV9OkblfrthfZDFNRDnSZjOedbCJK63vI/lABQC6N07D7802DexBN5vlkQtk5ptlBw4s
         XjWtHY6s/19nNq1hu5YO4ykSvGH0+fdUaTFU6DJYgqzoBz0e92D0U19yhjNszS29TC/1
         ZbPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=PftTEUkCoQGe362ZEZQRYX9sDZAzdQEMj7x8oh2NOcM=;
        b=tIEhKoEzNK0Fx9/TVHTSSnSW56GA9O84x9ibFkwNFycPaM9GAH1CUUyc/eDdFNm/s9
         uC1HjL8S76nIH1ONsrZTTuntV3Lpy3EUPzi3UOXIx8IGsQUQGP58+XrfLBFBvcf2KK6F
         hGNDnQng5//wJTEmRq1p20TOEaKSh+zgqaorWQsKJe/aHTmTHyM+S8JB/pH8GlDpaVEu
         bHlr0NE2EpZSvCLZDgB4jBRU27kSiE+d9cdSFRVtYdEJUGpQa+aLYPwLc6Fv3Xj5fr+9
         wEH0Iv5Ng1nHgnj5HKBa0wKT2FsT9hBPfGaBL19lA1SLQJunDt4XETCAxUtpBV/Ab0BX
         0LhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i93jK2k/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j42si34234470ede.285.2019.08.07.08.38.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 08:38:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i93jK2k/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvO1Y-0007pm-SZ
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 11:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56717)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvO1S-0007mG-9E
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:38:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvO1R-0001d3-0y
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:38:42 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44136)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvO1Q-0001bU-O3
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:38:40 -0400
Received: by mail-pl1-x641.google.com with SMTP id t14so41354076plr.11
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 08:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PftTEUkCoQGe362ZEZQRYX9sDZAzdQEMj7x8oh2NOcM=;
 b=i93jK2k/eEXh/s5xW1NmBkmQdMpYgRueUNEoEdJA6BS31ztY69Nyq37PzB8JWgF/lB
 N2QggwEh+vXbE8yDZPdhbPCNs0FbqBNCaZg+W6bSfQYwPvAobo5VaiN/W5YbNrMvxcD1
 hv+UI9zNGPrqr5SBmpb9h3Vw2jWsRSwKHReaK94/BuxPBGUg0+4921bA++dX8FzcktRa
 owHMylkON/p9jPIv0+CHmH8QDPZHix4j35wdxNDV6Z4vJAcRX3VANUvcgnh4qsslStCu
 o85HUpzh9lFKIsWqFwfELJx1tnvDB9unjbM51K9ehFFBvtfGg5d+N/pBvBa/srZCdjLH
 u6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PftTEUkCoQGe362ZEZQRYX9sDZAzdQEMj7x8oh2NOcM=;
 b=khfSEq+5qjCI3bmAZDX8vCjeg6UYfDNSA5xOnUfVH9z5sDAMz2g0roHFitqH3FLQbs
 wNk+PMUVI2exudFGz+CLAEuifF+xBzD8hN/CIFcHFZqVgNkTXWCGd74i/n9Yw/4Quzsb
 bQu75rwmJjoudssMWQgLj+UW0uqQ069e0V25dFsicbIhd6UAsZBUcSOupFxK1P/YIWEG
 J0KtsPlhqCbOUzM2ioKSEg7+moy92wA+zF55CDSMSuDN8xSxIeVTjquGhvY5nM5/DeiO
 QRhFlgyjtC14pCiVdN6Ilof0OmE2acWB4liLWpzRttJBqy9jnRQtk6lmWQKRGkcIkFc5
 c/+Q==
X-Gm-Message-State: APjAAAWRnFYM95Wtt6PqWbUEuo/ox6ROnHme9EPHYItaLlryu0kRiiIB
 5YIUd0AtYfXk8PbEMpbFi1QTUQ==
X-Received: by 2002:a17:902:7894:: with SMTP id
 q20mr2067641pll.339.1565192318272; 
 Wed, 07 Aug 2019 08:38:38 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f88sm316107pjg.5.2019.08.07.08.38.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:38:36 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166587275.42474@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <652ad19a-ad54-7854-7d3e-03f1032cba7e@linaro.org>
Date: Wed, 7 Aug 2019 08:38:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166587275.42474@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 11/26] memory: Access
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
X-TUID: MCBfEEvReK4F

On 8/7/19 1:29 AM, tony.nguyen@bt.com wrote:
> Convert memory_region_dispatch_{read|write} operand "unsigned size"
> into a "MemOp op".
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  include/exec/memop.h  | 18 +++++++++++++-----
>  include/exec/memory.h |  9 +++++----
>  memory.c              |  7 +++++--
>  3 files changed, 23 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +/* MemOp to size in bytes.  */
> +static inline unsigned memop_size(MemOp op)
> +{
> +    return 1 << ((op) & MO_SIZE);
> +}

s/(op)/op/

This is no longer a macro requiring such things.


r~
