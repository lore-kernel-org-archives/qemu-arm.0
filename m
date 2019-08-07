Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6659917wrv;
        Wed, 7 Aug 2019 08:04:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxuUclzCfpqUuZzW0WnshBhwfFY61u/0geazPGSTmTqteNTKgmJaM8N2idRhkihUp1fzDMI
X-Received: by 2002:a0c:b010:: with SMTP id k16mr8626661qvc.170.1565190259903;
        Wed, 07 Aug 2019 08:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565190259; cv=none;
        d=google.com; s=arc-20160816;
        b=xXAeIq7qQGj86X0fFubbqq3vS1QkgdxVqMts01bRqV4SbqMbsYWxn6WZhpxCQqkqBN
         V47Uv031Tc0SqSX7ri8Oox9jVnMUHXErfFn4z4bxL0EdR/78KM2LrqvbudW3KbDPM1u9
         iBV8woTjmjIiE0hgSdtyAQs+Y69QNtTwUzRO1rqF+z1AB4WFMYWsLAbckz80NgajzF3O
         ZEWTrk4/uXtmsMHRvfBicgW5cJuX9GW+RAyqZdB90YqUUBqdHcKGA+ENEThyINwT74gL
         es2ximzKiUPBKoHb/2H0m0ZypqUFFVY9w0iFZhpofsuS5yPWv0ZHUXzR3RacMbVQV0at
         lpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=zC4jFiOofa0R83ZDHoyfyBvXAp+7d+Y13pRmYlC0riM=;
        b=fGW1+rjGVHLsH71FQxgyiZr1Y+h7BH3k5gUWg2DFeDSk2++/qhbXQTT1UNOqR2V9xV
         K0tUkqnIoZExfGwRdEiJf0EHjmqtlmi7RoiwBN0fGmbI3EmEIpc10V6Q/NUO06gxhvl5
         AMqbYTlYP1PIGDEknfCzBN0quUDj550xrwtZ0SwaXsCDxvdY5xghO6nJLLvBfxEoJyLv
         XxeynR82JS0/qQXsddhdBL3Vjx9ZDEAAnc5qzu6VPO+/y0wAehF+cKpCiWKifIJi1EPo
         FCXng3FxcyyvaCH808VUjE02yUL5LcNiaD789bLKW9kYD1vPx6ifxwx0CbCxHErVO3yY
         172g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m9hc/ZPv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s129si50186088qke.252.2019.08.07.08.04.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 08:04:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m9hc/ZPv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvNUB-000611-Em
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 11:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48236)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvNTo-0005KR-V1
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:04:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvNTn-0007ig-Ex
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:03:56 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36921)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvNTn-0007hg-6e
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:03:55 -0400
Received: by mail-pl1-x643.google.com with SMTP id b3so41279464plr.4
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 08:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zC4jFiOofa0R83ZDHoyfyBvXAp+7d+Y13pRmYlC0riM=;
 b=m9hc/ZPvf0oKc2ofnxDXra2HBXylt4M9/iWEUE7A5+da5UzFcS1Z34iSyHOVMpgboZ
 /zuam3ye+iOLSDNyFXcXzCUY8t+9fHGeYqEYkwBXawuqvSSKS8sGizofeh5fhFc/+9T3
 gIj6f2kpuUao/ZW7UIO1wQ0fARYx41FxM3/++1o6dxqc67PoB6Qqt6Dp2ZxjF/eH0lxb
 OK+rLmcul5O7v32jpHVyLKV76RdtM+OvM4r/CcbUtL0k33qf7zDlg9AFBWhZ96Rnl337
 m2W6aRjhJreJhSDt9gG+YToZ+oArpXUp/c74GgjRbP4ERag95UU5rT52M3BbogifA7FL
 itOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zC4jFiOofa0R83ZDHoyfyBvXAp+7d+Y13pRmYlC0riM=;
 b=kIH1Y+ezN+mPq8Tzew2454dAqZ2Btdg7SqNu6Z+q0/5ZA3CCBZNOoAkNHpA2sWnQil
 X6L0eRLMONgnwDzZICK0puIKasM/NsIrSUxCGyyxiyRjsP7ZWYQCpX10ao6Gl/X/+COJ
 ALZYG2DMIJSIDeWA6o7+X2l906pybXOOlBATTXbL7Ugq3Kok/Ui73sxCXktvpV8aSpBk
 oBKpwVMSzHTUneb4OFaM4cIyaNTeE4Yz/jAiVLmsNCahwKJt1V+fsB+aRs82sFRPOn5e
 9H1sVZrFSYaUgyDavSG42rpI3OkB0MWUZyPlVQ0MyxESg0IqdYhYWOBu3ApMl8u/4FRF
 UqSQ==
X-Gm-Message-State: APjAAAXwFMO96SCbZLAC6F+gH0gfepKlILfW8XqF8TrG7j67JPyix/NU
 xepm/Fn3LFt8j3+9YZft04YQNw==
X-Received: by 2002:a62:ac11:: with SMTP id v17mr9765690pfe.236.1565190234054; 
 Wed, 07 Aug 2019 08:03:54 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a128sm104461852pfb.185.2019.08.07.08.03.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 08:03:53 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, tony.nguyen@bt.com,
 qemu-devel@nongnu.org
References: <45ec4924e0b34a3d9124e2db06af75b4@tpw09926dag18e.domain1.systemhost.net>
 <1565166771281.2734@bt.com> <efbf3560-76d3-62ba-0f8f-3e8ca8686f1d@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0b0906e2-0d51-7de4-c99e-8d2e1af62efe@linaro.org>
Date: Wed, 7 Aug 2019 08:03:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <efbf3560-76d3-62ba-0f8f-3e8ca8686f1d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 19/26] exec: Delete
 DEVICE_HOST_ENDIAN
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
X-TUID: x8Q5ags5olNY

On 8/7/19 3:22 AM, Paolo Bonzini wrote:
> On 07/08/19 10:32, tony.nguyen@bt.com wrote:
>> +#if defined(HOST_WORDS_BIGENDIAN)
>> +    .endianness = MO_BE,
>> +#else
>> +    .endianness = MO_LE,
>> +#endif
> 
> Host endianness is just 0, isn't it?

Yes.  Just leaving a comment to that effect here for the one use is probably
sufficient.


r~
