Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1381395wrs;
        Sun, 18 Aug 2019 02:14:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXWrgQhWACPWyqZE2Vv9EmvelKeqYTVicyORSefk6y5ZmD+6RaB2lN+uqD2NzorV5gZJWY
X-Received: by 2002:a05:6402:1450:: with SMTP id d16mr19582722edx.198.1566119651468;
        Sun, 18 Aug 2019 02:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566119651; cv=none;
        d=google.com; s=arc-20160816;
        b=0sgbKyZcxfDytnJZ71g3UhU600BkwzKDO/KHum1lSpNAiakOfp5PbZOXf84paJXlH/
         oGz/e1DUOw5xEma9l7EA2B+tzsPjjeHbl3tioRpwECQa3mWv/J1PR5Heum6dR3CvE7uX
         AyzJwarHIxKewwSIjT+dCM5fmuZhwA75TRObfPscuMKfxBN87G9qRcQLsqqnB9iqi1ps
         Qh3Ld46LVs8rruNKdPCJjwvio17Tb5ZIyZd1QhLuYxC+ew+TY86E+c5GUyXSt9bQ4yBw
         eMiUwXhbtv93CKVmGjip5PHhaOb78g6KUEHNpP7zDnFPRQaLJPmuPAZbZjqqz3/1XoHD
         FdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=08ykHv62/kAXNcraKtHpxP/q/+jI+lbPhBDJ0nAr1BU=;
        b=jbRKrQpL60Bhg+yQWulmT9tqE7aY9JB/QJMfU6PQ5VHe0mAW6oq67zmBxs2vgd56Uv
         oIWINy8n+dZ1JSVIb9B6D0twsKGtIPmYMblM7ZYF+V1dMWP4WAuegmC/7VxzyK2e6Hd9
         OrK9Gjg7fR2IaAOXYwi3IXPTBOa9uF4A1VXFYjrLv2fNnTA3Vnr0eCwwzJWJS+hF/nZb
         yVbTq8vGJzaV21ZLdgJYFV7lqCMoCmLK9cFKu17jMfvroD0DKS9KctdkgjD4MjXN0e0r
         rrb7zpogHPic8OBG3hee78oOi7AktDAbLJAHx/81+shiAuPDqgSFMbzqddtfRBTE2Ic8
         E6KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c4moUhMk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22si5455489eja.344.2019.08.18.02.14.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Aug 2019 02:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c4moUhMk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzHGM-00081o-CH
	for alex.bennee@linaro.org; Sun, 18 Aug 2019 05:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53612)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzHFs-00081B-Vn
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 05:13:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzHFo-0003n5-Lz
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 05:13:40 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46098)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzHFo-0003lw-A0
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 05:13:36 -0400
Received: by mail-wr1-x441.google.com with SMTP id z1so5591172wru.13
 for <qemu-arm@nongnu.org>; Sun, 18 Aug 2019 02:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=08ykHv62/kAXNcraKtHpxP/q/+jI+lbPhBDJ0nAr1BU=;
 b=c4moUhMktTQM2REJR3Kcvd9R3Y3KbtNUkR2Xkmm19hB5a7iUHB9KfzaHvOOwR7fOQ4
 PdCVC/1lHi09tEPQJN52Tj3oxl4vtX6SFjQHt51h5dQQLuNOsivYsti+z4orzwNOUXZe
 T+WEI3E1iPcWB4sOHtD1K7IReWiE3Oc/KfYqFaLuUck5j8jnHRsLcdGXn9/0XoV6K8sD
 9p1wj8n4iSAV+rOGUX5RBK7kMAD/HVgDjrIQRUBc16/ADf2e52ozi9QrVChaun7K/Z15
 7mVZz5iifK7lius9LzxXoBM3OUa1tsFtsyMKjrLbC4CxDliOx8150Jy9eq4+/XEteiFM
 XsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=08ykHv62/kAXNcraKtHpxP/q/+jI+lbPhBDJ0nAr1BU=;
 b=X3ZTHyU93n1HCk2loeHExKIWcCWNAt+93ERZJq9QHtxNdy1I0VUuSDQ3X86A7kywCx
 n+5IeD/1v4Kro2KO9GrWTzzJjpf1/B3KzywbFPWKcDDmLkS531gu13oCE6G7LrsRZv2m
 SCV1Jt8aKZ+PrJ672DMnnZi/1Rbb9HxFyizEywKwin62/IeTg2DkL0i97ryHH7h3gYBN
 CM77InabjuhgYAVjYcKtI83UuXWX2If3eDjp/WEBfO1r7g6SPxWRTHkH/AcNXb6ymS2K
 8pKlTdj+fdSJUM1ErGSN7sFMAdAcJXvQuLZljYnCwFSl4RmWLgU2J8zFc8M0QEtgSoaY
 C71w==
X-Gm-Message-State: APjAAAXHH7esu4jL/mRjiF6JSQQkHgC1Sj5i50VJhksE0SgENMXtOzal
 WrEBFyJwa8+Ulm5/Jvfknx81Yg==
X-Received: by 2002:adf:e2cb:: with SMTP id d11mr20563632wrj.66.1566119614901; 
 Sun, 18 Aug 2019 02:13:34 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:a69:1700:8897:9507:94c2:b98d?
 ([2a02:c7f:a69:1700:8897:9507:94c2:b98d])
 by smtp.gmail.com with ESMTPSA id k9sm9410852wrq.15.2019.08.18.02.13.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 02:13:33 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b53bdb6b-278e-7359-8cfb-48d8d07adc1f@linaro.org>
Date: Sun, 18 Aug 2019 10:13:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 00/42] Invert Endian bit in
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
 qemu-riscv@nongnu.org, proljc@gmail.com, pbonzini@redhat.com, andrew@aj.id.au,
 claudio.fontana@suse.com, crwulff@gmail.com, laurent@vivier.eu,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, andrew.smirnov@gmail.com,
 michael@walle.cc, paul.durrant@citrix.com, qemu-ppc@nongnu.org,
 huth@tuxfamily.org, amarkovic@wavecomp.com, kbastian@mail.uni-paderborn.de,
 imammedo@redhat.com, aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N0KFPRfhJlJG

On 8/16/19 7:28 AM, tony.nguyen@bt.com wrote:
> Tony Nguyen (42):
>   configure: Define TARGET_ALIGNED_ONLY in configure
>   tcg: TCGMemOp is now accelerator independent MemOp
>   memory: Introduce size_memop
>   target/mips: Access MemoryRegion with MemOp
>   hw/s390x: Access MemoryRegion with MemOp
>   hw/intc/armv7m_nic: Access MemoryRegion with MemOp
>   hw/virtio: Access MemoryRegion with MemOp
>   hw/vfio: Access MemoryRegion with MemOp
>   exec: Access MemoryRegion with MemOp
>   cputlb: Access MemoryRegion with MemOp
>   memory: Access MemoryRegion with MemOp
>   hw/s390x: Hard code size with MO_{8|16|32|64}
>   target/mips: Hard code size with MO_{8|16|32|64}
>   exec: Hard code size with MO_{8|16|32|64}

I have queued these 14 patches to tcg-next:

  https://github.com/rth7680/qemu/tree/tcg-next

I agree with the downthread conversation with Phil that the middle device
patches should be split out to a different series.

I have some questions on some of the last few patches, and I don't know how
they would interact cherry-picking from those, so I've left them for now.

I had some trouble applying your patches, as they're encoded quoted-printable,
and "git am" doesn't like that.  If possible, please use "git send-email" to
post your next patch set.


r~
