Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6836840wrv;
        Wed, 7 Aug 2019 10:49:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwUR7EtwCI6c5zJnw4xmsebO1UIc+dqhNjWSHhHtRWf9MOfQaywxyA8U+mE7CQsAUX1yFNj
X-Received: by 2002:a50:ed07:: with SMTP id j7mr11386835eds.107.1565200194236;
        Wed, 07 Aug 2019 10:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565200194; cv=none;
        d=google.com; s=arc-20160816;
        b=lU4lVLAJbSVPp/02PejADolBCKztd3+T3ORRmHr5KP9ZwjeFqW7S8WxQQVgooIAm00
         xTK3DKVveX5wVRQfjWEfNJoDQELWR6QyKj3iJBLDXT373GZ58XxdF4kAD/qulB6EFsRV
         8U0FZnYQtOpoQ18jnVe6tPzZO9LxxvBIQZ0ppeBlk4OjJVEr3hNBYt5IHGlfkhiIChR6
         5ZAY1OoGjfcgQE1aeYt4tYViKxAidZGU7Rm0mfMiXDIFAMqD149zXGpJDCciXHOM664K
         5r9FZQQtEpoica/Y3FmvOMLpzW4X8f61X/rCZKZMNSM66W4OvR2d7kKhGnzIbLPSJDVB
         HTzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=rwTIbhxoEl+9L5Abc76IchYk4TetqSvunhUmVSOtMWo=;
        b=jXepP2H+H7wIYAGSjPMnIU8XGnFs47IwK8NLPlezYaM/bvs8JGrGmQ/LR2vy5dlPVL
         jtaaSllVs4KU6Nd/99f/cJ2CTdvW0bewrW52Bf2Nq/RYreZXDhF6hBWz+bUJj4495FSl
         XpTVVw77RABoOZp3LHmBhEJPS3sM4ELkj0CLVCKgl7QjB+DghLGVa+od4fYrzUTj4Ucm
         M0OhqEcemkEezWQvzqurXCq6k0st+k1OZkoyy+OfrhpvUDrNa+WPTyw/W1o57ZQpfDfZ
         H94gpqe+c7vVkvDz7TIbEvqdGQVh5UaS5G8vmNQmomQJxbfnuUV2vORfZtclHYDVxZGY
         2DSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YSd01dq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q25si30796076ejs.275.2019.08.07.10.49.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 10:49:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YSd01dq4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvQ4P-0001OK-Cc
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 13:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59036)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvQ48-0001BE-1P
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:49:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvQ47-00085H-2J
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:49:35 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40701)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvQ46-000832-ME
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 13:49:34 -0400
Received: by mail-pl1-x644.google.com with SMTP id a93so41827968pla.7
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 10:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rwTIbhxoEl+9L5Abc76IchYk4TetqSvunhUmVSOtMWo=;
 b=YSd01dq4KtF6aeZkw5hkDHENoAmzJOdch2P9Xl6k7iJhJOozBH08Xd6X8MdTgN8uFL
 dayMMbNyz7ZSR+VFJ605dDSnaIApm2E3utOwDPHFZ38Ww0Yq2hW49lnxsZfbp4yn6FDL
 WbwqPP7yVik0d0cAAsPPdv9U+Jm1KuDYmSkVnREqiqvjtBwIcUnH5Xc/gl9O6lnkIiYk
 VhL9l6TrN+DQt2wAGnIhc0ENdijp3rUv/YraMyGDu6wMe9x+ZMo7AjxGpCB5GwWDzR8S
 4mEFZrxsfoOHb2BNG7md9SL+3ARxa9EvmllUIzDfD4ZcsqQgw4KkThE7J5q6hLkKOjqW
 ercg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rwTIbhxoEl+9L5Abc76IchYk4TetqSvunhUmVSOtMWo=;
 b=p3rhKHx+wbd7QLjxf6X79bMbpTTRD5dsIIL99vHk+bTbQB5R5IcY/xLRZ81pN350X4
 4o0MeljWhDnmlPMvKP0uDJgaKYsSs98ZrGR1TSG1Vw3QGYiP3a6rrUldl57kvNePYPv/
 QXWDlpiwuN7ryp2j3wFWtaky5UruXHCDCyfOyLgzUlfbHd+EqwqHIJOw41swIdhvxuqp
 +O7rWIIhoyaA1AI5FsVCXlKEyWim2oIW78O5+Kw3v7P9Ja8HQIZSfWqoIUqxRG/IvGml
 EtQPVBmzSpmfNPPQKaqmMw7b9wXuzoQSfqQtR9z3ZczJmQP9oOR2lE95kxKIZoUC8PrA
 52Yg==
X-Gm-Message-State: APjAAAVTAcfWr4IcxXA2CiSAkX3Vvj9eYHS9VScgpbut2PRv+30Ez+Kv
 lQrAYezXmmNGvsr4il6+ASN2jA==
X-Received: by 2002:a17:902:6b02:: with SMTP id
 o2mr8483559plk.99.1565200173396; 
 Wed, 07 Aug 2019 10:49:33 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id w1sm489442pjt.30.2019.08.07.10.49.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 10:49:32 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166794966.57397@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <27c692bf-45af-afbe-27ba-1e8f7f936121@linaro.org>
Date: Wed, 7 Aug 2019 10:49:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166794966.57397@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-TUID: v5+Cx1VpEPIA

On 8/7/19 1:33 AM, tony.nguyen@bt.com wrote:
> @@ -551,6 +551,7 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
>          /* As length is under guest control, handle illegal values. */
>          return;
>      }
> +    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
>      memory_region_dispatch_write(mr, addr, val, size_memop(len),
>                                   MEMTXATTRS_UNSPECIFIED);
>  }

Here is an example of where Paolo is quite right -- you cannot simply add MO_TE
via size_memop().  In patch 22 we see

> @@ -542,16 +542,15 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
>          val = pci_get_byte(buf);
>          break;
>      case 2:
> -        val = cpu_to_le16(pci_get_word(buf));
> +        val = pci_get_word(buf);
>          break;
>      case 4:
> -        val = cpu_to_le32(pci_get_long(buf));
> +        val = pci_get_long(buf);
>          break;
>      default:
>          /* As length is under guest control, handle illegal values. */
>          return;
>      }
> -    /* FIXME: memory_region_dispatch_write ignores MO_BSWAP.  */
>      memory_region_dispatch_write(mr, addr, val, size_memop(len),
>                                   MEMTXATTRS_UNSPECIFIED);

This is a little-endian store -- MO_LE not MO_TE.


r~
