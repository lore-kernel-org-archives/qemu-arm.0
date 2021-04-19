Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp915547lfb;
        Mon, 19 Apr 2021 00:17:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxONybvquMpebAJueMzrodd2iYjurKPaOU5PFacQFdhv88UhYCg/LhtflWBdt4QWeGudy5
X-Received: by 2002:a05:6102:acf:: with SMTP id m15mr12928514vsh.26.1618816658611;
        Mon, 19 Apr 2021 00:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618816658; cv=none;
        d=google.com; s=arc-20160816;
        b=Kox/mFW2gD7ry2YoY/NB5Z25Qey5YOG2JLSf7blNkXpUvZV1ImfwfEan/utREjnND/
         OplHA821sgVD4pXc5ab0OFsso9hhQI5V0V/Ig9kEN1U1Kx44BIBiObyc1EiESoJ75U+9
         PLaaQFUfTvNzKmB3T7q1ccmvDYWWYBVuYIg4WYnBKhTvIHEslIdI4EWCD8O/HWuQcjhK
         XD41DceKlhv7njSm48N86BAFKgQG6J2KA811INR2sedk0NUd/bXTN/YEWeM2wbNxsPBI
         IBB6xnHLHPdbCurAYV2U4rb0UQOouDKfZVX5AFyl7PEV3bhzhnHzCjPdEQ6AIrbbpN0D
         FJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=pcZvHEHFvadhGXcCftMfjgKx764qRGfMCf5M/0i8HuE=;
        b=yybOqwjX9FP2t0pz23UaKrQvJsyiSZlatv5WBrayR9QyM6iLyabJjgoV501a2vdn9q
         97/4BvWA8hjUe5qCrPvngtkuYjDQPupC/2ToxUy4jPzmfAMlIwGnR6ue6vtnR48Ww79z
         TPSvTxCYaVyui6AfyOSokJgtkphSJtauk4W1tfK+iyeJrVOhlycrRowBg64/GhNeOAB/
         KeB8lJkbhvbqh4cmiwCm9lLhkcHGhZF3OLvglRM6uAS6ydlqBRjkrm+3+yFIbY1+kBYc
         CFKPQm0j9vswzLOJeWvSV+1LG7arpJ44BFaYljl1xuXOZau5fGxYeeaGnVqfaijfxMvP
         tfiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t21si1558151uaq.69.2021.04.19.00.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 00:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYOA5-0007SX-WB
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 03:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lYO9y-0007S8-EW; Mon, 19 Apr 2021 03:17:30 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:39041
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lYO9w-0008C6-J3; Mon, 19 Apr 2021 03:17:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.147])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 3F8DA141499;
 Mon, 19 Apr 2021 07:17:15 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Apr
 2021 09:17:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0013b55a660-cce4-4c33-8d3c-d01e140dab68,
 B4D035A2DC807FE66533091DC87546D0F6B6CAAF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH v2 00/11] memory: Forbid mapping AddressSpace root
 MemoryRegion
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e5e7bf9a-690f-d728-4415-97cba5bd0fe3@kaod.org>
Date: Mon, 19 Apr 2021 09:17:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2dc0ce4f-50b9-41f2-85d1-06504cc3ba3b
X-Ovh-Tracer-Id: 3349270751280073519
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvddtfedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeelleeuveelvdejvdegtddugfdvkeejueehvdejuefgleeivdduhfduteffgeeinecuffhomhgrihhnpehmrghilhdqrghrtghhihhvvgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WlNGiPOf1gky

Hello,

On 4/17/21 12:30 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series is the result of a long thread with Peter:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg788366.html
> and IRC chats...
> 
> AddressSpace are physical address view and shouldn't be using
> non-zero base address. The correct way to map a MR used as AS
> root is to use a MR alias.
> 
> Fix the current incorrect uses, then forbid further use.
> 
> Since v1:
> - Split the Raven patch in multiple changes, easier to follow/review
>   (https://www.mail-archive.com/qemu-devel@nongnu.org/msg791116.html)
> 
> Note, the Aspeed patches are already queued in Cédric tree. I had
> to cherry-pick them from his tree to have the series pass CI.

So I will wait for this patchset to be merged before sending the 
aspeed queue. Are there any blocking aspects to it ? 

Thanks,

C.  

