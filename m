Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5249907wrh;
        Wed, 8 May 2019 13:08:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/Kh71419eOdLMelpyJOBtAXsc2vZsurCjvg5nAv+MAUSW11d6+mnfDh97rtBrkGL68p0a
X-Received: by 2002:a17:902:b210:: with SMTP id t16mr49844567plr.84.1557346121458;
        Wed, 08 May 2019 13:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557346121; cv=none;
        d=google.com; s=arc-20160816;
        b=Afz1wonA/FkuV2NMgNRFFo4GIupTAS2R2/kA1N3cQ6rf2OJbrenxfHywK9D6SSTEY0
         2XcHB7PSBzRG0w66XujN0o4n4VpI3hD+KTvBKwS84nmQztjIX3LbgIR7NtnceozHiUki
         MbkH4fZbA44eLPU64XOnEl0IUDRvKFdSDmMNTW1Umxj6FU0Wg0mvmDZr5LHmSdx231kx
         y38XwbNqGwhe6xWK+iURONOlWv4uKZSP77ElJ19AS71Vjyh3axub7xVw/2OKEk/djzgS
         8BtBv+jvdrDEc5xy8Uf+QlrhJ5IzPRJ56Xut/LyGb3AC6chAWaRbeTuS8yzvEtxtov/h
         fUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:content-language:in-reply-to:mime-version:user-agent
         :date:message-id:from:references:to:subject:dkim-signature;
        bh=21lOFNHbsXkqJFkSuxNG+ovg8mDjEeF70D4NykfCxcQ=;
        b=IZcQ+460KzppVEWepLenENjcpBRyem+OBUVWJy88SlDoD9+8wx5kdULP+S5+Jwhnjj
         jQy4vRH1T9/Fq4SmV++gS1IbyOq8BbuoYWOdslKPxzWUCVQsWpVwGBURwu1eN0h9ADC0
         es4DJG+3JhB2FSI9usul8Lwdv7Ni+3noFi0HBCAtGoyOWszPAJ1shFeN+Wusteau4P2h
         9gcwlDd/kHRTGyBhA4gqJgFCuTdUCPpYpLRGepFJXWjwEyEf8oiKGwo4XqtCfuj1Di5C
         HGBmotuJ1gjWjrJxDGbzeSCvYwc+8kRj9jnkFub+yzPUB8Xpnum4pABtYmIKLBlJ/oM0
         LpTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@lists.infradead.org header.s=bombadil.20170209 header.b=i0+kOpch;
       spf=pass (google.com: best guess record for domain of linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org designates 2607:7c80:54:e::133 as permitted sender) smtp.mailfrom="linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org>
Received: from bombadil.infradead.org (bombadil.infradead.org. [2607:7c80:54:e::133])
        by mx.google.com with ESMTPS id n1si2923193pld.61.2019.05.08.13.08.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 13:08:41 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org designates 2607:7c80:54:e::133 as permitted sender) client-ip=2607:7c80:54:e::133;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@lists.infradead.org header.s=bombadil.20170209 header.b=i0+kOpch;
       spf=pass (google.com: best guess record for domain of linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org designates 2607:7c80:54:e::133 as permitted sender) smtp.mailfrom="linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21lOFNHbsXkqJFkSuxNG+ovg8mDjEeF70D4NykfCxcQ=; b=i0+kOpchtLb2MI
	Y+gOnFKwdnsTXHl3y9fyt+K+hmarYb3M3XpB+KBx7UNKQV2buW8lpzAzRPh5nU9x8Le2a+MVwZIXx
	f/VA3repK2pyKQ0fi0B8i6rcXtvW1fdGKjJfWK/xmu//avC0viAy33wgyV4BJn+zD3OYm9NST209W
	eXeKnNjnQ7oZUBifOR+aUjh11U91dQQbMQ4luKaDbP9zb3hkLFFF9Mpt0VOIIvcM/u4jThbP1d9w9
	+pvvIlsEshZdYgTjRXFjx5jUNuUCTmxxR3Wy12pyl9VxZDO1kyMXDHFlOTyo7env330bA685+4EYr
	po04eg0rUci1dZLbrcKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOSrm-0003KK-L4; Wed, 08 May 2019 20:08:38 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOSri-0003I0-LP
 for linux-arm-kernel@lists.infradead.org; Wed, 08 May 2019 20:08:36 +0000
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 53AA789C40;
 Wed,  8 May 2019 20:08:33 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-255.rdu2.redhat.com
 [10.10.120.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D04335D9D1;
 Wed,  8 May 2019 20:08:24 +0000 (UTC)
Subject: Re: [Question] Memory hotplug clarification for Qemu ARM/virt
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "will.deacon@arm.com" <will.deacon@arm.com>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>
References: <5FC3163CFD30C246ABAA99954A238FA83F1B6A66@lhreml524-mbs.china.huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d379bc06-b4b5-833b-aaf1-eec0547c30af@redhat.com>
Date: Wed, 8 May 2019 22:08:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA83F1B6A66@lhreml524-mbs.china.huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 08 May 2019 20:08:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190508_130834_743435_08182333 
X-CRM114-Status: GOOD (  28.64  )
X-Spam-Score: -5.0 (-----)
X-Spam-Report: SpamAssassin version 3.4.2 on bombadil.infradead.org summary:
 Content analysis details:   (-5.0 points)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.132.183.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 Linuxarm <linuxarm@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+alex.bennee=linaro.org@lists.infradead.org
X-TUID: ZVhHJbCpSR1n

On 05/08/19 12:15, Shameerali Kolothum Thodi wrote:
> Hi,
> 
> This series here[0] attempts to add support for PCDIMM in QEMU for
> ARM/Virt platform and has stumbled upon an issue as it is not clear(at least
> from Qemu/EDK2 point of view) how in physical world the hotpluggable
> memory is handled by kernel.
> 
> The proposed implementation in Qemu, builds the SRAT and DSDT parts
> and uses GED device to trigger the hotplug. This works fine.
> 
> But when we added the DT node corresponding to the PCDIMM(cold plug
> scenario), we noticed that Guest kernel see this memory during early boot
> even if we are booting with ACPI. Because of this, hotpluggable memory
> may end up in zone normal and make it non-hot-un-pluggable even if Guest
> boots with ACPI.
> 
> Further discussions[1] revealed that, EDK2 UEFI has no means to interpret the
> ACPI content from Qemu(this is designed to do so) and uses DT info to
> build the GetMemoryMap(). To solve this, introduced "hotpluggable" property
> to DT memory node(patches #7 & #8 from [0]) so that UEFI can differentiate
> the nodes and exclude the hotpluggable ones from GetMemoryMap().
> 
> But then Laszlo rightly pointed out that in order to accommodate the changes
> into UEFI we need to know how exactly Linux expects/handles all the 
> hotpluggable memory scenarios. Please find the discussion here[2].
> 
> For ease, I am just copying the relevant comment from Laszlo below,
> 
> /******
> "Given patches #7 and #8, as I understand them, the firmware cannot distinguish
>  hotpluggable & present, from hotpluggable & absent. The firmware can only
>  skip both hotpluggable cases. That's fine in that the firmware will hog neither
>  type -- but is that OK for the OS as well, for both ACPI boot and DT boot?
> 
> Consider in particular the "hotpluggable & present, ACPI boot" case. Assuming
> we modify the firmware to skip "hotpluggable" altogether, the UEFI memmap
> will not include the range despite it being present at boot. Presumably, ACPI
> will refer to the range somehow, however. Will that not confuse the OS?
> 
> When Igor raised this earlier, I suggested that hotpluggable-and-present should
> be added by the firmware, but also allocated immediately, as EfiBootServicesData
> type memory. This will prevent other drivers in the firmware from allocating AcpiNVS
> or Reserved chunks from the same memory range, the UEFI memmap will contain
> the range as EfiBootServicesData, and then the OS can release that allocation in
> one go early during boot.
> 
> But this really has to be clarified from the Linux kernel's expectations. Please
> formalize all of the following cases:
> 
> OS boot (DT/ACPI)  hotpluggable & ...  GetMemoryMap() should report as  DT/ACPI should report as
> -----------------  ------------------  -------------------------------  ------------------------
> DT                 present             ?                                ?
> DT                 absent              ?                                ?
> ACPI               present             ?                                ?
> ACPI               absent              ?                                ?
> 
> Again, this table is dictated by Linux."
> 
> ******/
> 
> Could you please take a look at this and let us know what is expected here from
> a Linux kernel view point.
> 
> (Hi Laszlo/Igor/Eric, please feel free to add/change if I have missed any valid
> points above).

I'm happy with your summary, thank you!
Laszlo

> 
> Thanks,
> Shameer
> [0] https://patchwork.kernel.org/cover/10890919/
> [1] https://patchwork.kernel.org/patch/10863299/
> [2] https://patchwork.kernel.org/patch/10890937/
> 
> 


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
