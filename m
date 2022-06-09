Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp285697lfb;
        Thu, 9 Jun 2022 01:47:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTfATiMO644ncoeo/C+4xXTl3KHHSdeVr99wdh27CwTUdqdcggSJyNyqkTvVRwntBHGM/U
X-Received: by 2002:a37:a043:0:b0:6a6:a7c9:7e with SMTP id j64-20020a37a043000000b006a6a7c9007emr19507435qke.339.1654764449365;
        Thu, 09 Jun 2022 01:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654764449; cv=none;
        d=google.com; s=arc-20160816;
        b=Exon5ObRP5G64Ag404LviH7HGg4OInfIvqeo8A4UVnzFCEbq8lNj8WjyWHt2k19TUl
         4wCt8+0JuIAougDDgWhGKa4fItEaClLfaJIfLpRt8PdPRFyg1r72I3OEgmIXGQWCVMBY
         uuvXlYdw4j0AfJqriXD0tL4jilh+hRk1QRV6L0h112U94ChVzxWuXw9OJzxaljN8HHgj
         PWyEPKHBfUAzktXqf2te+tMKzpdPd2EseDwiLxOmWUgPYI/u9MPCpxw8eOqEDTN9i1Ek
         fYdIf2lnzfa06nmwJ9eyzGyRbFh4tdp6ddUdshEcCYyj1rBdB6tsMZRYMk4OhwPnD1/X
         f4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ERxAYTdhpUt8CYXaZyaocUzR0FM58D4CfNk3bbLsjRo=;
        b=dRaiMxXvxnNdxK/8QbqdnOQohu5uMfNY2Ag7UU959zZi6HqcJCdv04TS1qgvj2AtRJ
         V6yUbPf28CKHlHtWkH2Zd24WpkgtWS/uFFJ5mq9bFkSuR8f8I02IL9FOFplak9BAWsiU
         Jmy/G0yfv1Z8UnaLFM8/5qWz6KTGch23qYf3QkPeI42EVYCYup/aK/bUAwyMsETn4Y5b
         5wzCd8s/JuNyBiazF5YtbpIcRdLMNX1PZkG4tsVWwAdI8WciR7jzX2IGJJFGo78FoDt/
         g8hoWTBMs+CW5KcG00Cr7KujT9HtVgLLYtTpVFNat7xIcAwjeg6jLisb3tRsb3Lj2BE0
         A19A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eor+j5sh;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id t7-20020ad45bc7000000b0046afc75273fsi7730813qvt.85.2022.06.09.01.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jun 2022 01:47:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eor+j5sh;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654764449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ERxAYTdhpUt8CYXaZyaocUzR0FM58D4CfNk3bbLsjRo=;
	b=eor+j5sh/O0s1qwhvny51o9on35SEIgLTZuN2+wwAoFbx03en6tgQT8OnXKzlZfKd/xRT3
	4d6o0HWZT9iuH9iGMeME8HCHPE+U3J/hCbrL5An4Y49Bxf0CP4P7h+yDcrBugiBSFho32V
	tOWdSa7q7dPa/4WtDvjVQVjmAk2moiQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-KcmPIF0gNEyhWtDOpcHcZw-1; Thu, 09 Jun 2022 04:47:28 -0400
X-MC-Unique: KcmPIF0gNEyhWtDOpcHcZw-1
Received: by mail-wm1-f70.google.com with SMTP id p42-20020a05600c1daa00b0039c62488f7eso2396669wms.7
        for <alex.bennee@linaro.org>; Thu, 09 Jun 2022 01:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ERxAYTdhpUt8CYXaZyaocUzR0FM58D4CfNk3bbLsjRo=;
        b=Amx5oiv/Dv2MIYhqHKWh7AXLXwZmU5wf+O3nKLAxOOMWNSuF3+elAk/X9pP5AgFS99
         1ZXmq3HsEoW3VBmwyERjm9bA6IpgAGlGagnm0mqcunA62n01YxFMZvMHjTZovBkcc84h
         e5hDZtDpOd/MdH4SJTZNEtjLiaLgcxrX7H+Y5/gRrVTdmnlAK7WF8WJ4UXLxjMtcEcfV
         NaLB4ru6658mXnHFwhREF8x/+ZwqvSN0XakZMI3nL8EReTQueptsdvb4VvsRTJxn4XJ7
         d44f44Mcjt2fKA1GdFM8eVu4GbeHemE/dBYPWtQ1iHebNCBuLaI4wxpAGRvIa7qpKIIG
         Yv0w==
X-Gm-Message-State: AOAM5333b2dOkHBXLwVbx8UqqucGWfNNe5UHetPrkE5bPOx+Bc9537BG
	7rggDvgIGuF59DYy8ZlzbnBw41RdLJo2SEHwl+M58+I8R/dE3qJdWdEZJy1RK1Y+ZBmxWLVJyTB
	RDmXi/zryjrR0Jj5d
X-Received: by 2002:a5d:64c5:0:b0:218:3fcb:d909 with SMTP id f5-20020a5d64c5000000b002183fcbd909mr20161819wri.308.1654764446620;
        Thu, 09 Jun 2022 01:47:26 -0700 (PDT)
X-Received: by 2002:a5d:64c5:0:b0:218:3fcb:d909 with SMTP id f5-20020a5d64c5000000b002183fcbd909mr20161799wri.308.1654764446370;
        Thu, 09 Jun 2022 01:47:26 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-42-115-130.web.vodafone.de. [109.42.115.130])
        by smtp.gmail.com with ESMTPSA id f14-20020a05600c4e8e00b0039c5642e430sm10925811wmq.20.2022.06.09.01.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 01:47:25 -0700 (PDT)
Message-ID: <03a1e04e-45c7-5002-6920-d04e29fd48fd@redhat.com>
Date: Thu, 9 Jun 2022 10:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] disas: Remove libvixl disassembler
To: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefan Weil <sw@weilnetz.de>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
 <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
 <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GSVwsZt8QEIp

On 08/06/2022 17.51, Paolo Bonzini wrote:
> On 6/3/22 19:35, Thomas Huth wrote:
>> On 03/06/2022 19.26, Claudio Fontana wrote:
>>> On 6/3/22 18:42, Thomas Huth wrote:
>>>> The disassembly via capstone should be superiour to our old vixl
>>>> sources nowadays, so let's finally cut this old disassembler out
>>>> of the QEMU source tree.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>
>>> agreed, one thought: at the time I added this thing, I had to add C++ 
>>> compilation support,
>>> maybe something we can now drop if there are no more C++ users?
>>
>> I thought about that, too, but we still have disas/nanomips.cpp left and 
>> the Windows-related files in qga/vss-win32/* .
> 
> That is pure C++ so it does not need the extra complication of "detect 
> whether the C and C++ compiler are ABI-compatible" (typically due to 
> different libasan/libtsan implementation between gcc and clang).  So it's 
> really just nanoMIPS that's left.

Ok, so the next theoretical question is: If we get rid of the nanomips.cpp 
file or convert it to plain C, would we then simplify the code in configure 
again (and forbid C++ for the main QEMU code), or would we rather keep the 
current settings in case we want to re-introduce more C++ code again in the 
future?

  Thomas
