Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4950167lfa;
        Tue, 3 Nov 2020 08:39:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDieHlnhD8kctozQicUk6qZa82eGoLEz8AoEhYBWYCCf1JfMz/X7nMgDo+44KZhg1CrBxi
X-Received: by 2002:a0c:8644:: with SMTP id p62mr28395119qva.13.1604421545947;
        Tue, 03 Nov 2020 08:39:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604421545; cv=none;
        d=google.com; s=arc-20160816;
        b=G6/pe1zbZWYDj7dT7LAq9e4Mb6Zqfrj9L2Vuwwp6wIxfIjUnxDeZyO0PRu9RH1Durm
         YJMXHCg9MT78j8LXgbkAlhQCpHKxHTJG+FkfLHyFXjYkxACAKZJtXvV7pp/h1JL/Ln+m
         s6zXdGvRvfIo0FXeDQfXLABq4FZHtvOnRNeowGrIG2qqklD8W+ed5WVdw1a9yazNvnMG
         v99LlZPRncyRkQExMmEU1e9oHFLAQ7G6QIG4ilzLfTUSIwe3ENW3hIgP2E8SdcIE0sst
         Lu6vSkMVttIPYkFCeXKTTrUJLZXgSt4druivYup4lClurvJy3KzxfRVQ5FhsZRXh9zfW
         ILSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FQfyNYKw3s3KbpdNAbop7Y3DNBRmNlEUc42AuKxdeE8=;
        b=d0wOPdElYrSdrcMlOxieaILiFIIz7suKji88jgksjhPYVPWNNLSyRhRBCtNYFB5fHZ
         vSePlN0nguSkWNOU4Ime+gJ+SXVjDvdwbrUJRdlXQjd/h5uR6OJ0YVlaty7bM9j7GtCA
         Yq0FxPIUZg4o4/DKkQvyB8huGyx90kmkCpdy7b1e7OUxmAQ1sclpPILg3yf8jRBY1QSH
         eUP4ISeMB5QcONYCJjX0fZQEVshl9IXBcMsrDGXPW8sHbyReCVmdb4UO9CH9MUWuAtiU
         U/BY20Gf8NQ/k61hDBgId9GSQpB/t+6cYZ/5ord0EH8tio8uKgLmFlkiw/070e57k2TY
         RIgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B79xc1Qq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si11258634qtx.337.2020.11.03.08.39.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 08:39:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B79xc1Qq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZzKr-0003nc-Bb
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 11:39:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZzKK-0003Vh-Rq
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 11:38:32 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:40211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kZzKJ-0007ye-1U
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 11:38:32 -0500
Received: by mail-pg1-x542.google.com with SMTP id x13so14081019pgp.7
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 08:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FQfyNYKw3s3KbpdNAbop7Y3DNBRmNlEUc42AuKxdeE8=;
 b=B79xc1Qq7dIJ8WGWxxcAir6QZ2k/3vMslMfrrHftK/qR7tPxwwhCi8KqXjDIy2IV8u
 gMP4SU82W6m/qHMXDw1ux6iYzLkkBBF0pv7L9C+CtPpwvjrrN1ce5t+k7jSfHfshSKDL
 qpuT1vMqEEV/LB3a9PphmivATnpHya0iGjekuiaZ5q02dg7PvY3SQow+qNxRTitITqIV
 4X4rq6072Z8r9SaBfJbYNG4Vc7ciDS9hNcUOC2fAQQmeAtjLFT08y+9gKreKPbAC3WR6
 PGGhXgf9RJaPMsNRyeY2GsJ6Bq2FaKQ7R56e4y9rvT/CFGeH+QC5B6XDduSgSWyT4bWx
 Jg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FQfyNYKw3s3KbpdNAbop7Y3DNBRmNlEUc42AuKxdeE8=;
 b=D7lHRtQAjHLLqS9R7kW0Q9tfgcJaSJeFz9bBo7HsYspWJnzzHu9s2Y21bL71ZtQrhU
 PTQyZ8qJW80O+HcWHStVhqrz8Bl9YRf6aboo5T2QYz6VjkBoE5XtqFxj95rKBoYBUVGS
 9xBkwqhZTixzspMputbl0MVf+tqS6HBQiaAHG01zZFqZUOXP/dxIU411OMkNykO4PHff
 B3xpOTnOLDyhhsbo0NYvyTnD2KkjArNXNg901tgyw2F4cbfqVFHKs2P1pVTGGoiXEqfy
 RkVWTlBdBUYhRKXij/HX+H5jkcpbyyTEQ+kemsRV5or2RmHugfkBDre8ltoz9D3X+1Qg
 HHtw==
X-Gm-Message-State: AOAM531GLvvC9XQzfWmf4dn+bGGtSGN2gKGclHqlSWnFBtZdIVvPjsX0
 xcnA5Akjsqgj/EiTZc2mhfaOGHzKJ6rqRA==
X-Received: by 2002:a63:d946:: with SMTP id e6mr18093228pgj.113.1604421508903; 
 Tue, 03 Nov 2020 08:38:28 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id ca5sm4178124pjb.27.2020.11.03.08.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 08:38:27 -0800 (PST)
Subject: Re: [PATCH 14/14] target/arm: enable Secure EL2 in max CPU
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-14-remi.denis.courmont@huawei.com>
 <4572030.GXAFRqVoOG@basile.remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6f32973b-ec84-51c7-0809-95e931ee432a@linaro.org>
Date: Tue, 3 Nov 2020 08:38:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4572030.GXAFRqVoOG@basile.remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NNFHddnz3Epb

On 11/2/20 11:38 PM, Rémi Denis-Courmont wrote:
> Answering my own patch as I have a policy question here...
> 
> This exposes SEL2 without TTST (small translation tables). On a logical level, 
> the two extensions are orthogonal. But per DDI0487, SEL2 implies TTST, so I am 
> not sure if this is considered an acceptable deviation in QEMU, or if 
> implementing TTST is deemed necessary.

We should implement TTST, yes.  I don't think we need to be 100% strict on the
ordering, so long as they are both done for the next qemu release in the
spring.  I don't think it should be difficult.

FWIW, we left aarch32 fp16 unimplemented for quite some time, even though that
was required for full compliance with aarch64 fp16.

> Note that there's what seems like an editorial error in the spec: VSTCR 
> documentation covers the scenario that TTST is not supported by the CPU, even 
> though then VSTCR should not exist.

Indeed.  ;-)


r~

