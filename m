Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6827385wrv;
        Wed, 7 Aug 2019 10:38:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyBAw4XhsSJbtchtCgXhdvzkLrUQNputiEUZvr+PkRhtO8JarvSWoMO36sfj7IvKE7TQgrl
X-Received: by 2002:ac8:3118:: with SMTP id g24mr9271646qtb.390.1565199536391;
        Wed, 07 Aug 2019 10:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565199536; cv=none;
        d=google.com; s=arc-20160816;
        b=nwLk/fShe79FjOORQo7x/OUnHRoq66QpUy9lsRVPH8KlRrTxSIBqG098WI9/sxGMis
         iEsKgD2hYgoVTwlCDRsWAqItLECNTNaXa6tHKTMsfOtDvIUgoIQXoMxGOFZQBnbMJEmq
         lWlvzQ3w4MaJTZZwxxwnlotQwOc0CXk0Q4tQvNw2pg85XmT8vv9KeyjqbYpXnoSW7ZvF
         T5eS1whDlak6QRxBADFIpF1Lc2eXCmDGhSYcoZF4oOcmAs13/UWwLNl4/JqKVD62elAj
         7H56JkkTflqhOdi035dZ+e2sKzF+jmnQSfTwK4r/4vrZ8MD+iaKMlr69kUtkgyzNwM3/
         dfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=EA88qvAzozVrUA6CGxNTtnZOOxPhbdBbqz6cQni2U8I=;
        b=T/TmNqIkR5XmJh4RY5BCee1YRK7CCEbRxHx6RUg/MJjH5xfKQmz1rJZaujCAqjCZ8g
         2qq0n+A1ee+r/X5bXoss13MkYJvuC1eT6PEnGlIvW2DGxE2UW7kYRyCLbDkzbPyYJPo2
         q5M3xAl9EE/oXTRWbHwa0CL6vUcurmJRzIkLdJLks6DNz1xyHolCl87EZZ/8fOt3D+5J
         O1zahHgD/ZEJlBe9rZB+L+T9f8Yl0/U+oZuj3ZrM/M32iZi/EyRNPrunlwpN1Cyq+4fQ
         qwiNPIv6DHGEnwX4Sv/7wi1oXsVUmODjZHfHCPHlAGcfGD1A30LZctiExxuWa8nmj+bi
         NLiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qKntDSdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n53si58158429qtb.209.2019.08.07.10.38.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 10:38:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qKntDSdM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvPtn-0005hJ-Vm
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 13:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56627)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvPtg-0005fI-Qw
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:38:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvPtf-0000EX-K9
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:38:48 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42818)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvPtf-0000BC-BX
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:38:47 -0400
Received: by mail-pl1-x641.google.com with SMTP id ay6so41896855plb.9
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 10:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EA88qvAzozVrUA6CGxNTtnZOOxPhbdBbqz6cQni2U8I=;
 b=qKntDSdMHrPkk+J4UwBLYb43bMqF9cNsmBdbtO0FK8JganyV7uyTQ8or9BAogOmaro
 pga5jjzH1qGtSpHdpxvq2oB7RYGMiyslKp9kHAEBGErVqDVqocpyhVv2Nod0voV8ff84
 SY6MT11IbZ8/SpjtnTg2+3ZNywYLl3+vIRChQpDQBiw06QLyYmw/eC896UH9umWOpX6y
 oEFGMIHkr8kBjvr8aD9hoV2T/yCNdY5AEwcNv4DO/tnu+C9k8jy9YydwN/nL1Vd9Is8g
 qg1v7NJsMJGWr4eOTVKqHjvcZvF/04lucLcGFb9Oc8o1N84TJxpua/YiYrAU54tVwKKk
 majA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EA88qvAzozVrUA6CGxNTtnZOOxPhbdBbqz6cQni2U8I=;
 b=Xm6cw3XhWrnWK7EaQB6x3cg4VL/oEPxD1rnWzR+AEZeg1bbEMD/Z1sCAoUJhucRLp+
 MSGMtz1lPOiW2Kst2zkhdlEOn2CtVX9qJSJoORcrGx0y4EPILEZmcQ2xqoQy0sZ1kKsN
 uiHMzzqEeMWonZsYEFydQgSGpRDbhDcxH57+SAnDpM/iCYMIdhdvH08k0VhpYjEZXTal
 OUVPQRFrig4lq5+ISHOmPx67tCIDCeKU+GYoAhY32mCz95q71uRYeXXEH3W4zyMXs6vQ
 W8CSXkDoeB49H655wrmm87NY5seVs6VdOx9sGf1Zbiuo33sC90aqaV0BP1G7nP3CQcNm
 LgxA==
X-Gm-Message-State: APjAAAXhSZjrBzdSDN968hwigjFwFgrsO0Ns667ATXRlku4jpSjlVNDR
 EMEs73HdHcqC0pqGeXIJlLKlHw==
X-Received: by 2002:aa7:8555:: with SMTP id y21mr10575549pfn.104.1565199525861; 
 Wed, 07 Aug 2019 10:38:45 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q7sm105394539pff.2.2019.08.07.10.38.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 10:38:44 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166819111.14515@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d2f24c92-d210-7e0e-b787-3986123824d4@linaro.org>
Date: Wed, 7 Aug 2019 10:38:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166819111.14515@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 21/26] cputlb: Replace size
 and endian operands for MemOp
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
X-TUID: rhYc3cnNG99T

On 8/7/19 1:33 AM, tony.nguyen@bt.com wrote:
> @@ -1246,7 +1246,7 @@ typedef uint64_t FullLoadHelper(CPUArchState *env, target_ulong addr,
> 
>  static inline uint64_t __attribute__((always_inline))
>  load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
> -            uintptr_t retaddr, size_t size, bool big_endian, bool code_read,
> +            uintptr_t retaddr, MemOp op, bool code_read,

I assume the code generation is the same, or nearly so, for these functions?
It seems like it should be, since we're replacing one set of constant arguments
with another, and the compiler should be able to fold away the same set of tests.

But we should at least have a look...

> +    switch (op) {
> +    case MO_8:
>          res = ldub_p(haddr);
>          break;
> +    case MO_BEUW:
> +        res = lduw_be_p(haddr);

I don't like mixing a bare size with size+sign+endian.
I think you should go ahead and pass MO_UB.

> @@ -1605,30 +1605,27 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
> 
>   do_aligned_access:
>      haddr = (void *)((uintptr_t)addr + entry->addend);
> -    switch (size) {
> -    case 1:
> +    switch (op) {
> +    case MO_8:

Likewise.


r~
