Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1825wrv;
        Fri, 26 Jul 2019 07:29:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCGdQo1g75sSJjCDnxlF8Lil9jerJy+r2R/Q9dJ7G/12RMV7BFuXACaKRfS5qG6RzTGKxZ
X-Received: by 2002:aa7:c98c:: with SMTP id c12mr81094922edt.225.1564151366480;
        Fri, 26 Jul 2019 07:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564151366; cv=none;
        d=google.com; s=arc-20160816;
        b=VKthgQOnBiAcQASHl8kqBkvmEYN7xSb/FErMn/w4/HBYXm0EGkN/f9ulLikSdSTGuB
         AxqraWTHU9dP1SuS7aiWofi5vZzn0COJByxSQr0go+ojnKJ/lS91ek16ZqKQMmFQiKLK
         d5+degGcxEpdTKzPv1iyNmEfnp7/jwU+dC+jv9Sl0tAdxhoZih1TXP11RkRrnohxJlXp
         D6ARwa2Emh3xHUlAGlWw/yRwwss7ucPT5me9XBf3QUIe4zgIbxQDnwyO0wA2cslp7o39
         jTnvC0axQsOfmzLTYe9GE4J7wKYocL45cNuq+lFittSqQnBlnUYeRhAXRydQjI3pQwDE
         wopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=HYkm/+YuRwdgQlTX7h7Sc0MGkhzdaPPqGlIAQEZn/Mg=;
        b=croWdCVQMsk63/Zpco2f1lcpx4AANBzHM4mB0XEMhnYM8O+/0UVZ6RF0e+EPXfx/12
         WInJQuQPNINXZ0uxhzc1CHdH7B9MiUwT2rJN60GZCe/K8KlrVi8zk99LHdhvcPPw/T9Q
         Ciogpl6IoR1Gphp3gmdlvvMguMAr9aC3fewbkzbCvnImBgeNLF0vvYAdzcCnaK/E1ob1
         JJ4e2LaabVfR0j+1kOWfyCz/dnO4mcrsvk/hVUD9LIpfpXgoNsfwyXYhVaeqhM4vvdYb
         7Rf0EMYIq/j5GrhgzihkuybqPZSyotbtH3A7+URtQtaPpNUxLNJZB5ybRHH6Dwgz5QnK
         mJFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X6hNyy43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v32si2956684edm.101.2019.07.26.07.29.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 07:29:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X6hNyy43;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr1Do-0000ha-U5
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 10:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43795)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Dk-0000fM-Ns
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:29:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr1Dj-00084s-Mi
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:29:20 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:35140)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr1Dj-00083a-CQ
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 10:29:19 -0400
Received: by mail-pl1-x644.google.com with SMTP id w24so24843917plp.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HYkm/+YuRwdgQlTX7h7Sc0MGkhzdaPPqGlIAQEZn/Mg=;
 b=X6hNyy43iImL1gGlKELMROj/8QrOqZyK1sMdpynJjRT38vf77tB43nVRDOoAERpjZL
 iS98ML3FmCC+DGPOH/Z1jm2CBBwH2b134trIacB8iTyad+B4th2ziW6epN/yrt6S+oSr
 Yt6yXv6wWqwocQPlbfrRIFaDsO6qOZtbkze73y4bl8P+EFZx0u4BXaqZN/z55qMiLy2l
 vqHibOP/tB0+OxDG0o/7zSqjeegtFe0gnGswJNo6wFMBRaOzYWOHAwaxTP797wwIg/RB
 zitQBxa6aT7OYxmwCIbTvNy+JGxUSv54bTlrduPiz5EnJRd70TxnfxoftAhNC/GDgs0C
 xlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HYkm/+YuRwdgQlTX7h7Sc0MGkhzdaPPqGlIAQEZn/Mg=;
 b=RlJARz/O9Gm7I6iMVjiTaFQZim4asMLao+zsTlFtoUB04yZqYusw5dE9xz9Fvuv8IQ
 ZkSMBVnxB8kGNOD7zXMWlHRmGulO1nB/c2bcQ4KjYFx0fVyUHTrHETUpXkIbVzvGrP/e
 GjgtmvXTTHMkrdgP9ZUgZ9ub/H9oR1ThsWObtGBPDp6eSWVL7Ka+V7dK8UcMfJkQVXus
 Et5sL3WWfpC7uNXvp21sOYlvfB8A1i356eXE2mt84i33pn5rQ4JJjpcIE2aF1d2UHEN0
 77YMpsGq/ohoa6JfUSri2gCEvBcAlC6CzxNPbMRA94CvWknYv3MU+xXbD/allUWU1xPM
 RkuA==
X-Gm-Message-State: APjAAAWwkirmEQT7t1ql8TZJPo5A7f4ANuEh9ZNrukYnTE1XA1XpZfVA
 tvH53KKto6N/CdeL3WoFdbBaMg==
X-Received: by 2002:a17:902:aa5:: with SMTP id
 34mr100001631plp.166.1564151358166; 
 Fri, 26 Jul 2019 07:29:18 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id 196sm57357139pfy.167.2019.07.26.07.29.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 07:29:17 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, tony.nguyen@bt.com,
 qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123667210.66446@bt.com>
 <3a893408-e864-cb3b-d86c-b6cf7b50cc39@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <51237717-fcfa-0f3d-f635-7d12481a7625@linaro.org>
Date: Fri, 26 Jul 2019 07:29:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3a893408-e864-cb3b-d86c-b6cf7b50cc39@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-TUID: 3YZoqCEzlizd

On 7/26/19 2:26 AM, Paolo Bonzini wrote:
> On 26/07/19 08:47, tony.nguyen@bt.com wrote:
>> +        op = SIZE_MEMOP(size);
>> +        if (need_bswap(big_endian)) {
>> +            op ^= MO_BSWAP;
>> +        }
> 
> And this has the same issue as the first version.  It should be
> 
> 	op = SIZE_MEMOP(size) | (big_endian ? MO_BE : MO_LE);
> 
> and everything should work.  If it doesn't (and indeed it doesn't :)) it
> means you have bugs somewhere else.

As I mentioned against patch 9, which also touches this area, it should be
using the MemOp that is already passed in to this function instead of building
a new one from scratch.

But, yes, any failure in that would mean bugs somewhere else.  ;-)


r~
