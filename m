Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1338516wrt;
        Thu, 13 Dec 2018 14:04:56 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X8WG3sHr1QHuw7MiIqfDvbS3KjwEgzxH9EnoAPdLqPI+1PdU7e+nB4i/c63w20lIxzIMcP
X-Received: by 2002:a37:c8c:: with SMTP id 134mr454491qkm.303.1544738696581;
        Thu, 13 Dec 2018 14:04:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544738696; cv=none;
        d=google.com; s=arc-20160816;
        b=P2lY12zPvWY06e70YWR4zP/m9cUG06v3c3QUvgwDr3ng3TsGXTYmWNjub35N1LxBTo
         0c0qWCHDkiFT0ksVO9UHIlu7lPfl7qPAxn6Kee1QZEQYfVQF9KSS5aTmzn4C6yjrOlxu
         +X6d5lXNGNYQYwVjv1zJmfNUn45HunOJMlhHs6tq/3n00usmRSL62MIGxQ54RdVXUann
         m48wCvarnu5fwkajGtqrourYIZBEmfUD9f0b9njZYPsqG+hmQqI/fW3InnRNoVRNLdvO
         HmiEJDvZ0vHVoCqkQ9Ybl71HC44kuHmR5i9jNxAoKcPelYUXbI3vN/2RPM4imoYF+Amn
         hotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=28pU3FCgHujlrp5XOivROfe992RSokhwanIWWio0H50=;
        b=OHR7fvbvBpSUKQj3ZpiI+xvmXCBpY/z9g+RzjjAoZvGHY6n2TrHl7geVHpbHmN4emL
         tWhF6uH+uyEu5oZTnZ91zC+1XL+/7N8uSmry4xQCHfQAszOjqAHaDEApRpuGEHcn8PQw
         wo3ovvtKBEqGIAuZhhQE1vDiioBPaKavoOYzyw8picB5P2fH+JEXzCH86AtfhpT7eUB2
         k87NMikkAn7CdNRp53N7+EK9UoVGT/mCVROIfDpeqC/d7jDgnU9KbRc0RJOZ+y9rc5+3
         ycqEr3JG4EBXlvwK0u1yCeTSmWny4Hmwc5F9dNAlrxkU9/t68Ke0/9NVlzvlZnkWxDMH
         3K8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AbAlGJU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p5si1456236qtd.99.2018.12.13.14.04.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Dec 2018 14:04:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AbAlGJU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gXZ6G-00053C-6O
	for alex.bennee@linaro.org; Thu, 13 Dec 2018 17:04:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gXZ5X-0004gP-Ds
	for qemu-arm@nongnu.org; Thu, 13 Dec 2018 17:04:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gXZ5J-0005eq-C2
	for qemu-arm@nongnu.org; Thu, 13 Dec 2018 17:04:05 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33317)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gXZ5I-0002tN-12
	for qemu-arm@nongnu.org; Thu, 13 Dec 2018 17:03:56 -0500
Received: by mail-oi1-x242.google.com with SMTP id c206so2973434oib.0
	for <qemu-arm@nongnu.org>; Thu, 13 Dec 2018 14:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=28pU3FCgHujlrp5XOivROfe992RSokhwanIWWio0H50=;
	b=AbAlGJU3pLJu9PzjkyvfPGP/mrdtWscDublwkg8xO6q/7pZViGJ2BKO0xdKShVinNl
	yts5UiC9W3qtjvHmLB295kzV9/HZlYPrL5nFpAR1cg5QCb6YiWgEzO7WZaCs2iNtwi0g
	AoeJAgoPinBZpkgEetGsKJfKEyxvPSWQbjgd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=28pU3FCgHujlrp5XOivROfe992RSokhwanIWWio0H50=;
	b=j2IOa+PlK+aUNwOH/RNW0xl+16RIgRdncQY88VAl+urWtJMiuTt7ndq1Z3UHjnRLgS
	DaOTrh8N4TeInTfhcPU3R7GGUfzHbfq7eyty7E0sSIqzvvgv6G+GYZl2q9vzDk5JvcAC
	45u1/xpa92NEsdKRbDJiHsH4c0NE0e2o1OL7PTg0x4JNWOxSJ+ulzAUD+Eo/kZ/cRWhG
	/dr/mbisGXflBkodwKivrU0XZiPqxWPFtBF6byj0UMoQJcjHBsasQTbpJURbWTMp6isZ
	yhAA9C9nR1bmDWIxxkBifZFn5rrUv3XbYBtFimz5S/VbPCIU9xtNJJvr9BoQ3h2ShsmI
	58pQ==
X-Gm-Message-State: AA+aEWaLMOJ3bfkDiJE9r8O634hN/O4gOwTg5JJ6bSp/+XXghhELWkV4
	0ISHZN7Oi6O3tmrF0eqfDeFTsw==
X-Received: by 2002:aca:720a:: with SMTP id p10mr314699oic.169.1544738577070; 
	Thu, 13 Dec 2018 14:02:57 -0800 (PST)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id 52sm4363648oti.30.2018.12.13.14.02.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 14:02:56 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181213183249.3468-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <090c809e-bdf5-37a4-ef80-d03abd44ec9d@linaro.org>
Date: Thu, 13 Dec 2018 16:02:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181213183249.3468-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/misc/tz-mpc: Fix value of
 BLK_MAX register
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
X-TUID: lBW37A7PICxX

On 12/13/18 12:32 PM, Peter Maydell wrote:
> In the TZ Memory Protection Controller, the BLK_MAX register is supposed
> to return the maximum permitted value of the BLK_IDX register. Our
> implementation incorrectly returned max+1 (ie the total number of
> valid index values, since BLK_IDX is zero-based).
> 
> Correct this off-by-one error. Since we consistently initialize
> and use s->blk_max throughout the implementation as the 'size'
> of the LUT, just adjust the value we return when the guest reads
> the BLK_MAX register, rather than trying to change the semantics
> of the s->blk_max internal struct field.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1806824
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/tz-mpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
