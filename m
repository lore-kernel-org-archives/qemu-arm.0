Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD73CC43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 06:29:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weoS1-0002QM-Li; Wed, 01 Jul 2026 02:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoRx-0002Pw-1L
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 02:29:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1weoRv-00010i-BQ
 for qemu-arm@nongnu.org; Wed, 01 Jul 2026 02:29:32 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6615lXhi137155
 for <qemu-arm@nongnu.org>; Wed, 1 Jul 2026 06:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qwxl5RCReUJATLJ+UxFybnZqLF/+nAtoHGo0MLbc6xE=; b=eGxo9DwI8PjIsHZY
 ktvJchJBABJezNmaBoqEgcfjQibtgx6QPt6zcqAJ2fpPoVOiKwCA33lrKTOmIwGu
 AP9eZe00YaJSOXL+tZz1wwiqKJND+wv0yUUj8Dcz1R/2R/aQ18tPmaY0X5UgnCUl
 2Y/stghCBVzjqYqVeKvwzse6sQm66+CRKcqVfehgalhV4Aly10F76Hfu/lGnzjRw
 +DSESz1/4cOys+BjwPgMq78KBz0B+KKH6JuXue4rcq7U6T3lzal4K9DxPL54TqxN
 aQFj76FVO6hMnqe0NIe294u0xuzNgqAMduh/wxh8YwWDND4gdBYszL43Adp9hB3k
 Tax9BA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0au5h1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 01 Jul 2026 06:29:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e663c29f2so37597085a.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 23:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782887369; x=1783492169; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qwxl5RCReUJATLJ+UxFybnZqLF/+nAtoHGo0MLbc6xE=;
 b=SRqo4rKfnLcqiycmyoBw+RXS0+zIxvzfcqsy371sx0a8Ag6rJ0J8JFELnTAUBgh8hn
 Im3cplzGwpNyrAXzdsfIm1OkkJvEcA2vzuq2Q4BqukQlFS6f7jiMy7CnR9DyDBrglSvs
 6knvtv6wL1wOUvR7+hO/j2400LRDzwz5/4v6BhemKSAynEQOgfAAArwHvqtSFERCer/v
 bvPgXztqHct9CGOVfAFjPxNje084uhdQUUBKHhCt+kqEW0H50wMNb2U5tT4u2WnXbC1E
 yo8Z2ZRNOCHZ4jsfhAfq8qS1av6dh7iB3AJj/tZ2zy3FLrN9v+yrcrFQioaK0RsZ2Tp/
 vs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782887369; x=1783492169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qwxl5RCReUJATLJ+UxFybnZqLF/+nAtoHGo0MLbc6xE=;
 b=K5lVfZoDMclYXGOZriwTYpj2z38LMwxFxWUgYRrt9B8Yq/U+Zt8Z7JSaKX8Q7qMwRg
 HdlFh3gLspxs+nT9FZqpB8QIb4rjPNYsyolsq4g4EfxpyqIBMNeP9HFhGS/zDWcjF7pB
 CfJwipungIaGbBiIFWAKoeVbWRo8o028Fd8ktEiAzpvmpak6r3NanbFtdiQan016ExSc
 +qbqlnMMbpkm22lMuvZ3Ml/+fmyykN7UaZo7b+41YWXL1DPjl9qeh/+n60y3SfdcGAcL
 bH/mzA1g5A5QtGwutpMcmxoI/tUKcLL5BqzIf2nD1nTWTcqMj3xRUGoP2cfYXWwSZC4x
 NWSw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Kd3zfaBv44V2xb0YpSaSRqIPzqL9qAaZbTDl4CG+6x1ql5/lQBqUJDGuhvc0AW82/iwVv9FYnkw==@nongnu.org
X-Gm-Message-State: AOJu0YxDIZ4EMfSFnHJkvpMhlBKpr7Fch/xdWKtJ5Km6Xeq3u6bRz4J4
 3IzCPCCfZtXYACQRES+znfb0pD3MvI+gW13Kvx3iGFCGfsCg/GqsoezwCqWMvBliAffKtMnGUHP
 Yr0WTkzRfp6Q0U2t26XiK6egWvwBmA3UQl5LjgBsZIM4DhVZiG9F1FYI=
X-Gm-Gg: AfdE7cl6xetssXgLByTppV6zPdN88SJw0eTxw4my5IrbxEhAGKeTcdFK68tnSTcbsMM
 CWbGvXDg6SmkYHhOlqxB/r/Wn4quLlLAAOcZB7na0KXboO2F7T4wy1R7BVs7xXyDYHLCQBee+Vt
 RLY3Hgd1o6icebc7IYV1VUEHuTsWaTND1mpemMCdMYkTpeZ9erifd1ANVDOF9T1TP6BJoFjFduj
 pG6JoYH34tg9vR1GwOBro+85PZM1LiqtiIv1vWQv1X0bV04bCZNo8qoSsuN1hYzE3+QeNVToPW0
 RliI0JXtkK12J7vDhnvD2wJubzeaSG7Fc/gF/QfZ+462fSpwgKVKQFQwFHDPCoC+KGsghBlc4dn
 BKNU6nCdlKhCstlyeYDgOklQF3lU4UyUCXuBRHT2BZjwy71HUmEkQMbemX0ywDA==
X-Received: by 2002:a05:620a:8086:b0:915:fc16:2ae0 with SMTP id
 af79cd13be357-92e697b4331mr626179685a.25.1782887368889; 
 Tue, 30 Jun 2026 23:29:28 -0700 (PDT)
X-Received: by 2002:a05:620a:8086:b0:915:fc16:2ae0 with SMTP id
 af79cd13be357-92e697b4331mr626176585a.25.1782887368451; 
 Tue, 30 Jun 2026 23:29:28 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47563d195a7sm13864748f8f.7.2026.06.30.23.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 23:29:27 -0700 (PDT)
Message-ID: <dc92984a-5c25-419e-b4ad-f5b79efbaeea@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 08:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] hw/i2c: parent slaves created with
 i2c_slave_create_simple
Content-Language: en-US
To: Emmanuel Blot <eblot@meta.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 Alexander Hansen <alexander.hansen@9elements.com>,
 William de Abreu Pinho <williampinho@meta.com>, qemu-arm@nongnu.org,
 Corey Minyard <cminyard@mvista.com>, Markus Armbruster <armbru@redhat.com>
References: <20260627-i2c-adc128d818-anacapa-v3-0-cfb94270a980@meta.com>
 <20260627-i2c-adc128d818-anacapa-v3-3-cfb94270a980@meta.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260627-i2c-adc128d818-anacapa-v3-3-cfb94270a980@meta.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44b3c9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VabnemYjAAAA:8 a=aQtDwRUkSMaHxJ_vRUgA:9 a=0nuxaduDBj0oWwsgcO0V3IwwSFQ=:19
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: YQ0QpS_JoYvTD4JC8R1RZ8bJpMYEE9p4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2NSBTYWx0ZWRfX9dvL0kOviTRI
 ZWdK/PGjMNlwYslFSZIgh+IcV8VUpd0dRZl7jAyh1EOmCA4/ShWUUHlawaOGpvagI3zLspo2OqJ
 AF2dg66jaMC0KJkfi4VGoy6lHLN7aBo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2NSBTYWx0ZWRfXyBNv3lM4+CqT
 D4epA2LBc5xDq8+upKMV2h3rfVO05vjNSar4HK98dDT6JEhS6AjG8uphiQk0zs24VAwR1oVGU3J
 gJ6YLccs9bXosQLTR2lS8TB/wpwbSMzG3Nm0EWFLVdhFcg+FCVpJOUx+GFjqvqxe3smHtGZ6UpO
 +Iqj3rYbN3dMfKxnOwinM1tlu70IkIPEfnWTedO5ZoW1uhky0MTy1FzD6pjV4KRxEptLdWtivRK
 8rThny9AyQazRDCN3SdgRoiPK+OdEh9EYFucYLSkxTA8Lq4wwVHtqgCcquZuKfJbvCaP6eDTQLm
 ZvDG7hrMVAH6HWBmLkdepjcObPR0LaR7e0aFySiKWFVhSSmngzeCVG6aJLsBooayWskH/+FNNYQ
 zuEFXXzqnHPn8+fbFyQLgyeqdw9VvgFMolG2ifOpUHmppwhZ42FzwSrudZmvDkYqYPeLljQ9l+z
 5EUN6SHQriCwYS4ybpg==
X-Proofpoint-GUID: YQ0QpS_JoYvTD4JC8R1RZ8bJpMYEE9p4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010065
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 28/6/26 02:45, Emmanuel Blot wrote:
> Slaves created with i2c_slave_create_simple() were left unparented and
> showed up under /machine/unattached with no stable QOM path. Add each
> slave as a QOM child of its bus, named after its I2C address, so it has
> a deterministic and addressable QOM path.

+Markus

Personally I never liked the idea of having buses being parents
of the devices attached to them, but maybe it is simpler this way.

> Signed-off-by: Emmanuel Blot <eblot@meta.com>
> ---
>   hw/i2c/core.c        | 3 +++
>   include/hw/i2c/i2c.h | 7 +++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index 54f6bdca88..0bbce45d48 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -382,6 +382,9 @@ I2CSlave *i2c_slave_create_simple(I2CBus *bus, const char *name, uint8_t addr)
>   {
>       I2CSlave *dev = i2c_slave_new(name, addr);
>   
> +    g_autofree char *childname = g_strdup_printf("0x%02x", addr);
> +    object_property_add_child(OBJECT(bus), childname, OBJECT(dev));
> +
>       i2c_slave_realize_and_unref(dev, bus, &error_abort);
>   
>       return dev;
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index dd5930f4b5..dc557bbf3f 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -166,13 +166,16 @@ bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
>   I2CSlave *i2c_slave_new(const char *name, uint8_t addr);
>   
>   /**
> - * Create and realize an I2C slave device on the heap.
> + * Create and realize an I2C slave device on the heap, add the device as a
> + * child of its parent bus.
> + *
>    * @bus: I2C bus to put it on
>    * @name: I2C slave device type name
>    * @addr: I2C address of the slave when put on a bus
>    *
>    * Create the device state structure, initialize it, put it on the
> - * specified @bus, and drop the reference to it (the device is realized).
> + * specified @bus, parent it, and drop the reference to it (the device is
> + * realized).
>    */
>   I2CSlave *i2c_slave_create_simple(I2CBus *bus, const char *name, uint8_t addr);
>   
> 


