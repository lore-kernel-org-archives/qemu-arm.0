Received: by 10.223.172.38 with SMTP id v35csp1968098wrc;
        Tue, 5 Sep 2017 15:55:25 -0700 (PDT)
X-Received: by 10.55.175.6 with SMTP id y6mr803729qke.275.1504652125650;
        Tue, 05 Sep 2017 15:55:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504652125; cv=none;
        d=google.com; s=arc-20160816;
        b=rgaBWMsOzHLRFcA9hN2W1MC5+ulDpZz+nRooijs/sh4g0r8E81I6ifWSUOmxgSRfVl
         OAJhFASYsPPXX6LNnEvAfr1SK6YCkX02chcnJ7vejFrt6NGwsOmBj90cuA9ubeyJfBv+
         oyh2gqZiC/5HvCVVsTHtaWwDmLrB90dcHafOcBoGES4XfErCWK68iff7mFPx0V5qhLA/
         OGNnxgRsDi5T6eKYwM+7ZVsIfqUOGyVQGehDFyHznQlH9XqQu+m6sTh+MTOG9zX3Bgx3
         8+RUy+fcyxLiuwTphrcSSF4LGQ39YF3UCpErWZWnm/LGTZfdc4ASd44ACfQXS2khINiB
         uqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=7JyokAvvKfijjqfKi8AznCUp17qeVVrL9ha8W5cvY3U=;
        b=cx2krOgewdtLzXPsZjRd2t9Lj48zhYHCiFkIeItYVRQ5jtnljEdnQS4gGMpCnOdSXO
         C+2E9qsq2/ToqA6bhOl6HnFlhvvNY9gDD71wj2lKltndfAiA3Dnji8h2iDIpBBVBo5W4
         aKEXi7T/QwRP+jOfPNzNZzN315+aql+HzO3Gn0AP9EqZUFeAufvgxNt/BJ/TFunQbaoR
         8rrSRW97B31Y2zf4caaczkFhYU/Jo/jzanGrHSnFcc10oCAnp9taEoEQq0L7e5xAuDgB
         0Tk+hhpJFZjlmKtFRTuwLH1X7HzK802bqm2xxjf+v7yM0ZXnlRNq7aQMtKRkfPI8xICZ
         J4Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eFkQHNZ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r59si1364953qtd.342.2017.09.05.15.55.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 15:55:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eFkQHNZ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33460 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpMkd-0002uT-D7
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 18:55:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMkP-0002rM-JW
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 18:55:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMkL-0006OQ-4c
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 18:55:09 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:32823)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMkB-0006HG-F5; Tue, 05 Sep 2017 18:54:55 -0400
Received: by mail-qk0-x244.google.com with SMTP id p12so2972801qkl.0;
	Tue, 05 Sep 2017 15:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7JyokAvvKfijjqfKi8AznCUp17qeVVrL9ha8W5cvY3U=;
	b=eFkQHNZ7QSZ61V9uNZ0mOnJuTSJjUkMOKv+KiOHUJF4TjP6R7gxZt5KL9NeOtOzbM3
	0WkmjKfGQN+ajHx/zFqzIXcBMUKXXJ95m4PctJq2GkdW3iSZza+RkwZFuPkKWRLzpCyk
	o+redhhWeM6Y5SQvby9kaSP6PZkkD0PSK6ude0V+vkus+ZH8H9pKkhIXrvaBWNM99Rlx
	dP8O8yspCjGXqqT2lN9raehjtOV7AOz9WwLJ5xOKV6yU5Xr+56xgEVZz93O661irUIPX
	9YNvrWbpfQ7cp+FrvYAEWTE72CQn9G8PPLvRqChN9p0yHUfGqAV3Ex+P06p5tkPg7r09
	ZziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7JyokAvvKfijjqfKi8AznCUp17qeVVrL9ha8W5cvY3U=;
	b=bg4RimJkhEyi7fVCed03VXmoAZJI0cU3m6Dsf0LuuacKyQ/SkWPgCfuvbTJmFVb/jC
	q0Inh/8M+pDScMNyg1Q6hxZiP1GPj9d8I4JHeo2J1z7Bkq0f9nKsZEDoRN4tJ65S2HXS
	oaXRs0i8A2L1NybQiwPeTjtHQmv3us9wxiCIAAUC/6KNAv0ynQRa6U8tfNmeUOvCvlcv
	WI+t+jb258yRJf1IOxVCVMBL0m7n/LRZGs0e3uKYW6PzyGVhWIlTOq5KQ7pWx661WXYo
	Z0Cxiz8vnn5/E/GnckyTzUA1wn9MzQNCh7rK2ooyhBCv39Y29qxMjyTtczLBcIehfIBQ
	8QWg==
X-Gm-Message-State: AHPjjUgsF5mF3j5a4Rxm3w1SOmcn5cbTpmrxeOTvkCxzLJJ9AgYSzOPV
	At8GEJVBSRQpkw==
X-Google-Smtp-Source: AOwi7QAvBPB0EaWNJD7F6RNo+BSKzRozKBewBOmixnKAVGhJlaJOm/YBZohbn/i4LgFctVNH0tSLwA==
X-Received: by 10.55.15.41 with SMTP id z41mr882453qkg.134.1504652094851;
	Tue, 05 Sep 2017 15:54:54 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	q49sm1231704qta.80.2017.09.05.15.54.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 15:54:54 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-10-git-send-email-peter.maydell@linaro.org>
	<66795cd3-db3d-4d6c-6012-0886d95c5352@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6bcf137c-98e0-3e5d-b39b-e3a58ab45336@amsat.org>
Date: Tue, 5 Sep 2017 19:54:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <66795cd3-db3d-4d6c-6012-0886d95c5352@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 09/20] target/arm: Make CONTROL
 register banked for v8M
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
Cc: Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1OyddY27Er77

On 08/29/2017 12:43 PM, Richard Henderson wrote:
> On 08/22/2017 08:08 AM, Peter Maydell wrote:
>> Make the CONTROL register banked if v8M security extensions are enabled.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   target/arm/cpu.h       |  5 +++--
>>   target/arm/helper.c    | 21 +++++++++++----------
>>   target/arm/machine.c   |  3 ++-
>>   target/arm/translate.c |  2 +-
>>   4 files changed, 17 insertions(+), 14 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

