Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4978602wrt;
        Mon, 15 Oct 2018 14:35:40 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63v5YHOowsUgnAR1oEHrOMharziCnMQg0oE+KQoCIruZm0PfW/1miiqfz+k7PzqHLDtTlwC
X-Received: by 2002:ac8:3a64:: with SMTP id w91-v6mr18084483qte.144.1539639340727;
        Mon, 15 Oct 2018 14:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539639340; cv=none;
        d=google.com; s=arc-20160816;
        b=Hos1wkP68W8W1RtONqTHHeXuvxrYsT8s726TIl0HpLzl53Kd2xbij/qg+tUw34Akup
         4/lzah+SQMgWx0z+kTXQPRo3SyJEBFkc7f+okQagxGr5t6kw5xjj/d+Q7qcOE54gp/5D
         Pxmocy7O8qQrbVHrdqWqXm2dCidVjHy8Nsn9LbtmGLSYTop4DWnNPm2t68WeAu1/cZzC
         rM1aRxgc8vAD56VGKrl01VjSDQQqWEnW9FkOHHZNoZbklQACONPycQ2sFt0l5C3YLkB8
         poA/MG0yJDCM6ohSKGU1jWyUs7IbSXhCUMmpkWRsbflSpBUy+WfwC06kAIw04lt7Ba64
         IzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=SR3UUVaf0KzbZAPiEhQ8C8LEKPUo9octIL50liz81sk=;
        b=klB6g59OHWWrrdJIrapbUrRnSSl0j2+Yksqak6zLDv4FaNsprVwUFsGQLUWcrAXnPq
         0BRE7/NGxexPL09G9tnq48Lm+VJO83kuiFcH50j6SpcgdaBpKvYA8XEnBXeOZTsrV8QA
         jngJ7KD9hZeoAG6E05CGbL1MBHEidTpo5xf0PFp1+E5VS8axleueWVmIOgH3rOoDxdpS
         bm8nESQYMrA2IwHwyhpD8BF6M3r2lya7saMF8O7QTkkHfXpV9/95jP6BlVM7gkKM0jeb
         HSOIz6tPudLG18tEj5vJuRspZx7zqL6d/hQhd81JLfQjcqvHZ4/UOfUqa+DQAM9VEzQY
         ijzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BYqbljj4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u5-v6si1332292qvi.102.2018.10.15.14.35.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 14:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BYqbljj4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCAWa-0006VO-8W
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 17:35:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCAWQ-0006VD-KJ
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 17:35:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCAWN-00017E-81
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 17:35:30 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39960)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gCAWG-0000y6-Av
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 17:35:23 -0400
Received: by mail-pl1-x630.google.com with SMTP id 1-v6so9910408plv.7
	for <qemu-arm@nongnu.org>; Mon, 15 Oct 2018 14:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=SR3UUVaf0KzbZAPiEhQ8C8LEKPUo9octIL50liz81sk=;
	b=BYqbljj47s/II8FEl8eunvmq0ZV01Fv4xCwczbYE8JfiJU8am9xVIiK43iQNkRuGo0
	Nhg7WsQ5afWTEYw75gOQ/lylXckx9wKReX3jVTH65zNpbeA0s5u9viDFaCyMKl0dbEni
	QmZvaNpAPN2U1UrGzNsh/+TK3VHpmrUotIT8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SR3UUVaf0KzbZAPiEhQ8C8LEKPUo9octIL50liz81sk=;
	b=po6Taw8lYTBC06t65NHlb2LPCHXExxdUTJx8XOMMzhF+YJ7IBCvC7T6yFWpiBBHr1q
	cEtDppLo2s19oPWGV4OUsQZRujMTFMUdfmZIspi6dxsFvx+Yippb6NXVeKIXYdXHT8vn
	iWEc7yl+2NMCya0914OnrmzRk9o1R1PZL535ff9qOEc+N/NA+mGO0VXpNjYVQzgihFKG
	ZD4h0sHtmX485rGksIkL+yh1mrXVtmdi6yP54tbFxa4jgcm2RDzR213d86BSwNTXN0uV
	IBC25Iqvb3NV+/EnLSmsPOJ1SAgmuDSHZ5iB9bKDvlsKMJizdUad8DtxeJlRxIWJ1usV
	ekxA==
X-Gm-Message-State: ABuFfojMxLZspypHdbH3jQN2Fh0BY4nuYyKEIoFG0yrmiwqV2lPEFQr4
	CUXEZQUNwAYcINv874ojNYJDJw==
X-Received: by 2002:a17:902:b28b:: with SMTP id
	u11-v6mr18543299plr.326.1539639312137; 
	Mon, 15 Oct 2018 14:35:12 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	h123-v6sm16019004pfg.138.2018.10.15.14.35.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 14:35:11 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-10-aclindsa@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4001b651-754e-de03-bfe3-f865bebaed48@linaro.org>
Date: Mon, 15 Oct 2018 14:35:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010203735.27918-10-aclindsa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::630
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 09/14] target/arm: Add array
 for supported PMU events, generate PMCEID[01]
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S0igwBEza7YW

On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> +        cpu->pmceid0 = pmceid & 0xffffffff;
> +        cpu->pmceid1 = (pmceid >> 32) & 0xffffffff;

extract64(pmceid, 0, 32) and extract64(pmceid, 32, 32).

> +static const pm_event pm_events[] = {
> +};
> +#define MAX_EVENT_ID 0x0

Is this going to be ARRAY_SIZE(pm_events) - 1 in the end?

> +static uint16_t supported_event_map[MAX_EVENT_ID + 1];

Better as ARRAY_SIZE(pm_events)?

> +    for (i = 0; i <= MAX_EVENT_ID; i++) {
> +        supported_event_map[i] = UNSUPPORTED_EVENT;
> +    }

I think maybe

  for (i = 0; i < ARRAY_SIZE(supported_map_event); ++i) {

would be better.


r~
