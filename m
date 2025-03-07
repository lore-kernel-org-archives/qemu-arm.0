Received: by 2002:a05:7022:90e:b0:99:f831:508e with SMTP id bs14csp2014001dlb;
        Thu, 6 Mar 2025 23:24:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6ZS010UCRy2SCalusuXvJOQUK/uwZHzAnC8xjQ+r+PtxPOuwCX/cJImUQXqmCfqZaTBynaYB+d+vW7w==@linaro.org
X-Google-Smtp-Source: AGHT+IHgH1WbReYUb+4cWVG2aXCHcQtGa899XNMj7vePcKm2R+UgKRKqt+D17WbyHCOyCmfUr/OH
X-Received: by 2002:a05:622a:4b:b0:471:9774:a03a with SMTP id d75a77b69052e-476109a2f4dmr24274581cf.15.1741332277434;
        Thu, 06 Mar 2025 23:24:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741332277; cv=none;
        d=google.com; s=arc-20240605;
        b=PL8ohFCJZOZ6/LJCNkEDjHQ/n17l7pTPQVBzXBMYOUtN9Gu+QXZ6xZOuPfjWzAh19s
         M025LwV05zj5AgXdPPx99BBovwhL+Mwa19uIsY0i8KSLpF+Xbj4ky9anbmRNb9fT65/7
         I9opXJIE3CkNdf7amiWKKNlgbEIpRKqcA+AEkn73T8D7epg153hMy/8zO6nDNuiVmNAs
         +s2nb1q0KACh7wSQ9K32HUnJ3HeTX+TRsSz/a1JApffF9NSbVfQfqvsH8g5DTpxTPHJ4
         AQS8oX6Rp2AblDn93RnVijpjgMDy36yHXe0HJGrzAQDbHacSWs1xEb7qVI+OAocHNEOV
         YqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=IahsvholOaXY/Zm5UZRVHrQasg98Byf+wcRKVwGB2/0=;
        fh=JUqExWdVyO9KjlFCuMigXej9m2rYeji+PtTsDk1BqAY=;
        b=B2dn8ry4KmPEHWJC32TfTUCgKz9e5yHBM73FmN6yQ49Un8W6GpdBquLaq2UzljRIcB
         w+ILGcCebY7N99FmdZhCITk2FB/hh6uJOlJg5H+fazjKwkmj3GmZHJX7VuzCN1/JvLVE
         IVHeb8w52yo0y6wSAhhmAP+4Okb2F7vtm1dT/oVVG03x/JhhqsN5g+i+0t4rZrqvqesD
         8frkSwSoiGBJs1p+qWkYuYTFT+YWk4G95c9SVt3u5VI9Y2KhR6x3nSDS+Hmp9IgTzrf8
         syzx3QjeqbiQ8SHDLfVswCn1xKtZOfE7Z51x/sUyDdBxQlMKox4ItzJvRsWvLfqMS8qV
         jKyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db1e1e4si29045881cf.433.2025.03.06.23.24.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 23:24:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqS3r-000071-So; Fri, 07 Mar 2025 02:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3Khh=V2=kaod.org=clg@ozlabs.org>)
 id 1tqS3n-0008Uv-UY; Fri, 07 Mar 2025 02:23:56 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3Khh=V2=kaod.org=clg@ozlabs.org>)
 id 1tqS3j-0001cN-Nd; Fri, 07 Mar 2025 02:23:53 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Z8HpD4gQgz4x5k;
 Fri,  7 Mar 2025 18:23:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z8Hp91tV5z4wcy;
 Fri,  7 Mar 2025 18:23:44 +1100 (AEDT)
Message-ID: <08b3a2e4-8d71-413b-9a04-257a35ca28a1@kaod.org>
Date: Fri, 7 Mar 2025 08:23:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/29] hw/intc/aspeed: Introduce dynamic allocation for
 regs array
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
 <20250307035945.3698802-4-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 xsFNBFu8o3UBEADP+oJVJaWm5vzZa/iLgpBAuzxSmNYhURZH+guITvSySk30YWfLYGBWQgeo
 8NzNXBY3cH7JX3/a0jzmhDc0U61qFxVgrPqs1PQOjp7yRSFuDAnjtRqNvWkvlnRWLFq4+U5t
 yzYe4SFMjFb6Oc0xkQmaK2flmiJNnnxPttYwKBPd98WfXMmjwAv7QfwW+OL3VlTPADgzkcqj
 53bfZ4VblAQrq6Ctbtu7JuUGAxSIL3XqeQlAwwLTfFGrmpY7MroE7n9Rl+hy/kuIrb/TO8n0
 ZxYXvvhT7OmRKvbYuc5Jze6o7op/bJHlufY+AquYQ4dPxjPPVUT/DLiUYJ3oVBWFYNbzfOrV
 RxEwNuRbycttMiZWxgflsQoHF06q/2l4ttS3zsV4TDZudMq0TbCH/uJFPFsbHUN91qwwaN/+
 gy1j7o6aWMz+Ib3O9dK2M/j/O/Ube95mdCqN4N/uSnDlca3YDEWrV9jO1mUS/ndOkjxa34ia
 70FjwiSQAsyIwqbRO3CGmiOJqDa9qNvd2TJgAaS2WCw/TlBALjVQ7AyoPEoBPj31K74Wc4GS
 Rm+FSch32ei61yFu6ACdZ12i5Edt+To+hkElzjt6db/UgRUeKfzlMB7PodK7o8NBD8outJGS
 tsL2GRX24QvvBuusJdMiLGpNz3uqyqwzC5w0Fd34E6G94806fwARAQABzSBDw6lkcmljIExl
 IEdvYXRlciA8Y2xnQGthb2Qub3JnPsLBeAQTAQIAIgUCW7yjdQIbAwYLCQgHAwIGFQgCCQoL
 BBYCAwECHgECF4AACgkQUaNDx8/77KGRSxAAuMJJMhJdj7acTcFtwof7CDSfoVX0owE2FJdd
 M43hNeTwPWlV5oLCj1BOQo0MVilIpSd9Qu5wqRD8KnN2Bv/rllKPqK2+i8CXymi9hsuzF56m
 76wiPwbsX54jhv/VYY9Al7NBknh6iLYJiC/pgacRCHtSj/wofemSCM48s61s1OleSPSSvJE/
 jYRa0jMXP98N5IEn8rEbkPua/yrm9ynHqi4dKEBCq/F7WDQ+FfUaFQb4ey47A/aSHstzpgsl
 TSDTJDD+Ms8y9x2X5EPKXnI3GRLaCKXVNNtrvbUd9LsKymK3WSbADaX7i0gvMFq7j51P/8yj
 neaUSKSkktHauJAtBNXHMghWm/xJXIVAW8xX5aEiSK7DNp5AM478rDXn9NZFUdLTAScVf7LZ
 VzMFKR0jAVG786b/O5vbxklsww+YXJGvCUvHuysEsz5EEzThTJ6AC5JM2iBn9/63PKiS3ptJ
 QAqzasT6KkZ9fKLdK3qtc6yPaSm22C5ROM3GS+yLy6iWBkJ/nEYh/L/du+TLw7YNbKejBr/J
 ml+V3qZLfuhDjW0GbeJVPzsENuxiNiBbyzlSnAvKlzda/sBDvxmvWhC+nMRQCf47mFr8Xx3w
 WtDSQavnz3zTa0XuEucpwfBuVdk4RlPzNPri6p2KTBhPEvRBdC9wNOdRBtsP9rAPjd52d73O
 wU0EW7yjdQEQALyDNNMw/08/fsyWEWjfqVhWpOOrX2h+z4q0lOHkjxi/FRIRLfXeZjFfNQNL
 SoL8j1y2rQOs1j1g+NV3K5hrZYYcMs0xhmrZKXAHjjDx7FW3sG3jcGjFW5Xk4olTrZwFsZVU
 cP8XZlArLmkAX3UyrrXEWPSBJCXxDIW1hzwpbV/nVbo/K9XBptT/wPd+RPiOTIIRptjypGY+
 S23HYBDND3mtfTz/uY0Jytaio9GETj+fFis6TxFjjbZNUxKpwftu/4RimZ7qL+uM1rG1lLWc
 9SPtFxRQ8uLvLOUFB1AqHixBcx7LIXSKZEFUCSLB2AE4wXQkJbApye48qnZ09zc929df5gU6
 hjgqV9Gk1rIfHxvTsYltA1jWalySEScmr0iSYBZjw8Nbd7SxeomAxzBv2l1Fk8fPzR7M616d
 tb3Z3HLjyvwAwxtfGD7VnvINPbzyibbe9c6gLxYCr23c2Ry0UfFXh6UKD83d5ybqnXrEJ5n/
 t1+TLGCYGzF2erVYGkQrReJe8Mld3iGVldB7JhuAU1+d88NS3aBpNF6TbGXqlXGF6Yua6n1c
 OY2Yb4lO/mDKgjXd3aviqlwVlodC8AwI0SdujWryzL5/AGEU2sIDQCHuv1QgzmKwhE58d475
 KdVX/3Vt5I9kTXpvEpfW18TjlFkdHGESM/JxIqVsqvhAJkalABEBAAHCwV8EGAECAAkFAlu8
 o3UCGwwACgkQUaNDx8/77KEhwg//WqVopd5k8hQb9VVdk6RQOCTfo6wHhEqgjbXQGlaxKHoX
 ywEQBi8eULbeMQf5l4+tHJWBxswQ93IHBQjKyKyNr4FXseUI5O20XVNYDJZUrhA4yn0e/Af0
 IX25d94HXQ5sMTWr1qlSK6Zu79lbH3R57w9jhQm9emQEp785ui3A5U2Lqp6nWYWXz0eUZ0Ta
 d2zC71Gg9VazU9MXyWn749s0nXbVLcLS0yops302Gf3ZmtgfXTX/W+M25hiVRRKCH88yr6it
 +OMJBUndQVAA/fE9hYom6t/zqA248j0QAV/pLHH3hSirE1mv+7jpQnhMvatrwUpeXrOiEw1n
 HzWCqOJUZ4SY+HmGFW0YirWV2mYKoaGO2YBUwYF7O9TI3GEEgRMBIRT98fHa0NPwtlTktVIS
 l73LpgVscdW8yg9Gc82oe8FzU1uHjU8b10lUXOMHpqDDEV9//r4ZhkKZ9C4O+YZcTFu+mvAY
 3GlqivBNkmYsHYSlFsbxc37E1HpTEaSWsGfAHQoPn9qrDJgsgcbBVc1gkUT6hnxShKPp4Pls
 ZVMNjvPAnr5TEBgHkk54HQRhhwcYv1T2QumQizDiU6iOrUzBThaMhZO3i927SG2DwWDVzZlt
 KrCMD1aMPvb3NU8FOYRhNmIFR3fcalYr+9gDuVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20250307035945.3698802-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=3Khh=V2=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rQdCUskhws2q

On 3/7/25 04:59, Jamin Lin wrote:
> Currently, the size of the "regs" array is 0x2000, which is too large. To save
> code size and avoid mapping large unused gaps, will update it to only map the
> useful set of registers. This update will support multiple sub-regions with
> different sizes.
> 
> To address the redundant size issue, replace the static "regs" array with a
> dynamically allocated "regs" memory.
> 
> Introduce a new "aspeed_intc_unrealize" function to free the allocated "regs"
> memory.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   include/hw/intc/aspeed_intc.h |  2 +-
>   hw/intc/aspeed_intc.c         | 12 +++++++++++-
>   2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
> index 03324f05ab..47ea0520b5 100644
> --- a/include/hw/intc/aspeed_intc.h
> +++ b/include/hw/intc/aspeed_intc.h
> @@ -27,7 +27,7 @@ struct AspeedINTCState {
>       MemoryRegion iomem;
>       MemoryRegion iomem_container;
>   
> -    uint32_t regs[ASPEED_INTC_NR_REGS];
> +    uint32_t *regs;
>       OrIRQState orgates[ASPEED_INTC_NR_INTS];
>       qemu_irq output_pins[ASPEED_INTC_NR_INTS];
>   
> diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
> index 465f41e4fd..558901570f 100644
> --- a/hw/intc/aspeed_intc.c
> +++ b/hw/intc/aspeed_intc.c
> @@ -289,7 +289,7 @@ static void aspeed_intc_reset(DeviceState *dev)
>   {
>       AspeedINTCState *s = ASPEED_INTC(dev);
>   
> -    memset(s->regs, 0, sizeof(s->regs));
> +    memset(s->regs, 0, ASPEED_INTC_NR_REGS << 2);
>       memset(s->enable, 0, sizeof(s->enable));
>       memset(s->mask, 0, sizeof(s->mask));
>       memset(s->pending, 0, sizeof(s->pending));
> @@ -307,6 +307,7 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
>   
>       sysbus_init_mmio(sbd, &s->iomem_container);
>   
> +    s->regs = g_new(uint32_t, ASPEED_INTC_NR_REGS);
>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
>                             TYPE_ASPEED_INTC ".regs", ASPEED_INTC_NR_REGS << 2);
>   
> @@ -322,12 +323,21 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
>       }
>   }
>   
> +static void aspeed_intc_unrealize(DeviceState *dev)
> +{
> +    AspeedINTCState *s = ASPEED_INTC(dev);
> +
> +    g_free(s->regs);
> +    s->regs = NULL;
> +}
> +
>   static void aspeed_intc_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
>   
>       dc->desc = "ASPEED INTC Controller";
>       dc->realize = aspeed_intc_realize;
> +    dc->unrealize = aspeed_intc_unrealize;
>       device_class_set_legacy_reset(dc, aspeed_intc_reset);
>       dc->vmsd = NULL;
>   }

