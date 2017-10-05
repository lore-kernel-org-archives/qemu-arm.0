Received: by 10.223.197.9 with SMTP id q9csp773370wrf;
        Thu, 5 Oct 2017 10:18:00 -0700 (PDT)
X-Received: by 10.200.0.147 with SMTP id c19mr15808512qtg.76.1507223879987;
        Thu, 05 Oct 2017 10:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507223879; cv=none;
        d=google.com; s=arc-20160816;
        b=Ti57u3IuPW/vrYMVSZEi0lHJaqVEEiylccLAvJpLm7UYvsi2KQN9Mb0O7emk1LCAyN
         0CdT6g/kiuYS/b7Z0RtNPpmuKY1oql2BF99AobO6fZHkeEWohMVx2xXXwEGaQJkTyAwn
         Sxpocr6LbclHcboNo0LR8fA/uYm3+N5SPTsyDx04nsYfGyBBRxejDgioT+3XJQ5Oc9p1
         6ulTY6XpyPHKl+SvJO+FWaxSPSuFNd2OcgJ7b4ulbgHCzDO3yv1mUgrlbefxH2VOYRql
         tbuELdT/VbxV2qpNRu8MS8MzNClN+wS3I/awCiizh1I+FNJKbRvX+tph+yEnBUVFP7Lf
         CwRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=L30dNKysBqzIBuJbjRJ8lZMoiIudGIeKFYhUP/dTlO0=;
        b=Hc5dC3by2/nWfXA3XG64FEEpGGSZO0PNRhbGGmNsAl4Ni8AhRuqBOAHvNpwDPUrvrt
         xWKu/EhPwrUsI5adgp8sX+ScteqSJbwB8GKoraOopK9ZxK1MFjV8K7cm62Fs1H1k7XkA
         JD8ND50wIs1QJTvrm9SAujnFYs7jcxUSXZd0U/4XAOwcFeQrbVX6fiE7V7cim/ZKWHPT
         Z3wXH5HuUw90YbhSxLyZlNucRe0zmGqjNFR8V2OK9CaoiELfXmnHm2kUKLsSX3UsPTe/
         66EHNcRye7Cn8JJ37oWpVT5UFTuSdY9KgjAnxXT0QhnKumhni0TDsyZTHeBZcS+pEPCL
         SmFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dzYE10i8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f51si1184080qta.485.2017.10.05.10.17.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 10:17:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dzYE10i8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e09mZ-0003q2-CL
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 13:17:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e09kw-0002jm-7O
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 13:16:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e09kv-0004sW-A2
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 13:16:18 -0400
Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c]:53421)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e09kv-0004ru-3f
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 13:16:17 -0400
Received: by mail-qt0-x22c.google.com with SMTP id 47so26678584qts.10
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=L30dNKysBqzIBuJbjRJ8lZMoiIudGIeKFYhUP/dTlO0=;
	b=dzYE10i8nNSTjX6vAtfmuLFz7fFyucjUhEpcREvCWAvFRW6L+SgQSmTNMfL40GKJuN
	uBImx4Ni8e8gPzubpn1CLlccWpmgP9YSJ3g0VYDruX0G3tEBvNWbNRHZMG5IOcuze+TY
	VIWBhCyzv7HA5opJygEHfkOLuSdLCUvwAfxPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=L30dNKysBqzIBuJbjRJ8lZMoiIudGIeKFYhUP/dTlO0=;
	b=WYoVBMUzQGytbYpCAl9Pu482M8Jt1pyMULwplZyUCxTb+VxEwHxEbI4TLCbUGoXKIg
	iy8Ojw4AixhcjhZco5cTK0ao/n21NiU+bs4Vzt58kJ7bZTmBR50PiGxD9oByofDsQpaT
	97SUfG6k1qU8QbHHoO7g08T0c66qQoTfgQrbJTD/bPYkwPTU1cy7t1d8UdwYrTrn5PgK
	l196pqFHcnbDV2PYjFZXDVdgbyGnycE458YElu5QxzCI0qY9JqYqEHAF4WaHoEkPDV/g
	+s+YSXzIWB4uRi5Hqxw5qyH3wvTJBwc+Q2yt7XFUKdcaxVjnRR0E4TrwxsweQaxW2a0p
	F7Ig==
X-Gm-Message-State: AMCzsaXK7N0nb80xmrhazkYP8ZYL8/lwjExomhzECPz0Dh9iStf92NhE
	bNTAA/pUY4T2cew6Lx/SUcYtyA==
X-Google-Smtp-Source: AOwi7QDQeMbUE4+prAs90FNXrCBKAJekrM/2rZjmOqxsXiPGUF4uxOidt3QmFLxUvFhgalmniRCG2g==
X-Received: by 10.37.57.74 with SMTP id g71mr7491965yba.78.1507223776361;
	Thu, 05 Oct 2017 10:16:16 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	x81sm6984641ywc.35.2017.10.05.10.16.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 10:16:15 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-11-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ebb8d29-a45d-5d78-58e8-0ac0cfb150d7@linaro.org>
Date: Thu, 5 Oct 2017 13:16:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-11-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/20] target/arm: Update excret
 sanity checks for v8M
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
X-TUID: K3WxfCKuzGwA

On 09/22/2017 10:59 AM, Peter Maydell wrote:
> In v8M, more bits are defined in the exception-return magic
> values; update the code that checks these so we accept
> the v8M values when the CPU permits them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 73 ++++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 58 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

