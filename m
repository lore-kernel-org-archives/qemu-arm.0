Received: by 10.223.188.70 with SMTP id a6csp6139496wrh;
        Tue, 29 Aug 2017 08:43:45 -0700 (PDT)
X-Received: by 10.237.47.230 with SMTP id m93mr6761455qtd.273.1504021425483;
        Tue, 29 Aug 2017 08:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504021425; cv=none;
        d=google.com; s=arc-20160816;
        b=XeEI4ncgM1tvLDEKYAD5d7kQvQ4E6AwUSQ++M/mrJ7EKDoSWXp8nmEpBp5CT4PnlJB
         3uWwa3BN7K3SKAj28giZHwqsp5qmckvyyIq4VTCE1gCtA8Yx6NQuE/DE1dNF5JIZN+FM
         0HDkQV8tyHEnxRakZbvKjkTSiMkSNzaT4flGdKQgOZM2Notj/p7RlgT+h3nAwZvXcTSW
         KsVxfBTz8hp87UH9/eeMpKXaZP6SoeJ0vm5vpQBAFLe+qjcPWZgkdIM5XmIgVABy7utO
         uelDXuidDgTSqdDnDSdsL6IHsZUqS5kQ0sgIlrXVKJSEPRi3ThVdWzR8iEPrJRojmz0f
         ywYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Uly2EKymgeQg3zhXWlb4QD5E3fgWMCgpk3TGokagzAs=;
        b=MSn5KYWdlx8nLsc+AV7QaPtGK/e7PBNoG7D+ExKXlgV8RoQYH2W4oe1Vh0FkbZrnw/
         7nh0k4bRPEmAIlUBoqibM3LtFQlnZ6hnhdZVbPwP/g29dQC2ZNukB/FPT53wmUj4KWo4
         gHsyuPN70brVOujbAAzxIgGrkiMKDcu7uf9P8h2ME0eNGmEU+RPwRknoxDFgcmD52UqG
         C+ypoQlebOrpqfRXLP0yqUlwyNsUi/aZFVT7fSKIZweyCBe7PPFCmE/7csN3SCaMrIFe
         xReUZPBW7KBlpkTNjiNkzeReLIY84FakGpnT76fcldb0dyCjRSzmKVWH1dMDss8MUp1B
         Z0TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DGhaXIJp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x40si3165866qtk.135.2017.08.29.08.43.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 08:43:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DGhaXIJp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45585 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmig3-0003h0-5W
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 11:43:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmifp-0003Xq-3y
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:43:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmifk-0001vH-7m
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:43:29 -0400
Received: from mail-pg0-x22a.google.com ([2607:f8b0:400e:c05::22a]:34387)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmifk-0001us-1s
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:43:24 -0400
Received: by mail-pg0-x22a.google.com with SMTP id y15so11941885pgc.1
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Uly2EKymgeQg3zhXWlb4QD5E3fgWMCgpk3TGokagzAs=;
	b=DGhaXIJp+FoteRTNSBMhGf7JqWdyTzKRCSZ19sIVf4huk8XvRYvQPMceXHcFQ3fy9v
	CWmX1+UIDn1p+4TnJoz5UXEjucSoSIFAOkd9uyEi6UgN8tZG8AAcMzJSKHG7sUWqrxMn
	bddQ/Zp7U/C/c58fxuI4wqxCuHQybqMKHhkaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Uly2EKymgeQg3zhXWlb4QD5E3fgWMCgpk3TGokagzAs=;
	b=Lp9mbIcu0b5Egsta65HaETUpy46aMe+7DmpTuYruMA+j4d4PaQdn7nzdk5OLkpSN8L
	XzWDIcwjjpVXMWOxGnxFyKP7LwcTqzSBepR9Gg4GyXhRfLzorqmUmkCb3qAfLPuCOYSm
	1OeKJTa3gFPEZFhUJX1LA+xVgeGRQMXoF44GW+t/yWbl8hqmVLCaWdsaW67rut7Lbamn
	xCKHFBAw+5+XMvmyK6vYIh3Ov4l+FEaUlWHTIyYiYUq2c3M3HlWZ1fHv16sKbCYQ2Smo
	PvtmoZZz80ISA/ik3LEQ3q9tL2m/PBvWwTK53yj4WaM3/7Ozfssv81+h+oicdTIaXzjc
	ZaCw==
X-Gm-Message-State: AHYfb5iIlPwQs/qBtGs9dpYdblNUAoIXWjxfmwf+Z/F5YqH834N5OCkV
	S0jX/6VWjqy81Me6
X-Received: by 10.99.125.18 with SMTP id y18mr700642pgc.223.1504021403038;
	Tue, 29 Aug 2017 08:43:23 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	a21sm6120914pfj.89.2017.08.29.08.43.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 08:43:22 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-10-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <66795cd3-db3d-4d6c-6012-0886d95c5352@linaro.org>
Date: Tue, 29 Aug 2017 08:43:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-10-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22a
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6eu3+Y1Ldjxd

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> Make the CONTROL register banked if v8M security extensions are enabled.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       |  5 +++--
>  target/arm/helper.c    | 21 +++++++++++----------
>  target/arm/machine.c   |  3 ++-
>  target/arm/translate.c |  2 +-
>  4 files changed, 17 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

