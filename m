Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp864909wrt;
        Fri, 25 Jan 2019 15:48:25 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5mP9Ma+fBRUR0QHXUvxuCNVaLTkExRCi0g27WIeio/MkEHVlferWcMFaXrMF29CMYzO1Km
X-Received: by 2002:a7b:cb18:: with SMTP id u24mr8166866wmj.138.1548460105219;
        Fri, 25 Jan 2019 15:48:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548460105; cv=none;
        d=google.com; s=arc-20160816;
        b=XdviMX00E4d3vz3IVuhrSx7LpRZW2jDMGljoMPq8SimrP/ak9W/YPGs5U5VPG3Qqig
         fEY2FtgNJyar6d4IerIMewmi48NNRanVAB+qKNuVFyiE15fMHqqMgdNsUT7nl/8dndrP
         WHc8/2LpHCjp5mtK6wYmTJ9Nw77JtMqORam9Pd0T/J8C+cjSzoX4Voe+1dljgXHMyZbL
         O84Nz1dwmxfGhjI809PyJZGPviGcbxOZ+7cEck96L84c0h3K9mNlDWihhjzJ8eGS0Cwt
         wpO//FMPOvgVfaELJJef5zAlVEZlCMV1aDw55UsZ+TvG9IN6lvYQhApAxni96GOGgb/Y
         M+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=9aoe9BS+yPhYgN+3UTbGX1LMa8j+V1p4hu0Jj3OPQgQ=;
        b=ACwMFu5d+YgTCvkb1wk161g5uCHcKCfX4YFCMIlK5TA+vZQnHjdRNUHMii7K3RtCle
         4WXl4qrYUppsLGXFPsLTSkE5jA2cyaRDLtkRPIwmST16nvyCE2gmg55FS/Z/Fm77jUUN
         h5mkHg48GPvEvxwhkbWeKyhXqqCkzfGepzyJokz0RBMHgDj62wSp/OdqRzlDaJoU0dNI
         4IzCmmprw8jM3GhZgu//VgtSZTLKwpPVKK8E7zOETaCMkgBhApPvf/tQexBDuHpvg6si
         qSt8sbuTxCNMbwGSF3rGs2nHqkVB8YOHf1MtDZ36tQC67rKmFQ8xbcmbtRAhzduSbDAI
         E48w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cKWGbq9c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si75422907wri.199.2019.01.25.15.48.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 15:48:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cKWGbq9c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52551 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnBCy-0000I0-Ch
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 18:48:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBBe-0008LJ-HF
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 18:47:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnBBd-0007Gu-Ga
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 18:47:02 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41460)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnBBb-00077y-5j
	for qemu-devel@nongnu.org; Fri, 25 Jan 2019 18:47:01 -0500
Received: by mail-pf1-x441.google.com with SMTP id b7so5435095pfi.8
	for <qemu-devel@nongnu.org>; Fri, 25 Jan 2019 15:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9aoe9BS+yPhYgN+3UTbGX1LMa8j+V1p4hu0Jj3OPQgQ=;
	b=cKWGbq9c9vHHevkikCNSzTSGZhp03uQCfiIPidRNAJBmImGgnktWQPqWl1k9rq32/W
	K5IQ/HiT8bYamGsjQw7VnyuLaVxCqDF5lmCfQ+/+zqZVP7IIpY+/5pLw1BeGLrKNy07V
	fXKeVOfmsSQlp/F6EBrGG0nCHlit0jzVNfM4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9aoe9BS+yPhYgN+3UTbGX1LMa8j+V1p4hu0Jj3OPQgQ=;
	b=cu69Z9k9LApTf4EO+keL9j3El3bzSe/ts519YLPn9KkLT2wcPbqWzcmbeQ/FcaBaQN
	pomANouo59uCylKMRwcdMkv6ayw8fF6S2KL8GgmbRDFHe6EJzdT74ViilbfkWmaJxszb
	ZQbLoUB8/Ab+j9lUgjh2SOZDdGDAHWSZqBq475MtOsrygvZjkv13MfYIP0QynsIbIrx1
	lPIa4XZsHO+dhFXmcj4vy5TBmjpHDJ4XD6fiCcmRx/4XeF/quWCu4QmdG0f/haaM8dba
	4Yb47rLSYuOGXi0N10VhSNtuZ8aEXBAQ0psIzq+LX9G7viLg2HTKzJE678wkhqESjN64
	bLlg==
X-Gm-Message-State: AJcUukeLb3+MeqKB2n39bFgxkdtlPsLfo7ovPw8ZzMAEWC/jOTULKaoS
	HQjgaX/ShVzX6QlYWW6NDJ94qg==
X-Received: by 2002:a62:76cc:: with SMTP id r195mr12892078pfc.38.1548460002941;
	Fri, 25 Jan 2019 15:46:42 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	g2sm31044424pfi.95.2019.01.25.15.46.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 15:46:42 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <72897470-f9ca-aa8f-679f-ea5f11c54265@linaro.org>
Date: Fri, 25 Jan 2019 15:46:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH 04/23] hw/arm/iotkit: Rename IoTKit to
 ARMSSE
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
X-TUID: BiiCyGM+nlpb

On 1/21/19 10:50 AM, Peter Maydell wrote:
> The Arm IoTKit was effectively the forerunner of a series of
> subsystems for embedded SoCs, named the SSE-050, SSE-100 and SSE-200:
> https://developer.arm.com/products/system-design/subsystems
> These are generally quite similar, though later iterations have
> extra devices that earlier ones do not.
> 
> We want to add a model of the SSE-200, which means refactoring the
> IoTKit code into an abstract base class and subclasses (using the
> same design that the bcm283x SoC and Aspeed SoC family
> implementations do). As a first step, rename the IoTKit struct and
> QOM macros to ARMSSE, which is what we're going to name the base
> class. We temporarily retain TYPE_IOTKIT to avoid changing the
> code that instantiates a TYPE_IOTKIT device here and then changing
> it back again when it is re-introduced as a subclass.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/iotkit.h | 22 ++++++++++-----
>  hw/arm/iotkit.c         | 59 +++++++++++++++++++++--------------------
>  hw/arm/mps2-tz.c        |  2 +-
>  3 files changed, 47 insertions(+), 36 deletions(-)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


