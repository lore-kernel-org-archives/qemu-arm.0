Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1239949ejj;
        Tue, 26 Mar 2024 03:17:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqKShoIEbhs9RDnfdtWkPmYU+uFAjO86oXOTJOQKdImejxDD3S/heOfXOC7hXWfNgjdStnID6hny76ngT3MKMTYdXyXLJo
X-Google-Smtp-Source: AGHT+IH3+1JW8Si3R+SWYuY11KMC8UjeS7/okB2hR0OwjVLeXnxXC1NmL2+1+teFD+12qSc72j7c
X-Received: by 2002:a05:6808:1183:b0:3c2:3356:4233 with SMTP id j3-20020a056808118300b003c233564233mr11439533oil.35.1711448236691;
        Tue, 26 Mar 2024 03:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711448236; cv=none;
        d=google.com; s=arc-20160816;
        b=n9lg7zWccsHWpK19kLusdNibeN7xkmY4jt7ffCqrQxNz3tR9NrSfEKB+WExpXxnu/F
         yDhCYN2Fa9Nha753KjFBo0oxvzOHAyQGxFkRzWavAdqsrtJyzugwVUrY3acJ7jMa5iOp
         qlCc6Q6K9mfdjdmrjepSVTnHVJbCsXf3wf1u4UOdD6rXu63PgF36I6VVXIKUsbe0toqE
         7HdPLcpwdjhl0jKjJdU5+mP3w96mRQHVusN0U0pxhBL5TeIGysjaBq0dNBw+6/TSUukL
         q6JLR1x6+tNIznjZH1uaN0/0Q/nx/b2Hrbn5y2kj26bzG2Gd9jue4zrVYUHog47HzfKX
         17qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=SJJhNECh1VQby8cpp1FO8P1NnFbATFA8V0NrZYATK44=;
        fh=+uwFd3y85FVx0ENpClnDBU4966hZ4iKQ4Vbt2+6KHBc=;
        b=OX7BTA9E2/Q5rnKfylFev3aEtb0VeN6SRehno6PvZwsM3aL4hP5hRdUoTY8lXuDaFW
         drtDywKMBg9naHwbqC3by98OAoXD/zdrCcrYgOARGnPgJJi+FijX6R0V7BdtBInvapgk
         AkrU3gGaQdlMXkzurlJwGDkS0KljFUr/pSV0aN8sXoJY2nahHHxLTQHRZZLhlB4nRSqn
         K9uhG4w0jT2bFiWsAgD2iETbHUoZUNfIbIecGRhE90alw2myPUpCk1xUxiqq0WOvEns7
         l9zwVCEdKulOZV2Rjggb5nzkgHBt7AXxLziQtzQCCB7cOmYq1vaF6Emvpl109n90kdUN
         +oTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020a05622a138700b00430e254eef1si7580225qtk.268.2024.03.26.03.17.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 03:17:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rp3rh-0002HB-8Y; Tue, 26 Mar 2024 06:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=kyiP=LA=kaod.org=clg@ozlabs.org>)
 id 1rp3rg-0002Gv-3g; Tue, 26 Mar 2024 06:17:08 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=kyiP=LA=kaod.org=clg@ozlabs.org>)
 id 1rp3rd-0002lm-WE; Tue, 26 Mar 2024 06:17:07 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4V3m1j0ddJz4wxt;
 Tue, 26 Mar 2024 21:16:57 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4V3m1Z5hJKz4wd7;
 Tue, 26 Mar 2024 21:16:50 +1100 (AEDT)
Message-ID: <f6f6e771-0820-4de5-b9cc-1e64b9729712@kaod.org>
Date: Tue, 26 Mar 2024 11:16:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc/pca955*: Move models under hw/gpio
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Glenn Miles <milesg@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?=
 <fbarrat@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
References: <20240325134833.1484265-1-clg@redhat.com>
 <10713c68-27d8-49b8-b50f-6648eef8d277@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <10713c68-27d8-49b8-b50f-6648eef8d277@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=kyiP=LA=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: RVyO+IbZYwBb

On 3/26/24 10:55, Philippe Mathieu-Daudé wrote:
> On 25/3/24 14:48, Cédric Le Goater wrote:
>> The PCA9552 and PCA9554 devices are both I2C GPIO controllers and the
>> PCA9552 also can drive LEDs. Do all the necessary adjustments to move
>> the models under hw/gpio.
>>
>> Cc: Glenn Miles <milesg@linux.vnet.ibm.com>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   MAINTAINERS                              | 4 ++--
>>   include/hw/{misc => gpio}/pca9552.h      | 0
>>   include/hw/{misc => gpio}/pca9552_regs.h | 0
>>   include/hw/{misc => gpio}/pca9554.h      | 0
>>   include/hw/{misc => gpio}/pca9554_regs.h | 0
>>   hw/arm/aspeed.c                          | 2 +-
>>   hw/{misc => gpio}/pca9552.c              | 4 ++--
>>   hw/{misc => gpio}/pca9554.c              | 4 ++--
>>   tests/qtest/pca9552-test.c               | 2 +-
>>   tests/qtest/pnv-host-i2c-test.c          | 4 ++--
>>   hw/gpio/meson.build                      | 2 ++
>>   hw/gpio/trace-events                     | 4 ++++
>>   hw/misc/meson.build                      | 2 --
>>   hw/misc/trace-events                     | 4 ----
>>   14 files changed, 16 insertions(+), 16 deletions(-)
>>   rename include/hw/{misc => gpio}/pca9552.h (100%)
>>   rename include/hw/{misc => gpio}/pca9552_regs.h (100%)
>>   rename include/hw/{misc => gpio}/pca9554.h (100%)
>>   rename include/hw/{misc => gpio}/pca9554_regs.h (100%)
>>   rename hw/{misc => gpio}/pca9552.c (99%)
>>   rename hw/{misc => gpio}/pca9554.c (99%)
> 
> Thanks, patch queued.

This one is merged,

https://gitlab.com/qemu-project/qemu/-/commit/6328d8ffa6cb9d750e4bfcfd73ac25d3a39ceb63

Thanks,

C.


