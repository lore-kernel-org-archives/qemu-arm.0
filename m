Received: by 10.223.172.38 with SMTP id v35csp1719733wrc;
        Fri, 8 Sep 2017 07:56:18 -0700 (PDT)
X-Received: by 10.200.3.159 with SMTP id t31mr4429158qtg.338.1504882578168;
        Fri, 08 Sep 2017 07:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504882578; cv=none;
        d=google.com; s=arc-20160816;
        b=diJ9h5RsMWE8TUkTRUKz8Cqeve0y6RGXOvoH2ZUCFPAAS35Y+rbVWeYX4Tnt3NyQGi
         MfpytSTEPh8fV1BuErZowKIXM41wiwTlwEYnYxSpjlvV9TmKBe3eGnlcmph1betmjQpe
         fJA32jXLfkmODg9d89i7VLVGrOXqQFwL9bIpKa8eW/4SEmrd+lS84C39KKylMouRrG8c
         JPrYQ9AIHSdBJk2N0hjiSN5wsnSAUumJvPHaSDFMOTiY5oN4F+++32uLIUO6XWBlisqj
         ZJJE0vF5xHb3+5RWdeALKniqo2Ds7/B9GAaBYMLTZNTQJOIZ+jrIM44NkvN3jn/ydlcZ
         Bxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:references:in-reply-to:mime-version
         :dkim-signature:arc-authentication-results;
        bh=gHKMZoyOS0MIkFrMcgSw5qta3XYwuwux1QNIzBCcXEE=;
        b=rvZncDuyryH4DwlYH4hsQ4THLmrbEAFXqYlfNheXlBCEsLFfK1lc5VoPEuM9PUCvDR
         pegzP8BDmZW63KOUFamxHBElzxjvta73xwig+cFbvPN3iJseA9LGgNrPfppnSuIykKgL
         itlCux8l852SsJfsmI2Fyy2+yirGYVa4IxwyBvTxpThhOnr3Oe1r8BLL6sU2UDfps/Ih
         /MXZqZ8Gco5hZeZzGgyRiCl4n5BDx7HEvDXZ5J6eWc1BI8fB0hsRBDbyL799KDo4CahL
         7+Os3OsXZshQSc7+VSTnJMX0kaotTBLcLbJz5maH8yI/YyyaWDm2jjdB8BHjTvKcEzfd
         KG8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=iEOgBzop;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id h47si2363632qte.336.2017.09.08.07.56.17;
        Fri, 08 Sep 2017 07:56:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=iEOgBzop;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id BFF7049C6C;
	Fri,  8 Sep 2017 10:53:47 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-Q8Ka088aMC; Fri,  8 Sep 2017 10:53:46 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id E183D49C76;
	Fri,  8 Sep 2017 10:53:46 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id E231749C6C
 for <kvmarm@lists.cs.columbia.edu>; Fri,  8 Sep 2017 10:53:45 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tEk8hM0w8Vgn for <kvmarm@lists.cs.columbia.edu>;
 Fri,  8 Sep 2017 10:53:45 -0400 (EDT)
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
 [209.85.128.174])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id F1C4249C6A
 for <kvmarm@lists.cs.columbia.edu>; Fri,  8 Sep 2017 10:53:44 -0400 (EDT)
Received: by mail-wr0-f174.google.com with SMTP id 108so5135196wra.5
 for <kvmarm@lists.cs.columbia.edu>; Fri, 08 Sep 2017 07:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7bv4QP25uck3nt42qOY21QJ5taIUVLn0ZjvShrspMVU=;
 b=iEOgBzopIYqPOnkyuiFBSRMOHBvE0BLCKW7t3/OBkVSWsyABUQmXwolrN2YTMCxdWX
 JMnIg9dAtziEZ7utnAt6WUJIr9zL1iNituw+YAG4Z/35bJvq7YSQM1G2+p4hohv9qJRG
 uGYOLGdCX0OzmB+XZiu1ldw83T3LoIsPr0l20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7bv4QP25uck3nt42qOY21QJ5taIUVLn0ZjvShrspMVU=;
 b=Nk721KV9Ql70VXDYwpZS038YZsZ7owLlFvkxTH3yXTjHP+sZ9y/JnarDCiqTFXlzb5
 y1DVlmcenz9ZBYhe6yAFVELuppxe5fISblOKLTuGuIa4OpVqiKlBdG5nd8xF6O+NOkpP
 jeu3JYmR8lFaiPA1Nx6V0vKz/critaGN/FZE5L/xLh881ZlWybwhjQ9ebwqNwkgZUPHT
 Q8nQ69mSnSFWwMExD4U+VhPPBmF7ci++lj3cSNVFb9RREHj0tiIbgSvlGNnbsbQSz2HJ
 5ufRlCQRIa+E5trYbeJynIPkdUyqxWif6XehYj88yOjUaN4Q5570f2lcyz+p1Bz5oE2P
 rEcw==
X-Gm-Message-State: AHPjjUjrSGq9djB+sJAcab8Rz5XNVyxY4oOujfJxKsByMdcQSIraeawH
 MrtJgIIPgq8vAifPACCkttcBFd7UZX5X
X-Google-Smtp-Source: ADKCNb5g+n+oLA5Rcdyn7xHj3avA0ytQ7mc2VVnmHdK012ZwYxPX6eHmHRMt1VJ6S3B49/mhEjzyT4T0HEiM/YT8VnY=
X-Received: by 10.223.198.202 with SMTP id c10mr2375382wrh.230.1504882573913; 
 Fri, 08 Sep 2017 07:56:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Fri, 8 Sep 2017 07:55:53 -0700 (PDT)
In-Reply-To: <0184EA26B2509940AA629AE1405DD7F2015F5973@DGGEMA503-MBX.china.huawei.com>
References: <0184EA26B2509940AA629AE1405DD7F2015F5973@DGGEMA503-MBX.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2017 15:55:53 +0100
Message-ID: <CAFEAcA-tCv9HAG4JzgHbW9VC77tYYFD=rp=b1BoKN7UayWc0yA@mail.gmail.com>
Subject: Re: [PATCH v11 4/6] target-arm: kvm64: detect guest RAS EXTENSION
 feature
To: gengdongjiu <gengdongjiu@huawei.com>
Cc: kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 "zjzhang@codeaurora.org" <zjzhang@codeaurora.org>,
 Ingo Molnar <mingo@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 Huangshaoyu <huangshaoyu@huawei.com>, huangdaode <huangdaode@hisilicon.com>,
 "bp@suse.de" <bp@suse.de>, Wuquanming <wuquanming@huawei.com>,
 Marc Zyngier <marc.zyngier@arm.com>,
 "edk2-devel@lists.01.org" <edk2-devel@lists.01.org>,
 John Garry <john.garry@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 "Zhengqiang \(turing\)" <zhengqiang10@huawei.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 "devel@acpica.org" <devel@acpica.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Wangzhou \(B\)" <wangzhou1@hisilicon.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Shiju Jose <shiju.jose@huawei.com>
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: oj0NRz2v8/SB

On 8 September 2017 at 15:26, gengdongjiu <gengdongjiu@huawei.com> wrote:


>> Shouldn't we need to also tell the kernel that we actually want
>> it to expose RAS to the guest? Compare the PMU code in this function,
>> where we set a kvm_init_features bit to do this.

> In the PMU code, it indeed sets a kvm_init_features bit. Here ARM
> James has a concern that we are depend on the host CPU RAS extension,
> He means that if userspace receives the SIGBUS delivered by host
> memory_failure(), user space should record the CPER for guest
> and handling the error regardless whether host CPU supports RAS
> extension. But I think if user space receives the SIGBUS signal,
> that means
> host CPU RAS module detects the error or CPU consumes the poison
> data, thus we should check whether physical CPU support RAS extension.

I don't understand what you have in mind here. If the host does
not support the CPU RAS extension then we should never get a
SIGBUS in the first place.

In any case this doesn't seem relevant to the question of whether it
should be optional to expose the RAS extension to the *guest*.
Even if the host does support RAS, you should be able to run a
VM that knows nothing about RAS.

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
