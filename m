Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11953883wrv;
        Fri, 26 Jul 2019 07:04:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy6NjbmIHG74w9iRclZoJYK35e8bOkZ66456nATF2B+wTmI3nH77KFAWWMZyZfAkl1KqBmA
X-Received: by 2002:a50:b803:: with SMTP id j3mr80669042ede.208.1564149892786;
        Fri, 26 Jul 2019 07:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564149892; cv=none;
        d=google.com; s=arc-20160816;
        b=TIX+T1aI4QNNnQJ97THN79hmakt8aC9DDSuPcMZ6ITk6yU59yRL4h9t7muCEKz/Brz
         6B+y2X376jCRgIIaCJOIahdpB/yT7x00t9GH0OfYDcsWLR641ljXIY9c+/3DFD8rsyK+
         dkiaOGd2TD9v+ZCVC7IImQzLjp/GeJN4XY6MP8IisPR/iVkDUASbmWhgEgge9Mfh49uz
         zAgTYbHgM51ffOJlT7Ler75g6tEyGyX2HlVSjjNeo9jS9voOA1nB0A5eDEnUMPhRlv0B
         vf2RlqEV/mBZm30Mb4pBmoTVw04aQpsx8mjJZyGMwWkmOijTWo798vN6cPYJl/1SDEyg
         GzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature;
        bh=nKa24evqf5xPcn+k8W5NyW7GQh08fTUnIlUWImNcE4I=;
        b=IcxPr2v/ESoBKvx0KM5Mmbt/cHFrhwruYfbYwNZn1FZaEYDavKSZEFMKUzYYuoSKwt
         GYJFJeYSNZV/+JxVTrW8gs3zB++29JiSnBdPnkWH+6h5b89MT7gTgLP5HCU41XdOSaFR
         yhPietc7AAuUOmqi9JY5Zkb900rITji5PI2KE6idIFoGhAItn4dTcPwgn+QCDLkUVSRk
         020vHfjCEwNAYoYRXT58xNbYcRhkZRJQ+C8wBL0QjHNKNIaZzP/KI3blLir8OVQu9sM6
         9K+YlEpuD+ymM0wFAmRPQqaWMXqF8/CBaHxRjXxNLBknelCn1iaKTim4uaOX/WUwpjoy
         1hBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pUrqwjbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si14421652edu.19.2019.07.26.07.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 07:04:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pUrqwjbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr0q2-0000gb-W4
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 10:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55054)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0pv-0000Yj-GH
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:04:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0pu-00036M-8m
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:04:43 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35750)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0pu-00034i-0V
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:04:42 -0400
Received: by mail-pg1-x542.google.com with SMTP id s1so18540617pgr.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 07:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nKa24evqf5xPcn+k8W5NyW7GQh08fTUnIlUWImNcE4I=;
 b=pUrqwjbOtgCRBOtjOlCCyA53HeLU6Ec+IvNjrDsAxgBKPBUVDAU3zOnsMV6RSqCQU/
 9/NY0FmP3h9Ae4tJE8BkzNfl2y/BoBmi0LPBUTGzop95vVWDGQ0/5GdGr4CQkrzCYPaD
 vmvAN88SUcyPxZ5MeYUDFU3/HXZe4vlYk/9qowCId4Mr/KnmHD6AALACo0A023viVJzV
 NJPul29FbkgGnwwEwpPGN6Lp3NveIYyICrVUj5pIbmmxk+N8kSq4HJZvZrGg0/7q+GWt
 CT7cO6nBJ8x4ar4E7gY9xwiGPFQiUqPAbr/pwWBT9XWLySUnd2b5rtn3pF+MAoHK+VC8
 lADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nKa24evqf5xPcn+k8W5NyW7GQh08fTUnIlUWImNcE4I=;
 b=GBLOaJkpUVdt2mNIqXLTuv+fU8VS1jdyRjwyw9AIXYdT9Oo4VImo3qJ9xGTTc0mYoe
 ctrQnkiJN/nqf3lw6648lFCFBvpkpvw3eonaJDyedfqb1VYApN2/BfANt5r2bDmR2cFI
 aCvvynGCwnXhuPp2nGKiGgTm2aPM1P3PnR8H4xet+aIzQh8Ht12wBPfTL9V7KQBahqNc
 Gz/adHxo5VRw8LaltYJ64WuI/WOII4FEgAeuiN/Dz1Ry1oMkiydydbkLUWWfPK9cAXqZ
 kvcNP1kPNA8Ex4NSbk3QTvP3JTvpbgDHTTmTCJGyLwEkVqMsr1IcG1tC8tbZZzdYPONg
 UXqA==
X-Gm-Message-State: APjAAAXRXaJdpwMr0dTeQSkOYvkStu6L1c16s/ZpXBhT0e6ralVTG3l6
 pvaMyXgVJDL9b3pR1tLfPaAFMA==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id
 q10mr97990476pjv.95.1564149880644; 
 Fri, 26 Jul 2019 07:04:40 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id o24sm103707061pfp.135.2019.07.26.07.04.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:04:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123434793.89101@bt.com>
 <2e89740b-58e7-ed7b-834a-f94fa76f3cd3@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1335cf86-c27b-6aa6-cc47-6e986d270518@linaro.org>
Date: Fri, 26 Jul 2019 07:04:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2e89740b-58e7-ed7b-834a-f94fa76f3cd3@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 02/15] memory: Access
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yELgxwX653tN

On 7/26/19 6:36 AM, Richard Henderson wrote:
> On 7/25/19 11:43 PM, tony.nguyen@bt.com wrote:
>>  } MemOp;
>>
>> +/* No-op while memory_region_dispatch_[read|write] is converted to MemOp */
>> +#define MEMOP_SIZE(op)  (op)    /* MemOp to size.  */
>> +#define SIZE_MEMOP(ul)  (ul)    /* Size to MemOp.  */
>> +
> 
> This doesn't thrill me, because for 9 patches these macros don't do what they
> say on the tin, but I'll accept it.
> 
> I would prefer lower-case and that the real implementation in patch 10 be
> inline functions with proper types instead of typeless macros.  In particular,
> "unsigned" not "unsigned long" as you imply from "ul" here, since that's what
> was used ...
> 
>>  MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>>                                          hwaddr addr,
>>                                          uint64_t *pval,
>> -                                        unsigned size,
>> +                                        MemOp op,
>>                                          MemTxAttrs attrs);

Actually, I thought of something that would make me happier:

Do not make any change to memory_region_dispatch_{read,write} now.  Let the
operand continue to be "unsigned size", because it still is, because of the
no-op macros.

Make the change to to the proper type at the same time that you flip the switch
to use the proper conversion function.  This will make patch 10 about 5 lines
longer, but we'll have proper typing at all points in between.


r~

> 
> ... here.
> 
> With the name case change,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~
> 

