Received: by 10.28.71.155 with SMTP id m27csp172748wmi;
        Thu, 5 Apr 2018 18:23:10 -0700 (PDT)
X-Received: by 10.98.133.139 with SMTP id m11mr18757966pfk.49.1522977790785;
        Thu, 05 Apr 2018 18:23:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522977790; cv=none;
        d=google.com; s=arc-20160816;
        b=AcRtgZatoabpOs4KALiYIZl6N5y+vJurUs80RLRApLYo834obvo7OJtDNo8/2vdGQs
         A9T/BjbmHll5fex1LWStvqB+npMi5uWCBtNxu9VPurJLTJ8dXAado+iw1s65xprrbhh9
         gr+Mkk2I8TB5CD71D43U4sEq8SSYvdgqt4mMXlpcVpFzG2ACD1nj9f1GuZFLMaYplPdP
         dB/VyoQSd53tK5U++IraBbknJAPgIK6oZXP544bRBosffWf7mLxialur7QuKh2Fu18Jq
         8xLCNuZL0wavDncyT6Rxz4CddLN4yRBcPfFVmLNxVC1imMAPkMDjQQeLiGXTElI68S+/
         f9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=aidrb9JyASLr2hvlrgcliqCEwQ8tHG8rAL9aBJkMLWg=;
        b=cmdTT9VVF8NDM73dsnNH+cvAcuoS0lh2RuOszsctcUc295h1JEFLCToh7PqHAtv2k1
         P+VlFz9ZpZ4vy7gwJMy56oAKDkDKkxWnAiIAk2U2eDzQzIZpetbsQ+ASuKJjKz7Lc6Z3
         /wAywUJQhTwpPKXn+GVRm1zCQ5RP+iOkenXlu50NouFtAqus42j6J91pWtlaDDlqIfVc
         Ffa7yx5Q/E8Gg6Qito6nDC9VBk9GZt1hXZ7Y27/VDQpT1i8PXJaLPdkg3K6WapKgagQ3
         bOZRRsrmaHp7IINvO26GXl/7oblfk5SqK8HqqWM7kOusAvJUDm47GMOSStn6giQhfPu3
         AbxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W2+2YAdq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y2-v6sor3441158pli.110.2018.04.05.18.23.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Apr 2018 18:23:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W2+2YAdq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aidrb9JyASLr2hvlrgcliqCEwQ8tHG8rAL9aBJkMLWg=;
        b=W2+2YAdqqnFve4Q7FaeJ7R915Y8/W4p9t0N2WXFRnAnxBGItdRiEdjUHALc9oGVXKa
         IQ8DGnnpQnu9A/1XpKdeizXsZEAYXxO4sWYuM2FSM4ou0Fq43UdydfJ+QJAj6bbyP8Zj
         a8piEMOcPVkJmQvWOxiciIvUbwWOj+g4j2+MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aidrb9JyASLr2hvlrgcliqCEwQ8tHG8rAL9aBJkMLWg=;
        b=gQtfHVuo36bbWQa0rsHXtvpjjVYaxvDn9oCX2bcWZSmbO7rDFbAvr4Q+v7HclirFpJ
         jE3BtZOLNlcQV8d8T1l25715Dfo1ZO2Pa5zKLCO0b3ZYb23O0yhFQz/7hqAaBac2sTpU
         kpZFAq55oRzMbFwA2CXk4LElbUptxhnmCed4Dx2S3SUIui7YiqFJMRfU0N4Rr7G1Xwzx
         8szliLQChMpIB5ufv5ijlDdXtDLw+yeFl4QU4QPVV0snxaforK72sbVP0NnRRvYiyPAF
         hKak4LMncYx6YCBYQKcMhCBDrx/soetNF7Wam3lTJut49BRCOp3H/WojhhHmWVV3X4ze
         8ZUQ==
X-Gm-Message-State: AElRT7EOmUj4RVuVAUce9duy6zT1IvW8yrjBtn4DKfL4Omfco6xm2xDJ
	pxJ7lNZAASVFc9XVISXXepW1V/NqX1XYlg==
X-Google-Smtp-Source: AIpwx4+NNmmX8ABvD+9HGUPnv+RSnf95w+I3bZv3L7Ji/Wh5fvmlGDx7C5CCsN4VjOXeB9uaQ/Fz+A==
X-Received: by 2002:a17:902:7804:: with SMTP id p4-v6mr25451192pll.17.1522977790183;
        Thu, 05 Apr 2018 18:23:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (2001-44b8-2176-c800-8cc6-2630-7d99-5ef1.static.ipv6.internode.on.net. [2001:44b8:2176:c800:8cc6:2630:7d99:5ef1])
        by smtp.gmail.com with ESMTPSA id f12sm11442424pfn.47.2018.04.05.18.23.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Apr 2018 18:23:09 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 05/67] target/arm: Implement SVE load
 vector/predicate
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20180217182323.25885-1-richard.henderson@linaro.org>
 <20180217182323.25885-6-richard.henderson@linaro.org>
 <87y3i4d4jv.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <abef9b59-9f7e-8871-7d36-67c7612457ed@linaro.org>
Date: Fri, 6 Apr 2018 11:23:03 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87y3i4d4jv.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 7NtdXn3R+6vH

On 04/03/2018 07:26 PM, Alex Bennée wrote:
> You don't use it yet but probably worth a:
> 
> static inline int ffr_full_reg_offset(DisasContext *s)
> {
>     return pred_full_reg_offset(s, 16);
> }
> 
> here when you get to it to avoid the magic 16 appearing in the main code.

Hum.  Most of the places that ffr is touched is in sve.decode.
I could certainly enhance the grammar there to allow a symbol
there instead of a number.

But I don't think treating ffr differently from a regular pr
register, as above, is a good idea.  At best I would use

  pred_full_reg_offset(s, FFR_PRED_NUM)

or something.


r~
