Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8100420wrt;
        Tue, 4 Dec 2018 06:01:36 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U1v7+XbmgxKm08DM/+8W4csWgXpZduN/vcPpzjAuG/HgRa8cenuB4dF0xtHszSEMgVS5Vk
X-Received: by 2002:a37:6e86:: with SMTP id j128mr19366307qkc.46.1543932096718;
        Tue, 04 Dec 2018 06:01:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543932096; cv=none;
        d=google.com; s=arc-20160816;
        b=N8DbKzLUktI3MTfbaVnhXYtcrp1tiTKrbFCBlSUEroBqMP4xsuT5Z/LKzX+FkO0YDQ
         4h4QWkvIe7eMBLf8p8jyl/5WWAF0/GhYb51jU94gWGdAy7crBpIwG+ta1dM5SvZy2aRH
         qRF4i+iqZJJiXDaHE3bWCJz6rcRr53o6jc0wg44RAcA/6iPfHksLA7XXZHaYz3mMW7z5
         bTGQZtS87N9RuColnhs0QmEtkKhuA3MnkrdBfWl9DweLlIjJ6obToAmoRgLDdEq8ahDd
         ZjxrToo6pxa7Hnxv4cc6b4xCjVzPMXq+ju5rzmfI5SUiUa48uIG8a+AX6mNxtD7xjVEA
         Yv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=4D23aGIkj3ATd0c3VoULASZ+AYu/dbn2ljE89QIaOg8=;
        b=LdSMXS2xTytxmXRu98jKmPntRNl0VHgvG+aBSnb/dwgpN7yDIF/7dElSpi2d7oM4TD
         pHtVpOwn1cD9azhMmdUZW5LMT1Zjzk1RCNrbqhymYAL4X5JJ9DkyKq+fNcPZZbkfCb+l
         nhVE16OnTeU0OTvavZdg51WdioEL/5KaF5qRH1JxyEDk+HHYHur/5Ep4HZfnvrMT/8dn
         gJj4/jVhWa8MdZTEdMcRJKadRx6mLqd+07hm8CTBMe00aSJjK+xCShibuaY236sPNV9w
         2dcJpzt009EUVs58jGlPt0B/x+tQyfqeXQor0EP9TYp2czib7txU4i7Wl8Rijxuy1FK1
         1uwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TrMlozLF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n32si14254qtn.122.2018.12.04.06.01.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 06:01:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TrMlozLF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUBGa-0001M0-7h
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 09:01:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gUBGN-0001Ka-2h
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:01:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gUBGI-00030M-UJ
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:01:22 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35443)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gUBGG-0002xd-Ug
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:01:17 -0500
Received: by mail-ot1-x343.google.com with SMTP id 81so15248835otj.2
	for <qemu-arm@nongnu.org>; Tue, 04 Dec 2018 06:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=4D23aGIkj3ATd0c3VoULASZ+AYu/dbn2ljE89QIaOg8=;
	b=TrMlozLFj5b5uo4pk30MakYcLG/UdqXRYyzTvav4mLEvbRbO7ceO6UXliCj5tx3GRG
	jzpHyK4wBp4gyvx/Pdh0EDYFlbF8mOVYJZZN1OCWcJC+SdhsHFqrmwAbskImA7QGPv7x
	17C+jKns4vT7jrVO423wMC/IDDbQyQjgj5/hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4D23aGIkj3ATd0c3VoULASZ+AYu/dbn2ljE89QIaOg8=;
	b=qOCXgkGJ5aqxJVQxaJ442MRxufXG8z7pYZ9oMMut9bTJqmrlT5jgzd+X5qksWl7xBB
	7MOGjHNR7EKVlvXKoVbv8a7/xITw8T2GUJVzXlVu4fvZX1LCRTY9doVbQbxeS27cEwP8
	yiIHoLt47ZPG62XP9N/ar54a9yZ4jZv2PIDOy537H24HQW3ESfXA80ms5IFP5Lg1hQKk
	Nh4KKEuoBUodoL24xC5L5vWAbfey7HrsLsOdk+LbpHauSEOGLRQowR7CaB0QRMz7JAKx
	F4QyaXX8rTKGVKXUxexLZWSiQvVDRtVpcGWjLSdEVjiARDFZ9bo3bP3YCKgpYHIIwczd
	SDdg==
X-Gm-Message-State: AA+aEWazNWFeCnUpMA1Qyl3gf/QjuphmwVccsUV7OY0/I8Ojk60D3t2z
	mJGElXTQ4lpQ1qiKyErGRAH8scjQCcc=
X-Received: by 2002:a9d:501:: with SMTP id 1mr13573291otw.133.1543932074495;
	Tue, 04 Dec 2018 06:01:14 -0800 (PST)
Received: from cloudburst.twiddle.net (172.189-204-159.bestel.com.mx.
	[189.204.159.172]) by smtp.gmail.com with ESMTPSA id
	m207sm7446934oig.2.2018.12.04.06.01.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 06:01:13 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181204132952.2601-1-peter.maydell@linaro.org>
	<20181204132952.2601-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2961450d-063e-5037-b8ce-fc9881e48014@linaro.org>
Date: Tue, 4 Dec 2018 08:01:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181204132952.2601-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/5] target/arm: Create timers
 in realize, not init
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
X-TUID: p7jwJD0GbVOA

On 12/4/18 7:29 AM, Peter Maydell wrote:
> The timer_new() function allocates memory; this means that
> if we call it in the CPU's init method we would need
> to provide an instance_finalize method to free it. Defer
> the timer creation to the realize function instead.
> 
> This fixes a memory leak spotted by clang LeakSanitizer
> when a CPU object is created for introspection.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
