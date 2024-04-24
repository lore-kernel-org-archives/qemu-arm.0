Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp966493ejb;
        Wed, 24 Apr 2024 16:15:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlQC/Drt9aYa3Yv4T/mbR0Oyp1VfHBUvPzZkeEiNpq+MXvGEiKay4T0+K89vwAY4if39QgQJ0Ojz9sHa7m8wZuceEt3gZS
X-Google-Smtp-Source: AGHT+IGutGiIlQVUtSbd8MotWNNizkDbjHrpsFrXzZUentyHKmoDWnD23BZppRUptQRh/7WYCW59
X-Received: by 2002:a05:6122:3115:b0:4d8:7443:bca7 with SMTP id cg21-20020a056122311500b004d87443bca7mr4531657vkb.6.1714000549183;
        Wed, 24 Apr 2024 16:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714000549; cv=none;
        d=google.com; s=arc-20160816;
        b=iSlWurtzTnc0S1sNdw2sNNlxGub5X74vB5BurhBM2/7e6iThDX27PbIDktIZhIoFq+
         +1J4vq2WbG3o0m4uJxXSOStt+YvC9iBFZtzGbqmG9HrqKOJLQRlrKWiAjKYEc4YfsMWL
         2MO97FaK5s6F+XN3hpztvtrjJQAvLIGNoidogq4OiOIQPJ6AhLAzGs2o/zzedp2R5vDV
         FaeF8NTbOI5/IrhknnK+aMMjbiEiWn+4zK6Kq1awpZhnDgbqnpr+r/is4nyPL8GArosH
         yiOT9a0/6ZXsbcvhmHw32kMer8hW2RGjTJBULqDqwMNqbzB81osrgzf2my0hWLPrubnH
         Vvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=FpaiVEBlxxoYrCmqblEKTbgi1ilpb6EDQX934DCEWkM=;
        fh=D23znDdzyoHm+oQbDm0dA5GMXZR3Oa/6wwKCO2vjynw=;
        b=DJMCZ63V0YPATq0Wuk91Ms90DGWA8CmVp5s/cifN0wVdP6Cl60JyaIM+RSVeOmn9V0
         Ohqo79ocpQFy4y+p3d9BXSJOwiX66zBiN6JmkZnQEhRSoqJqRYSQVHWl1r5EOwemuDVx
         7UHZ1JE0VMNCM0l/u2MqfCxCeOxZtwquuRl/38Z77ngPvsa+PN+uTIo+IaK9zw6DrkyM
         ZSD44FY5yPT3oSFHp/vchwOC0nvPd6tLfOh72mymrXVh7nIplSgxPRPrnZQX/MAynoNc
         l5BiqGdNF8o26D++ZrvNQyJ0S4CXyXJombeqWBtix01Fp/X1tK3Y88V6v+xMKxsHlRBj
         ZXtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CWMST7g3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020a05620a21c700b0078d55a0358csi14854187qka.262.2024.04.24.16.15.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2024 16:15:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CWMST7g3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzlps-0000Pu-Uj; Wed, 24 Apr 2024 19:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rzlpe-0000Nu-Af
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 19:15:20 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rzlpc-0006x9-2E
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 19:15:18 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-5d4d15ec7c5so325803a12.1
 for <qemu-arm@nongnu.org>; Wed, 24 Apr 2024 16:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714000512; x=1714605312; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FpaiVEBlxxoYrCmqblEKTbgi1ilpb6EDQX934DCEWkM=;
 b=CWMST7g3lxYOdzVM18ggVLCwtjPNXTM0UKuHbfWX2QNUWdrhlpSv8gi90k42LsEGw+
 sSWpwXC/pWKzV95tmLPvtebMh5iUtesyCLuPQSBfxyrYD9Aqc158+6XPG3B0aPoB6ECC
 l3v7x7S6wBXliq60wKnf0bxO3Ft+M0szTMJsRyzgL8ad+fehY5o5JOsUXTpgx4CxegyO
 uJZ+2fHsE842ng2EjyXi8wE2tvkqF8AaVKKKs8K57n76+bY2tnFyzNkkT+R5F21+a5K0
 IA2KlKqXtYwIBUI6KXnhUiTZHZR7r0BDjQP2bJaxcqqxHl1bviXsVQkA0uQZNF49hVE1
 AnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714000512; x=1714605312;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FpaiVEBlxxoYrCmqblEKTbgi1ilpb6EDQX934DCEWkM=;
 b=mc/RZa5DcjctIu8tsced4exgrHOrmlVSM799l6Zs/UEnp7bGgTJAvuR5BDFt+viymL
 4dc4tJzry4QvxYj0pshQOjvMeO8h1wFACy98Y6Csm7JWAbBf7dr7b+O5p1XowWEC/peP
 iiW5e70/99lKi7bU91Al65Qtt3tzp1zhxlKXrPB6L6wJBOOHwDNPuqyEykz7Seubghip
 pVk+pNyNPjAY1GQEvpg/qVU8W5nNL6wwInYJFbAzd4ni+/6dHOy1Fw2mNoKq0ckJ8VY1
 B7kzEoX6OmwaExmJoh1Q3XpNqmIzZ93BAUFuWznbuwufuJZjbKW70VFEKiw2Xm4q2mtC
 rIbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULEyMwMlMScIbpNLDYhNCzWwbMQ7lQOSX6mxx3g1ZEug/iMiJ6hV1fV6p7cM8JSNPA7mzw7azkQf08NJd230Wq4Y8b
X-Gm-Message-State: AOJu0YxeazRkmpkt0/sCp317Zl7bUWZU3X6Rz96f7wIJu4vf6Nd+xFti
 rVzsQhEDRymcBXscmIAOcY4TZR10OH3epUjd/kZMoSkUOdHrosVWbRpwgE2MBYcDOoZsiC6hGy0
 3
X-Received: by 2002:a05:6a20:7f8f:b0:1a7:5425:3044 with SMTP id
 d15-20020a056a207f8f00b001a754253044mr5235697pzj.62.1714000512322; 
 Wed, 24 Apr 2024 16:15:12 -0700 (PDT)
Received: from [192.168.91.227] ([156.19.246.23])
 by smtp.gmail.com with ESMTPSA id
 ka4-20020a056a00938400b006f3aa6a03dbsm1439338pfb.127.2024.04.24.16.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 16:15:11 -0700 (PDT)
Message-ID: <9ce3f50f-2074-48ba-8827-3e5276cc88b4@linaro.org>
Date: Wed, 24 Apr 2024 16:15:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] target/arm: Update emulation.rst, add some easy
 features
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240418152004.2106516-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418152004.2106516-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 9ZIoG3qlXnqU

On 4/18/24 08:19, Peter Maydell wrote:
> Peter Maydell (5):
>    docs/system/arm/emulation.rst: Add missing implemented features
>    target/arm: Enable FEAT_CSV2_3 for -cpu max
>    target/arm: Enable FEAT_ETS2 for -cpu max
>    target/arm: Implement ID_AA64MMFR3_EL1
>    target/arm: Enable FEAT_Spec_FPACC for -cpu max

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
