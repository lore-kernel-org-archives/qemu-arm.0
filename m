Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1416069lfo;
        Mon, 7 Mar 2022 03:34:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwk36Fy/Xp6t33raqoHm/nN1/j6CF1WOtZS4k77YZzVoRRYeEOaD6d3KZ0F5V9H/iQvhkky
X-Received: by 2002:ac8:5c10:0:b0:2de:2dac:1ea1 with SMTP id i16-20020ac85c10000000b002de2dac1ea1mr9110933qti.600.1646652841310;
        Mon, 07 Mar 2022 03:34:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646652841; cv=none;
        d=google.com; s=arc-20160816;
        b=FntGEYqcgF+yLBZp+3S78JV9IFoDUspNZu0QsXBMDX+u8vuKI9JOkmd+GdAISC+RBJ
         WBC5vQabMwMSCB/Lm98MFctgMTIzJDH3oE6lDUP3M1ymEjhvlMoxeXA9z4z9OP5C16vp
         dhePGyGkjRpBqNoTWSWvXlDEwUs6SpH2X4iFJWVggEtdQXBO/hdS0MeAXxsMxH6thY/H
         SDvI/nkPPzAnsblfuUdedUrVekkRU5SpYMDhuqoCBYw7UUQZ7OIzk/Buw2NT+Q2YuRZu
         kCAS4rWLlsD90Syu3WarlYEwtTQ75k4ws3X4rHK61ACohK2nijjL3UQ5VlXutUva+U5y
         lxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=bMDF6enIUXeFhLmL84nB+LczhqOltVqPJ48vHQaybI4=;
        b=CI0V4h7h8YTtiRZmm4Jsu0YiUEpSfrcDBR7B8dI/4k5F0WvgBIRhrI+F3umvHwkb4x
         +AnZg/D29yFWqprlHn/XFAwcgql3gEVBYQ/Nqjoq6r9yPPgg0fVRqubdegk35fwmf2/j
         QObI7AOIuWI2oqMkbLCIytc+fpP/oS4pRKMvNlTbrU8m8CeZDU+gKxS5HSkpCpcX3EHX
         CPkCUtYQG8JynaLIBvx6hYak15un7EWbOCRJPp+2J9Fc5QtXWPWhVjzd1PNuiooKvaax
         ahlPGq1PA0DchJHANCmkSbZG8udj2OFKvYsrt9W5sjtCuL2nV/iRW3jq33p+RHQ8RB2d
         k2/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14-20020ac8710e000000b002ddda16743csi4367307qto.282.2022.03.07.03.34.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 03:34:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRBcm-0000mP-Qa
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 06:34:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRAjH-0005DK-Me; Mon, 07 Mar 2022 05:36:40 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:52615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nRAjD-0008IB-Rk; Mon, 07 Mar 2022 05:36:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.140])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id F385DE6FB27B;
 Mon,  7 Mar 2022 11:36:31 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 7 Mar
 2022 11:36:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004cd27b95a-3928-4f8c-a8d2-0dee00f98bcb,
 2E53EE1553C3E30B03D111E4FD0BE5C715152E82) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e11871cc-316d-a7a9-3d58-d9b5d813256c@kaod.org>
Date: Mon, 7 Mar 2022 11:36:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/6] aspeed/smc: Let the SSI core layer define the bus name
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-6-clg@kaod.org>
 <ab0657d6-c841-d72d-8073-b58dabe36a65@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ab0657d6-c841-d72d-8073-b58dabe36a65@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1fd8a18e-fa8e-421e-ac1c-67a68f8d89a1
X-Ovh-Tracer-Id: 16154130391173401452
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddugedgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghrmhgsrhhusehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FZqPGdoAUV0r

On 3/7/22 11:25, Philippe Mathieu-Daudé wrote:
> On 7/3/22 08:18, Cédric Le Goater wrote:
>> If no id is provided, qdev automatically assigns a unique ename with
> 
> "an unique name"?
> 
>> the following pattern "<type>.<index>".
> 
> Maybe complete with smth like:
> 
> "which avoid bus name collision when using multiple buses."

sure. will do.

The goal behind this patch is to start experimenting with user created
"m25p80" devices such :
  
   -drive file=<file>,format=raw,id=drive0 -device mx66l1g45g,bus=ssi.0,drive=drive0

BMC machines are starting to duplicate and I think, at least for Aspeed,
that we should offer a bare machine per SoC and let the user define
the I2C topology on the command line. The other aspect to cover is
the definition of the flash devices (possibly 3 controllers * 2-3 CS).

Adding a cs= or and addr= is the next step.

Thanks,

C.
