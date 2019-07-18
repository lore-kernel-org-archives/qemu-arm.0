Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2256725wrv;
        Thu, 18 Jul 2019 06:13:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxe/MU5Si9/e61zkgDYG0StJlw59C1t8+6yxidmjH5NhgYFWii1nbriJfW6rUyyLA5s5Lc6
X-Received: by 2002:a50:b6e6:: with SMTP id f35mr40478026ede.82.1563455606561;
        Thu, 18 Jul 2019 06:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563455606; cv=none;
        d=google.com; s=arc-20160816;
        b=VQmqrHV87PHELCjaDWJkC8i0kfzeIRG8YuzUPort4dOjazpO9YtFLDuqKSf2olZynm
         5M5jOpzkRc6Zso74/ee1pnloExQC3igBgoAIXvfC9TrQP2M6aJJD4+Xpmat/VtkPt23h
         h28OdpU22Gzkyzcu1iGGD82nXwGhm2ftnODPR1US0M3XAXdEEn4Yv/GLtRyo6V/aVdFk
         b7n+VZLetcXOhaHglXqGfJqEuQ+drLc0QsxON8j8/DfGfnmIkzd1olo5Uhfs5oZ1kY2G
         hUs1ohUJnZJS+UyFLY8Y75QWI+cRHrkWclMpm8tgt4uHSE/XlFa5nsfTAKqgTsaOAdS6
         VaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=CEBsTvsBuvlrxgYGy/ikVY24p4m6LE3jGDB63cXXMKE=;
        b=d4aTHrgXTsGVWH55wJWasriW/KyN4AvyQoWAvERi+WnZrFv7KWdc1H8rzI6KyDBN89
         WVhQlKqvMMlg0SRKq+/5kkAiWAQspYW3rJUH11PflRqf3v6/230/n45GDRyKeTyqIdc2
         yL8buvPaflv99N1MlFDkzhp4fMx55n03CoMEbuRpJc5vBuWdYUxuYNKcNL16W1KGek0F
         ph1s1VX1uHhh+S+1Gd/nRaccxF0RjfdoVQBcpjSPXlBeUjigullRiUCaQYMsXAeJ3/Mn
         bWfwsP6NbEu/88veBkpR7OLxIB8VbVKy2+/BPKP9sw5ZkE9+UKV1l5egcgAQ5cU9mFq0
         8Pjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w33si699644eda.399.2019.07.18.06.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2019 06:13:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ho6Dt-0006Xf-JJ
	for alex.bennee@linaro.org; Thu, 18 Jul 2019 09:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57526)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1ho6Dq-0006XZ-EF
 for qemu-arm@nongnu.org; Thu, 18 Jul 2019 09:13:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ho6Dp-0006lV-AK
 for qemu-arm@nongnu.org; Thu, 18 Jul 2019 09:13:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59188)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1ho6Dp-0006jW-3j; Thu, 18 Jul 2019 09:13:21 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9CC783DDBE;
 Thu, 18 Jul 2019 13:13:19 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2114D1001B0C;
 Thu, 18 Jul 2019 13:13:16 +0000 (UTC)
Date: Thu, 18 Jul 2019 15:13:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190718151315.2c1d3aff@redhat.com>
In-Reply-To: <20190716153816.17676-11-shameerali.kolothum.thodi@huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
 <20190716153816.17676-11-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 18 Jul 2019 13:13:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v7 10/10] tests: Update DSDT ACPI
 table for arm/virt board with PCDIMM related changes
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
 ard.biesheuvel@linaro.org, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5B9A5+ZpkrG8

On Tue, 16 Jul 2019 16:38:16 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> From: Eric Auger <eric.auger@redhat.com>
> 
> PCDIMM hotplug addition updated the DSDT. Update the reference table.

it's not correct process. series should be merged through Michael's pci branch
and see
commit ab50f22309a17c772c51931940596e707c200739 (mst/pci)
Author: Michael S. Tsirkin <mst@redhat.com>
Date:   Tue May 21 17:38:47 2019 -0400

    bios-tables-test: add diff allowed list

how to request table update.


Another thing:
bios-tables-test has test_acpi_tcg_dimm_pxm() test case,
pls make use of it to test arm/virt variant

> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
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

