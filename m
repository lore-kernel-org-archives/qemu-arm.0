Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3885954lfq;
        Tue, 12 Jan 2021 13:04:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEkHLW+LYKIqd7FKQXjE1E4ZHcMKQmSVvIonJD3PgQUbVJhnqmhfEqB9O/RhJtnpFP6rpm
X-Received: by 2002:a25:dbc4:: with SMTP id g187mr2144376ybf.489.1610485490501;
        Tue, 12 Jan 2021 13:04:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610485490; cv=none;
        d=google.com; s=arc-20160816;
        b=XJ/NzbIb3q9VFBapE1l0LflOWtXjU+kirUs6OEBhfPRasLcBBN72Yi7auTwt4Mtkmd
         dZHBdohDL6Xe3JbEnYTFZmapNVqvwUUJu8mdfHT7kQYJx+HDtVuaoUUS70RDZEni6cbC
         qvx9kgU663mPwn8XC3N75H97PC9dXDIpykw6oAgNM0sAOidvjgPwLjp/mjSIyUad3fbI
         8LBmhPrm7pKZNts0YNgIUoMs6qg3eAMeDQfNI3T2J73UL6J7w6jRIaVqwcithEQVT7fk
         r5DvHixRu2GfKliQPA+wzOWY1RECq+YaNdaq1yQ4BP+0/ZtSIe5ecMtvPYCTz6gEqtYr
         QVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QHWJqvdEGGlIyfckLRxXx1RAqWiM08vwqtkSa+jKPsw=;
        b=xhPeHZsersJpVvGiPhJ5YWqhCOt1t0VmJeABsYsoXbkjwlHt7kARW8CQ3G16cpPC0p
         wQUcE/eIhM/LwQ6BF8JqFLfU1UT/iKN+DYiZAc8M9HKADYjBH9XE3vPqPC6IUW3uUuDQ
         rLRZFO6IAYmdwfaGERbtZwhi8liSRzPgPpZQKbCRo/5ItEOpi0/y3pZmadt5PQXSQDQY
         GzhwM8hzvLhcFnc8No1fOijnf5sBeRDdFME3I5BQ261/3mQ4m4TbMuYRIbo2mwvETy/3
         CDnTV9e8GiFBZmBTEE8QI5H1FBzuXg58RjBcz/Dr86lDNUPo3JBksWj5JYXPLhyQOag3
         K+mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VHWbVERk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si3503096ybt.380.2021.01.12.13.04.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 13:04:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VHWbVERk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzQqP-00075c-TG
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 16:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzQps-000721-6p
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:04:16 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzQpq-00006L-KG
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:04:15 -0500
Received: by mail-pl1-x631.google.com with SMTP id g3so2105873plp.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QHWJqvdEGGlIyfckLRxXx1RAqWiM08vwqtkSa+jKPsw=;
 b=VHWbVERk3eASe+NY+azbQeG9Ji6JMY7RniVKQpTVEdaSS3PZTsLmb4w/dwqFMp/Cfa
 T4fLReQI1mWerWmMwb935OInX4KgTUoi4hpgrEm6wR1G4BARlrSf9JeHLWAhPYoOJ0YR
 /uE1F621uT2THzmHTAoTg83h2/ykrmL5t69dgqRTCnmXe2RoajH5bKOQ0COwC83vkabX
 uToWGsjPw9pdlAPxWkq1aIdG/+RvU4/WBNKrv1dQBzOHrS1Qb3Dk2gLnwhcKfMFSHfjp
 r+lgFb738cZc4wa0xoUyApC7NqfIZeudj35gMrbJg2tlTsrqDSN3Q5OhEUA9oQyFF+aE
 BPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QHWJqvdEGGlIyfckLRxXx1RAqWiM08vwqtkSa+jKPsw=;
 b=Hl2QRtK5Uu8x1QnchRaFyYME5ujZw4qqLksU0gEuJqokt5wa4chkI4O0M1cCFGb5Ay
 d5ZgYS7rYqLLnHn8QwqMDultC+Jr21QLVWzB/aldIIaZTS5y79XmUhZMJyaPYlUbRo2y
 9ZvHH5demg1Z9dkS1Spe8Qe+/2OR8M+Gan6jIrh30bddFeU6c2f0oFKeCwINy7fldbG/
 vS8idZw5nwQq8hGaGpAwra5L8H49wmgVPRML+lzNAcNDlZFL0rfk6UHfDZwT7PEwqwiG
 a+R6xYDRGKsIs4mVZwUKXoC/MCNfPkGp5pAGCJMUxoA1yI0TckgBSbgSHlfhahhS/XSW
 46vA==
X-Gm-Message-State: AOAM531oqBfrlM+Oa7BsgokMtVp/t8wVp9WJUkn4IVbRbVBq8OYLznmo
 khGqp2p3UPyX4EZjJvRG4t3uiT33CGanPQ==
X-Received: by 2002:a17:90a:4209:: with SMTP id
 o9mr1047118pjg.75.1610485452844; 
 Tue, 12 Jan 2021 13:04:12 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id g2sm4962214pjd.18.2021.01.12.13.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 13:04:12 -0800 (PST)
Subject: Re: [PATCH 16/19] target/arm: revector to run-time pick target EL
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <12681824.uLZWGnKmhe@basile.remlab.net>
 <20210112104511.36576-16-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8bc3a75-363b-f1f0-b97a-c11447ff2e85@linaro.org>
Date: Tue, 12 Jan 2021 11:04:09 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112104511.36576-16-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gwAEQoysMxU0

On 1/12/21 12:45 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> On ARMv8-A, accesses by 32-bit secure EL1 to monitor registers trap to
> the upper (64-bit) EL. With Secure EL2 support, we can no longer assume
> that that is always EL3, so make room for the value to be computed at
> run-time.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/translate.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
