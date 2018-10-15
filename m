Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4948612wrt;
        Mon, 15 Oct 2018 14:06:53 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60OKkx/RXbql7XFZEBdqGlF+8Emaln7C6FOKFEAUzs57UDXAZ57tZlmTQYlRP0JTsY/V1mU
X-Received: by 2002:a0c:ad31:: with SMTP id u46mr9722793qvc.60.1539637613289;
        Mon, 15 Oct 2018 14:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539637613; cv=none;
        d=google.com; s=arc-20160816;
        b=F8nDaPO5DwMnExNsJjH0GqwoAjsJQmC4ikxdE2qg84Gi80EAom7Ygh4+P+ZZBX7g7W
         vgAro3lurQpK2KiSh+fKZ2FFFsm8f+0ZVB5EunfuHusuUwSrEa30cz014ABm7+ArYoFQ
         u6p+h+zxrR2GxwVdc+//bD4yJtH7rn/zLkmmzDcNU34zYwnZsUrDaOJt0n6II1A8FaAz
         tZCCcELKaY8sTUxjswEYlGomHMshguy30ciOlQOubiyDohnIq/O7g0cR/8b+SpFnhDWD
         dFv8mHMIwEnXguf0ZX6cPz908I7ACQIogOFkQAMoATSOMTJHJKu5p8ZZejCsWa8/pfv/
         CAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=5pxearz8a4UZPnASWfWfp+RgT3mYBPh6vF9+hnJBkW8=;
        b=E0ReThjv4AQqUN1hTRs1nek6HDIhL2vSJAEn+Pv18G+WXRSicXwJqak6WGh9bt3Rih
         YcQmD2IcFF/+4mGYKqN8QB8sh4NQvk4qqiHhj2nUi/0OskfQP8jedHV9vKUd1GuaLo+j
         gmKWdb5+VkhfNMqpS8nPci2FlOS4EHOpTsOx0IJHbS7akjmDzfQXhkYWXoeXeO+OkOib
         KLqELS6B987xcCzWma6yVWfiOmE/QqZKZXlTY93mdgz7RPRIDF1RDH9xVm7M0U/br3HU
         XiMPvMB7ijT27qqJqJC+5BOy2wuSlbco18ByDFZWlnmpWUlmIPiRelDGWI3ua0Y5tW5v
         TvVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FYjV7nM+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o25-v6si2536693qtc.134.2018.10.15.14.06.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 14:06:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FYjV7nM+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54881 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCA4i-0005oz-OH
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 17:06:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCA4P-0005mA-2J
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 17:06:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gCA4C-00006M-NQ
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 17:06:26 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gCA42-0008T4-PE
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 17:06:14 -0400
Received: by mail-pl1-x644.google.com with SMTP id v5-v6so9872553plz.13
	for <qemu-arm@nongnu.org>; Mon, 15 Oct 2018 14:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5pxearz8a4UZPnASWfWfp+RgT3mYBPh6vF9+hnJBkW8=;
	b=FYjV7nM+VkkBcmaXaUx4PRCP4UmcGtB1YBUG3suR5rV3GmW8ybN/dNB++3iXqZdnZE
	6NVyCII/27CaNsxNzPGnez3S0ZBRtXR4cTPrgQhJXE4sl6rHvWBpG+w+Ut2SthudqJEl
	Ls8Za9EZT1bv4Zs6fASFlV4cv56bMSdqm5490=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5pxearz8a4UZPnASWfWfp+RgT3mYBPh6vF9+hnJBkW8=;
	b=EUvtxKt23BURHcvILRA0o3fordMqnm7dUWn+XjaqgykG1bNNGesb3Bt7zOhG1MqyRL
	pTZL7ZF1vt87piC4pR/YA1eCTnWTSQM2yrH015du1KqF5pjGI35vc3E3Yai4WDN3ehpa
	PnW6aFrmwUcqSmAzQs5TELSUMGubtU8sHLSML1PlRKunp2xZ9/lOejIT7QXqKrPCGpaw
	MD68N+KgCariDpjSLT7j7HRxeE6H/52jgDqNFioPpl+F5iI57ME7ltfvcvxqrMRpTg6Y
	Z7Iaxf0iWksKTt5DCiQcOUhtp4wfXC/h1yu7g6+RtpBxrBHjbBb+BS0kXiluybnR5WJu
	oqpA==
X-Gm-Message-State: ABuFfogYBXFCNDSu6K9Lgi5yU3I4IduxZVE+1ZNxMUZOky7lpawql+Gu
	Hdy2cu4pqvrmruBLLu0Z35EOfw==
X-Received: by 2002:a17:902:f096:: with SMTP id
	go22mr18863031plb.235.1539637569351; 
	Mon, 15 Oct 2018 14:06:09 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	74-v6sm18004411pfx.182.2018.10.15.14.06.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 14:06:08 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-8-aclindsa@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6c825871-5f78-b5de-2217-6c7831470c58@linaro.org>
Date: Mon, 15 Oct 2018 14:06:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010203735.27918-8-aclindsa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 07/14] target/arm: Allow
 AArch32 access for PMCCFILTR
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
X-TUID: TNl8CDy3eZ3E

On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
