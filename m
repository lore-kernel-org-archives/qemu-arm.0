Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2160443njd;
        Mon, 21 Apr 2025 23:41:16 -0700 (PDT)
X-Received: by 2002:a05:6000:2408:b0:39a:ca0b:e7c7 with SMTP id ffacd0b85a97d-39efbacdea0mr10736297f8f.36.1745304076654;
        Mon, 21 Apr 2025 23:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745304076; cv=none;
        d=google.com; s=arc-20240605;
        b=c2gdRl3AJkC1rJwOunWq8yvgZvnKySkRask0d++p6l64awNG8ao9UGLDrU7jFeZ1T7
         BeqD19HQpoe4L+FNyTSl1jPt067zJddwVf2tdYJWfOn3zb9jlEqj4wafNOsuk3tEyyin
         N6H7bA2vNNLW89+vnjPCFPyhQQjRqbQQkp4eyyRMLUkGwOwPaUt4Mt+hG1bZMKCOYXNO
         w5wkHZek8X2sSIdG/YNSZRbxAvNJuSXS0WDzGfkwt6ydo0SSFOk8ZKmaOG4Kl9+NukFL
         Ozb8x7gKXfBtDnd8LFNoEqjxk9VCyEBPqTTDflCZ4uwvddUrebfomkzSnk/o74mteACI
         dg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9rNr4hys0zfLgUPvngT1iGKY6bsdEbk77gsdKeXGZdI=;
        fh=6EuZEnKHxIzAX9MCUkFbfMZJVxTEZo1gTpHOklAu9BU=;
        b=B+su/U+g5J+C5Td6BwD3CCoZDPMmwfhtgW83RnfhkJTGWNkogThO2YdPkOHAebK+TH
         3vDPeuqmmbIOJOPCa8N468LipCasMopJzx5eaa0fOOxsyLapL4cl3zqWHsIz+ZhichbH
         T9+xi/DNhO/Yppe6cvUwbvP4Uq26abqwjXodOTeeMsyjHnYL2+sHIrLHjJe39c2v2lGR
         heYanSi26j//lAtucfVA8CO5MhRSfc+tMUKF/Yne/JL5O8TW0LJmCyytJbASCRyLE+2+
         lJz4t7UrYIestBUsL09qy82OMhaBw03q8XdZe8sp2Q9TB7DCBDtTTIzT0eQzXzDnGy5b
         JpfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ypr/oLs8";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-44069946f57sor27302265e9.1.2025.04.21.23.41.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Apr 2025 23:41:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ypr/oLs8";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745304076; x=1745908876; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9rNr4hys0zfLgUPvngT1iGKY6bsdEbk77gsdKeXGZdI=;
        b=ypr/oLs8T4wUmwdMnku+FVYFKB33ICzz8oJVHXXS6W2UFPydrjdYUrrgkrEdQiEcra
         L/t+VZzABwuWHdYUqDkJZiYQTdlMk1HTiUQX8agWV6l3X+SPPXxW5Ewak//BF+Dfj/lh
         GaWFKcYWUvb2rInla9nCw914+iLqwKixbG8A+bTgDc6nb9irLwA8lPq6+pU3k8lIOWcz
         NIAWWF1JYMsYpeQhJXjKrod9rhuHOjAouWt6apqdlcE5jK4ZwVPMGxAHgX5QglJwdVnz
         HSpA9AKcm543h1+IDDO/hDRHlGDsycF55NAVWJyqy4oOsrMoFjMJhtfsUq8fMtEJzstB
         fosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745304076; x=1745908876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9rNr4hys0zfLgUPvngT1iGKY6bsdEbk77gsdKeXGZdI=;
        b=qKjt3kfQxtNnYISKz+rMcFrjSxz2OEEiz/2xvvJyuZnAIQGYdHLWCgKx9kwTISNhYI
         kIS4bej5zNj1j7zk9XLq2pemca+fj4JsWss0TNPJhmaoUGw3+Q/uTF2rzNdI/ZVtOQdc
         g/P7awLPXjBH99mg8lQiwVZ+Ck2vubCxLZPhT4aqfMBE+XJGj3b9ZE8dzniie3CFvau4
         rkF+hMSgICb/lGrxZlLCihM9YSXVlii/VCN34EKu23blCaXOx9riPgj5J07QqrV69r86
         c46VdMcLWEaUGTz3zb7hxk6Sz0oD32XNdugRA9GkgtqL7Sx6wSrw+YmoW7zfe3+bcV73
         ijfA==
X-Gm-Message-State: AOJu0Yzd7KYpMqWXVI+4YfFe1RrCWRw+x4sPLcOaBUYTv313FR4BYBUz
	zkej6RrjtaqIhidxw4dOkBVKVXXUmHWs8Me0idntrVroc462zHeDxVj0iWspGycSrg==
X-Gm-Gg: ASbGncvceNm9V8/47iDOTLJ1JR2Gl0StmmOsOsw8ZvWX9MQmvshgcJkOBJtbigXFYL4
	IJiAcKtaeEFCaNv8ICKVOc+uNr9XhS6tZChgsR+f1UaVUbwAPR8mlnVticwdGotHKRF2hj7TOwc
	AslwvgPyk3f5QaOv5jMdRvad6vnioJg8vMD/Z/plJo1JVV+OEaShk1GRIIqWT+BgcsySk6h/LWM
	Q3XFvIGmeuICe5WZUb7AU+DpdPOqioa3EdbS93Mx5XybYxlqo3ZGEOIzPkrPPI9mSyGP305A1ZF
	lsLb/4Ji1x+ibZh+nst4xPCgH36020wv8cGHjKavjPm35SSE/tbVUfsB1rmgmsRMABftKBV6Q45
	b2eDPB5gcUYD2IV0uzhQ=
X-Google-Smtp-Source: AGHT+IG4ZtK+iwu9U6jyXYYM80D4F6KIt2i04bTCGsufr5gmlfhiFb1M0CVJcFRT/FLpc9QsD6nv2A==
X-Received: by 2002:a05:600c:3485:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-4406ab7b67bmr113462525e9.6.1745304075976;
        Mon, 21 Apr 2025 23:41:15 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c80174dsm7224665e9.0.2025.04.21.23.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 23:41:15 -0700 (PDT)
Message-ID: <415b113f-000a-4744-8ace-49ed0974d1fd@linaro.org>
Date: Tue, 22 Apr 2025 08:41:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/20] system/vl.c: Fix type conflict of GLib function
 pointers
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
 <e9a50b76c54cc64fc9985186f0aef3fcc2024da6.1745295397.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e9a50b76c54cc64fc9985186f0aef3fcc2024da6.1745295397.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4TchU1mF4sY+

On 22/4/25 07:27, Kohei Tokunaga wrote:
> On Emscripten, function pointer casts can result in runtime failures due to
> strict function signature checks. This affects the use of g_list_sort and
> g_slist_sort, which internally perform function pointer casts that are not
> supported by Emscripten. To avoid these issues, g_list_sort_with_data and
> g_slist_sort_with_data should be used instead, as they do not rely on
> function pointer casting.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   system/vl.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
