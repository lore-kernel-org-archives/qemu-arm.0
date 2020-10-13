Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2097384lfa;
        Tue, 13 Oct 2020 09:04:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCsyHeijpD6TtN9vmLm1eKIvL4v0zNu6RlQqR8oxMtQ+MMDlnyfUbJMcnxE9D/xheXPzEj
X-Received: by 2002:a5b:8c2:: with SMTP id w2mr782887ybq.438.1602605061803;
        Tue, 13 Oct 2020 09:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602605061; cv=none;
        d=google.com; s=arc-20160816;
        b=qwAWmteSe6FsT1JXTT/2LWp4hvLzxLS5z9uqQGtADU7u1FUmz9ELTUxeefFaActzvE
         bogtFf/tFh+SaHAMmepLfp6eaItY+am6unoKzrx7YqyLKWZGoPx7HqcWSXzjB4FvvTHA
         N6fzBDA/YjGEcwGTjQFfjUGOpQNf3k55qMXiQSdYrlB10KNyATceTWlFVwq9HG14eYie
         NkDG/F7dLnrlfXvMrSshma/YtzLFRv9+t/IhYbTccdB3SdFElv74P47PM9ijUJKcQ5N9
         grnuUOXBvo/nPUY/3H8Anu4RPXpMPuRI+jJrEjWo768ir8eJqoYDiiGvjvhu5RpbTVFT
         P7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=i+RmpWYdLT9YXqB40aa5IblU2V7Jd0t07I3+IEu06Uo=;
        b=PNdx9h/me2o1ZQMv4e0S2yINNL9CK9HZnvi7VxJpeqD1b8OrALAoGOPm56Yq/zjaQ3
         qrxsWxMF9p+1w+5wJdS4MIEjg9JxdWVFmccU5NXB5E5io/qhGMNk+qYlsXkvpc/37tRn
         m/XnE197ieLQ4Tgs10ZURO+KoYm3Yll9cF6haWNB3M0Kqwj6+0WVy0DqzY42FS4c7Vq9
         7pZfxjr1dKXdUo6SrDgyeAyqV0QB9aFVo4uOywPDk8DfosHkhq7Q3RVc/GT1Aqtju1E5
         9R7Dc0ecR6Q3qy01XgAsZsAsKB7KN1KbPag63zrdk4LfCYqQbjEltLn7fk2IqWtDJXwU
         bXsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JRoYMJZ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si335889ybk.97.2020.10.13.09.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 09:04:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JRoYMJZ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSMmj-0001Hm-5T
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 12:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSMlV-0008EQ-3Q
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 12:03:06 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:38244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSMlT-0007W7-20
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 12:03:04 -0400
Received: by mail-pj1-x1042.google.com with SMTP id u3so108912pjr.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=i+RmpWYdLT9YXqB40aa5IblU2V7Jd0t07I3+IEu06Uo=;
 b=JRoYMJZ9KPmzR/xMzZy0DqCjX6jv5ggJAODpMeOgNobJUsWbfdH/HNzcyQ+xPlWyGW
 oaEdrnCW9W/Y8rvzzoEuyvhhyqdnWPUbVKHOcdgoDTaumO4Spsc7EqLxqpsrfTNyZCap
 ME+hKj86UQB6/Cw9crRnplS+O7QsWjGUFZn4Amd6hEuztcCJbq7+sKuporx8h4x4q9LO
 cS5DiGeTP2sqQ5pNbNEIvYHlSUMJGnr5QaZsHWT9yVRSa1UX/3ZfXPvCuSgav/DsRRgH
 ZTRTb5uXlIAKUykygBtuMHzAhK7CO38ApOwEeqFe4oMN4aMkfEzqLoYWp7Zs8nH+4Q8M
 58WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i+RmpWYdLT9YXqB40aa5IblU2V7Jd0t07I3+IEu06Uo=;
 b=QlDbTwOqM8tZuXMMWhaJR7JPrGdbkG5YedpMDADi5NLurDNzKb3l9hn4PWkSf5dgqJ
 vGeiudKwfP3EqWLcGMI5l1nNedGbrACMdqOzy7Jw8rj+xbFixsQlzJ7d92t9CImMQ6wR
 /oHjhhx8aZnwIU3KFfmdg6w9UVBN+Aj0XFdeOMrNc1UpZiRYeUUtTr09QL8PHOFJGTjM
 F+K8Ai7Ttfck/l0X5tYyZsOZeA0tBeOFtEMN1Eb6+k1oFRaXdD+sg6nJva7qgkkoaRhN
 hghLbFgWx72wMRHKW31Jlkjc0D/+bmRB05Jt41Do3U8M92D+8lRBhS1R+DSDcS7vzp3o
 v6Zw==
X-Gm-Message-State: AOAM530v1ZFERufqJIo1Dn0xRQJh+l3nLi43RIG1LSfmREUkYfxL/UOV
 fGzoJaY0UiNmTSEk0bhdUJFAcw==
X-Received: by 2002:a17:90a:db49:: with SMTP id
 u9mr398137pjx.119.1602604980788; 
 Tue, 13 Oct 2020 09:03:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f21sm44164pfk.169.2020.10.13.09.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 09:02:59 -0700 (PDT)
Subject: Re: [PATCH 01/10] decodetree: Fix codegen for non-overlapping group
 inside overlapping group
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <084c4adc-9c9b-a0db-61ed-6d714e337d28@linaro.org>
Date: Tue, 13 Oct 2020 09:02:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012153746.9996-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MmZxbqmd4lXN

On 10/12/20 8:37 AM, Peter Maydell wrote:
> Generate a "break" instead, so that decode flow behaves
> as required for this nested group case.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  scripts/decodetree.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
