Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5094496wro;
        Mon, 29 Oct 2018 21:32:20 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fwXeos5LNDRBjDZwSdEagkKs3c1FEy6oPD2OcbJfDBb5GjhrWErTPTHEm+4M8babM1RoR8
X-Received: by 2002:aed:3422:: with SMTP id w31-v6mr958077qtd.100.1540873940347;
        Mon, 29 Oct 2018 21:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540873940; cv=none;
        d=google.com; s=arc-20160816;
        b=jUsoeuqhGssNWbeaf1f9e/9pkO/r1hQaPqKYm5+9ZgC1TZfCwo2DifEHTc8cFwGhtt
         G1/TGxSsUbTJd0dZqaAnvlgA25VigLWaoeWT5L28BzHlRz4J4Enndtii++cVVbjfJCJG
         ssW7RqSGXK8NyzvMnj8608a3LL0/jjHiC25OCdG/DbLdnFx+/pVLVBj0BgPJbZ1uFIiH
         lJPYrmdFC1i5o3T9AzyzjQxTKXQNaRDG1loAdPGJecIl3CM5N9Dgh/i6ye6PqQYaUTLX
         sfHaJdZu6CU/oNE0+8EYYeFDdxWfPpSwUkqe0WGRUI8jIxhPmq+ZKqrZwJdglpZcdqZF
         Qx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=xvhtgDM1Cu151/NXfmBhKuIUK+4DfjLFqcEOAaWraQo=;
        b=ggdmkuD7rHM1H9lB1weSWYdFEL6g0YbIlNnEyZBrZAw9djQMNbvnNci8MaMtMBAIwS
         0oLkJQp3poycDmCKYa5p6oHyKaqB+SuhUchwAAN6a3r0d1kBUgGZskudTrK+KOkQiXiL
         AFfar4RZfDq4p8Tf/RxbogSu0avnt1IujO2e9MopCSvZGQONWmRb795hDDV3coPrxDGx
         eC/w2Q0XkC66iS8hhbvXuamm466fupSggpO9LX5wvmzUt7twGJP3n2UmV9Y2gyVENd8u
         abMI63CxSqttHqN6ezI72iXcdYmX2m8KDf1BjDSejDRM0wBeAzB7gEGBPWYnjcFeTVvP
         jbgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="mH/ntlFK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10-v6si1563211qtm.62.2018.10.29.21.32.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 21:32:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="mH/ntlFK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50693 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHLhT-0004P6-RT
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 00:32:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gHLfP-000395-Pb
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 00:30:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gHLfM-0002Hv-Kl
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 00:30:11 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41701)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1gHLfM-0002HG-En; Tue, 30 Oct 2018 00:30:08 -0400
Received: by mail-oi1-x244.google.com with SMTP id i10-v6so9232172oik.8;
	Mon, 29 Oct 2018 21:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xvhtgDM1Cu151/NXfmBhKuIUK+4DfjLFqcEOAaWraQo=;
	b=mH/ntlFKfXiOsdNQa70Epl2J6GD5JjHGpz+RP9tX68ob4pQwdKnUrap6R6SamtQcGB
	47uyAcIPR2h7khxrenSDqJnqJlUfqgDiGvLcQwXVsovNEKIph3RhRRFl5duBoeWOmL4m
	+tojakdCqTFf1sPb6qReSgZYmH7Xfs5+7UFNZcb8rqZzeBbkBzyYX+H2V8kYx/ajawaT
	+AUINWwuWKyEjeKcL3E1TSMRa9HxAkbbhqpPTvbbntzq2tKLkhNdFRw6+zCdoNMFw9EX
	ED+YuIHfkrhJVsSDT5am0MkRwKyopZIrrE1oP3jT+2qkbWgW6P/P3vjaB1vHVtAre4eT
	aGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xvhtgDM1Cu151/NXfmBhKuIUK+4DfjLFqcEOAaWraQo=;
	b=YYrHlWtwsxqPdLujhF+4cUMdxJJw4OQ9rkHxnlCwwsgVLuog65f5IlX3iRtKRCNO5v
	l7pujevFI4/nrDVi5Uv04gKK1RerFavyPvnJ9Q+3ACYLWWzPono9bc2VwYNAeEymnDDH
	w/fgcG/Co5XTb1UHaznaknXRPIQEQREdDhpx5UOM7XdCRdePh1Prqgrc/5U8P20biuSK
	nf5TH+naHH5tQX1+sjjos2FvsRakxdcwu14e8Jtu4YwvV7AcWKuMloXj3cWyCgS5d8M9
	o2adWqiHPYl2LLAWnyIlNQ1T1FqG7pG//6bp5RSqgpAFLB/VbHrjZZUU5iozjYgFySSN
	nCWg==
X-Gm-Message-State: AGRZ1gLGgmv7Vu0om0U1c92PSwgf4taXJ6cP8SdMW4N/e1yw7LYWUE0R
	f5o+O2PcEJzBXj7Fb0ZrwUR9Az6E
X-Received: by 2002:aca:6c3:: with SMTP id
	186-v6mr10649538oig.158.1540873807107; 
	Mon, 29 Oct 2018 21:30:07 -0700 (PDT)
Received: from [30.43.121.251] ([47.89.83.59])
	by smtp.gmail.com with ESMTPSA id
	b185-v6sm7267611oia.12.2018.10.29.21.30.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 21:30:05 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20181029195931.8747-1-philmd@redhat.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <fa65f06c-13dc-a73e-2bcd-2c7fcf7c3d30@gmail.com>
Date: Tue, 30 Oct 2018 12:30:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181029195931.8747-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH] MAINTAINERS: Remove bouncing email in ARM
 ACPI
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WxLKbDfwY8kE



On 2018/10/30 3:59, Philippe Mathieu-Daudé wrote:
> Shannon Zhao's email at Huawei is bouncing: remove it.
> 
>      X-Failed-Recipients: zhaoshenglong@huawei.com
>      ** Address not found **
>      Your message wasn't delivered to zhaoshenglong@huawei.com because the address couldn't be found, or is unable to receive mail.
> 
> Note that the section still contains his personal email (see e59f13d76bb).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Thanks Philippe.

Acked-by: Shannon Zhao <shannon.zhaosl@gmail.com>
> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d794bd7a66..1aa2728aac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -625,7 +625,6 @@ F: hw/*/xlnx*.c
>   F: include/hw/*/xlnx*.h
>   
>   ARM ACPI Subsystem
> -M: Shannon Zhao <zhaoshenglong@huawei.com>
>   M: Shannon Zhao <shannon.zhaosl@gmail.com>
>   L: qemu-arm@nongnu.org
>   S: Maintained
> 
