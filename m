Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6358015wrv;
        Wed, 7 Aug 2019 03:23:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycwCAA59rdFw7q6vqLQK6z3E2M7VXxGzIBCel6WknpyV8yMBbBUSlV9rgy8lbdtOjs3dFZ
X-Received: by 2002:ac8:6bc8:: with SMTP id b8mr7097961qtt.191.1565173394392;
        Wed, 07 Aug 2019 03:23:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565173394; cv=none;
        d=google.com; s=arc-20160816;
        b=qtOK1WcXG+ebg+TrwH1901PWQUB3Jwy5ihgcJ84fQ+1c3IMUNkv3Ol5KlUsGKyvqvZ
         aOtleHLEi8TgLu/It4fKlBVFLh1TJ3b1+IuObY8JGRXDPtVmhn5+6uKwe2uVIbv29jSC
         vOV/WZmasZoFh2rE4UQgfzQQQ67WuaiWuTth4BBOZPOp4RusOxGNKcSDEDOtnNCGl2xW
         8qbDONcOwwxHxAjDAbQGzI26FXeZfI+qqAsL2a1nYNwlMKoGDePo3mQmEgvlIIC2dsdo
         GidtkqLlMO7FMG+b0ox4193+wBhML8LiyTFMRGnHXsYERx5nYcMSI4Xrwp7meUqTalyr
         bRuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=0XSyHvDMekjafpUZd/bGO/uyC3MKHMOWHaWq6AQGhdI=;
        b=lZuoRhJpalAApOOKLNndfSsaWWST2wsl1eWRF5suWo9yllChlSv1K0rnfnLvFCLb73
         ue1cTAXgw0ujq+2uR4JztgDaju9qUMxI/CBFwbjBz4WFtx9Csze4ljAJtF4dDxX+MXSQ
         g/lh98brZ4An6/KmAnYEZUemrL/a1wXDGHarN2WvAOrjaUoU8oOg4m1sUYixejGK3WeM
         eSDk9Z0tPIV3GDN/UpzJ0yTTGXpobCDUIRlTuKCJVZHwz3a/T+WJxOOZ0s5/LHI7Lz+l
         IbU/z33Qs1FHLKjfjrFNTsYzxDLult67yriztyc9GiYp7g9N4qiwGgHxUQUUY3M3vqgy
         RmmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r28si55251882qvc.33.2019.08.07.03.23.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 03:23:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvJ69-0004E5-UM
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 06:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43050)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hvJ5a-0003hY-Dk
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:22:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hvJ5Z-00011N-J4
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:22:38 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40943)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hvJ5Z-00010u-Ck
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 06:22:37 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so79443002wmj.5
 for <qemu-devel@nongnu.org>; Wed, 07 Aug 2019 03:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0XSyHvDMekjafpUZd/bGO/uyC3MKHMOWHaWq6AQGhdI=;
 b=cJIGSsH4f7gnTsZnj/FPxjAk7UF7ksYs0qQg7k3ke83b5Wpi+iHRTrV5jExnvhOsP1
 4/9tLI663YLv92+vUriuqf9eTMeYftAPNk3aE/9WK+XRi4Nt/JHe/3b9ORBHLJa8DKbj
 vHLKe6T/l/dcGjheL353rOu9volUS+8uibH/rpYXpIigb/6twNbfiCWcQfHA4eCpP+Bp
 vHDnb9s9eTATpWhuR0MhdKN3vQ1jw/ixSTn9Rh+5BRFp/W3bHhCt4mPfgyTrRh6Aumup
 pQ1SJuxWWQd4b/pW117y+nuvbQQdXr/y1vdlxFWIi5+HopP0NHZcBr0ZHoT0f7grrwD0
 k/Ug==
X-Gm-Message-State: APjAAAXVcmKV3JFDH6HRfT17zet9SHKbFg5CLVMSxf2xbKu76K6lqQVj
 S5LBjI2sRafRbpO95JsGVMFUaA==
X-Received: by 2002:a05:600c:10ce:: with SMTP id
 l14mr9662688wmd.118.1565173356318; 
 Wed, 07 Aug 2019 03:22:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:dc26:ed70:9e4c:3810?
 ([2001:b07:6468:f312:dc26:ed70:9e4c:3810])
 by smtp.gmail.com with ESMTPSA id c15sm12952891wrb.80.2019.08.07.03.22.32
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 03:22:35 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166771281.2734@bt.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <efbf3560-76d3-62ba-0f8f-3e8ca8686f1d@redhat.com>
Date: Wed, 7 Aug 2019 12:22:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565166771281.2734@bt.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH v6 19/26] exec: Delete DEVICE_HOST_ENDIAN
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn, pburton@wavecomp.com,
 xiaoguangrong.eric@gmail.com, peter.chubb@nicta.com.au, philmd@redhat.com,
 robh@kernel.org, hare@suse.com, sstabellini@kernel.org, berto@igalia.com,
 chouteau@adacore.com, qemu-block@nongnu.org, arikalo@wavecomp.com,
 jslaby@suse.cz, deller@gmx.de, mst@redhat.com, magnus.damm@gmail.com,
 jcd@tribudubois.net, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 mreitz@redhat.com, hpoussin@reactos.org, joel@jms.id.au,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org,
 david@gibson.dropbear.id.au, lersek@redhat.com, green@moxielogic.com,
 atar4qemu@gmail.com, antonynpavlov@gmail.com, marex@denx.de, jiri@resnulli.us,
 ehabkost@redhat.com, minyard@acm.org, qemu-s390x@nongnu.org, sw@weilnetz.de,
 alistair@alistair23.me, yuval.shaia@oracle.com, b.galvani@gmail.com,
 eric.auger@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, shorne@gmail.com, jsnow@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, qemu-riscv@nongnu.org, proljc@gmail.com,
 andrew@aj.id.au, kbastian@mail.uni-paderborn.de, crwulff@gmail.com,
 laurent@vivier.eu, Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com,
 andrew.smirnov@gmail.com, michael@walle.cc, paul.durrant@citrix.com,
 qemu-ppc@nongnu.org, huth@tuxfamily.org, amarkovic@wavecomp.com,
 imammedo@redhat.com, aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v1yfmRnBlTWe

On 07/08/19 10:32, tony.nguyen@bt.com wrote:
> +#if defined(HOST_WORDS_BIGENDIAN)
> +    .endianness = MO_BE,
> +#else
> +    .endianness = MO_LE,
> +#endif

Host endianness is just 0, isn't it?

Paolo
