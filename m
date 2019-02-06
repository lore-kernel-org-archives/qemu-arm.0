Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5483451wrt;
        Tue, 5 Feb 2019 19:25:15 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbPFOoYo8XKqsMQnNQguL4jljezyYgXG2hM7a58YIVaKPZRj74rIAd6xX9bwBAcUUqY7vzI
X-Received: by 2002:a81:b101:: with SMTP id p1mr6980616ywh.454.1549423515201;
        Tue, 05 Feb 2019 19:25:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549423515; cv=none;
        d=google.com; s=arc-20160816;
        b=JS/USR4lK62og5DKzTyKecsbuWWXU1cy+5WbPiLO0B6oyDJs+GdZ70Y8oj90fuwUfs
         h/9/mQSb8jKR8ktiYNMJay7DQhV2eYSVGc+1sN2tn7gqHibDoqcusJCDREaQqzBfMUt8
         EYgsgoLBzlbVOJranSZmZ49ORtgrLI1bTn22vrtxhzBzMpxMUjLBB6WyuCsteAqQ42C0
         ARiIeCeG9E+jvA0qSlGGqj17qrwr4L/ENqf2mJcbRFNsAowRNty/LujSgKQzpn2kUDqq
         L8kbeDcZ7eBVl+eGD/EV6zQKz0U+F/r5PuunuhLyret1z7Vb3u7eWruKFgClpuZtZp6A
         et1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=giq3nSiF7nqJUVXAUTg4rV9g2cL0onJfe6G8lY1Jopg=;
        b=BJsf39dkUdUaJ6KDph1DwV2vxLvhMNcWDGNUk9jDefVIQT0SjWq7tZAsMkSYcSWr9d
         c99lAEow74eul8/mJuySsjoX4MF5/ID1SH2KTwQBpqNz8n7hHTXckkmZf+r8VssplbFY
         gVsM4O2MFWnou2F/A4dcxtMHtZVT8yXUHF1uCAjwQgW4pew6W8KSuiC52w7Y595xn78i
         wbyOlWGYn+DguhCUrm52Rb+MaECzZ9BiwsUcxaKMInYHJXH256MsjqPQZFQq55BAKuW6
         iAvaX1lvWo8oSc+UBBd0V0T9ZX7z5k8E4HPcr0xGWO72ZAzar/w7kfIt5HWcpZ5yOWL3
         mCdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nVTHAuLc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si1903765ywc.204.2019.02.05.19.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 19:25:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nVTHAuLc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grDpq-0008H0-KG
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 22:25:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1grDpU-0008Fs-B5
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 22:24:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1grDpT-0005ZU-88
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 22:24:52 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55306)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1grDpR-0005LY-6j
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 22:24:51 -0500
Received: by mail-wm1-x335.google.com with SMTP id y139so968922wmc.5
	for <qemu-devel@nongnu.org>; Tue, 05 Feb 2019 19:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=giq3nSiF7nqJUVXAUTg4rV9g2cL0onJfe6G8lY1Jopg=;
	b=nVTHAuLcoSTL3CqPJDzTjVbZfmaJ0SD5jrNvjyyz1cE9RkaH+q7lH1vvZj/Tlasx/7
	s7if/MSB2+rotFs8yXRF1dHU+6VRlhYXNLmyQkb9SvUDsqUHqK3NKWFnRauo3EWk6jEx
	VSorbjXsnEdjcIN+snXHUVNIqNI1yOkbsR4A2gRu9ft52UGBMN6i8YV5B2i4wWasha5h
	F0z3P+uEUtKyxQ53Nj1VoMEONMeSOX7i4QT/SYKkmSfDBpKn5l9jaakBhqI6qD0YkXSc
	JgI8ZW+AnT7DR+2t46BavDjRWFASLB1+b1jXC7tQJzGAkn3JcEac78GyyC/2zlTZl/jM
	Dy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=giq3nSiF7nqJUVXAUTg4rV9g2cL0onJfe6G8lY1Jopg=;
	b=mPCtQAKwemW/svZrLZBpr7fQp1R+VeNPrOecyKG3mavoaWOaJf7PKfN9KdtHcoQH0t
	mv2wb276w0gfNh8CEHLB+659uLst+lH9SzhE+0dXYC2J7UmMKxHASBLlmkO0mPcVWuf0
	o7sC6GGa1dPbr36EsucIK3oAxxBW5uN7ox+QnE4ouWNGkyHo2hgEnNrV5cB3pgJMltNS
	XOOrAbZfdMwhPwlgrF7bB1XwFusaKbVgRbAw5PrXwSJFvwMYFVtQHBteTBobrQjp4n0h
	BH9Av9xck4EtgFMPPMvKn2sqR8T4wk4Ik63t+dR5OX5MKHuy0fW44HK5V4h4sIzolCwL
	96+A==
X-Gm-Message-State: AHQUAubZJRGWBCnpN2GfJhfeuc5R1wKKE2YX80QB+aXWmFuksQ65PWag
	1uCDzFqiX+qAWCquX6fsZY0Pyg==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr1306639wmh.92.1549423470633; 
	Tue, 05 Feb 2019 19:24:30 -0800 (PST)
Received: from cloudburst.twiddle.net
	(host81-133-38-158.in-addr.btopenworld.com. [81.133.38.158])
	by smtp.gmail.com with ESMTPSA id
	g67sm26633588wmd.38.2019.02.05.19.24.29
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Feb 2019 19:24:30 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190205181218.8995-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d455efb4-e64e-dbda-621e-a714dd6c7df2@linaro.org>
Date: Wed, 6 Feb 2019 03:24:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190205181218.8995-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::335
Subject: Re: [Qemu-devel] [PATCH] target/arm: Implement HACR_EL2
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gQL2yPjAnTPB

On 2/5/19 6:12 PM, Peter Maydell wrote:
> HACR_EL2 is a register with IMPDEF behaviour, which allows
> implementation specific trapping to EL2. Implement it as RAZ/WI,
> since QEMU's implementation has no extra traps. This also
> matches what h/w implementations like Cortex-A53 and A57 do.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
