Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6378188wrv;
        Wed, 7 Aug 2019 03:43:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrZCh4y1Nuf8cAzg0lKuUWjI0HRKb1fEk5ru2ocNEKW8i3ZY7amYLNksnON4EqmLEysSTG
X-Received: by 2002:a50:92e1:: with SMTP id l30mr8631677eda.141.1565174588503;
        Wed, 07 Aug 2019 03:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565174588; cv=none;
        d=google.com; s=arc-20160816;
        b=khtggxkJAvcvr1Fds6xWXEzzEDoPbv7w0l+20iglogYsc3s6mmWBfSNREwphdUPmhh
         5OWtj2OaWp58T0D6dYG2/QXWhxHVoLkCy65iULB21U3p8RiNj0FBvLjYh3aA0gb8omA7
         Ki2xsUIwaVT8KFw2TpViNHkkqSnk0wcpFvmnRBLkGtRwhLpllKUmZgdpdS+pNaI7XIA6
         YgVqcJ7sbei7NOZs2YnZqx/J4ffQHD3k19EcS7slq7o575WBubA9IKeNvhHaHBkD82e8
         M8iLpkMjLPpg9vV20/dF/Iyj5T+fFXtL/+UIe/BCK4Q19GBJYYMr4YuF97pJvDoeTM1V
         hRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=RK6l3NcbPdkNrqzfgxFAPB3AcnYTmuMm/yEayizkoGM=;
        b=MPmbruxnz5enHD6FT/Ta7sWj6XSD/48ZErCYb3S3OnzJepYHVgpThahNxEZzjGutXh
         /3BxPVEhoq54IzJMH2gdHTStug01e/TQBieu2kqWL0ygQLFDBUd9Tx4z+GMAeEFm00za
         4HAblcjDVHCy62YeBh/3zxyCy9OHeGh0+FuMdtMQZBlu5AO53rzJtOBaRuwP9Grc3s//
         C6GlqcRjS8zqiWEw9D7Qp522sZvGuuCGSqAQIMcVBbo9dmKsEyWJy3OTWagQeCK60dMg
         BWt3I6vZAGZeUBLjnASRYs9Vs8cPp5K6VBcr/SjOkHafLcyBuCkOXP4WBSTGQhkdZjIz
         azgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q25si30171797ejs.275.2019.08.07.03.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 03:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39643 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvJPP-0000hq-KL
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 06:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46440)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hvJOr-00082H-2o
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 06:42:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hvJOp-0003uF-80
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 06:42:32 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55408)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hvJOp-0003n2-2Y
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 06:42:31 -0400
Received: by mail-wm1-f67.google.com with SMTP id f72so1027481wmf.5
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 03:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RK6l3NcbPdkNrqzfgxFAPB3AcnYTmuMm/yEayizkoGM=;
 b=lT4GI46TFAfK/3qUlwPpY/H103N2z9LHQZgOA9131CQtYT+OZPw7NSf/blCMjZGGmJ
 Dv4LFvyUQjl++at8KCr2YabVgfJec91gyXm4YybPF1CFoOn0ZHuaiadbOkwmyADCTyzX
 LgeIZ9utRYvydtctumID7ksGwQ4kbGX12Qrs2Vb/EwUIt4o/XmF5N0/NvB8NyeGC14nZ
 KO/hRwVUf5Rs+d+ZKiAslz5b8lGpm+PsQDvu6hpbjJGVDVZfE+i0pQQn7Ni9iiKi/Qd2
 UaN3nlNBUcsyaAp84+vwj28aXzIsjnRfzW9N/DsqHDbqUtlqvRgQSGSGdQjxX06hZKNV
 OlpA==
X-Gm-Message-State: APjAAAUgVOPfHalWXDFc/xB817+84T+Dmm7hb4Wn2XbyvkyDCl3o+d4G
 rQSES2n/ECaYv9YDbYA8M21AKQ==
X-Received: by 2002:a7b:c215:: with SMTP id x21mr10171537wmi.38.1565174542531; 
 Wed, 07 Aug 2019 03:42:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:dc26:ed70:9e4c:3810?
 ([2001:b07:6468:f312:dc26:ed70:9e4c:3810])
 by smtp.gmail.com with ESMTPSA id c3sm92411304wrx.19.2019.08.07.03.42.19
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 03:42:21 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166668830.25608@bt.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <962f4d91-c1c4-7e97-5297-11c546d823f0@redhat.com>
Date: Wed, 7 Aug 2019 12:42:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166668830.25608@bt.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 15/26] build: Correct
 non-common common-obj-* to obj-*
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
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 gxt@mprc.pku.edu.cn, pburton@wavecomp.com, xiaoguangrong.eric@gmail.com,
 peter.chubb@nicta.com.au, philmd@redhat.com, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, chouteau@adacore.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, jcd@tribudubois.net,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, mreitz@redhat.com,
 hpoussin@reactos.org, joel@jms.id.au, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, david@gibson.dropbear.id.au, lersek@redhat.com,
 green@moxielogic.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 marex@denx.de, jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org,
 qemu-s390x@nongnu.org, sw@weilnetz.de, alistair@alistair23.me,
 yuval.shaia@oracle.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jan.kiszka@web.de,
 clg@kaod.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 shorne@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-riscv@nongnu.org, proljc@gmail.com, andrew@aj.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, andrew.smirnov@gmail.com,
 michael@walle.cc, paul.durrant@citrix.com, qemu-ppc@nongnu.org,
 huth@tuxfamily.org, amarkovic@wavecomp.com, imammedo@redhat.com,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YCRErAYXzQhd

On 07/08/19 10:31, tony.nguyen@bt.com wrote:
> Preparation for replacing device_endian with MemOp.
> 
> Device realizing code with MemorRegionOps endianness as
> DEVICE_NATIVE_ENDIAN is not common code.
> 
> Corrected devices were identified by making the declaration of
> DEVICE_NATIVE_ENDIAN conditional upon NEED_CPU_H and then listing
> what failed to compile.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>

The general approach makes sense.  However, most of these should not be
DEVICE_NATIVE_ENDIAN.  I can help with some of them.

Paolo
