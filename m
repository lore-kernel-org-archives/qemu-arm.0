Received: by 10.25.221.202 with SMTP id w71csp1219301lfi;
        Thu, 3 Aug 2017 15:06:20 -0700 (PDT)
X-Received: by 10.237.41.230 with SMTP id o93mr441337qtd.27.1501797979854;
        Thu, 03 Aug 2017 15:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501797979; cv=none;
        d=google.com; s=arc-20160816;
        b=gm2wziBF4QgT6N3hLXvZnmVinIdBGtior0Ja42s7fGGPAGaiTsRZ7xbwzLnsa3GHoC
         en7MrplV94VUiAXhcsxnoP7DC5hcpLN0pJlLeO84flJaO29AxIKjYAJhXnGianqTsW4n
         IcvkTjzsH21hDQK56diP2CwaT47ORz0mJfQ0EHtGA+cWuB2V6MWhc27wNzS4ubLbFsW9
         6rjG3wY62V1C+ltr2x0ximlAD9hZsb1sse+J3AwpIhofOj25pUeI5Je0VHNGQLttk5cy
         Tp0w+CT9u7tv2XVAeuVyJxysur4mTXSRpexxbU73+qoT+0G+hg1F11u/XZ0OLvgujZlW
         QJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=n8DMweNGGrDZxg7c8qIw7+GNC/NbvMc7onhDg0vXrM0=;
        b=YQJGdSFzhwzVqC2z9RpKydMCjgp4IMydzfijjlTnjBC7DbLWNFgnvhf8/l6a9GO1cS
         kfZjG5398ClIlXo+rx2142i/3Jl+m2v63U36pqkoEgcQaS/p/fq7HvW23YfR0tcfsj5o
         0S3pWwhGWC/qWl4IakW6ruqPuvBSGpUhQkhKmso/X6XwQze73gN6kBLRnLUzwWNieqQp
         oUUdgfw4FUbkPlVkTx0QweFBvkWpJyOuKJ6l6sRS9GL3DMODhJ2fVGewFz0+yHK5YWPq
         uFN5SzXhmv8Nfckb45hsGd2xSyZbk4eDFIX3qZPg2Zf4pWhZ+b+uP53AIXgu6BPBmt4k
         7eHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=k+edCeVd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 128si31654079qkh.427.2017.08.03.15.06.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 15:06:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=k+edCeVd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddOG1-0001kM-Ex
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 18:06:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOFA-0001Pu-Q1
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 18:05:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOF7-00029a-1c
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 18:05:24 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:34931)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddOF6-00027c-SS; Thu, 03 Aug 2017 18:05:20 -0400
Received: by mail-pf0-x244.google.com with SMTP id j68so10511pfc.2;
	Thu, 03 Aug 2017 15:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=n8DMweNGGrDZxg7c8qIw7+GNC/NbvMc7onhDg0vXrM0=;
	b=k+edCeVdN/cX9vzb5WQgfen/7nH+Oo6KkmOrfafZzQomga4uQgm2YoOggzqIeqO18o
	VGI0GSYfbrNZ96ofajSvAfQgeQH6vtz4EF8z4JQ1Dx/hQs3QbfRcrFKhUp/eyfeBgbKc
	0MihUQWSdVu0zJ8uG5Iz+jMehgIwXRcIpjOkmYWeFZf0lIGZRnvUzHBXqDE3VcsjJDQf
	jEtB8xxR0K2CaFmg5GXW8+TmUpo5NE8nnTFhwHzIjieUz8aZ/7KkEVSwF6yObPt57dcW
	qSi1saU1Qi3gk0UaavZ7Y7Wq0tkwAHXRzavsvazZZwTZ2n2wg0oFAJLyFRdEezezQZck
	SE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=n8DMweNGGrDZxg7c8qIw7+GNC/NbvMc7onhDg0vXrM0=;
	b=DZ5UHUPLYTb1kMa+OwNzNzZocnwG5CQ0zWqmBq7tOe9dd33dCTBUSaHg9fNkYqsPHy
	+LeV+CoNkuJPEazWvYGdnqVjjPdWg7i7DF+oqdB3wfO/ObHtabOK2YkPM/J3FfVMThTT
	YJuKex11OQuCn/Y9wRP6Khamm0KsgmQeMiEQIrfVxdwmEUuxltqtumAoqD74oBkZdO65
	+qRevbv1YTuz+cIwENMTefK5pQ4jmKTaju162bx/vhNopvaUplSOlwI5eAaxzK1gce0x
	uU7X1zvMnvHpoDMoRxlh8IW4HcVoSd5wPF6rblj76A1tzwvv9uL2QCd1b445MSSZNIcR
	16oQ==
X-Gm-Message-State: AIVw113vqiQ8r9hYUSas1Uk9HJa5XoxN2iieBt8SVLqAwAd/VILoVJSI
	5I7rcnHBN/nUGg==
X-Received: by 10.99.107.193 with SMTP id g184mr227899pgc.167.1501797919661;
	Thu, 03 Aug 2017 15:05:19 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	o10sm65950229pgc.81.2017.08.03.15.05.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 15:05:19 -0700 (PDT)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-10-git-send-email-peter.maydell@linaro.org>
	<20170803153800.GR4859@toto>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <854126f3-84da-087c-f35b-480165871e7f@twiddle.net>
Date: Thu, 3 Aug 2017 15:05:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170803153800.GR4859@toto>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 09/15] target/arm: Don't store M
 profile PRIMASK and FAULTMASK in daif
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FHb1pP9a6lia

On 08/03/2017 08:38 AM, Edgar E. Iglesias wrote:
>> +        uint32_t primask;
>> +        uint32_t faultmask;
> It seems like these could be booleans?

I was thinking the same thing until I read the v8m description as a 32-bit
register.  This makes qemu match the spec, which has value.


r~
