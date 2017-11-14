Received: by 10.223.150.237 with SMTP id u100csp3357901wrb;
        Tue, 14 Nov 2017 00:46:18 -0800 (PST)
X-Received: by 10.80.180.18 with SMTP id b18mr16606172edh.136.1510649178899;
        Tue, 14 Nov 2017 00:46:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510649178; cv=none;
        d=google.com; s=arc-20160816;
        b=V+5HMPHnjujBOEx3RaH5scFVuhIfn4H5a0Kl2503S7PirCqCXFFvsb3iHnLmYdg9Pd
         uR+cxz2qzbGcwPhBU4UQQmZf0iQPLgfzg0pKZACEDbnoGOxkkAz29nHy1R8jsyHfaJKo
         rkWd7kLH8eMUQhADT2bWiHC95fMTIC3oG00u67ki02K2h2tI+qpLYlODwIAw0lbQqhmL
         m9odrQquNQD7LNTkIssZj96ShGb5sfaTxzbRB7h4X06apfMUeOYtaji3lUTy0CMecYrO
         Dvg6oRbLkDBi3N5JCjWNmxiYXu0LcX08munQe+aIKrfP//+oJI4Qdvkp8qRODGo4T1/K
         FO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=5t80mgUACI9T4vm3ZRTcLfNt7ozuAd5w8NyaPpafE7o=;
        b=i2O4XKX+GsUeSm8smTvCmPTg7sSmr/yWq+TRIJSMLluLUb4psktLOOiZZZ3IWU0VJV
         FGgrQlcDTOJGSgB5AtJb2ZublQl479jiIn0oAW2MZUj19/bX5QLUMVo26kZuWfsaQdq8
         RzHODAeHhQHUBSWs/1DtfcAs66IlQNT+VGlg2BeLBsYHip9XHXxBu50OuLV3VCDHdBaq
         i6EoFOUOmNlGyLtB+gronPRfSgj2OjH5g/bLM6iLVpycgXN+LujAkl3DbIILavM+duvq
         K/c7BFfDP4D9eTH4+JCN6lPLS0aIRjILN1NlTVBZLRWAUuh1oTmO5/Wc8DXyiseX+1rB
         CIAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ibzTIbz3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v10sor10996819edf.47.2017.11.14.00.46.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2017 00:46:18 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ibzTIbz3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5t80mgUACI9T4vm3ZRTcLfNt7ozuAd5w8NyaPpafE7o=;
        b=ibzTIbz3RwAq3Key97/JKtZqd8CUyYPyMSaC4+dPCTvNSPUvnOU9spYgZe93YcQM8b
         fssdTNsbgkCKnTFOj3OmQCVXHpFwMJa9FvXUSDQQo9pF4IYGiY2TLQAP1Krgjczh0SkP
         U2SP0YwiZvrFvFGi+pmPGzoY6SKnYoeKlKbKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5t80mgUACI9T4vm3ZRTcLfNt7ozuAd5w8NyaPpafE7o=;
        b=YJID1CyQW1pf8EwnucJeeEAzNkORS9lSELIA3YO8HofqEgcr0APpW7JYHoyzz+fH41
         w7ddBGCLq7tyeHRs65Pfts3gxb6gyvLV90gPFe4ABjOg0AorgjWWOqeB+cPQP4brSGyz
         RiobG9jrr8TsdPEoKHG6p2nhEZ07lou2waevSWB3ezktI4SOuYSY87jWzKsvQQx/C7Qn
         5v7GtdyO7YpEvom4Cc26wYrw6ME14CXq5ZOMLf8JWSogCZYfCA1NQbF/MfV0LVjzrXk5
         YH4uH/k/a12V2y2gsGOEuO09ScItBO8LiL1Ggkiwnuze4Km/NFSFZyJkRsZupUfwojYn
         0kxw==
X-Gm-Message-State: AJaThX4+jwUafaMItUbXlcb5koo81wF7XJ1e2/IveB2ov6FSY08N9shV
	RztMwNrOEXIWyWWL2hAWV+GOJqZ2D9Bx5Q==
X-Google-Smtp-Source: AGs4zMYPrxVS3yop5GaRqSf3V2tGJ8BdXiqZq/A8ryGyI9AmLpEKaKU3ujPd1EUWUPNpGgaNf4YHQw==
X-Received: by 10.80.186.29 with SMTP id g29mr3435261edc.206.1510649178654;
        Tue, 14 Nov 2017 00:46:18 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (176.red-213-99-135.dynamicip.rima-tde.net. [213.99.135.176])
        by smtp.gmail.com with ESMTPSA id s6sm14549147edc.2.2017.11.14.00.46.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Nov 2017 00:46:17 -0800 (PST)
Subject: Re: [Qemu-arm] [PATCH v1 06/12] target/arm: Decode aa32 armv8.1 three
 same
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171004184325.24157-1-richard.henderson@linaro.org>
 <20171004184325.24157-7-richard.henderson@linaro.org>
 <87shdi9l05.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8bb9454-bdbb-34ce-edb6-df31002fbb9a@linaro.org>
Date: Tue, 14 Nov 2017 09:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <87shdi9l05.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /FN7pC4/6e4P

On 11/13/2017 05:55 PM, Alex Bennée wrote:
>> +        case NEON_3R_VFM_VQRDMLSH:
>> +            if (!u) {
>> +                /* VFM, VFMS */
>> +                if ((5 & (1 << size)) == 0) {
>> +                    return 1;
>> +                }
>> +                break;
>> +            }
>> +            /* VQRDMLSH */
>> +            switch (size) {
>> +            case 1:
>> +                fn_gvec_ptr = gen_helper_gvec_qrdmlsh_s16;
>> +                break;
>> +            case 2:
>> +                fn_gvec_ptr = gen_helper_gvec_qrdmlsh_s32;
>> +                break;
>> +            default:
>> +                return 1;
>> +            }
>> +            goto do_vqrdmlx;
> Could we not take the opportunity to re-factor out the common bit rather
> than make this mega 

What, specifically, did you have in mind?


r~
