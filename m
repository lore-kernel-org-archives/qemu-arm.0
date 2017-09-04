Received: by 10.223.172.38 with SMTP id v35csp20589wrc;
        Mon, 4 Sep 2017 04:09:57 -0700 (PDT)
X-Received: by 10.200.41.240 with SMTP id 45mr74781qtt.284.1504523396911;
        Mon, 04 Sep 2017 04:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504523396; cv=none;
        d=google.com; s=arc-20160816;
        b=wEWOg0KHTZzBXg9KFfmxy4SEm2RpBbEiQyYfSCbOX2ECxjj+DMl1zA7i3mMkM8/W5T
         6VJLFzsCGh1XPZWKJ7zAJNBUPGOAY0LKEnmPInWdr5Tdcz+WTbCRBWU0CXjagTY7iDW5
         e+GnY1AU01MypH5oU7r1LfnAQQYMN4xlLHh0FpiMsQ0MkfNZP0GCw20Y7jl/5qo8IJYv
         F3LQvwf+2C/8eCm+zRfTbawalSLkKIDRWHwT/a1IY9l/xY+6jQv0l6pyMngmWu1f1Su1
         1eR+7gYFNBB7tSLPSFILRt22VOwzwwBVc8B3OzrqXO+c1FzXothqS14Tkmi0Utj8BCq+
         RYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=24oguqlcl7w1C/cPX94h6qITCjzQYmYQnct4EswG9bg=;
        b=eWH/KfzMrVvcckzKO8rnDlyFmivvxniWs1Y8niww4Er1krvL4psXtaZzj9S9f+yOr0
         2LbxAKynwfDUDe4TBl3XJuj0N7L2css76CYNK3+im5BdEv0ih0SfCVASkcZow7xNOdw4
         hJSDEIIpOa/ylmmHD7hpz4NsH6XtRSK3fatkHTpwP1PdGreBvJj+1zu383K1F169f3Tm
         1+29RU+u7XAK6TFub08YAGXeW43zAlgSFQ6/dqCScVdZA6lbgl+rLkRIwRBXkFc/Vv5H
         EGAPkkSeIOt9gXKb/PYMWxkyneUjIaGHyyyJ3hcatg6f8P9SD1psfHPk7tTsQs0Uiavt
         u4bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P5ka08Mo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u6si5420631qkf.155.2017.09.04.04.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Sep 2017 04:09:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P5ka08Mo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53876 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dopGM-0007Fb-KZ
	for alex.bennee@linaro.org; Mon, 04 Sep 2017 07:09:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dopG9-0007Cr-JA
	for qemu-arm@nongnu.org; Mon, 04 Sep 2017 07:09:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dopFn-0004oj-4B
	for qemu-arm@nongnu.org; Mon, 04 Sep 2017 07:09:41 -0400
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:38713)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dopFm-0004nU-S2
	for qemu-arm@nongnu.org; Mon, 04 Sep 2017 07:09:19 -0400
Received: by mail-wr0-x235.google.com with SMTP id 108so542133wra.5
	for <qemu-arm@nongnu.org>; Mon, 04 Sep 2017 04:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=24oguqlcl7w1C/cPX94h6qITCjzQYmYQnct4EswG9bg=;
	b=P5ka08MoVfC+31LrIxCyxv0U30Uqy15JG5p+mfsLFAhIjMmp0HihKDLMV/CxkTdgx0
	XDJEyD0NAdv+W4J3/5xosr0/4AQR7g3m7ys7BB88ZcCLRJYTgXTGNeov0DznBbg5OVvn
	lvGoiPFwC6k4CcUWLmiERNoA7nI6GEbdTC47o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=24oguqlcl7w1C/cPX94h6qITCjzQYmYQnct4EswG9bg=;
	b=K9bNhdFfzhi4zFfJVXT15qK3AnH4i8GqHaoQMt2+xKIPdVpuAWZUOjNg/WpsXSnkwO
	YYMIeADdQhr5Hp1yeO+LUHjYuPT27ay9LKCRBTTLTxD2SiM+HC4Cp1sZvDkbv0viL7oh
	h/i83KxDZU3w/VXDT1ftG0boBEv/FHPaJ3XHxFuYwJm1/3QTF3GRfaGUIrYx0q8Dzr6Q
	SS0K/oV57ZW5NEq9B7eqUqge5bbg3jlWavaUWjxRGlcDDi2yz4gR9syEBqyDeh2QUf/9
	bswysbsspJVKQN+Q34CeaGK0QjTVirakp5Lf3CSmrsVw16O8UADdkCdoCMUNjhVD3g+P
	+WuA==
X-Gm-Message-State: AHPjjUhMU9Dxk6pkNXdvvSWo4+0PJb2R+HebEP6EauvoWVX4+OCxCbWT
	0K5ACiPod+u0vf16BtnDjjmjnn6khdwh
X-Google-Smtp-Source: ADKCNb5Lk2a+wdEhl+fJ6vOlZXuvHd7oEuczC358S7Jyf+wpoHWE2amdEEKxlVF/ZGD6ZjhdFOqsXKGXqPHNcAZV0OU=
X-Received: by 10.223.135.250 with SMTP id c55mr62086wrc.11.1504523357617;
	Mon, 04 Sep 2017 04:09:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Mon, 4 Sep 2017 04:08:57 -0700 (PDT)
In-Reply-To: <20170825224833.4463-1-richard.henderson@linaro.org>
References: <20170825224833.4463-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Sep 2017 12:08:57 +0100
Message-ID: <CAFEAcA-Wdth5paDKF7m0g9BXMwphPYLP=9-u+KtYb-h-GaAuBw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-arm] [PATCH] target/arm: Fix aa64 ldp register writeback
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yMwYmqu1aR34

On 25 August 2017 at 23:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
> For "ldp x0, x1, [x0]", if the second load is on a second page and
> the second page is unmapped, the exception would be raised with x0
> already modified.  This means the instruction couldn't be restarted.
>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-stable@nongnu.org
> Reported-by: Andrew <andrew@fubar.geek.nz>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1713066
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)

Applied to target-arm.next, thanks.

-- PMM
