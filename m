Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1856861lfm;
        Thu, 18 Jun 2020 10:33:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHDZoeRk7JiXn6Mzw6U3uqIDOETVmNd3uECSZEG37oMooPx2aKdO7JgMRTjbvF+9TIiexk
X-Received: by 2002:a25:b219:: with SMTP id i25mr7844629ybj.1.1592501606649;
        Thu, 18 Jun 2020 10:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592501606; cv=none;
        d=google.com; s=arc-20160816;
        b=DqNYOJfVoii2bg26wXAxPFa2GSI94jNBDbIOOalvrfo/iJKcIWKZMu+t6oYIi5TGmy
         BbV+6Gt1iXfVPrEpO+FZkBbcU3QnQaUql8P2mNKkuzQmF52q2G6BPjkkGkMjtX28JXfr
         kfi6UvohkOj0XovR8Tt9zf8mlwoBZZZxQaGMZM4f+vsLORSI8/h4ma+ktMNXe/2ef+Rk
         1H8EWC5msz1WtZq+gOK/MPCrCV5mFSyzLLpr2CVrkW1EZvmrT0KTPj5BkEnHEoMZJEvG
         3ya3j/yZrglRG/76GlZg7mTuVQXGupHdDuyGrtvPR4J/UiaHlb+Eaxk8XO+bL7WO+oX5
         NhPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LQvfrDAxgR85n6U1y26lS2xEzeNm/9ZQpuW6mmxGDSQ=;
        b=JqOiB4d7OySEe5qxx//8EF5WL8oV19yRMqj9PNPN4u9lUZPF+kzXi5ddpUmplSD4vN
         BsNH1VHrbxfss96hVuT1HgdAsItTRwCAnBi2unX6V8Mbg0Jfip1QE6+szx9nvvPn00gC
         jE4okwebLVPcGoSmAtbUPy2XgXN6O7YhwZY7BqXlo68ZA0b4aZ/DM294KwGzXEujaSP0
         rHwMLgou0FTHF189xMHUovs/OCJG5YQH1xxgBezAZK9BCEbWe041khZOaMLYX8h+z5M4
         YYTDB5uISweUc7uN/fJt5PD8YVcPjxxVQfVheV8qPeMDpCtzCGfJob5yfxfgcTK2QJbq
         wPVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gxNDPMkx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f186si3007207ybg.303.2020.06.18.10.33.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 10:33:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gxNDPMkx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlyPl-00007o-Ve
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 13:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlyPH-00005d-7Z
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 13:32:55 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:34849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlyPF-0006M8-PG
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 13:32:54 -0400
Received: by mail-pj1-x1044.google.com with SMTP id i4so2993438pjd.0
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 10:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LQvfrDAxgR85n6U1y26lS2xEzeNm/9ZQpuW6mmxGDSQ=;
 b=gxNDPMkxlCSGXurntK9+xwZYWDfbbHTPFqsOwWuLggZqB/6iLzQ1XdFteOHnsbEJs+
 ITwosdyh2Ke4mRV0KvRRWMNLULsSiT6kV8MTFD9pTYAbtMk8ZjhmwFw4vXJdRY79eKkL
 BweB7umboSwaW5txqW/X8WQefkdbVLH+bxtnqtGZmB++rPXVCnr4byLL/dc/kYapZKNU
 d14LhlCBt8FpSCFCiqM1VBJNcQifkRha8OJqZ5Mpq9726LzQ3ZO0wKSPo2QqwBiEEIHT
 E/uUU/lEXqVF5gSnnzKe3MniYivfmuEtxVR0MhEFMhuk9mqrc4/CDLxgyNt0cN7/fPy+
 L0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LQvfrDAxgR85n6U1y26lS2xEzeNm/9ZQpuW6mmxGDSQ=;
 b=Fbw7VPr8pRyMw9TTt5x40uJUFgICuxIxj48SkBQEQGWISPI1ac47FIFzCkqEJ4ajUN
 rGGJOOJHOJe/CtXjoE1Lq/Z8WrFRkEy4BnKCISTEmtgeKtjaUAj0iwcW8MUIQvXVBnR7
 eFYaWN59QDNfx9IFTNfbB6Y3RClnYfx3SksUJpmO7mTUP1P+0atdOlkA6Ex7eBgTT2TL
 LX7TZiTLfdhzHAuaW4YuYvd026GngIuhEnf2iLhcP6Ye9CwSj3CpnQnia+y5UG4ZBAvJ
 fP9jFKFzsbtmflJFGzJBx/m671bRpV5CTzffkkCtbyfJ5OG2SVOR6AsTf83lz75JWsrw
 akyA==
X-Gm-Message-State: AOAM530Z4/aIaMhuZOdqLYlxUw/jNy8VGvjTztYbkisZc3coKB5WUxqm
 8f8cjT2K4NxFXc4gj9vGJw+uwQ==
X-Received: by 2002:a17:902:9683:: with SMTP id
 n3mr4453647plp.311.1592501570800; 
 Thu, 18 Jun 2020 10:32:50 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id a8sm672262pga.64.2020.06.18.10.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 10:32:50 -0700 (PDT)
Subject: Re: [PATCH v7 25/42] target/arm: Implement helper_mte_check1
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-26-richard.henderson@linaro.org>
 <CAFEAcA9qwXRG8R+1QCjjx8Cqs3yCaDisWcpECTszZrVjKuJdxg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42738bcf-cce2-9621-59b7-38588e868387@linaro.org>
Date: Thu, 18 Jun 2020 10:32:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9qwXRG8R+1QCjjx8Cqs3yCaDisWcpECTszZrVjKuJdxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4sD23zLc1D90

On 6/18/20 9:37 AM, Peter Maydell wrote:
>> +/* Return true if tbi bits mean that the access is checked.  */
>> +static inline bool tbi_check(uint32_t desc, int bit55)
>> +{
>> +    return (desc >> (R_MTEDESC_TBI_SHIFT + bit55)) & 1;
>> +}
>> +
>> +/* Return true if tcma bits mean that the access is unchecked.  */
>> +static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
> 
> It's a bit confusing that one of these foo_check()s returns
> "true for checked access" and the other one returns "true
> for unchecked access"...

Yes, but that's true of the hardware bits too.  I tried to reverse them but
then got confused.


r~

