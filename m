Received: by 10.223.197.9 with SMTP id q9csp838024wrf;
        Thu, 5 Oct 2017 11:31:48 -0700 (PDT)
X-Received: by 10.233.221.3 with SMTP id r3mr30630287qkf.219.1507228308326;
        Thu, 05 Oct 2017 11:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507228308; cv=none;
        d=google.com; s=arc-20160816;
        b=AUbm2fTr8WInUM8/nYSo/qIjR/5q4FN+2NcbKc8hAIiS3mPA10Dxmi5yIyGe0uXoMR
         7YQDeL5Yh521uKLO6LEw5vlzMAULCcUuFKjfdHyk4RISodKEdTJEN9AyGkCNmIxbBxtW
         l93JGDazv4A4qDZj69D+wxsCe2elug22buwlT94l/yK+7dYeZJVWBJSegvEGoXZGRGGK
         LivWvdqwTm8IB172PyC7aFmdX72JpdMhv4xanpPQ4pKafJUADhhiCuknAcvrH+d7h6Ha
         cYHKLRNLY6NU0ansZvkF4sSv1w1wbOuIAlzmiJqk5DHQ/CLqcU2UV0YlDP9lN1/Sx8EI
         4asQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=9CqzYWzYsy2OZ6MCCVQKaRBJCGuumLKNmkK8umOH1q0=;
        b=JraAB0A+t8i2fyK4x8UIa8FR0huwAbw38XqFEsHVU7SafnaHu+Y6sCUwzEVnzoKF81
         NObLan8WOtiy/Enl4uoy/SL03Uy2BDHxe8zZ2bBt58qYTaDAVTcWwn6TwNsk4G4U5veE
         duohag1Lgad8E7pW5KLj9ZsIuoFRasg1r1HZCcNpNJG7kG6ft2IiFm1bqKMp3wqEk8UZ
         gSdRQQusWExorkJQhwfE7KxwM84lPd2f+oe3ndttglFjTKhvM5SxETV+N7JX/G5/RLvU
         yD5iKOzb3d8NOG0CC2+gkVavgOkiw+DnV1hs5s7ylUuzt7kvlJNM/XGEkjHKfGplJyPF
         ENWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kRNc1f2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r73si3162083qki.130.2017.10.05.11.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 11:31:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kRNc1f2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0Avz-0001JX-Pv
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 14:31:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0Avp-0001IJ-H0
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:31:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0Avo-00082C-KO
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:31:37 -0400
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:55951)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e0Avo-00081X-GP
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:31:36 -0400
Received: by mail-qt0-x22b.google.com with SMTP id x54so27086578qth.12
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 11:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9CqzYWzYsy2OZ6MCCVQKaRBJCGuumLKNmkK8umOH1q0=;
	b=kRNc1f2eMr3uik2kHnQDEKY5GJ5kLegyX5xfaEHM4D+jE2gEJ5UXGQI/8/OqPGmNTP
	6dBg4FSBAbTQTdOB13Z43s/FExI77/4j3CNioGeJOiK5k4LN/N78gkaRqblQmB9USkE7
	R7yfChOoTO5ysB5ysla3YnLMK1UWXWzogoY8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9CqzYWzYsy2OZ6MCCVQKaRBJCGuumLKNmkK8umOH1q0=;
	b=LAy4yuGoVyJmFMi/W2Fl78/9mJseD9gOIStB63MN0s/8YUKzGF48cZtUjHmHVOL1Fl
	/KXdmIT6du2zP/y2YHjRAaHr3yZzb+MovwLNQm1S2qaLSqpgXfk333hNA8QNpuc8FjR+
	BwszQfw4zz4M4Z5w31OacfXhcfeTib30aAJ88cQCpKf+Z0ASzYrvsWV5DkZ3aUcLs8Dy
	bRDVCLLVH/xCCkclmuIXJoGC8z5ad5r5Tm5il5iEKgssq85aQ+9Qb1HLKxovZh1A8See
	rCFnAuj3z1Od9nBmHFjDSEQ15InhxExXR0OLK9zXAA+5EY6JaB/undIUDH22F7A4JnIk
	NHoQ==
X-Gm-Message-State: AMCzsaWn7BB3FvKC06grmEtC3+KfyWMRPD9X0GTPKBZvFipMbtssXy34
	BN0s0t6nRErKYUgd430/+eETxQ==
X-Google-Smtp-Source: AOwi7QAPIpmG5fnLH4F7+bySwHq461rfsv3l6B6Wy8EemYn4CwB/r+e6tGdrOpLOV0hYPbGBMdGABw==
X-Received: by 10.37.160.206 with SMTP id i14mr7332100ybm.461.1507228295860;
	Thu, 05 Oct 2017 11:31:35 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	f62sm3364296ywa.61.2017.10.05.11.31.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 11:31:35 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-13-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce4d6f21-e7b7-8fe5-a3f0-f8ba52645b5c@linaro.org>
Date: Thu, 5 Oct 2017 14:31:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-13-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 12/20] target/arm: Add v8M
 support to exception entry code
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
X-TUID: cMc7ONbpJ7e8

On 09/22/2017 10:59 AM, Peter Maydell wrote:
> Add support for v8M and in particular the security extension
> to the exception entry code. This requires changes to:
>  * calculation of the exception-return magic LR value
>  * push the callee-saves registers in certain cases
>  * clear registers when taking non-secure exceptions to avoid
>    leaking information from the interrupted secure code
>  * switch to the correct security state on entry
>  * use the vector table for the security state we're targeting
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 165 +++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 145 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
