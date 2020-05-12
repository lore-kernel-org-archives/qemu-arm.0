Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1348026lfb;
        Tue, 12 May 2020 10:18:15 -0700 (PDT)
X-Google-Smtp-Source: APiQypJDZ9RBP8Ttn3JNy8USRvDqLQlNLbHHGZ/5+tT04siJKycw1PxxPA5igViAzj09A2eazsFe
X-Received: by 2002:a37:7745:: with SMTP id s66mr9647345qkc.429.1589303895033;
        Tue, 12 May 2020 10:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589303895; cv=none;
        d=google.com; s=arc-20160816;
        b=KAlCoQrY0kah5l4tH/f5swKyYaeZvJgJyUq6/RQYW7hTXYAmJycVyh4vJtW0cAm4o9
         yvabZmf/C1InqkGJiLzyxUM699NSStUplkItZ/M+Pz3rA9g4zk/0k9OTl4991FOJCQ4r
         +Fw+kkMm83DEOcfjHk3j1J6Vxt8G/Kxn8y5MKMghfAxOv5z3mUpo0cH0ftZfEKXOCtoi
         iI1WdPdHoSeAKB9P/GN+Td4LcgLJlAiHrUbJBV98zDCwdJJWZLbNs5expCUdPr9L/EEX
         L841V+JWuHr/EAm8nw1EAQc6+gfBi6yAJtQtdvXCLkaXQQ/ggZnawvhHlxQ2dvNBgJGt
         VoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=WCmG8NceZRyTKj/xY60V7+ftAOxSguGIXh/rAYmdL/c=;
        b=BkyMps+6HpS/yHTwuLm24E+XyiIIoNanomjVZ2o137yTGKX7BDSETHGzTRBIv8dW2w
         UCXlPMFTYjI1ZXSyztwZqkr4tWJI1IHL1EGg95890hjut+7xCa2A86t/Bm+zj/OhoirY
         X4T88mVSfkLaH0QE9J0DcBqADBiVBGu5JjIiQzujJocjWneRv/pn/JpdD2xK7+Ol34nu
         HytOaxQ48NBSciAqUFoi3gFj3DeINvxMZdL+6n36ezKO5cQGrmtDKScyeyutPZOApCSB
         QuUNum/Sm6sBJf3JHLiBUBmelF5wALvH8BWxrgkMrWrHJ4NSC2eSwW7XFyQsU1Q/bm6E
         0GOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=m6zPJuCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si7832276qtp.275.2020.05.12.10.18.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 10:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=m6zPJuCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYYXm-0002WX-Fk
	for alex.bennee@linaro.org; Tue, 12 May 2020 13:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jYYX7-0001xz-My
 for qemu-arm@nongnu.org; Tue, 12 May 2020 13:17:33 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jYYX5-00014E-Ea
 for qemu-arm@nongnu.org; Tue, 12 May 2020 13:17:33 -0400
Received: by mail-wr1-x444.google.com with SMTP id e16so16502054wra.7
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 10:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WCmG8NceZRyTKj/xY60V7+ftAOxSguGIXh/rAYmdL/c=;
 b=m6zPJuCD1+RjnqmeDQMCw5QIY15OSj+E18XmWlEU+019ct63MFCyXeAfPegrq0CdP1
 GlbxwqxZBhDj0yylk6sB361+QNIXHFkEB2RFRhIQK0hB/rmhPqPoLIRKa5m+pY7vF+Dw
 xnWbj5Pr3jo+73DEoCrU55YyZYPBpejxWAcRSH/X1khr5rZscpR/d2y+0AFot5wogWvE
 GuynbDDYDgUoGWaJbOdz9rhtX9TkIXlW+qUsFDohrlsbebfVJdGVHxA7yTI4YdDfs4VN
 WTFD9ThWwnyh0Js46Zs1LhBXAN3RHZbt/KHugL3jbCctreUhL0VfKT2FHdgomzEpUnBL
 UEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WCmG8NceZRyTKj/xY60V7+ftAOxSguGIXh/rAYmdL/c=;
 b=VJVpps6ABb/eiDUGkZ5u++GXNLAGfdh7UUGDdEw39FIGw8ZhZsdjIgtXZbej7sq00h
 t5Lw1oWDiyxZUTIIkNiWRlqUUB+urTweuWRoPKRXXIKZeyJcil4knEc8cfgTEYJdMYut
 lQ1eIU+b56jiXQp33cbSXdVPpTWE07AEFHfbJC1XAGe8gzs+C6qat5JeVij+gZ0ZJkt6
 faZjTQDnuslcjW3CREbs1eFPjsQgSDQX0QRUll4sWMWC7ocqY99Wgr+ClfrQFr0gQ3JW
 Q8udZZjKCs14mrWeyv+YV6LoQIHszqW+bixBi1Ypuc9equ7NoYp0Jubd9kkKy1hpVWwG
 s5Eg==
X-Gm-Message-State: AGi0PuYCxEeqFD67Bm/8JgLS/Bzw2YdJuWeEmNJsXoDsenAjIrNkpXgK
 /oAlwo3xneg91KQJ7Xw4VVh8xg==
X-Received: by 2002:a5d:448e:: with SMTP id j14mr14015145wrq.261.1589303848055; 
 Tue, 12 May 2020 10:17:28 -0700 (PDT)
Received: from vanye ([2001:470:1f09:12f0:b26e:bfff:fea9:f1b8])
 by smtp.gmail.com with ESMTPSA id a24sm32185404wmb.24.2020.05.12.10.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 10:17:27 -0700 (PDT)
Date: Tue, 12 May 2020 18:17:25 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Radoslaw Biernacki <rad@semihalf.com>
Subject: Re: [PATCH] MAINTAINERS: Update Radoslaw Biernacki email address
Message-ID: <20200512171725.GN21486@vanye>
References: <20200512170704.9290-1-rad@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512170704.9290-1-rad@semihalf.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 philmd@redhat.com, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TEkxLuaRInlF

On Tue, May 12, 2020 at 19:07:04 +0200, Radoslaw Biernacki wrote:
> My Linaro account is no longer active and stop forwarding emails to me.
> Changing it to my current employer domain.
> 
> Signed-off-by: Radoslaw Biernacki <rad@semihalf.com>

Acked-by: Leif Lindholm <leif@nuviainc.com>

> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 6412067bde..668da447e3 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -46,6 +46,7 @@ Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arikalo@wavecomp.com>
>  Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
>  James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
>  Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
> +Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
>  Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
>  Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
>  Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1f84e3ae2c..a9d6893036 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -799,7 +799,7 @@ F: include/hw/misc/imx6_*.h
>  F: include/hw/ssi/imx_spi.h
>  
>  SBSA-REF
> -M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
> +M: Radoslaw Biernacki <rad@semihalf.com>
>  M: Peter Maydell <peter.maydell@linaro.org>
>  R: Leif Lindholm <leif@nuviainc.com>
>  L: qemu-arm@nongnu.org
> -- 
> 2.17.1
> 
