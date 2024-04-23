Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4823698ejd;
        Tue, 23 Apr 2024 00:26:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSjDh049/Sj+4epGTy77tF4ewBbl5F0BeOiQ3/n1hAfl3PhhkT5ZA1fIhSpS7nQp82aXaqT40zFydCibSyrH6ZxYMLuCAD
X-Google-Smtp-Source: AGHT+IHP0EdJ//5PHc5ZXrut24+7ziMaOqE4AASK/Gz4rsRw+dPbAdBTX5+JM1tFipolONBNkk+H
X-Received: by 2002:a05:622a:411:b0:437:bae4:4004 with SMTP id n17-20020a05622a041100b00437bae44004mr15240329qtx.9.1713857217041;
        Tue, 23 Apr 2024 00:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713857217; cv=none;
        d=google.com; s=arc-20160816;
        b=HMwnbgcrD6QwJHuZYElKQ7Xnro1YUni6tOQjcaNhnBI4+I8ugvI8Jortuj1iI9yqC/
         iS4V1vot32DyfN/Kq+XbZrN17eWJvNQSWybWA7t9xrzLLKTsZ/tQMIS1yw3zHIQ6B8PX
         wjuXsunvdoeSnAXDzhTc2bBHkKWEDfXkxCrX4wqeAQCPTUVRA1qg28NG0COdTY2qEYLc
         H1SZf3/BDiwZWpsT1X3yieZsgdY//N0/RDTGdEA7uDR0DI9+9GJB6JiS656J1CpUi2c7
         MRThlj0ORZwWFCjER2KMwjONsGRbpZo+bpJ7AirFNZPMUtZhIXXlYnwkqt3lCndgHDxN
         oAbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=JjHsKBL8n2LErvbnpg4RZ8oCNUO69GkcqgjN6JTysII=;
        fh=xfzlD6rL9fVvmwZJMlDhLJ2fkOuX8KCAW7to0hofGPo=;
        b=Q9wuTVhSYxMSc8T2FxTSNq9ITXDShGzUxK/fzR6KIjxJ8CUbWi25Tgpy4Lb5JuccVJ
         utlsJX2eD2kYJNJO17xdk2Gi3U13r7e+dOmyojoIkojjDg5/NwgDF/5zSUUQFdp04yit
         DVEK4loGLPA3V/A7Z/2+RqQeQsGJ7xK4ueHRJvmd7VeMrfWwxJn0FR28Sevc8lMSq2RD
         cZ/ofPW+8yWjdgbkhc920+HKPzof5ImdTxvSxM2ySp8W2lcwUkk1dhneRzfa7XRCNLPg
         ZD/ddNCQNWrLqc++QWZS3IoK+i0orU8BpIUVldXEsM0YvSZhP+zbZxb4OzyDKDfPPJPF
         i9Cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCU5mdsJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18-20020a05622a031200b00439ff3a2dd2si170242qtw.68.2024.04.23.00.26.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2024 00:26:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCU5mdsJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzAY9-0001G9-Se; Tue, 23 Apr 2024 03:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rzAY4-0001FN-BV
 for qemu-arm@nongnu.org; Tue, 23 Apr 2024 03:26:40 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rzAY2-0004Bd-Ha
 for qemu-arm@nongnu.org; Tue, 23 Apr 2024 03:26:40 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-572242ed990so135997a12.0
 for <qemu-arm@nongnu.org>; Tue, 23 Apr 2024 00:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713857195; x=1714461995; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=JjHsKBL8n2LErvbnpg4RZ8oCNUO69GkcqgjN6JTysII=;
 b=gCU5mdsJqX9E0tjPtObG4g9oDrLU3DAv/5YAmOnePK3VMzK2Tmpxs7JZYS9S25q9me
 zpoQBZKs1eBpFLfS7ly0kt/FghzHda3ahZ0fK6E8mL4oJud8S2mHhRL2W7AJd2eMequw
 LVWPJ0/0BFx/p4udNJqPwYp20WhncD+KPo4GqLZrsljhanfAvl7kuu1OK7qZmkJOGEl3
 UmB1NaBN4sRoVBGWE38LvrHz9Ahs+6DEFnL/sYIK4ikMI0AXSCPP52t/XOnhRnaTkcu1
 ID0lsVp9WuSQBhaIkQXKnHrCUJtbjXYDjO81/B5W56vh9ioKaWNHxgxTnmz7pw1hY/Dr
 MYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713857195; x=1714461995;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JjHsKBL8n2LErvbnpg4RZ8oCNUO69GkcqgjN6JTysII=;
 b=KDzXY0nTV1B9vXJ8tQwDZQWOaZ2fEOpwDCMPzhe0SEUOuakjuCxxx0rHx7p0qKTG00
 s6T/qSZBP4ZvztnJB8ev3b7jtMl417GiTjbLHTbLxXjnz3P873mQPxb4vTgPHuBX3Zh+
 sR8VceljkJ1axeDM/uEixwXRC+q7GxcThgMDELumlSPlAfegYrDyllkKf4KvvWCefXc+
 KHUyMsZ+7e7MBcvQ9F/yV84uGHNNmK1TOtM1+JKr22ewCG3ZXD4yC2loH8z5pd2vx+Gt
 fWuwmw5V+Upki8rPn/JMzbohUL18cFEHT9igz1QRHfqhx738WwpygSY24UL2oeQY83Tm
 Rweg==
X-Gm-Message-State: AOJu0YykchFXUtQxtcjSPZ9pgNLWHmbN9s1sIqYj2Oh11qF+X05X2oHe
 DL7gyANQmncq0tofDv5WNGEqW5ZFkrcZsJcBodJ70kW8ikOBYvXZyFpcUSgBnDg=
X-Received: by 2002:a17:906:c105:b0:a55:aeb5:b9da with SMTP id
 do5-20020a170906c10500b00a55aeb5b9damr6347737ejc.20.1713857195630; 
 Tue, 23 Apr 2024 00:26:35 -0700 (PDT)
Received: from [192.168.200.106] (83.11.0.31.ipv4.supernova.orange.pl.
 [83.11.0.31]) by smtp.gmail.com with ESMTPSA id
 18-20020a170906309200b00a523b03a1edsm6632896ejv.20.2024.04.23.00.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 00:26:35 -0700 (PDT)
Message-ID: <fed57e7a-9ad0-400c-9d2a-4b90d09f1941@linaro.org>
Date: Tue, 23 Apr 2024 09:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] target/arm: Make the counter frequency default 1GHz
 for new CPUs, machines
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20240419184608.2675213-1-peter.maydell@linaro.org>
 <CAFEAcA91ZULEjEgTotevp-epgH_azcwrSi9PVnnOSk8gq5j22g@mail.gmail.com>
 <c84bfac7-5fb5-4fca-90a3-93adb40bcf3c@linaro.org>
 <CAFEAcA_PWyu=ca-S=qwePDdGqjX95k3oQ+BJUZc541YEyV7i2w@mail.gmail.com>
 <fa0465a4-6604-4ec3-af45-2d329ca513fa@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
Organization: Linaro
In-Reply-To: <fa0465a4-6604-4ec3-af45-2d329ca513fa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: AnN59HvQgU/F

W dniu 22.04.2024 o 17:37, Marcin Juszkiewicz pisze:
>> It also seems to be hardcoded in TF-A's support for the virt
>> board too, annoyingly.
> 
> I looked at it and it seems that TF-A can just read what is in 
> CNTFRQ_EL0 instead of hardcoding the value.
> 
> Submitted patch:
> 
> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/28313
> refactor(qemu): do not hardcode counter frequency [NEW]

Change is now merged.
