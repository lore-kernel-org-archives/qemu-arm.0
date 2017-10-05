Received: by 10.223.197.9 with SMTP id q9csp716348wrf;
        Thu, 5 Oct 2017 09:14:24 -0700 (PDT)
X-Received: by 10.237.55.228 with SMTP id j91mr35634011qtb.28.1507220063930;
        Thu, 05 Oct 2017 09:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507220063; cv=none;
        d=google.com; s=arc-20160816;
        b=r/ahdOsTFpIkogU5L7Hr87XRHN/QC0m7W6LsVoINoSFEpkuGBjE/++ToMDWaoN/gIH
         tEbR1RkGKVMBdsHbJU7cvXbj/7CRYcuM42hY+p5tOrdmIxm82jUeCA1ZdWTb8EnOpioi
         0IxwX55g+B2tDmO6gWe1T6YFWLj9Qi4Jbq3m8KrE3bi5v2KxNOT4clhkwAWtLzxlkbTn
         PXmcc4upxa3oGkrodWeOCEKl1C6DFWlsUZLXgm71Hv59KuXvDtiREYAGLTcTTFc1zicG
         oM0EQK38WCaJHNhyQmNwEf0C/O6kfVxLF2H9qrnHX/JxOtOTZkJ8Zk2M5s0jTTRLX+SX
         PlEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=AGtYHy4Qh5Pb9MEQ4J/gjCFKK6eJNZtO9DvgObvn+zw=;
        b=u2mcJf7l9jY2uAc7wdmosOS8rCFo9Ae0ohtwailyEhvWsXyEf4EOTfJS+VPoq4ufpV
         7SayGSNZfJA8i17WXI0gjiBG8jXUEDpWVqnGI/yvWtEVnTPEXSoUXwPG7woDiVM4yttF
         9sRFGE3sMl32aMtWePk+Nh+yxeXKopl19//Xp9LttfuM0+r/2cYgm/CH/Bd3h1VotWnH
         h9+OsEKyNLxXOv7o63yTc7aSG3AZd5Du10fetKpbVGa3OW/5LOhvAcNvYWN49v1h0xYe
         xYO/22a96HQT+pLTCEn3yVRtaCHSZoLyPMQiWGcaeyQs+1m+Cs/yhILRLoL9Yz/+hnvq
         J81Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L1J6X0lW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x128si6706182qkc.462.2017.10.05.09.14.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 09:14:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L1J6X0lW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e08n1-00087G-G0
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 12:14:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e08mv-00086m-5L
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:14:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e08mu-0000gP-8P
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:14:17 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:45691)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e08mu-0000fU-3N
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:14:16 -0400
Received: by mail-qt0-x231.google.com with SMTP id k1so15366148qti.2
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 09:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=AGtYHy4Qh5Pb9MEQ4J/gjCFKK6eJNZtO9DvgObvn+zw=;
	b=L1J6X0lWNxntTwm5+8IgnQ9L9o6mpn38bjTjldQiD4dqgKY4BZ5AOEI2QWFViCNIWM
	r0k5AT9yBlcDfOYB4Fe6ifp5kLMUAgYhcdNvqOQ0BNapXdnyRRFyuYFazdeD1gEKdklY
	HvRPbzs/iTrp+tb6cK9lGsopQ5b4UcUe4TmrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AGtYHy4Qh5Pb9MEQ4J/gjCFKK6eJNZtO9DvgObvn+zw=;
	b=mrSMzdxGr7otwOmCq4Hf3wuj5Nqsyl8mZv2j8T4wH91098dzHGYbF4k7d/aQLt2zaM
	maqlJO600xiduHmBzsQe0isIBWAgKG2Nu51uUAv245Gxcby77PQLwshvMA5WVHzyfNiE
	0JHclSo5HxuvhPkCbOtrBob2PtdbKyAax3042SoxnFFjFvSnqzp4Xiaft8eu8DAoiWLC
	GZmx7UwvZHzVS/0NHmDxV4Geu8ZXPzjFhbWmOGsxX9BUw5xwXxcP4Uq/7LTydtkhpx4U
	sUciEljVs2roOnOlAgpsRHj5FMUz5xIT4GImTaPcw+p/UZ6dsBZ/9nZVQErlQvuHXhhg
	VmKQ==
X-Gm-Message-State: AMCzsaUb4sL1i5TIhvu/Mpjnris7tXcteR19RDFT+9Y42LfEM5jZ4iHX
	Y36lt2xjuyRztxPxkzLOxlCXNA==
X-Google-Smtp-Source: AOwi7QAykNG2tgx7MZIHwEwEPkBZ5DCRhpnIbkRdihOONZ+414OJF8Ze2C6EEZ4E3cot1AVhXh4Lng==
X-Received: by 10.37.239.6 with SMTP id g6mr7005040ybd.340.1507220055479;
	Thu, 05 Oct 2017 09:14:15 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	s38sm4296862ywa.92.2017.10.05.09.14.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 09:14:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-5-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b9b49a5-0397-14a4-01b6-c22435096684@linaro.org>
Date: Thu, 5 Oct 2017 12:14:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 04/20] target/arm: Restore
 security state on exception return
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
X-TUID: KAleeRzN4bcs

On 09/22/2017 10:59 AM, Peter Maydell wrote:
> Now that we can handle the CONTROL.SPSEL bit not necessarily being
> in sync with the current stack pointer, we can restore the correct
> security state on exception return. This happens before we start
> to read registers off the stack frame, but after we have taken
> possible usage faults for bad exception return magic values and
> updated CONTROL.SPSEL.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

