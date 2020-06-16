Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2849430lfm;
        Tue, 16 Jun 2020 11:18:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4JW9J+ffAGO0XBrOVOm16//q5Aq8VCLCesrsGrNfbXS7F7jrx3b6B0rKBnbAQAYUIrczA
X-Received: by 2002:a25:7386:: with SMTP id o128mr6095674ybc.266.1592331539171;
        Tue, 16 Jun 2020 11:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592331539; cv=none;
        d=google.com; s=arc-20160816;
        b=ac2HbfA8/r/CCQaLVyLl70QnrXxpOR/O/xwZ60I38dPgwT6THzErjzRUrPFPTrBp3B
         ws7RkjGIGE8hymhwyv+yZdL8a1Ii4J67+jwFJz4QJCqZDWuZE09rgzGIo5Mc0qaouLjg
         hMwX8s4LaFOMTx/3n1/Lx9AXfeUQZ0Ww07ds8/oI6hpb8wT67bX5oCtBoiglLPhNC63D
         EV77bNkVnX8HB0XxQ/DuYXXPX/KWK7lBKYtPonbp/5wTn/YSyUsO5I6w3tjyotVyFTLi
         I1b+atEyLbcCQZPcyU0fM5VSOxMX2x/op8SzpXLcy/HYiGEyuA1w+bWZRz1GPj+9Lpb0
         wlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Ixv0qVVSKgtQHXUSiBt5c9qUuMecZtLrd9j1SkGWHU4=;
        b=M/hjn7+mzq1PKwYz/3W+CVVOzX9ug3lela5GlSfnFHJOwgETbo0hOoRs5Rz5yy6wVY
         sq3/OI4AWC4c8HQ/bFmF75ojhO86b4RBnS39Zb+e/NjccrdZoMjaIjlRb/oyg262v+/b
         c0fSMDARCy9bH2/zfgQrNbJHVfc2WFQ2gg9BisRk4Hzhjc/yyJ4BiSxT7iTq9mN562Q0
         bfnIhOpSBEttPQCN8/LUF4tnPVEbfIT3lw3n2nPgM9KfwZX/6D3Za4WfrSpT7sDgJncE
         vEs+I2S4FOzsnOOfv2yqZqUE9s5OXe0tc00OZ1hYOc6ZCeKuP6/Y2xSY7KeuHgeQ6HNs
         cvog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QT52wECj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1si17439764ybs.237.2020.06.16.11.18.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 11:18:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QT52wECj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlGAk-0001HH-Gf
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 14:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlGAb-0001H9-Mg
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 14:18:49 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlGAZ-0003Lv-GK
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 14:18:49 -0400
Received: by mail-pl1-x642.google.com with SMTP id k1so8645531pls.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 11:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ixv0qVVSKgtQHXUSiBt5c9qUuMecZtLrd9j1SkGWHU4=;
 b=QT52wECj2VluwLSeXHUqf23yIvH1HsUaCqvTSTAQJu8AYv/MJ2/Xnx53lXhgw3W8Rf
 2iGWrEzRzabvSNB0uvo3T6sLUR5VcCww/x37RRdOjprUY32oi/QM4FeH/ZTGSGYS4bPw
 gdX8HqsVpxiU0V5OUVvw1rsZ/bf+QZoLnUDGd4Myw83/rRlHlrXDhdENA0NnAAW/Riw6
 fxxTiFRnfQw6pdwG5GdbeHrYvAo+Yy4JAzzXKxj63kIBvWHVLm1r1tiWx52r7Q5I0hg6
 KiALemtXG4MrH5BxKt0k1xOMet1Urs11vD7jLvhplhJS6kAyTg58cR7RyADiyYpMEuHj
 MrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ixv0qVVSKgtQHXUSiBt5c9qUuMecZtLrd9j1SkGWHU4=;
 b=O29cRqJtZXlD9RtLZpdDrzr1rBmGnZJ+DhMardOzaZzHtLtx/U1yTPdGNPmwswr1Bj
 zwZVkIQgBYIjA2rqVHxZfDtkDvYxUMVPoDRfdgC0VxMUSkJMh+YBW0mIjHrxlodxqyyk
 Y/nEUmfS93vOreg0npFtRnGTg8U1cyX2s/7Y/chpoJKvWf22QD8LPzYG0VUkvTi/cT6l
 DoRkGK1j+kz72RRIL6rBWokH9XQaD/qxcEEVSozMgJdSy980smpoZGje0W8sN9gqkFsi
 oqWwkOfIyUhmpljYTJRe2f1X/ZPOp+ELokp1sJTnJ19+MDAXSwCWZqrgh99fe8TD5DDJ
 HDgQ==
X-Gm-Message-State: AOAM532PbcpQQFuMkS53QezATz9j/LwgrLfhnipaoVwUJUjocutKY4zy
 t0L8uaR24qUN7aQvEJ5OmjVvJg==
X-Received: by 2002:a17:90a:32ee:: with SMTP id
 l101mr4263446pjb.213.1592331525708; 
 Tue, 16 Jun 2020 11:18:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id b11sm17810745pfr.58.2020.06.16.11.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 11:18:45 -0700 (PDT)
Subject: Re: [PATCH RFC v2] target/arm: Implement SVE2 TBL, TBX
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200428144352.9275-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b7412e55-f2d6-eb01-d95c-26b8dfb194d9@linaro.org>
Date: Tue, 16 Jun 2020 11:18:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200428144352.9275-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L2g4iAs1TnKV

On 4/28/20 7:43 AM, Stephen Long wrote:
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> ---
>  target/arm/helper-sve.h    | 10 ++++++
>  target/arm/internals.h     | 12 +++++++
>  target/arm/sve.decode      |  5 +++
>  target/arm/sve_helper.c    | 71 ++++++++++++++++++++++++++++++++++----
>  target/arm/translate-sve.c | 20 +++++++++++
>  5 files changed, 112 insertions(+), 6 deletions(-)

I've rearranged the macros in sve_helper.c a little and queued.


r~
