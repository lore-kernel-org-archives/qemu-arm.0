Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6615398wrp;
        Wed, 18 Sep 2019 08:14:57 -0700 (PDT)
X-Received: by 2002:a17:90a:cb94:: with SMTP id a20mr1630582pju.111.1568819697306;
        Wed, 18 Sep 2019 08:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568819697; cv=none;
        d=google.com; s=arc-20160816;
        b=yg574F9V6SPW8uxK+1UW9//3WkEdf8AI8JfWisAJ7tSeLkiqNCnFRofY/fugSA1XRq
         eVUzIjOwBrZ3SnjTPBFmCjJFpYCg+FpkZ+NdvWUSqgXHXs2DK+t5uh52rxXq1QhojWbT
         okgZlanfrVni/VUWfIDQyCRIVVX1g7MxcQvZiUVQovGGs9zvGdPmGoPSGDXYzFkPByW6
         mM9f6tklQuQtNZG0gMBcUFwivxOyYx2ZWgMGG4L2Q1ck+ejV/lUBw45AnMxEjDmnwtGX
         8U6RdEX+J6My6V8DXLCwIpuLZ5EGa6BDnK+BXXzllf/AbGTpXzuV1gNIEhGbKhumk39B
         DL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=Di15xSXEP0WmQsLld3RE8DinlTNvuPQEmbqDRqfW5Xs=;
        b=ueKxVp74lLgsNxOJLyBtJnvaxMVVxMuKtuV0V60nIUQqyx20Erv/qmOxkxq1O8Azcn
         xfO5cKLtNjP6mGoqRPQpjEwVTvofqyIFA8z52G087zihX7wHLGoS4NtiT1mLCQUJxBjv
         tu3o5LdDTAA1TDGkaDgzmljDPDu+AkzSbCJTv/1xx1AdKBkiKq/DaXfgNIg6029CHxuE
         AgCqe0lU0XPnJS6bpt76qtbxYquV5ZOG1e4YZUAIqmGS22qjMXphEFOm3lrytM/2ID9/
         zy9Myal0zzHgYmXdDBRbEWD1VE+NqJNT89o9qydp3depGO7KlFsX1TXDjumasMJkItRN
         +bxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aeHzWnA0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r20sor7473695pls.39.2019.09.18.08.14.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2019 08:14:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aeHzWnA0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Di15xSXEP0WmQsLld3RE8DinlTNvuPQEmbqDRqfW5Xs=;
        b=aeHzWnA0JJRn5sNo+yIGoj6PGOMB1ftQqkNpWEZvg0yKDeLgRa0iGK/eXchJol+GDx
         ukLgYJHgs+AsMZEzU4Vd7FpxbpefZHEU0vgmxJnfm92wyl88GAhQ2H/TRrTo+bIkncm+
         1Ja2te7ApDEzvdIZ6LUfAF33TDEQiOkX01WHg0OrWXuqg1KacBJTIv8p39UvJHQe6cYI
         Th2hBNyMaXnR/+4ClhsZbRgOgBCPO3QlB/umc4NXISweGM4qVyjJs5xJIE0DnKpR4/ze
         pAXe9rWX9bFf09HLECiaQqLHDITD7Pc8nFFaq/b7np5iYswpBYMENHm1+0pXk2OUIeQs
         CxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Di15xSXEP0WmQsLld3RE8DinlTNvuPQEmbqDRqfW5Xs=;
        b=l2xw0Jr3V8xbHRP9RFc25KCdEzp/C7tGfpj9aW/v8k+nEJLp9aXd7Yz3PNKb0JzNqm
         Vu2a6+3JKA15ijvcoXoaavYDN3sFr4HKaUH/7RXoMmeIyjcjUi5df9xXTmLHmsxh3T5P
         9ZWOrHdsLG/TbzvXL3kDNI7//iZEFtJNvTfG6bnCtqfZ3K/mxijF6quKN3LndfQ9dhs2
         VfizLxNtAxg5ZaeFD1MHVmhArwFMEQwuZ52o8dS2ad//kRD7BgWnl1h8vQ1SaYvkBHfS
         zFPOuzurtWKP0Jf7Gp5oEVGmYVciHOilgOb369bca/lT2aE8ZmAMVS6KOjjM6vKi4fBt
         2LIQ==
X-Gm-Message-State: APjAAAVt5fW4ROxBGDJO2WHfzRS/tpZyjxu33hni9dbrUxuG+j5n46vL
	8cfgohsYhewrLsiZjiGzceoGJY2f
X-Google-Smtp-Source: APXvYqxYSNm5HOy8xa1HnJ1KQcjSRm7CwksxWbiumKLeYrNNFxjtIehL7jA1GI/12+sF1+vCm29DgA==
X-Received: by 2002:a17:902:36a:: with SMTP id 97mr4477110pld.75.1568819696682;
        Wed, 18 Sep 2019 08:14:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id e127sm9928468pfe.37.2019.09.18.08.14.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 08:14:55 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 7/9] tests/tcg: add float_madds test to
 multiarch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20190917184109.12564-1-alex.bennee@linaro.org>
 <20190917184109.12564-8-alex.bennee@linaro.org>
 <afd9bc85-9c79-a456-73c1-fc19e97d1acd@linaro.org> <877e661vur.fsf@linaro.org>
 <93ff7174-77c0-d2eb-eac2-d3eef7e88a14@linaro.org> <87zhj1zvnl.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <376bc2c5-b5c7-b35a-1adb-460b37cd4a6a@linaro.org>
Date: Wed, 18 Sep 2019 08:14:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87zhj1zvnl.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 9qwrp2jfUOy0

On 9/18/19 4:33 AM, Alex Bennée wrote:
>>> Ahh I was going to hardcode the arm madd instruction in as the builtin
>>> wasn't expanding. I tried setting -march in the CFLAGS but that didn't
>>> trigger it either on my buster arm-hf compiler. Any ideas how to get the
>>> compiler to do the right thing?
>>
>> I think you want -mfpu=neon-vfpv4.
> 
> Ahh that worked. I would have hoped that v8 would be enough to spit out
> aarch32 code which has to have VFPv4 for A profile right?

I would have thought so.  I'm not sure why -march=armv8-a wouldn't work.


r~
