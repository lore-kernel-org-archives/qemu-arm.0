Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6710467wrv;
        Wed, 7 Aug 2019 08:48:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuOmaI92qo0QyGtbs2urEW3Q5lZs6YHXYCG0lEH3UzZJPmxAZWd2inIF5rXwJDrbk8yus2
X-Received: by 2002:a50:ec03:: with SMTP id g3mr10559534edr.233.1565192892961;
        Wed, 07 Aug 2019 08:48:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565192892; cv=none;
        d=google.com; s=arc-20160816;
        b=a5fiFtVgfRD3J9RNZbz4MHygSiJaASz6eXFRamnAzFYtQsSQd4THTJ3w0M+7Uwullp
         bFTE+CJYsIvxjvIt4gf/D3ePrna+AH9unKW/12/gtWFWiYBec4rTTz43dorGi9zj7we9
         D8O3WvAJhLuI3zYU7FxmwkD6SL29h60AP8Fd7v2ZoZJBhSdeRL4NPK30YL0mudJeS6Ou
         ZD5Lrmxa5xWEtblPufmqQLPVAD8O339PmScz5IJuRZzcH6ZjLY4LLxmJdkRXSGY1m24E
         cPGhapW/kS6KKN6fBgjaiOzG16NWLKT0wSlwIgHTeNRZWZjSWNbw4xZTTK8xgBIWOaWX
         ejxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=VDEsVbbZnitZv/zjndZKRIe4vwOmbwYZIOsMpNk3ebQ=;
        b=C7DjiHlcRLlEERStIxfQrdNDmg3AmKLv2neQm89FM02zklKoIch8suzoKb8sXeWwev
         RhNI6PpsLorHTUG3eyDP12Y1E7iy39YCa/y6f0tdrhsoRu2REXnzI+aEvgJrX8K/HsXv
         cJ/QGWEHufMUDvXpE4SZFouRP5Ce7/OFOp0wP62QrjAG1OaYBqHHp+H+G5IwGz+sUpQu
         kMxSsR7f3Q4Zfr7H5Rejcn5IlF7ula/LnLYhsMw3RDSGFFoVOUjjz3EGm2SjNwOze1wD
         6rS2pbyoehxOlpbvWdSfsz0Tpd0M3hxuaivffXOXd6nXldgyG6Nw5PBBxT3mB7xfpeIV
         xmLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RVLg7BWv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d23si29374117ejb.149.2019.08.07.08.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 08:48:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RVLg7BWv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvOAe-0005yC-0D
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 11:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58898)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOAV-0005mq-2A
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:48:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOAU-0007wZ-2o
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:48:02 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46492)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOAT-0007vE-Qe
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:48:02 -0400
Received: by mail-pl1-x641.google.com with SMTP id c2so41390382plz.13
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VDEsVbbZnitZv/zjndZKRIe4vwOmbwYZIOsMpNk3ebQ=;
 b=RVLg7BWv3CBJVe/avUoZpspK3GJNIJez1Z7w54GHlzZZOmRSlrkq/tPS2PNChBVLr8
 8pjmcInx1bE7xvrAEp6rua26vBSKahPj07l/M3gEk7Zz8G6naD9CYzr8MTTPaLI2awUr
 djak9esVAfjo8Wo1CvikhrDoypacMR0MwiNSDckmKpiQRnxXqRehZgpzONjiT05hUox3
 BuCUI/nMdt1d9U4kCpWnMkHG94zlXmngtUNmPasvKOFudsVEh4gDlM4y2AF84Xtx612H
 5+pQz31asGe+NRyn7AIyc36mAbRO4Q1W16i4pFdAEGekwTm4skbMmxer2GRt0xQGGUfY
 SADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VDEsVbbZnitZv/zjndZKRIe4vwOmbwYZIOsMpNk3ebQ=;
 b=Y+7sVZUAlyOekqO5HvzNJHzTJoLjM5phhEu8a4horvXJWHXaPwYFIKHwe3xM8udLm5
 /JlXQuQWlB6XpAWq/6XnmXJTp8R6Bxjc50+FKf7Td1LMAa/qf2IywtSBiMPkkKbuFZPn
 npn6BEE7cRfNcm8mczlrw5j+XdUStmjTIrIHV8UX8jZyDQlD8fc5ZJE54PysQBcXmA2X
 3qZUhBMK3cD9M6e/W19rZDOXzp223yBeFhUzc7Ew4NhixDgaomyNy/cF9Rc8mXc6KjBx
 bX7wOQjgwoqSrFUlsr/f9ReZ+4WqT0P7B0Cj7uMfg9PZ9XknKQChMWWdtDbKifdE93YR
 5fvQ==
X-Gm-Message-State: APjAAAW9hgptxFkqXuElPahhNNKJsgqoNEPG9Xwj9E3gbhFcD5lm+40c
 4wHCr8abf2uyXucsABsQftixWw==
X-Received: by 2002:aa7:8383:: with SMTP id u3mr9983779pfm.175.1565192880884; 
 Wed, 07 Aug 2019 08:48:00 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a6sm91814707pfa.162.2019.08.07.08.47.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:47:59 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166627824.57868@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <febf733f-d671-9c0e-8adc-7578254b9a6c@linaro.org>
Date: Wed, 7 Aug 2019 08:47:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166627824.57868@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 13/26] target/mips: Hard code
 size with MO_{8|16|32|64}
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
X-TUID: j6X2mQMJQnGo

On 8/7/19 1:30 AM, tony.nguyen@bt.com wrote:
> Temporarily no-op size_memop was introduced to aid the conversion of
> memory_region_dispatch_{read|write} operand "unsigned size" into
> "MemOp op".
> 
> Now size_memop is implemented, again hard coded size but with
> MO_{8|16|32|64}. This is more expressive and avoid size_memop calls.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  target/mips/op_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


