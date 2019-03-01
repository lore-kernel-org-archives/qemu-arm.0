Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1037383wrx;
        Fri, 1 Mar 2019 12:23:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqxkdYBBPHo6Vvvga4pLCG/+KnQBw5ZQDNohni1sSEEbJffhwJe5/gtG0Z8qYmTRCuWRLONX
X-Received: by 2002:a25:d807:: with SMTP id p7mr5926747ybg.211.1551471785651;
        Fri, 01 Mar 2019 12:23:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551471785; cv=none;
        d=google.com; s=arc-20160816;
        b=KUFCXSsIq8O6Z1fU4eKvrXSzKW/I9uUbZPPMZI+Ca3ioqf92yDacf0obI3lcOVSxT0
         Ih9hVAYaldL/xEgUjPxUhGQ553Dqv8VdADJS3tU5s9ayDHXBAr1oS1BZ7mN4XJts7uDL
         EUffn/f/cB1rz/zeQUylcBFoMn3L2vYtOxce16WwCvchyQx8+ma4kkPwQWR4hTwDpM8F
         Y9pddEBnht7vGvfcfNs5KmR6hSh9qHhhaqr6rcc1blN7WfKkwLrFbt1uC7tP7K6z7Q7T
         tOOISgSalIRIuiuscq92S95QSV+EJwgCVw+nXF9/U+bxqy5jc+/Mt6nSsMsx38NIktCn
         J7Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=5sX0iFA4oF3PUV/SRuHapbOFv0bZMSN6LeI5NApgtMg=;
        b=fOzz/YmtK1YnRd8NBnvYRJDhDcAf3ILFVYN9iddr/HSpBi6IbQpGbG1U7smby5X1Xi
         ZGxt13Yk6FPdHx32k2v8nlH8QAJmXpEpiGK5AravKKTa4cTc1vR+yNE3SSMIkEIbEIFS
         PeV3fQpiq/S92aklAwQx6g0N8Riu+fIM3KHeMvkrOD3w+D4ZdPpNunlRM2wYKX0LqiPP
         lQCIZyvioZefQz1iffZ6pM/djZ3bYG8a82T8B8qWQNVAaZKOgOjDqA3T5k1TPSI7kBzf
         wOs1nxYs13PbNzleiHKdQUovUz0WULuVoKb074xLqV2oSK0Qn6sZUSYxHDmMeasOEow7
         PlOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BmaliSoM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r80si13222853ywg.147.2019.03.01.12.23.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 12:23:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BmaliSoM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:43666 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzogT-0001VP-3B
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 15:23:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gzogG-0001V2-8A
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 15:22:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gzogE-0001Eb-47
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 15:22:51 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40045)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gzog6-0000pZ-W3
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 15:22:48 -0500
Received: by mail-pf1-x442.google.com with SMTP id h1so11925944pfo.7
	for <qemu-arm@nongnu.org>; Fri, 01 Mar 2019 12:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5sX0iFA4oF3PUV/SRuHapbOFv0bZMSN6LeI5NApgtMg=;
	b=BmaliSoM39e/clZ1kiZ7e17Nmr8j/TLnXTLIyLYdStSKXfSrT5FGn8s3NcDi10o+i7
	4ecIGYyo/vuo8LdsvkgbS9Enqtiw1m5ZatkO0knLaABClDrDO7RNBmuV0jpBFMYeM4aX
	ohRSYYVqslw0vastdB8hBDu8Pkoum5UKHe5ZRXRA6Ec0eDvK9PzkR5t/TJpSs55HQwrN
	Jbpx4R19tLHh1JS5A3W2O3AzLarfgs5ZdGn1v9OYh0KI6CGh96KsWpoJZCr5wIzJKEQV
	HWSixZV+DSWn6aIMtn0uGQcVIMqYCKFQ057j/NfHVbUbAY7CbzbBasdUAnN4TUY7pe8F
	mDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5sX0iFA4oF3PUV/SRuHapbOFv0bZMSN6LeI5NApgtMg=;
	b=VIPFNMSc+cyYWiTLi/PEYRg8aogSn5OYvlxvub+RwEV8zjmkjvZtfROc9Ri8Y3LY3S
	fXobC8M166yPiOa1CT7z4fjNskDTh9+aGy081ObXsgXITHO3EONxWm8x7sUJvbY4wXFY
	ISBjHRjvWkOwriFt1F4+BNJnSdq590RrNOGEOzyL2JKP4Dyq2Iv56BD5U5Yqv8FqzWZG
	c0J5sqizUSMGQH5rFODDdXzqMOBoK5z12+6ZK0MJgVMlutFQc+UyplNlESmbWJbdMlTP
	5vyjBfjODYK9GtMgSixPb6jngMQAiBLhO7a1nPx1SI00RXugcXlCqwHDnDht0qY1SsxL
	IvxQ==
X-Gm-Message-State: APjAAAWuRVy7W+rxI/d5ePRaT8dfDU6v5awognTP7fxAg/JSetZNTem4
	s/6ZxkkprxCSMkBUM/YKIBnBCw==
X-Received: by 2002:a62:e214:: with SMTP id a20mr7301939pfi.192.1551471761664; 
	Fri, 01 Mar 2019 12:22:41 -0800 (PST)
Received: from cloudburst.twiddle.net (cpe-72-132-238-51.dc.res.rr.com.
	[72.132.238.51])
	by smtp.gmail.com with ESMTPSA id 73sm4207179pga.19.2019.03.01.12.22.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 12:22:40 -0800 (PST)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
References: <20190301134709.4695-1-eric.auger@redhat.com>
	<20190301134709.4695-2-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <48f9a583-b3ed-7e46-dd8b-e47d8b387901@linaro.org>
Date: Fri, 1 Mar 2019 12:22:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190301134709.4695-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v11 01/10] hw/arm/boot:
 introduce fdt_add_memory_node helper
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RQCqkfd4GT3e

On 3/1/19 5:47 AM, Eric Auger wrote:
> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> 
> We introduce an helper to create a memory node.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> ---
> v7 -> v8:
> - Added Igor's R-b
> 
> v6 -> v7:
> - msg error in the caller
> - add comment about NUMA ID
> ---
>  hw/arm/boot.c | 54 ++++++++++++++++++++++++++++++++-------------------
>  1 file changed, 34 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
