Received: by 10.28.4.212 with SMTP id 203csp1980166wme;
        Thu, 3 May 2018 07:37:20 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZofVDdgmbPLM4Jv6z8LQ6SLuxFJVIZz/m/Zb1pmb54I1RAyLMaHftqt/QIonnte5fwSvHHo
X-Received: by 2002:aed:3327:: with SMTP id u36-v6mr20577453qtd.422.1525358240586;
        Thu, 03 May 2018 07:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525358240; cv=none;
        d=google.com; s=arc-20160816;
        b=TGuXSn7tSv01pDBRwZCFyn+AGNIw0IVodZwnEAMOd2j/uvAN1789eYB6EaDmJVx61p
         DzQt08tXLWtCnlzMiBe/tFg2yKNW5TXwWt2dNxLn4Pl5Fjj5F5BEiafRiMzqKy7sekqr
         l5qLDBQjzjybZ5qmOnrWpvlNKem7Zlx/ij6ygoLdDtw7S1MndiZ+C1Lwo4iGGjX+sbLr
         ZGlhUeephhFbU34JA6XGa1Hby4InjloNybfX0cPycntcBS+eu8MD+QgnyyJsnxTGwYDF
         ne8NjnWpagE0QJYVDfo+562G1tfiKwfucuccUDTFZ8IN3MZfhgDHl3qp9/j5yzjuM2oJ
         TcKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=mkUkxkNhpEZCsGek00bv0Y9AfB93pYNoBDDeSR4Msww=;
        b=BrE0bjARLb/LeB0zFs9psVG/Ha+S7xUkS/Dm+1ZbWIN2i09XfiQS9GjrU2mn0S4sgD
         woFk21ZMgbS9JRJNC62RFN7f7gX5EH3tVany7bossBgrSU18MYiDNpg8OwA501VXorEj
         3UEE4EqMiCra9ksYPJ5VG6MzVhZfERSd1+0G//Je3yyoj2SB/tSyTqMiLSikmTZQwkKF
         t4Mk0oHXOmg7QyRSofIClFZobNptWzxQOmVrAf/YPM7EcVlRdaiSZ/6DSoDsDDHHKLW0
         azxk6bSuWSYXo7a5B4/wwWebjpbPW55ZZiaB3haNMB0e08TT5Wl9voIIPcAcloqAfFmT
         6ICw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2si9490991qkf.223.2018.05.03.07.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 07:37:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEFMG-0001r0-1V
	for alex.bennee@linaro.org; Thu, 03 May 2018 10:37:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1fEFKs-0000po-Al
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:35:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1fEFKr-0000p3-Dl
	for qemu-arm@nongnu.org; Thu, 03 May 2018 10:35:54 -0400
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:38597
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1fEFKr-0000nP-59; Thu, 03 May 2018 10:35:53 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id DFD808139C;
	Thu,  3 May 2018 16:35:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SOHXNMqQ8Hbj; Thu,  3 May 2018 16:35:51 +0200 (CEST)
Received: from localhost.localdomain (unknown [10.10.8.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 3904E8138C;
	Thu,  3 May 2018 16:35:51 +0200 (CEST)
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20180503115620.10596-1-edgar.iglesias@gmail.com>
	<20180503115620.10596-3-edgar.iglesias@gmail.com>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <f0ae1ab9-b85a-858d-9504-5dfd388d9b0a@adacore.com>
Date: Thu, 3 May 2018 16:35:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180503115620.10596-3-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Subject: Re: [Qemu-arm] [PATCH v1 2/2] xlnx-zynqmp: Swap Cortex-R5 for
 Cortex-R5F
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
	alistair@alistair23.me, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ig430IyRxPNW



On 05/03/2018 01:56 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> The ZynqMP has Cortex-R5Fs with the optional FPU enabled.
> 

Seems ok to me according to the documentation.

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>

> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>   hw/arm/xlnx-zynqmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 505253e0d2..efeb53c732 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -116,7 +116,7 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>           char *name;
>   
>           object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
> -                          "cortex-r5-" TYPE_ARM_CPU);
> +                          "cortex-r5f-" TYPE_ARM_CPU);
>           object_property_add_child(OBJECT(s), "rpu-cpu[*]",
>                                     OBJECT(&s->rpu_cpu[i]), &error_abort);
>   
> 
