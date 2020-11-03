Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5156636lfa;
        Tue, 3 Nov 2020 13:40:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIq/XLXbDPl38jnDOSxUunt9k9cly5hJshxuSPCy4BXyqp19CDvtMxOIiSYTOnLaWG7ZRm
X-Received: by 2002:ab0:36f0:: with SMTP id x16mr12078546uau.4.1604439630876;
        Tue, 03 Nov 2020 13:40:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604439630; cv=none;
        d=google.com; s=arc-20160816;
        b=pgbVqPmTrnuXBPF3ixCZrZw+pS86vD2ijfrNTjqiyxHVQxwAB5+k2b/jUOSE4I9c7Y
         55luwuqgHe2jHKfU7IEGNeBsAFsrvCibsNZQD/FlsFBhat+k0Cv6rbjtPZ4feJXknwjS
         y7IXr4w3pT/md5t8It/plcu422tKIn3JnRLLl45X8q1xwz9i/jAw03y0nBAT6sBmnto8
         Yo4WDWruQlYfmEoaZBcGhgcszbK6GR7IzzWCRCDCvx7VhBNWXnfkcUAMsv/MKqfKvvG5
         hJG7J5RQohZXYGTi+PV+aafvSLWxRSBnoJmbDLUfQvLBe1V9mLyPDKVrqIlcRL6fqmz1
         WGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=R3+cOjWcFo31OFROQoX97xc/l9gjamcF+P2uhNEru8k=;
        b=zETfl79AZmyg5ttwkLeIbbxAFvKNxVuiAdX6Ec7fGUkIWo8GRUCJAtY5XYaYBlNGln
         L6cx6fq+sVm1TBSqH97CvF/YuhKTN4eY2plEsD6dTkoPPRtsw69CjzFUw+5LhvW2ffEJ
         sSleuUj01yUS35tW3y4yktvUOBVIxGukMa3nIRyru9roxaPUeu5SqGL/NHufP0PRpBNJ
         XX4pB6V6DaNVEXlzP3TNSuECa/2Q08SJFG0wDqT425S8aA1/ggppSlPoNYDKn93Tv+ST
         YzfStZ+ITNyQ8OKmzJDRbWCimNPIn0/e0nCHZPppRrIZqhmw0ALXl6c1IDWGRYBAITBF
         6PrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AFPDn77x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22si23715vse.160.2020.11.03.13.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 13:40:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AFPDn77x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ka42Y-00033Y-8c
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 16:40:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka42Q-000335-EQ
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 16:40:22 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ka42N-0008Tp-Pd
 for qemu-arm@nongnu.org; Tue, 03 Nov 2020 16:40:22 -0500
Received: by mail-pg1-x541.google.com with SMTP id h6so14743262pgk.4
 for <qemu-arm@nongnu.org>; Tue, 03 Nov 2020 13:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R3+cOjWcFo31OFROQoX97xc/l9gjamcF+P2uhNEru8k=;
 b=AFPDn77xm5t9Edm7bs4O/M+0dSzn01lfYc97s/tFAYrvrRcI2P3w0SBekSAA/wOrc4
 K0XENgEyPEyk2sKsn/D/rEN/X6LoDb48EKCcCciYnBvE1yATr2L8HQmrqhSQsRkl2gtg
 WHzjgSwvb4HqX8u3yJWuNJUSsOgIjy6H7V4/TjoHVE6RLSpgQGwxLdo45qRcBlGzvFLJ
 tVPVdgdOTFMSCPKn2noxLbTSZoOzt3Z72bi9qKUxYGRc7RnbEN5V359Vmkle9kiSajxq
 mASM1JiQofAXFNgcdeAdc5XTOD8nPKiUE6uHQrmwy2GJqV5NYJmBHMr+rlfAamX/UyXR
 vfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R3+cOjWcFo31OFROQoX97xc/l9gjamcF+P2uhNEru8k=;
 b=TiHGjxSMFY2abuUega+XGIR/boWQvEv+3NczayYXnuq3HOB3W1XMFa8zcknYFjVmLy
 dklEuGBOcLCtelUWleicjEhYAGgDCl87TWvgCN1oFp1f9fsk50+0Ew03DJePGMl7QZdp
 x5S+XLQkMLOGVIRvGQX3breG9ye+qXr0bSVoaeLCrCq9Shr0TTBmN+ek4RiAe5NxQeDL
 Zi6JtGuJoawP0vLzWhAXoauNpflNkLTBTcUfJCphUQC3Rm8xHr7GgZchOY0Za0iYgAfV
 vjIYTdjPaEmQEJxEYBZ/b8EiR6slQKu/hFjSOmeblq+qeCExmdI2XoMnHVuq/MvzzLf7
 nlwA==
X-Gm-Message-State: AOAM530kTBgO14zuWWtPppGbzo2pOWsyLp3P64bTUya6DgVF19ByTIhU
 23AUesfgS6n1pP3WPaCGZHfiuA==
X-Received: by 2002:a63:f94c:: with SMTP id q12mr18092532pgk.244.1604439618369; 
 Tue, 03 Nov 2020 13:40:18 -0800 (PST)
Received: from [172.16.1.221] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id m2sm71545pfh.44.2020.11.03.13.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 13:40:17 -0800 (PST)
Subject: Re: [PATCH 09/14] target/arm: add ARMv8.4-SEL2 system registers
To: Peter Maydell <peter.maydell@linaro.org>
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-9-remi.denis.courmont@huawei.com>
 <d26e76be-9be6-e658-48c7-0f5246508517@linaro.org>
 <CAFEAcA-jnWsR_CM1t6DNu09f84m7HTSpfnOiV0DEBFDdP-DQzg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cbed5325-5602-04a2-5e80-62fa5db86667@linaro.org>
Date: Tue, 3 Nov 2020 13:40:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-jnWsR_CM1t6DNu09f84m7HTSpfnOiV0DEBFDdP-DQzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 remi.denis.courmont@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9/iT6Zx+wZdn

On 11/3/20 1:09 PM, Peter Maydell wrote:
> On Tue, 3 Nov 2020 at 19:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/2/20 2:57 AM, remi.denis.courmont@huawei.com wrote:
>>> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
>>>
>>> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
>>> ---
>>>  target/arm/cpu.h    |  2 ++
>>>  target/arm/helper.c | 24 ++++++++++++++++++++++++
>>>  2 files changed, 26 insertions(+)
>>
>> These need a new VMStateDescription section in machine.c.
> 
> Do they? I think they're handled by the existing generic
> migration-of-sysregs code...

Doh, yes indeed.  ARM magic...


r~
