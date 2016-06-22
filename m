Received: by 10.25.21.96 with SMTP id l93csp2225978lfi;
        Tue, 21 Jun 2016 18:47:35 -0700 (PDT)
X-Received: by 10.200.46.235 with SMTP id i40mr34109789qta.13.1466560054984;
        Tue, 21 Jun 2016 18:47:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si3296183qkb.260.2016.06.21.18.47.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 18:47:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFXGQ-0008Mb-DN
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 21:47:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bFXGN-0008Jw-4x
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 21:47:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bFXGL-0003xB-BO
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 21:47:30 -0400
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e]:34567)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bFXGG-0003ts-5r; Tue, 21 Jun 2016 21:47:24 -0400
Received: by mail-qk0-x22e.google.com with SMTP id t127so46585779qkf.1;
	Tue, 21 Jun 2016 18:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=y57wTX1HziH723ruq/k++YyHCA8zI6wZHfoeQE+mmJM=;
	b=OE2YfGP/uh/4Jqc2q9MHGKh916Gm9LwEISS/FvZ+T3f5IK5dEuxx8WXou07ZqRwaQs
	N4llMwyQI+YBvthdA7C0yrugDb4KUXIc2aL9fFqF5j1dWQ32RFS+2GjxNP+jse9J9fGB
	YSU2uYT94Cdmg/uek3Fx6YMWewNmUNomECTc8dv7aaxYfPSgl1Tw9UjH07sz8q7AYkQL
	0l2HpGxJY7u2fooeEfDbpDXZ/FepAA4TiAbfOPdoyPohZy0YkZwRBEviJyOogMagSbka
	HUTtD6B7dkYws5oh5+0KjggAN1LulOj2Rva9RkEpswSBSbxSYmtZSQb58yLY6+LSU5M7
	WEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=y57wTX1HziH723ruq/k++YyHCA8zI6wZHfoeQE+mmJM=;
	b=cUOn3Q7vcHz/R4HDpvfRuJMldKAaklpF2pc6aVU9QX/oHKV3LTMRenQeSIVXUmZ71s
	nYXs4cpAKsQTxEnvKSYJI4IYsF4/wLqTAN0Nee+wi0ULMGjbu1qe7STvVklNfQPMCQr8
	SIW79kHCgVfdmdboh7ElrreWQg4MzEr3Cnnli7ZdfppjjUKgTJ+JZs5Hv91x8AV1eYkJ
	tXXiHNpZa868nOOXeVH3R4lIEX/2mGNBVdHxKCmoE6NAhQChSA5+qyg8g9xd6EY6yhCt
	c9kg820NqbS57r7S8TSwtHnMfOG679HDEw9tA62YS/TQwxtZVNSOcBn/8UoZFGHkOCyH
	3glQ==
X-Gm-Message-State: ALyK8tJ38G9b2ODuVCJOizAKlfaNQ0K3dRT7Mxsf8F+AaOK57iM4YjF3lOHXScZX3mXt6Q==
X-Received: by 10.55.126.7 with SMTP id z7mr32589571qkc.137.1466560043649;
	Tue, 21 Jun 2016 18:47:23 -0700 (PDT)
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net.
	[71.37.54.227]) by smtp.googlemail.com with ESMTPSA id
	z65sm24867890qkd.36.2016.06.21.18.47.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2016 18:47:23 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<1466528974-12183-3-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <1c367e80-dd4e-c6eb-a5db-1c91f4b66f2e@twiddle.net>
Date: Tue, 21 Jun 2016 18:47:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1466528974-12183-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/6] exec.c: Remove static
 allocation of sub_section of sub_page
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 54J2ICe5btcC

On 06/21/2016 10:09 AM, Peter Maydell wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>
>
> Allocate sub_section dynamically. Remove dependency
> on TARGET_PAGE_SIZE to make run-time page size detection
> for arm platforms.
>
> Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
> Message-id: 1465808915-4887-3-git-send-email-vijayak@caviumnetworks.com
> [PMM: use flexible array member rather than separate malloc
>  so we don't need an extra pointer deref when using it]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  exec.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
