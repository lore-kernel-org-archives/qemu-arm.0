Received: by 2002:a17:906:18aa:b0:a6f:6ed6:9beb with SMTP id c10csp617611ejf;
        Sat, 15 Jun 2024 09:15:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUg2TzyiRV6EGbK+xJG8LS2nbgknPIdQ7fmNRi8c+75BXLPwkrb5J3TbQ2NlVsET/5+l2P0RnL9Qm6+PKbLnxzFnEeb8iGE
X-Google-Smtp-Source: AGHT+IHnYKe2prr3Db/64dEzsEwTBd19myxmrTpP+a4nsZnbD/rNOKdTf4MEnpNupKXzVhu5DdeK
X-Received: by 2002:a05:6808:16a7:b0:3d2:21d7:4b41 with SMTP id 5614622812f47-3d24e8e08c9mr6131389b6e.18.1718468123061;
        Sat, 15 Jun 2024 09:15:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718468123; cv=none;
        d=google.com; s=arc-20160816;
        b=RSSZWFjRSrw3UNv2FrsUiDoBNh5Q5hZaew+FDJrVw46y/xHaBjNxOEvp36qKCcFD39
         jZqNHGUExKWm+F72pIkNjGmfC9/AGOoBhfVnOlY9r3mZKGo3c0p3Ybu48+4SuvXBSWp5
         Dcr10RbOP3hTMF4OakZY9Fy991hrSX2fgZi3z54bnqjq+j1/ES/ikxwsMaomRrObuI0q
         6trjt14r6IQzBuATJA2unEBmUZpm/e3Y7gjHY6In6dJ7Ytyr9duvgAYX0M68pkTgtHGn
         YdsOoSswqg9cDgmavUX3R5rvUdl+Mkz04AzA/dZWykuGl/ru1GUujmHntbgtWuR+UJqf
         ThKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=DmZmhZo0M9kwv5imz4/FYm0rlWhY7o4OQBi4TdqYFI8=;
        fh=rc/gmDySrX5+RVOoG9lHgUR7crZo+BXadsoHbipQM5k=;
        b=IjLxdIGczhVsmjvHVDm9aTH4fU7Gdm25P5pVPnzGTuRJymMnFk3iAbvikYwa1XrqFV
         K0/BTkBHPh6s+LLAB3DKT7kP4dfDEecYgNQ6ah7vrKe3VGBnWIwQgdcZDy/OmWOUEB1J
         ctlzu/jqZau4ZxGSdcPHNN+ZJODAt3dw/fuH88SGp7hg3T4tncyTSZ80QiX/IzZwB8fa
         CnlZEju3w/OwqIXt2M3CFhmAYe55obJcQD2TIkVpTjMTVWU64wdTwJ/1zEC179KqPW63
         IBzJIbGoWUk/BO5Ry7OLkJCGfDPpuWTPAl3qqM6clPCyYwc35q7Xl+vXBv7h8iTIDmyM
         fWUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bSEO/M94";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79a311b22f2si205493785a.73.2024.06.15.09.15.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2024 09:15:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bSEO/M94";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sIW3a-0005oB-Pe; Sat, 15 Jun 2024 12:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sIW3T-0005mX-Te
 for qemu-arm@nongnu.org; Sat, 15 Jun 2024 12:15:04 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sIW3Q-0003Ni-W6
 for qemu-arm@nongnu.org; Sat, 15 Jun 2024 12:15:02 -0400
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-36dd56cf5f5so12153415ab.3
 for <qemu-arm@nongnu.org>; Sat, 15 Jun 2024 09:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718468099; x=1719072899; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DmZmhZo0M9kwv5imz4/FYm0rlWhY7o4OQBi4TdqYFI8=;
 b=bSEO/M94JxbgFI044d+n6LxlJduwrqMThQJk2NtaPmSS+F+FrYercRf+u+/hr5oZol
 p9dGD9D4JyEHoY2CRu2Er+hQy5LGW7gfIiLezlncYUrOu1lM4CFH1JT3q97Vktju4MPP
 JekJTuZmw+GJF6CDFWP8K9EYxhOoQkVJ8cycPFuT2+wciDLq6k03HHu1uHEhiFTdco/6
 5PatXfREaG7xDjQzDzUHMkKsH2CT21u9mnXd0qsUd32QI2v/zHLUkKd50Kt8XpzJ46sQ
 sEe+GPNvhmUfxpyc/pglIVnUX3NhxjyJQ5unF5e5+44yLj928zt+e4zPdZgmbk8U8rDQ
 XiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718468099; x=1719072899;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DmZmhZo0M9kwv5imz4/FYm0rlWhY7o4OQBi4TdqYFI8=;
 b=rzn5+/bJpb/EQ6qfRKYLGjgK83CNz8a8IXOdkKpB+NpdYkvGWu4XYOiuS/tjSypceV
 t/L0pT9KWgmhSzhMIgiGVAVkO1DhZywD7ZD6e4Um9QT62ZmbduOYeVcZ8E9yXLCrCtDR
 eQAS4oDgTyMkPbURBNBD9JJ5oNDYntxwrrD8H1JQ4Un4JNg+oasWkIWJlRtqKJLaoBm7
 E6Z/vpNyivaQcbubsKh9hnKwMbR1Gm4Jiy6gDRlSrVdBKuVCTp393YeTq3+n1EKuO+82
 dmBj7ivBeq7gp2lKkWVjW4mt51yb6BTAknJ/ebnYUWzsiVYi0O1+mxEtHPPMKIGkYcuN
 2/Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7+5cfSdckqbjyQ3oqsHr7N7U2zM5R75/a1jF8iuAaxc3QJNDGu5uekl0IwXySPZ9h4HOM/rKeZoQ04xRtg4qmARAn
X-Gm-Message-State: AOJu0YyRE8oPzZ97HkecHctU6bhd5wQger0V68o2ExEbfvpec1kgp4d4
 vXzARgk+JYKfCTuNWktVt+LL10yEjaBgk+c4mKswYR7ksa9sx7nrj3ZVejB8iWE=
X-Received: by 2002:a05:6e02:1c4c:b0:375:8a51:6c65 with SMTP id
 e9e14a558f8ab-375e0e2554fmr63295935ab.13.1718468099377; 
 Sat, 15 Jun 2024 09:14:59 -0700 (PDT)
Received: from [192.168.74.236] ([50.200.230.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb71715sm5010305b3a.175.2024.06.15.09.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jun 2024 09:14:58 -0700 (PDT)
Message-ID: <828dc03b-1e7e-40f6-80fd-0f5d56f362bd@linaro.org>
Date: Sat, 15 Jun 2024 09:14:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/19] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240614072620.1262053-1-clg@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240614072620.1262053-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: liqgI/bD2ePe

On 6/14/24 00:26, Cédric Le Goater wrote:
> The following changes since commit 046a64b9801343e2e89eef10c7a48eec8d8c0d4f:
> 
>    Merge tag 'pull-request-2024-06-12' of https://gitlab.com/thuth/qemu into staging (2024-06-13 07:51:58 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20240614
> 
> for you to fetch changes up to d9f6311f5393da897e73be8a29c261125d0c1ac2:
> 
>    MAINTAINERS: Add reviewers for ASPEED BMCs (2024-06-14 07:36:09 +0200)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Add AST2700 support

Fails freebsd testing:

https://gitlab.com/qemu-project/qemu/-/jobs/7106081732

I'm not sure off hand why this wouldn't also fail on Linux...


r~
