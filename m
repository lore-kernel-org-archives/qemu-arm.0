Received: by 10.28.71.155 with SMTP id m27csp775910wmi;
        Fri, 13 Apr 2018 06:45:40 -0700 (PDT)
X-Google-Smtp-Source: AIpwx481VcK0jiYkLOXuDxLjLyWfV7zJa3nXMkw7loEQAA5w+cIfuHBtnPPCRR6Fo4XhFgYEoer/
X-Received: by 10.55.239.5 with SMTP id j5mr4565608qkk.105.1523627140037;
        Fri, 13 Apr 2018 06:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523627140; cv=none;
        d=google.com; s=arc-20160816;
        b=AeWCLOZAjg0rhXF6ntbY4S41dSEDksNNV26cuGjLPr0eJr4yUYyg1zYyIs0BBso7Hf
         LNbk1hW10Wr9Tpoztzek+BGrFniT/mdqBOmXVlepoDkvfQx3fr1mlu/Dg6ZABMgkQTUC
         KOdcyDESfjP0CohyEnjhvSjs/TsUXb/2nMgmT91/F7WlaV7VNJG2DtSw6wKwltHfPk2A
         pUnYZTicBFTlAzEbPFSCjswX0KKI8gfvPhRM8wQ9ip+Hif/TCBZD6yk1a36zzZ5S8Vss
         aeVKiUzJo0jOfSiS9yaEs0fsOdnx8nSyQXxq0U7oTBEbGmyBCiXZ+Z2a+bQb73xtjkiD
         TenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=HOJ7xcXdkq7m7W/RFfExuGldD4EZgG/2A0fhoRV2nB8=;
        b=tuw5JuqdA3kM3bOMjr5SnAhnpmTxDTbFejDgesXkcEM5dH8KVODWN8ApKLzrvWxHng
         jaE6l7qiZszBEat1WTjA7fSaW9iHpMfRu6N/3bWonE1+L8UOnYsx/N5Xvt5nmQvvBmdc
         +sBi0u/hCOBB0ggOBxwxFROVliRy/nAzLHZF0KKLs8Hi58O2AWRbmoeqJlHQdwT9ICav
         G0ldaDxVUz43y+6/aEO5UHTpy3YPiGEbdm++drvtcMiv1Tg4NRgeQ5KpfguRt4TXaEsM
         5cCm795o9ZaMQFx+5RcU6CG0ualOJm5NUEmi68ncAcaZN073vVT/z3IElnr0Qnpt2AI4
         77RA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l189si7368286qkb.39.2018.04.13.06.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:45:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6z1H-0007JL-Eq
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:45:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6z17-0007Hu-40
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:45:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6z12-0006Fh-0L
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:45:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49872 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f6z11-0006Fb-SZ; Fri, 13 Apr 2018 09:45:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AE104182D59;
	Fri, 13 Apr 2018 13:45:23 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-192.ams2.redhat.com
	[10.36.116.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9E4910F1BF8;
	Fri, 13 Apr 2018 13:45:19 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-7-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_p+ibaMyePwKW_dMQ_M7BHADnzvN_5_mjOLmUtEp=m2Q@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <75f90e1b-5460-bdba-9bd9-b32a87f40e06@redhat.com>
Date: Fri, 13 Apr 2018 15:45:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_p+ibaMyePwKW_dMQ_M7BHADnzvN_5_mjOLmUtEp=m2Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 13 Apr 2018 13:45:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 13 Apr 2018 13:45:23 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 6/8] hw/arm/virt: Allow GICv3 DT
 node with multiple redistributor regions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Christoffer Dall <cdall@kernel.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /ZouvKWLjtVt

Hi Peter,

On 13/04/18 15:36, Peter Maydell wrote:
> On 27 March 2018 at 15:15, Eric Auger <eric.auger@redhat.com> wrote:
>> This patch adds the GICState handle in the virtual machine state and
>> allows to create a GIC device tree node advertising multiple redistributor
>> regions.
>>
>> There is one range per distributor region following the GIC distributor.
>> Please refer to kernel documentation for further details:
>> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
>> +
>> +        num_reg_values =  4 * (s->nb_redist_regions + 1);
>> +        regs = g_new0(uint64_t, num_reg_values);
>> +        qemu_fdt_setprop_cell(vms->fdt, "/intc", "#redistributor-regions",
>> +                              s->nb_redist_regions);
>> +        regs[0] = 2;
>> +        regs[1] = vms->memmap[VIRT_GIC_DIST].base;
>> +        regs[2] = 2;
>> +        regs[3] = vms->memmap[VIRT_GIC_DIST].size;
>> +
>> +        for (r = 1; r <= s->nb_redist_regions; r++) {
>> +            regs[4 * r] = 2;
>> +            regs[4 * r  + 1] = s->redist_region[r - 1].base;
>> +            regs[4 * r  + 2] = 2;
>> +            /* count redistributors of 2 x 64kB pages */
>> +            regs[4 * r  + 3] = (uint64_t)s->redist_region[r - 1].count << 17;
> 
> Board code shouldn't be reaching into the GIC device state struct like this.

I will add a dedicated API.

Thanks

Eric
> 
>> +        }
>> +        qemu_fdt_setprop_sized_cells_from_array(vms->fdt, "/intc", "reg",
>> +                                                num_reg_values / 2, regs);
>> +        g_free(regs);
>> +
>>          if (vms->virt) {
>>              qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
> 
> thanks
> -- PMM
> 
