Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp286898ejt;
        Tue, 20 Jun 2023 07:03:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7UPuY/5i2dWK/OaWY+tTKSm8cyaPQVUjSnXvJ4paIukQrZqqCAkzKXhTEjQ33XKFZde2Ib
X-Received: by 2002:a05:620a:2988:b0:75e:bc25:325a with SMTP id r8-20020a05620a298800b0075ebc25325amr15209133qkp.17.1687269831287;
        Tue, 20 Jun 2023 07:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687269831; cv=none;
        d=google.com; s=arc-20160816;
        b=bGqpAO3EW/Z7Snq1jVo91poEkoMAXbBxaxOgRDU+kvMMEMRNMIi88dUN0Z4y2z29IE
         AukQAiYmyfzaiQ0MeuMIthvMZqhueHr+OhYawRMHsoWbFCMdimIcsRGZ3alC6xQLM9WB
         ppn6a50ZcX2Rw4Ty2eNl0k4V4oZycBerVPNxNtSvKAnL3ZFOxGQ3ieJ3DnmYZtoLQcW0
         XgS0MD6GtOKPuFa4Qf+8LiJY0PVj8i6585qxJHufHWhkhiXiFilmyl8Yf/F5ST+2v/H5
         +P2Itmm1wYx5AdU1A0YnMeuWVApAbSa19jdRlMZCv5qe71X+TQmYKdpUlt365j2DEQBd
         IL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pfUNYCBnnQD/am7YvVSIXPfXCApqXHfqQmO85bOs4Vk=;
        b=OUdQ/YJmYLb3rpUjNTbW3l/ceuQTtrayzDA7THiouvpj9wW/2jujt4ry9bJ6oy2tiR
         N8lVIQLLwpZhA8IPcIS+d2Hr3laJ1rKZOuysckqZF3QNVEZmnWu/XbBZAvB0E/q5Gsvc
         BvmdW8lJpZBCCf/FOHmGnvUk8g7OZygTeqC81kq77hcBfnYMaLeVReX925SNbKBJAIWN
         7AJzk8XcRK2lp6f3lWzRJO3OGdsJeNNC3CtrH5EKQppdlCngEzjZzOA5uGssrYj6BiAR
         UgAYuEzF4xdsQ7yxraxszw7ppmPyWeUYBpzM3sFpsXla9hYAFc3UU9WAb3/LJdlYRJDS
         1BLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=flxQ51hg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020a37c201000000b0075c8054b528si824618qkm.149.2023.06.20.07.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 07:03:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=flxQ51hg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBbxE-0002h2-02; Tue, 20 Jun 2023 10:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBbxC-0002gl-AR
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 10:03:30 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBbxA-0006Pw-IW
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 10:03:29 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-988a2715b8cso433309666b.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 07:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687269807; x=1689861807;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pfUNYCBnnQD/am7YvVSIXPfXCApqXHfqQmO85bOs4Vk=;
 b=flxQ51hg/gNnrRM+3RuJyVSW4iiRWqT18UHZUJ3czTUiL/Yw6uEAQ68d6N84wvqUFZ
 ZgF30PgTTN1zfvsnyd01jF2bj0AG7VEYaaLZZzhJGK7OCK29R/gDcR1/XL/pZJkJNlE+
 L/2WDLVVbbuCM3XS3M5n3S/sQXPRQtGqM1Wu4BUnT01y6GAZe1cT3ejXW4H3KxJcOSGc
 bZM8KbfzFWCPJL67BdBpOy1XjH6ormd4CV8tzVj8cr1lbwvRjoqQCf/7H4f9+UZ8CWm1
 /1s5JVa4HIaaEAv2/RxM9P6javvBR1TqXlflKYhE/KzRSDjfG0B1A77KfzZI7pEbYGGN
 vBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687269807; x=1689861807;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pfUNYCBnnQD/am7YvVSIXPfXCApqXHfqQmO85bOs4Vk=;
 b=bwYdT5pUl6emx2Vrrm0VlzE1q98GagMpdEQIcLV+DjGBkGuFnXcmX5zJWNSqUXUUTs
 SJwrfyrJc8qigqsnS1+vnRg5Dk5rfeTTeV8rUb25I9Ehem95ymV/XZdnDaMTYytRhanf
 fvdIXHWkUW7k+jtA5hAKJaCIFSsMs6pBjgCLM6UUZOPFkwCmHZPRGsX755R9Q0CHph52
 NReKAPZbJ1vWjteoarfx2unXEfsXJQxFJPh9fhXCLVRdsKVvS08NdOyiQxTM2ywjh/G8
 0psVzdZAKEF+DVFQXi0SKApKoyF2HPpcY52YDsHRrjr87C2OfZaJn0WFlfc+/d2H/bQ/
 I1dg==
X-Gm-Message-State: AC+VfDxlVnXUoDhorRsM25W6s5ArWydquFyIY6jbKmpS8qQlzHiV+tEa
 NllVUXddLip7D6z8+vrI5KbTnQ==
X-Received: by 2002:a17:907:1607:b0:982:b253:dc20 with SMTP id
 hb7-20020a170907160700b00982b253dc20mr11308475ejc.27.1687269806799; 
 Tue, 20 Jun 2023 07:03:26 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a170906068900b00988ca8b175dsm1474635ejb.119.2023.06.20.07.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 07:03:26 -0700 (PDT)
Message-ID: <d97d14f9-692f-8701-5637-d4566ea0075f@linaro.org>
Date: Tue, 20 Jun 2023 16:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 20/20] target/arm: Add cpu properties for enabling
 FEAT_RME
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230620124418.805717-1-richard.henderson@linaro.org>
 <20230620124418.805717-21-richard.henderson@linaro.org>
 <CAFEAcA-MpN2kM3c4F=ihSEgetSQJVd0T9-BTUakTu=CAc+4HTQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-MpN2kM3c4F=ihSEgetSQJVd0T9-BTUakTu=CAc+4HTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: qhad/GbavnuM

On 6/20/23 15:52, Peter Maydell wrote:
> On Tue, 20 Jun 2023 at 13:46, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Add an x-rme cpu property to enable FEAT_RME.
>> Add an x-l0gptsz property to set GPCCR_EL3.L0GPTSZ,
>> for testing various possible configurations.
> 
> Looks OK to me, but I think we should document these
> (including that they're experimental and future syntax for
> enabling RME will change) in the "TCG VCPU Features"
> section of docs/system/arm/cpu-features.rst.
> 
> We could mention in the commit message here why we're
> making them experimental x- properties too.

Yes, of course.

r~

