Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp490366ejb;
        Wed, 8 Feb 2023 23:57:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/CQiA2cYalZNAZhE1B53e87NIOFFn3jvAw/8sMl2hZHeQUbQNcmlV1Gt8Yd3otRqxzeQsT
X-Received: by 2002:a05:622a:1828:b0:3ba:2b4:7b39 with SMTP id t40-20020a05622a182800b003ba02b47b39mr19478999qtc.46.1675929473578;
        Wed, 08 Feb 2023 23:57:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675929473; cv=none;
        d=google.com; s=arc-20160816;
        b=VAogJMPT6WTGCwlHfVlpflMQpFr48syf8xiVjYRMtwGI8+i7CVKaz2hHxiAXNlETzz
         P5msTguuLVuIU+n4xC/89kqP1H3Rrbfvcp5r4P+QYkSLlca38G+3S7XpD8ndbPdgrKez
         5slbzk4WXZZS1p/XTdbHlJHRwHfi0rpZPl4GWgijZG8OWvdYZj6fGiAz57wMWJE053q4
         6nNrIMGP+g/Sl9jtTUEov9r5g1W5G4y0qZOXpV88CtLpUZCqRxq5YDpYiYj3/+LoCtEs
         3K+05m9t3APWaW29x1Qi9rqBwpK/hsRWWo5HXeTuxaOGl9USqa7iomhRoFt3iRQIs3iu
         AAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oOg3K0kslXsqe5kuQtNCNHCWg7t598kG6Ipm6ET+Uus=;
        b=IipCYhpTjDYZvdMTxzRuL61/uHvqDw3uUEOqNSazP0EY6+Qdm7zR5zNEodL15Ee6jv
         PhDimldRjHAgvetQR5qm+0M81gPT7u0FDwrCVLXsazGBxZQgM96IcFSejYMUWPAMUUjS
         /4/D+cpJHT3nOvnxAoEkAp4WsMYtWWdiVPjJa8aCI+lrY0qATx8IEwQgXLbQaLKz2f7Z
         MCBzestTlJF+N7rXvFIi9EXoEH6dcATXz3dVS60XWUYDz4tclhnGzp/+8bObiUCtXS8X
         pD5PvSghBk75Oyu7aXG3zYL6JuxE5Kp88ZqOqk+biMFIuHVvWq4USFc6OCsuQiTyX739
         VS/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oq88IRsE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17-20020ac87dd1000000b003ba23d469e6si1111917qte.159.2023.02.08.23.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 23:57:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oq88IRsE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQ1oJ-0005gi-UF; Thu, 09 Feb 2023 02:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1oI-0005gC-QJ
 for qemu-arm@nongnu.org; Thu, 09 Feb 2023 02:57:38 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ1oG-0006hU-S1
 for qemu-arm@nongnu.org; Thu, 09 Feb 2023 02:57:38 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bu23so865487wrb.8
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 23:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oOg3K0kslXsqe5kuQtNCNHCWg7t598kG6Ipm6ET+Uus=;
 b=oq88IRsEDag6FwpOxEhoAb4FYM9zoXpF8AWvdjxjPCL5RQPeNaXFv1FtZunavnY76/
 dDc6cxsNwlPQ9pZDnyPywGJ+ur7tfRf/c8Cw6GwXiIeUxdEccLhuWpJH6/5EHrlT0h2h
 EnZpwuAU86WeGsFIC/+w6SgD4oVWUFZ8RPoWBn+aepoy+z207zT4PzGx4I7IHSsBKfqo
 XUgVowpjz5KdvOLYGuaHoKHvN811p03l02H3RiShbR0WRa0ddeaHpbRcqzNmk8FbabTl
 xG6ZNfG07qQdEMZhM4mLAHiLAcrzxPx+2Wc5uucSsIUxX3c8wpZ39Y/Jof7H2Vzwm5ei
 15uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oOg3K0kslXsqe5kuQtNCNHCWg7t598kG6Ipm6ET+Uus=;
 b=4coX3G9ySecA+mW6W8NafvUKmtxev6j0C/s92RRvcooKnvDd5+gsASyux1rzqEoiHX
 OXjSO64LIAMmsZ6W6ThxF3EgxZudOLhcdzBteN00ukwtdWe5ntMnHcOekZVP9qmtMDZD
 BVZJZJcD9sqrbmsPdNs1msVeolavIjzPMhNMz5ilknuV2jUjr6sZ93IX6DrBvfNKd6iJ
 qgi6FLAOn8qew6ZgMS5JvuwobN+dyhlOGD/6z+LoPgjQHFjqlbLn8dGnp+3UIt7IPIxj
 0Va1E+nbcuFFbCNaDcwOF50fRZy6uTyxsKnj1OVlpPCqZePJ7yxzsjPVwFwYHGuuhL+7
 Ax9A==
X-Gm-Message-State: AO0yUKVYgc5P+dFuYyCAYgG35eIZW+nxBxXVycQb9GF77YoSU45QmRLA
 Z+CK1cZutrPAJD9nRJ4dqMAImw==
X-Received: by 2002:adf:e412:0:b0:2bf:9437:30eb with SMTP id
 g18-20020adfe412000000b002bf943730ebmr10956252wrm.17.1675929455138; 
 Wed, 08 Feb 2023 23:57:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c8-20020adffb08000000b002c406b357cfsm570181wrr.86.2023.02.08.23.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 23:57:34 -0800 (PST)
Message-ID: <ed2ae7f2-70b1-e5bd-217e-783c7071e4e8@linaro.org>
Date: Thu, 9 Feb 2023 08:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/4] hw/gpio: add PCA9538 8-bit GPIO expander
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, minyard@acm.org, eddie.dong@intel.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, joel@jms.id.au,
 Hao Wu <wuhaotsh@google.com>
References: <20230208224339.270589-1-titusr@google.com>
 <20230208224339.270589-3-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208224339.270589-3-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: tEiceSeqZ+RT

On 8/2/23 23:43, Titus Rwantare wrote:
>    The 8-bit expander has different register offsets than the 16-bit one,
>    making them incompatible.

Following extract/deposit API suggestion on previous patch, an
alternatively is to use PCAGPIOClass::input_port/output_port/...
offset fields.

> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/gpio/pca_i2c_gpio.c         | 94 ++++++++++++++++++++++++++++++++++
>   include/hw/gpio/pca_i2c_gpio.h |  7 +++
>   2 files changed, 101 insertions(+)


> diff --git a/include/hw/gpio/pca_i2c_gpio.h b/include/hw/gpio/pca_i2c_gpio.h
> index 99322959e1..3ab7d19a97 100644
> --- a/include/hw/gpio/pca_i2c_gpio.h
> +++ b/include/hw/gpio/pca_i2c_gpio.h
> @@ -19,6 +19,7 @@
>   
>   #define PCA_I2C_MAX_PINS                     16
>   #define PCA6416_NUM_PINS                     16
> +#define PCA9538_NUM_PINS                     8
>   
>   typedef struct PCAGPIOClass {
>       I2CSlaveClass parent;
> @@ -62,8 +63,14 @@ OBJECT_DECLARE_TYPE(PCAGPIOState, PCAGPIOClass, PCA_I2C_GPIO)
>   #define PCA6416_CONFIGURATION_PORT_0         0x06 /* read/write */
>   #define PCA6416_CONFIGURATION_PORT_1         0x07 /* read/write */
>   
> +#define PCA9538_INPUT_PORT                   0x00 /* read */
> +#define PCA9538_OUTPUT_PORT                  0x01 /* read/write */
> +#define PCA9538_POLARITY_INVERSION_PORT      0x02 /* read/write */
> +#define PCA9538_CONFIGURATION_PORT           0x03 /* read/write */

Something like this maybe:

     static uint8_t pca_i2c_gpio_recv(I2CSlave *i2c)
     {
         PCAGPIOState *ps = PCA_I2C_GPIO(i2c);
         PCAGPIOClass *pc = PCA_I2C_GPIO_GET_CLASS(i2c);
         unsigned shift = (ps->command) & pc->shift ? 8 : 0;
         uint8_t data;

         if (ps->command == pc->input_port) {
             data = extract16(ps->curr_input, shift, 8);
         } else if (ps->command == pc->output_port) {
             data = extract16(ps->curr_input, shift, 8);
         } else if (...) {

Maybe I'm over-engineering :)
