Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6870192wrv;
        Wed, 7 Aug 2019 11:24:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWtLXgMQU29vhabvlJMh25HZjw4mIJKo1rG7368x+csfoBA2DljMNlIj9gLy+pWeQL4ecs
X-Received: by 2002:a17:906:ad86:: with SMTP id la6mr9734741ejb.43.1565202243415;
        Wed, 07 Aug 2019 11:24:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565202243; cv=none;
        d=google.com; s=arc-20160816;
        b=JuQfvchYa6c/3nAqjAvoVcLvE90LEWR249bP4FRyTdRVKW+EfjsEQ7P9i1R7mGejv1
         tiWNSeDH9MIV0gnVR2NLhNHWWwNzboBU1S+yhTPTGEisIbbufswOHN63CpSwM02EYu4J
         wMSsPNttWLpf8Tw/nGvOOkqMUh3VfthxDQ/Y32WsW7fjXno4P1p1kDan9tE6aeM2YTRK
         KYV4zJtthva1kWOYZnl4Qy62dlLeuToyvcDUXZV4Krn4c5Y5HaM2Zm1jZEVZbfa43RYw
         +d6e6+X80S30/SX1WL04rQ9B6nYRgvpdHflZxJK8Rf8ndzOtHCs64jA3jlLIa3zZ0Fc5
         3B6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=1fcVkXbnMuANrk+Ur0WezzXveYqWqDlQYB2JE2gMdvY=;
        b=vHR87B/ag9tOrlIFTdQNmpBJ3tM60jSY+XSut3iegWToien76QrYT3yb2ORNFZKtSP
         3MZluhDHei2nvKwuBsYyaOuLjtzaSDXGeygky0t7YrtYAd9twoMpltvM1dVlFkjXW7K6
         ukInrXMtEYVFTDKdMZFhEGnFL7jtoDWn88YJE2lX0KYo7iFSBoCYM0UyzKoy8N0LPzm+
         LGGACxF7+XEHesHbplhPGnOieDpmninuyO27WRDMc6saixZS8ULGNY0A71htRqlH+gp7
         pg41n7nTzslLEKHb31rEma78jAuErpSDEQBQEbdFXAgiRGekKj+gtktLIEqzRVNh6TGg
         hSQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sfk5+alw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j47si33016176ede.381.2019.08.07.11.24.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 11:24:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sfk5+alw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvQbS-0006rd-H3
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 14:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38138)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvQbM-0006pu-0o
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:23:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvQbK-0003sb-Sy
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:23:55 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41450)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvQbK-0003qZ-Ly
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:23:54 -0400
Received: by mail-pl1-x642.google.com with SMTP id m9so41870466pls.8
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 11:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1fcVkXbnMuANrk+Ur0WezzXveYqWqDlQYB2JE2gMdvY=;
 b=Sfk5+alwu1VCU0qrulKu6QmaIsYdKxIU7Gg69SUf6UnahW78yEvPIcfLCY4kSDNXMq
 f4WymZm+Doh+AICi8mIVzgHEDU0rk9qd7RKt04rG8f+IhrZsp8Bf49iJNYEBZ3PN1lu8
 WMZp7duBLer60rzUM5QJpc44UkEmKYH3GCppCxHQYJJFjopiEku84fRjo83FdwueRLYl
 IMxR4+iqzD0yqZSMsGwkNYKbg2rwyP6LSkwZRHkL3azdqJ0J5NePyNBVYiojjJM5pB2i
 Pk7TEOzV5+PlvYyiEd4k+Q2XlHH+0AqyvWllLRUz9wgva39L6j9er0haVzJ57gmopyCP
 puQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1fcVkXbnMuANrk+Ur0WezzXveYqWqDlQYB2JE2gMdvY=;
 b=DT5EmNe3xqk6pQkcAGBi6QGRYLG1mjj/bD/4h3Jct1FReNWR3eowIUQnmuv6TxF5jH
 zRPHlhknlM1VfM+E2Fu+IQvl3nQMMbfpq8ZFiFMqUsnwWjBOr38JmTVRY/XeLw35cd6J
 4MTv/+3ZJnHdSAkfzVrMXTmUqRqueaOMtO12UW3xdvIqVAbrE3WZ31gjZoIx8hCCElkv
 aV8uHD98ILvaWnX8PwxHOupelZQNNJt3UEG/IZ99lj2dVivT1y/wbjzYZx2nnbmHicJI
 uVg/oWkUTuaNdzCLXWjjTxY8yz08Hs5qfRpIcwhCtEQ9IGvVPerUy2wPGZhi2hC4hf/0
 59fg==
X-Gm-Message-State: APjAAAXR9IXd3HGD3VE3tj2uauDP+AgDiYErXPFCly5S6yDzlDEovScl
 r8+Za3MzSdtIwdIcEW9BnvZUng==
X-Received: by 2002:a17:90a:a404:: with SMTP id
 y4mr1264188pjp.58.1565202233346; 
 Wed, 07 Aug 2019 11:23:53 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id h14sm121761477pfq.22.2019.08.07.11.23.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 11:23:52 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, tony.nguyen@bt.com,
 qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166794966.57397@bt.com>
 <27c692bf-45af-afbe-27ba-1e8f7f936121@linaro.org>
 <528a22e6-25a6-30c2-44e2-82df90bfa2da@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <92720e5e-5bb9-a4be-a652-39e710071db1@linaro.org>
Date: Wed, 7 Aug 2019 11:23:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <528a22e6-25a6-30c2-44e2-82df90bfa2da@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 20/26] memory: Access
 MemoryRegion with endianness
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
 jcmvbkbc@gmail.com, frederic.konrad@adacore.com, kraxel@redhat.com,
 gxt@mprc.pku.edu.cn, pburton@wavecomp.com, marex@denx.de, robh@kernel.org,
 hare@suse.com, sstabellini@kernel.org, berto@igalia.com, proljc@gmail.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, pasic@linux.ibm.com,
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
X-TUID: 8ieTSt5kYLX7

On 8/7/19 11:00 AM, Paolo Bonzini wrote:
> On 07/08/19 19:49, Richard Henderson wrote:
>> On 8/7/19 1:33 AM, tony.nguyen@bt.com wrote:
>>> @@ -551,6 +551,7 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
>>>          /* As length is under guest control, handle illegal values. */
>>>          return;
>>>      }
>>> +    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
>>>      memory_region_dispatch_write(mr, addr, val, size_memop(len),
>>>                                   MEMTXATTRS_UNSPECIFIED);
>>>  }
>>
>> Here is an example of where Paolo is quite right -- you cannot simply add MO_TE
>> via size_memop().  In patch 22 we see
>>
>>> @@ -542,16 +542,15 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
>>>          val = pci_get_byte(buf);
>>>          break;
>>>      case 2:
>>> -        val = cpu_to_le16(pci_get_word(buf));
>>> +        val = pci_get_word(buf);
>>>          break;
>>>      case 4:
>>> -        val = cpu_to_le32(pci_get_long(buf));
>>> +        val = pci_get_long(buf);
>>>          break;
>>>      default:
>>>          /* As length is under guest control, handle illegal values. */
>>>          return;
>>>      }
>>> -    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
>>>      memory_region_dispatch_write(mr, addr, val, size_memop(len),
>>>                                   MEMTXATTRS_UNSPECIFIED);
>>
>> This is a little-endian store -- MO_LE not MO_TE.
> 
> Or leave the switch statement aside and request host endianness.  Either
> is fine.

The goal is to minimize the number of places and the number of times that
bswaps happen.  That's why I think pushing the cpu_to_le16 into
memory_region_dispatch_write is a good thing.

However, leaving a host-endian might be the easiest short-term solution for the
more complicated cases.  It also seems like a way to split the patch further if
we think that's desirable.


r~
