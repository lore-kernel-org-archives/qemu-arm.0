Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6846392wrv;
        Wed, 7 Aug 2019 11:01:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzTw/US8SATwl2z8cPE5Op0cnj1/YfH22vQLLlIkkOKpgylOSzY8M35FyMvnXrZdDFYnsyL
X-Received: by 2002:a50:922a:: with SMTP id i39mr11169971eda.219.1565200861767;
        Wed, 07 Aug 2019 11:01:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565200861; cv=none;
        d=google.com; s=arc-20160816;
        b=vJTQAJfnUBOMKiwejhUhDC+/tHglDWl7mRHnVXlTFjSU1/iIDERKyZbjlnEIQ5XXg8
         b0I6tTUtPtgQRQHbd43fCNBm2oY0+lqQq9pAxZNxwoOPxogjRym5M+N96G5rmU/bTGiN
         AnSSmFjSyxjj4cDVfsyMKt4vqwlMBxiu8/ZO1HnzAVdUpl55rtStECsPkLYE38rKgwbA
         yeUSn+urcvyOBhqFMVVfR/SUGl9ZjJp3BzbZFiFryRXPCDSt0ScxTlD+bDp4qhwizX+D
         DrGCn7w4C9/z89EAS447AUO4S1BXDGJiqbBauBpqX6XEGVdG717FEbxlymZK5OAygkVi
         kDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=RnNcTkcEY3ZbfGxsdEEUpb9QGclJr+HC6jfSpFEWpCc=;
        b=xCHdjcdcOjhPEm2POdOwGit4XcFI0B974E6Z+NhyZVL+/h/DESVhlWPtWklpxt+rV1
         J06xlvsuU+6811LcyUR20H3X7ZwPgKc76OgtXHQQVzpFVka65WZY2JGWfphVeX/Zz/v1
         FS304dbNZUjvYBvD3BjzlnZPVvG5Cq2cu6HMttrCrQJ4NhDa2VoLTJ/MdJ1Ku7wySLla
         60wgg2Kbkxfy1IZciwtt4airK+js5dOdosDarAIF1J5bb8Xj6tS1ZELRd7Q5d0VyyUNe
         iN7qT4YQvgd5PdauaMOguIfEZRj5Ft1+IhePQGGfxeauQqJxn0moG8wXAOitE4lGCQ3G
         tB0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e23si32836044edb.103.2019.08.07.11.01.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 11:01:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvQFA-0003tK-Qk
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 14:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33115)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hvQEz-0003ge-OS
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:00:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hvQEy-0007yC-JA
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:00:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43994)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hvQEy-0007vN-CF
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:00:48 -0400
Received: by mail-wr1-f66.google.com with SMTP id p13so17684677wru.10
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 11:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RnNcTkcEY3ZbfGxsdEEUpb9QGclJr+HC6jfSpFEWpCc=;
 b=J1UVJDO79aJkj07UElR3sqvlJg79WJRcptTWDVqstZmSFv2pdVFtsNVP5CBacpvSxH
 2hii8559rlwxiRwy3KCPCTlZL+WC8YZCdrv0R+fZuW0qmolgw7M9mwJsM+dipcvS53+7
 9awnQvyAJ1/KkX7HuUyrzGxLd0vFYXuySAfNe5NVUP76vnJO6QfU635YCCEcYbedAX+3
 JkvUf4i1zMd57vvPAb9cWTHYyY2qDu7wrzXuEeSDbZojYKVHQUcL1Kqb4aQvoASg1rpO
 lALA9LMd411Kh8z1pa3P7AqxMr3pRpkDD80nMEuAupyGGibR17ggoM5vWTazM5ZXcngj
 +5IA==
X-Gm-Message-State: APjAAAV76oYcDs7SdWfhuD1p32A6ICXi55/NsohgwevUGPRZcvC4wd9B
 GvqWtt0b2QGdXxpo2q4SibN9mQ==
X-Received: by 2002:adf:8bd1:: with SMTP id w17mr12968197wra.50.1565200846958; 
 Wed, 07 Aug 2019 11:00:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:dc26:ed70:9e4c:3810?
 ([2001:b07:6468:f312:dc26:ed70:9e4c:3810])
 by smtp.gmail.com with ESMTPSA id a19sm6155981wra.2.2019.08.07.11.00.42
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 11:00:46 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, tony.nguyen@bt.com,
 qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166794966.57397@bt.com>
 <27c692bf-45af-afbe-27ba-1e8f7f936121@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <528a22e6-25a6-30c2-44e2-82df90bfa2da@redhat.com>
Date: Wed, 7 Aug 2019 20:00:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <27c692bf-45af-afbe-27ba-1e8f7f936121@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
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
X-TUID: tE6WDuZk/9xy

On 07/08/19 19:49, Richard Henderson wrote:
> On 8/7/19 1:33 AM, tony.nguyen@bt.com wrote:
>> @@ -551,6 +551,7 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
>>          /* As length is under guest control, handle illegal values. */
>>          return;
>>      }
>> +    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
>>      memory_region_dispatch_write(mr, addr, val, size_memop(len),
>>                                   MEMTXATTRS_UNSPECIFIED);
>>  }
> 
> Here is an example of where Paolo is quite right -- you cannot simply add MO_TE
> via size_memop().  In patch 22 we see
> 
>> @@ -542,16 +542,15 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
>>          val = pci_get_byte(buf);
>>          break;
>>      case 2:
>> -        val = cpu_to_le16(pci_get_word(buf));
>> +        val = pci_get_word(buf);
>>          break;
>>      case 4:
>> -        val = cpu_to_le32(pci_get_long(buf));
>> +        val = pci_get_long(buf);
>>          break;
>>      default:
>>          /* As length is under guest control, handle illegal values. */
>>          return;
>>      }
>> -    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
>>      memory_region_dispatch_write(mr, addr, val, size_memop(len),
>>                                   MEMTXATTRS_UNSPECIFIED);
> 
> This is a little-endian store -- MO_LE not MO_TE.

Or leave the switch statement aside and request host endianness.  Either
is fine.

Paolo
