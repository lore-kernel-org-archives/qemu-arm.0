Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1729951wrt;
        Thu, 24 Jan 2019 01:53:40 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7DDmv/hfuyDnKhGjrzNrsRQy4PzgJy62j6IcqcNAYOg+nsiD1wCubJOLG+FJ02rLyJf5dA
X-Received: by 2002:adf:d089:: with SMTP id y9mr6674012wrh.22.1548323620279;
        Thu, 24 Jan 2019 01:53:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548323620; cv=none;
        d=google.com; s=arc-20160816;
        b=gH2FX/4qZ8l5vvvSxA5NJNqryBs2X+49bfNMsMF1YPTESyoNpzx7UNWVHbN6rlciu0
         5QIDQV/GiMXOTv0TahftNsBPz3keKHUc41YcfUnZX9F6hzvdsaE5DtI/SEw6TSHWwvob
         QTShTer2LHSDkZ8W7poH85EgR1s3pitQqCJa4TKQhqFaPug+E82A/BFJA6hseE1JJg90
         J3i2zmDBqJiOz+9nsdHhvxFI0IQ+E4P4FVrKj5U0jdM6XHgKZ0R5Kjr/oH7toMoTnJmP
         DSQ2gTiO6GjbYxrpVnvfI/BdAD5jfpnKd8/jQt6Kl1nckHMmsqLuKM5hUaceJCuIMZH7
         1Hyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=pdk3yKZNwMjvzhsXSdcjKXLEMreFP/xcKE2Ku7CBpqw=;
        b=hHDu0bYLz15BS97rA/q5pTvM/MhyY32/qQ70y8rVqMGc+WiWx+jPbOSmi2d9oZye0r
         L1LbVm1SMpGfAcULYxwsiQOYMJqlTwNmRW0yhiY9ccV3h9uvnoWpWSBIzVvgwLoyWHFW
         S3fzZlnkz4e8ChaETaqRpn29i5JV9FurFWIlLkt/VkbPwQPcOVqXFAJQb2hzRpMGXiXY
         2lAIFPQXJbdbnX+ryhXyB8V3QyZMbQWiaAEEM0/QFGxvcwlEDkUUVa9upCtNnNba7Utb
         bqTgHn5NfGUtsOHs/vyzA87ZtizIgzRjpUSll8Bu0+4sKYwtCfTZDfuBRi5jf6zRFgyc
         /Tdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si75811000wrv.45.2019.01.24.01.53.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 01:53:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmbhb-0006mD-Dk
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 04:53:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmbhT-0006m7-IU
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 04:53:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmbhS-0004Q8-Nk
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 04:53:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56320)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gmbhS-0004Nx-FX; Thu, 24 Jan 2019 04:53:30 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A968A0BF5;
	Thu, 24 Jan 2019 09:53:29 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 670876C217;
	Thu, 24 Jan 2019 09:53:17 +0000 (UTC)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20190123212234.32068-1-stefanha@redhat.com>
	<20190123212234.32068-6-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <8b7397c4-1e92-0e8f-b394-1d8f45141623@redhat.com>
Date: Thu, 24 Jan 2019 10:53:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190123212234.32068-6-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 24 Jan 2019 09:53:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 5/5] tests/microbit-test: Add tests for
 nRF51 NVMC
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	qemu-block@nongnu.org,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YwmJXGCMOZzw

On 2019-01-23 22:22, Stefan Hajnoczi wrote:
> From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
>=20
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tests/microbit-test.c | 97 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>=20
> diff --git a/tests/microbit-test.c b/tests/microbit-test.c
> index 0c125535f6..d3edd38643 100644
> --- a/tests/microbit-test.c
> +++ b/tests/microbit-test.c
> @@ -20,8 +20,104 @@
> =20
>  #include "hw/arm/nrf51.h"
>  #include "hw/gpio/nrf51_gpio.h"
> +#include "hw/nvram/nrf51_nvm.h"
>  #include "hw/timer/nrf51_timer.h"
> =20
> +#define FLASH_SIZE          (256 * NRF51_PAGE_SIZE)
> +
> +static void fill_and_erase(hwaddr base, hwaddr size, uint32_t address_=
reg)
> +{
> +    hwaddr i;
> +
> +    /* Erase Page */
> +    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
> +    writel(NRF51_NVMC_BASE + address_reg, base);
> +    writel(NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);

I think you might have a conflict here with Julia's patch
"tests/microbit-test: Make test independent of global_qtest". Could you
please have a look (and e.g. include Julia's patches in your series)?

 Thanks,
  Thomas
