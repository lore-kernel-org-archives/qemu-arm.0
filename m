Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3076912lfm;
        Mon, 13 Jul 2020 01:37:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEK8bjXWM0j43msEMGc1niCywx3neNi5uOV3JcJD/gal1Ph+EsOFYrgu3VGaONd8/uBibz
X-Received: by 2002:a25:55:: with SMTP id 82mr22566265yba.485.1594629476467;
        Mon, 13 Jul 2020 01:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594629476; cv=none;
        d=google.com; s=arc-20160816;
        b=WuqbMpfVmrNLuXWn2dcC/3v3V62qUXdGvqulJQcgHnx+VaserSPuQfgpDpY0mT74BZ
         PTkddNQj6jTduUqUW7sggzyHhv7BpH5cXmaOlJqr6aiKE/Tt+GFWst773N7W9Wche8X0
         1d5yhFNB0EOnGA4/MM0QwWHHeV4O0UNrduyz+URCcGWK4scZx9aYd9t79PJQx1fAZFGZ
         t7bvX2jPl7M/guncf5cTmWe4c5NivpPXT9JTkLmxVIKGBHJG/VwcQDuoKIJZTLazsbKJ
         5r/eK6E+Bd4oVOOfSYyajhV2XmQ691Z/GrxhO4VWU3nTe7mR+ote5ZVKT0G+NRPRCQUA
         37kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=G2AB4mUZCHrYrMKiKcfrXCx9PEpE0I/21cqmPVGVeOg=;
        b=KnrSBJGf0tXGCR9XLvLWJFNk/E2P+oTEZJjk4qc0CswHciDroAIAW+jVyWrVST99Up
         SIxnWqKx03YyLNGeLzxmZKMKq9BDDD9CNEtxa8hZfZ49jmyYNdWFU5VbdOvi3vFgOO19
         IjV/FLu9cd9ukoIwIGX3RuG3m2VoALJa6vBISGDavafcyhftRUE/7295l9rojxFgUSnF
         ZuRgosI3NaFgJlbVKJglQDlUKndL3d0BQCR061MRCOIsOa/lo8XYEny6GvzEWmM5dXaL
         QLXkyE/7zoBGvj9eP9cbu7cFtb1T+eA3boBkq7v65YhMzi+gnrHXz85OZvYzaBDGnewg
         D1ag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 129si13440794ybl.241.2020.07.13.01.37.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 01:37:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jutyF-0007BB-Si
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 04:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1juty9-0007Ay-DU
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 04:37:49 -0400
Received: from 3.mo68.mail-out.ovh.net ([46.105.58.60]:55914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1juty7-0008Lw-DX
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 04:37:49 -0400
Received: from player738.ha.ovh.net (unknown [10.110.115.113])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id D22C5173604
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2020 10:37:43 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player738.ha.ovh.net (Postfix) with ESMTPSA id 411C41468140A;
 Mon, 13 Jul 2020 08:37:41 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001c1bef1ea-6339-4ac1-a142-6c8ffd8a858d,29C60B8BFD44B6CD822E82BF6A6060F4508BB267)
 smtp.auth=clg@kaod.org
Subject: Re: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
To: Erik Smit <erik.lucas.smit@gmail.com>
References: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
 <a7acba46-5a9a-5dd2-71c6-7e4586485823@amsat.org>
 <CA+MHfot6FdS2yT0mEsCW36bCfwy-WY-1KPQ-KDfYBKzTy=Gd7w@mail.gmail.com>
 <CACPK8Xdqr+EufMgooCY=D+Vt98qu11YTHE5Fzi5+xqX=wKReeQ@mail.gmail.com>
 <CA+MHfouin6Zmz+GrjWRCc_WzPF=ff-z_5V7BLv0HkL+SW9bRoQ@mail.gmail.com>
 <8879bfee-752b-c4e2-7646-c42dec84a440@kaod.org>
 <CA+MHfou6ijtwjzWye6CKaqTa4sKxF1WmgH9juaSdO344uP2UZA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2c326d1c-3b91-96f4-20c0-2e2e1be9b2ad@kaod.org>
Date: Mon, 13 Jul 2020 10:37:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CA+MHfou6ijtwjzWye6CKaqTa4sKxF1WmgH9juaSdO344uP2UZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2114158550930459456
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrvdekgddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.58.60; envelope-from=clg@kaod.org;
 helo=3.mo68.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 04:37:44
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qnfHkccrNREY

Hello,

On 7/13/20 10:06 AM, Erik Smit wrote:
> Hi Cédric,
> 
> On Mon, 13 Jul 2020 at 09:52, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> With this patch, the supermicro firmware boots further but there is still
>> an issue. It might be the flash definition I used. The machine is detected
>> as an AST2300 SoC which is weird.
> 
>> BMC flash ID:0x19ba20
>> Unable to handle kernel NULL pointer dereference at virtual address 00000000
> 
> The firmware is expecting the flash ID to repeat. The following makes it boot.

That doesn't work for me.

C.

> Not sure if this is the right way to go.
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 8227088441..5000930800 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1041,7 +1041,7 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>              s->data[i] = s->pi->id[i];
>          }
>          for (; i < SPI_NOR_MAX_ID_LEN; i++) {
> -            s->data[i] = 0;
> +            s->data[i] = s->pi->id[i % s->pi->id_len];
>          }
> 
>          s->len = SPI_NOR_MAX_ID_LEN;
> 

