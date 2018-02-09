Received: by 10.28.71.27 with SMTP id u27csp1365637wma;
        Fri, 9 Feb 2018 12:31:54 -0800 (PST)
X-Google-Smtp-Source: AH8x227DtkWIIiJOjx/w8w8Nj5CgdJnh3LMy9fPUqdZ5yd1oVd77EBe/wWodZ/SP/FAYE8ZBfe78
X-Received: by 10.129.120.74 with SMTP id t71mr2984557ywc.149.1518208313908;
        Fri, 09 Feb 2018 12:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518208313; cv=none;
        d=google.com; s=arc-20160816;
        b=NP1vLgC8LMuvsXJvKwSMe0jUIVkr5oN1RYNOxlDVqtOlaloxMoAyUKEGvjwEITjlUK
         /00q8DGSHGJMjnniFSOnxOTn56k7lZKpS1UgJ6hcRE3MNbVAauM+ZK1VeKAQcFtybnE6
         0MyIx8cJCSwP4GneUCLNoP+a6S3ssMC2Xqj8ppodTTc7n1y0fMtdwEcnLmrfVRkgfGN+
         i0igHLQKmeXuTOgz5ylXQI6OycV6zispNVjq584ajBmFG/40Y43FCziKak6FGaQ+5hcC
         GubcVkjhl9SYJD+M9sILjgj71MGonFFfMTwMjdeizwZns+g+ESNrQXuJVtZ4kmc5HhPL
         ANQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=cnmu46PN47hRjcdyuXJM8kaCPPWPGG6O3GNza2m3d30=;
        b=FRPcBjadjeWyX94kxEPY8x/Ekzcdk7WxQxoHMxeklT2JuDIdEUYx9S3lSVeLCPmcLG
         NGcs/9rDJopEKV76oct89tAAuHpe4xkibkuDTuxHS/bphDcEn+3Pbw6KSKUC4O3h6zf1
         bS949IPkaXObtau6owfYO+ea0jTLyHT4On36JaVmMoZy/JHb0YX9/ETAWDXasjtOAPgk
         tZh1OpsFCYXu8TT1YfQZpb9KbAu2dAl085ZEKF65zoGLweWYR5pOK/WfjDHVadbgA/KN
         XGeevMWyJzc3HScqCMjtLFJ9VKpomd+lo56RPccgoIk0ooaAJ7lluJjcxrL5jf/AxV8W
         5eNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SsCF0mmN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g131si545982ywh.647.2018.02.09.12.31.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 12:31:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SsCF0mmN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38515 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekFKr-0004KS-8d
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 15:31:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFJx-0003kp-5t
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 15:30:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFJu-0003qV-0d
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 15:30:57 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekFJt-0003q2-QK
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 15:30:53 -0500
Received: by mail-pg0-x242.google.com with SMTP id o1so4354207pgn.4
	for <qemu-arm@nongnu.org>; Fri, 09 Feb 2018 12:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=cnmu46PN47hRjcdyuXJM8kaCPPWPGG6O3GNza2m3d30=;
	b=SsCF0mmNbry5/E7VfY3WuHSRmgJg3oQMDLQpMtT9kfXHCcmMXI4vMtr72H4K97a5YZ
	GvBwWKKoM+GzCDp2N3Muvg/hoEo//ES/PeX9Mg0DE0o2upOeze0xzYu7Ct1X5K801Qed
	5UaRiUTf9jhNifh8b6JB51sAo0eXoOMcUpbpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cnmu46PN47hRjcdyuXJM8kaCPPWPGG6O3GNza2m3d30=;
	b=EN5GZjOPdiRubts0+MRqAWs5MXSU/Q6VTImzhKKbheDypXwwyE/+Bk94iYh37OpZyp
	uNyGNq31veKB/8/y6A+t1Qk41LxMybK5jOEQbCw5rda4frbZMrzfy2dzNStim44BR+s7
	4Cmp0oWfgIOaAzRxKa0EJ9Cu3Vqs6xxQLsNFGRL8lZbxZjT89O/JCIGYxvKKINm7ziqL
	laSUUOB7jKmfeX+qxB48KnIG+kHEnyyI8zyrqbYDh5TQKO4yZSQBWNTmHYw3Zy02Dab9
	r9WkuTIEFeMPHodfRbrdDcZnVUscj2QXhVhZbedh8OrLGAA4TgGc59h0w+32LJcp1RBj
	5a5A==
X-Gm-Message-State: APf1xPCaimQ1mlSpL+v7ODOoD712h+gHy6JoijJVmjbAQREIfR0MP28j
	n00wcETm4DXNbNwicGcZe3l5Sg==
X-Received: by 10.98.217.141 with SMTP id b13mr3951768pfl.239.1518208252922;
	Fri, 09 Feb 2018 12:30:52 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	a19sm9306619pfh.170.2018.02.09.12.30.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 12:30:51 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180209165810.6668-1-peter.maydell@linaro.org>
	<20180209165810.6668-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c59474d-f417-9acb-6027-0f2ef7261f03@linaro.org>
Date: Fri, 9 Feb 2018 12:30:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180209165810.6668-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 02/11] hw/intc/armv7m_nvic:
 Fix ICSR PENDNMISET/CLR handling
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eU+2YKpOpKwD

On 02/09/2018 08:58 AM, Peter Maydell wrote:
> The PENDNMISET/CLR bits in the ICSR should be RAZ/WI from
> NonSecure state if the AIRCR.BFHFNMINS bit is zero. We had
> misimplemented this as making the bits RAZ/WI from both
> Secure and NonSecure states. Fix this bug by checking
> attrs.secure so that Secure code can pend and unpend NMIs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

