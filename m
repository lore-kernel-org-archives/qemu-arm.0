Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3454714ejb;
        Tue, 6 Jun 2023 05:36:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7MOF2mENI0wcZCW6aML+iwRYzsBoh13kHG6pCAktH6TE5V8ihABteac0Nq7og/w2zV4hOA
X-Received: by 2002:a05:620a:488e:b0:75d:54fc:47b1 with SMTP id ea14-20020a05620a488e00b0075d54fc47b1mr1860874qkb.54.1686054991588;
        Tue, 06 Jun 2023 05:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686054991; cv=none;
        d=google.com; s=arc-20160816;
        b=GyirnJ/Wf099+JZt/qO6xdeL9so1FaMW1o2bHVVXcFv9mgm1SVIpMEA33Y6qd+jKAH
         TSZjIRY2AHcI8YuboslESviKifnjHvvGwfo536ttNiiy5dy/4Y5Jj8C9fYS+Zl/76vkV
         T1xUq8NI+jojeTm+BMar1TVS5OUg3it4VqSkSiyrf0NpGeB6mYP+0pXyNSJGgmfm6MQC
         FHOpx4KLUG8ma6w7MXxxJYn0fzpjdhI58zhdDp6l0bprUwmE3Qr9yEhMHp/CchUx7joi
         pEhMDSOL1WEihy+R9xxYEcitLNYe6GhIhS3YL3gHKqswkFhxRwUwVFsJszT/JlDKZ00U
         ZjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5ZvKyeHZZLdLTfykcfXQVTPgkjAUyoOfF+Gj/tdX05U=;
        b=tIFddRHN3okblvhOqE28YjGrcfAkWF64MOQ7pD2NDLmQGFZPYb8N3GlQSj1BMvckeE
         4ECuhtOiwPE8ItUy0/IKJVa9jh9xi+7TqIi5FeaRNbiRKD/q7donVy89d/ML6Tt2xJin
         xZ011XtuagS/5ckcQrBdnUeHDmHJ0frc2esofowGtmh0jVOjJFhXYJPwwvQ7OTPewAz/
         Yry7gxItzHBk5x+AORs9whuhSi+4AHgE0imANc/R/qwd/eLKrrbcx/rGuqvJidRvbR4Y
         SEF/qo2lVnqMVPHbnRwshhF0lloAQbA8iGdQj6Ktg1Kej8lkWLVKCz3Q5l5rtaDrqB8W
         PKVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hbPSzluT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22-20020ae9c016000000b007592943ab11si5966560qkk.98.2023.06.06.05.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 05:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hbPSzluT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Vv2-00018w-MN; Tue, 06 Jun 2023 08:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Vv0-00018C-N1
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 08:36:10 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Vux-0000Dm-Q0
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 08:36:10 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30c4c1fd511so4954853f8f.1
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 05:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686054964; x=1688646964;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5ZvKyeHZZLdLTfykcfXQVTPgkjAUyoOfF+Gj/tdX05U=;
 b=hbPSzluT9Q7syRiwqGtyteKl+cOqAyAcjor4veODb/AkWv0LNg7oPqG0q3h2qXRw2J
 CjIGsHzd5s1FiZ6dA9fC0HDHsnFlEVlXPhafXEqND2s+TWJ5A7U+FVaTp9UL1RJ99qLP
 QqJpphkcEshzopXypej1rX9q/mr+WANTPedPvDLNCRD7Nn/N0EfQplBHmvnfSVFk4lX8
 Qa/gKqmq53NHTGTjwljHnNmqkQLnErHOY0Gxpvh9NA39iPXOYac0H3FJg45DH71EMayi
 wVxQZIXaqEErbR4I0IwIXeN0yxIQWMBW95PqRj1PFw4FFrzxfEDwDUPzLeocPm4Z9qRE
 q/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686054964; x=1688646964;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ZvKyeHZZLdLTfykcfXQVTPgkjAUyoOfF+Gj/tdX05U=;
 b=W1+qCrj/e7u39HpwvJ4byohRmzqqbZfy2DPSJGJB5eoKrey3CLEp7SfRuX87NQvP3P
 MK6Fqkw8aJ2JT3HbdoYmJc3GKHt2T9sQKt6AsO4SgN9d561J05XXH8ivzI3eLVHPY/Ow
 TV8HgIWbijEmLioLh7vY4lXWr3YAo/NvhIbrXcXi/fNEJsZPLi7djzyIcS0xh/9raC6O
 01HQQUQ2CuhTyoN3rhZVorMza/vS9wlQCoj15HHZwunP3bLYacEd/f7QxHsUOY2/LPGJ
 djMctYCCXwKW1983H/UeOmiigaCvwlCevVoVKKLAdH0H0TxWQMjA3o9J2BtnhpaxcRA4
 Zkew==
X-Gm-Message-State: AC+VfDwjoNznkRDluvUanNqJinfQ+E3V5OZnfW4qNEw4TW7WdVuHvuDt
 o3ZJ/CHqHEsIeky7PXMBdbbXzg==
X-Received: by 2002:adf:dd06:0:b0:306:3ded:2bf1 with SMTP id
 a6-20020adfdd06000000b003063ded2bf1mr2223193wrm.60.1686054964273; 
 Tue, 06 Jun 2023 05:36:04 -0700 (PDT)
Received: from [192.168.69.115] (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr.
 [176.184.50.104]) by smtp.gmail.com with ESMTPSA id
 o1-20020a5d6841000000b003079c402762sm12554168wrw.19.2023.06.06.05.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 05:36:03 -0700 (PDT)
Message-ID: <ed910356-c68c-a359-2896-abf08f8326e2@linaro.org>
Date: Tue, 6 Jun 2023 14:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 0/2] allwinner-a10: Fix interrupt controller regression
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, qemu-stable@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20230606104609.3692557-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230606104609.3692557-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: f0v/xDincYka

On 6/6/23 12:46, Peter Maydell wrote:

> Peter Maydell (2):
>    hw/intc/allwinner-a10-pic: Handle IRQ levels other than 0 or 1
>    hw/sd/allwinner-sdhost: Don't send non-boolean IRQ line levels

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

