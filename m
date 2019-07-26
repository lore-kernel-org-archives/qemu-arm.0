Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp19363wrv;
        Fri, 26 Jul 2019 07:45:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwr80e8a3j/+aAU5ZThjSqX6kosUw8OArCLlmZk7rRuii1392ZgkbaHroi2SvPRQcCg16N
X-Received: by 2002:a05:620a:1443:: with SMTP id i3mr65073939qkl.11.1564152327616;
        Fri, 26 Jul 2019 07:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564152327; cv=none;
        d=google.com; s=arc-20160816;
        b=ITe09avSWLVXZuXvrcywMiITMpoRFIY6VNvhkNKE0osADrCYXWwrqcVMqHRkhTpPLc
         ZDAYEvxSPvhBAyqsRIgKsYkC4ZmWGp+Ot9Sw7ipsdcQaj38cm90hqL7gyUzYZ1GqBfzF
         ImIOJB8uRYPSRmujFma2qCR0O1Gvfaxx9dTinNXQ+8fL45SLUGCi2jQpodGKSNQrkXbz
         52SqlDV23VJSTZ6izbrig49/ow2pMh2dxgm880uVou0ViQ/5e2XcnFsHQ8EQzYL5LAVg
         vgGw415lp71rpWGTvrlzAMOKrXj7cWw5vn3+IBtOcF+JPRTDZ+bczvK26lIIaHeptwTq
         KdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=09dyhl6G3S8lsTRL7xnnyHEtd3ZZs9GS0a/kT0/mLtU=;
        b=Rr42lFc/MF97JDGurdtmLYq0NozNOC59nvhz0kTcVk0uZLUbUlje7pzblsFhAudjIy
         atxaRP2viT70Z5cja9EcgVgaLetOYX/lTGf0KNhUYteHqEu1iRqYzrPDoAXd0AMxGZjJ
         MGRyxDaZtYkrc7xWiiqia3gtEGLmhAIAAFn7jgngq2R9UETEOdfanjpkDawLTjXAzK6H
         87/AAZpK6+pGmxKwAVtbRob20NZ61sltq3XQIVLOB0S9/1Gi7xJl54cBbZgUWzVMjKWh
         8Mnu4skFd8t2Z9iY4YkiN13D7O1LQzgS/fVTxlRoovDx6IekTgY6Z+iyduEN4ukJAey7
         BgWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QleSDlFD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h39si35840174qtb.298.2019.07.26.07.45.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 07:45:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QleSDlFD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr1TK-00054p-5Q
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 10:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46205)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1TA-0004qm-Er
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:45:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1T9-0000Zk-6a
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:45:16 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:41314)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr1T8-0000Xm-RY
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:45:15 -0400
Received: by mail-pl1-x643.google.com with SMTP id m9so24753177pls.8
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 07:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=09dyhl6G3S8lsTRL7xnnyHEtd3ZZs9GS0a/kT0/mLtU=;
 b=QleSDlFDDiYzT+oyVC55dvfV+ZtmPEGOVZ7D3MljjMdjR32IVE/zEdl9NPw0mDwDwd
 6XSJQobRZDeTqjaNpXqwEPoY8yKvmb3vZ1tKYNEmhxfWPfbhVr42lBLKzF3/eMoBB/L8
 lzR5ZgfYRGNKemIYzaSeLcLHOMhxhVYoKcmpUdzJnVJdiRyF8Es5+mV3yfQXO1np/l0c
 93Hqn3rvpMXgH10Gk0QrPrwb3dVIAdn7nND6FIhNC6oxSw7TK0hk37y16pCjtF6nUUdt
 s/sZauVim1mqwXaKxGkQZnRJ0eGOYZExFeT6p8j15j4fPlJ+8WzUB+8DoMc2y+k/E59T
 MrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=09dyhl6G3S8lsTRL7xnnyHEtd3ZZs9GS0a/kT0/mLtU=;
 b=mT4XO50fWgEgjRGMleWj4YGm7+MhwjMK6o2eYkKUmTjeGfgJSop1FBnMpCc4vCmuLu
 0CcL9p8ndZgXw+Doq6Dp3ZCV6eeCfkGVT2ZI8aE0DRV2FwUCq3/I58/jQDvVC2otDd3H
 VaT22JonOdmaeC40WgerOQ15taclw8kpw+/eMdRjyqrg8FoBSo1GKL/FQmTC1nn8uXuE
 kVmn0TwHp3vS2PdWi10oBmYDFk608Ud7kTqP30yU9/mINSW0GHwxUZ2O5qESG+N7t9OF
 9/Fql1kzfh4J31VV+97ulu36O1nljZjwyElssh5VPHSQXlKW4bd2L67V58Alsb1c+XX7
 ZXqA==
X-Gm-Message-State: APjAAAXfx5rr/Gp2jZ1oMo9UgqY7roHFKx3pm/xE1A9CaOaqL47bf7Xx
 OEdgMSwH/JliPr9R2jkVXa8dtg==
X-Received: by 2002:a17:902:8c98:: with SMTP id
 t24mr99056689plo.320.1564152313581; 
 Fri, 26 Jul 2019 07:45:13 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id f8sm11113172pgd.58.2019.07.26.07.45.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:45:12 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, tony.nguyen@bt.com,
 qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123667210.66446@bt.com>
 <2159ad69-4c4c-24dc-6759-039e39f952d3@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5b7df6eb-2ccc-f921-3a94-00d0f55b6d4d@linaro.org>
Date: Fri, 26 Jul 2019 07:45:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2159ad69-4c4c-24dc-6759-039e39f952d3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 11/15] memory: Single byte
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CASAnvQsR5p8

On 7/26/19 2:39 AM, Paolo Bonzini wrote:
> Then memory_region_endianness_inverted can be:
> 
>   if (mr->ops->endianness == DEVICE_NATIVE_ENDIAN)
>     return (op & MO_BSWAP) != MO_TE;
>   else if (mr->ops->endianness == DEVICE_BIG_ENDIAN)
>     return (op & MO_BSWAP) != MO_BE;
>   else if (mr->ops->endianness == DEVICE_LITTLE_ENDIAN)
>     return (op & MO_BSWAP) != MO_LE;

Possibly outside the scope of this patch set, I'd like to replace enum
device_endian with MemOp, with exactly the above enumerator replacement.

In the meantime, perhaps a conversion function

static MemOp devendian_memop(enum device_endian d)
{
    switch (d) {
    case DEVICE_NATIVE_ENDIAN:
        return MO_TE;
    case DEVICE_BIG_ENDIAN:
        return MO_BE;
    case DEVICE_LITTLE_ENDIAN:
        return MO_LE;
    default:
        g_assert_not_reached();
    }
}

With that, this would simplify to

    return (op & MO_BSWAP) != devendian_memop(mr->ops->endianness);


> I think the changes should be split in two parts.  Before this patch,
> you modify all callers of memory_region_dispatch_* so that they already
> pass the right endianness op; however, you leave the existing swap in
> place.  So for example in load_helper you'd have in a previous patch
> 
> +        /* FIXME: io_readx ignores MO_BSWAP.  */
> +        op = SIZE_MEMOP(size) | (big_endian ? MO_BE : MO_LE);
>          res = io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
> -                       mmu_idx, addr, retaddr, access_type,
> SIZE_MEMOP(size));
> +                       mmu_idx, addr, retaddr, access_type, op);
>          return handle_bswap(res, size, big_endian);
> 
> Then, in this patch, you remove the handle_bswap call as well as the
> FIXME comment.

Agreed.


r~
