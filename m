Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1978653wrt;
        Thu, 24 Jan 2019 06:17:21 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5sVLtIKjtZ8S0vdUJ7iHpNJcmiHDKDDgWOPBtNSadnIfyqiDxGzCD+Q6xviKJ3r9EujxYy
X-Received: by 2002:a1c:9183:: with SMTP id t125mr2814642wmd.79.1548339441510;
        Thu, 24 Jan 2019 06:17:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548339441; cv=none;
        d=google.com; s=arc-20160816;
        b=EuloiMVwv/utGEqp8wvrU72dYmNZPoVWZRqvJDRxWuTwYwSfSlVMzCLZKLRTiyZ3nS
         6nQSWwSLhTpnFvvXxBHl1uy6p4aDjxPFF1nJr1GUCph45gEIcOgXpfXEJUJSqxpVKMp8
         pctHbasYawzT4fv7IunUsSwcsxWJ/4OiHYfnTc/ZujGh2N1MRn4/azyAPfuaO4hns53V
         LmrhYuwy+nWsJ6Q4OvL8BClY7jarbo6AXFeWi6EIDtTqDrRlzN67nr2LgO1PvbgEifpQ
         /VU5N+GxZH1uvcke5AjIF6IqM9BtXIf/pwZuEgh4sspKDJ3H7bdsvfKAvR73UCqs/CCG
         L2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=GKaLB7A8dkWd3eVBSSzmxBTwLfVgx0xVv8AjnSe3ySs=;
        b=fStxWVRh2iwhcL5nreATR2TagIfcGaatkuddRZt4sbxYAV0LXAjT9nwcX/7zm1fEwV
         HjYpRjXYNF8qJ9PoBTLzesWzRq/XsaHN7/ryChc0A7DTan90+5eV3tYwgZibyqZn9yeV
         zYZLcyf5Xn8Pf8NfPphT0+Fcr30bbl4f3+0O20UDFwN/DsiU6qIotYjTZppqn1+XfbOO
         3sY0hBAZnRAT8VGIcrtjsHlVOU4GqIiIXfMPkQuDij6F/nEVJUxHUVKvSnxuj9teDhCT
         LzVznw/RVZ37TtZXDJIobI9UW5+BPUfqJSkiqAkk/rCttvstLlFACT7XvUj2ck4fcUFK
         4JYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2si39849814wmc.64.2019.01.24.06.17.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 06:17:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmfom-0007YY-DN
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 09:17:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmfoY-0007WV-40
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 09:17:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmfoX-0002gK-63
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 09:17:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49652)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gmfoW-0002fg-Tn; Thu, 24 Jan 2019 09:17:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AEA689AE1;
	Thu, 24 Jan 2019 14:17:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 481DF672C1;
	Thu, 24 Jan 2019 14:16:57 +0000 (UTC)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20190124141147.8416-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <9f139596-5901-d775-fc56-4a4d1bb0acc4@redhat.com>
Date: Thu, 24 Jan 2019 15:16:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190124141147.8416-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 24 Jan 2019 14:17:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] tests/microbit-test: Add tests for nRF51 NVMC
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
	contrib@steffen-goertz.de, qemu-arm@nongnu.org, joel@jms.id.au,
	Paolo Bonzini <pbonzini@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AYALhclx8smJ

On 2019-01-24 15:11, Stefan Hajnoczi wrote:
> From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
>=20
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> This resolves the conflict with Julia's UART test series due to
> global_qtest removal.
>=20
>  tests/microbit-test.c | 108 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>=20
> diff --git a/tests/microbit-test.c b/tests/microbit-test.c
> index 3bad947b6c..04e199ec33 100644
> --- a/tests/microbit-test.c
> +++ b/tests/microbit-test.c
> @@ -21,6 +21,7 @@
>  #include "hw/arm/nrf51.h"
>  #include "hw/char/nrf51_uart.h"
>  #include "hw/gpio/nrf51_gpio.h"
> +#include "hw/nvram/nrf51_nvm.h"
>  #include "hw/timer/nrf51_timer.h"
>  #include "hw/i2c/microbit_i2c.h"
> =20
> @@ -156,6 +157,112 @@ static void test_microbit_i2c(void)
>      qtest_quit(qts);
>  }
> =20
> +#define FLASH_SIZE          (256 * NRF51_PAGE_SIZE)
> +
> +static void fill_and_erase(QTestState *qts, hwaddr base, hwaddr size,
> +                           uint32_t address_reg)
> +{
> +    hwaddr i;
> +
> +    /* Erase Page */
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
> +    qtest_writel(qts, NRF51_NVMC_BASE + address_reg, base);
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
> +
> +    /* Check memory */
> +    for (i =3D 0; i < size / 4; i++) {
> +        g_assert_cmpuint(qtest_readl(qts, base + i * 4), =3D=3D, 0xFFF=
FFFFF);
> +    }
> +
> +    /* Fill memory */
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x01);
> +    for (i =3D 0; i < size / 4; i++) {
> +        qtest_writel(qts, base + i * 4, i);
> +        g_assert_cmpuint(qtest_readl(qts, base + i * 4), =3D=3D, i);
> +    }
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
> +}
> +
> +static void test_nrf51_nvmc(void)
> +{
> +    uint32_t value;
> +    hwaddr i;
> +    QTestState *qts =3D qtest_init("-M microbit");
> +
> +    /* Test always ready */
> +    value =3D qtest_readl(qts, NRF51_NVMC_BASE + NRF51_NVMC_READY);
> +    g_assert_cmpuint(value & 0x01, =3D=3D, 0x01);
> +
> +    /* Test write-read config register */
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x03);
> +    g_assert_cmpuint(qtest_readl(qts, NRF51_NVMC_BASE + NRF51_NVMC_CON=
FIG),
> +                     =3D=3D, 0x03);
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
> +    g_assert_cmpuint(qtest_readl(qts, NRF51_NVMC_BASE + NRF51_NVMC_CON=
FIG),
> +                     =3D=3D, 0x00);
> +
> +    /* Test PCR0 */
> +    fill_and_erase(qts, NRF51_FLASH_BASE, NRF51_PAGE_SIZE,
> +                   NRF51_NVMC_ERASEPCR0);
> +    fill_and_erase(qts, NRF51_FLASH_BASE + NRF51_PAGE_SIZE,
> +                   NRF51_PAGE_SIZE, NRF51_NVMC_ERASEPCR0);
> +
> +    /* Test PCR1 */
> +    fill_and_erase(qts, NRF51_FLASH_BASE, NRF51_PAGE_SIZE,
> +                   NRF51_NVMC_ERASEPCR1);
> +    fill_and_erase(qts, NRF51_FLASH_BASE + NRF51_PAGE_SIZE,
> +                   NRF51_PAGE_SIZE, NRF51_NVMC_ERASEPCR1);
> +
> +    /* Erase all */
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_ERASEALL, 0x01);
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
> +
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x01);
> +    for (i =3D 0; i < FLASH_SIZE / 4; i++) {
> +        qtest_writel(qts, NRF51_FLASH_BASE + i * 4, i);
> +        g_assert_cmpuint(qtest_readl(qts, NRF51_FLASH_BASE + i * 4), =3D=
=3D, i);
> +    }
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
> +
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_ERASEALL, 0x01);
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
> +
> +    for (i =3D 0; i < FLASH_SIZE / 4; i++) {
> +        g_assert_cmpuint(qtest_readl(qts, NRF51_FLASH_BASE + i * 4),
> +                         =3D=3D, 0xFFFFFFFF);
> +    }
> +
> +    /* Erase UICR */
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_ERASEUICR, 0x01);
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
> +
> +    for (i =3D 0; i < NRF51_UICR_SIZE / 4; i++) {
> +        g_assert_cmpuint(qtest_readl(qts, NRF51_UICR_BASE + i * 4),
> +                         =3D=3D, 0xFFFFFFFF);
> +    }
> +
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x01);
> +    for (i =3D 0; i < NRF51_UICR_SIZE / 4; i++) {
> +        qtest_writel(qts, NRF51_UICR_BASE + i * 4, i);
> +        g_assert_cmpuint(qtest_readl(qts, NRF51_UICR_BASE + i * 4), =3D=
=3D, i);
> +    }
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
> +
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x02);
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_ERASEUICR, 0x01);
> +    qtest_writel(qts, NRF51_NVMC_BASE + NRF51_NVMC_CONFIG, 0x00);
> +
> +    for (i =3D 0; i < NRF51_UICR_SIZE / 4; i++) {
> +        g_assert_cmpuint(qtest_readl(qts, NRF51_UICR_BASE + i * 4),
> +                         =3D=3D, 0xFFFFFFFF);
> +    }
> +
> +    qtest_quit(qts);
> +}
> +
>  static void test_nrf51_gpio(void)
>  {
>      size_t i;
> @@ -392,6 +499,7 @@ int main(int argc, char **argv)
> =20
>      qtest_add_func("/microbit/nrf51/uart", test_nrf51_uart);
>      qtest_add_func("/microbit/nrf51/gpio", test_nrf51_gpio);
> +    qtest_add_func("/microbit/nrf51/nvmc", test_nrf51_nvmc);
>      qtest_add_func("/microbit/nrf51/timer", test_nrf51_timer);
>      qtest_add_func("/microbit/microbit/i2c", test_microbit_i2c);

Thank you for getting rid of global_qtest stuff also here!

Acked-by: Thomas Huth <thuth@redhat.com>
