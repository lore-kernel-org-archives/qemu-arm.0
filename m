Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1594924wrq;
        Wed, 13 Jun 2018 22:40:12 -0700 (PDT)
X-Received: by 2002:a17:902:7c16:: with SMTP id x22-v6mr1321300pll.77.1528954812500;
        Wed, 13 Jun 2018 22:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528954812; cv=none;
        d=google.com; s=arc-20160816;
        b=bSWFskgHhsWE16jq/olHkcHvT+7gOHWXc7hGiAy/pMupGIGvKPzSUjOJBmbhdj+ye4
         z3jcUyXb7Yy8+HMSdEYn5Js1U7IzgWkDnB/9zmyQ0CfCDBAcoZpkj10MizSHPgO/Z5gy
         H3DXpCOkVWORyD4WURWILRt7Vgc91Lb1Yr6bSX1Oupx2VCy3nZdKYslcBX/fE6bNEvBF
         B5UOQyrRQFy+Tr2HxD9QJ6/OWhSn9ObryI6MrNHyyAVvqz7mOOV6x+Pext4zSf7MHX7g
         Dou0XW4JG7zUar95AsxBGXSXwniDtlZDosZtK+/NGQ4xUtbZ1ZnNDa21JcKga+YvGu0/
         8F/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=Qbu5xO9Fm+TkT7BM1MCN9OQ8lHzR88b679JfD3VOOp4=;
        b=C+rC3JBnYl2oB/ZrDNPPts2XGf9RFcbVbDQmtWrZPrUWjAi+AXFtFMrkaUBU+XhBbv
         4VSLE5d/7GuDGOQn0NlhIMN/G0qzC+vfJRcG064vNogQm/j0XeWz8fbuyzYpfNYGygwT
         yFEcnFk2zTmZCYulzdqxTZ6GlS0l8BNq710p7Ic+Ap+XNl88qFKu+5/QWG+qnd9gpwVJ
         Orbd+pd7g3IXD6XU4FJigSOp4sQnrviX+DuOnFxnr3ofnLtrVYkFVrljmeRfuQobzk7s
         u9NXMxprZfw22ClxoL+QHCqsJq672BDrwiGZvmvZryMrGcm6ISxE3xIKzZtlG7h1OBy+
         6Glg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YdXK02sc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g3-v6sor1076538pgc.304.2018.06.13.22.40.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Jun 2018 22:40:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YdXK02sc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qbu5xO9Fm+TkT7BM1MCN9OQ8lHzR88b679JfD3VOOp4=;
        b=YdXK02scBBVsy8sus1YS/eKZb1ByGWbm+Ldexylm/r6tW8PV1conw+G0qNgAU1PpvV
         ZCQ9qhZly+ma4NMGqC0dtPsN8nstMbt3CjWhSCZv9eBGuvTN2zmspuuirP3kmsfjBNHB
         sgu0jDCTS6FPykmpbqTREgjwtoYXCLGt9KtfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qbu5xO9Fm+TkT7BM1MCN9OQ8lHzR88b679JfD3VOOp4=;
        b=mJwB0mN2cSQwwd06swXp0W/GZJ9iTu3JBoTwudpDqeqiDFfV8jiaEGM+JSy0UHtgV7
         uTv87dIyGS7nDG6yQFO+e5RBHR6Ojju1K1w+xv94v8t/YgqxWJ6Xf5n5CXk/T+XFv+yU
         urvT2IxeXRdmkbLnffDXR1jtlerKH0KnKXA4pWusy3iKINkMOBngEdfDhW9p+7e2z2uU
         eJI0Bzw7mwk32nnYjnmz8Oen5wJRubGJMsdBlFhPIl69+cuy10p4Td0d8H6pMbASwz2M
         ODgaM8jnlLxjxOFFzd/6ZbDKPMT7Y+kh2cIbRJ8GvbfLXTDpr9McuZnHucAshllprJkI
         ovew==
X-Gm-Message-State: APt69E0I/atBYnhz3n+Q4J+xhlWe1FWzIzDOEpubvk+KOOel5gfthfmZ
	nblJOvUFlxVO34WCLWVcnMPlBX1S
X-Google-Smtp-Source: ADUXVKJ/M+lIwRHPjrRixB3ar2nyxwC9v9KhiBb5wgQRD9fs/mfCkzXWsjK4cp+VN9afaOgITALZiA==
X-Received: by 2002:a65:6147:: with SMTP id o7-v6mr1014368pgv.163.1528954812023;
        Wed, 13 Jun 2018 22:40:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id t3-v6sm7188476pfk.161.2018.06.13.22.40.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Jun 2018 22:40:11 -0700 (PDT)
Subject: Re: [RISU PATCH v3 01/22] risu_reginfo_aarch64: include signal.h for
 FPSIMD_MAGIC
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cf445619-d1dc-6b91-37f2-5dcaa7aa3c23@linaro.org>
Date: Wed, 13 Jun 2018 19:40:07 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 6CUMQ2eqVe4q

On 06/13/2018 02:55 AM, Alex Bennée wrote:
> Building with the Bionic Beaver cross compilers fails which probably
> means we were getting this as a side effect before. Include the
> correct header to get at these bits.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  risu_reginfo_aarch64.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
