Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4865969wrt;
        Mon, 15 Oct 2018 12:46:10 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61etyomtIVYteocemYMbDqrVdpciIRE6iVcjFbRdJ93HqQE+70kJjUmdQqAiGK5yD5tIZmU
X-Received: by 2002:a0c:96ee:: with SMTP id b43mr9166371qvd.238.1539632770672;
        Mon, 15 Oct 2018 12:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539632770; cv=none;
        d=google.com; s=arc-20160816;
        b=tgIkKhvYDzGgmHJlh0SrW5gcr4wiytAY7Wz+26rIqEfOiJyP8RcS3jEX55FPm5a2nr
         kubrgfNRGq6Lx8UQE4jNG1m0V68kV4nTCyOhIQVY1CtX33iQmcduTCYnR6F7eIIJgXA2
         ra4o6hziEIZduLODpYnrNbrGfzpKTV0nb685+WgHPIXBp8DS3K/M2AewWhv9oOcZsUs2
         dUmDVbmNaCJvHegirt8uQZWvBhHsbZDQ04C/6ctRp892kRoxzLDl7CljEN2gGsg849ec
         ZCXXjhj1LrMW1GbH3mf4yM4IwULkOeMBgItS1K9dEEwYDwoLJoBSS+7jO8R8j6hgOaB7
         ykXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=DfhnJ45k04YC5AA4VIR8rirJOXpC/wHppMFVwXdjyns=;
        b=BArrpb0bLMDm9lboj8Y5mk6VIcnXkxHv1/2ExvcgvsUwLw9FpFW16I0dOoDuFWsGe8
         fCqT+fcQ1DImZTNO2gEw38EPFWOEoB28iD41/uMmGS4lkeH9wzhLUo+5DR3qNo5+5Z9e
         Z7Tjv0x4jWtnjDsZVY0AyOYv8Ql2PZnp+/SI5pwInyMm5gySUMlNzIkHs1QJm8RDmv73
         IgdnvDFQDxYU+DNXV3HZe6CKTRXZ+OOFqrsFo4iXZZ5xdcGipkip25KYnT6bi7Z9fzih
         zOhQw5hS/DEllx747tXbyh41/dkyNHkkEtJNGoIW+lQCHfrESYV2zoSyCWzflL40npd2
         SFpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H7i+PUdU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d6-v6si1786068qvb.143.2018.10.15.12.46.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 12:46:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H7i+PUdU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC8oc-00081B-6P
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 15:46:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC8oS-00080F-RX
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 15:46:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC8oN-0000AO-TI
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 15:46:00 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39715)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gC8oN-0008UY-Aa
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 15:45:55 -0400
Received: by mail-pg1-x543.google.com with SMTP id r9-v6so9653607pgv.6
	for <qemu-arm@nongnu.org>; Mon, 15 Oct 2018 12:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DfhnJ45k04YC5AA4VIR8rirJOXpC/wHppMFVwXdjyns=;
	b=H7i+PUdUIuwNIM60YKf21G7BIXTLBcOWOLE1J/VoCE+A1vpuMK9Ac+QIgvHvyqqvG3
	UMbCO8ILcGuONKcAm2rGfjhQbn6GsmuUtujU5xHVmCPq+OxwE0NNvxfMdjecX1DQvagU
	+ziaChRmC034CEsPyg2MnKLBbGcOO6+BhF0is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DfhnJ45k04YC5AA4VIR8rirJOXpC/wHppMFVwXdjyns=;
	b=GwZ8G0idgw6xdyHKAO65lRJ0czsxnQk1wzsjLgvktw9viaon34Og/CmEISAPd7Jt/Y
	VkDec5GKkUZvCbNrkLmEFU2niNNoP+96Y3ij4NfbqseS6F0nHQCKqVq3nC4dzprMuQUq
	BJU8zEf2N0WryuQSuPD8HoL94yqKEERg+eUmDN1TAXDxCSgBT2uNCcpPlpKouGjt4YRk
	SganGes4+r8i58sCcKrFtlb3SsPrLt1bk5N3WZSvCTWv9s5Qf7CbIfMLBEvZWjDBIDes
	HshmjgdB0Lqaq2qrkoo3iki11hKFpmtaod/RSrz1Y7QcT+lXahcyzbWgSJYIHK3AbvsW
	th0Q==
X-Gm-Message-State: ABuFfojAu/dQToh7d9MdlpDJUbSkl/gXl6ZlN/wzDkLcZSZaCzO+5LVa
	QNNDYzCRbI+0NehI/4AEfvhdbA==
X-Received: by 2002:a63:455e:: with SMTP id
	u30-v6mr17369149pgk.30.1539632754294; 
	Mon, 15 Oct 2018 12:45:54 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	3-v6sm13574268pga.12.2018.10.15.12.45.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 12:45:53 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-5-aclindsa@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0e30ca6d-57f1-e67a-b9c3-dc5e4b703260@linaro.org>
Date: Mon, 15 Oct 2018 12:45:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010203735.27918-5-aclindsa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 04/14] target/arm: Swap PMU
 values before/after migrations
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
X-TUID: tr5verxN8K5v

On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> +static void cpu_post_save(void *opaque)
> +{
> +    ARMCPU *cpu = opaque;
> +    pmccntr_sync(&cpu->env);
> +}

I'm confused about the need for this.
Can you explain the sequence of events that requires it?


r~
