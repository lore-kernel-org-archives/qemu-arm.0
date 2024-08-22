Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp753898njb;
        Thu, 22 Aug 2024 11:57:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUj5JmuOEQqJGZw0UnoSkEuHZ/xwbIsbC05IE23CD/VfWZlBlMcQ0PpIkqc1a/Cek2VwX2ju7lG2zLxEw==@linaro.org
X-Google-Smtp-Source: AGHT+IHbDXFp6ceJp+/8Nw1jJDr3nKezwvrEcBYe4Rmc9ypcctqEz0TxDlIRIwTqMtzIVWPutNqN
X-Received: by 2002:a05:6358:e48f:b0:1b1:a666:2bba with SMTP id e5c5f4694b2df-1b5c21edd38mr404955d.24.1724353063567;
        Thu, 22 Aug 2024 11:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724353063; cv=none;
        d=google.com; s=arc-20160816;
        b=wYsUI397IwfU9iXmmDZhzsCSxKILNXI5KEvrcnQ0rOknaM9PLnUdP2aYkiaPdtriJb
         urIXn9UC/7m3f/ALwZC4Us/b4r77hDRdVS2HJDjV2IbWFpv9I1y0M0T6DszFr1cFAX2Z
         sSdeL4aiMYLU6t7USHx3EpN+HuLZFttMXpw3+W5Ql+K4FiYQieLnW+ls5fYwNlP+59Ik
         Co52fX5UMC4Y4OlY5Fknxjp0M+l8MqwI3NEkMsJxse+O4VDGhN+BcaH0b4yGeZoTXpkS
         5CWUOCBepSBKK/l8Htlir5td7BA2NzMD+EfM4Ux2RfCPHLs1y+NSpdvcvh66lGvWwVMC
         Abbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=EwqKo5OF7mFrEAuAgBAi12JIIbjG/XKy+C2LYbS52nc=;
        fh=KvvD30fXXEuK2eDmQtD61rFsChSx/mXGlQ6cnbeJegc=;
        b=Slos5wSyLMRLVq/3Cd3Dba+q1GRTMzdyxZJiUWK7SVvISJWCFEQiw1sBeyY3dpcrnf
         rv/A6mE4weCps/ch4TlxnONTBnfAE2LEckx8ibhgWLWdDqmfTTpyKqrsP7jDtyihdx7z
         osdhjO/A2zTxkQPY+uPcA268JYzJbnY3Ool7KP/VT/cvItFMADk/wUDVLHuk/H8aKv9L
         hhO/55ws04lhPIWx+yHfNNk+fH4Is5mTs5a9IhhqOPqBky2gzKYxNykaywuM4EuO1CHF
         p4ABS2lGEAduuU+TeV7qK6xmt7Pvhxad3sPHq+u9/BbTywmohq3EnHdfkgN3bvO1f6IA
         EutA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aLvVEUDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f465798si204878185a.785.2024.08.22.11.57.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 11:57:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aLvVEUDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shD05-00033F-Mw; Thu, 22 Aug 2024 14:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1shD04-0002vw-4a
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 14:57:36 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1shD02-0004ZG-97
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 14:57:35 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52efdf02d13so1656446e87.2
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 11:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724353052; x=1724957852; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=EwqKo5OF7mFrEAuAgBAi12JIIbjG/XKy+C2LYbS52nc=;
 b=aLvVEUDlChCFCAlnC5TESgXxdZMAdsBxEgejLs5L3CNZ1KSeq9msOVPVYr00aH+OXT
 v6SmC1I6r90rFvws76FihYvvY/e72CUTXby5lLjmGNe+7Z4/+l2+7d9RLGKD6iAhbXEv
 lUBnXPynITimHc24Ns9QD/qBELWk4Qre25MNmqwuo+31F374/zDtIfZZQwDglj6lcxiE
 KhFnTScXX3mMFWU/nPzXpWwdjbGYlgRtWb1VntyjXQVb/gosFZOR5Abj6+BWTMmksbRS
 b2l97OdD+/gJ2A/YuMQ9IVrHOTCrUKDbcv45x1F/OkwOYqYhNo6eGtv0ofMuqF246hIf
 pEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724353052; x=1724957852;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EwqKo5OF7mFrEAuAgBAi12JIIbjG/XKy+C2LYbS52nc=;
 b=GYTATR1K4e+YnJiVKO3q77BhNbYj11G5UQtJnO6OEEFTw6PSiqoC1VzHgAQAFjcIY+
 PwYnk1ytpnqDQAMxAu3JG838M8tn1zUVUBMLx4fFC7xNPXQQLMKfuKuGKVXdpl02kKuj
 fIlHIxcDa3jTg4JmNIopN1aqZfLWgf9JQuuirujhc3tt3kcdiiIJHl36RSmMTE2prgf5
 4oUd6P9xY01LAapZIPK+UNKC12G97g5eY4ThlV71EoonJP0flU/12kw9mTtSv834Jb4N
 ezc+aZYMa2PQurwAQkgm+MiUnIkbDrTZ7e2jtvr2KtQpJdLExzQilmWihx7L8djRNrT2
 EX4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4QdaHt4Xcr484LIrncgQb9YKH1p8hlwu2DbayiRbkvQ29hVPelL17s2hgu/EBTAgunRLvIkU7Eg==@nongnu.org
X-Gm-Message-State: AOJu0Yw+riWF4NINNvq87X2Xy5kVdqAis7OS5OFDDyPP5DCl+KX036Pg
 bvWvimrkS0zw44qoLwa3twllJfF9HNdzWb5iLX+ahoupNW1ihADaJ0p7Y5FXHuE=
X-Received: by 2002:a05:6512:281c:b0:52c:c9e4:3291 with SMTP id
 2adb3069b0e04-5334fd64f4dmr2031935e87.60.1724353051625; 
 Thu, 22 Aug 2024 11:57:31 -0700 (PDT)
Received: from [192.168.200.25] (83.25.211.12.ipv4.supernova.orange.pl.
 [83.25.211.12]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2a1df5sm151883766b.68.2024.08.22.11.57.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 11:57:31 -0700 (PDT)
Message-ID: <02034817-3f31-42ca-ba5f-0333e7bd344f@linaro.org>
Date: Thu, 22 Aug 2024 20:57:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional: Convert Aarch64 SBSA-Ref avocado
 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240822114146.86838-1-philmd@linaro.org>
 <d8c744cf-0da1-42fc-92cc-f8bec8ca00e1@linaro.org>
 <b3d054b9-4ede-489c-bca5-b61b046dea50@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <b3d054b9-4ede-489c-bca5-b61b046dea50@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x12e.google.com
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
X-TUID: JC9sde01bac3

On 22.08.2024 16:39, Philippe Mathieu-Daudé wrote:
> On 22/8/24 16:06, Marcin Juszkiewicz wrote:

>> Maybe for QEMU project this is a progress. For me it is moving tests 
>> from working ones to "sorry, timeout, find out why" ones.

OK, problem was found (check my previous mail). Tests took 222s on
Macbook with M1 Pro. Not looked yet how to enable skipped ones.


▶ 1/4 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_alpine_linux_cortex_a57       OK
▶ 1/4 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max              SKIP
▶ 1/4 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max_pauth_impdef OK
▶ 1/4 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max_pauth_off    OK
▶ 1/4 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_alpine_linux_neoverse_n1      OK
▶ 1/4 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_edk2_firmware                 OK
▶ 1/4 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_cortex_a57          OK
▶ 1/4 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_max                 SKIP
▶ 1/4 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_max_pauth_impdef    SKIP
▶ 1/4 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_max_pauth_off       OK
▶ 1/4 test_aarch64_sbsaref.Aarch64SbsarefMachine.test_sbsaref_openbsd73_neoverse_n1         OK
1/4 qemu:func-thorough+func-aarch64-thorough+thorough / func-aarch64-aarch64_sbsaref        OK                 222.88s   8 subtests passed

> Sorry for the annoyance of switching from one framework to another
> one :/ 

Project wants to change framework so I am not against it. Just asking
questions.

> Are you using Linux on your Macbook with M1 Pro? I'm using
> macOS and these tests currently don't work, so for me this is a
> huge win.

I am using Fedora Asahi Remix on this Macbook for over a year. Total use
of MacOS was probably a few hours total (including waiting for MacOS
updates to fetch).
