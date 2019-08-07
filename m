Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6718259wrv;
        Wed, 7 Aug 2019 08:55:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyYq2to+yq5MQWqWtCz9GHYxZ/S2a1QsqRaTaAoi8KBSeUQ6W1qcvILu0KeULdiLen2R7ob
X-Received: by 2002:a0c:ba2c:: with SMTP id w44mr8670271qvf.62.1565193332044;
        Wed, 07 Aug 2019 08:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565193332; cv=none;
        d=google.com; s=arc-20160816;
        b=PptmI3eFktCU3/dQ7g663/yRMu4nNGIYzdjxjc+of7NIChUV0Q48wKLU+ZI3JqB9AV
         5T8ff1nUkmdztYATOBGVJBjvB3czxgwaXfEM6Qnr4EnOVqAVEQOWSnhuDsgOYkwaQxIy
         GsdWRAgVAaFjAK5nwc7Uh+C/dJSJhvZuJfYmzTtxFXJaSCG37eNbyRcjlvmu3WU0tq4e
         Yyx50wg+Hc7pixBXdE+L4o3SFlaJoD8jT/SB/QTd0KIdPYbHY8VGWLZDJ4oV8otDNY4V
         5Rko71RkCsPyYEKaqea83kvF1yUaj5vzl0OI6F1m/s5GIw/5IirRhBDZHqRNNE1lT8ln
         POlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=prLuYlCIjqqGCnuy16UMao/whYuieT5vCsOk/Uu8Jfs=;
        b=a9a9zqOHGhNNMM2pt7eYs8X+BDQV+jsril6DSBmTFIWmWIWjmphSK0KuIFJz6p65Jg
         wI+CoGtqVNU3sByN0MV7By11vukHcGD1JH43k8//i80A9J8p9Eh/b/iRd7qwQ/EaoEs8
         1vLtOtVyHZztPRfU0zd5808HsywvsYbyI2wawvL1WOivIziHQ64tT6J0o7XuW7OIritL
         XK7xjnKOhIZcbbiP2RLRFsQeqt6UIvs7QO2xlM3nkd42tkbzSs2PkZKx/BjhaTKqyLyh
         AFPvJCbmtyNvqueovqqVaAEhvP31UyhZm0VqyYbmIHsGNSr9lWsIwkcsjArue+wHfedP
         4leQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rjJA277U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x52si2707126qtc.244.2019.08.07.08.55.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 08:55:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rjJA277U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvOHj-0002Sl-JY
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 11:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60845)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOHb-0002Qq-Vx
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:55:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvOHa-00048H-Lj
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:55:23 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46612)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvOHa-000476-5a
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:55:22 -0400
Received: by mail-pl1-x641.google.com with SMTP id c2so41418268plz.13
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 08:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=prLuYlCIjqqGCnuy16UMao/whYuieT5vCsOk/Uu8Jfs=;
 b=rjJA277UKjGXhHdTw07ZfW3C5Mn6ZbEDCyfEzYhzyY5Fa6hqywzzPHsfVqhjmsY1xd
 swUGLSFFlIfDfAfMlqMngfwVZO6uXvboimYFhSbZ2cmSQSMK6PClDl/OID2BpXOt13Pd
 U2cOUPTWvLOpP7nh5Xeo9afmgoeSdlhfEFRUqA71QsbwvshALi+Qzfk0g/enc95E4z7h
 i5tdWDwKeM4+P1UwQwPHD2IUFy4X6tQQB312FSE/2X0v0sHI0VNQdcTK41kBrmdl49eh
 MulrE+5MtbI4z8k+ssVC20xJJ9kiczTOLWOvAXbhyjkgBmI8VDQ9JuzBl/kEiyyUub+i
 HQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=prLuYlCIjqqGCnuy16UMao/whYuieT5vCsOk/Uu8Jfs=;
 b=BfPz7ekB+2wgfEwW515Jfx6xTUk+EiuKBT+iQeVfmXvMR+5q66NE5xTy79l6b920Yv
 2jQEodESgSXXGvSuHBVnCJmSFkUsFYUAEqjOolQ/MGaFDiy1JgdYyvMa4Vkcqg61QHAq
 OFKp2y2AJDu5xbZuqxBuldx272p43MOQemcnGHqhP//BWehYzibNH6/9/OTLgJ4o6awJ
 EhYbzQtdY9TbQ/h1az61P2OVcoUfwmgN9hegjLS33mS4QpTTq/ovcxRR0fWR0sPoqqw1
 VRKJGvj5WtEfZUgWWctUiE29fg/jSQFyFyPsOWM+elF4VbakQbWP6hrYLI+27UHvaS9k
 /ZSg==
X-Gm-Message-State: APjAAAW1/vr8aAjfyxxuYwZGPUCbW81l3M6K7xuStXst52bJ7W0BJ+KE
 lI07uF7ba5mdYpGH2p4JBFqutg==
X-Received: by 2002:a17:902:8d92:: with SMTP id
 v18mr8949359plo.211.1565193321031; 
 Wed, 07 Aug 2019 08:55:21 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i3sm98279530pfo.138.2019.08.07.08.55.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:55:20 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166687895.25037@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <28cf72ed-7a4e-668f-40ca-71a2c7fbeca5@linaro.org>
Date: Wed, 7 Aug 2019 08:55:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166687895.25037@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 16/26] exec: Map
 device_endian onto MemOp
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
X-TUID: FWYmMvPU300x

On 8/7/19 1:31 AM, tony.nguyen@bt.com wrote:
> Preparation to replace device_endian with MemOp.
> 
> Mapping device_endian onto MemOp limits behaviour changes to this
> relatively smaller patch.
> 
> The next patch will replace all device_endian usages with the
> equivalent MemOp. That patch will be large but have no behaviour
> changes.
> 
> A subsequent patch will then delete unused device_endian.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/char/serial.c          | 18 ++++++------------
>  include/exec/cpu-common.h | 10 +++++++---
>  2 files changed, 13 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
