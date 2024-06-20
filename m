Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1582500dlb;
        Thu, 20 Jun 2024 05:35:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZZAetIvxwAJQau7VLj2egBUTFUMMF8lNzvT8MVwqBB1XkHqbHnm9VpVEQ6qnvcSXSLb7HwT6IVQrPeQjrfRJmvYBMn3JG
X-Google-Smtp-Source: AGHT+IEn5IWgaVNUGlg5vsiE7OkiBySKQgIM6/I/3pjmma48qcbUApItFtBkTu2t9cVLztbTShBo
X-Received: by 2002:ac8:574f:0:b0:440:e39:372a with SMTP id d75a77b69052e-4449b8cc771mr138127691cf.3.1718886941895;
        Thu, 20 Jun 2024 05:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718886941; cv=none;
        d=google.com; s=arc-20160816;
        b=WBxPEZwhXbmO5QtQh478/FgKapAvF/5/qhmtBf1bHstlRvniAASkV5+ITObdzXHJ/7
         74mGLNKNpVYI9yNk72qZtbm6PdosthlMKpm8TlZMAs89xMHjyBw8nkdSfAxtE4IMpEjn
         aUq9BQm/L6kkmN/FdHJr9yFro93R1Zzu4d+Z2UwhPEVt/wNz2pcydehNKrKdTkkus2v7
         d9DAA+kmElT5xt1NL2UXAGjEhAgmdxVRFdC+xNB8g9oRfKsZwV5UvW5IM4F2zafgJGX6
         UBfg06dK8Nr+HGmUJtAV5C5WEqdVhXETB9uv0LmZULA+OG1lZF/uNV6s3OKsMBM5/aHd
         iEyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=iTf8RmyhzP+/t6BU4yJ3kpeKkbFGuVjawjAwXjHpzjg=;
        fh=mQC2nwEoSXvisbWtefPuVHLoQ1VP3FUdKyLtGSMxLc4=;
        b=bdRxPlvPgAbSYOi/Zen2sCEJwAp0vtLqrfNcGaDIizNJR9+YvwxoqKr2F6fnJR4esN
         MMGurIouOcnUKnuXJPV0gHLW7U4RjdgApL6NuY5xDL1VEMhXC0kfbyNIU3i2EjtnLd+k
         36KUIpiSLQNaqM7uZxyrJ8fK5W5Jo5iT4Q986+mPwf8UTcEjOHOyQvD6o0YtcbocmHSd
         t7yQN4AyARsUWWi30Oq6ZtegrWGtP+OZ06rUDC9g2bCd5+06WwjwKZCuuBwK2iy9vZSb
         wAxhLPBFoHe5zrOc5NoGBj6j+m7/PY9rDdeTz/H1bvXX5AzBsAADEWqW0QDaPD2eI4j2
         8oDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444ab69555csi35408391cf.781.2024.06.20.05.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 05:35:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sKH0Z-00016i-JC; Thu, 20 Jun 2024 08:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=7F4n=NW=kaod.org=clg@ozlabs.org>)
 id 1sKH0W-00013G-KC; Thu, 20 Jun 2024 08:35:16 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=7F4n=NW=kaod.org=clg@ozlabs.org>)
 id 1sKH0U-0001WL-Jy; Thu, 20 Jun 2024 08:35:16 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4W4g1T5QPsz4wcg;
 Thu, 20 Jun 2024 22:35:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4W4g1Q6c2Qz4w2F;
 Thu, 20 Jun 2024 22:35:06 +1000 (AEST)
Message-ID: <5d617ff8-dc3d-4126-8466-ed1596d3389d@kaod.org>
Date: Thu, 20 Jun 2024 14:35:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/gpio/aspeed: Add reg_table_size to AspeedGPIOClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zheyu Ma <zheyuma97@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240619183638.4073070-1-zheyuma97@gmail.com>
 <f446fdbf-90f2-4d07-8f1f-06b697ec8c01@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <f446fdbf-90f2-4d07-8f1f-06b697ec8c01@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=7F4n=NW=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: cJ5fteD0jQ8/


>> @@ -75,6 +75,7 @@ struct AspeedGPIOClass {
>>       uint32_t nr_gpio_pins;
>>       uint32_t nr_gpio_sets;
>>       const AspeedGPIOReg *reg_table;
>> +    uint32_t reg_table_size;
>>   };
> 
> - "reg_table_size" is a number of registers, using s/size/count/ might
>    be clearer.
> - No point in specifying 32-bit, "unsigned" is sufficient.
> 
> (Cédric, if you agree, you might update your tree).
> 
> Unrelated to this patch but figured out while reviewing, in
> aspeed_gpio_read/write 'idx' is
> - pointlessly assigned to -1
> - of type 'uint64_t', also pointless, 'unsigned' is clearer.

Zheyu, could you please send a v4 ? Thanks,

C.

