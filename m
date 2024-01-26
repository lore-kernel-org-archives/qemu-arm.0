Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp837193ejc;
        Fri, 26 Jan 2024 04:22:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/X4mXK++BovElC/2GDBCyxivLQrpwfeaJ1KA9MJItKB2jaguTmPtk0MN/4GcRbKRMVRwQ
X-Received: by 2002:ad4:5c49:0:b0:686:ad15:5123 with SMTP id a9-20020ad45c49000000b00686ad155123mr1539950qva.49.1706271779703;
        Fri, 26 Jan 2024 04:22:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706271779; cv=none;
        d=google.com; s=arc-20160816;
        b=KeodbWnAdnuTPivaeey0kH5Oy5tlfIYlMNBfvcokuWQhjKMvyV9mwRKLE1s4+aTIEV
         oEV/qg7uE9DxmSjKDd10pOphDWdU8a0RhkkqaItjYnrulIjQMttoda6HwwmK9FKpViaI
         5bWIpSriBDRbOa1FhrYVsJvaZ9w70c1fija7nhPqOp8G/r11+Fwey2DOSdISeb/3h/dr
         /OA1DgyOTBiql2xC2GircuTd/ZAtXStNmNjeL2+5fCrRcvUDp29yuE7sxSPYdi2B0+4R
         xNdobmOpTAN6yA61yZRwh8K1k2F9+Z1/OAPdwIRQkZQ3s41IgmR+CGrNtTzQDIfbSsJH
         1+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=GmmoR3jvGthiKENCQCIQLA18vF5QHigKDNCx8eOBrU0=;
        fh=qvpQEwPhW+sVtKR5E6AId8Ma6sXNH1BljXbo4bG344s=;
        b=jp1lJY/LtaL8Z192uc2QdDazikB2LQD/inVUFHhuav0l3jQfaeX9S0ZSzT2Aw1n6of
         XA68fsOpzwiZy+j+XqfZoKAE6b9w4n9s+L3u1NdGz1LwJGXOPo9tXU8Q+sR7SlSOgSsm
         TuMRlpSdZod2LY+5X3CbL4+BX4gllE+SyO6YE9RmV5HfLx9t4JnAebn/mSqsuxglxHKa
         u4A9nL/y+mZDGu4O37qCxjPcArFC8MKZk9caB4HaBTOfoaPVjVcRk/AO9Hb+PSLrY07R
         SfOdI2SJHWZpEeFUmxsMQpQGTMEb3b1T7FMIXVSmR4xPG4SQ3OvWI+Ev2ofGwc333Z4M
         DXLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pl15-20020ad4468f000000b0068c35f28746si293541qvb.352.2024.01.26.04.22.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 04:22:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTLEK-0001UL-8d; Fri, 26 Jan 2024 07:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTLEH-0001To-9e; Fri, 26 Jan 2024 07:22:42 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTLEF-0006sp-Eo; Fri, 26 Jan 2024 07:22:41 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLxfL4rMvz4wny;
 Fri, 26 Jan 2024 23:22:34 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLxfH3Y4kz4wcJ;
 Fri, 26 Jan 2024 23:22:31 +1100 (AEDT)
Message-ID: <a865d3aa-ed36-4d75-9358-ca5292a04b32@kaod.org>
Date: Fri, 26 Jan 2024 13:22:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/avocado/machine_aspeed.py: Update buildroot images
 to 2023.11
Content-Language: en-US
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
References: <20240109173538.435781-1-clg@kaod.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240109173538.435781-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-TUID: fCzmEIJkzqcR

On 1/9/24 18:35, Cédric Le Goater wrote:
> Compared to mainline buildroot, these images have some customization :
> 
> - Linux version is bumped to 6.6.3 and built with a custom config
> - U-Boot is switched to the one provided by OpenBMC for more support
> - defconfigs extra tools for dev
> 
> See branch [1] for more details.
> 
> There are a few changes since last update, commit ed1f5ff84209. Images
> all have a password now and I2C devices have been updated in the Linux
> ast2600-evb device tree [2]. Do the necessary adjustements.
> 
> [1] https://github.com/legoater/buildroot/commits/aspeed-2023.11
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9deb10cf160e
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>


Applied to aspeed-next.

Thanks,

C.
