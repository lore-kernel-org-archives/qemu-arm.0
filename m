Received: by 10.25.44.15 with SMTP id s15csp1045744lfs;
        Wed, 12 Jul 2017 09:53:33 -0700 (PDT)
X-Received: by 10.55.105.130 with SMTP id e124mr6987946qkc.117.1499878413621;
        Wed, 12 Jul 2017 09:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499878413; cv=none;
        d=google.com; s=arc-20160816;
        b=U9w2ww641BNc1dV9N2uIGkt3qyls7da+UnqttZL1X7a0lWjknaHJtsjwbf4/GzPwLo
         duKy2Pof+kVK1I7WM8XKP7VPXpCLCR4fM+REmlqyLNwAk8pL0IdCd68aPcpcjuqAluQl
         u9wxksUK3VkgUVbRTPCfuPW6UjkkARe2QGAQXleHlb3Am1QKf/e9WTH+muUQPf+08W5A
         bkPLkgyBS9LeKtUG314XxqNhZymF2awmPcGpL1HUvAJ+zF8cP3X63SOUXkRttDbIz9mb
         aVCJSIFPr2HSg5fM90Grq0lBIvPDlhCvZ5j15x69s3anJVms8+UUBrFkZObrhxsvKaHs
         yIJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=zBbNoW8os4Q0hp3va9BkXN0KyF21zTh1YmQndIjhDcc=;
        b=eX5GHR/dugKmcAdn5uNmxkrJ82yUDU3pgy6BI5BA26eLMeRSLe8IvWy1IQTT1gnzcC
         ejJObeFfrd/wv66MaZeAe4eTMGB/j+l7aDffY+UJx5JpqKVaCpTen+U0g7T3KRRtwsgD
         Nb8z2I0Yj138T99LvEcsIdtLnjL3jRzWCQbIiItgP1iHiCedHpEp+dN3lq04AlBiXHvj
         O6a/NguKz05OiOz8nJG2wMoNiHwOBmVlkOdJ99LDdd2qP153tIUqpiX8X+dUcJG2/LyG
         l/1FFUZVKO7jRXMVHrURgEahkBeT+sYl2StHqhmm7Thf5zSUFONZ2SygA/E63pCLUEsG
         ty7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=U0uogcQT;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com. [2607:f8b0:400d:c09::241])
        by mx.google.com with ESMTPS id 35si2749870qtr.317.2017.07.12.09.53.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jul 2017 09:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) client-ip=2607:f8b0:400d:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=U0uogcQT;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x241.google.com with SMTP id q66so4793366qki.1;
        Wed, 12 Jul 2017 09:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zBbNoW8os4Q0hp3va9BkXN0KyF21zTh1YmQndIjhDcc=;
        b=U0uogcQTTrogxPjCCIDT3Kl5MHuPe5a8tvKAheKM5XJ4M4AAIsgHRyd463Li14wgBf
         ahMxwHqdq3QZhDMVn5HuRXCeVlaUgYVu0DXAaRLopONcM6iQVIWhXaQQPbiQiXrRRTRV
         Db5HFdj4PJmUKRZvniJn/mNuw93SOKsizCPRKZ1Y5mByWhNQad5g+iIcIYKWRCWXhOJT
         lD80YUcYP5FGQLEy3x44LYubkRVxSjxK75u3xr3ypveazvzjAChrFjgTNrGMn2TREOoG
         6z1mqt/jVQ9IE+JvcBF+SqbtymVLMC1xf5/qeD4P4LAbMtqugFrGMwclDU4nqPqmVFhT
         RqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zBbNoW8os4Q0hp3va9BkXN0KyF21zTh1YmQndIjhDcc=;
        b=ngW+mauyju1ASmHppUJ4ThiqKBRH5GHK+rFLoceRJZYSo+eooA104oT4/bBdvc3S2V
         0Yyf6h3XO6+jvS9h/gHS6llBgP7Cq7gCGczxNSL1QCSJ1Nx2jCHSntw04tiZvq8AFaHg
         O9hl26265pLFftLFfSUCMYplreeoRsMYeg0YHJRCM9QOLwm29nN+GwQnYHbNxAQrzb8/
         ZZvEAo4dz8J61KIuCl36Shf0Il7H+0saWLwziJosoDeBZd8usNEJEQcSz5DkHBtFu50J
         r8RD5hLg/f+0Jdgz/iF/cbmofCntmQyMHJDDhfly4Rd1RfCGKDK+XzsEUlJh0dmgM7a9
         bNsA==
X-Gm-Message-State: AIVw112bbB+O7m9pIwqzUSrFPRQlRAQOCtikbxDwpj7ZvGtY9uFbMa/4
	zPq/3EgEwyaO3A==
X-Received: by 10.55.42.104 with SMTP id q101mr6988452qkh.84.1499878413103;
        Wed, 12 Jul 2017 09:53:33 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id 143sm2105003qkf.8.2017.07.12.09.53.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jul 2017 09:53:32 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v12 03/27] target: [tcg] Use a generic enum for DISAS_
 values
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Walle <michael@walle.cc>,
 Laurent Vivier <laurent@vivier.eu>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>,
 Alexander Graf <agraf@suse.de>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>, "open list:ARM" <qemu-arm@nongnu.org>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
 <149942834870.8972.2146924083027836035.stgit@frigg.lan>
 <87bmoq9g13.fsf@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <c3e23be8-17f2-1fc8-5e4f-9aba38b1c1a7@twiddle.net>
Date: Wed, 12 Jul 2017 06:53:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87bmoq9g13.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: TtJGYejAVjQI

On 07/11/2017 11:10 PM, Alex Bennée wrote:
>> +typedef enum DisasJumpType {
>> +    DISAS_NEXT,
>> +    DISAS_TOO_MANY,
> 
> Is DISAS_TOO_MANY really a useful distinction. Sure we have ended the
> loop because of an instruction limit but the more important information
> is what it means for the epilogue code and how we go to the next block.

Yes. I think it is.

The reason is that it is the way that the generic loop can tell the target hook 
that it terminated the instruction fetch loop.  There may (or may not) be 
something special that the target needs to do for that specific case.


r~
