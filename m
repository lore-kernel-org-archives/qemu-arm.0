Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11486322wrv;
        Thu, 25 Jul 2019 23:10:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6zTIYCrqMr4fASHncnUB9LqWP3jLYX9ew7F87ADzDIWxKygJQ4W+KqICgVF6e55vxnlke
X-Received: by 2002:a17:906:959:: with SMTP id j25mr69379509ejd.94.1564121458966;
        Thu, 25 Jul 2019 23:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564121458; cv=none;
        d=google.com; s=arc-20160816;
        b=nLOqU/Uz4VjjLopBnqelq/8sRMezanv36PKmB8OyXlicLTVIU+QaNQrlwA6ndsWtvx
         mA3HZAiZex/Cy8/ychA6JPEB996VZlAOdqhwJxVLbMnMPOvs8s8B416Ev7X04cTXAjp9
         BqmsD669tjpevA4HLB/346hMoBMi4ArShAHlxQsge3LxZr6DA9sPEPsdI8dy6UhUvseg
         MJGRU9Cc5a163CLI+YKBRiRWE9IaSn0jkbpqgb2I7hHM1mH+1oy2o9XLrnVTFTYBMXZt
         5KPSOpQLIQSVG0KrCblvRkFqwTzwwBBDxoVtBPyT6GYiru3kqVWGZhNh8sBWIdyS2G8v
         tVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=+CKSmJY/FGQYHMgYVWAkMOHJmJzWL/EmlEhTzHXyM3Q=;
        b=Bm/djyog/VgBLNuEIyA7wRqg0RM0AQrXg/f7/zmv9P+lhj20dA/TdTf8Ow962Ilanz
         VzBZXxLYSnCOCjsO9wddTshRFttbPn25JaFKQUMWxNaL+vBVZuVN4WfRVf7Ug2ww1k/8
         SKtj1IEjtFoBCisDTXprNVqLp1gg7rNFnUWFrxhO+5d2zxJAnjgTLcPRmTbDKw5XxLsK
         pigb8x9U4Ol49c2O96rbkrTLVr1mNm58P7eGiPqXSf0FVNgDY9kljfdUnNJGkamU5Tur
         vSCPQFQ5JRof+8jyWD/ModJFKlam25U/SRyF/xegkwRfDualG/KBPHTn2dWeNKjgPk3Z
         68oA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a53si13008955eda.155.2019.07.25.23.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 23:10:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqtRQ-0007T4-TR
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 02:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40437)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqtRK-0007MR-TP
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 02:10:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqtRI-0004s8-0U
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 02:10:49 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36108)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqtRE-0004oX-8v
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 02:10:45 -0400
Received: by mail-wm1-f67.google.com with SMTP id g67so42510494wme.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2019 23:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+CKSmJY/FGQYHMgYVWAkMOHJmJzWL/EmlEhTzHXyM3Q=;
 b=Zwikja1u2ewK7Fx6nSdeu/g95tu8hoZR9duwCidDyJDIy/JACQlc+yBb1hFDE025Wj
 am2t3caVTc75hxI89ofe7wkFSDrA5w62B3Zx8uG4ajRlAfu07ss95oaMWUFdSsxY2drr
 BasJjmrLhMOyDkRcWceyIFr0bGSojNnwXoLWau9Hj2cNIOP7wrrMysSX4aoWv1nuOvpV
 dkwpmBhQXBiKEHTwP5MEGtXcwyxX8VnLkyBl9y80br4Kum0lo3WahmooJCTl1QVKRz3j
 lRqEnjp5/wTLma/eOeb2D55DrGMP036Jaq5Llx5ItE94yIRA0UHrFJFLnt/9RT+1M+VD
 cquA==
X-Gm-Message-State: APjAAAU/NGfAi/zK0AUXKlXrYPyAQmsIP0LUo4+4yINOUbR8L0FTKAtS
 3g+lAVmVgeZPCbi5URK2IsjcLA==
X-Received: by 2002:a7b:c84c:: with SMTP id c12mr80806507wml.70.1564121442118; 
 Thu, 25 Jul 2019 23:10:42 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id z25sm55374341wmf.38.2019.07.25.23.10.40
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 23:10:41 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
 <1564048354001.54262@bt.com>
 <ee5949da-4457-0560-4525-40e4d4aaef4a@redhat.com>
 <1564120985317.14967@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <dbc40cd4-f252-6b05-4edf-ae43143248b2@redhat.com>
Date: Fri, 26 Jul 2019 08:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564120985317.14967@bt.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 02/15] memory: Access
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
 david@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Gg+PUfIAS8Y

On 7/26/19 8:03 AM, tony.nguyen@bt.com wrote:
> On 7/25/19 9:45 PM, Philippe Mathieu-Daudé wrote: 
>>On 7/25/19 11:52 AM, tony.nguyen@bt.com wrote:
>>> Replacing size with size+sign+endianness (MemOp) will enable us to
>>> collapse the two byte swaps, adjust_endianness and handle_bswap, along
>>> the I/O path.
>>> 
>>> While interfaces are converted, callers will have existing unsigned
>>> size coerced into a MemOp, and the callee will use this MemOp as an
>>> unsigned size.
>>> 
>>> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
>>> ---
>>>  include/exec/memop.h  | 4 ++++
>>>  include/exec/memory.h | 9 +++++----
>>>  memory.c              | 7 +++++--
>>>  3 files changed, 14 insertions(+), 6 deletions(-)
>>> 
>>> diff --git a/include/exec/memop.h b/include/exec/memop.h
>>> index ac58066..09c8d20 100644
>>> --- a/include/exec/memop.h
>>> +++ b/include/exec/memop.h
>>> @@ -106,4 +106,8 @@ typedef enum MemOp {
>>>      MO_SSIZE = MO_SIZE | MO_SIGN,
>>>  } MemOp;
>>> 
>>> +/* No-op while memory_region_dispatch_[read|write] is converted to
> MemOp */
>>> +#define MEMOP_SIZE(op)  (op)    /* MemOp to size.  */
>>> +#define SIZE_MEMOP(ul)  (ul)    /* Size to MemOp.  */
>>
>>SIZE_MEMOP() is never used until patch #10 "memory: Access MemoryRegion
>>with MemOp semantics", it would be clearer to only introduce the
>>MEMOP_SIZE() no-op here, and directly introduce the correct SIZE_MEMOP()
>>macro in patch #10.
> 
> SIZE_MEMOP() is used, and is the main change, in patches #3 to #10.
> Perhaps you
> meant MEMOP_SIZE()?

Eh, I inverted the macro names... :( Thanks for correcting me.

> Either way, you have raised an issue :)
> 
> There is a lack of clarity in how the two macros are used to update the
> interfaces.​
> 
> 
