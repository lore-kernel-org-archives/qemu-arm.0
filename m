Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2499118lft;
        Mon, 27 Jun 2022 09:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vl6KYuoebI2fXxoS8ReoQRl3d0tM30Zj2t6uXaKg0pRid0eOVdUYgQ26oHyc7uECjyH92y
X-Received: by 2002:ac8:5783:0:b0:31a:fb7a:db5d with SMTP id v3-20020ac85783000000b0031afb7adb5dmr2712264qta.53.1656346971928;
        Mon, 27 Jun 2022 09:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656346971; cv=none;
        d=google.com; s=arc-20160816;
        b=M04mJ+hhfOzZ5GcQ9Obab3kQM18jXmltB3FPKz3vuMQQi/Ju+xFFB66I0xPPZ/XDDt
         bIm1fesbNP7ofWjSfYkG8dEzsgv9skatfCIdRm++3a3lmdVOlSgS7aqMKbApjcMglw5Y
         u2XhCtGMZaFFuZhgHBYgb52D20xtYwBxYhl5/r2PE/DTu6bhKdgD28/ptqoGoAIq9M5q
         50842XIcvQhx6oPYZHRdcjGC1Z+WcN+gTZXMY44dY201f97sqIOqrrwEfy3780pU5Zva
         AiQfW7bbPjQeNb9+N1z5YrZ07Q/B+9dPwk4oFVATCIgZXp4nWS4NPVxN0GkQa+FQ7U+V
         DNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=NejY9VqAqUe2RQjVcNI2hIPO8m+4JUNjE9U3mmwhyME=;
        b=GeZptE96eMrRSmc8jtLscs6Jk7Ywmw2t6Syu7Lh7LXbkRyPVZBqjvpMBfHGr35V95x
         tgZ4Yi98HLk8QAP3g8Y7CHczmFtHh63TdWAc2howpr8TWh88ftbl1r6uZcSf4uxb5tkg
         iIKN1aNM5WDAint3jrQWOCI3k+SbPXYXt9Hu5tuMxvAbMP6yBV1Eo7sRgb6ewLZxwJZC
         CdoYjUn86Hd37yZGDCsn1Qdxcowki738FaPQNkzELjtQf23c66w/oxFGB0Vz+wNiesmu
         AYGtE/GpfUJ7BtY9ycDbmVKAYvBwxXpMHSfHCZdedB9MXJbp0bmt/o0EF+xw03YMeKUr
         qQRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t19-20020a05622a181300b00304f7dc0f84si5911642qtc.251.2022.06.27.09.22.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 09:22:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5rVj-0001Kr-Ee
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 12:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rAj-0007kp-MR
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 12:01:12 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:50373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rAg-0007Xt-UW
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 12:01:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.217])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 27B8B25708;
 Mon, 27 Jun 2022 16:01:05 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 27 Jun
 2022 18:01:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00618e0e2dc-2dec-4167-b6fb-82e72a910f47,
 659C98CE65B422D4D127A36693B7EAD6442F0B22) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <19da941d-8717-cecf-371f-7c0b6269635a@kaod.org>
Date: Mon, 27 Jun 2022 18:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 3/7] hw/i2c: pmbus: Page #255 is valid page for read
 requests.
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Patrick Venture
 <venture@google.com>, Hao Wu <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
 <20220627154703.148943-4-quic_jaehyoo@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627154703.148943-4-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d5a47e17-6971-4716-bd9f-0ff033b0b28a
X-Ovh-Tracer-Id: 15294505813468679157
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevffeigedttddvgfetjeehvdegkeetleeigeffgeduleevfeefgedvvdeftdekvdenucffohhmrghinhepmhgrgihimhhinhhtvghgrhgrthgvugdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tlbT14fwCx8I

On 6/27/22 17:46, Jae Hyun Yoo wrote:
> From: Maheswara Kurapati <quic_mkurapat@quicinc.com>
> 
> Current implementation of the pmbus core driver treats the read request
> for page 255 as invalid request and sets the invalid command bit (bit 7)
> in the STATUS_CML register. As per the PMBus specification it is a valid
> request.
> 
> Refer to the PMBus specification, revision 1.3.1, section 11.10 PAGE,
> on the page 58:
>    "Setting the PAGE to FFh means that all subsequent comands are to be
>     applied to all outputs.
> 
>     Some commands, such as READ_TEMPERATURE, may use a common sensor but
>     be available on all pages of a device. Such implementations are the
>     decision of each device manufacturer or are specified in a PMBus
>     Application Profile. Consult the manufacturer's documents or the
>     Application Profile Specification as needed."
> 
> For e.g.,
> The VOUT_MODE is a valid command for page 255 for maxim 31785 device.
> refer to Table 1. PMBus Command Codes on page 14 in the datasheet.
> https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
> 
> Fixes: 38870253f1d1 ("hw/i2c: pmbus: fix error returns and guard against out of range accesses")
> 
> Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> Changes in v2:
> * Fixed comment for a case of PB_ALL_PAGES. (Titus)
> * Removed an error log printing when it handles PB_ALL_PAGES. (Jae)
> 
>   hw/i2c/pmbus_device.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index 62885fa6a15e..749a33af827b 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -284,14 +284,10 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>   
>       /*
>        * Reading from all pages will return the value from page 0,
> -     * this is unspecified behaviour in general.
> +     * means that all subsequent commands are to be applied to all output.
>        */
>       if (pmdev->page == PB_ALL_PAGES) {
>           index = 0;
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: tried to read from all pages\n",
> -                      __func__);
> -        pmbus_cml_error(pmdev);
>       } else if (pmdev->page > pmdev->num_pages - 1) {
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "%s: page %d is out of range\n",

