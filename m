Received: by 10.223.172.38 with SMTP id v35csp5258301wrc;
        Tue, 19 Sep 2017 11:41:54 -0700 (PDT)
X-Received: by 10.200.23.37 with SMTP id w34mr3439209qtj.166.1505846514659;
        Tue, 19 Sep 2017 11:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505846514; cv=none;
        d=google.com; s=arc-20160816;
        b=lNC0DRjFydm6f7FY+JQC1IlHLfWs2NxWMiJ2W5B9enp2/3cdBlNNMEgdeVenvQXyAC
         p2ceBdVtcFIKcwBgkLQk0ZHfw2Yi5GqFnQFJKcx4dZcogOFlRP1hdhW/h+ldKZxDUhPe
         m7ibGpc6Hzg6B3Ezj6RVaUORaFKdmo5WLi/nrgOBu9Zn9DL6hTPqPcSJ0zfnoTN1fHWe
         pnv6sGd8EHCqbcIU2bT52pfcchNlLCSXBhrkFoyHlTe50NMRiRXpYtiZoad+1jq9QFn6
         prvVPk3T4QflAIY7Ht+LOqW8DuFTxLc2k5qCDsN5OH+8dzByO43ESkYzwIqFJGJ2x4Ze
         JLLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=tMyhnpcSaKr0Gv+lJYw707LF378sWq2+SFcsgpXjOpE=;
        b=Jx+XYuurqgDBsj6gpRdZ9V9RtQIXvHCX0P/shS6YSBLwbcuegdC6GFDhgO0nkfqpPa
         Iy6N5PBZ/moKE0iIcFwUTPrefCOkwperpQ9tCHs5glpUM6sGVTcrSidAi82iiIZ4/cAl
         4QKhU0aX0dzcc2EFBYVqI9JPuNuVdYZm/1Ktr1skUhw93xheAVuht0GI2l9nLiSaw1cA
         SmWzMiuVav08aLJN9kvePxyjBMBR+YXnBnbw3G5jAnPggkrNt+MEe+QLURdYka3ekGOF
         MAP0hSZiQHMnmB+TnVWNy/OJ9lWCiMCjm8sIzgGqzDJvrnvIq+GquPtEZrteHXCtN6I4
         r7ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=arlyYK1Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u90si336373qtd.450.2017.09.19.11.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 11:41:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=arlyYK1Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duNSy-000538-Fh
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 14:41:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNSr-0004wz-Tp
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:41:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1duNSl-0007PY-Ro
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:41:43 -0400
Received: from mail-io0-x233.google.com ([2607:f8b0:4001:c06::233]:55114)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1duNSl-0007LO-MJ
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 14:41:39 -0400
Received: by mail-io0-x233.google.com with SMTP id h66so1252963ioh.11
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 11:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tMyhnpcSaKr0Gv+lJYw707LF378sWq2+SFcsgpXjOpE=;
	b=arlyYK1Q68HSlCN1sQ/AorRPZfPu+7M2DLzcWtI0or7oa4WuWF3/wbQrfveryieOUi
	xmW0qKv+9APSnR7mVmSu/N695tb61IHoI1qRLjH8XuYEioT3BHMh9ulLQf2crB/Yr0Sa
	2DFYVQY5GcJOMNKWiI3CLFpVgc5kv463AgdTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tMyhnpcSaKr0Gv+lJYw707LF378sWq2+SFcsgpXjOpE=;
	b=Oq+LDD85iUY7zekYu5j2HA3XTlfArpv9pfrX/i5gBMuW8lmYllTPo37/HOUl0hOK52
	5iic8IcPuuJY5lgo5Rd5ntgo25EQ7xqyqgLTTqExvHxnKmVyQIoLFmPG631vJzBOL3Ay
	4TaQPLpMDDrcO4Xsj2TOHGZNfhF2+5AqCTLkaF7sv0g2Xne74LTEUECkN05n8oDooB6H
	6qfjAVJe+pmb++e553xoH2d0n4NVltamZnqugfT493SIZrMbxwl5yfJwFnvDWy2LxRyd
	lYKtnb39qsNKOYMu+Xzc77tKY4cRWuH6DdQ1Ixx9xio0uLiYVEcy4+FskSepsJvxYBPV
	4MiQ==
X-Gm-Message-State: AHPjjUiFYww00q+Mtrl5ljH+JDXf1NzFglSRN462raCTZJ03QLv5WAH9
	TP2qvu1L1x9faxSlxjskq/BPmg==
X-Google-Smtp-Source: AOwi7QAd/fCqXw7WVLM2NiEjaHXr7hzP4054FawmPipR6FZBFXnIB2URdHChH6317oi2k0fr1C+OfA==
X-Received: by 10.202.102.36 with SMTP id a36mr1848158oic.83.1505846496514;
	Tue, 19 Sep 2017 11:41:36 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162])
	by smtp.gmail.com with ESMTPSA id e17sm634779otj.15.2017.09.19.11.41.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 11:41:35 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-10-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d391768f-e01f-ef35-c2b1-3b6030988a0a@linaro.org>
Date: Tue, 19 Sep 2017 13:41:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-10-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::233
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 09/19] nvic: Make set_pending
 and clear_pending take a secure parameter
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QSuhOC/6/uL1

On 09/12/2017 01:13 PM, Peter Maydell wrote:
> Make the armv7m_nvic_set_pending() and armv7m_nvic_clear_pending()
> functions take a bool indicating whether to pend the secure
> or non-secure version of a banked interrupt, and update the
> callsites accordingly.
> 
> In most callsites we can simply pass the correct security
> state in; in a couple of cases we use TODO comments to indicate
> that we will return the code in a subsequent commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 14 ++++++++++-
>  hw/intc/armv7m_nvic.c | 64 ++++++++++++++++++++++++++++++++++++++-------------
>  target/arm/helper.c   | 24 +++++++++++--------
>  hw/intc/trace-events  |  4 ++--
>  4 files changed, 77 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

