Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp53752ejb;
        Wed, 4 Jan 2023 20:49:21 -0800 (PST)
X-Received: by 2002:a62:1a51:0:b0:581:d46a:343a with SMTP id a78-20020a621a51000000b00581d46a343amr23280746pfa.18.1672894161665;
        Wed, 04 Jan 2023 20:49:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672894161; cv=none;
        d=google.com; s=arc-20160816;
        b=dq/cGhyelzKpS1lY4j3XQhzkca9WlBqro8L5JLgLNJ0PJPEtuIkcPEZGrnQyNX4v3F
         ISTLahgCJ4uqV7bgq5b6xfHM4EuiEGkrOhUCWziGbrnLqNjWodVnqXGhdN0bBNMzecvn
         /4nQ12VB2QK3926yaVOoQ1z4JYqSFJttnKQDcSLbGfPFQnumbmo5s2dAbRgLncx2f1hx
         WIRNm+tW6hNhfwyQuA/SRFInKPTWNRhzhtuOi2j7XMB6ndvtefiKPW0mvV+jZojT7HX5
         smUexGY0R/HvKRBvjQK+Sps9JgvtkwScQrqm8l4hQsmgqvFF6LOw6Vn86Z7u+XBIjoaT
         v4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=276j1AFIC9ANWMWvtJ8vawwrLxA7CpYnWoPkO5FDqYo=;
        b=t6c/Q2SEaNPOMUGjXOF7jIT6XwpPBX/b3ge+Hl/rCFQH8lNrWbE/2bcYIu1Ai3fX4K
         Thhqlw7+iiy/0JevRN38uJmhEXwbHNNB2Vn6L+xuQ+ob+tWCryLXXKY+WDvEAKdvCkTP
         ta3Pk6+YxTw3SuAThQx4hv+/gWID1pnrEf/xX6i5E1tdz8rQZ/gj9I9C1dTBtMZBER+9
         tuOUbWJpEylADfWP/mNLnRQqoJuS55xyl7tZMA+dPbneQTfzLfTYZVSwoCBcB1O+Bcov
         VG/DpKFtpiye9pq9w7YdqN0cb2K3jzT6EYQ6gHR2r6N7a3hkgcUn13PKrFZe7zzYfP2J
         1FIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jukOdnor;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a19-20020a056a001d1300b00576d6945745sor14190167pfx.92.2023.01.04.20.49.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 20:49:21 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jukOdnor;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=276j1AFIC9ANWMWvtJ8vawwrLxA7CpYnWoPkO5FDqYo=;
        b=jukOdnorvN4D6BHRWtW09jhZhifUwTp0saRdOUw02NwhgvcCNwCurSiGVJszen5RJ4
         SR+Y2U4wRagyB8V1AChoFrtTWed2uiRuyYOCBLChMtVDt3iJCu+5wmnw7ChLGpEK8ue6
         JU9+Eh/5YeqSCxr5FJL2KhT3R+yvf+qagLaNk17btdoSFEajBmh78qdESOYJOQOb4PX0
         QK2QHOhtTOmUPylcfUAu1iAO92VZOhnXQMY7U6ZCr7h5vckcGZhhRqLKlen7PjwCa8x0
         vp8yJJZWBINvgEdH+P2220LpAkueMwWNN09SomLPoshliBCQtKSzsYbJ3l85+w5TxJzV
         FqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=276j1AFIC9ANWMWvtJ8vawwrLxA7CpYnWoPkO5FDqYo=;
        b=wvNTazsUFqtV7vEUOoC9dv6Zn1bLBd9OkPxPKbIWta/SlhF2m/fFl7kOML1DzBH6c7
         /TQE9/Zo5fc/cXRgV84b72xWlcy7vFCqIjoSrPDBNBcGKtyju9wWGibu21GoAG4S8luG
         E3H5D2sqEh9cALuHw9M2BMPYXsav1CZan+IVenNxD7Ffwl1NDBL8eQV2Lgyk79VUC92D
         JcaKdZfIdlyTblbQNCK05VhC9KDjU6H/E4TeK1RYUtHE78COiuR5zE20HN3+sEPNEr4p
         DIafgbzgDd6q371aqG1ScOPaiEg2cxO5HYW7XOgH6DCER/dnX/8kCiGOCofXqGOMdd3b
         AHqw==
X-Gm-Message-State: AFqh2krLjb8jkfAySkL42VtFEle0izzRzm3YEqFO5u2MwsJSYy5+Z4FP
	qC+8Q8Yz4IxMbuWrDCUX77EiN73H
X-Google-Smtp-Source: AMrXdXvIqfJQEC0YVY/Tl+oOFFs2RyWWYEpp7GFZv3jy3pZQmCrv3x9plnACkC0HgcdA3dwpzFSBXw==
X-Received: by 2002:a05:6a00:1ca1:b0:57f:7d69:8d95 with SMTP id y33-20020a056a001ca100b0057f7d698d95mr51829287pfw.21.1672894161221;
        Wed, 04 Jan 2023 20:49:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee? ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
        by smtp.gmail.com with ESMTPSA id h4-20020aa79f44000000b00572c12a1e91sm2051964pfr.48.2023.01.04.20.49.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 20:49:20 -0800 (PST)
Message-ID: <cd763ea1-36a8-c399-c3ec-ea887637206d@linaro.org>
Date: Wed, 4 Jan 2023 20:49:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 15/27] target/arm: move helpers to tcg/
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-16-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-16-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: LaH/GP8Hmpzv

On 1/4/23 13:58, Fabiano Rosas wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> Included {sme,mve}_helper.c and left a couple of files behind that
> still have non-tcg code to be removed from them:
> 
> helper.c (and op_helper.h as a dep)
> vfp_helper.c
> 
> Originally from:
> https://lore.kernel.org/r/20210416162824.25131-3-cfontana@suse.de
> [RFC v14 02/80] target/arm: move helpers to tcg/
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
