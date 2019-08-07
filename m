Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6373244wrv;
        Wed, 7 Aug 2019 03:38:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoiTW6fOFFG77hMno9JV4F2Y0jS2OSx7/wJwYJgqzqD7PbwalcIfxatIhTPVx0IbFcPzuy
X-Received: by 2002:a37:9d15:: with SMTP id g21mr6938427qke.343.1565174291538;
        Wed, 07 Aug 2019 03:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565174291; cv=none;
        d=google.com; s=arc-20160816;
        b=zr4h1CV3PZw00hwwyq+6HoOo2664qJVHInHhEyegNaC5hqJoztdCBbJpR5H2//WKHV
         Ib2LqxqFAc9vqVQiLzbeU8WXdb/pvgYG0mILz9iqze8QY8nwbb/akEDe5hYRuNwPdDLO
         L2DBgcf6vPmoKvH8GTQetseAwlhBXxf6lH0/PMBGTrkZiVFInvcsZQo0lCRDRvL5OVbg
         iWfgO6y13Nx+Ol5TLZgZAIL/sCykSXld/TgR7K4rwCWkbVCdXd3wmEcObNoIeFVBQEM0
         LHpc7NB+NYg6T421NtwZWEmhqjWeQlX7wUscTAM74MGW0dHH0xmBhPU+Qeqr80IPmdL+
         aAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=xGIMuvKiRWGAighMeIoXICvoM84+mSRh6SCMOKg4t50=;
        b=jcjE/ZoQTvYNA7C2IW/EvcAXTwwElf/85rfeoKhHgEf8eNeWX82tfxRiWRK+I27Bf7
         OM5IgTbHz3QOh9iCnulQpWwnZzxguUInDxcHcbvNarwznz7au7dmV30nTfQ09SOkmjIi
         llYG1GrPuHfSP6MDHST7lITvcCfVLxY45MgAF7GZ74u5v6rR4wme0nzksE+jxh5h0Ow8
         FiY+2aCSMTeS0qeuDW1b1NqMHjo14VF2xs1psneyE2Iqz69iG1u9zd+DbcKp2qMHHNW9
         f/k0CAoaYrnw9djswfq90RPQM1+HWYh74PVrwzGQUpEjLhmu/zW0nIDxNfQS8k/vRI5q
         P0Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v63si51057434qkc.17.2019.08.07.03.38.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 03:38:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvJKd-00048g-1y
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 06:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45608)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hvJKU-00045A-JN
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 06:38:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hvJKT-0001c4-C7
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 06:38:02 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43944)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hvJKT-0001b9-5F
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 06:38:01 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so16254632wru.10
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 03:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xGIMuvKiRWGAighMeIoXICvoM84+mSRh6SCMOKg4t50=;
 b=URSA6GHWYyBJttZ6i8QJtclBGU2hvMipwXZF3xYGu730Dz35Trlf7nZhm/cYerigM8
 rJZ5wpami8NUlWoNHMXP9pGtoi5TbfHVCRG7XKTROQFxg5QcY6HkhAkPszPP5Qy99r0r
 otI8WqDgWn6QImvD/ZOGewkw52S6LYYWbMW9AmduHqCtes9NR+8moGZfO25vIw03+klc
 4rDnBMU5L7TMlcng/im2+C9szBrldEmqTsGxT7w4FVMo6fw4ChGE0yroTWtjbazv+o9n
 rCmU5VLhXLNNSmW9QdR03JvA2v4dgUK9ZZHl6z/PchE+E/xhfKTrPYsEk9U/N/U6q36y
 nN7g==
X-Gm-Message-State: APjAAAVr9l6pUik7vcktVpEkXqhjDsp3tdKgNF5ke+prxfWBFeUg08vN
 iIBLpbU1Vd2RK7xQKI2ggkvEaQ==
X-Received: by 2002:adf:f481:: with SMTP id l1mr3615709wro.123.1565174280079; 
 Wed, 07 Aug 2019 03:38:00 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id c187sm4719394wmd.39.2019.08.07.03.37.56
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 03:37:59 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2397186a-a28e-85dd-131c-900e777a60ad@redhat.com>
Date: Wed, 7 Aug 2019 12:37:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 00/26] Invert Endian bit in
 SPARCv9 MMU TTE
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
 dmitry.fleytman@gmail.com, sagark@eecs.berkeley.edu, mst@redhat.com,
 green@moxielogic.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, pbonzini@redhat.com, kraxel@redhat.com,
 mreitz@redhat.com, pburton@wavecomp.com, marex@denx.de, robh@kernel.org,
 hare@suse.com, gxt@mprc.pku.edu.cn, berto@igalia.com, proljc@gmail.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 david@redhat.com, magnus.damm@gmail.com, yuval.shaia@oracle.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, hpoussin@reactos.org,
 joel@jms.id.au, marcel.apfelbaum@gmail.com, anthony.perard@citrix.com,
 marcandre.lureau@redhat.com, david@gibson.dropbear.id.au, balrogg@gmail.com,
 jasowang@redhat.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org, jcd@tribudubois.net,
 sw@weilnetz.de, alistair@alistair23.me, chouteau@adacore.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 sstabellini@kernel.org, jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 imammedo@redhat.com, xen-devel@lists.xenproject.org, shorne@gmail.com,
 andrew.smirnov@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, xiaoguangrong.eric@gmail.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, lersek@redhat.com, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 i.mitsyanko@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, peter.chubb@nicta.com.au,
 aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FO/2eLVNGFfX

On 8/7/19 10:23 AM, tony.nguyen@bt.com wrote:
[...]
> v3:
> - Like v1, the entire TCGMemOp enum is now MemOp.
> - MemOp target dependant attributes are conditional upon NEED_CPU_H
> 
> v4:
> - Added Paolo Bonzini as include/exec/memop.h maintainer
> 
> v5:
> - Improved commit messages to clarify how interface to access
>   MemoryRegion will be converted from "unsigned size" to "MemOp op".
> - Moved cpu_transaction_failed() MemOp conversion from patch #11 to #9
>   to make review easier.
> 
> v6:
> - Improved commit messages.
> - Include as patch #1 an earlier posted TARGET_ALIGNED_ONLY configure patch.
> - Typeless macro SIZE_MEMOP is now inline.
> - size_memop now includes CONFIG_DEBUG_TCG code.
> - size_memop now also encodes endianness via MO_TE.
> - Reverted size_memop operand "unsigned long" back to "unsigned".
> - Second pass of size_memop to replace no-op place holder with MO_{8|16|32|64}.
> - Delay memory_region_dispatch_{read,write} operand conversion until no-op
>   size_memop is implemented so we have proper typing at all points in between.
> - Fixed bug where not all memory_region_dispatch_{read,write} callers where
>   encoding endianness into the MemOp operand, see patch #20.
> - Fixed bug where not all memory_region_dispatch_{read,write} callers were
>   collapsing their byte swap into adjust_endianness, see patch #20 and #22.
> - Split byte swap collapsing patch (v5 #11) into #21 and #22.
> - Corrected non-common *-common-obj to *-obj.
> - Replaced enum device_endian with MemOp to simplify endianness checks. A
>   straight forward sed but touched *alot* of files. See patch #16 and #17.
> - Deleted enum device_endian.
> - Deleted DEVICE_HOST_ENDIAN definition.
> - Generalized the description of introduced MemTxAttrs attribute byte_swap.

I'm confused I think I already reviewed various patches of your previous
series but don't see my Reviewed-by tags.
