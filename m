Received: by 10.25.15.230 with SMTP id 99csp1584213lfp;
        Tue, 28 Mar 2017 04:59:20 -0700 (PDT)
X-Received: by 10.237.38.229 with SMTP id q92mr25775939qtd.6.1490702360292;
        Tue, 28 Mar 2017 04:59:20 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id f47si3257468qtc.174.2017.03.28.04.59.19;
        Tue, 28 Mar 2017 04:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 6680B40C49;
	Tue, 28 Mar 2017 07:57:20 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=ham
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tl0dtNdGjwS2; Tue, 28 Mar 2017 07:57:19 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 8FF6C40B58;
	Tue, 28 Mar 2017 07:57:19 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 5EA1640B3E
 for <kvmarm@lists.cs.columbia.edu>; Tue, 28 Mar 2017 07:57:18 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KqOjXXmlnEO9 for <kvmarm@lists.cs.columbia.edu>;
 Tue, 28 Mar 2017 07:57:17 -0400 (EDT)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 8447140A80
 for <kvmarm@lists.cs.columbia.edu>; Tue, 28 Mar 2017 07:57:17 -0400 (EDT)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A538E61E64;
 Tue, 28 Mar 2017 11:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A538E61E64
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
 dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
 spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A538E61E64
Received: from localhost.localdomain (ovpn-117-27.ams2.redhat.com
 [10.36.117.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B7B91840B;
 Tue, 28 Mar 2017 11:59:13 +0000 (UTC)
Subject: Re: [Qemu-devel] Aarch64: Qemu master or 2.9.0-rc1 breaks
 compatibility with 4.10 kernel.
To: Peter Maydell <peter.maydell@linaro.org>,
 Prakash B <bjsprakash.linux@gmail.com>
References: <CACJhumejPG6s_dewyHH=e5=QLcOUCzvzhakA7oSqm2Ms5cQvRA@mail.gmail.com>
 <CAFEAcA-kKvS_6OZE1mKbFYgCzm4wPK2XJi_A03nFxu+K3ZA4hQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <43d097e6-a74a-ed22-0b28-3f151d3e51fb@redhat.com>
Date: Tue, 28 Mar 2017 13:59:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-kKvS_6OZE1mKbFYgCzm4wPK2XJi_A03nFxu+K3ZA4hQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 28 Mar 2017 11:59:15 +0000 (UTC)
Cc: Marc Zyngier <marc.zyngier@arm.com>, bprakash@caviumnetworks.com,
 QEMU Developers <qemu-devel@nongnu.org>, "Kumar,
 Vijaya" <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
 sgoutham@cavium.com,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>
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
X-TUID: 19e7AI11gDDA

Hi Peter,

On 28/03/2017 13:29, Peter Maydell wrote:
> On 28 March 2017 at 12:22, Prakash B <bjsprakash.linux@gmail.com> wrote:
>> Qemu master or v2.9.0-rc1 doesn't launch guest  when host kernel
>> version 4.10 or  lower on Aarch64 (cavium ThunderX), its failing with
>> abort  "qemu-system-aarch64: KVM_GET_DEVICE_ATTR failed: No such
>> device or address"
>>
>> "GICv3 live migration support"  patch breaks the  compatibility b/w
>> kernel and qemu.
>>
>> Is this expected behaviour,  can we provide a fix without  breaking
>> compatibility b/w kernel and qemu .
> 
> This is indeed not supposed to happen. Eric, can you take a look?

Yes I start the investigations.

Thanks

Eric
> 
> thanks
> -- PMM
> 
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
