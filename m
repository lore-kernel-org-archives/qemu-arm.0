Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3130022lft;
        Thu, 23 Jun 2022 10:23:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t6SFFC+0SoHwGdeY+R2aPEzS7Cvf+tpUjNmhXEdSm7TpnKv2qUFMxMPH2v00kLoElYWhE3
X-Received: by 2002:a05:6214:21ec:b0:470:3f54:e846 with SMTP id p12-20020a05621421ec00b004703f54e846mr19814592qvj.58.1656005003238;
        Thu, 23 Jun 2022 10:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656005003; cv=none;
        d=google.com; s=arc-20160816;
        b=iWYAiFES/S/AJI64oV2+elwYVmlaCzq0Z5bwuO9Xkqz0UtLOYaggbzYfiF1D5YqkJo
         EBA8HUjlpSXd13xp5Ca7ogNRt2AaL8MyIphfEdsP7EwMvXuf7cizOQ2HlHcczu/6mWJl
         /rOmqU6PFhsERe0Xyw+enTcBi7gkn5xG0nr5S4kmW0M/uUz4mPTF63KsbTwyJHgpv9Mb
         rMOIPzx8p08EiK5TUEm79cN6Ze4CSPsxn2TAnGrNggYS6MPEhHfvSuwTFjX7YxJFURgK
         AMI70pJqQumryz5Bm9vwEQunzkSa5VyL28D2jAvNmsmzSh98f6wNJUlV0V3Nh6DUAtBT
         PqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=+rv5DDrvEookpfZn62Ue1//NinmEBYDih/Hw64/LzZw=;
        b=kWFR0sMN/ocLRUSe88FK1C1J93lEB+0qU3HK9u9VHQGOOcKGg2F9wTi/yoop/gKJKC
         mun/qMl7IQ+WJSEbEc/XYBtzJimVGWM7wjLoLzbTB+PF2wwP82X0RMY/zbCd4kc+YwrE
         WqjJO1T9jnn4mqnmTBPlolzXVl30qMFOVJLcDSG4sfg3rR+CVTFYj75xGow0GqSNhjZZ
         JQXRTjGIJzAiYFS0Vd6N/FS1G955sxPEhzsUlV0XXlj4glXInA7I+MHPEYyfiPzD62bG
         TqQEGQ6d4BOtek3L+/jhhMFdmwypII+4MMj1k2DfPoijVZK0GzQCcHYsLUXwQE48Q3Vn
         PivA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020a05622a019000b00317bc97eb98si1094096qtw.610.2022.06.23.10.23.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 10:23:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4QY6-0003FO-PS
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 13:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4QR8-0001zh-Tz
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 13:16:12 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:41743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4QR6-00014m-Rs
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 13:16:10 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.7])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E4BE311066275;
 Thu, 23 Jun 2022 19:16:05 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 23 Jun
 2022 19:16:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005e32bdd43-472e-4da6-ab11-467ef8e23ce5,
 1905447EDF4A6B95D61F03ED56167C5A36471571) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f4d49ce6-f4b6-66fa-e980-43c185652981@kaod.org>
Date: Thu, 23 Jun 2022 19:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/9] hw/arm/aspeed: qcom-dc-scm-v1: add block backed FRU
 device
Content-Language: en-US
To: Patrick Venture <venture@google.com>, Jae Hyun Yoo
 <quic_jaehyoo@quicinc.com>, Hao Wu <wuhaotsh@google.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara
 Kurapati <quic_mkurapat@quicinc.com>, qemu-arm <qemu-arm@nongnu.org>, QEMU
 Developers <qemu-devel@nongnu.org>, Peter Delevoryas <pdel@fb.com>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
 <20220622172830.101210-4-quic_jaehyoo@quicinc.com>
 <CAO=notzsLW=F6QDu5mAhBCXNMocV1_qF3EazHYLoP_mu8e8QFg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAO=notzsLW=F6QDu5mAhBCXNMocV1_qF3EazHYLoP_mu8e8QFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a71c9af0-ef28-4d5a-bc5d-172e63fc1b01
X-Ovh-Tracer-Id: 11517111623956073464
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefjedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphguvghlsehfsgdrtghomhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eso8kJH9vGzz

On 6/23/22 17:28, Patrick Venture wrote:
> 
> 
> On Wed, Jun 22, 2022 at 10:48 AM Jae Hyun Yoo <quic_jaehyoo@quicinc.com <mailto:quic_jaehyoo@quicinc.com>> wrote:
> 
>     From: Graeme Gregory <quic_ggregory@quicinc.com <mailto:quic_ggregory@quicinc.com>>
> 
>     The FRU device uses the index 0 device on bus IF_NONE.
> 
>     -drive file=$FRU,format=raw,if=none
> 
>     file must match FRU size of 128k
> 
>     Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com <mailto:quic_ggregory@quicinc.com>>
>     ---
>       hw/arm/aspeed.c | 22 +++++++++++++++++-----
>       1 file changed, 17 insertions(+), 5 deletions(-)
> 
>     diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>     index 785cc543d046..36d6b2c33e48 100644
>     --- a/hw/arm/aspeed.c
>     +++ b/hw/arm/aspeed.c
>     @@ -992,17 +992,29 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
>            */
>       }
> 
>     +static void qcom_dc_scm_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
>     +{
>     +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
>     +    DeviceState *dev = DEVICE(i2c_dev);
>     +    /* Use First Index for DC-SCM FRU */
>     +    DriveInfo *dinfo = drive_get(IF_NONE, 0, 0);
>     +
>     +    qdev_prop_set_uint32(dev, "rom-size", rsize);
>     +
>     +    if (dinfo) {
>     +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>     +    }
>     +
>     +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
>     +}
> 
> 
> We've sent a similar patch up for the at24c but in its own file -- but looking at this, we could likely expand it to suite our cases as well - is there a reason it's named qcom_dc_scm_fru_init?  Presumably that's to handle the drive_get parameters.  If you make it use `drive_get(IF_NONE, bus, unit);` You'll be able to associate a drive via parameters like you aim to.


I have seen various attempts to populate the Aspeed eeproms with
data. The simplest is the g220a_bmc_i2c_init() approach. Some are
generating C code from the .bin files and compiling the result in
QEMU. Some were generating elf sections, linking them in QEMU and
passing the pointer as an eeprom buf.

The drive approach is the best I think, but the device/drive
association depends on the drive order on the command line when
devices are created by the platform.

We could may be extend the GenericLoaderState for eeproms ?
or introduce a routine which would look for a file under a (pc-bios)
per-machine directory and fill the eeprom buf with its contents ?

Any idea ?

Thanks,

C.
