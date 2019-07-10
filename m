Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp4591657wrb;
        Wed, 10 Jul 2019 00:14:32 -0700 (PDT)
X-Received: by 2002:a05:6830:11cc:: with SMTP id v12mr21696446otq.136.1562742872422;
        Wed, 10 Jul 2019 00:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562742872; cv=none;
        d=google.com; s=arc-20160816;
        b=suZ9VTAso6EK39yTD8y0VOl68N6tdRL71K+QH/+9qN56zGuPk1G7ujFp6sAVo5lxln
         w98MO9+7iK0BUEOt7A/LlqBExctU3fdeH3Z9vhtmtiIqoeznINCXS8Wmo4SFqgGYp68Y
         /J8cjY1fpmLDujxzRiTp+h+Tfxqf25IBDJqtkocthKUTZ/MHzvlZ6SZzFoEIYiLOa/Vw
         EoOnVNIYSs0nOrEc6COomCrPFTn/cGfdnkffrw991XzCtozxxQH2XSRyh9nI/qN01P++
         ByECn6S+OGPGQ79XxXsJI1fvSI8OBdBnUoPbCmha9S/FEcqD+4eJUVjDNHlb7TkuJrr7
         rbAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=h5S9zXKt2KZUpFw1CUz/xrLyFiXFBrqUIN37igt1/Ec=;
        b=mA+QW/AN9U1uCLbB6+QyndozsuZhXNSP/9TR5oy9r8fsTlEFLnNNp0Pwdod+P1Q/RR
         JnsEWCxUy15LRnmMcE1GJTSkFDrTNH65MCr27cO9kFOzXRtJZpLAnfPkTHwcUAVqHHs+
         LxnokpbaQj61++kEFk97QG/gQXmedz6ThuaKhIwA7khJEUt8NQWBAHnjTsC7kvCYh+iR
         stTEajFCaUiBGqlgJvM2Aj6g5SAl5yf7+OOquN4AqSx6M9imubY07fHCFYiQMnPfXKDF
         0cZY/haMUYNH5PvKC9+4J19QmLjFjTLaEcdZLxf3VfJcS+p7LjuE6NGzwlewB8GSfnEh
         YLAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H83HKWhI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r23sor87632otd.21.2019.07.10.00.14.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jul 2019 00:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H83HKWhI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h5S9zXKt2KZUpFw1CUz/xrLyFiXFBrqUIN37igt1/Ec=;
        b=H83HKWhIRijbLJo31EI5qu0ud6sr5wOd2RdlH94W2msrE/vb7h1Kpiu0Ynn62Kpn8q
         unkh3iBPE0JEa6rtA8dWuNwwOU1B5dfv9DM/cca0mnMePPNJ5eRyjIZ686lplVZ0/SnA
         cEXNfRPdpKW/pmVb6P1eH15+uhYZQIZbtsdpqAwL4Rwvd94e5uavkmPmXokXC+YyZWRU
         RvFPY1ytpel4i70ov5M64XiFOhAXOClozrd/gjt2m3MnEg9qm8HzJTLF5i0I1F430of0
         lPBycSXlNECNBu1ksMvooXcDifAFNs+gBWKVuVPqN36boiwACLAxFlKpCre1Q9McUBp7
         dRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h5S9zXKt2KZUpFw1CUz/xrLyFiXFBrqUIN37igt1/Ec=;
        b=ioZC9l1IEQEj7BbniyLccx2TnuhkqavMLshPsMiXVmJtOGBQpJZOSn8qlyRxXZ9i40
         ia1aHjcC68veJ26BwmfijfANFP0YkHpLl7u38elsXd5gYUCrEePPqlDauWEpPkI/sG/m
         Pl/bDuJ0ubBcJsaQ01MGCQ6dQpfR3/byi3zefVqC0ybv+5JOVwu3mFcRJcFrQBd4CZ2B
         4JuByhlCA4aftmbc+cZiOXjBLi1ISFRjfn0HrShXHP47cNo8IUysgbJbdF9gBuejQfJQ
         SIgrIsAY5OZCjfpscM96Rwhx2mOc1X/iBW0eR9uoBq/4r16pVWZL5R9XxqcghfoWFd6q
         Jx9Q==
X-Gm-Message-State: APjAAAWKGLR/cmdSrADGcwwNw7sfJm+jWOkD+3LlSkAsWsBT2ThgRCDT
	C4t46vUoB2ycwI0fAP3SdgQ+Ac/y
X-Google-Smtp-Source: APXvYqw+x2+k/dfy1dgX97DTyXtqPJy4dECE0GVAhrop20WK33O+1tkYhmuIYllKBQ6y2u7wXzssDw==
X-Received: by 2002:a9d:664c:: with SMTP id q12mr21149674otm.175.1562742871937;
        Wed, 10 Jul 2019 00:14:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.43.94] ([172.56.7.82])
        by smtp.gmail.com with ESMTPSA id r130sm556344oib.41.2019.07.10.00.14.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 00:14:31 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 4/5] gdbstub: add some notes to the header
 comment
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org
References: <20190705160421.19015-1-alex.bennee@linaro.org>
 <20190705160421.19015-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <aec9314d-c1e9-2521-6170-d8ce6be97a97@linaro.org>
Date: Wed, 10 Jul 2019 09:14:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190705160421.19015-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: U0n9SiwHrz34

On 7/5/19 6:04 PM, Alex Bennée wrote:
> Add a link to the remote protocol spec and an SPDX tag.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  gdbstub.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 8618e34311..ea3349d1aa 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1,6 +1,10 @@
>  /*
>   * gdb server stub
>   *
> + * This implements a subset of the remote protocol as described in:
> + *
> + *   https://sourceware.org/gdb/onlinedocs/gdb/Remote-Protocol.html
> + *

Ack.

>   * Copyright (c) 2003-2005 Fabrice Bellard
>   *
>   * This library is free software; you can redistribute it and/or
> @@ -15,6 +19,8 @@
>   *
>   * You should have received a copy of the GNU Lesser General Public
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later

Nack.  The text is for the LGPL.


r~
