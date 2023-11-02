Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp155939eja;
        Wed, 1 Nov 2023 22:15:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgSpsEgSAJNO21Zoken/SRzwUXsvtr204Xl+yagnry0JKWuHHnWrAEBkyN2j6nQ3/0vFIr
X-Received: by 2002:a05:620a:8518:b0:774:182a:9127 with SMTP id pe24-20020a05620a851800b00774182a9127mr16127314qkn.34.1698902138093;
        Wed, 01 Nov 2023 22:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698902138; cv=none;
        d=google.com; s=arc-20160816;
        b=SomD48LgfhjolW5OM93Oaq6mQAMMyRsfn+UZ7vL9M9o9PAoSZ4wdW/a9hqAiSk/RqO
         jZ0XCYhxEWBUpw8zMmFffj8lZnLHzhd7ChJcutvm1mpXzoHoD5HqQ1EUFkYhTzSZYADT
         FqyZvSjrikBiOJWq2uaVUksPmRs0JyW9/Asgp3OjQcGY3IPNBDCH/waNaeV1sRj2pt1e
         xi1y5LrYhh0bdG+iqi1I31bIMCEDsJ6B42euCXVUucOVsZwNotkQNrP3eyhho2kgxN7d
         j2yJj0/1m8zMzZV1TtVkg7jci7zLEIObXEi66JaN0p/fXOfMRk15enXc9QNr5LRFRA+5
         Oq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KI+62AnJc8l091vSM7kOpTFNVV5je0+Hwx7VYeOSrFc=;
        fh=q0jjEPenKFQ50+P8aorIeVEkTtjnNK+o3ieha+1Al3g=;
        b=YrfLnHNw2dox58hJLRLhDPD2EJaJXpheS8hXFfW9n0izDh5gkohfzgfwDwGvefIhof
         7sLv8rmfqdBFvOC8WuVWWPrH02LB15DRInZ8qRw7C6OLl88lIw7g6uu5cFMnQLkj1AAV
         eR/nodZvBzoJhfD9NWhR+qk1T1LJw9xzl7q9jY3bpSFgf+T7KKgv7Aj5yVedRalxNcVw
         4f1uEyiW15z5QgqV6fkg4SFDl0/65H+Ael6dMXhR9HzYlTVdm8GtSi/ckLY0kt5nKkF+
         Dj6+6cKoe3n8ufFkvnp1R/y2v/tIjcjX+EQT8tNEqZ8ZFPWFS6T4aYDeRS4HMsYRkQbo
         reAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Udc9QSxM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r22-20020a05620a299600b0077a0328dfeesi3962202qkp.587.2023.11.01.22.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 22:15:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Udc9QSxM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyQ33-0006pI-Gj; Thu, 02 Nov 2023 01:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyQ32-0006ot-Ac
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 01:15:16 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyQ30-0000vu-Ee
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 01:15:15 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1cc3542e328so4095495ad.1
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 22:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698902112; x=1699506912; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KI+62AnJc8l091vSM7kOpTFNVV5je0+Hwx7VYeOSrFc=;
 b=Udc9QSxMIzGaJ79UA+PlrJHVAM3EXhh2EK3FlawySd1WGL/4DWqoXfu+on1RJ4Wg93
 Li8b9JJaMDeftP9CbO48WiBzFYDpC88u/Tk42VVSnP9Eksl35or0VAvnh0HvNp7HXgJ3
 /cTCjofo8OXuvdoG4X84/gwZaPiy8x6f2MNMO4gwNqu5X0n+V7thAUBEChD5YhK7Cyvx
 j/LERo44bL+16gz/2bqYUqADxAJBcLEypusg0rdKp1hDPJ1sySZBK4DETn8a3cyLQdCA
 PBQRekVtn24rQYYFtKxS/jGXR43SC5Oeu84H74wXenEb/FoZmDDKqp78XcKjNZPIrCWR
 0CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698902112; x=1699506912;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KI+62AnJc8l091vSM7kOpTFNVV5je0+Hwx7VYeOSrFc=;
 b=gM3h8ciiBBI8Xj07PX7nK3ctS5VAc2WqUTQWJgnQuenBpskpGmm/S1VoJmZA/Pc7AK
 47x7akeuuPo+Efr+m1dl4TSSQ8wd1LVJH3dz8hkH/s87vmg2ntuAyTv3H5579NnxviGQ
 UkfpBpYXi1FoYkZj6Jf2HtvwE076eX6QrybuXR0oca82fHDImFpCIpjaYYCpq0yng6Ts
 1YLBYKl7XgT3Jbhro8AyJ9fMhKW8dBAzt2hkAj3fAIy2+zMw0+BvXq5ge0irlE4Ql/Ec
 CIerIa4gTt2ZRlME0MI9K2L9Vyvvox/nzd0ZO6rWgO8VfJh/eYsfsNC4KJHRY3vv9uiG
 IAuw==
X-Gm-Message-State: AOJu0Yy/9VWEvIadRWnLvHVAxofGs5xGPd7Msn/H69MJMm6pFY44DLi/
 HvhJyLOw9YrgLju2Q64TaExX4A==
X-Received: by 2002:a17:902:e54d:b0:1cc:4625:74ed with SMTP id
 n13-20020a170902e54d00b001cc462574edmr11840564plf.53.1698902112115; 
 Wed, 01 Nov 2023 22:15:12 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 ja11-20020a170902efcb00b001b8a00d4f7asm2126740plb.9.2023.11.01.22.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 22:15:11 -0700 (PDT)
Message-ID: <3e900797-cb55-4911-b1b3-5915baedf238@linaro.org>
Date: Wed, 1 Nov 2023 22:10:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 30/33] hw/arm/virt: Hide host CPU model for tcg
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-31-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231102002500.1750692-31-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: BYlBYxx0DoY/

On 11/1/23 17:24, Gavin Shan wrote:
> The 'host' CPU model isn't available until KVM or HVF is enabled.
> For example, the following error messages are seen when the guest
> is started with option '-cpu cortex-a8' on tcg.
> 
>    ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
>    assertion failed: (model != NULL)
>    Bail out! ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
>    assertion failed: (model != NULL)
>    Aborted (core dumped)
> 
> Hide 'host' CPU model until KVM or HVF is enabled. With this applied,
> the valid CPU models can be shown.
> 
>    qemu-system-aarch64: Invalid CPU type: cortex-a8
>    The valid types are: cortex-a7, cortex-a15, cortex-a35, \
>    cortex-a55, cortex-a72, cortex-a76, cortex-a710, a64fx, \
>    neoverse-n1, neoverse-v1, neoverse-n2, cortex-a53,      \
>    cortex-a57, max
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>

This patch has to be sorted before the previous patch, for exactly this assert.
With that,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
