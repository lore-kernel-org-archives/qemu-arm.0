Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3792478lfa;
        Mon, 2 Nov 2020 02:10:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0cIk9D56PwqUzXGWmbbSmiBwbpb2NwHIviEMOeGVDrN882uRg1Jcs1fdd5MCGwaS3cIO3
X-Received: by 2002:a05:620a:14a9:: with SMTP id x9mr13942337qkj.47.1604311840634;
        Mon, 02 Nov 2020 02:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604311840; cv=none;
        d=google.com; s=arc-20160816;
        b=R6cRZMJd/glMapQF7dRKzv9fyfmeJi2hOUN0uEFmjMnnRY+OL2A0g8Yz6fts4ehvYA
         BF3410/9ZTaqpTTGnNbIy5ZUmhqIhVUXjpatyC9rYegIznuGe46EIgquVJsnctsLigDu
         ZAEro/TIBnTmCkLyKK3VWZ/I5K7chx89KO7e4QzdmgJqmItBhPOVJXc4Qp6hQUAJcIaO
         DBGOiQE3hXuehy6AV0miHuBT6dwm93fk79hMZr3jb392LWMu6KwYp497S8eEYPmEVLci
         NB+VJNi2AsmrD/BqTTuMrqd5VwdF+1yOuQPJbZq7ieEtY1PJrH38n1j9x0Bqdl4OCUwj
         UtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=F/U6x8p2l+zDo/bJJDkAGPDX49G5tnv9tntoSA0f0Iw=;
        b=DW28zmcsQLsSFF2k9legUpdve6OYEr96kfP+66oUzGcfQ0O785IG22xm6F1z3srv4h
         6oumw2rqytB5mC1YmP+PWNz6QMAzNoHrHx4f1escjioEPEC7/kEro2BbCXEyREVEcfxN
         mmOHXiSaT9bar0ie/WOlp4MgGa78L7XKNAPILF1jnqWcsQlQtzXuEJGyabNmXCo834MV
         2GfB9SINAgd6aWdFYn9r9rce1B7n3mnFjXlmRfrXOiVhh9kX1CW5c2Or/i6qRveQs/c+
         XRh9OEz6v5vBeCs9H/Qs7byT+MvWVLCFxOyAeygwaul63qVuIGlPx7fMlim8FpEKYXNr
         Jn0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4si8764482qke.280.2020.11.02.02.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 02:10:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZWnQ-0004aS-2h
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 05:10:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kZWYw-0008AI-0z; Mon, 02 Nov 2020 04:55:42 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:41633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kZWYp-0000cW-W9; Mon, 02 Nov 2020 04:55:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.111])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 71212705E333;
 Mon,  2 Nov 2020 10:55:31 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 2 Nov 2020
 10:55:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0057b6b8c91-57c0-4222-b306-c60c54a37036,
 8DD5A59BB4BDDF13F63AE8D0997EBD433013A0F2) smtp.auth=clg@kaod.org
Subject: Re: [PATCH v6 0/7] hw/misc: Add LED device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20200912134041.946260-1-f4bug@amsat.org>
 <3783cc00-8ec6-6174-dad6-331177b95724@amsat.org>
 <22a8256e-3d1d-832e-b8ac-e05e9e91f07e@amsat.org>
 <12b6cd76-d444-4ff5-1e7c-f11c8e54ffb9@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <4d921983-fc51-9e05-79aa-fb6baf5bafa4@kaod.org>
Date: Mon, 2 Nov 2020 10:55:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <12b6cd76-d444-4ff5-1e7c-f11c8e54ffb9@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 05c7f3e0-6da4-43b7-887e-4c9ae54bd3fb
X-Ovh-Tracer-Id: 15533759540381191157
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 04:55:32
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GbdXvWMLDNo/

On 10/26/20 11:00 PM, Philippe Mathieu-Daudé wrote:
> On 10/16/20 5:29 PM, Philippe Mathieu-Daudé wrote:
>> On 9/19/20 2:30 PM, Philippe Mathieu-Daudé wrote:
>>> On 9/12/20 3:40 PM, Philippe Mathieu-Daudé wrote:
>>>> Hello,
>>>>
>>>> These patches are part of the GSoC unselected 'QEMU visualizer'
>>>> project.
>>>>
>>>> This series introduce a LED device that can be easily connected
>>>> to a GPIO output.
>>> [...]
>>>> Philippe Mathieu-Daud=C3=A9 (7):
>>>>    hw/misc/led: Add a LED device
>>>>    hw/misc/led: Allow connecting from GPIO output
>>>>    hw/misc/led: Emit a trace event when LED intensity has changed
>>>>    hw/arm/aspeed: Add the 3 front LEDs drived by the PCA9552 #1
>>>>    hw/misc/mps2-fpgaio: Use the LED device
>>>>    hw/misc/mps2-scc: Use the LED device
>>>>    hw/arm/tosa: Replace fprintf() calls by LED devices
>>>
>>> This series is now fully reviewed.
> 
> As soft-freeze is tomorrow, I'll go ahead and send a pull request.

You did well. I was out for a couple of weeks.

Thanks,

C. 

