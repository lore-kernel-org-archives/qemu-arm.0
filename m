Received: by 10.223.183.22 with SMTP id l22csp2599891wre;
        Thu, 17 Aug 2017 13:13:34 -0700 (PDT)
X-Received: by 10.98.200.24 with SMTP id z24mr6229795pff.205.1503000814534;
        Thu, 17 Aug 2017 13:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503000814; cv=none;
        d=google.com; s=arc-20160816;
        b=yZowNb6GdUJjkfve6XJENGr6B1Io7kn78bZN2EPAfoX24hSSmZVpzi0C/wKPkSKQ2i
         Ezd9r71aHsUkp5tZyL4SWQ3C4sEHxF+IrVWxaLEvE7nKxnlXExvyCSOIOxtgPXjhe0hg
         EMnbDicnhLjSKRTa++1rV2Ge2f5dZ0W9xERETsKAFbOWXvZnf9F7ZNRJswv5I9n8xvsu
         mAkRa6CFQPBqMbMLhsMdLGAREFwuQqGGvm/YDpgqy62j1D0E9b0q2NFRJnvctZo56Ey3
         t+bc9x21KnqiYHs6TJI7QpeGhkML0cVpqSsBXUOSwPZBEIZ2HF425JdOi8YiGH3QVCe2
         1/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=fb9oZkoAPRHkBwJ0RcynOFcq9KM/TFmuvQ+uC65nRoE=;
        b=SW75jTnMXpUxoR91Prz97EZisFs0zIBB2PaPhV32xud2cIY5e+l5bVOObi9kvn8dIF
         FQP60W7m+42gzEdqisrhZ/Al5wM0ZtnArmrEbstNV9SMU0pBDT0icRXXYa/hc1j0Fclq
         tmKudMBp+jvV2Y5f4uCKq57saZHqmwdwYrQbe0Xq/wta58UPwvdBffOKJLNEv+Cgl4NE
         +P7Spbf6k/mbCpK255X4bC1QoqC4jLVthDobLi/s4XBMhDPgfBcmk6fi1cVwiTE3eRNs
         tn+X6nY9BOpBn5xYB83BwUtkuH+bHshaxsICgXV4bAE/jK2B9q/Kw5v2xrpRVywmSHgA
         X1hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XdJtkmbm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22c as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x22c.google.com (mail-pg0-x22c.google.com. [2607:f8b0:400e:c05::22c])
        by mx.google.com with ESMTPS id q8si2730209pli.217.2017.08.17.13.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 13:13:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22c as permitted sender) client-ip=2607:f8b0:400e:c05::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XdJtkmbm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22c as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x22c.google.com with SMTP id v189so49563998pgd.2
        for <alex.bennee@linaro.org>; Thu, 17 Aug 2017 13:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fb9oZkoAPRHkBwJ0RcynOFcq9KM/TFmuvQ+uC65nRoE=;
        b=XdJtkmbmFzZgjQTfdiu3XqJygFmeZoFf4p4ZSiyzEJ9lbXax1m273fpnBcUUb4IpOB
         BlJ898X4pTS/hzri1IHASh0hfl66Tj/cYIlDuPcVNpP9WY/NwxajcMEXW/FChPizcSHD
         B21uDG5Xbz2APtpPtYKAQ4CKs1ERZPncsYxsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fb9oZkoAPRHkBwJ0RcynOFcq9KM/TFmuvQ+uC65nRoE=;
        b=JTzEFlUEqE9Gm5Eyt/qFXPH5RPBAJGgx9ncYryfGKwMDJuUX+shr1YBSeF++ikB69u
         T2SxsoqfXuTbkDoKhxQ8+jzXzgpqGJQS8ryrISXlKoHML8Fy+y1CxZxmIS313BEiKkCu
         4eA4eVTyMPGP0D2ILY2fwslzXrfzQyU5LogAklfs3A711AcYBrosf2Ig0NHwqcLbskJn
         39iJv7mPyuHKikvUoTZnnycuGxBWKpB2TqmIxBnF6Q9RmWqj0DrZozu+SVD1Lb1On8ZK
         XKDq4sCGU82bzPJKJXOZgeUSFROPeo2El2PB731W4ytGghOeLPeA9M44f+n3ib5vbEnL
         gJcw==
X-Gm-Message-State: AHYfb5g02t7j6mC5AMiczcZ1yWq324yCs3Xhi5cNYGWIoRO3JSZDsI7x
	0DNkzokCUjMbgNTP/yE=
X-Received: by 10.98.63.145 with SMTP id z17mr6323534pfj.174.1503000814151;
        Thu, 17 Aug 2017 13:13:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id 17sm8837081pfp.157.2017.08.17.13.13.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 13:13:33 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 5/9] arm/cpu.h: align VFP registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, rth@twiddle.net,
 cota@braap.org, batuzovk@ispras.ru
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20170817180404.29334-1-alex.bennee@linaro.org>
 <20170817180404.29334-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6bfb1943-5d9f-6940-a289-86dd354ccc29@linaro.org>
Date: Thu, 17 Aug 2017 13:13:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170817180404.29334-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: axrkUuLRL8ic

On 08/17/2017 11:04 AM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/cpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
