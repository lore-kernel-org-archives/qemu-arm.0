Received: by 10.25.21.96 with SMTP id l93csp679668lfi;
        Thu, 23 Jun 2016 12:18:46 -0700 (PDT)
X-Received: by 10.200.56.230 with SMTP id g35mr253859qtc.4.1466709526367;
        Thu, 23 Jun 2016 12:18:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 124si1624959qkk.34.2016.06.23.12.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 12:18:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGA9F-0000Wa-QW
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 15:18:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bGA9B-0000UQ-Rf
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 15:18:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bGA95-00041J-OE
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 15:18:40 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34759)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bGA95-00041F-Iy; Thu, 23 Jun 2016 15:18:35 -0400
Received: by mail-qk0-x243.google.com with SMTP id j2so17464700qkf.1;
	Thu, 23 Jun 2016 12:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=i75wOoQ2ETMtWMSxngBK/wH9nqG0qghSVh87STqvHD4=;
	b=zQuoieyD0ApbSV2xVlBaGR+u4GDYLc1LiCM/JwgrsuRa0StMyi12bAKDj/SCvYCn0x
	IR6O0w50g0+HofvpHmfkanaE4/E+6TnjxLlomhgsuNViUUNisEljSuqtSvyCpd9CgS1k
	L3hhsiN2c42taxU189Zt3VEsH2hNj+faQ8PrMicqxXyu7v2HGW8KG1tsjZR49R6jk/nn
	4jS6smJMmke5liz+TgMmniXwqkaiAkLXBLMLHBEqczATmvqvo4gm18fnJispWpUKzM0V
	Q8PhGoV6vCaKzi5eLkq69Yuk+Jd+s3sqQbAgZuV9pm06Fq7KtQMRw7owAwhjKFSzuWRz
	OE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=i75wOoQ2ETMtWMSxngBK/wH9nqG0qghSVh87STqvHD4=;
	b=awDvLmA2jQAmbgYfzn534GRmY8zzzO57IqLXxImocFM7lkext0xzrNcfeIv6fuXbzA
	VwiXNnHrna/MawmK8DGE2LxlTglpji94uk9UWA1lOiDtO2GIOtYFTfhDqlohBvDMSOV/
	cNtaKavcaEtUvIotEjxCjdxzFqbomoooPAdTIaA9pMPgEab/F7hXw5HmhE1yKvGOb6w5
	Un2BXspq8hIjR1hj32JHYhftxHN3JIAoKh3KUAJV+TNcbbF2Q2vpV/oNwS/xuxJIEF3u
	YDg5xOQ+NCqSugMmGsWEitPa9cB0zeCmk24pXV8JRI6u6OBZurZRvMdwzzzYY+7wRgZG
	Cs7Q==
X-Gm-Message-State: ALyK8tLhQsGRSOrVu8mSxtmjBzVdR25+YnF8ja0tU06EC2+jFmqSsx2pQPQeC1JnBiXn0g==
X-Received: by 10.55.147.133 with SMTP id v127mr179101qkd.109.1466709515218;
	Thu, 23 Jun 2016 12:18:35 -0700 (PDT)
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net.
	[71.37.54.227]) by smtp.googlemail.com with ESMTPSA id
	z206sm628366qka.1.2016.06.23.12.18.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 12:18:34 -0700 (PDT)
To: Sergey Sorokin <afarallax@yandex.ru>, qemu-devel@nongnu.org
References: <1466705806-679898-1-git-send-email-afarallax@yandex.ru>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <2e0293e6-987c-43ec-e9c1-3a63aa593fb4@twiddle.net>
Date: Thu, 23 Jun 2016 12:18:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1466705806-679898-1-git-send-email-afarallax@yandex.ru>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH v4] Improve the alignment check infrastructure
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
Cc: Claudio Fontana <claudio.fontana@huawei.com>,
	Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org,
	Vassili Karpov <av1474@comtv.ru>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k1pql7Ks7OBV

On 06/23/2016 11:16 AM, Sergey Sorokin wrote:
> +#if defined(CONFIG_SOFTMMU)
> +/**
> + * get_alignment_bits
> + * @memop: TCGMemOp value
> + *
> + * Extract the alignment size from the memop.
> + *
> + * Returns: 0 in case of byte access (which is always aligned);
> + *          positive value - number of alignment bits;
> + *          negative value if unaligned access enabled
> + *          and this is not a byte access.
> + */
> +static inline int get_alignment_bits(TCGMemOp memop)
> +{
> +    int a = memop & MO_AMASK;
> +    int s = memop & MO_SIZE;
> +
> +    if (a == MO_UNALN) {
> +        /* Negative value if unaligned access enabled,
> +         * or zero value in case of byte access.
> +         */
> +        return -s;
> +    } else if (a == MO_ALIGN) {
> +        tcg_debug_assert((TLB_FLAGS_MASK & ((1 << s) - 1)) == 0);
> +        /* A natural alignment: return a number of access size bits */
> +        return s;
> +    } else {
> +        /* Specific alignment size. It must be equal or greater
> +         * than the access size.
> +         */
> +        a >>= MO_ASHIFT;
> +        tcg_debug_assert(a >= s);
> +        tcg_debug_assert((TLB_FLAGS_MASK & ((1 << a) - 1)) == 0);
> +        return a;
> +    }
> +}
> +#endif  /* CONFIG_SOFTMMU */

While it's true that usermode doesn't support alignment checks at all (either 
direction, I'd prefer to leave the function available and isolate the one 
assert that caused your build problem.  E.g.

static inline int get_alignment_bits(TCGMemOp memop)
{
     int a = memop & MO_AMASK;
     int s = memop & MO_SIZE;
     int r;

     ...
     } else if (a == MO_ALIGN) {
         /* A natural alignment: return a number of access size bits */
         r = s;
     } else {
         /* Specific alignment size. It must be equal or greater
          * than the access size.
          */
         r = a >> MO_ASHIFT;
         tcg_debug_assert(r >= s);
     }
#ifdef CONFIG_SOFTMMU
     /* Make sure requested alignment doesn't overlap TLB flags.  */
     tcg_debug_assert((TLB_FLAGS_MASK & ((1 << r) - 1)) == 0);
#endif
     return r;
}


I'll give this a test with some target-sparc changes where this will be useful.


r~
