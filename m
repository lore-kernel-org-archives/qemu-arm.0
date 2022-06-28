Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2981375lft;
        Tue, 28 Jun 2022 00:37:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uoNXfwMdrRAqYrh2axZQAJ/Bba6WlnaKalcnYTcIvxExyqLX8SV8xRAA8Ay9kL7kCz5dUr
X-Received: by 2002:a05:620a:294a:b0:6ae:fb7f:831 with SMTP id n10-20020a05620a294a00b006aefb7f0831mr10477991qkp.130.1656401860579;
        Tue, 28 Jun 2022 00:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656401860; cv=none;
        d=google.com; s=arc-20160816;
        b=uKaorPkEmmjKKAlcxwDszws6hr5rndm6UMq1VmiBjw4oZReRgg6s0hF11wSN6ia43e
         7gZWMBeIB45HtQbHmC4gJ2H5Oq0duCMAT967VZ50CwA0uxJ1x9wG+tZ2T1T2SBEI9QtM
         Zx/q9/l1sODwJycD1ujkp8Dh9CbT4dNlcHGn/YmMwir57I5W6uisrZ0OzgjVJ1BsGjsP
         zlE0Ow56tauxAbkHB47BTlcjpccSTu5ms5wzztCbZrP+HBsLFQJ32xDDJGqFGn3iVGZA
         p47JESiVVOL/8i8rlhCJJ4KkkchxY3C47F8UL69rGctq9QXf714VwHFAa4ZahdQvRS6f
         9tXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=1H/M7ffpYWNFO+7xSnsxs9WGMoEYerAh4Lm2gifXW7Y=;
        b=gL+IlHMKn1cttlFA+Xs578PQwma38oRug8x96Vd9maiQKPwAIbRIbcjiL2gWcpYWLG
         0yFLE9ZsGd5w8xUcTCWXYB07obHxZb7HvEAZroXev1EP6551bcQyXyIEHZePyATJxwMX
         KZSDjFfgajN1J99EFeVUsxccYcHLcWLVo1t1FiP03qKHg6++047d23bb7jBftP+gBSgt
         KU9LGj8AicL6aTZuHDYYI1DAbd0LOZAh8AEP/XEWfFXgDxydPhcqJeWLCfa6SgFRnGqy
         PgcSUcbu98YfUkNCOLkjlVtfIrVE4GmMz9n3AjGpLBkWGBQJ4r2JXgGcDVbWRJ7gkmLZ
         p7ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az43-20020a05620a172b00b006a69f7f782csi7314038qkb.194.2022.06.28.00.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 00:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o65n2-0002cG-1E
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 03:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o654M-0000vB-4j
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 02:51:35 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:44969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o654G-0006wK-U2
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 02:51:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.149])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CCCA511209F91;
 Tue, 28 Jun 2022 08:51:19 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 28 Jun
 2022 08:51:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00263a30d7b-bca4-4575-b4fe-1a5f5de9871c,
 0817C438BD46AF8310FE57DD1A4A0790F7CCC07F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <dcf7d788-1629-0fbd-b511-9c1272a5f7e3@kaod.org>
Date: Tue, 28 Jun 2022 08:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 09/14] pmbus: Reset out buf after switching pages
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <zhdaniel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <komlodi@google.com>, <titusr@google.com>, <andrew@aj.id.au>,
 <joel@jms.id.au>
References: <20220627195506.403715-1-pdel@fb.com>
 <20220627195506.403715-10-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627195506.403715-10-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 26e7c49c-c1e5-4c41-902f-8d1f1e997f1d
X-Ovh-Tracer-Id: 11882466144404999020
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 36ioxnxogaBB

On 6/27/22 21:55, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

is that a bug ?


> ---
>   hw/i2c/pmbus_device.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index 62885fa6a1..efddc36fd9 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -1088,6 +1088,7 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t *buf, uint8_t len)
>   
>       if (pmdev->code == PMBUS_PAGE) {
>           pmdev->page = pmbus_receive8(pmdev);
> +        pmdev->out_buf_len = 0;
>           return 0;
>       }
>   

