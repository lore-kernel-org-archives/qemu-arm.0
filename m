Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1237130wrd;
        Thu, 23 Aug 2018 07:26:12 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz37aLOLVKhpcBKOTF19vJPygxoA4pcGWJshasz9egiX6hCIX4X1Mg1/LPClOMvDOMzClhm
X-Received: by 2002:ac8:36b0:: with SMTP id a45-v6mr16457864qtc.236.1535034371978;
        Thu, 23 Aug 2018 07:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535034371; cv=none;
        d=google.com; s=arc-20160816;
        b=U8Q/6YwQK/QfC1xwtHy/b974dF0lSE4lGVkXwZbA3hMoB5uE6PrdmDHOQ0weYVLRFT
         3mOJbHpwX+f6EPWA5mKU5wgU84BLN0pJtv/GFmBkt9EWpuZY2Qrd7LJ4xcYyWGWErJSs
         nI80klp3rlIfRNxcY4iKtuVMXlNiAZh/KdBQdztZSnuDE48SRrVxNqStHu6JIfyU9UiS
         KAfr4nlCxwQfL34EK1fSypkrhtPkxHdLFAakElchC8yHWgXax7dmvujixwhc23O/4+N1
         g+Amer8hbAYl/Fr469z+kbtLzLTx7fVTa/JSUmLAHb3s3Sy4HpdLLAXNimXHIOj5fURI
         rc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=eHPjkLwGAYFhBJLFf/jXMKvcxzxdDf9OERB6z14P1L4=;
        b=ik/0SbPNqFkBauNGAh5LfgwV/10q6sqDLWTlB7NqUIpj0dPuclGXEf7bnZfe7KtExJ
         JWDeI70e/6+/eahPqkE0JBwptjoXiOaBldSiENKBdn/p7aybI+vc+7uxoehN70C9xmiw
         fWAF0lUMAbW7DvbAJeCFNZAuhJZrc/8CGytc0H06C2k11RPkYxv/HXrr92iNrA7juZq4
         23nhqmkRok9CbwMVs3M7/oCNAOoc+RCnyA+NHMf49pT65OS6745b0Lzql2jSf2TRO9Q5
         js1umb+Wpfs88w9t1O5X+FrKaihssnYtdiE5+7tnrojsOv6+NXVJESZwcvDQ3Vkyum2X
         4F0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G3BFMpbG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o18-v6si3901009qvh.216.2018.08.23.07.26.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 07:26:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G3BFMpbG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsqYt-0004Jw-DI
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 10:26:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqIL-0003VW-82
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 10:09:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fsqIH-0007Wk-C7
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 10:09:04 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38552)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fsqIF-0007VZ-Ls
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 10:09:00 -0400
Received: by mail-pg1-x541.google.com with SMTP id k8-v6so2618892pgq.5
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 07:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=eHPjkLwGAYFhBJLFf/jXMKvcxzxdDf9OERB6z14P1L4=;
	b=G3BFMpbGSnW7hXC5ZVp9KEyYFqc3arel/UeZ8Roe76QIfipNlb9VWkhtTkPjMbLB67
	0O+ScmD3+FxKGig6t0H7hnCxrBAwTzSd0fD2M4+aOD/qX06dexYlB3zOs94+MnBk+N0d
	OWXwid9c5CVuKbEwHfhX+YifUOYmEn0KNJYWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eHPjkLwGAYFhBJLFf/jXMKvcxzxdDf9OERB6z14P1L4=;
	b=GXhHrA7RvkqkubGzLqkB8ykS2k3lzbi1NxN1nv1Fo8CmICMoSBUP9eP3/TwjjZg5Rx
	8yF7o1AKIy/vCKcnbuU/x4rIyTExQykpSbc6M0z9hq5lINqCXF1/eGHoFDRpUXJlFUx/
	G39fArUeh9g0Ufsyj3dW2gpte5orOhVlhMW4hNJHGgb720AxLd7w9rSOubLcBsyM8IQM
	bi+tEsm0vO7FeJPwwMQAvxlK+9h/D9cac59jAkD81Z8MXuHs8Fs6RvNV5WNZ6fLmhQhP
	OpeRIYRyiMqDR23gYT5jhR/Q0k05duD7mh6NhjvWHKfLrtRK75JW0jGBSs+srb1xT+EJ
	w5GA==
X-Gm-Message-State: AOUpUlGYTWZ/LU6fqw5IBLtK3KCCJYjbGKcdN1El77VaBjCIVvazjBeO
	Ywv6jkKg0SRDKdamlNIw9YExmg==
X-Received: by 2002:a63:6849:: with SMTP id
	d70-v6mr54956440pgc.7.1535033338266; 
	Thu, 23 Aug 2018 07:08:58 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	s16-v6sm5897436pfm.114.2018.08.23.07.08.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 07:08:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <dd295089-43c9-bbbf-1032-6528033c94a3@linaro.org>
Date: Thu, 23 Aug 2018 07:08:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/22]
 hw/timer/cmsdk-apb-dualtimer: Implement CMSDK dual timer module
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sWCI14BUxyb+

On 08/20/2018 07:10 AM, Peter Maydell wrote:
> +            if (!(m->control & R_CONTROL_SIZE_MASK)) {
> +                load = deposit32(load, 16, 16, extract32(m->load, 16, 16));
> +            }

The same result, but clearer as

  load = deposit32(m->load, 0, 16, load);

Several instances of this same pattern.

Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
