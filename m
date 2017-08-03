Received: by 10.25.221.202 with SMTP id w71csp1234253lfi;
        Thu, 3 Aug 2017 15:21:23 -0700 (PDT)
X-Received: by 10.55.164.17 with SMTP id n17mr390795qke.325.1501798883086;
        Thu, 03 Aug 2017 15:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501798883; cv=none;
        d=google.com; s=arc-20160816;
        b=SKCtQG3HQRcy31QQpT3IQT1A6j0l/AKxHGbDLCduCjtZOdydX6lsjAMwKMPcNbv3uZ
         zBAPXJqCFLQTwMJdRCVBv7No1Ksja1uwYMMfwOXSBncMgLxlmtDXJvUGLJy+V038XQdo
         M79h57puzvEoIAGreo/hx28Ah/edIBJjoGjW0f2PAVwK4uA/aevW+eiKJJ9CX6vgGp2h
         5y7MH3KoMG7BTO3TDFYpmX5RCvDL60+dcYseP6z8U3kXBvUIg14Wn03YEBq497WFC5cd
         bfIUcKcG7mdV3NNK/O/p1uGiEbabptHHAhLCTewdZYulzjAfQZKS8FqRWLt/Bd0nfk+r
         0fAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=d++pVB3mdq1hoW1aIbEjb5xIHBEMklaXZ64uEqmFaoU=;
        b=WtWCOKaK1zV3Njq2e4W9X1u0nfUUafazz7jDPjy9KYWK29/SK0eWNphPlWD+jP9R7k
         S8wDaAvuYWybFoSexJrnXcplO5sFN5e2o73W9Qt9qWLimXuLGBQASFqTZMA9bfwhV2Xm
         kPfEbWx0kILV78GhceHBtH8gDFCKuJNCqunWVyATLFtRqlFCM2lpKP4y49MNzjb3WYCi
         Ev/6n6olBa1kXizkQc3EeBhS+ZZnzp2ChI73Q6wiN9QTpjAl3Wto3ZkSl6xUyw/+GI83
         6QX0AJe8/us4Zpu7/o9THYR84ObFjucblYqizrP+pqb5tUjOxgtiCFDbHOSuqrtpP6XD
         +neg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=vZUXU9uK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h62si34741qtd.295.2017.08.03.15.21.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 15:21:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=vZUXU9uK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddOUa-0002tJ-Bq
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 18:21:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOS8-000135-Nx
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 18:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOS5-0003BP-Mp
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 18:18:48 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36838)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddOS5-0003B1-EG; Thu, 03 Aug 2017 18:18:45 -0400
Received: by mail-pg0-x242.google.com with SMTP id y129so12269pgy.3;
	Thu, 03 Aug 2017 15:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=d++pVB3mdq1hoW1aIbEjb5xIHBEMklaXZ64uEqmFaoU=;
	b=vZUXU9uKtQrDX2UJgynqV3bCKs9Jbjd8B2QQoRQsBEHAvwjolGo+u1Ajx2aDhN+cfu
	ZAEtbEzlLdaGVmJRWcqwD3elLLaXqp/82pxmFZJ6USDhyreQIBNw+pmq3aV9vrUNq6vP
	UPtNqkpOQROb53vb08BkmxBJLsw7Qm9vYIjIt2TOjMY9Df8nBm0Z8Cp6F+RbPEMWHOTj
	P202pzvA4WFFe5dkRoM6t4dh2HNKD6CKV2xsbDDT2rc2m5f0ZZSUDXwFOwNT7tj6zPNf
	c/GBdmqx6QakARjcuCkGPoq+ctAtCke5yb3WNQKQN4tuRDqhK49X8FMnXDeOM9Uw02k4
	RqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=d++pVB3mdq1hoW1aIbEjb5xIHBEMklaXZ64uEqmFaoU=;
	b=i84ivKs0jMLuI99QKSQOU+ULWSuXF6+4kC/n/+y9sIXbVOxJSN+B0QigqaWfeLdUTM
	ZKVjiLBXL0Um1SqOtf+DI7A5QP/CxAxRG0rnVIE4uf8CT+EtGDIMDHRoUU8I3YFmkKEH
	BGo+w3xXYI/d5sCV5hIZ2mUdo1iABTPRlL3H2YfGAtHs3eD/qG799dklpTbm/Owifn2H
	QJZXtXO9k6rAHLA8g+VAgBn+Vzn+tSbFthI2ylQn3Vr19AXaQa5jAAMowZIgOaHhHc0X
	atay6qKYhWz/OKY9VwiS6a6OP/9Yzeiwvhph/g5MTlpLHzYtE5NxnJhAnDpcaZtXhwEQ
	11Ew==
X-Gm-Message-State: AIVw113K5SEEZtH78S+nJGR9dGlvJMg1vo2YTR9xsEzlR2HQPizi45AR
	RfLbrpzZfH34NF7zB94=
X-Received: by 10.98.211.197 with SMTP id z66mr332139pfk.160.1501798724631;
	Thu, 03 Aug 2017 15:18:44 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	y6sm23453pgq.41.2017.08.03.15.18.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 15:18:43 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-14-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <bbbcc51f-ea2a-039b-7453-b4c9e6e53077@twiddle.net>
Date: Thu, 3 Aug 2017 15:18:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-14-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-devel] [PATCH 13/15] target/arm: Create and use new
 function arm_v7m_is_handler_mode()
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
X-TUID: CxaL1QBaR7yn

On 08/02/2017 09:43 AM, Peter Maydell wrote:
> Add a utility function for testing whether the CPU is in Handler
> mode; this is just a check whether v7m.exception is non-zero, but
> we do it in several places and it makes the code a bit easier
> to read to not have to mentally figure out what the test is testing.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h    | 10 ++++++++--
>  target/arm/helper.c |  8 ++++----
>  2 files changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

