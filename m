Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1437005wrd;
        Thu, 23 Aug 2018 10:47:34 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY3U+Z+JBjjEM0wXDjjUc29zdUjwBp/Bn/Macuqol112xT56jKr2KO6sQQCPA+aTus4Usp3
X-Received: by 2002:ac8:5558:: with SMTP id o24-v6mr25624234qtr.195.1535046454420;
        Thu, 23 Aug 2018 10:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535046454; cv=none;
        d=google.com; s=arc-20160816;
        b=JN2hBEeI6gRkFqparZdeBTrWdvFfCoMwkBKXRa5/KEEsoMO9HXjvHb56QoyuqsMC1l
         4mclmKmX0vT3SCBLC/UvpCeNJWmpeznZDlwRjqM+VOtdccGq60sW+nF3cvNmc0bf1B0Q
         Wk9VLPQF8nZxzo0ED9rSNvBInLLqtJexlpbeCrVCK2uanjO/dNc9BVEmS45n2IhEnXFI
         bC94Fpmz9HVosT1SIBROHyXqJQ3ow8S/ZRadK2wi0YNerV3Ck+YlyOfwdCkZ5dcIEGaX
         Wh4wCLekYyhVJbyYNeFNrb230M7PyiIb8hi0riylSh0KIe+jcXtOtE5UO/8a6pEHk6zf
         IfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ww9Bx8zW1vFuVsERLUc4WGnuHFZkrspaMxIy40WL9jA=;
        b=fzZDhKbx+kHgx38kefhbc+B8VUh7yX6Zj7z5axucdJ5Q6RylYpL+FItKRAaJMSyI9w
         54bPT41mH+UA/OdOpZN1ONDszJ8+4n2rRhLJJF/EkzFelHj9vAsGuqUX19ZOzFG0ttgn
         gaZopwfdqlClWKjxkE6hF7mFzML3Mv+UV/OIclDbtli1KozIZkeb5RWjitZVnosUaJzu
         v7Wf7YtUdtv0OsESahoePXBKbU8YD9MjsBP2YVWBeoAp6W8tANeNVMJuLS0z1zS0mYFY
         dPrPBE6RUaWSjNPPl/l7qivqH25BlJxY8l8rRFyJhlUapEgqNaw5qJmBjYI52xF9r37m
         ME0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SXF53okg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b188-v6si3875740qkf.353.2018.08.23.10.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:47:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SXF53okg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsthl-0007UF-Ku
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:47:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstQG-0002XO-Gj
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:29:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstQB-0002Dz-DU
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:29:28 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45394)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fstQB-0002DM-2f
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:29:23 -0400
Received: by mail-pg1-x544.google.com with SMTP id m4-v6so2433631pgv.12
	for <qemu-devel@nongnu.org>; Thu, 23 Aug 2018 10:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ww9Bx8zW1vFuVsERLUc4WGnuHFZkrspaMxIy40WL9jA=;
	b=SXF53okgEkvVZRbReeR7HIwBE6+RRmi2UmrpI5HIjcbJammEg60KQjeu1yuPEJEUPK
	OLsRrWNRzI635D+y1lG3Jl4QbzxdLjO8pC4A48uY/ruVYILibmpwdpVguoXSLx4KjdT1
	KH3XfGFcakD7F/e5UzubMw6/KC2drY2BpmlRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ww9Bx8zW1vFuVsERLUc4WGnuHFZkrspaMxIy40WL9jA=;
	b=cmdEAyVQCmdAl3BaVu0qxS9upiLYgBZ+nWT60UuXbjKH/wYtq+XpnqBth9dC/zCq9s
	fiP/zkOMfi2Ff1uDJ6uEleD0ge3mgrLPSq90TkBqbu8/2DmvWxMm5/lLla8NERckh9HG
	lySkgxkEDengY0GxYDsqq7JFJce0JcupWQTNsHC4wTR2EgdqWAmb64W6nXwkdn3IgW6F
	93woNnzqJqOV0SzJAmLWM5ueJ5rcSdQeLU+J13P2KGNiS9SoWYnxioylJTu6V3RlGvNu
	6ypn76xjg5AuWaIsVML5fTHhyL987/BEsezr89mR/oo4IML/yvD0JpouGlfAsjg6WxuK
	RTig==
X-Gm-Message-State: AOUpUlGjdVJVMbAMiQR9YfkzrmuC/Ns9oqLxYitpsaHT+xvyt+45LarD
	REY2lAeX9nupt9aLjU3m61X2XA==
X-Received: by 2002:a63:3cc:: with SMTP id
	195-v6mr29184857pgd.229.1535045362247; 
	Thu, 23 Aug 2018 10:29:22 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	e64-v6sm5254716pfk.87.2018.08.23.10.29.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 10:29:21 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ca0a29db-4915-f7b3-4019-b338bec6308c@linaro.org>
Date: Thu, 23 Aug 2018 10:29:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [PATCH 15/22] hw/ssi/pl022: Allow use as
 embedded-struct device
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cKft+OMZvQMb

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> Create a new include file for the pl022's device struct,
> type macros, etc, so that it can be instantiated using
> the "embedded struct" coding style.
> 
> While we're adding the new file to MAINTAINERS, add
> also the .c file, which was missing an entry.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/ssi/pl022.h | 51 ++++++++++++++++++++++++++++++++++++++++++
>  hw/ssi/pl022.c         | 26 +--------------------
>  MAINTAINERS            |  2 ++
>  3 files changed, 54 insertions(+), 25 deletions(-)
>  create mode 100644 include/hw/ssi/pl022.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

