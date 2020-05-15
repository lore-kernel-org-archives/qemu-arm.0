Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp881963lfb;
        Fri, 15 May 2020 15:16:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDiGuwBp+H0J6YeJCYikqFSBURAjFdYhI2IZwdl7QPOS1AsAR4duObpdtNseD2ueuX8tgD
X-Received: by 2002:a37:8d85:: with SMTP id p127mr5779929qkd.44.1589580999613;
        Fri, 15 May 2020 15:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589580999; cv=none;
        d=google.com; s=arc-20160816;
        b=wON42qmOz2BxS5K48UICSs8MnmkDOV45YVkfV+Z6TZes55IFZEJejKu1QneFIsQa7X
         81tM0fh0xbUdZiiBS67Jl+QOcojhGaiy4qkEbQyoOhy5N8yecYPTHIlv0uTWXJ3s3vpD
         A7W05ggGAGTXiz2e03zsJcHjwTeH2DjZJKnO6KjiEcYayT8u/WTfb1hf+jBzbLS7UobF
         xL9D+jG086YoBakgb9cwEk81D1TwRncQ6b7B5UCQkjzGtQ0phgXQ6sy95KsCHPN4384Y
         6N/U02y2CGdtbF/ZwlSTwrJwSv/s4IpiUVWuOd1uzj19KWHHygRzejlCJtFk9igLCfq3
         cLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ztKdTXaWEcuKjhtsxzmm1tFS6PUpf8Nw0jAd99wSI+o=;
        b=UyivpwoGtjt4b1ry6RLBKGt3IpsvbSnRr7g6Udy20T4QgLsyHYZ9py/uls9xaE/Hkf
         8KDfNFxv0IhIXALfCqwiZR7iAgEZdJjj3BbFuZBgaKJhNXSDMGRTy0+PpQ72tmcXiuco
         3GsaJGTWRYixH0luUBAyI4sMdVoZXl64qsc/yveo3QYUKTcTexHI+CSHLETFpNJ6Qqqd
         15jyZwu3ppYVlScmf9xdCOjCXIbGSttQ9+eJySpW7q6dlk5UlL+GZ8AMnEudV+ydsRSU
         veMRdRt+UI9Jbc7rJLS6ad4qMR9WBo40MgTvWShu7GI8xFQM42RR8aLYjDpSbgsA1arw
         x+uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QI9pSivF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20si1925432qtq.135.2020.05.15.15.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 15:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QI9pSivF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZidD-0006Rx-1r
	for alex.bennee@linaro.org; Fri, 15 May 2020 18:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZid4-0006Pz-I7
 for qemu-arm@nongnu.org; Fri, 15 May 2020 18:16:30 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:52631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZid3-0003OL-IE
 for qemu-arm@nongnu.org; Fri, 15 May 2020 18:16:30 -0400
Received: by mail-pj1-x1042.google.com with SMTP id a5so1528437pjh.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 15:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ztKdTXaWEcuKjhtsxzmm1tFS6PUpf8Nw0jAd99wSI+o=;
 b=QI9pSivFjeepo/wZiLUOal0JGhSXmUd19QDAPznBzfWimGTcS5yDHtW2G0pdiJNPbb
 nQwPRlaEYgOENFjuu4+OjK6OufcW8kkQULAroUezkTUK4JZbbGKr8IuL2xGAezAF1k4t
 r0iP9vVq1e0D8HeMwFsv6o9JnzQ09ms8qYZGVDZUdF5q8IdP3xJL77wQjHFQ+Rj7QnIT
 12OQ6ryi0p0XfnUN2olR2RAGgv23XKqkkx8QDJmEGv1cFPhKHKN0Y3+IN91jp90qRvp1
 RrmBf70NH9ULcp9r4TaziW7wEuU8J1mLCVNo09vLqeCFeG8/Vwu1PuKM0Cy5OvVfH2pG
 zzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ztKdTXaWEcuKjhtsxzmm1tFS6PUpf8Nw0jAd99wSI+o=;
 b=Lu3st09ETys1Td2aGqpn8ERi3V+Msu/tJmFBsxGW70rWFeIHBPg7e+HeQIiU0UFlG5
 Kgi76846h4bN37+4c87eIEHlZyyGnacGj5IRjgVjO+eQ7zi4q23KQa1huJdAxXTn9G17
 BdYwZIRNJxolSHQDe/fnc/ZdLYUUhv6LYXUBQh4dFNODpde7So9yumGyyxmg+s38tZ5t
 dof9863WQzL+ewNG/t7wjL9OffOoT1P+v61APsabIsOlq+dxfboMqksWqq8UOFK42eso
 mQUCoct5QcHMaXJmf1/DctLb1r5JkGMiUqfwbjqWaSw/cQY0dWYQ7ZvJ0IFDvv0Ootea
 g7cg==
X-Gm-Message-State: AOAM53011BHAtXFZyCUJsg1+MUNJFEUH3V0wrc7iMy7vjy1+7XifaDw/
 ccoHkyiojmsTMR1aITDhnnDjuw==
X-Received: by 2002:a17:90a:4497:: with SMTP id
 t23mr5800900pjg.88.1589580987966; 
 Fri, 15 May 2020 15:16:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id c1sm2478705pgk.76.2020.05.15.15.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 15:16:27 -0700 (PDT)
Subject: Re: [PATCH 02/10] target/arm: Convert Neon VSHL and VSLI 2-reg-shift
 insn to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200515142056.21346-1-peter.maydell@linaro.org>
 <20200515142056.21346-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <79286fbc-ef38-69fe-a3e9-e8c013b0dbc6@linaro.org>
Date: Fri, 15 May 2020 15:16:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515142056.21346-3-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KGAepk2BsBzh

On 5/15/20 7:20 AM, Peter Maydell wrote:
> Convert the VSHL and VSLI insns from the Neon 2-registers-and-a-shift
> group to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       | 27 +++++++++++++++++++++++
>  target/arm/translate-neon.inc.c | 38 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 18 +++++++---------
>  3 files changed, 73 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
