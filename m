Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp107428ejb;
        Wed, 12 Jun 2024 22:41:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUun4RZ6Q+m5PQmKCACQFtg+xVa32aSOkzctbg52ad1R4P17cXBjEKhKPwPLc1T7gOq6uBzYRG5uNkAyQzEiJAmpL1YgrxQ
X-Google-Smtp-Source: AGHT+IGhFRyILk0J5TzZWeaM9j5hkjMetpLeN1AwOazBAyikv4htihP1qXC7/mslb61dozRIgIbu
X-Received: by 2002:ad4:5519:0:b0:6af:3d00:bbfd with SMTP id 6a1803df08f44-6b2a34163f4mr26608536d6.27.1718257283610;
        Wed, 12 Jun 2024 22:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718257283; cv=none;
        d=google.com; s=arc-20160816;
        b=OWelWfwnPpkxMP3e/jYz31dGhct03ZZlmf394PHAHX/ArgtoqIaaWM5NO4xtuyDzf/
         Rn9jv03E5lk5w8O7URnrEBUwSjwxzzgCCl909VIax4u0vAEEjEl/+2pamgWH5uNnn9rM
         uHPB8tS3skL8sXDprwbEiVzBge3wbU6r8sQSE0pTfQNtn1QFw3Zuv4P2BqV5kV1A6Cur
         stVbiwMkVA9p+71Jgbq56RYAAcOkOepFdhK7J5j/8dFumVF1DwYHLIIVRiLIq+8AlgG9
         6UkEUn20UxDspp6vBYCBKjhpsMFysHztGXcOzoQV+mqLgyG0mP9pDCr/MiAcaqc5CSpL
         OGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date;
        bh=WzrllM1MejbS55mEgCC/9/SQGSWG6ZHvEyKbfzsNylE=;
        fh=SZwb3dxOhzaN+C6qzgBquYMYGYfHw4fcKFl7+2FJVDQ=;
        b=dmPEOIQf8TZpuJRm5XGeNocElB4NggdX0Okaz8X+MB0+CzN2qmtUYM4c1iSvr/BhrW
         lnPRo/oom7H/dPOx9pbKE5FwVZOLXxbJybukGGfrm3XmgI1jpYlFzz+1wkuMWuCP1C3q
         o0+7HQ2zr0PMucbIxQjMgLdrMwaXDYfmaT48Y7Ylq4b/DcHROiq4OawBaJcOCmpIdeY6
         /iiCqmxjhpLmpVG1jpYqhlZgsLxyehdhoYItkIYdegeSpmv43NZsQWBVTUYcsi/Oo4eG
         i8Ex05qY+bN1B7tOCP2TWla12HCjT50DKmQDW28sejzGhtSGIL54Dl8r6PzYmC5ytgJC
         JA2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5b2d983si7519026d6.393.2024.06.12.22.41.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 22:41:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sHdCW-0005qI-Vt; Thu, 13 Jun 2024 01:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1sHdCN-0005pr-Ep; Thu, 13 Jun 2024 01:40:35 -0400
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=mail.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ethan84@andestech.com>)
 id 1sHdCK-0007yx-Ol; Thu, 13 Jun 2024 01:40:34 -0400
Received: from ethan84-VirtualBox (10.0.12.12) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Thu, 13 Jun 2024
 13:34:12 +0800
Date: Thu, 13 Jun 2024 13:34:05 +0800
To: Jim Shu <jim.shu@sifive.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
 <qemu-riscv@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Song Gao <gaosong@loongson.cn>,
 "Laurent Vivier" <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>, Nicholas Piggin
 <npiggin@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, "open list:ARM TCG CPUs"
 <qemu-arm@nongnu.org>, "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
Subject: Re: [RFC PATCH 02/16] accel/tcg: memory access from CPU will pass
 access_type to IOMMU
Message-ID: <ZmqEzUPsJwFs7w4+@ethan84-VirtualBox>
References: <20240612081416.29704-1-jim.shu@sifive.com>
 <20240612081416.29704-3-jim.shu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240612081416.29704-3-jim.shu@sifive.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.12.12]
Received-SPF: pass client-ip=59.120.53.16; envelope-from=ethan84@andestech.com;
 helo=mail.andestech.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Ethan Chen <ethan84@andestech.com>
From:  Ethan Chen via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R8kdHpC/A4PU

On Wed, Jun 12, 2024 at 04:14:02PM +0800, Jim Shu wrote:
> [EXTERNAL MAIL]
> 
> It is the preparation patch for upcoming RISC-V wgChecker device.
> 
> Since RISC-V wgChecker could permit access in RO/WO permission, the
> IOMMUMemoryRegion could return different section for read & write
> access. The memory access from CPU should also pass the access_type to
> IOMMU translate function so that IOMMU could return the correct section
> of specified access_type.
> 

Hi Jim,

Does this method take into account the situation where the CPU access type is
different from the access type when creating iotlb? I think the section
might be wrong in this situation.

Thanks,
Ethan
> 
> 
