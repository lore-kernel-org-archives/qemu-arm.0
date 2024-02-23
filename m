Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp387623ejf;
        Thu, 22 Feb 2024 22:23:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUP8V3r109D0mKBuwD8EgcFf+xvl3UIeG2dNp0d6y/WhH4jFDpqjhcvsZdlmi5zqCiTAcH4FADpyc9Xqqe5iVeqV2x/g7Ic
X-Google-Smtp-Source: AGHT+IGY4tEdhx4IsRqXZZJJWuZ3gUdTsgkkKPdxVAZwnFlRg9RMtkPQ8a/KiPw+NbXJKOVQsLPF
X-Received: by 2002:a0c:e3d0:0:b0:68f:8b75:575 with SMTP id e16-20020a0ce3d0000000b0068f8b750575mr1775336qvl.4.1708669422120;
        Thu, 22 Feb 2024 22:23:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708669422; cv=none;
        d=google.com; s=arc-20160816;
        b=qiP1/GZu0DjgNi+m7/CImGXz0pEqi7nEwuqE/5y004C4MTrNAa4ZyhpV1dTDAC1jXO
         FUbSfhB4wvuqbIAepI6iJnbzf9jOQWkT4oy+DS76J+mlH6E8haf2yz2AojfAvHuNsjDe
         hr4uZGgHXxp/gbQYZEQVaIxTHHiSjlklPcdpAREroSLPIz6ZAz80Q47qsLYLtesmUisG
         VKW7JsGlbQ8elpdMZz8iz0HnWkmPdwoZoTXscTr1K1ciABOEptb8jYYEBjzWLIcLbLtl
         i9rht2+fB1Fj61q7/bLDhQmjsKk8UqSxEpneyGis1Jl1KA06nwXKPIrBkFfIZRIgIzbi
         O07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kLeKvlMb3wGlcLhnVSk9eXKaCxlb27jnugpkFeDiUME=;
        fh=0SnBcLvGahYLVxrDlONmRXBan4uUd0NrGhfJnyv3iw4=;
        b=yZyo+W2NE2pyfuk0Hs3F9ZFmKZx2TaBaEvZ+afPMnDGWewrFqSxV93IybSJFlX+bmS
         6Ywq/+FSfO7Gna6ryX6ahNqmgneX4MUrTnAkZgtmj+ixeA0PGtptfnlG7MvZGcz46ycj
         WcXN1OOY7TsNP+7evcv+RSQlCrIIeGXeBDnCdLGl3ZyySsnLGfzslL6AKsagS4nU1jPX
         +2un0MvgM8hiGC1jTkof+mORY8PISibPLeEv95CaxPIryYKjW+9Atz1dgi4SJWIuAyTH
         3siUGQ+7Ng2Sf/94rIUJh6UgwJycCYETKccdET3cItbnagnH+ekBe1Z1cvYzKrlqc2UA
         rnSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rkoAuw4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd13-20020a056214400d00b0068f3f53d1a0si11941934qvb.605.2024.02.22.22.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 22:23:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rkoAuw4Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdOxx-0002XC-L4; Fri, 23 Feb 2024 01:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdOxw-0002Ws-13
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 01:23:24 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdOxu-0000Vl-I5
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 01:23:23 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33d6fe64a9bso360358f8f.0
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 22:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708669400; x=1709274200; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kLeKvlMb3wGlcLhnVSk9eXKaCxlb27jnugpkFeDiUME=;
 b=rkoAuw4YSmeXl9wh9NjNFV1lsG43VoBE59bOTExO4PGxpBK0EMNE9zG5/d1S1p0hDj
 kn32GQeWjnorc65iWYa8JIArKefK65q4UNTvDx5hWJQk7brrGBFXk3UIv1MAm9d1BEUE
 6z0gaaD1rddno5QN0N6O4KKrrgGUqooq5y4Rt+dwclPVUrEJ6VD6f/N7P6f5qHg6xtnF
 5eIgS2Jjh9t96017tpJg+Crh6qNTRaOFx8AH3X66Qmzszf5GQhXGZvpgoOz9ZS6tQEhN
 9uGNdn1Or5GYnLjtuwduTGeS8sXY93/3jm+bIQLMeXvRFoyW018YXQlzeD4neMTTNtYd
 FaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708669400; x=1709274200;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kLeKvlMb3wGlcLhnVSk9eXKaCxlb27jnugpkFeDiUME=;
 b=tLbViU+XYLu4ax7gHzTbX1uRssAfvFvx5iq7XgBisp4Sl4PXstH0F8wyPDUg7nUm15
 libqfGlHG/RDVEchlM01uZzeMS+Mg/lnvwHNZK1XnHjB6ErhtZW6NMyCgVjD3QvNZdXN
 +pNHMEqLMidZzH/EPmuqztfT3aRENG5wsJvDi81TDIm6dwAAyPbo6/CvdsP6eT7MkmkV
 o6gv+TvxH30JseQOuVq9BbCl2PfHTwywQH55dLjuXaaBBWRbNWwGg40heDdwDSre1rLB
 ups0Lrc46G/EmiGBTpwNoERWCBJ8eRwAbaz+/T49qzlGD149RI5pC/YAm1bxsH21hv8+
 7g1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmxqX3e4C9fOMQt/PTDbRQzk42LkVMrdpuCwTC9rZit4oIAgJOTpht/YuJkN2lAsfajVdqC5+vF0XkcyKBu/jAaX4w
X-Gm-Message-State: AOJu0YzHTiS5ymG8r786D37KoZV7V1d5P60x1K+uM42d2pDV0W09CdNd
 TXoFm1x45167W1cQy0BRMq/FSEWllY87UvvcRuORHiZi4TObcko6Ssg7hCYRHOs=
X-Received: by 2002:a5d:6288:0:b0:33d:9ee9:3c15 with SMTP id
 k8-20020a5d6288000000b0033d9ee93c15mr716595wru.1.1708669400276; 
 Thu, 22 Feb 2024 22:23:20 -0800 (PST)
Received: from [192.168.69.100] (sto95-h01-176-184-18-96.dsl.sta.abo.bbox.fr.
 [176.184.18.96]) by smtp.gmail.com with ESMTPSA id
 r1-20020a5d6941000000b0033d8aeb229csm1507775wrw.27.2024.02.22.22.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 22:23:19 -0800 (PST)
Message-ID: <fe96d71d-6abc-43f7-9b83-8bec93ab5512@linaro.org>
Date: Fri, 23 Feb 2024 07:23:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add support for I2C in BCM2835 boards
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Rayhan Faizel <rayhan.faizel@gmail.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, qemu-arm@nongnu.org
References: <20240220134120.2961059-1-rayhan.faizel@gmail.com>
 <CAFEAcA8GFFQ-L6zGcft9q8arJxuggraHYRhcAf4q+Oi+VMSP3Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8GFFQ-L6zGcft9q8arJxuggraHYRhcAf4q+Oi+VMSP3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: M0DyMbIkBdPx

Hi Peter,

On 22/2/24 18:54, Peter Maydell wrote:
> On Tue, 20 Feb 2024 at 13:42, Rayhan Faizel <rayhan.faizel@gmail.com> wrote:
>>
>> This patch series implements support for the Broadcom Serial Controller used
>> by BCM2835 based boards for I2C.


>> Rayhan Faizel (3):
>>    hw/i2c: Implement Broadcom Serial Controller (BSC)
>>    hw/arm: Connect BSC to BCM2835 board as I2C0, I2C1 and I2C2
>>    tests/qtest: Add testcase for BCM2835 BSC
> 
> 
> 
> Applied to target-arm.next, thanks.

Sorry I didn't notice earlier, the I2C[3] IRQ lines have
to be OR-ed using a TYPE_OR_IRQ object before reaching the
INTC. I'd rather a v4, but if you already posted your PR
this can get fixed on top.

Regards,

Phil.
