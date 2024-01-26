Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp837347ejc;
        Fri, 26 Jan 2024 04:23:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHE8oVaDhbGuzHxqlvqv5ph4IylVKQIQ/Ui/in4snu6m5zo2vhvFeJIrx2QEaBBMh3KwLTB
X-Received: by 2002:ac8:5c55:0:b0:42a:7d52:e6d8 with SMTP id j21-20020ac85c55000000b0042a7d52e6d8mr653893qtj.82.1706271801092;
        Fri, 26 Jan 2024 04:23:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706271801; cv=none;
        d=google.com; s=arc-20160816;
        b=UtxBfSiKLzE5+QNqIy71AzE02n1VJaSDTiQlYfhn70KwbsBaX4cXPYKkd0GnwN0mbA
         7eQ8/fzwLWm0ZBQwlYiqChufh9R8PNRvknUU1YfseQv1TIyaVOh2EIcC2YPCOVzGeTPN
         C00s+qTYNSjYU0EIxThxE0m+Hi/1ya4dLM+Tdm+sL/JCeydZorfFYblS/P9V3njWiwJu
         wQU2ucXlV7Lj8U3OAmFN7WGSHwOiIxtQ1jTGoe7/abbXtWCPQGod0m6b6rTEcNeWH5E/
         kWxunvbpSVicplYBPR3lVoueOpXKjfBYbzIEBw1xI9yYV2vOUDXUYEgw9AwLQThf0Ol6
         miCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=aA7mWqSXuOAuCGThi48+dWoIZDIYjN1QhzoAekQzL5A=;
        fh=JKTnjfgLebdI6Uppdd2zUuo3nA3KHnzgaaV6K84+8TY=;
        b=m9/Tq3gmWfjx9g68HfH6sorghbCrN2r5MBJ42AhwdK4bS0kAB6PoiEjiPXs0wTsIYh
         AyTuEN7b/agYV9RKK+6+YKlb4t+gsmNqTiAheinBYAoPOdwbSzD1TsYqFINFcIqOkWXo
         JSI8fRj8JbGs+GbrZ7wEz3SEdPiiyanXjgKSzAJ4JMlIATrVnxMnJermCv/scJQfcWtq
         h9R4ZpyH+LZ/7cmFBoEPJRDsh6jw+ovubhZDE6Z+YUdmEkXGiYCpEm60606OQopsXSWJ
         rnYDjvmMPq8ScZrsyKrNszcm8zktEwNlqkE5UgFvUAUTna/GUime/O4MRJvLd7d6Ddh8
         sTDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp18-20020a05622a1b9200b00429762222a4si1085935qtb.741.2024.01.26.04.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 04:23:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTLEV-0001XB-Tk; Fri, 26 Jan 2024 07:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTLEU-0001Ws-5V; Fri, 26 Jan 2024 07:22:54 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTLES-0006vR-GJ; Fri, 26 Jan 2024 07:22:53 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLxff0zdSz4wx5;
 Fri, 26 Jan 2024 23:22:50 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLxfZ3JWCz4wcJ;
 Fri, 26 Jan 2024 23:22:46 +1100 (AEDT)
Message-ID: <dd318403-7c4a-44d6-9b82-db6af3b60766@kaod.org>
Date: Fri, 26 Jan 2024 13:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/11] Introduce model for IBM's FSI
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20240126104956.74126-1-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240126104956.74126-1-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: br5R3hiMtzDf

On 1/26/24 11:49, Ninad Palsule wrote:
> Hello,
> 
> Please review the patch-set version 12.
> I have incorporated review comments from Cedric.
> v12:
>    - Minor changes.
>    - Added reviewed by tags.
> 
> Ninad Palsule (11):
>    hw/fsi: Introduce IBM's Local bus
>    hw/fsi: Introduce IBM's scratchpad device
>    hw/fsi: Introduce IBM's FSI Bus
>    hw/fsi: Introduce IBM's fsi-slave model
>    hw/fsi: Introduce IBM's cfam
>    hw/fsi: Introduce IBM's FSI master
>    hw/fsi: Aspeed APB2OPB & On-chip peripheral bus
>    hw/arm: Hook up FSI module in AST2600
>    hw/fsi: Added qtest
>    hw/fsi: Added FSI documentation
>    hw/fsi: Update MAINTAINER list



Applied to aspeed-next.

Thanks,

C.


