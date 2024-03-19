Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1563999ejb;
        Tue, 19 Mar 2024 14:15:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWb8jMHNL6Y/8Lh8pAzY/f6fmlhOmBzBjjmnkws9F1RFXScJnOr7n8YsE/abTBHbZp8HQ+RQxOMG9v2xb/u+GUkIMxaEAex
X-Google-Smtp-Source: AGHT+IEgHQc5zePVdvxD3kSdYk3wMh0EbpBF/GUsWSNcSCeXHFLvNuLZmzimfRnClSAHYKQyOqph
X-Received: by 2002:ac8:7fc4:0:b0:430:df57:abdb with SMTP id b4-20020ac87fc4000000b00430df57abdbmr1093899qtk.7.1710882903285;
        Tue, 19 Mar 2024 14:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710882903; cv=none;
        d=google.com; s=arc-20160816;
        b=XnryvQX9+iaOaAz+7oRUDN8Oks8RSdbjTjH61cs5kc0Tmg+TVj+ogZ0PXbCBkJKwZI
         HJRl9W/AITi4djYt6d83nMFRRPYKPBb6GttoGkhaFJYkYpwoMkzPKjOWjJNA1ju3aq2Q
         BsXjNYFjonXBojSVOI5pG3BSwpvtKW6Lovf4sTN6D/15TCXu2yEuTmjTUByO4rzq61x8
         rlNNClpMkd5MGCpsUsQcOerioYDApyhRQVxSA7vM8s/FHZE2ZqU6Qx4CxWAwUjXczRio
         Yjyi8tvifp9mhe5RSmou9CR+hLQOYiRfoUJPDDKAfqsJ7LEd0mj4dr9gNhpWCPK8eGqa
         rAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mNvi2tmZ8zJngxfI5KhlPbVp84w4oyI5JdITFeSXGR8=;
        fh=2TdGjHrbn/GCdb30Pivxx7ahCa/0frZIn01iRukoTnk=;
        b=SeymXA48Pf03ic9etHuDBmZpqdV90MPO6piWciY7JdkVErJl84G1BkIFDkNnhqPnX3
         CYkefUn/1/l6+RvxvtK5/gQoh0cwaoLAWI9JqRsikm9osFmjZMiId9ShG2SSWcs4vNl6
         o2kfvWBXT3rdU8km7VUqdkdKA+Up10WuWsJUtdHT2ZgMWrict/M5F/gwiYWiKFTtsWaO
         tmBa/SR3fsoySNvY3paj7NCP9rvPlqNbY7Df5AK7bhbpK6ujedaZOMQXrWVylsQc+42K
         Tg4GOHerxgWpCddpKNL1NtNsM/V26v5xvKs3gRLJ9o1OySe6kIGrdBuPvhev/fyvjSje
         DLVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TylFaU36;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj14-20020a05620a190e00b00789eb5d42fcsi8974773qkb.72.2024.03.19.14.15.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 14:15:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TylFaU36;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmgmy-0002J7-8t; Tue, 19 Mar 2024 17:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmgmw-0002Hx-Qn
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 17:14:26 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rmgmt-0008Ck-GR
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 17:14:26 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6e780830bdcso155870b3a.1
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710882861; x=1711487661; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mNvi2tmZ8zJngxfI5KhlPbVp84w4oyI5JdITFeSXGR8=;
 b=TylFaU36l1QVDUTppyWw4V/pbaB3INFAKBsPiDaLtDTy9WTef1pG1sn8nzBU5QQjdo
 Y1/ymDhaiZugTJ12zHhnwgRQawlse9cRDkQ0O2yfcfvAFMSQv3T7/zbXdg4G0ehZeG0B
 PFVKPybtLLvAeZuxlWsrWrvX7lbNTjk1lJs7QUAVuLw/BCU4YfV/808IsPJzfNzggiYl
 N70rWh++BZ8mKUcaMUcGva2h7j45jvdovyEBTIUl3LV9OREW8+7FIf6W5Lnntr9j5TZ/
 1rE6hIhu/PjmdYOg9lVm72e8KB5HCwbmamZILRbT9FMKo2B8FUNwFvW686pCQ/uDbrpn
 3rTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710882861; x=1711487661;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mNvi2tmZ8zJngxfI5KhlPbVp84w4oyI5JdITFeSXGR8=;
 b=llT/T7FB0/CtrR1jXIpXB3mizwJKEUDWA+Ofo50Q27oqqcI+qmWtIgSx0eKnbIQwZE
 WKq0LoFhffORqm9Ox0UlcdWXQQ0ZayaiIiTqNwhyQzRwwI0ccezRhp+Q1OmzcLwHKkae
 hxui+9hg47T1L6Rz/4Dca1nr9aNnSWCN1qTVAxkMherV+DF6DG4MIHejX9IzZ0KFndzW
 K29incZY9jI8KSBlPZDgnC/EBDXNJBgFBJFMIh7vRvOrMhY8KpZ0NP8H+mrCGRoWMffF
 1kMXEQO9ncvxzj/g79ImoaqwY3EUYiXY6Eai7dNOWAwdO4PcSxzahfwFHA/rq3jVg7Q6
 kzaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8h/CaiacvJDmMNzIbiK0dSZDybaNdDsR4MR+up0d8O0LJyTV1G5/ddBEdhw+6cDW/IwOPihA36os+g4v5FUPtJxG2
X-Gm-Message-State: AOJu0YxpMUDo9zvDtMl5iKAmgl7gSecswUO+iMOtxq1oisRHz1DNLe6N
 6WDk9rx7CQuTAJasRzG6Mj13W+YqBTIp5iXqpwpxslm08Yz1bBobGcgaobybLJA=
X-Received: by 2002:a05:6a20:2d11:b0:1a3:6644:df05 with SMTP id
 g17-20020a056a202d1100b001a36644df05mr5750034pzl.16.1710882861462; 
 Tue, 19 Mar 2024 14:14:21 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 h3-20020a654043000000b005dc49afed53sm8259622pgp.55.2024.03.19.14.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 14:14:20 -0700 (PDT)
Message-ID: <9b23f721-7ea4-4f12-8f8c-3d87aa9ebefd@linaro.org>
Date: Tue, 19 Mar 2024 11:14:16 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 24/27] target/sparc: Convert to
 TCGCPUOps::get_cpu_state()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20240319154258.71206-1-philmd@linaro.org>
 <20240319154258.71206-25-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240319154258.71206-25-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
X-TUID: 1FcVP72aWV0Y

On 3/19/24 05:42, Philippe Mathieu-Daudé wrote:
> Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/sparc/cpu.h       | 37 ++-----------------------------------
>   target/sparc/cpu.c       |  1 +
>   target/sparc/translate.c | 33 +++++++++++++++++++++++++++++++++
>   3 files changed, 36 insertions(+), 35 deletions(-)

Again, why translate.c?

r~
