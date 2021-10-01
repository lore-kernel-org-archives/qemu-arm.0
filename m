Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1444138lfp;
        Fri, 1 Oct 2021 09:32:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1lE6TXdD2v8kQvHrc/Yb4MQqktz+a1aIZTDHXHR9yMWnMGVsMMLKrRwyfZ4N6gNW2BDzc
X-Received: by 2002:a05:6102:18a:: with SMTP id r10mr4866764vsq.44.1633105949102;
        Fri, 01 Oct 2021 09:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633105949; cv=none;
        d=google.com; s=arc-20160816;
        b=NATQbqj4AjYgBJVaQrSuuNGHBkMdhS4SqxLLNQXKJ/lGvjPUemnz0yZPVDJUrWoxeD
         nu4jNHrBWp++urDvpe3zQ4kMKq6aZaR9/ZvNMe+JhLILsWfO/TdtuKBBHo5jj0H0W70Q
         0JIuNVsM5CRpwCTeLYxM2lwRsL6AFNNm5sbcyhpg/hrzF6ZSgJPMJc5t3xvLPQ6tNJ14
         aAeY/afFu9GSXlEdJ/IxhbgAFUjFGewVWKwn7vCWyqR38pDkBKgnQxMOF6Eb+NGup4lI
         5GI+VwyNZG7fBhXLbSrKdA2E8QXA+w/rizUJK84XgGIyTN112EAtC+3iKFdFTDqHdJ2j
         +jDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TWGQJk5aChMo6jAn48gWAN6C5M7YY9vwaN9CPCi+OVY=;
        b=CzcTGWdzTG5cKa0P8jVjGkayfrpoYTZ+AQts2cvXdP38iqy4ZhXQYt/gOhdIhq6t+R
         Q9IoNAOVX5yj9CuwM6mPQdFbqp7L0+G6DWSa7PmXNnPdiTpJv4wntyoTc+VLGXVF7i6P
         nUcb7OvFz+LHJkhS51fCGRVTk6Je0Xm/QlqsX68FzgPef57KtYxizhU30bgThT5HJnOa
         m0PKTF1dKooXq0SZp5Iwcbmkmh3OfCBzD1aSvXs/p16wGR3lF+10U2IN9njyu9HCocL+
         thU+DtrQYU+ShMqH3prRt8LsPw0cY0ipu09k+SRml4wXpnyhUa4B93oWQVYiAMRC20X2
         bbQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="orf/xjmW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m25si4452027vso.138.2021.10.01.09.32.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 09:32:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="orf/xjmW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWLSW-0001rV-E9
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 12:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLSF-0001kM-92
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 12:32:12 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:39884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLSC-0004pK-Pc
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 12:32:11 -0400
Received: by mail-qk1-x72a.google.com with SMTP id f130so9699483qke.6
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 09:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=TWGQJk5aChMo6jAn48gWAN6C5M7YY9vwaN9CPCi+OVY=;
 b=orf/xjmWKa1JnCPiMWOaJiMAfYGqywxfcNRei9Jm3DdQVhYiQatF+q/WtOjw84HcRu
 0Kznpu9yQejLUWhy6+m7Ezjp4758xkCX1aLFljZXGO9tSG6PmJhnWRpnXbu0DHMpaSdB
 NmOzZlzTMzMOre/16gLohi9l8DASGbbSpSTeL9dwf1PJ5L279MaRLZFDGLZvKJGndpmb
 n2vTMnQ72yv3Uqi0rPY/c0qJyKbIqjOSvhqmc8qqES3a++9LdfEfzVq970+i5leJ4y9j
 xRa6xFyefSqLueIg9FXaDgUQ2/5sM2s8fZRRc776xeOAgoxdW28pGNr+pEwnrHA3UuzM
 46aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TWGQJk5aChMo6jAn48gWAN6C5M7YY9vwaN9CPCi+OVY=;
 b=noippZ6PClfpRiYGZu/MOsF/Cqgveb3Nn7wu5ruGBNY1lsGDeAkhrdV6zuge3tBw/t
 XOXizYA39K0tArvsHl5A88uHRpCBLBngttXIY8nnUo9rQRaxtsdUqn5kgCAXyx8k6WfH
 SWERs8BMHodS+LFW5Kgb7S4TAxtbaf4isfEVDmBdvNcojphjksKs+z6tTvSCtdaYY0CT
 Yx4eXC7rMobmS6TbjZVWrJ0RNIY9eeNFj1p4VWAKTjd9Pk/inE+68O1U7wL01Vw6S5Ba
 nXXQm4Wyhj+qDveoJQjSzTq9XlJN759FfqJ5vnwPrmGXWaQ7tAcskK4iyWNSWrM5KXCj
 Dfuw==
X-Gm-Message-State: AOAM530wZ4oy0i3VqMDDwMtYlPWwXmxLrtgk9wRBZlLAw6P7ceiTRC9L
 v63+kHkYhG+h3YxJDxASpZVdjg==
X-Received: by 2002:a05:620a:430f:: with SMTP id
 u15mr10430336qko.32.1633105927384; 
 Fri, 01 Oct 2021 09:32:07 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id u12sm4018870qtw.73.2021.10.01.09.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 09:32:07 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/intc/arm_gicv3: Set GICR_TYPER.Last correctly when
 nb_redist_regions > 1
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210930150842.3810-1-peter.maydell@linaro.org>
 <20210930150842.3810-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9f9d138b-dc0f-0c47-6728-1d781d8f03ec@linaro.org>
Date: Fri, 1 Oct 2021 12:32:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930150842.3810-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EmNIjfvylXpt

On 9/30/21 11:08 AM, Peter Maydell wrote:
> The 'Last' bit in the GICR_TYPER GICv3 redistributor register is
> supposed to be set to 1 if this is the last redistributor in a series
> of contiguous redistributor pages.  Currently we set Last only for
> the redistributor for CPU (num_cpu - 1).  This only works if there is
> a single redistributor region; if there are multiple redistributor
> regions then we need to set the Last bit for the last redistributor
> in each region.
> 
> This doesn't cause any problems currently because only the KVM GICv3
> supports multiple redistributor regions, and it ignores the value in
> GICv3State::gicr_typer.  But we need to fix this before we can enable
> support for multiple regions in the emulated GICv3.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
