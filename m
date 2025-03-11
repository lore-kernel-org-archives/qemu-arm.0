Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1782512njc;
        Tue, 11 Mar 2025 04:43:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5sLAFOeiVgtuCcD8fKiPKu73iKk65m9dUyksnE0846mNgqfeJtYFPp9HbGO3ejjtg1SH+Ngj01tsoOw==@linaro.org
X-Google-Smtp-Source: AGHT+IGGjEbWHhnUI8QFJEjhJDjfGUmnrOFxSgmEQgJeYsrbBQHp2W7IQ05K+WSpclpR9Fylg7hR
X-Received: by 2002:a05:622a:48d:b0:474:e04d:5977 with SMTP id d75a77b69052e-47618aec37fmr262971341cf.43.1741693433791;
        Tue, 11 Mar 2025 04:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741693433; cv=none;
        d=google.com; s=arc-20240605;
        b=S4N2+10PIBqubJbWLFOFTq76uoYfscjZiGiIFRoCqZc8Y6LuD/LuMemjj86AfIT44W
         QsvN/eXXxGVQb+JQloh1QOyHQ81QEl14jU1vFfxPKoavTHain3iRpbVgDPuxr+lE1Fzk
         2NzMRQvgmwATlSvAm2tMIMgjeYW4k6JzxX3LBmUaFrblHo0OZFe0kPvBW8o99c+8e/aN
         R7yKOSs6Bo2VR/LaVWBYcoD+pc10N96JyrdBfDOYQaxcGpeVP9Lf4solquhtZEBt2dhs
         d+/M0r6k3+q/35/rGjM9eYPVPgsJcpWHmNkrzfABU/M5zOlpPvWBqXXpHMlDCk77KySL
         y4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=thg6OV1i38O3zO5fYsgxFU2kAPWUsE6O8clbjSSChsE=;
        fh=G/qZAqlYoNB1G0rwepzrU1QxAHozkThfw84Ce8TjkxU=;
        b=PyEqoyjnaDm9NOAPSSwxSuyxJ7wiJ7SkAYQdANFyXaDNHNSSl32gg/o6rJA1CTDGHX
         YLGzPojoW2gJBE4mzeufLI2M0e1pQvJgEfl/2gqNbrVXfwA7MTv2FCFQnpuhgBFpAQ4I
         DUmCzcuDZ+6vOTcvE7UsbwU9CwFaqz9r5hXH0++3A+c5aI7VkbSa33JDmWvwfxomyNn1
         5qt0B7Xc/9rzq+s34tOOblZWTRw1Jw0hq9p26gHi64esvX41CQfxYx9e+uy0W8BcPfRW
         e809d0RyTEAqAlJWjBnPmczto4aX+sK5EV7gdc1Bu789hp1jiivdZO0U3k9rV4lgSe5i
         NePA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N4/z7cMI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47683cd4d37si45026811cf.636.2025.03.11.04.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 04:43:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N4/z7cMI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trxxk-0000eZ-KH; Tue, 11 Mar 2025 07:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trxxf-0000Vf-5v
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 07:39:51 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trxxY-0007nN-Iw
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 07:39:50 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso2625745e9.2
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741693179; x=1742297979; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=thg6OV1i38O3zO5fYsgxFU2kAPWUsE6O8clbjSSChsE=;
 b=N4/z7cMIvehwqDUz7csnWqubpDC+xMYwGhFcM+U8P2PKBc2iaQWLVgVIb8Fc7hGcBc
 sAHdIhhXwuDEhrgC7HOgGJbtV5W9J8zdB7szxTfpSmRclrNuhFfVn2mCzAhvOjiGnZhT
 8LR557MhvuXG0MLWLeC4B19Ehoyyv54hYsmZ6wOPVVavnU+KsxOnr33CH2qdKovL0oZZ
 4WGNauUCXQEdZWfclZP43OpSbeIMZKIlH8E+2uDDiDqFDbyLqyOrF48Z6MVMPM0kzRci
 2LoWZTL38DNrHziVQcNnY1KT46svW26RvtwUXbxF+zrn7ofDQtOr7oBZfFtydNIpkjrv
 HR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741693179; x=1742297979;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=thg6OV1i38O3zO5fYsgxFU2kAPWUsE6O8clbjSSChsE=;
 b=mQ1E4inAg6PO/E08C6QL3F27/280h+NABqCnkEMGiUQwiNr+N/ensqwav2aXr55Wr6
 Mjm5dPFTL6t50KeYRKzNSCxVelSARD9xvI9HbKXB7Doh80TqoalNQWnd7q4XDZ1rMvu3
 dwZt8lgK6SGXzeDWeLEOj/9b1dL/zAHtK503R33nZM3dqfojROUkTzjW0GnfktAwkAMu
 XDbgHAVi0EYCk3tfRS6ijwj+gwF0zwTxMaGV1dqxMsLOR9HMXChIyDW/XRv+mquMO5iq
 luHu9+k38FOn5LF+sgyY3jVejkY//K73Kr3JukuZ+Tzyg7v23gAamZUUJtbpo7jXYs+7
 v5rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFxX/W9zZD6t5KzVrA/wG5l9QnepDU9jMGhHMFPd4NDAe+7W+ojUpR9Cm8qd6wU5u/7st2nNV6oA==@nongnu.org
X-Gm-Message-State: AOJu0YzUQLh/Y2835Xfe4jsoKQiFHXwNKver7KfW7rSGKNZg+WexLjAq
 19jwghEAd/skGD52kwoMIAjJYwb5BBSXK3aoBiMLzxsHYGn+fO1B3SSGgG8bmMU=
X-Gm-Gg: ASbGnctms2GboiPonPat7F8bcYhUW3w4GDzMjsYwJ4YGoyWY/lq10jXGO1VhTksDoMy
 HlfP9C4RfNeFXFxdivjss2gXz6mntJOOFBGP0nkAVqRwCiMVKkxsWZeOHIozmRJLsZGY6bDCXAU
 F/HiPHciTNSPZ/cGB88Ghq+iHZHILWDnJqsWBTU8vPWxvrFRmt3/1Mlbr01q4xL2f7HYgWOzkCr
 KK/0rDMGGsblXAUz/vpjJW83FQpeo6LSdZ2NS/eEn0ndrPp4qt6fSdLHDTO8RaLzdS147OfWEi4
 2aSi3t8g/jh2dlLcswGoWYEGqKkNui6MzAtSpOxmQXt6AUYtrn5DzE7L3wnWlgLegUZA/bV3Glb
 gLfxNmJ5yiMEW
X-Received: by 2002:a05:600c:3b21:b0:43c:fe85:e4a0 with SMTP id
 5b1f17b1804b1-43cfe85e60bmr63940435e9.7.1741693179412; 
 Tue, 11 Mar 2025 04:39:39 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d031d0e41sm16578245e9.0.2025.03.11.04.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 04:39:38 -0700 (PDT)
Message-ID: <98083575-c052-457c-8732-0b3dbe33089f@linaro.org>
Date: Tue, 11 Mar 2025 12:39:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.1? 0/2] hw/intc/arm_gic: Only provide
 query-gic-capabilities when GIC built-in
To: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20240806141940.22095-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240806141940.22095-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8p1C6mrocnle

+Pierrick for historical context

On 6/8/24 16:19, Philippe Mathieu-Daudé wrote:
> Attempt to clarify confuse output from the
> 'query-gic-capabilities' QMP command when
> no GIC devices are built in.
> 
> Philippe Mathieu-Daudé (2):
>    target/arm: Move qmp_query_gic_capabilities() to hw/intc/
>    hw/intc/arm_gic: Only provide query-gic-capabilities when GIC built-in
> 
>   qapi/misc-target.json     |  4 +--
>   hw/intc/arm_gic_qmp.c     | 61 +++++++++++++++++++++++++++++++++++++++
>   target/arm/arm-qmp-cmds.c | 52 +--------------------------------
>   hw/intc/meson.build       |  1 +
>   4 files changed, 65 insertions(+), 53 deletions(-)
>   create mode 100644 hw/intc/arm_gic_qmp.c
> 

