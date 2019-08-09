Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9630572wrv;
        Fri, 9 Aug 2019 13:22:04 -0700 (PDT)
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr10431017wmj.71.1565382124029;
        Fri, 09 Aug 2019 13:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565382124; cv=none;
        d=google.com; s=arc-20160816;
        b=z0K5ecceHcz47C4tBKNxrAjdqZoHQRYqjMCP3ANfIHw768yy9vODLjPfrEPidvD2Lb
         oxLH5pO3a9BxbVquOs+tYrkEJ11utauuHHpATYiKOuoj6XIdrtqa9AIDRBULTy+SWn0X
         ueer2aTzSSRj/Kf81fqJZoGldsk4aYT0CbIagIBEmkFWTiUQWaa5yrFaTL0YC/z6jMEg
         wH/ZaH+nAFv3rxiLI6x8A4vk3dtiPFxai4DYJmZlYJPhWQTA2vhXWpGUknGaKjtjgtJh
         tO06xXnoxmaxE9mSyJRWBURxjAx8urlOn8MZMjRiw2nXuVwVBtyD+HXWmFV4UfbFDyJA
         Mm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=wfFUisYao/CObVSSiozPR0j1fe4VzwBjemIAiGRc/3I=;
        b=E/+MKyzCqV02bPOq1POoDygyMZQFWD4f3jB5ifB5TkB/dkg/RmKYNMWerhA9THLMX1
         KIO282eCa/zU6eCuM6dkTWanp0pYs7RIv0CPeGINoyGAmA25YXgeEiZeuTLr73Y0ZZIW
         EBgWNLS0O6WFFzQx0W6ZayVP5IlvrjsZYBSWSC7gR/4s+tDJ5WF3k8q0WBiaX+MuQAfY
         ELg+vSIHPy1Fd/WQToLCPvAKPd75K7pwGHT4ZblGGa8OwPVBKFwCDk7nFKHuvT6dHpMh
         BbbqVynIIEJ8gByASfY95yDsoVaKt9w7RtuDZED+z16VWpWXjf8Gn/ZG5sOkpXs8gyjV
         kbAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o16sor4177928wmc.29.2019.08.09.13.22.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Aug 2019 13:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wfFUisYao/CObVSSiozPR0j1fe4VzwBjemIAiGRc/3I=;
        b=DJldl1xrPyAN/sXmU1DqNJ0ELoijx65QynzukNmS11xgE8jkbnzzTOdJUQY0jF3kU/
         E6BRMMDhOThTKtLVqerynoYcm9LfDHR2gREzflXmT9fy/SOb5NGaUAi+wumQUDBqxPZf
         kV2g+sSxtdmbjPYSacjRUpDoXan5PDx7EM5T9JswYU9TXx0ucxsX4lozWGJLH/qsh/dG
         VpL5S9abqcfc8vDuDnG/4E5skf7SQ3dc7Ke4/IpAHI9yp+noqjN1BMw+wcxq4GUykKWc
         hi70UsWUVxjFTIc3ZX7I3bolPZgyw9Z3ArOPaYOKo7qdvNZSop0JsCPTx3JZ2pscFx9F
         /fXg==
X-Gm-Message-State: APjAAAWCewBrBDriKUVACT1VKagkY+6zcX1quKnLi7PjGhGsY7HA8s1i
	zmD1kJL1UarwF83Yioylm4/OFQ==
X-Google-Smtp-Source: APXvYqwaWOyDjiD1e3P7VI2ZmVGax+mPdqfK2xNPEp0Ydmc8ANaeAnkP69uvjNyAmvCXKGcGA3NQ6g==
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr12368266wmd.22.1565382123803;
        Fri, 09 Aug 2019 13:22:03 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net. [83.51.160.214])
        by smtp.gmail.com with ESMTPSA id 15sm4585995wmk.34.2019.08.09.13.22.02
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 13:22:03 -0700 (PDT)
Subject: Re: [PATCH v4 0/8] Support disabling TCG on ARM
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Samuel Ortiz <sameo@linux.intel.com>,
 Rob Bradford <robert.bradford@intel.com>, qemu-arm <qemu-arm@nongnu.org>,
 Andrew Jones <drjones@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, Thomas Huth <thuth@redhat.com>
References: <20190701194942.10092-1-philmd@redhat.com>
 <CAFEAcA_bWHAe_aoaN1+1RFm3zEvAxmzQtVm1zbatJHG_+CgqmA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <07662a67-b4cf-e681-fffa-98a03a26e0fb@redhat.com>
Date: Fri, 9 Aug 2019 22:22:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_bWHAe_aoaN1+1RFm3zEvAxmzQtVm1zbatJHG_+CgqmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 8I0JBVrAvWdb

Hi Peter, Paolo, Alex, Thomas :)

On 7/2/19 4:08 PM, Peter Maydell wrote:
> On Mon, 1 Jul 2019 at 20:49, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
[...]
>> $ git backport-diff -u v3 -r target-arm.next..v4
>> Key:
>> [----] : patches are identical
>> [####] : number of functional differences between upstream/downstream patch
>> [down] : patch is downstream-only
>> The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively
>>
[skipping patches already applied...]

>> 004/8:[----] [--] 'RFC target/arm: Restrict pre-ARMv7 cpus to TCG'
>> 005/8:[----] [--] 'RFC target/arm: Do not build pre-ARMv7 cpus when using KVM'
>> 006/8:[----] [--] 'RFC target/arm: Restrict R and M profiles to TCG'
>> 007/8:[----] [--] 'RFC target/arm: Do not build A/M-profile cpus when using KVM'
>> 008/8:[----] [--] 'target/arm: Do not build TCG objects when TCG is off'
> 
> I'm going to apply patches 1 and 2 to target-arm.next for rc0 (since
> 2 is helpful to redhat downstream and taking 1 now reduces the
> amount of code-movement patches you'll need to rebase). Patch 3
> doesn't compile and 4-8 are rfc.

The remaining patches can be applied without conflict, so no need to
respin (yet) IMO.

Paolo/Thomas, do you mind reviewing patches 5 and 7? They are kconfig
related.

Peter/Alex, do you mind reviewing patches 4 and 6 first, then 5 and 7 (5
and 7 can wait for Paolo/Thomas' review first).

Thanks!

Phil.
