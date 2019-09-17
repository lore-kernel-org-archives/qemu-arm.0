Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5445013wrp;
        Tue, 17 Sep 2019 09:17:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzOT2gYxBTbAYLURziaNUplwLJtZCpBAwh5dfo3zcR9ut+p1v/W0LDLm5kuV6awnk3CWy5y
X-Received: by 2002:a37:498f:: with SMTP id w137mr4600624qka.419.1568737065692;
        Tue, 17 Sep 2019 09:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568737065; cv=none;
        d=google.com; s=arc-20160816;
        b=BefevwPXlp/ubrlYJSkZRL8QzXGPa3O/E8caqYOFMLvI+wpQXlxJ5v3bezsgY+nrcm
         QTYraDFnsNKK3lM2S/7LoOSLBv0LWReU5U3ff3Gon8aZLcB+7nsJF0dwN74rKj+JCe3t
         cMpmVZdoac40lZ4WkOOkMOL4lCiLOjQaX5IQQXiGhLkx2Jwn+erLMxcosl/+9oytfXvl
         +gqA7FX3K9fc3BmOrSdA8Eyniun71lACRCZR+TrnX2Ft7qVTgVJgYYr1/lso1YhMSKR/
         +/ouy+4KnxpAOkyo1ZKBpxM2CdcuCXjbqlx5cdZBi4dDaocPhf6CxO23zkA2ODR38+2m
         y/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-filter;
        bh=saCwUdt1RcKO9995J2wNzlFYz43MqeU0bu6xtyWvDBY=;
        b=rVXmJePgqJgflCCs/XZlsI/7D3dmRGxcKfnPi7cje/KNxUXW+Mh0s1VnLStxREhvlg
         UE4toFf2q3DwOKV56e90m9xvNNC8C+54HL2TRsaLqd5k34symKWyGWu/T1jRhEYJOoEu
         aZxJdxH07x49xIvgOTM27fdtLFaE1nILZ1lP4Np4nnnD6oISvZUKY0hfQcchdG2YEplX
         RWLFAhH5Cg5P6UUX+pSDcA1UDH88uCVWtW8vneEswCmY0aqmTKAO6cdZBUoDmUapy86C
         TzfjV92dz8ePVwVfWxotCZysBhKmMhE5LRU0S7yN1ycrhC1j+S4tr+naSia4+aoAti02
         pfng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23si1940164qts.257.2019.09.17.09.17.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 09:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1]:48122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAGAh-0005U1-QK
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 12:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40417)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nramas@linux.microsoft.com>) id 1iAFxw-0001mh-N2
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1iAFxu-000653-Np
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:04:32 -0400
Received: from linux.microsoft.com ([13.77.154.182]:58644)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1iAFxu-00064A-HL
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:04:30 -0400
Received: from [10.200.157.26] (unknown [131.107.147.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id DC5F620B7186;
 Tue, 17 Sep 2019 09:04:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DC5F620B7186
To: Peter Maydell <peter.maydell@linaro.org>
References: <f2c90efa-1412-9c41-ba76-ebad90745f4d@linux.microsoft.com>
 <CAFEAcA9S7Kj5sJVM0Ot6KKpe9z3BfQWyZwUv-Vx_+g5sRbxqmA@mail.gmail.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <8655a3d4-0fcf-1012-5a65-16355651a901@linux.microsoft.com>
Date: Tue, 17 Sep 2019 09:04:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9S7Kj5sJVM0Ot6KKpe9z3BfQWyZwUv-Vx_+g5sRbxqmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 13.77.154.182
Subject: Re: [Qemu-arm] Adding /dev/tpm0 to qemu-system-aarch64
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SsO90DAXtgUY

On 9/16/19 10:24 AM, Peter Maydell wrote:

Hi Peter,

> This is because QEMU only supports TPM device emulation on x86.
> To add it to aarch64 somebody would have to investigate what the
> hardware interface for TPM ought to be on aarch64 hardware, and
> then implement an emulation of it and add that to the 'virt'
> board. (It would probably share a lot of the implementation with
> the current x86 TPM, obviously.)
> 
> thanks
> -- PMM

The TPM I am emulating is implemented in firmware (fTPM) that runs in 
the Trust Zone (emulated in QEMU). There is a kernel module that handles 
this fTPM.

If I add the following entry in the Device Tree that QEMU passes to the 
boot loader, the fTPM kernel module will load and it should be able to 
talk to the firmware device.

	tpm@0 {
	    compatible = "myorg,ftpm"
	};

How do I add such a custom entry in the device tree in QEMU?

Is there a way to do that by, say, "-device" command line argument or 
such in qemu-system-aarch64?

Thanks,
  -lakshmi
