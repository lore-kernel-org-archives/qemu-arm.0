Received: by 10.223.159.74 with SMTP id f10csp3088238wrg;
        Mon, 18 Dec 2017 12:30:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBospQie5NBY47mbxOQS3fZnk0GN4qko3WUro9DSLAVV5PrMPhnT8cMCyMmNbuaxKG9Jciscx
X-Received: by 10.37.97.151 with SMTP id v145mr852797ybb.106.1513629001252;
        Mon, 18 Dec 2017 12:30:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513629001; cv=none;
        d=google.com; s=arc-20160816;
        b=D72mw73rUZtGrA6Uh7nGKU5KflmFZCmIMIQvOa87iZkgjCY/vGOtbNjk30yqZ8SIdA
         lY5s4ftwjYTKE4cp6UPd5Ygo3kZPKuU6y/CVqK+snPPI3XYiQ9zgOmSwdSKkB/eWitU+
         8Q8N/q5N5vSSB5L2F/QmAU8EKBrUyb7NY7534GzobF55oge8TjPqBoVjotR7RCoVpode
         QaxIfpCw2jQIPN0DPXvm/ccEVb+4rAqPstVK0LInEeGZOSts/5oRpn5D113d901rYwJG
         Dey+8C27zFG4B8iYTWPeVUrWrsA7HqiZVrXdXiyc8v+6+hq907tQwgtb+XtZ5WMy9Vx6
         PwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=TXMBQrf1GT04Z28akvvc05NuH7YlKIulUl70rOhPRAc=;
        b=SWy0D30COowEXCnVeTnMq8IzSnUJc0Uywg1vQvjsp7TadIEs/sx1/28zq6cYSXyBKl
         CB2IRS3wMPtANNWa0gCWchjgFXAS3TJRG5JiPy9I5XaSQDahUvIDsNWCcHKJYnMG7iWK
         gKQ1dimqgfV40aE3U5EQfzBKC0GPBKGBcjMJgN0/YizaU90EfC009ilSJIxx/Jlh10kZ
         tlQFjSEXqqAbN1/Rk6oMAJexDKtfAeTWscA3Knjjlexs6be6qQAvqYU1SjflyipuACEH
         oGHO28vBS/ZdyT0Pi1WD/c5C81+zSctRXKJh6LUbdSrzK0A56G6N7jonlZ4pxy1TNJ9L
         hcEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DeEJj/Uv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z62si2646055ybc.410.2017.12.18.12.30.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 12:30:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DeEJj/Uv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR22y-0001GL-Nh
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 15:30:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eR22e-0001AY-AS
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 15:29:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eR22Z-0001Ep-Tv
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 15:29:40 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33452)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eR22T-00014a-IE; Mon, 18 Dec 2017 15:29:29 -0500
Received: by mail-qk0-x242.google.com with SMTP id x7so2547494qkb.0;
	Mon, 18 Dec 2017 12:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TXMBQrf1GT04Z28akvvc05NuH7YlKIulUl70rOhPRAc=;
	b=DeEJj/UvEwOxSASRfcooi69h9SJspx/q6Z1rHAKVsjbTSHoztfH7SZZfcnO08Y0yUs
	+/8YkgTHIMB0VtIFr1z8HyqXoQQlO/WQrXu232IkROj7Gsa9O2joJY5DsE60RnK+KFXa
	CQ05WAkAfFxa77XrAWc9r2sY9kLjT802FTfsRJ2FHGiZErfdOI0/rAq/6RcqYJMjl1kk
	emKYa3ZDyrVprrmUMihKAJz7ximCc6Ddqlr2RPYTO7FvCLT6tYvd36oMoU8L1791Hgoq
	pvi70EtJdtT1pmMqfqvqHmvADEnJGhDw6CjuTLM2dUBDave/2IpSl6uXlEtrgE6mRa37
	ZyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=TXMBQrf1GT04Z28akvvc05NuH7YlKIulUl70rOhPRAc=;
	b=NwS2FdnUJm5epY9fZVUY9kXabkyHNk8g6Udz0Bsj0L7KBeqoQAwxZiz4bx8Xp7xH/L
	eyaR0r27NFQS2EQJ9dJubdjOWGTyT0a/1Eg0mjI4+Rq/zH7W9Ky2FLJ4aEvnBLXK1rOZ
	hpwzgUspAN/EZPkbkBHpsf90phJ1UZdbpjasDlrSqABO7JzxCtHzFQKR1A2g/zNVDBSn
	C0W53ZHpdorbszwRBNfjInwJobOvlWGG1fnNKzMQl/nTPTgEnXIybYDW4F86Yu3ql1pR
	VXAikdtx+UJ/5nUVJtmcrKx1GHlXrcSClgw8LEKspSSWxthpOyAmwwtyFv+ZrtmsRGQB
	r2kg==
X-Gm-Message-State: AKGB3mK8faFY6065WImiaiW4/y8wJcN8+XQuXUhjD2WIU/XG8UgXFFtj
	tQgZaST7Al7q1ef98bh09Fv51A3T
X-Received: by 10.55.190.5 with SMTP id o5mr1507286qkf.241.1513628968823;
	Mon, 18 Dec 2017 12:29:28 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id
	u50sm8801537qth.39.2017.12.18.12.29.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Dec 2017 12:29:28 -0800 (PST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <7c447107-e135-74bc-dd18-31789fb86a6d@amsat.org>
Date: Mon, 18 Dec 2017 17:29:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171218173022.18418-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 6/9] vmstate: Add
 VMSTATE_UINT64_SUB_ARRAY
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jpyPJC5v6p/c

On 12/18/2017 02:30 PM, Richard Henderson wrote:
> At the same time, move VMSTATE_UINT32_SUB_ARRAY
> beside the other UINT32 definitions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/migration/vmstate.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 88b55df5ae..8c3889433c 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -905,6 +905,9 @@ extern const VMStateInfo vmstate_info_qtailq;
>  #define VMSTATE_UINT32_ARRAY(_f, _s, _n)                              \
>      VMSTATE_UINT32_ARRAY_V(_f, _s, _n, 0)
>  
> +#define VMSTATE_UINT32_SUB_ARRAY(_f, _s, _start, _num)                \
> +    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint32, uint32_t)
> +
>  #define VMSTATE_UINT32_2DARRAY(_f, _s, _n1, _n2)                      \
>      VMSTATE_UINT32_2DARRAY_V(_f, _s, _n1, _n2, 0)
>  
> @@ -914,6 +917,9 @@ extern const VMStateInfo vmstate_info_qtailq;
>  #define VMSTATE_UINT64_ARRAY(_f, _s, _n)                              \
>      VMSTATE_UINT64_ARRAY_V(_f, _s, _n, 0)
>  
> +#define VMSTATE_UINT64_SUB_ARRAY(_f, _s, _start, _num)                \
> +    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint64, uint64_t)
> +
>  #define VMSTATE_UINT64_2DARRAY(_f, _s, _n1, _n2)                      \
>      VMSTATE_UINT64_2DARRAY_V(_f, _s, _n1, _n2, 0)
>  
> @@ -932,9 +938,6 @@ extern const VMStateInfo vmstate_info_qtailq;
>  #define VMSTATE_INT32_ARRAY(_f, _s, _n)                               \
>      VMSTATE_INT32_ARRAY_V(_f, _s, _n, 0)
>  
> -#define VMSTATE_UINT32_SUB_ARRAY(_f, _s, _start, _num)                \
> -    VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint32, uint32_t)
> -
>  #define VMSTATE_INT64_ARRAY_V(_f, _s, _n, _v)                         \
>      VMSTATE_ARRAY(_f, _s, _n, _v, vmstate_info_int64, int64_t)
>  
> 
