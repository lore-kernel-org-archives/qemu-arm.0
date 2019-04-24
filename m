Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp74793wrx;
        Tue, 23 Apr 2019 19:35:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyBwKY/Kgr0dinna8h1KnU9/bLsvMnwZWvkv01hnWhApY86ecHtcWQgW8zRO6q5ijhJZah/
X-Received: by 2002:a1c:9ad1:: with SMTP id c200mr4864532wme.140.1556073358750;
        Tue, 23 Apr 2019 19:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556073358; cv=none;
        d=google.com; s=arc-20160816;
        b=z6CS9eCSsDOzSDqtHHjsW7awlDXLXTpB0ICKc4r2MGxLr2g8zVkk5xbCArOqav0+Hz
         /4aorqgE6LoojkvCTTRjMlLq4AKCKlGmuQoEJUZ9IlFcx5l50GbpvIT1+0/6ggeET4M8
         Ge6PywMTz0PtvNYwSDuWL7ry71of+q3sfc5KwWPCQ/3cK7JJDIPLJf/96rryLRPeqRxZ
         v5DANWPthTFpG5d8tqqi1vJvYHiTycg1xDkyYlIL5szHoijb1d/hRfOtl6zFtVh1KL1X
         uNnX/4iIa5G3Z1O+WB/jqCUXkQTOpnn8kBH0GXm9e7fX1aAZty25i1Ft8AykoN5WuRNF
         ag7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=awSJgQAoQVA5ExwYBvo16thb3xfdL8UgbbmHfDB5SYI=;
        b=NSDl/Bk6z1DJFHMHhlgyWEYxFO/1RS+6JLDH5TylG0xsabEfqc1b7ySMNFStM+jhnb
         Vud6rxxL0m8VcJGcqjJhByZWYq78WH/VFW0hcpNpFcfW6/rXR2c9lHwsaknxbPC+GVaV
         BFO8vOWSU9LdpA4owYBILSacQJ2bK6XUe8j+M58Pbi5dg4bkZdTuI8N+FJYUkk7IsUJW
         ooUfzmMymV/TflUhE/1u03g6e7pIyEQVA7tRkDKQNESbLoNWOoLh7n3on+usUnkdQ2/0
         yOexA/Mm8Pu7vGQVXzFN97SM2kFU4NiL6TObF5XtYdsjlU1JKD90Us6uw4gk0MixJpJG
         6kcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HeEuCPco;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si13103280wrl.278.2019.04.23.19.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 19:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HeEuCPco;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ7lN-0001PP-Qo
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 22:35:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59640)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ7l3-00012E-Tp
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 22:35:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ7X9-0006Kt-UK
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 22:21:17 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:45458)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ7X8-0006HM-0N
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 22:21:15 -0400
Received: by mail-pl1-x635.google.com with SMTP id o5so4125461pls.12
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 19:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=awSJgQAoQVA5ExwYBvo16thb3xfdL8UgbbmHfDB5SYI=;
	b=HeEuCPcob66BMK78I7Achv0OG1p1gwK67/AjuXy0y1BFK/uWO+Y2tihJsniM5c32S4
	DVWFN2vEoTT/nFEyMrRqey74OgZBJvCHDcXP9SvIMAfih7+6++bXFPOT8Skmbu/YEkZy
	d6w1OJ5GUknKAHyv3GVMwwlg0RWqEJnf/CWIxf3Mwpq+GCmUwDXGzKmw7NS7TKd6Fzwt
	yaoye1ejquc4MY9/hLyYx0WjEk0OczLQZ+4QzNJuNp+tfGGhu/qC8/kLRmyh7WabvzX4
	ZPXVBaX3tFC+thg+eGKTpNKbOmShg+gzanlTWYGiKP1DD2E0qqDhOMWYZ1Y7IdBFR5Cf
	h4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=awSJgQAoQVA5ExwYBvo16thb3xfdL8UgbbmHfDB5SYI=;
	b=JnrRk067lCTplclaXorOeRGeOyZ7MX4RQB413w/qqLX549K1yzmnv2do2z//2ozyv8
	gD3SBjPBH0dRFBMpNFB+WEp5ImgtgqgRkfE9sehFd77Yg2sZFILICtavzowJHQ1vZZaz
	uouueYzax2oSg/o0B4UMvrddxppy/MEYRgBKWil1yZfS/ey1vs8doaWTw0MoRGOcwMTa
	wAhgNaPvBjMx6kjo529Ud8B88+c/fXe+Vsi+P14AS86g5Yn/SwijWicJk1fo/aBnscyy
	6RAbqYA3nLDpQa6jxYpT3AHuR8cctPGuS3ealeUIChVUA+ERjLFofFczPSFU89bHi9bh
	4QOQ==
X-Gm-Message-State: APjAAAU1t5tChVITHYSRXHU0LkQ9dXX8DUbhfVIaq5lCg1+bnmWx7pSs
	+R+o3dAIcbVfyPctIxvjQjURlQ==
X-Received: by 2002:a17:902:7294:: with SMTP id
	d20mr22204808pll.300.1556072472439; 
	Tue, 23 Apr 2019 19:21:12 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	v1sm25573039pff.81.2019.04.23.19.21.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 19:21:11 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <772b2b44-cdaf-7fb3-2c1e-a9ad5f7ba76e@linaro.org>
Date: Tue, 23 Apr 2019 19:21:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::635
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 25/26] target/arm: Implement
 VLLDM for v7M CPUs with an FPU
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a5xMkdvmYD8h

On 4/16/19 5:57 AM, Peter Maydell wrote:
> Implement the VLLDM instruction for v7M for the FPU present cas.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h    |  1 +
>  target/arm/helper.c    | 54 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate.c |  2 +-
>  3 files changed, 56 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

