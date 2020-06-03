Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp135651lfc;
        Tue, 2 Jun 2020 21:07:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlOMLoVRmgdvRr4LlOYXkc4LYWSiRaz7t8Bbe3nf4X7HohiCU/goVZnuPa58mzgMbpIp6X
X-Received: by 2002:a25:8107:: with SMTP id o7mr764886ybk.507.1591157252104;
        Tue, 02 Jun 2020 21:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591157252; cv=none;
        d=google.com; s=arc-20160816;
        b=0DdPwL8/Rpe6HOJ+iGzSqNDcUpsMguMeePL6Wx3kTALjI2fU4fEoFIfo3rqyTaPh+T
         WcwoIc+YJVk1LT8vjjLjGnRmIklA7RhDzOBa5UtjZ1vcqifLIgBeJzDQ+cHZ67fGWGs0
         sH9mkXr3AORAe7zbcsqLaYIzbfCKVhtP8I4pBm9husiIWJKGBJBcAKbR+DJKey18ZVT5
         LPwQ+XUUMvYy1mXZ9XCbvTjlYepELTW5qZB2ZWaNbhRBOlP0gCGSQ4x44lEvzyqLEtqr
         fIqjneJWwhSdVF46V95rrZfrNFZtq9KLK6F5637JdE4ZSqkij2rEnU63uCpPLmP4FeD6
         GD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=g24X9QcOYtd4hp5yp/fnc6wO6BCI6cOwSuUAaUtuqSE=;
        b=S1FxHAfHiKGup3wjwuwlZ9nE9oVglApkEs/dXunC9ROIeHo0WNSzRBULUQC6iO7W31
         rkN9y+YcvAl4c3V2s/EmwSnsz/V/rEdf6Yknf5rbsSuoug03hHiUNLF0mu5ez87JmSY8
         kHQTAp4TJ2F1bxDsZ0nPcExGk57p0r3RxRUzj4Pf57BLMrH+Sdad6S/Vn6OA9I3r+0mX
         4smA35oxoZStuzg5Oyc7ifdMcdqHUIKINIH/vJigf1vks1mc047fkhcvLNHBqPEnqvA9
         m5/Z2xyb2MmQeuNzg9OARcgNAOzHt+XBDw5jPWO5+qjToHBPtIpNgqRMKPzvE0PD3aU7
         U5qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UwFOyr4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e92si656572ybi.496.2020.06.02.21.07.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 21:07:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UwFOyr4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgKgd-00067i-H6
	for alex.bennee@linaro.org; Wed, 03 Jun 2020 00:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgKgV-000678-O8
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 00:07:23 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:35414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgKgU-00044l-Fl
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 00:07:23 -0400
Received: by mail-pf1-x443.google.com with SMTP id h185so711646pfg.2
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 21:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g24X9QcOYtd4hp5yp/fnc6wO6BCI6cOwSuUAaUtuqSE=;
 b=UwFOyr4OcP/PjJAZTI2gAkhVTpzlbnIZmxsEBMX4O8U0AJHEc9uetESlTSLN72WA/p
 mgD+TA+PyGGpiKXMoA84Ldwkg7oyXof/P1LTxzGnmHIcQGghZo0Mm1PMNVVCIbHZk1Cu
 pmIehnvHJEvSMeFGjiqCUc6cvtJratS1k5VIx3eZDEFaEPkpXcTaL6RndA0vQU9LBVSN
 2RN2nTTTumv0S/MOO5XUg/8KndLHf+/yImohz0ohUKLT8p2OmtOHOorK2owGjTaI3URO
 uM2TdR34dFCzNrjvXXlPsXOGjanUNdBIeEueE9fANBIY9naZ1tqtDEuB3I32ZKJV681y
 9bXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g24X9QcOYtd4hp5yp/fnc6wO6BCI6cOwSuUAaUtuqSE=;
 b=BWWP0MpIzWDjR2cQArY3f0P2+7VqqouIZfEglinu7+wqacrQE+BBYO4n8t3Ky/TjKF
 41LdDPSmaJfkTO3gi76P7p1KdsUUgpgTU/2YY3NA/A7Cqz75fVh9IDOrs97NPBhWD9U7
 S7PrZhfm8wT62ayLsrsTh3jM/aAVfJv5DylELv2cIax+mupqwWhdDiXUP0CBgjMrew2j
 K8vuU2TN9Dkd9pe3K9piWvLj4aPNebTXgtbjJoZsEDCnZ5hF8oJahLQhks3KY1oH6Ej5
 O+wyziu+uNK0aPcn7gzpUh23U1sejOJ/s3AHtdQZ9i0nlb00/yK6H96ToL6SIPeZ5q16
 RgAw==
X-Gm-Message-State: AOAM532MU5uM2qNiFXqA96VZmmSfGyaKSdLE+rrLjklCWgxf7LUwJcuA
 jplZHKg4h7OPASvGPigJ46mETA==
X-Received: by 2002:a17:90a:8d11:: with SMTP id
 c17mr3106202pjo.201.1591157240217; 
 Tue, 02 Jun 2020 21:07:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id z9sm550215pjr.39.2020.06.02.21.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 21:07:19 -0700 (PDT)
Subject: Re: [PATCH v7 00/42] target/arm: Implement ARMv8.5-MemTag, system mode
To: qemu-devel@nongnu.org
References: <159115053272.18153.3452088585693299325@45ef0f9c86ae>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <616b90eb-aba8-525c-2060-69442d141bad@linaro.org>
Date: Tue, 2 Jun 2020 21:07:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <159115053272.18153.3452088585693299325@45ef0f9c86ae>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IzQ4jWEN/fBU

On 6/2/20 7:15 PM, no-reply@patchew.org wrote:
> This series seems to have some coding style problems.

Hmph, some of these are real.
I'll fix for v8, with other review.


r~
