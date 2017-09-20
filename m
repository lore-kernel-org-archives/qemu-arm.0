Received: by 10.223.172.38 with SMTP id v35csp1144522wrc;
        Wed, 20 Sep 2017 14:01:16 -0700 (PDT)
X-Received: by 10.200.49.232 with SMTP id i37mr10077604qte.281.1505941276483;
        Wed, 20 Sep 2017 14:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505941276; cv=none;
        d=google.com; s=arc-20160816;
        b=wCP5Yj/DxJPn9rQB7o+PnvpfNfFI8PUTMhRGec6OcZh7ENkv14YXovNmfp2f7ye3yW
         PWum9as6npR2eBEETE6TyHQb7gVkSm9NhBNfxl3IQMhOYrNXmSMLDNzrxusnU72eqrox
         dOlQcvpD+MUjP1KAw7/yh4sTffJgo7FjTK0+maWDO36tGrGWq0j4xMJYpNT5NAptJ7lm
         YqRIwtZAup+Gk4e2OeXsDZkCMxoOtUhXyrbpnni7hxaxU1rfaykOtRYDOTNb7stenhs/
         DMgQfgcor4lzSKW+O3XTgdKQJxR+cW1iFLCDrmaDOLuE6SXvuVyxxdpKNGJhh+lvXCJB
         HUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=tjY+tukDh8a+Q/8pjxDtNOWYPex/tiYIa6w7saodV9w=;
        b=fGvr6zdMZkHArvg/FpdNx7E9nlbwVjUWoUg25oFwfMEjMrfavF5QtPU6eRrCml/o7N
         NSgZrjfLPbvAiExQflumSkiP2+AAP+UgOtWOICJfGpGsqgD1LjpuTsXrTWMTq0KoiSEr
         uN6Nkm2b99tslAx5QDGh66e6Ya2iV5ewYDnW6HJaCyG42RrVdCqawZtSooOyG+7OipoJ
         7HcgzFhxe/duTizDDvj+jWJy2DflNGeSFA0VyP7IIGqRoeZXPTzk7iyQaBRRAuA2qbnV
         K00hjwO6IAAZQaFxX55XjH890sxCSL3yq+WZNyXckzngRnP5eyTtvX9SOPjeu//r3cxw
         J4wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y/8cnTii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75si1820725qtg.467.2017.09.20.14.01.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 14:01:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Y/8cnTii;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dum7O-0008Qh-8H
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 17:01:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dum7E-0008QI-Ee
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:01:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dum7B-0008L9-Bp
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:01:04 -0400
Received: from mail-io0-x22c.google.com ([2607:f8b0:4001:c06::22c]:51274)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dum7B-0008Kb-5V
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 17:01:01 -0400
Received: by mail-io0-x22c.google.com with SMTP id l15so6544137iol.8
	for <qemu-arm@nongnu.org>; Wed, 20 Sep 2017 14:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tjY+tukDh8a+Q/8pjxDtNOWYPex/tiYIa6w7saodV9w=;
	b=Y/8cnTiiS7yAc6+NqDjSbo77wMhEji5MQUPVfLm0B1nTDBidpW9hPKfRW3RDCKWXUM
	A0ZAl57jgjYlkAOK5KqWjK/C1Qa3IeRUbv1nYj/JPQtFqK09e5VnUIUG7B9iEqMDhOv7
	EtJdNXDpDEVc/nrqnKpAiWwrV8zze5PWmN3Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tjY+tukDh8a+Q/8pjxDtNOWYPex/tiYIa6w7saodV9w=;
	b=bmesv2/k7IDGnSwdPTsj7K8Tsy4Q9JbxABw38GAxMBkD5ckFvu5ea3V2ynfLFwTGYz
	XyKGB3BmRqoxRcQNMVNUP+uhSlnRSAbfaZc/8Z+tJpWhMKPXQvsnNiIwx0m4jj+5OOwb
	CZf4bnvw+uAmjwvVqBghxlXdnpK0H3C7Bq0Jz6SaPQCU5Mjyg1LtEu6vZ5eHEOetDEzF
	qDY0S9+bEKcxAbFbgWdzQhDwMs0QN93df+SZcLmWBIUObZ9/AtMpiFbIGdXN1gTuGWB3
	qys324L4HC3mjWir2dPSz/k47wohgFgYJ9/kqpCepBjkSg6bl7K7+/3CG7KZA/wRX7XE
	soQQ==
X-Gm-Message-State: AHPjjUid2+UmCvgHKu+2MGki4dlC/O5qdgUEdnuclCatwnsKA3JEJpkO
	btn2k+gToz+uZ1+j+Lno01oGinHvMo4=
X-Google-Smtp-Source: AOwi7QCsHJ3E/2G8MUhquOpXnbf1FdzcPy82JDCwJKE9BqomQ8CrYVGgNGmf+WaZnERcP0vQvTxWfA==
X-Received: by 10.202.245.195 with SMTP id t186mr33613oih.78.1505941260354;
	Wed, 20 Sep 2017 14:01:00 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162])
	by smtp.gmail.com with ESMTPSA id b73sm1147475oii.1.2017.09.20.14.00.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 14:00:59 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505580378-9044-1-git-send-email-peter.maydell@linaro.org>
	<1505580378-9044-3-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d5885ea-8152-4779-3eda-e18aca00cf3f@linaro.org>
Date: Wed, 20 Sep 2017 16:00:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505580378-9044-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/6] hw/gpio/omap_gpio.c: Don't
 use old_mmio
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
X-TUID: fYVFyuo1QQZW

On 09/16/2017 11:46 AM, Peter Maydell wrote:
> Drop the use of old_mmio in the omap2_gpio memory ops.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/gpio/omap_gpio.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
