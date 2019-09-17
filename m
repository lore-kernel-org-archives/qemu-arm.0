Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5456073wrp;
        Tue, 17 Sep 2019 09:27:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxBu7AH341j86uVY8BEO1TSRbDE/hPXRBCaRA6qY+WV4eLjiIcCfBPURP0rKZ0wZonINyuw
X-Received: by 2002:a17:906:32c3:: with SMTP id k3mr5490186ejk.117.1568737657870;
        Tue, 17 Sep 2019 09:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568737657; cv=none;
        d=google.com; s=arc-20160816;
        b=vdZoghQQcBbu/0GeyvxfCYmpntTBcS4vTbRMJH3z6v1o40cL5XK2E0dkcGqOsF9GOW
         BIh40hDvNifGD/Gz32Y7AHXdz9jj8Tn+8wmMs5PBunExl7N6BDqYCZOXgahI+GQmCdgx
         +pP7Bl9SBipSHRQih19L+7X+IPa8xRcmvocO8iV7X37M+Zh5ZrAI1ThSQ5MEsbi0+nXh
         0ht5E+LmJFqE1AMuvFIVrAvE92EIlBGjDK+m3qNxlICmH9VHDcKHzsR83MH6cDLOwqn0
         ea9iOOe8AZh52w3OUb7cqKFoHbn/AKn/CrMvn3WgF2c8eWHlFm/UzgranCqIzrVCdcna
         71mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-filter;
        bh=+EoKuIDLLqGjLu6HPqQRHNBVoNbH9qwWrpMmCb+wwFY=;
        b=CKwM/97bT8GJ9WWpMoD3+F0pEhhv9LnTNYnqVqwp/hJzGH0wgzazAk+EfeT8Zpt9UU
         32fDnHB6SouesxOn3dgBidpKa1zquXuDht5eJKmny9nQx7opb9qF7rTTEcWzJ3gqI/4s
         ct2wSwexe1++vdeO4mNfTpasm7FHDlboU0uwwaJ5NZ0XxL7yTib6+qjfcHHxisqjz1D7
         r/80RV+yyzX2MQ0QTLkMmYRg6pZHqjqbwCKM2MSEukgqyv/P69xYHKTjpWhyWATSELdy
         XXeznjy0zLdh1Y45Aif/wJKWsmfSdH2/5QvBIJ4bd+W5qdzHaB9LrP1ZWavpaEplnhDi
         vgow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h53si1727735edh.147.2019.09.17.09.27.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 09:27:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1]:48264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAGKG-00062d-El
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 12:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nramas@linux.microsoft.com>) id 1iAGK2-0005zx-Vf
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:27:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1iAGK2-0006Cl-1Q
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:27:22 -0400
Received: from linux.microsoft.com ([13.77.154.182]:38586)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1iAGK1-0006CW-Rg
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:27:21 -0400
Received: from [10.200.157.26] (unknown [131.107.147.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id E5CDF20B7186;
 Tue, 17 Sep 2019 09:27:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E5CDF20B7186
To: Peter Maydell <peter.maydell@linaro.org>
References: <f2c90efa-1412-9c41-ba76-ebad90745f4d@linux.microsoft.com>
 <CAFEAcA9S7Kj5sJVM0Ot6KKpe9z3BfQWyZwUv-Vx_+g5sRbxqmA@mail.gmail.com>
 <8655a3d4-0fcf-1012-5a65-16355651a901@linux.microsoft.com>
 <CAFEAcA_+=LvX5-Wiz6roemra9b2jJ4UaRt-fGgA+v_DSgj6dBg@mail.gmail.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <f03af76c-881a-0e80-3cb5-4e323aef9c8d@linux.microsoft.com>
Date: Tue, 17 Sep 2019 09:27:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_+=LvX5-Wiz6roemra9b2jJ4UaRt-fGgA+v_DSgj6dBg@mail.gmail.com>
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
X-TUID: WSgMXhNwn1gV

On 9/17/19 9:16 AM, Peter Maydell wrote:

>> How do I add such a custom entry in the device tree in QEMU?
> 
> If you're running a UEFI blob within QEMU that runs at EL3
> and provides this TPM, then it's the responsibility of that UEFI
> blob to provide device tree or ACPI tables to the guest which
> describe devices which the UEFI blob is providing. QEMU shouldn't
> describe them in the device tree it passes to UEFI, because
> QEMU doesn't implement them.
> 
> thanks
> -- PMM
> 

Got it - Thanks for the information.

  -lakshmi
