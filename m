Received: by 10.25.221.202 with SMTP id w71csp1228159lfi;
        Thu, 3 Aug 2017 15:15:18 -0700 (PDT)
X-Received: by 10.55.156.134 with SMTP id f128mr440547qke.184.1501798518840;
        Thu, 03 Aug 2017 15:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501798518; cv=none;
        d=google.com; s=arc-20160816;
        b=epA2dvNrZAmrHY9K5szcW/C/OPl66pO/rAmzVPiSkHN5A2Im0qcXeO/okLvoqX9m2B
         6W1VpZZ8MCCAVwVbwu45xZKg7/KQyFVJS7qYrv7m/2HZzTYVk4eFd3bmE49YBySD7MkV
         YWbapRpvg5/wyGqI+sTX57r9TuyzH3FctOYI5sb0bKnaPUcPZ+5DZJQbYepiQ685YVTz
         Da0arqecQyzA1hJJ4RWB9agZGrZPM+VsDrVL1rxgaphKRZDOjbROY2jplqpPlsEsz/z1
         KNz/FMjej5tLy/fWDDkM6PMZQVVQQLvUjN6dEXWA3/cqESfOp4ujArlL4tYwv8lIoH1t
         49vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=96lbVeOk4Ip8MhkILEIN0IRgAK/hMOmNChGEhkZ3LZw=;
        b=fdSgBWR+yBMTEU44lRZeO9vVmqJgQZ40Lws5K2AUQBF4tK5PjXshdEmE4kWyIKYdL8
         bDqjFS44KyMvXmt/IrLBypzFXnAkObZcupY3+fEf7RTM43M89qexxUVg93Um3cD8tdOz
         qhL8eXSWterNMmEXxhuExDCOfTk1bKvj4NEXzFuS7Pkp/HVtSJ1Yt+EaFJ4QkHRPhGnV
         BzAiGEKM6bt/bfcBGLKEV8k4CUcXdy1Z9gKiQQ8eZAKcTo4QunvJbxVk7+GnJ8qa6JcG
         A9wuJkl1dU9bpQamYhNglDBY9w0KcmxlMWZskQPgp0UiWlGhwjNGcD4IkIgnKmkjdLzB
         XbBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=b9lWxJwY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o42si38218qko.215.2017.08.03.15.15.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 15:15:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=b9lWxJwY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddOOi-00064S-3y
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 18:15:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOOJ-0005mT-Vo
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 18:14:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOOI-0007ct-W6
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 18:14:51 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:34874)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddOOE-0007XM-Nh; Thu, 03 Aug 2017 18:14:46 -0400
Received: by mail-pg0-x242.google.com with SMTP id l64so9025pge.2;
	Thu, 03 Aug 2017 15:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=96lbVeOk4Ip8MhkILEIN0IRgAK/hMOmNChGEhkZ3LZw=;
	b=b9lWxJwY4fBNOniJrK86AlvwzTHO+ygl6qKuRzYioUWOqbEy4f+j1EuoJ8U1Du4/bA
	2z6CPnTgL7hfkzeufZS69j70sRyMrIOEql/VcVdBMegCH38fgPU0DlDiBLulprKvjULO
	OOktIGn43feecIG9Jnv88E7rsOygdKdEBx3BNxLWm1pywqIT8OM7zXnyORT15e+kK9CX
	gjrUXAk3QjWyZca4JNqWsdADy3HzzFqGJpxEIOpY87SCRMLTGeAi6/A0pDKyieaPzWFY
	QcBajlt2xO0+R8pLf2nY2HkdHNtOeqKBCF2p+GzbwqlnzfpvwLIY67YuGCEI6eMI5NQA
	LQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=96lbVeOk4Ip8MhkILEIN0IRgAK/hMOmNChGEhkZ3LZw=;
	b=to3nv41U0GbuBZmshbQWuiWe+1bfx+SUq8bmvcVCSmcg1ny+hCbNZXvCk0Inj+fXud
	1XaFK690YBSKNHl367HpAfDbxXuFCEMqqLBQMDYJuzBuhxst51yajZb/jUVdOLEb0odq
	3EKijANfYbf9mvN8pulSa1M95qgToYx4shw/loGL45qayIAwZEKp0xqqwtVaFX0wu5dX
	/RD0w4QapUUbXrVFz6KNFFDv3CvZ1tkMilMObE9Q9ghb0c3scRmj6v/lE441FeR6rLHj
	/OW+iHklnO2B0ftrklp67s0yGtA8uf6iWZD2QxUyePsgHt+IBnqFhO1t02hKv0uEYDx1
	2VzQ==
X-Gm-Message-State: AIVw110jhWkUs03lX3EbtlsK/pMblvGG3/TB9myGDVCnyqcWxudHTadQ
	AT9OGPnzetjg5g==
X-Received: by 10.98.245.147 with SMTP id b19mr291492pfm.286.1501798485865;
	Thu, 03 Aug 2017 15:14:45 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	q66sm1340pfb.188.2017.08.03.15.14.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 15:14:45 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-12-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <2f3523e9-a8b8-ed6d-3fae-33a4dfbaa6db@twiddle.net>
Date: Thu, 3 Aug 2017 15:14:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-12-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 11/15] target/arm: Make
 arm_cpu_dump_state() handle the M-profile XPSR
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
X-TUID: Jd7cquGqXrin

On 08/02/2017 09:43 AM, Peter Maydell wrote:
> Make the arm_cpu_dump_state() debug logging handle the M-profile XPSR
> rather than assuming it's an A-profile CPSR.  On M profile the PSR
> line of a register dump will now look like this:
> 
> XPSR=41000000 -Z-- T priv-thread
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 58 ++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 40 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

