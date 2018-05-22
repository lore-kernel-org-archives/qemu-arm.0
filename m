Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1691508wme;
        Tue, 22 May 2018 09:15:14 -0700 (PDT)
X-Received: by 2002:a17:902:bd84:: with SMTP id q4-v6mr25890676pls.254.1527005714488;
        Tue, 22 May 2018 09:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527005714; cv=none;
        d=google.com; s=arc-20160816;
        b=mHNCpNtRc1iNsVmauGyt8rHZ+i+oDF2qnBRqq0/CgoU9Xr9K9y1o3RU3T5x1G6XPRs
         kvumZ3/f8glGXJJI7HFK7pMkPIEs9MOeF+/qMlc+DcJQZgk6KnXfjY9aAO/s/EN2LEn8
         oaRdTEdigouE1Y5JL50NqIOUpP+oO0GR4E8a9X97ALr9BHFD6RB34vvizdiG01kXFPuf
         Rq6Mj0mYBetObFtEzpvnJ3cZ4hAVmIU6GFfdhBmR+byPv3KfR1mg0JP5I+A6eLHgp0i8
         8chCm2iHv7KcpG+/ul6bJX9RLmj7ueWOFFNapLNurdgwrTjYHbSM1hFjrnYtAgc2SlOv
         VBbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:sender:dkim-signature:arc-authentication-results;
        bh=b0cvlkdVUjtCQ6ukNC7No72aQPtsZYs+sXhJ7bmxnHs=;
        b=h/POYd1KlRQBFXKe2kzidPswbikVvdEkjrk0p+gQDM294IDghVqktQXhygGLIOMfCh
         92DuBluOOU7M3cKfLd+GtpdAUR3a8khspqYePhM0c/vPXmF1Mt+6jpNyY6fTENjJoo1N
         avLmZ96Yk5af6Q03fvc0XRFUPQZxTq2Ar76GKuYcwxn6JJ8DoQQPh9vG3beVfnz7FnU7
         qgfyXB7c0x7BQW7GxPliEbqtKECZZMKEHr9yux2EXTdn0G8ulwLCQYxPf/fmlzDuiHKb
         bHdXtSmX6bOTp3Ywiw29bjmQgj5U1XE1Avi2Upe0/rSx7W/d7mNNQ2W0LFOvS4Iw72e8
         SDsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=m5JKM2Vj;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d7-v6sor1997442pgc.354.2018.05.22.09.15.14
        (Google Transport Security);
        Tue, 22 May 2018 09:15:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=m5JKM2Vj;
       spf=pass (google.com: domain of rth7680@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=rth7680@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b0cvlkdVUjtCQ6ukNC7No72aQPtsZYs+sXhJ7bmxnHs=;
        b=m5JKM2Vjqy4H+HFhp1z2L1QWCJP1P2s8fROP0iZCged1omKVdaw86AMIPyE6eX3pJd
         usQduOvyj/xmo6QmSz9Wa4SELokrE6+hK8Bkt99MynaV1eDn0Uh8NaY8NYID0he3Qz37
         ++0uaxtIwNnmu0fQNiDNe/KPqfjMvrcZnGebstI4DeMwYRR/uYsntliDxRuZiZhsODA1
         vaYyGmR7lCVMuCmXJYSSkkXEVeG9kmraNQGWNuvZRjyQ8IZlzEzr6qiWApaKrI1+ZVHm
         jQ7rYz7U4Fpc+hkp/2slyc0cc1q2YS1Z4nP1f7NLcivFVHTD3R+Ar3hX3Dr4LbjVB3I1
         2Qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=b0cvlkdVUjtCQ6ukNC7No72aQPtsZYs+sXhJ7bmxnHs=;
        b=ZBdy7S/qalSP7ryCA2ew59DpFkBflzYggouoanE+EyXh8LRX/OMUIAUMeXSwpfnqW3
         0fb2/7X2Ea86mu21LJnstzjmlaSWjSmUg8BwBumqIxF24ZCTt8x55uGrNniEkdPyWaF+
         ouionzkrtvsjLJDa0vvV5TzmAoUPCvV4FV+L3y+Hy9ObJ5bjW1XHmbobAfmp03BNVbCc
         bhj9P6IYYgrNMqpdqou6NEh7dCHFDOAM/WdrFjQgeH+kfdmoeg701W3vF5DJkkH0Q+h8
         xzCqrDxxU9MwwMgkG3hZ2IHIjn4bavCS8LXSUTyFaT8KuxAQ73zt17SXn20UnYNoN+HJ
         uwOw==
X-Gm-Message-State: ALKqPweeWTaS+a9VaPKn/w5upOwwpwk6mZ1FdTu/iJOp/64xLe22iLs4
	Xb8BXSUYeFmfWMxhcrt1rM6pym7z
X-Google-Smtp-Source: AB8JxZoH/IRLxUvJBzKcSa//RSFKlyCWTKHbf5ZJTZiOdF1X75ThvhdK+EJRos3ii1mg6APzEd4Cdw==
X-Received: by 2002:a65:550d:: with SMTP id f13-v6mr19723188pgr.324.1527005713784;
        Tue, 22 May 2018 09:15:13 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net. [97.113.173.254])
        by smtp.googlemail.com with ESMTPSA id c8-v6sm27862248pfi.96.2018.05.22.09.15.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 09:15:13 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 06/27] Make flatview_extend_translation() take a
 MemTxAttrs argument
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-7-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
 cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
 Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
 eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
 LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
 Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
 94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
 86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
 I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
 VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
 +PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
 AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
 Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
 prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
 /E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
 jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
 VcROBqvtH3ecaIL9iw==
Message-ID: <6c6e0c6d-0d04-40c9-dd23-539fb797d38e@twiddle.net>
Date: Tue, 22 May 2018 09:15:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: EPR1WUAW8JLN

On 05/21/2018 07:03 AM, Peter Maydell wrote:
> As part of plumbing MemTxAttrs down to the IOMMU translate method,
> add MemTxAttrs as an argument to flatview_extend_translation().
> Its callers either have an attrs value to hand, or don't care
> and can use MEMTXATTRS_UNSPECIFIED.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
