Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3005618wrs;
        Mon, 19 Aug 2019 11:29:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwS4CLrOAqmq/clVNjjcc2XR1gbr+PC52DjkEtokdy0QfUOn5SlPHJcZgQTZGIFPFpLW0MR
X-Received: by 2002:ac8:688f:: with SMTP id m15mr21936972qtq.26.1566239341300;
        Mon, 19 Aug 2019 11:29:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566239341; cv=none;
        d=google.com; s=arc-20160816;
        b=HLwRWmxNmUUObpQSP16U59MqxcBfae82hejjQ/dHvxawmL44HLHa3cV9uQ4SAnuOfJ
         tHGoJCNS5sbkznbW43Di+iRqHlyqDF+6mfx8NOmjNG6yoBw0DwrwDS5wNHhdLsgatnui
         Q+CFlYGpOVaIF70LV5NGahM8vt9GwyUcKdw4YVQ1BirfFDl+x+NEaIdZKc2BRRuXNwee
         KTT1CQ0mYZgu7vq9IMYr1umMwfKKgTbueLZvcH66DEUbNfFFoEYEEYsbDDHtIyAhMUvI
         bSe1we0jjfdoBU69hsSECn4m7JYJb7yQp9S5HNKNSfSUY/0gURcPfyFanTU2XfuPI45Y
         GlLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=V4/aFq6DDEPmRVpJY8yCxsJYN8Z3oDBG76SrumSRDN4=;
        b=WGzlv9apCp12bFkOE+KQj3oi4/tQ9+Vwo7tm0Mb+KvS4T4RQbcPUVPKomdP9FnMUjk
         Q/29f+UIKMa8Ay0Q/olH73ClsxJrwNpztrCNd1SdfipZyqUuTTeV8/WGFy0lBc7fQa9B
         G5US1YAVhMI+2KQizKS8e9GnBcSES8bYu64I2D3Skq62JxRbN7lJANb+ojLokgXt10KN
         Q2KtvRAeHeBDBMCVSCUCn3oJolHOtHOVmN+sO3rULEdOfg1Yr5PmuGZEweCWrIyCuQ+J
         dS4LD1LjW9GDDImqZFB9oYCaDRAPELj34nDFVgZUL0DbFnpBdelJdzgPyTkRe19D7TsU
         XH0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f26si6125236qkg.165.2019.08.19.11.29.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 11:29:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzmOq-00021X-Lv
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 14:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57145)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1hzmOf-0001zx-8p
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 14:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hzmOe-0005M4-4W
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 14:28:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40602)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hzmOd-0005L7-TF
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 14:28:48 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F34FAC08E2B0
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 18:28:46 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id a2so5642157wrs.8
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 11:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V4/aFq6DDEPmRVpJY8yCxsJYN8Z3oDBG76SrumSRDN4=;
 b=q3H/v2Ncz1jVMb/+uisiKjmoXjJEW23o9maL1Oaz8f9FvPg8aooHcWH24smB0U3/YS
 EgQOYxzw9cZr8qpWnXasFmx4aj1ndJQfKRkA9GsgKktx6b3MdMRCx3tr6DXCbWseMTG/
 FzaA08atdrz7WUQm+HxKTXxk85D2dpuZf28woLS8gGR+/1F0PaLvawehHRLVoIRb6Iw6
 B5YLgxJGFxCMKNAE20jMNuMYHT1KBvIdwTlY565iz4F/tlaJ37ACKdTbg6Ypbs9P4YhC
 oQNRXiO8tl/Dxvb6QljKJmyqf3/JIZFlhliNhW5eqcOBptXizdAvR36DRsdKL61ABVcR
 AMlQ==
X-Gm-Message-State: APjAAAV3qMYoGs11HcnLryKjrN2SZ/MVBViitkFv+BPlQe/vYEVdFMJC
 +yvxzLW4NrpTU8Xu30BHWnSd2cYv7DkmORQLJ0I7aD+kMkk86N1dguklAuTuwZ1XrqSF2W804Tr
 YckmU5ncdE0Eo
X-Received: by 2002:adf:8364:: with SMTP id 91mr29003130wrd.13.1566239325369; 
 Mon, 19 Aug 2019 11:28:45 -0700 (PDT)
X-Received: by 2002:adf:8364:: with SMTP id 91mr29003101wrd.13.1566239325062; 
 Mon, 19 Aug 2019 11:28:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:399c:411e:1ccb:f240?
 ([2001:b07:6468:f312:399c:411e:1ccb:f240])
 by smtp.gmail.com with ESMTPSA id f7sm21779124wrf.8.2019.08.19.11.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2019 11:28:44 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941032362.60179@bt.com>
 <1b5f5a92-1b75-f0d9-d7bc-4605094ad8e7@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <8d8b37c9-3daf-d241-df92-1a5467bca451@redhat.com>
Date: Mon, 19 Aug 2019 20:28:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1b5f5a92-1b75-f0d9-d7bc-4605094ad8e7@redhat.com>
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
X-TUID: mnRd3A3Nv5BH

On 16/08/19 12:12, Thomas Huth wrote:
> This patch is *huge*, more than 800kB. It keeps being stuck in the the
> filter of the qemu-s390x list each time you send it. Please:
> 
> 1) Try to break it up in more digestible pieces, e.g. change only one
> subsystem at a time (this is also better reviewable by people who are
> interested in one area)

This is not really possible, since the patch is basically a
search-and-replace.  You could perhaps use some magic
("DEVICE_MEMOP_ENDIAN" or something like that) to allow a split, but it
would introduce more complication than anything else.

Agreed on the HTML though. :)

Paolo
