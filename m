Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp232154ejb;
        Wed, 24 May 2023 23:38:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7E47vkVlBiBdOmOs0nH/gqXxrFgok8Jb/zKE+hSbsD8UbommeFXjARO/LofObBvR18ep9N
X-Received: by 2002:a05:6214:400d:b0:625:bb19:278c with SMTP id kd13-20020a056214400d00b00625bb19278cmr380940qvb.2.1684996694556;
        Wed, 24 May 2023 23:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684996694; cv=none;
        d=google.com; s=arc-20160816;
        b=M0uZPRwMVwJeCFC/UO3J4bHgFmfqw+MkPpvYGEZ9N+8kUH4Vb/5vIAIkOF3lNomkT8
         5tv1XEj+gLM1m4KVYjDeRrgLa/DWLuKogght507XZBzHAv+05DUutYNGg3JyFdzNvsFA
         oKnba3/63Wgj3C2DZharUOqPRKdhS5oWTAizQDvxwv0RRSqsTCn/kzXEHXik4Ne/eRcO
         CWxF3Z9hmduX/6I78R6MCwiWllVxn+o/7j5B4bcRIdzBmU/iXiDqaHI9KVp92qc7CSJn
         4VFZNL9a7tCpuxC3W3OsD1h1q7Bc2bXaypWDMpf3cibyX2nY9gc+Ln7KQ5NxFTnD4CaH
         cCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=qhsARP40o/pdMGZeHRBtIasWuVPPdSu38IYltt8+Db4=;
        b=mFCuZh7OPBU0bRe62Q49xSMzxMSri5/nVgeMW+gu4A9cFfELPf/B6Wnul0f8N3O84Z
         RfrUFblR4NLP0/mq2FMrNbA+qcanHfKGm7s4PmKWdgHI0kUpVL6cn5L9xZ73UKhyYyR2
         ozSZ14k//xzEZuvwCUuakHhIj0juT/ayudEJ0Jd+QCVhII2eRWwSd/Wh6pKykONObMYl
         akD0fXLMadFWgvNpOM2TMqcK1xS/W5TkHONKXevU1IRf6L8vA/QFyj1Pz5t20+adLQ3W
         M3t5VWzvQd1PhitoElIq3VUMIpLFHpokJk8UqelbhJrEBvSEX4MlqoYlkD1T/iUbORow
         0FAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10-20020a05620a15ea00b007593da317d0si213124qkm.514.2023.05.24.23.38.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 23:38:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q24bm-0001Sl-El; Thu, 25 May 2023 02:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1q24bj-0001NF-RX; Thu, 25 May 2023 02:37:55 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1q24bg-0006pc-Su; Thu, 25 May 2023 02:37:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.53])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 91909209ED;
 Thu, 25 May 2023 06:37:40 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 25 May
 2023 08:37:39 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004151609b7-ae7b-4002-b8f8-09ae99d7bcc2,
 E940071DC4947EF3E713969D80F20F6FFD8427E3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <164e53c1-03dd-a530-8c91-357a10517556@kaod.org>
Date: Thu, 25 May 2023 08:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/1] hw/arm/aspeed:Add vpd data for Rainier machine
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
CC: Ninad Palsule <ninad@linux.ibm.com>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9_via?= <qemu-arm@nongnu.org>
References: <20230523214520.2102894-1-ninad@linux.ibm.com>
 <20230523214520.2102894-2-ninad@linux.ibm.com>
 <7fadea2f-39e0-902f-848a-8f9bd7ff1f52@kaod.org>
 <CACPK8XeSBh+SMWPZ68rkeRnOcTFE0_SFcCNoYZr85DLhzGsgtQ@mail.gmail.com>
 <80168e3a-b0f6-463e-b473-8488a897ef16@app.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <80168e3a-b0f6-463e-b473-8488a897ef16@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 142b79b9-2128-423d-a219-0415f8cb76fb
X-Ovh-Tracer-Id: 158751890873944870
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejiedguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleefhfegueeuiefhkedtjefhfffhtdevteetgeekueduvdekvdeukeeuheefkeeinecuffhomhgrihhnpehkrghougdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtuddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhnihhnrggusehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: tjEYmgAbn174

[ ... ]

> However, regarding Cédric's log above, a reboot is expected on the first
> boot of a fresh image when there's valid VPD available. For the first
> boot of a fresh image we configure the kernel with a minimal devicetree
> that allows us to read the VPD data. This determines the system we're
> actually on and configures an appropriate devicetree for subsequent
> boots. We then reboot to pick up the new devicetree.

Yes. Then, the behavior looks correct under QEMU :

   https://www.kaod.org/qemu/aspeed/rainier/rainer.log

Here are the services which still have with some issues :

* clear-once.service                loaded failed     failed          Clear one time boot overrides
* ncsi-linkspeed@eth0.service       loaded failed     failed          Set eth0 gigabit link speed
* ncsi-linkspeed@eth1.service       loaded failed     failed          Set eth1 gigabit link speed
* obmc-flash-bios-init.service      loaded failed     failed          Setup Host FW directories
* system-vpd.service                loaded failed     failed          System VPD Collection
* trace-enable.service              loaded failed     failed          Enable Linux trace events in the boot loader

C.




