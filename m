Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10540538wrv;
        Thu, 25 Jul 2019 04:49:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbUj8BZHJ0hTKqdHpDp4+PGy03XcaiEOdG6UWWSgtO9PL6yzTZ4wbhx2oX0K9Pnjj4oPPV
X-Received: by 2002:a37:5fc6:: with SMTP id t189mr57184638qkb.483.1564055362121;
        Thu, 25 Jul 2019 04:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564055362; cv=none;
        d=google.com; s=arc-20160816;
        b=pI4i/MyxhXqCEzs6Lh1mQzabz8FymtUgdEtQoO3LGgGx14MHzOrP3T4qE+w299py8q
         6W1AWW0CybwuFpvjPbNNEeYoFHwRIjDuuXSyMfciTyFhomzhpqa3bZaRbaHISi0ZwxeO
         hego8+cEL5spn/Qad85WMh2k5oCFWWNSPzPNlKAIWz1wGVTYqkwL64amz0SSexlM/pB2
         wxxy05VUtJBzDK6j7wwrE/DnQ+MOlglelD+1KExsQAKMEHEwlQtem4/dG+wilZs5BJmW
         WKvz2tityFxYjW5flhLD/ZSzjQwifZ1sz1UM3R2lTg7/d9e6WXfE1QaL5/H3qiLQcX9y
         E9jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from;
        bh=upi3cyDdc6DFPYW8/wqSwP4NpEO2pkVT3xjducvYpJA=;
        b=jk8ejtvwh/FD5i/n68N1BnycTAP64fkj/2Ub6yqWZYB5VyIq4BIU0i2RCtK0m+gC0P
         dYXfRb+YCVUCW2g47Y+thHDpa7CEdx0kYCIeiT+X4nrrEoRXEn+TvZIbeDqWjfaWSeTI
         ZuRZoTIQTJPbaIDinA/OLzholIbZodFZVH2YuaIS/ewlEyWSr5tP+kfLakLr++xsz3Ct
         jKqHDxOdc/ppW1J0DEJs5g5nOCAL3N7H6nCYlUKA+ufP1S5i98k3L8h+GIbQ/UkuwvII
         HR4c3C8L1Q7f87Fs/eU/n2YVGSMTSayXyZqKVI4OgDxBZw52vysgistbtqdzzu5Cop2n
         c5zA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si30182236qke.101.2019.07.25.04.49.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 04:49:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqcFN-0005pc-FJ
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 07:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54521)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqcFH-0005kn-TE
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:49:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqcFG-0001gl-R5
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:49:15 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42535)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqcFG-0001fr-Jf
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:49:14 -0400
Received: by mail-wr1-f65.google.com with SMTP id x1so525039wrr.9
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2019 04:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=upi3cyDdc6DFPYW8/wqSwP4NpEO2pkVT3xjducvYpJA=;
 b=KvaI7fuOiFnk8k5f7V8bYkK8iNqJS5fYS/H+rXhS4hioHvsO2FRorWMr9I01dSEzIT
 Q+GAms+2nFDcVW6ZEhSV1+qmIRmA01RJ/jTGM6mCPrz//hFsczQJ+ES865H4XavGzwzm
 UqUXV1C3P2VNtQDHp455w5E9+6IAyaXcelj7Tfw/UYxcPC7+66CHm5pMzZ6y45m/pTpM
 rzoSoDOCEdwqXaeQP2LSqUU4MtYOpcO6E49kHIZtO/xEnw/XydGcEcSMMVQXoOyKUC5k
 Jixj+I+/xwYI1qdQoFhgM1d6ldQvuw5T4HgtJOc5PxOJEnMwCQLVQmwlznr+U84G01Bf
 hNcQ==
X-Gm-Message-State: APjAAAVWB6k/eLNOrKElpfv/tjIuU4T7xoWYOl6aF4yCnlXN4/HShk+Y
 ThDBLfbtChNHRMKnEIyN7P7K6w==
X-Received: by 2002:adf:9ece:: with SMTP id b14mr45338830wrf.192.1564055353591; 
 Thu, 25 Jul 2019 04:49:13 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id c3sm52035222wrx.19.2019.07.25.04.49.11
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:49:13 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
 <1564048532722.5565@bt.com> <c35579f0-2a7d-a2e6-ff18-65c5013e1684@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <14bea5de-dd5f-54c5-d7aa-713708abfa7b@redhat.com>
Date: Thu, 25 Jul 2019 13:49:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c35579f0-2a7d-a2e6-ff18-65c5013e1684@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 09/15] cputlb: Access
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
X-TUID: Vz3cQxKmnWU/

On 7/25/19 1:38 PM, Philippe Mathieu-Daudé wrote:
> On 7/25/19 11:55 AM, tony.nguyen@bt.com wrote:
>> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
>> ---
>>  accel/tcg/cputlb.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index 523be4c..a4a0bf7 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -906,8 +906,8 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>>          qemu_mutex_lock_iothread();
>>          locked = true;
>>      }
>> -    r = memory_region_dispatch_read(mr, mr_offset,
>> -                                    &val, size, iotlbentry->attrs);
>> +    r = memory_region_dispatch_read(mr, mr_offset, &val, SIZE_MEMOP(size),
>> +                                    iotlbentry->attrs);
>>      if (r != MEMTX_OK) {
>>          hwaddr physaddr = mr_offset +
>>              section->offset_within_address_space -
>> @@ -947,8 +947,8 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>>          qemu_mutex_lock_iothread();
>>          locked = true;
>>      }
>> -    r = memory_region_dispatch_write(mr, mr_offset,
>> -                                     val, size, iotlbentry->attrs);
>> +    r = memory_region_dispatch_write(mr, mr_offset, val, SIZE_MEMOP(size),
>> +                                    iotlbentry->attrs);
>>      if (r != MEMTX_OK) {
>>          hwaddr physaddr = mr_offset +
>>              section->offset_within_address_space -
>> --
>> 1.8.3.1
>>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Hmm now reading patch #11 I think you should also convert
cpu_transaction_failed() in this patch, not in #11, and this will make
#11 easier to review.
