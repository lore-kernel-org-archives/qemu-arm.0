Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3456668ejb;
        Tue, 6 Jun 2023 05:39:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7bmbZVkxCWLrnw7tTUv4Ff/d2fZEKRxFQsVKot5pV3ji3542qu5jneOFh89OPKsvGelTqV
X-Received: by 2002:a05:622a:14a:b0:3f5:473d:6a93 with SMTP id v10-20020a05622a014a00b003f5473d6a93mr1677930qtw.21.1686055191859;
        Tue, 06 Jun 2023 05:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686055191; cv=none;
        d=google.com; s=arc-20160816;
        b=yWTs6oqTQJjhzkGAeVXOY70h0Ljyt2bOhFQ+UO1cae6TSe75Qvnf4MN73buZj1xuWs
         noWcHHM6NgxUaPO1dlKy39weBRx50HOnLvz+P94AuFv6aH7T95AKNCLykfRDtxWCOn7v
         0e48v+JfHK2PYCOXN52mZGU+b2c1M7wgiKhPZAF/TqR8tkJEbFHJuw1urSFNsxD1a/Tc
         fQ/La+IUJPEZ7Kzshw2ab1C07bvxZzgBUT7KfZQxRBZ4jNYQFaYUPKXY8BOo25a/4if3
         ifTpCg4ljWANsBmGsDRvjXP8kVXQOSnQjS49AB0r+E9TE+dzbCqHQdUONsLWyDkOng+y
         r5nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=giH5+9PRQ02fyC6kYPCR2wTx5ypu7bqp8+hyoOIuEws=;
        b=b7P2nY42BqGUbVUXXtGzInscGW3z/2KD18F8nOhy1J9/HZXBwtOYQNL6ZVN8rPOLnJ
         6qYuSQ9Dn8EqTEsr1oFTvDhaH00q/qh1oZtJ0mzHr/pPnlz59Fbjp0W4mYs19t2FOAIc
         9Xp0VpcDW356rWMkDbMGxg6sntuKa+uNeuVVE4rijwOWHCvQUJ/4CigePJg1OHVvdkQL
         IAOPhv/eAg/erQxMRgW8nGoPRHQ8t/iGXYPWb3/guSoc3SxPiiJUmVhx7v1dKgYM18Hj
         VQCmm6Q6LictIm0deIAKhNDhSAbeqEAzLVSB4ipwALITxYu70icYSMe5yTQgr0zi/HyV
         WLKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TAKBOC9g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020ac87d52000000b003f6a97d1530si6102997qtb.316.2023.06.06.05.39.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 05:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TAKBOC9g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Vy6-0002xe-SP; Tue, 06 Jun 2023 08:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Vy3-0002rW-8l
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 08:39:19 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Vxx-0000jO-Cl
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 08:39:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3063433fa66so5297322f8f.3
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 05:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686055151; x=1688647151;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=giH5+9PRQ02fyC6kYPCR2wTx5ypu7bqp8+hyoOIuEws=;
 b=TAKBOC9g9XUHEu2HJUEZmf66BtKydRJ9q835WZ4h4dEePXuju0mrOPT6fP9VY5JRKo
 T1bUgNlMq+kte0eGxPXZz4LA+bpQAyui2Ap/G4/5XBvzklGgPXsPKT1XeQtjqZhyxyWD
 wy3iJm89zjvW2d2vkZMB1cgHjB4qHFK9rD62lB7EMtposLnwSj/zVf/pd2W3EYzEHM/l
 GLMBdlU/hA3KLIauGZW0hUovuIDe/HG8OXDRU5rPSLW+dM8bXJUI/8kLX70bplNZWpvU
 euK8MzaqrEPm7NHrpEw41C7S39LO8IVVmlqGM55+8qpFycNTUMzLIOsimqDtos8jGVBl
 OgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686055151; x=1688647151;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=giH5+9PRQ02fyC6kYPCR2wTx5ypu7bqp8+hyoOIuEws=;
 b=lDz2XyFWA/HLkWJeP6cD948knj6T+HcMDLhZLtGZz9+HMC7o6HUCWrKp9DnJZU38mp
 DcHvq2QtxykYm4sGXVqne6c5c4g8BYqZc2UXnFg9RyDug5XvpoSvOZ6vu6ZB3lbLL3i2
 FJRYhvA+BN2ioQHK40QCVzl8D3NlkilTUJ3BN5dnFyJUmgvv+pYKZaR6cgmQkPKh7elY
 ost3EkqEzOyw6SpiD5wDj2xVxFAtYRkIWY4EPFw3sYZSLpwRauxG2sIr2McfvmTHC87c
 Nu2cuR3rfzbHw1FL1gTxvab+y5OJQHbS3QiAut3kHeVAnkwLh8pbkPGz0sCmKIjP0NxM
 b+Ew==
X-Gm-Message-State: AC+VfDxlWnIV1rOOGG9tEGtJ6okicUt8wu/RrrZFjdr+gFOyFRsHjcv9
 eVmK7gYX9eOtUWd6+haX7hWPpw==
X-Received: by 2002:adf:f212:0:b0:30d:5cce:3bb5 with SMTP id
 p18-20020adff212000000b0030d5cce3bb5mr1751618wro.60.1686055151712; 
 Tue, 06 Jun 2023 05:39:11 -0700 (PDT)
Received: from [192.168.69.115] (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr.
 [176.184.50.104]) by smtp.gmail.com with ESMTPSA id
 p6-20020a056000018600b0030aefd11892sm12501132wrx.41.2023.06.06.05.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 05:39:11 -0700 (PDT)
Message-ID: <635fdcd8-23fe-c0db-c912-3aa0517dd4b7@linaro.org>
Date: Tue, 6 Jun 2023 14:39:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 2/2] hw/sd/allwinner-sdhost: Don't send non-boolean IRQ
 line levels
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, qemu-stable@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
References: <20230606104609.3692557-1-peter.maydell@linaro.org>
 <20230606104609.3692557-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230606104609.3692557-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: G7r/6kWCA0jJ

Hi Peter,

On 6/6/23 12:46, Peter Maydell wrote:
> QEMU allows qemu_irq lines to transfer arbitrary integers.  However
> the convention is that for a simple IRQ line the values transferred
> are always 0 and 1.  The A10 SD controller device instead assumes a
> 0-vs-non-0 convention, which happens to work with the interrupt
> controller it is wired up to.
> 
> Coerce the value to boolean to follow our usual convention.

I remember once wanting to convert qemu_set_irq() to take a boolean
argument but someone said using integer was more useful because ...?
I searched a bit but can't find that in my mail archives, maybe this
was on IRC. Any clue? (I find simpler to use a boolean rather than
having a convention of using integers restricted to [0, 1] range).

Regards,

Phil.
