Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1942859lfb;
        Fri, 3 Sep 2021 22:33:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFbwwYQI5ueTDTVGlTl944TPcfhJiPwJwkh3cOeKvSHbo8W7RI5a7sRi5ME8LHXPNJ/XGu
X-Received: by 2002:a25:6e05:: with SMTP id j5mr3508600ybc.86.1630733618795;
        Fri, 03 Sep 2021 22:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630733618; cv=none;
        d=google.com; s=arc-20160816;
        b=BJHmMd/JEOBecbcNJlckphem506heemqo2HCm49LQkB+n6YHY1gk9PJtKXcB068GYb
         FqMzZajC2Ui149IVToadYUzFan1Uc3e0AiTo/LFJUf4T6htLq8PU9hDc97RueQbxstxJ
         P0pB+94lxLLjTY0fvYrIxDA0Ritry2PC0GbTEMZwmdEGhJ8B/R/3FS9DybBpNdDRWptN
         3ZtE4xXscdyISDJ4/SrrhluolUN6qRvN++7F+7WLFWA0423i45ITns2aHOr0weWxbxYq
         Rt81rXU1v7kqfnOjLSk8aVUjBkPUj/gGHB67Bip6BbVbkfUOtxc3hmTyyKqkI11BFfRC
         i7fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=i+I5HBdoYKlGCb+nbr197Sx2rt2/czYYfQ2QmsUxOqw=;
        b=kZWtmcPJU03zCIvc1ioi7x4Ft5jdYw2SYhVe0WSJrmgXmFZBjfspgPP1WVjkfM0uJ5
         UKnfI6HXRdXO5pNRwxjBIi6IbWa+6CvftX4R503q5ADbIUhb+PynthSsjvQs7F1ZCqKy
         cahIdGMHEFja4e8q+agaC8/YBktYx7PZFpXfoJFRoD3pgQZ1HEvkaIIMVpa7659heIXt
         np/9e1/ycERzrjEVsm8L2/7hwZfNMpeBpj+QUOZLs/mmVjUJGDfKfwRX8s478w5PlU+i
         OyyBDM4ZBFfTIv4nRxQKtdakS5V5xFecb2VO3RGerTM1xrr3im64h0gL9W66YedN1rpn
         IRuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17si1516618ybm.414.2021.09.03.22.33.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 22:33:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMOJ8-0004fy-7j
	for alex.bennee@linaro.org; Sat, 04 Sep 2021 01:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mMOIu-0004fm-ER; Sat, 04 Sep 2021 01:33:24 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:56035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mMOIs-0006DH-Go; Sat, 04 Sep 2021 01:33:24 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3617C20315;
 Sat,  4 Sep 2021 05:33:18 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sat, 4 Sep
 2021 07:33:17 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004d44cfab8-69ed-4264-bd9c-342457a1ca47,
 12F33BBF2EAE4A57CD4144620F2B5145EB8D9997) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PULL 00/14] aspeed queue
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20210903194108.131403-1-clg@kaod.org>
 <beab1f50-d8f5-b3d3-5612-15e5f74eb961@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9ef56813-94f9-a1cb-aba5-9d2e2a081d23@kaod.org>
Date: Sat, 4 Sep 2021 07:33:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <beab1f50-d8f5-b3d3-5612-15e5f74eb961@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d5175dd3-171f-432e-ae07-a768ff8ec92f
X-Ovh-Tracer-Id: 368732219768408937
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvkedgleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Peter Delevoryas <pdel@fb.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WZ2PJBRpDhVJ

On 9/3/21 10:41 PM, Philippe Mathieu-Daudé wrote:
> Hi Peter,
> 
> On 9/3/21 9:40 PM, Cédric Le Goater wrote:
>> The following changes since commit 8880cc4362fde4ecdac0b2092318893118206fcf:
>>
>>   Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20210902' into staging (2021-09-03 08:27:38 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210903
>>
>> for you to fetch changes up to 907796622b2a6b945c87641d94e254ac898b96ae:
>>
>>   hw/arm/aspeed: Add Fuji machine type (2021-09-03 18:43:16 +0200)
>>
>> ----------------------------------------------------------------
>> Aspeed patches :
>>
>> * MAC enablement fixes (Guenter)
>> * Watchdog  and pca9552 fixes (Andrew)
>> * GPIO fixes (Joel)
>> * AST2600A3 SoC and DPS310 models (Joel)
>> * New Fuji BMC machine (Peter)
>>
>> ----------------------------------------------------------------
> 
>> Peter Delevoryas (3):
>>       hw/arm/aspeed: Initialize AST2600 UART clock selection registers
>>       hw/arm/aspeed: Allow machine to set UART default
>>       hw/arm/aspeed: Add Fuji machine type
> 
> I have a pending question with the last patch, do you mind holding
> this PR until it is resolved with Cédric and the patch author please?
> 
> Thanks,
> 
> Phil.
> 

I guess we can drop the following from the commit log : 

	git clone https://github.com/facebook/openbmc
	cd openbmc
	./sync_yocto.sh
	source openbmc-init-build-env fuji build-fuji
	bitbake fuji-image
	dd if=/dev/zero of=/tmp/fuji.mtd bs=1M count=128
	dd if=./tmp/deploy/images/fuji/flash-fuji of=/tmp/fuji.mtd \
	    bs=1k conv=notrunc
	
	git clone --branch aspeed-next https://github.com/peterdelevoryas/qemu
	cd qemu
	./configure --target-list=arm-softmmu --disable-vnc
	make -j $(nproc)
	./build/arm-softmmu/qemu-system-arm \
	    -machine fuji-bmc \
	    -drive file=/tmp/fuji.mtd,format=raw,if=mtd \
	    -serial stdio \
	    -nic user,hostfwd=::2222-:22
	sshpass -p 0penBmc ssh root@localhost -p 2222


Thanks,

C.
