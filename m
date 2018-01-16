Received: by 10.28.173.206 with SMTP id w197csp3509406wme;
        Mon, 15 Jan 2018 20:39:40 -0800 (PST)
X-Google-Smtp-Source: ACJfBospLLxAMLhWDP4igiSZwigd1kgqaDEtfjjRX1C0Dge1gHV49OFbpU622jIsV2TcKZbFU/Xj
X-Received: by 10.129.43.86 with SMTP id r83mr8415213ywr.309.1516077580793;
        Mon, 15 Jan 2018 20:39:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516077580; cv=none;
        d=google.com; s=arc-20160816;
        b=tBEMAnSiZWCg9wRjNjLzJFgL0a+TeevKLqD66tagrO2oCkmyZ1BNlMX6swFIqz+i6k
         McBAUtUK4aaCnZjdQtsQ1Yvn6Dd0i1T6hw+G0gzOPV3YKS+hAIqPMZHh7mGT5Cz8tA+9
         vRO3JQBHnSCLXh1F7BAQ+o0JtzWgz01KlDwu7RC2weltp+VWVl2TZpj+IuRzlFCqFRAk
         tTSdI1hGynVQ+P6Rkl7jWkswCI5WxF1u20vG3fMxVwww8pZAvD7Iph16AZFJYkEMJbQb
         4bWWlnOkvPbmFcPkQkYB2/RZUA5K4vghTB1mFqOR64hlPr7J83y8nyJ8qPNdF6GHOFv1
         oEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=OBn2WbkZ/4y0yhWCpUheBDVmKMb6K6e2Da3uFk9y0Q8=;
        b=IR3n9D6u4BTUutAo9/MrQ6NeybgLwjVUyJ41OztOZm213ZK0YlPFOwqzAkHIB9pB2W
         mZBqaJwk1DkXtRzKQIxjcF7xwEK7stL3ZNgkkOI3Km85C9loNC7jf3d5cxaU8UZmxKn1
         By3koafgl0cItueSeZf3If06nLeWhizsx0QCojb5JoecWWuG2dinyGcQIC5gLLgSmkrb
         zNjszLy8b0jzlDHKZ5l46BJE+pF9snBZukIFDtmlRFm2aFU/iIZoNOIq77MFeTGrdVqC
         fcX1QeI98UK7FbgcOadX/kpXUvgNZFEHvCjasbzucGO767Cl74dDyddhUdRvxxeoXCo8
         BdmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SSaFJjep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e11si305746ybk.263.2018.01.15.20.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 20:39:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SSaFJjep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebJ2C-0003sN-73
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 23:39:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebJ22-0003qD-Qr
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 23:39:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebJ21-0001OR-PK
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 23:39:30 -0500
Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c]:43698)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ebJ1x-0001Mq-8W; Mon, 15 Jan 2018 23:39:25 -0500
Received: by mail-qt0-x22c.google.com with SMTP id s3so16781436qtb.10;
	Mon, 15 Jan 2018 20:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OBn2WbkZ/4y0yhWCpUheBDVmKMb6K6e2Da3uFk9y0Q8=;
	b=SSaFJjepksDt/7rvkrvgT9F1Il6eTWkZO6BGyQT2tyBZM++pQbTiZBH7Uy/8TGWW9F
	Zpaa/xoDkiwCSf98s0pu+yE1R4uXvvb8D3elElKTjt28ixNmvieC2b03i8BOtJ5JMaQm
	JVXzKcoe5i9WSHaLuCBvxMFNVmsszSceaZjLQHP0mHnjS7Yk82njKC9EJIIPcANrt5Nj
	zgwbNk6GpVJn5UxAoy9h2spdhgNUoJD6q0Zz0qGONc78C17oi7vNAECLDS2uVdnNeGiz
	ITwDgU5O08IkgnBy8UyIgUteZDRwLzL5h0wmeT1qLmZe3IstA69Doayb9aYzVubauuvU
	WwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=OBn2WbkZ/4y0yhWCpUheBDVmKMb6K6e2Da3uFk9y0Q8=;
	b=SfwdgPnGwdDQEAyub1nrkONJEkchATiY65DCjJ85zNduf6lbCd9j/3SzcmurWyug/V
	mq/vPjvZB4xzIpbqRZiR0XDQoU74jN5W/RFeoqxZkw+osgZsIKHWWM/T69g42PbjV9Mk
	vo5PnKZmQqhFf++93scBuT2eGvjoLfeAzBkHYW7DMg2hQqj8Xn1s2ta6ngiWEB9fWjlu
	Mk5TCIVOz1ClZyzuXgEQhE+p3z53ccrnv6wkPkIasiPNAc/j9CeoDixstEqZi/AmUpOh
	6tGNqR6T137DktZOjsPkCmI12WIKqqn2ey1p0N38ZN/w774eIR5EhzWQj5qbUi3YRY5E
	4ODA==
X-Gm-Message-State: AKwxytdSfa3EYhY3wGPe2ossant92vBUZIj3KC9aNW1AgKSUpupmZkAY
	meVnY3TLE6hKKBCBjtzNQzk=
X-Received: by 10.200.6.200 with SMTP id j8mr21074216qth.137.1516077564645;
	Mon, 15 Jan 2018 20:39:24 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id x7sm905721qtx.51.2018.01.15.20.39.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 20:39:24 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-8-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <188bcda9-1a5c-e837-f80b-1d484d42e195@amsat.org>
Date: Tue, 16 Jan 2018 01:39:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180116013709.13830-8-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22c
Subject: Re: [Qemu-arm] [PATCH v4 07/14] i.MX: Add i.MX7 GPT variant
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oUlTCqdFBqO1

On 01/15/2018 10:37 PM, Andrey Smirnov wrote:
> Add minimal code needed to allow upstream Linux guest to boot.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/timer/imx_gpt.c         | 25 +++++++++++++++++++++++++
>  include/hw/timer/imx_gpt.h |  1 +
>  2 files changed, 26 insertions(+)
> 
> diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
> index 4b9b54bf2e..65e4ee6bcf 100644
> --- a/hw/timer/imx_gpt.c
> +++ b/hw/timer/imx_gpt.c
> @@ -113,6 +113,17 @@ static const IMXClk imx6_gpt_clocks[] = {
>      CLK_HIGH,      /* 111 reference clock */
>  };
>  
> +static const IMXClk imx7_gpt_clocks[] = {
> +    CLK_NONE,      /* 000 No clock source */
> +    CLK_IPG,       /* 001 ipg_clk, 532MHz*/
> +    CLK_IPG_HIGH,  /* 010 ipg_clk_highfreq */
> +    CLK_EXT,       /* 011 External clock */
> +    CLK_32k,       /* 100 ipg_clk_32k */
> +    CLK_HIGH,      /* 101 reference clock */
> +    CLK_NONE,      /* 110 not defined */
> +    CLK_NONE,      /* 111 not defined */
> +};
> +
>  static void imx_gpt_set_freq(IMXGPTState *s)
>  {
>      uint32_t clksrc = extract32(s->cr, GPT_CR_CLKSRC_SHIFT, 3);
> @@ -512,6 +523,13 @@ static void imx6_gpt_init(Object *obj)
>      s->clocks = imx6_gpt_clocks;
>  }
>  
> +static void imx7_gpt_init(Object *obj)
> +{
> +    IMXGPTState *s = IMX_GPT(obj);
> +
> +    s->clocks = imx7_gpt_clocks;
> +}
> +
>  static const TypeInfo imx25_gpt_info = {
>      .name = TYPE_IMX25_GPT,
>      .parent = TYPE_SYS_BUS_DEVICE,
> @@ -532,11 +550,18 @@ static const TypeInfo imx6_gpt_info = {
>      .instance_init = imx6_gpt_init,
>  };
>  
> +static const TypeInfo imx7_gpt_info = {
> +    .name = TYPE_IMX7_GPT,
> +    .parent = TYPE_IMX25_GPT,

ideally there should be an abstract TYPE_IMX_GPT you'd use as parent
rather than the TYPE_IMX25_GPT, anyway out of the scope of this series.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    .instance_init = imx7_gpt_init,
> +};
> +
>  static void imx_gpt_register_types(void)
>  {
>      type_register_static(&imx25_gpt_info);
>      type_register_static(&imx31_gpt_info);
>      type_register_static(&imx6_gpt_info);
> +    type_register_static(&imx7_gpt_info);
>  }
>  
>  type_init(imx_gpt_register_types)
> diff --git a/include/hw/timer/imx_gpt.h b/include/hw/timer/imx_gpt.h
> index eac59b2a70..20ccb327c4 100644
> --- a/include/hw/timer/imx_gpt.h
> +++ b/include/hw/timer/imx_gpt.h
> @@ -77,6 +77,7 @@
>  #define TYPE_IMX25_GPT "imx25.gpt"
>  #define TYPE_IMX31_GPT "imx31.gpt"
>  #define TYPE_IMX6_GPT "imx6.gpt"
> +#define TYPE_IMX7_GPT "imx7.gpt"
>  
>  #define TYPE_IMX_GPT TYPE_IMX25_GPT
>  
> 
