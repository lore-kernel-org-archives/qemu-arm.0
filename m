Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp7413550ejb;
        Tue, 3 Jan 2023 07:48:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsyIlt+X0IDLkVZzK/yrua4RS8gaepD1jAhQcNlO4GQkslI0BbF31OP9SfQFVXIjGOVLIzr
X-Received: by 2002:ac8:4e16:0:b0:3a9:8c90:dcec with SMTP id c22-20020ac84e16000000b003a98c90dcecmr52558777qtw.68.1672760931591;
        Tue, 03 Jan 2023 07:48:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672760931; cv=none;
        d=google.com; s=arc-20160816;
        b=rKOPGCYrx46Ws+o7UyXkvb+UBU8qvxjUk1+OT1SBYg6Vz+wgQwrws640EYZQidh/cj
         SDFEdGyEGfRVOxKx9Sty9FYcEdAERPfH/DV2TGcrVI+4EeLMC2+aPWCi21xGf+aTcamt
         T2WxVhvvfntKZy1rfCc5s87Xnfx0AKoMV4oib8AP6ArOabfoJ916yZgjoUZPd6DgW2DF
         ka86wU7Frli/kUJP04k2aT2Zke6FlUGQNr+F5JpmzIsWXwlh9pLhEsZ8Q9f3OW7SZ3rO
         E5rsF1rQ7iDg0ejtN346dA/l2d5aAkiyV8Q+GAL3jbWlQKKFgExo/lUMlmfC8edDRhcP
         srqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Fu+qopn+c3Ce/Nou9JtRl3rd2ORCRKQsy69dK08138A=;
        b=D1L/PhriSs2ywksAs27GCCQhvldrDXa3u7Ixcc5tJHcEmrXWdiDkqgeI0sps8RAKze
         u+TzVDUqe3B87b9HxFtl6mdpKF0RzKVWKT+vpKELtjQ5f62ZMvy5cADXRoZQ0EkMmZub
         epzBb6FpcRhF9C+vQoAURebflnxdUwXVQaAzfqGoqQmhqYkSoaCXaXpfRk28d4JDhCl6
         WkVuXUorgPk3jWP/8xSwcY5/IIeAsl5JnAehCxhUGVKe43kLsWkoUnS/gDI6pEPUWC0L
         v9IZtttXa7xbMr9ODFdriV4lSPdvs+Dr/MHX+A1i1HccFqHNP7cHJcqRdPnGy6REvclR
         1tfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16-20020ac84a10000000b003a81551fa60si15740199qtq.181.2023.01.03.07.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Jan 2023 07:48:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pCjWk-00066o-TL; Tue, 03 Jan 2023 10:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCjWj-00066U-9Z
 for qemu-arm@nongnu.org; Tue, 03 Jan 2023 10:48:33 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCjWg-0004hL-Cq
 for qemu-arm@nongnu.org; Tue, 03 Jan 2023 10:48:32 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 1E5BB209EB;
 Tue,  3 Jan 2023 15:48:16 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 3 Jan
 2023 16:48:15 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S00283f3649f-d7bc-413f-b504-a33e57367adb,
 C8392438280775708828C369967C337A3112A2AF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <96ac1ff1-7876-655a-d92e-9ec8870137a1@kaod.org>
Date: Tue, 3 Jan 2023 16:48:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 02/11] hw/watchdog/wdt_aspeed: Extend MMIO range to
 cover more registers
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: "Dong, Eddie" <eddie.dong@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Joel Stanley
 <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>, Beraldo Leal
 <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Peter
 Delevoryas <pdel@fb.com>, Peter Delevoryas <pdel@meta.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>
References: <20221230113504.37032-1-philmd@linaro.org>
 <20221230113504.37032-3-philmd@linaro.org>
 <BL0PR11MB30427F00C5A2058197E9B6488AF19@BL0PR11MB3042.namprd11.prod.outlook.com>
 <19cb9a03-c98e-cdff-1474-2db0c55ae971@kaod.org>
 <Y7RKWym8vuDKvUIr@pdel-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <Y7RKWym8vuDKvUIr@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a9f281e6-7c98-4a47-9b42-8d8779faf5dd
X-Ovh-Tracer-Id: 5638506737528113991
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggdektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrsehpjhgurdguvghvpdhpuggvlhesmhgvthgrrdgtohhmpdhpuggvlhesfhgsrdgtohhmpdhjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdpshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdptghhihhnqdhtihhnghgpkhhuohesrghsphgvvgguthgvtghhrdgtohhmpdgrnhgurhgvfiesrghjrdhiugdrrghupdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdgslhgvrghlse
 hrvgguhhgrthdrtghomhdpthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomhdpjhhovghlsehjmhhsrdhiugdrrghupdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdgvugguihgvrdguohhnghesihhnthgvlhdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgtrhhoshgrsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.103,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /NTTR1RETMTT

On 1/3/23 16:31, Peter Delevoryas wrote:
> On Mon, Jan 02, 2023 at 02:31:31PM +0100, Cédric Le Goater wrote:
>> On 12/31/22 23:52, Dong, Eddie wrote:
>>>> When booting the Zephyr demo in [1] we get:
>>>>
>>>>     aspeed.io: unimplemented device write (size 4, offset 0x185128, value
>>>> 0x030f1ff1) <--
>>>>     aspeed.io: unimplemented device write (size 4, offset 0x18512c, value
>>>> 0x03fffff1)
>>>>
>>>> This corresponds to this Zephyr code [2]:
>>>>
>>>>     static int aspeed_wdt_init(const struct device *dev)
>>>>     {
>>>>       const struct aspeed_wdt_config *config = dev->config;
>>>>       struct aspeed_wdt_data *const data = dev->data;
>>>>       uint32_t reg_val;
>>>>
>>>>       /* disable WDT by default */
>>>>       reg_val = sys_read32(config->ctrl_base + WDT_CTRL_REG);
>>>>       reg_val &= ~WDT_CTRL_ENABLE;
>>>>       sys_write32(reg_val, config->ctrl_base + WDT_CTRL_REG);
>>>>
>>>>       sys_write32(data->rst_mask1,
>>>>                   config->ctrl_base + WDT_SW_RESET_MASK1_REG);   <------
>>>>       sys_write32(data->rst_mask2,
>>>>                   config->ctrl_base + WDT_SW_RESET_MASK2_REG);
>>>>
>>>>       return 0;
>>>>     }
>>>>
>>>> The register definitions are [3]:
>>>>
>>>>     #define WDT_RELOAD_VAL_REG          0x0004
>>>>     #define WDT_RESTART_REG             0x0008
>>>>     #define WDT_CTRL_REG                0x000C
>>>>     #define WDT_TIMEOUT_STATUS_REG      0x0010
>>>>     #define WDT_TIMEOUT_STATUS_CLR_REG  0x0014
>>>>     #define WDT_RESET_MASK1_REG         0x001C
>>>>     #define WDT_RESET_MASK2_REG         0x0020
>>>>     #define WDT_SW_RESET_MASK1_REG      0x0028   <------
>>>>     #define WDT_SW_RESET_MASK2_REG      0x002C
>>>>     #define WDT_SW_RESET_CTRL_REG       0x0024
>>>>
>>>> Currently QEMU only cover a MMIO region of size 0x20:
>>>>
>>>>     #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
>>>>
>>>> Change to map the whole 'iosize' which might be bigger, covering the other
>>>
>>> The root cause is that ASPEED_WDT_REGS_MAX is too small, right?
>>> Probably the Qemu is emulating an old version of the hardware.
>>>
>>> Given the meaning of ASPEED_WDT_REGS_MAX, it should be larger than iosize, not?
>>> Probably ASPEED_WDT_REGS_MAX should be per device type (aspeed_2400/2500),
>>
>> yes. We would need a new class attribute for it. Please use these values, they
>> should be correct.
>>
>>             #regs    iosize
>>
>> AST2400   0x18/4      0x20
>> AST2500   0x20/4      0x20
> 
> I think only one additional register was added in the AST2500, bringing it to 0x1C.

yes.

> 
>> AST2600   0x30/4      0x40
>> AST1030   0x4C/4      0x80
> 
> I know the Zephyr driver for the AST1030 directly from Aspeed is claiming that
> the iosize is 0x80, but the datasheet I have says it's only 0x40. And, that the
> #regs would still just be 0x30/4. Afaik the AST2600 and AST1030 should have the
> exact same peripheral.

Hmm, I see 5 extra registers in the AST1030 SoC compared to the AST2600 SoC. All
related to write protection.

C.

