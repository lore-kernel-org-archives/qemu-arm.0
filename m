Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1293464lfm;
        Thu, 16 Jul 2020 02:05:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLlXBBtM8KfTRpzhpIaE6WpxZUegZ1bAamlCZDVcnAvt5IctQhhyEz8f2J71s0XP/qE8PW
X-Received: by 2002:a25:3255:: with SMTP id y82mr4838155yby.120.1594890350842;
        Thu, 16 Jul 2020 02:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594890350; cv=none;
        d=google.com; s=arc-20160816;
        b=X45v+u2kwoS22yLYkDhtAE3nyhHq36t7396pQZYqNXK3JwXj9eNPNta88ZSk0jcgLU
         ORBDg7MwZynks6JpaBx5Ll7uhHigv0Z0Z4LM6i9t/SfQTHISnqQXPnMtLKYW+2dll2dS
         7oisP7XEQ17eWcoKfX5rWjYY7Y+2SjT59jUDM02a4FXZ5e/B46rko3WfDWpC4mfyqkaQ
         SONmClGWgUhgD8mIuNseqDC46ceQ5muvrKOhh37VWXk095Dabgx8yUxcMWTtEceRt1aF
         EK6fO/m0dHNwvogEuajE1Jm/p/19xtuS2MSV+zOOZoe6VPznW+Xznn4tOxO5lMMPUYaQ
         9OJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=7QDcFw5uc3fLsdlXwXytuSlpKYjHY8qBnne+fGAllaY=;
        b=pnIDltYxMrGShjm1pZ4UR0Y8QcPdSeOVt/P/zguhwU8ZOaJr/iecJFH8NkKSRDZCJJ
         XmlV0fE9w2zJ3uEMLTnNAJ7gZcZUbO4cVQKt/xZY1VX0OgyEloU93n0zIQEtqMk9G/29
         e4N5Nz+8P9zM4tCBH/UtP7UWTkhUkS+5+qQUCTabpNBG4V0sHrSRij9OVIMUSUaz+wlz
         l+KqqUjxRsAn9Oo9n3SNwMoZwjpLturXWOqA4hrIg3m2tpTqVcA/NYDD6SKDMX0PdIHJ
         So/lZnJnrQj0gEZ7ThYwoO5p/OrRvyao9tVS9oTJkJuql2tqXmcYUWGAlqdksGNgpia9
         fV8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si5082801ybk.41.2020.07.16.02.05.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jul 2020 02:05:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvzpu-0002BC-64
	for alex.bennee@linaro.org; Thu, 16 Jul 2020 05:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jvzpg-00020k-Ox
 for qemu-arm@nongnu.org; Thu, 16 Jul 2020 05:05:36 -0400
Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]:54313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jvzpe-0003jS-9o
 for qemu-arm@nongnu.org; Thu, 16 Jul 2020 05:05:36 -0400
Received: from player696.ha.ovh.net (unknown [10.110.171.136])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id CE1A91E20DF
 for <qemu-arm@nongnu.org>; Thu, 16 Jul 2020 11:05:24 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-1163-216.w90-76.abo.wanadoo.fr
 [90.76.222.216]) (Authenticated sender: clg@kaod.org)
 by player696.ha.ovh.net (Postfix) with ESMTPSA id C434A146F937B;
 Thu, 16 Jul 2020 09:05:07 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0057fe97b6c-7dff-48ac-8a1d-18a5fa079438,2A9D1999911B15737EB689736E4AAE1772229697)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH] acpi: Fix access to PM1 control and status registers
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20200701110549.148522-1-anthony.perard@citrix.com>
 <20200701075914-mutt-send-email-mst@kernel.org>
 <20200701124836.GD2030@perard.uk.xensource.com>
 <20200702063310-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0a9c7f42-c6e3-4103-febc-3811319341d9@kaod.org>
Date: Thu, 16 Jul 2020 11:05:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200702063310-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1753026158128892848
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrfeeggdduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfffgeelfeejudevuedvvdeigeduteetveffhfffudeggfegleeljeeuieefuedvnecukfhppedtrddtrddtrddtpdeltddrjeeirddvvddvrddvudeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeliedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.63.121; envelope-from=clg@kaod.org;
 helo=1.mo2.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 05:05:25
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, pbonzini@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, "open list:PReP" <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NwvCrd+t7F5F

On 7/2/20 1:12 PM, Michael S. Tsirkin wrote:
> On Wed, Jul 01, 2020 at 01:48:36PM +0100, Anthony PERARD wrote:
>> On Wed, Jul 01, 2020 at 08:01:55AM -0400, Michael S. Tsirkin wrote:
>>> On Wed, Jul 01, 2020 at 12:05:49PM +0100, Anthony PERARD wrote:
>>>> The ACPI spec state that "Accesses to PM1 control registers are
>>>> accessed through byte and word accesses." (In section 4.7.3.2.1 PM1
>>>> Control Registers of my old spec copy rev 4.0a).
>>>>
>>>> With commit 5d971f9e6725 ("memory: Revert "memory: accept mismatching
>>>> sizes in memory_region_access_valid""), it wasn't possible anymore to
>>>> access the pm1_cnt register by reading a single byte, and that is use
>>>> by at least a Xen firmware called "hvmloader".
>>>>
>>>> Also, take care of the PM1 Status Registers which also have "Accesses
>>>> to the PM1 status registers are done through byte or word accesses"
>>>> (In section 4.7.3.1.1 PM1 Status Registers).
>>>>
>>>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>>>
>>>
>>> Can't we set impl.min_access_size to convert byte accesses
>>> to word accesses?
>>
>> I actually tried, but when reading `addr` or `addr+1` I had the same
>> value. So I guess `addr` wasn't taken into account.
>>
>> I've checked again, with `.impl.min_access_size = 2`, the width that the
>> function acpi_pm_cnt_read() get is 2, but addr isn't changed so the
>> function is still supposed to shift the result (or the value to write)
>> based on addr, I guess.
> 
> True address is misaligned.  I think memory core should just align it -
> this is what devices seem to expect.
> However result is shifted properly so just align addr and be done with
> it.
> 
> 
> In fact I have a couple more questions. Paolo - maybe you can answer some of these?
> 
> 
> 
>     if (!access_size_min) {
>         access_size_min = 1;
>     }
>     if (!access_size_max) {
>         access_size_max = 4;
>     }
> 
>>>>>
> 
> So 8 byte accesses are split up unless one requests 8 bytes.
> Undocumented right?  Why are we doing this?
> 
>>>>>
> 
> 
>     /* FIXME: support unaligned access? */
> 
>>>>>
> 
> Shouldn't we document impl.unaligned is ignored right now?
> Shouldn't we do something to make sure callbacks do not get
> unaligned accesses they don't expect?
> 
> 
> In fact, there are just 2 devices which set valid.unaligned but
> not impl.unaligned:
>     aspeed_smc_ops
>     raven_io_ops
> 
> 
> Is this intentional? 

I think it is a leftover from the initial implementation. The model works fine 
without valid.unaligned being set and with your patch.

C. 
 

> Do these in fact expect memory core to
> provide aligned addresses to the callbacks?
> Given impl.unaligned is not implemented, can we drop it completely?
> Cc a bunch of people who might know.
> 
> Can relevant maintainers please comment? Thanks a lot!
> 
>>>>>
> 
> 
>     access_size = MAX(MIN(size, access_size_max), access_size_min);
>     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
> 
>>>>>
> 
> 
> So with a 1 byte access at address 1, with impl.min_access_size = 2, we get:
>     access_size = 2
>     access_mask = 0xffff
>     addr = 1
> 
> 
> 
> <<<<
> 
> 
>     if (memory_region_big_endian(mr)) {
>         for (i = 0; i < size; i += access_size) {
>             r |= access_fn(mr, addr + i, value, access_size,
>                         (size - access_size - i) * 8, access_mask, attrs);
> 
>>>>
> 
> now shift is -8.
> 
> <<<<
> 
> 
>         }
>     } else {
>         for (i = 0; i < size; i += access_size) {
>             r |= access_fn(mr, addr + i, value, access_size, i * 8,
>                         access_mask, attrs);
>         }
>     }
> 
> 
> <<<<
> 
> callback is invoked with addr 1 and size 2:
> 
>>>>>
> 
> 
>     uint64_t tmp;
> 
>     tmp = mr->ops->read(mr->opaque, addr, size);
>     if (mr->subpage) {
>         trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
>     } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
>         hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
>         trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
>     }
>     memory_region_shift_read_access(value, shift, mask, tmp);
>     return MEMTX_OK;
> 
> <<<<
> 
> let's assume callback returned 0xabcd
> 
> this is where we are shifting the return value:
> 
>>>>>
> 
> 
> static inline void memory_region_shift_read_access(uint64_t *value,
>                                                    signed shift,
>                                                    uint64_t mask,
>                                                    uint64_t tmp)
> {
>     if (shift >= 0) {
>         *value |= (tmp & mask) << shift;
>     } else {
>         *value |= (tmp & mask) >> -shift;
>     }
> }
> 
> 
> So we do 0xabcd & 0xffff >> 8, and we get 0xab.
> 
>>>>
> 
> How about aligning address for now? Paolo?
> 
> -->
> 
> memory: align to min access size
> 
> If impl.min_access_size > valid.min_access_size access callbacks
> can get a misaligned access as size is increased.
> They don't expect that, let's fix it in the memory core.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ---
> 
> 
> diff --git a/memory.c b/memory.c
> index 9200b20130..ea489ce405 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>      }
>  
>      /* FIXME: support unaligned access? */
> +    addr &= ~(access_size_min - 1);
>      access_size = MAX(MIN(size, access_size_max), access_size_min);
>      access_mask = MAKE_64BIT_MASK(0, access_size * 8);
>      if (memory_region_big_endian(mr)) {
>> -- 
>> Anthony PERARD
> 

