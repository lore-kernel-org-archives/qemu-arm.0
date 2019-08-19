Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3006840wrs;
        Mon, 19 Aug 2019 11:30:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1Tu9piGgzaHAXGYJKtusKsY6lD61eRAFHtt1MHAaOWNmCUf8WC5tw3QtetoEUU/gXPnU0
X-Received: by 2002:a37:4fcf:: with SMTP id d198mr22217224qkb.394.1566239414613;
        Mon, 19 Aug 2019 11:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566239414; cv=none;
        d=google.com; s=arc-20160816;
        b=wRT57pL9j7m7Rh0z7TctVcuM76fUDZ3I/ZNr/u4l7s5//WUzbwadxgNgE2XMEANUsL
         BWy0kboI2lbIyRYaHUpWtOA/MKsgCL5Hp/aYYr0McJfS1OX4NfBAUQVNBKtLtAj8olb9
         NZNQhn9ltj42uf1nyY6QqsI75zadKTU+31sH4TR1Pk66OQWAzMDC+Uw05zhxU8/ihLMx
         OduGid+20lda/eMkCsaE7tzyzEn+gRXvoLTkWu9d6xD70vsdkr3/h9C2vP8M0EVP3Tiq
         BNSaCLXu/YfPR8CTbmQKxHiorfzruzhglDDY4vpbQzYxW/nyBwlobqJEVhpoBES22DXt
         wTow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from;
        bh=2AWM5QJsOEl26RbrGu9u71/aoBSOJcokey3JtMybmtE=;
        b=A1XIg/PcHk49HnKvzkWdrAan7rhbnSR1SgTrqO6Z9FnPNi5bOJzSPVbEVqldVmnglZ
         z329Ua2aeSoPPa3TJFF1A8ZYjNMddTDdtym9qv5Cjmg/U6eX/77bv9OVxZbIsQAhZ0tj
         ao4rILI/FCNo+gQgVoyJ+jL/aHZLCRPhM3kjCbX4blJKX7osIsIhhqkU0xGLgtE+8tpu
         SfTbC7eLYa3nHexikIincCdOkXR3ZMlvqrp/4fEyicLRuY6KEhd3NaT4+Mzty3FXOS38
         InI7a7Studi2S/zT205Tbr7x5FMqZQ6KCvoM7KgHPctmnkjE9D7UsZkucWdwzV/8SJF4
         1WFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m45si9543562qvg.156.2019.08.19.11.30.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 11:30:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzmQ1-00032G-UG
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 14:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1hzmPY-0002xT-KP
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 14:29:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hzmPX-0005mL-Ga
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 14:29:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40864)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hzmPX-0005lq-9e
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 14:29:43 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 622FDC08EC12
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 18:29:42 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id 19so108692wmk.0
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 11:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2AWM5QJsOEl26RbrGu9u71/aoBSOJcokey3JtMybmtE=;
 b=Q3uGNY15dmemjejShbdJMYxyrrSxZ63D85Bu2LBB5o2eyUjFKTJJyIZ5FPLUNyuBgz
 FVOWhfbgL09h+aCTK7TpiPcigGv1heusKPp+5NRzx+f6TRF2zMVjMARIrVF09NM4EYWf
 vhEnjlRt0UGSA3l1mNxzzydn2AnaNTTwhDd4uMnteOO+TWE0EYsZ9kv3IrAW28n4E4TA
 NQnpkD+sx3xXOEnk0/GuAQ+RZncPtP3rSYpUVTlDd85PnmvatHRgjgw/fOXDDoo0HcFz
 zwFXgZoxDIjF+5jpL7QaZTYkmHVCupeRUXXDMSlGIuCWevQkA+PjFNfnixcbYoj6ZAzn
 +q+A==
X-Gm-Message-State: APjAAAXvkmhtLGDW0NNVSBJxSVbQkgVDGyAMiOOBWVHy27fU2IMCnTlY
 eTQzj2UUnElIZMRtmgwW6IA//zmTnZ58FYfpvLpjCEEmDF0RVtGtzGBYaoio0Mu1DI96Tfl9Ffx
 bnyLZc/wtC9lm
X-Received: by 2002:adf:f204:: with SMTP id p4mr30446214wro.317.1566239380848; 
 Mon, 19 Aug 2019 11:29:40 -0700 (PDT)
X-Received: by 2002:adf:f204:: with SMTP id p4mr30446155wro.317.1566239380560; 
 Mon, 19 Aug 2019 11:29:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:399c:411e:1ccb:f240?
 ([2001:b07:6468:f312:399c:411e:1ccb:f240])
 by smtp.gmail.com with ESMTPSA id o14sm28083513wrg.64.2019.08.19.11.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2019 11:29:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Thomas Huth <thuth@redhat.com>, tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941032362.60179@bt.com>
 <1b5f5a92-1b75-f0d9-d7bc-4605094ad8e7@redhat.com>
 <8d8b37c9-3daf-d241-df92-1a5467bca451@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3b983f77-8503-3fcd-7c42-45d0121845e6@redhat.com>
Date: Mon, 19 Aug 2019 20:29:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8d8b37c9-3daf-d241-df92-1a5467bca451@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [qemu-s390x] [Qemu-devel] [PATCH v7 33/42] exec:
 Replace device_endian with MemOp
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, philmd@redhat.com,
 green@moxielogic.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 amarkovic@wavecomp.com, jan.kiszka@web.de, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, jasowang@redhat.com,
 kraxel@redhat.com, gxt@mprc.pku.edu.cn, robh@kernel.org, lersek@redhat.com,
 borntraeger@de.ibm.com, joel@jms.id.au, antonynpavlov@gmail.com,
 chouteau@adacore.com, balrogg@gmail.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, jslaby@suse.cz, marex@denx.de,
 proljc@gmail.com, marcandre.lureau@redhat.com, alistair@alistair23.me,
 paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QJ8c5wxddGUt

On 19/08/19 20:28, Paolo Bonzini wrote:
> On 16/08/19 12:12, Thomas Huth wrote:
>> This patch is *huge*, more than 800kB. It keeps being stuck in the the
>> filter of the qemu-s390x list each time you send it. Please:
>>
>> 1) Try to break it up in more digestible pieces, e.g. change only one
>> subsystem at a time (this is also better reviewable by people who are
>> interested in one area)
> 
> This is not really possible, since the patch is basically a
> search-and-replace.  You could perhaps use some magic
> ("DEVICE_MEMOP_ENDIAN" or something like that) to allow a split, but it
> would introduce more complication than anything else.

I'm stupid, at this point of the series it _would_ be possible to split
the patch by subsystem.  Still not sure it would be actually an advantage.

Paolo

> Agreed on the HTML though. :)
> 
> Paolo
> 

