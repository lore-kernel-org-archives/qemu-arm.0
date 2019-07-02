Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3562369wru;
        Tue, 2 Jul 2019 01:57:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzmC4h18X/IolrMNYT8I5g7IHymjxb1uKAZPloI3z9so1fDBCVto0ZIEQbgfJhQqV96ssMv
X-Received: by 2002:a50:c8c3:: with SMTP id k3mr33855982edh.189.1562057831012;
        Tue, 02 Jul 2019 01:57:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562057831; cv=none;
        d=google.com; s=arc-20160816;
        b=obhscETof9+a5+PDd0+pZJlvMH5yBuVuimhzYsZm1Yp25jFaTFBf0ILPZ5ZLq/AxlP
         Ov/kvFiz3wIM3NY6TrTMq3qTN6kQTJNWKhPdTdK3Qs5rRp+stUevlpBjtEZEL1e0cVGM
         MyVcU32v/6I73lmLmocspcNgiiqy0x/AqNPS/O3L5Ic+D+DfKTBXLS4O1HRDrD30ceip
         Lgc7tUvPM+Xfh1+f2p59YxsiF8MFIQ1Dt8r1UjdYYFfjz6wcbMUxbq43CwHwdFmm1u+d
         sUbGjfzuzy4rxlgtVtR7w4AvCweg9t66WHx/GpPJgcQbyFrtrZOMRJwqMNByoMK5P9Wc
         h6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=oSjvuz2rugAVIKLouuWDhPV3/dlyDm58XcPPJ0cZhBo=;
        b=O0RDqQFY+a50I0tmrsdB+69/yP4BPdOIWuxIZcrkECAEjChK47fmxlQd+g5poQrrkM
         h3gmTUtY3ismYbRg8NtTu+gO/DiF+otPUKAXC8UYCPBxuE3RTTE7F7QRxE7OVmG+Mir4
         r1pICNs98yNF1jm1eKbVs05I9P2xBqBtKfgMmFsPc4xVXSHK/jpyWwr+896WwavaBRgO
         R5PVN//oQBgtEkpfvU8qNc3DMYpVUcPtcrHpIg+eRTJdTS1HWRnJd585wtjbJ1tl9y8I
         +SF7NbHDLUqOkCoSRZnGU5zjr6xjTZsYkGotmJb5e6NkoLdih1lBz6R6MOIV7xl4fpDM
         Rg1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11si9142858ejy.102.2019.07.02.01.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 01:57:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiEb8-0008J3-49
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 04:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59340)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hiEak-00086V-8C
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 04:56:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hiEag-0001yf-EB
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 04:56:44 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56276)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hiEag-0001td-7q
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 04:56:42 -0400
Received: by mail-wm1-f66.google.com with SMTP id a15so24802wmj.5
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2019 01:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oSjvuz2rugAVIKLouuWDhPV3/dlyDm58XcPPJ0cZhBo=;
 b=MYR1rctGrxL6mwJWAwQz5WI0IUrRMDO6sSrdfLF4l8V1r9h+MMegZvhKQntAG4FoBs
 OQIoDB/omPkWDr0891KBbARmYO6pnWiOCob8OJ47rIlx4KcuVO5/KAgvrd6KqyxjvgQA
 HXJL5OZAp/1OwMFwYuqk939mLVqmipen7/2+9uXNWBt+2G1E612cpVTupz+l6FQagm3Y
 MN9H4Y/2rSpqBICiIGA4Z1rVXFrjyibwEkS+khb+lwXCQDURq7bACPuSusYJhnHfnR1K
 fcySzbvGcnntva2ZC9YLY2PHwje1SxDlF5UdsSlNkv1uLI9u/DeXAYhdSyneHDNRfXda
 mRNA==
X-Gm-Message-State: APjAAAV592gH7uFcWKsuS/AcYbrrv5Mgmk4jsZ9a7kpGyWJNS96XHYA2
 aPjPtaE8RxZldbbZGC8V1GfziA==
X-Received: by 2002:a05:600c:da:: with SMTP id
 u26mr2551980wmm.108.1562057790847; 
 Tue, 02 Jul 2019 01:56:30 -0700 (PDT)
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.56])
 by smtp.gmail.com with ESMTPSA id 66sm1984331wma.11.2019.07.02.01.56.29
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 01:56:30 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com,
 David Hildenbrand <david@redhat.com>
References: <20190701190819.25388-1-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <78aa3a5a-9d29-c29d-64e4-ca16a69f4de4@redhat.com>
Date: Tue, 2 Jul 2019 10:56:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190701190819.25388-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] tests: Update DSDT ACPI table
 for arm/virt board with PCDIMM related changes
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 27pvMvBeVm6e

Hi Eric,

On 7/1/19 9:08 PM, Eric Auger wrote:
> PCDIMM hotplug addition updated the DSDT. Update the reference table.

Can you point the commit sha1 please?

> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  tests/data/acpi/virt/DSDT | Bin 18476 -> 18493 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 
> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
> index 20e85c7f89f645c69935c615c07084e221419960..1a5c3e5243c78eb25345fdf7ffa442afec3c5c28 100644
> GIT binary patch
> delta 172
> zcmZ28fpPByMlP3Nmk?VI1_q{Y6S<_BIvO{s=eSSi^^mWRZt~=a(Tfjuig$N)iRXy-
> z@O0sIbPn(|FfcS`;D`?ea)A;+mUB?BARiZZCmRDZqb36bLnT9WgKLnhI|B~`0|zG;
> zOLQYQi0kYc?CPT+ViNBf7Q$Ho;v_5(n_Qj1$iNt*&kVB1*CW8$H`v*4fdEjLhl`1U
> Ni>WOjJjjWw0RY`tDw+TQ
> 
> delta 134
> zcmdlxfpN_QMlP3Nmk=Ef1_q{ziCof5?F}2%bKIpo*xdvC4LIUGJY9GlgM2*<49pA}
> zIN}{$f+og`c`$P_2rw{ovN13+sxvS!RDxt&Jq4Ay6ndl?7@-g-A<n=c$sh-0Ff)LR
> Z11c2ZjdwLLW@rlt4|3vam^{&45den68LI#Q
> 
