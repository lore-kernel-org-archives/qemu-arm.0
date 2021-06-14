Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2236297lff;
        Mon, 14 Jun 2021 12:03:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAvsby/tSFDRBYHB+QK0CQ4EG293Sb54WtjFZOQCucypwSb33YLSQzPB74vSFcmvTzKtSl
X-Received: by 2002:a17:906:2456:: with SMTP id a22mr16255902ejb.496.1623697427720;
        Mon, 14 Jun 2021 12:03:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623697427; cv=none;
        d=google.com; s=arc-20160816;
        b=Vas9MmWUDVilQVeF/8LiPhPeo6ipIyHdnAQGGJRgUxNmdLKsLk5i+G1OhyBxyGnHaE
         xrZXs6aU3zkJWjYPxRnxAV0YDhyHBTjGhlB71gZbyn3A+U163Hk5nA8jSkqgnJYvV4+A
         VKLHb13RoneQpDM7jd5GxdDscBZSYJFoRbkCHIOzuW/viQrYGdWtQc8Xt9isOoXpACMm
         Afh+8fQswIPDviCEyWqufn1dlDhDACFjnOgpdT6oSiYhMjUM6hXd2tYQeK86v4sOeHPO
         MnDW1T+wlLWIbIQ6fChKVCZ4rMeZ8e+MG9AcWnUfAEsA+MIpDcNNhclxmeFDGjOkTtFM
         NMVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=z9rKFb3Ci/7uxLmsplEeFmejI6CWG+U9JoxYU3ENOzk=;
        b=yAXMmH5/TtKkzjtkgixZqwu0rt+kmFRTH4dtIr+uycLxZp9+E4lGqDECR/1x69h8QY
         MNezcGAB2MtKG3lRHX4D4Meopn74SZiaphgmTKVpwDe3nCbObYws6dbeD9ye7yRXDTFy
         KJKSVC1DxAlKWMyTnoNwm701c4BMZoCOSAbtooxW+MOVuKK/WQirXsYZmhgtGulGqZs+
         VL6AB6U7elYSKGV+a6Eqwr27Z96RkFE/KiZHbFqlKxtLQ4v79rRFkfhLzlzmd8DL+UmD
         oxADtCR7WQ8eKv/yUn7HOokczf8Y3wq+1PgNFnfDBeaj7+d7ozPIIYh9Lz8R/JD+tc9T
         Htfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vbv7mSm4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lc28si12515327ejc.270.2021.06.14.12.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 12:03:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vbv7mSm4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsrsA-0003uU-SN
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 15:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsrlT-00052Y-CM
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 14:56:51 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsrlR-0007lX-J8
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 14:56:51 -0400
Received: by mail-pf1-x431.google.com with SMTP id d16so11242246pfn.12
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=z9rKFb3Ci/7uxLmsplEeFmejI6CWG+U9JoxYU3ENOzk=;
 b=Vbv7mSm4asHZGLy3LXNNYdl+DjvX5jR6wKk7KL2ZMuxpENHOtD6jp7cHC7QMhyPxbr
 ni2InNudf4naVyyZ8svTuL2i6PHm4mk5V/Ky4PQMZwzJt9DFSnXjEQfM+XVuErIY0dic
 AmSwYnl1fwTXAYzEZy+F14zyalDLLNeZfP3sOjIH/6CbUjpr1vNnetbiFTN59hdQUe3h
 oXeJwTo7GqxGXM+WDuJKhcYyPGHgJV8rQMzqjmzpq8Z53AMdRuS6GCl9/eyhWzYVSo5j
 0YjKumUttPqfOm6+CODcDDeqkS8TJedG9b/NqvO6SSv7ZcygAkZQ+3aPl1iygwhw0qtS
 n+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z9rKFb3Ci/7uxLmsplEeFmejI6CWG+U9JoxYU3ENOzk=;
 b=V849pswmwC1r4TDq2u20DSTkonBD1PLPEvVBspAFOYIbKfGDAsEPdQJpira3kbEi1c
 2SrBcPhfl9DTM13hmAVV99n8OaXaRj/xA1clYvcvbro6283w0zc4180H7rnBeDWNRqqo
 3mthAF58ic6Y1Ex7PYy8CspyvUYGMMe/c8i8lC6aOw56xg/4MaEJbSTFToXQiV8qARqd
 nANCi3UNv+45C1ftvQbnoBszDvXDjjTb/2fKFeZwuzVYY8fBlQY97F0Kr+7yC4nD9umB
 8quvvfw0YK2yZ6lwNpIlCMoDEyDn/sMsW8/NCSds4qdVJ5SllTU0lE3dzHHz2MUUiaxl
 UCEg==
X-Gm-Message-State: AOAM5339tbcCjTN99OOc0mcNvcjIfMJVze0lOl4Oj2otOxLQNX3aige4
 4uRpEokuSCGdlGwImtdR7Ek0jg==
X-Received: by 2002:aa7:8f3a:0:b029:2e9:c63a:312e with SMTP id
 y26-20020aa78f3a0000b02902e9c63a312emr573007pfr.73.1623697007453; 
 Mon, 14 Jun 2021 11:56:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k21sm13405798pgb.56.2021.06.14.11.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 11:56:47 -0700 (PDT)
Subject: Re: [PATCH] hw/intc/armv7m_nvic: Remove stale comment
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614161243.14211-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0711ccff-ee4b-ee0e-0ab9-fc789c283136@linaro.org>
Date: Mon, 14 Jun 2021 11:56:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614161243.14211-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bfZ0o5Zzwto7

On 6/14/21 9:12 AM, Peter Maydell wrote:
> In commit da6d674e509f0939b we split the NVIC code out from the GIC.
> This allowed us to specify the NVIC's default value for the num-irq
> property (64) in the usual way in its property list, and we deleted
> the previous hack where we updated the value in the state struct in
> the instance init function.  Remove a stale comment about that hack
> which we forgot to delete at that time.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/armv7m_nvic.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
