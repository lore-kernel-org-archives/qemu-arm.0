Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp1999025ejb;
        Sun, 28 Apr 2024 23:35:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVm5o67tP5cr5k15XT/Ct5gAwHBO7xmsEm+ZOfEiexq3emLMkz9bvNu6utPIrR/0rnNOr5dZXkiZUOC2A5pGve+Px2YkR9u
X-Google-Smtp-Source: AGHT+IFChLrjGMI+BfDA14cI6WeCmiC8aLr9gAyXAS44I/WEP/argiZI/oK4/w13xZoCoDaXMLaJ
X-Received: by 2002:a05:622a:1387:b0:43a:ea41:c9cd with SMTP id o7-20020a05622a138700b0043aea41c9cdmr2567633qtk.59.1714372543627;
        Sun, 28 Apr 2024 23:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714372543; cv=none;
        d=google.com; s=arc-20160816;
        b=ZId2h7PdrnIndvJJaa9FE5at2KSzxgcIaJRBLtMU+Y/tYiwwFd7rumeePWRDIyCgqn
         MrUIm/u8RuPTbYaVn0SqvWdFm35Omkk5JI+IUUW80liZQgCgpJGW6vy4x4ftfvcANLV8
         phsY0oTvTHmIx6ZwLqxbJY6574C3eSyTKzB4g+MaJHGqNFqWe8oYcVQJI/8+8pRbJx/m
         aMfIXC2C7ufS/NZP4IPxUM/xxnDO7BWkZSYh3wuChWq6Iqih1vsrPWNKKPxwoqkBdvlC
         zLusmJS0STamA5RXeILNlPYSwyLxJPXzwDLwGcv9bn5s/jo1yyDFijUus4zm5Wb6iVCT
         678g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=fF+tHR9zZY2qsdLlB2woUhQUdUSvkMx+q6iplS5/FIE=;
        fh=mcx6mFie+IUo0+Luwl45waWOUb2JSUBdEgHQ50V/Qcw=;
        b=DaDpcsjdSGMsLxFdj1+9JxYxgLWDq/wovDy7QbwUBUasTHEcbdPE43u3d1kHPwEUjK
         yoIzkMtSafQgIlBSCm+JDeRFs9xhW6JsuetvtJzn/Ud8kM/eIzzEzvCz9yu1t1tf4db5
         ww6WoN45slikzZE4qsnZGS6w0iH7hdJ80ptlxH+gIxucyMKIKOxWWkbr1ckZXK9j6s7O
         QNscLoDhbNDY1hihVcBCR5mrPYz1yi7sGHwdObWpeyYw1xxf50WLSiGPfY9A4HG5XFB8
         v3HoVJfJ+GSm/bN3RARG4HzmwkrhbPRh+CNJO2dXaz3/ly5vhP0XMbaM3y9D7htKkmfL
         G26w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ff92oBz/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16-20020ac85a10000000b0043acbbf6662si2881847qta.614.2024.04.28.23.35.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2024 23:35:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ff92oBz/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1Kbk-0007wE-QQ; Mon, 29 Apr 2024 02:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1s1Kba-0007ub-B5
 for qemu-arm@nongnu.org; Mon, 29 Apr 2024 02:35:15 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1s1KbY-0004Ka-L6
 for qemu-arm@nongnu.org; Mon, 29 Apr 2024 02:35:14 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a58d0aea14cso319376166b.2
 for <qemu-arm@nongnu.org>; Sun, 28 Apr 2024 23:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714372509; x=1714977309; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=fF+tHR9zZY2qsdLlB2woUhQUdUSvkMx+q6iplS5/FIE=;
 b=ff92oBz/hTgFfuDuGdMM7vqUjydJBaovEjvZr4VybvYvjeob3NLfOA5BmohuhvFC1N
 Gk+KZuazu0LnCMBTBtVwQbG4igL8ECGJ3yWpPm3SuFjDk3HmOJSiMB4RtIp0cm0KVNK6
 2Jb5kzg1fumKioZuOekK0EHXG5HKApuG91L+CLFS+v9pxIHe/1T3oI4EOr+u6MsTW+rP
 VIgq1PkwAIXTlGXpwdIcP296WexAr5EQ3MYqpzrQpo5dZJGZQxxf27hu/mr5tjPwE0zQ
 BljDLcP7lBqkq1hvr64NNaDuvzji+AErbg3DcKDkkMG+J1E9JA36/Zd/64FtIVdLTW0w
 /DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714372509; x=1714977309;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fF+tHR9zZY2qsdLlB2woUhQUdUSvkMx+q6iplS5/FIE=;
 b=u6b/XA4lGLilNJAoIMmNtsQsQAphF2k3Sc+8nLjOWTvRlrn8bo98d0uhIHHe9i2p44
 lgU5TOLeKTgAOuhPbdp9YuqmK5gThUvkupGDGoWNwETvin6VgAVETOOOgjYlv2OKd2e7
 pnz+qax0lbfukXxJoTCwjwxbcddYl2VwpJlWhjTfK4NoQnYmLsHMAgp1gd0yNhp9BK5J
 qkAp9Sy9qzhFWPcMTk4bdNQxAcSrFb9651eDbrs3iS8UgpeG5tuG6A+Tw8ij9chsnM6p
 B2TOU03MxX6wwCeDFD8I1f77wqn7vuZQAYa7LYNLGsdfXPPzg3JmSra7EpKyy1WlDVBl
 oKMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+4XyrIV9TnH6bSUhhLyl/0mEpppC4qE8b7UGXNLaxD2A3fq9LPkDgdksKQRNTGmZ314CelHW2AbOK74gsSq4O9BBR
X-Gm-Message-State: AOJu0Yxq4y6BxekzonJkJJK0si6JGckz0sDudp/i5mDwrwR+Amuad9b0
 ztL31Q6kX6KVRUGCw1lL1S2OeVNoPjgW6ndA6ct7R2rHSk59iJ5MtdiQg2X6r5E=
X-Received: by 2002:a17:906:1643:b0:a55:b2d8:c584 with SMTP id
 n3-20020a170906164300b00a55b2d8c584mr5941126ejd.66.1714372509156; 
 Sun, 28 Apr 2024 23:35:09 -0700 (PDT)
Received: from [192.168.200.106] (83.11.4.140.ipv4.supernova.orange.pl.
 [83.11.4.140]) by smtp.gmail.com with ESMTPSA id
 k15-20020a170906128f00b00a473a1fe089sm13539985ejb.1.2024.04.28.23.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 23:35:08 -0700 (PDT)
Message-ID: <559cc23e-f581-4f0d-bf59-94a516d1ef56@linaro.org>
Date: Mon, 29 Apr 2024 08:35:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] hw/arm/sbsa-ref: Enable CPU cluster on ARM sbsa
 machine
To: Richard Henderson <richard.henderson@linaro.org>,
 Xiong Yining <xiongyining1480@phytium.com.cn>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com
References: <20240426073553.326946-1-xiongyining1480@phytium.com.cn>
 <20240426073553.326946-2-xiongyining1480@phytium.com.cn>
 <a25e01c0-5f6e-4568-93ec-970987eb6d07@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <a25e01c0-5f6e-4568-93ec-970987eb6d07@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x636.google.com
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
X-TUID: Ii/e8xfFd6+l

W dniu 26.04.2024 o 18:06, Richard Henderson pisze:
> 
> Isn't this basically what MPIDR_EL1 is supposed to indicate?
> We do not yet implement all of that in QEMU, but should.

QEMU has socket/cluster/core/thread model which could map to
aff3/aff2/aff1/aff0 (or aff0/1/2/3) of MPIDR_EL1 register, right? But it 
does not.

Nevermind which combination of socket/cluster/core/thread I use all I 
have is this:

cpu 0x000 mpidr 00000000 00000000
cpu 0x001 mpidr 00000000 00000001
cpu 0x002 mpidr 00000000 00000010
cpu 0x003 mpidr 00000000 00000011
cpu 0x004 mpidr 00000000 00000100
cpu 0x005 mpidr 00000000 00000101
cpu 0x006 mpidr 00000000 00000110
cpu 0x007 mpidr 00000000 00000111

cpu 0x008 mpidr 00000001 00000000
cpu 0x009 mpidr 00000001 00000001
cpu 0x00a mpidr 00000001 00000010
cpu 0x00b mpidr 00000001 00000011
cpu 0x00c mpidr 00000001 00000100
cpu 0x00d mpidr 00000001 00000101
cpu 0x00e mpidr 00000001 00000110
cpu 0x00f mpidr 00000001 00000111

Eight cpu cores per unit. Probably leftover from GICv2 times where there 
was 8 cores per GIC limit.

So looks like adding mapping of topology to MPIDR_EL1 into QEMU would be 
a better option. May require checking for more than 256 of one kind then.

> Why does the same info need to be replicated in devicetree?

One of things we had on todolist: export cpu topology in PPTT table. 
With MPIDR being 2 level while topology can be 4 level.
