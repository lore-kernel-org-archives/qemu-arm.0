Received: by 10.223.197.9 with SMTP id q9csp741526wrf;
        Thu, 5 Oct 2017 09:44:05 -0700 (PDT)
X-Received: by 10.200.41.148 with SMTP id 20mr32598129qts.69.1507221845157;
        Thu, 05 Oct 2017 09:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507221845; cv=none;
        d=google.com; s=arc-20160816;
        b=qGGGGu7vmpL1/3+DcA5eNFzxPbf62Dx0A3dgHAFw4hz79sEV1LrruVmpzAXL14krB0
         TwDLAsTEh2Ws1IZz0vjMtUj+HGUNxdxbFz2zmSKtPPV8Q+F/P4xBYlg13qwJxnAKRy3m
         MKimFanNYUi8QYvw+Y8MJ9dLjoYvJA088NC+Ju6iWlFF6oyXKMMPcTRG5vf5736R483P
         R0Oy77mO9F4eGEVkiyhtQug2oBtPjrtY+AntaR4GGdkG0MiEqhl0w4Z3E3bqSlb84Q9T
         KyWrWKrIM/JEMOBtPW8VRBAkqXmOjMSb255iNyCOVzwuOK305jHFf+UwmTHna+/bT34Q
         Qwew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=dZtZ+pq1KvrbsVgI/NZKeWWzBySnlwXux5fNRF87+vY=;
        b=EZ7hgr7oRJe953TDOCZ+B6fR2v4X1ZIYjeRlI6ja5WnhOLHkhNpTd561QcdbdgGDgt
         bPcRQY5thERn5qdlfUGMj11OY9zB/D65U8qepP/WgIUaUKT6ogJNpKPG5U9ua+LnGmZd
         cCPE9qP6MqlrJzjiuaO6xpP+DLCMTtZFJqxIVxaA6RaCr/Ddbg09cPw9qez6kM9VSb6s
         kBKyyvmZ/c7zy/A5oX/yl6yM4Fp2lT8Pny/xVm6rfnWYMWfbEsxqYnaXA0vtIts2tcPc
         ATuPBwRFfQnDaLqhf/glI8wQS+0XtpUdlGNf9E5qOSsgfI7UPjjjiwUkTH8IANbPAN+G
         Oklw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eiAwZSLK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d54si5753868qtk.297.2017.10.05.09.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 09:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eiAwZSLK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e09Fk-0002R1-JD
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 12:44:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e094Z-00012p-Hj
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:32:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e094Y-0001pm-P7
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:32:31 -0400
Received: from mail-qt0-x234.google.com ([2607:f8b0:400d:c0d::234]:54588)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e094Y-0001pG-KB
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:32:30 -0400
Received: by mail-qt0-x234.google.com with SMTP id i13so26453157qtc.11
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 09:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dZtZ+pq1KvrbsVgI/NZKeWWzBySnlwXux5fNRF87+vY=;
	b=eiAwZSLKeYsiUsdrWF9C7rovNLM3rpNfCvuZ8g5ZloAQaXHctW/t3LXbu+d1P3CZS5
	QQx4O6Fogb9Pys9hq3NRS3RQmImy/BraeztpSIB1N64gKE5s9t7iQI8xX/nzFN9nYILM
	bniDIQYDtOEtLfjCmXnuBuDQpp0fN+cj5vkIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dZtZ+pq1KvrbsVgI/NZKeWWzBySnlwXux5fNRF87+vY=;
	b=Uyt/kPZSBikECevikfYc5lDO6tGB+0yrtWWbqL2tL+XvzNhSgak8uvliQVYCYjaSrP
	mvQRvwvzX6MRcxu0vw7FL8m+g1bXIeXfYkFAgVv3xa+lOsNzL4JIodPrM4qRkBBOjMZl
	OdYGCEGOGEesSKUvdO0Iykw4k6PLUXImpKspXw6NGddiioKfI3gv+QqpGdTxwecP5AVu
	9X5P5H9NwS5HgdTwoUIJs2btmB9sD7AN+OlrqPsrAm6QHyACe+d6ZA0aFsXj8P9RUtO+
	CF2xKMZe3osSH9940GoFUk2ZTvZpk9M95yrxfznGGHdf/798xoL02R6J/1QsuWSA3STo
	aMPg==
X-Gm-Message-State: AHPjjUjG0+dS2+Jpwqd5FRo3XudeoPjSZuyKoSfgKbWciKqP6CAPR54r
	5SKDvguxJE/CvuYbodE9PiqJkQ==
X-Google-Smtp-Source: AOwi7QDXacInP8t7UFRdYvc86GLkm8gJZCtyFH7OL3FLkIc70T7yRQ6zYuW+mnWPW3tMUzQrRmLIsQ==
X-Received: by 10.129.232.1 with SMTP id a1mr20684301ywm.34.1507221149988;
	Thu, 05 Oct 2017 09:32:29 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	z77sm6998060ywd.31.2017.10.05.09.32.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 09:32:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-9-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0136d727-d125-7eed-ca13-02011cbdf921@linaro.org>
Date: Thu, 5 Oct 2017 12:32:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-9-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::234
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/20] target/arm: Don't warn
 about exception return with PC low bit set for v8M
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
X-TUID: fIeENIkRzMsq

On 09/22/2017 10:59 AM, Peter Maydell wrote:
> +        if ((env->regs[15] & 1) && !arm_feature(env, ARM_FEATURE_V8)) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "M profile return from interrupt with misaligned "
> -                          "PC is UNPREDICTABLE\n");
> -            /* Actual hardware seems to ignore the lsbit, and there are several
> -             * RTOSes out there which incorrectly assume the r15 in the stack
> -             * frame should be a Thumb-style "lsbit indicates ARM/Thumb" value.
> -             */
> -            env->regs[15] &= ~1U;
> +                          "PC is UNPREDICTABLE on v7M\n");
>          }
> +        env->regs[15] &= ~1U;

If you're going to always test regs[15] & 1, you might as well use that and
avoid an unlikely(?) writeback.

    if (env->regs[15] & 1) {
        if (!arm_feature(env, ARM_FEATURE_V8)) {
            qemu_log_mask(...);
        }
        env->regs[15] &= ~1U;
    }

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
