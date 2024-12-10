Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3186118njb;
        Tue, 10 Dec 2024 02:06:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVyTeG6A1493Hzif/1XmE/7oeBCqDvU5S8GWBVJGrHdmODeIHehtrbRxyp7k2VPGiuXbiwVJh/Ds+6hvA==@linaro.org
X-Google-Smtp-Source: AGHT+IF4Q88r6YMFAHgP6vM2AXay2a27ACUhQCrUuvixWqoK1lujdcbgZHeERcEbpZSK1cpBfmvt
X-Received: by 2002:a05:620a:8904:b0:79f:67b:4fdc with SMTP id af79cd13be357-7b6dcdc845fmr544708085a.2.1733825189570;
        Tue, 10 Dec 2024 02:06:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733825189; cv=none;
        d=google.com; s=arc-20240605;
        b=VodWMHpH9W6w2HsTOw93tjf0GJgMuBThq7hOfMdaAqLbCGOKMfCgxfGWPWu/hnovXh
         MgYtlcPMwoPa04rxGq6noD5B6k+s49M3XUECeCvRL6sOPdaAOQ1h8nfmYAhqlBfP+2I9
         gKN8r6Rci7eNgIyXehFCcN63U7DU2FK9UsXcASXDbayD42U8LtIbGD8twiWZm41tE0Qk
         TcwHxces8KU5X8j453EtipGVTXisF40SHcoQ4jbthvDAhRVjDLzj3SCa/yVHJ/nAGiBM
         IUaMh8AuG5do0KKZ2eXKPuZNV/wpRt+YMjk6bAK45ys/TSN0Jjz80CBAGTfXNiyPolv6
         v/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=dxawAknk+GLb1Uc2ew9tWGkETrTkjFosvNC1Ldf5Jck=;
        fh=iwruolNfw9EYCheWIG5mEImJ1hs8NSnfxQVG0S1DZaY=;
        b=VVAjg0edm/ikhCwbRsZo9SQC2tOJeMPrm7M8dgo9v7dsZ6kksWwLo9OoH2yMZgm+79
         TMiHoxk6fa/1C+5/m+F2jNTXRFxM0NnXvN9hRSQo1AgWLAjpSuP6Qe7+0+G6d0/A/xNO
         63bkdcCGAJpqXm92Oj3g1R/zBG62DvM8Miq4TPhwjF0g8Q7fuXoYJGFmW/EqGps82oeC
         HvibgT8n5eLwFRKdm7OmgnlSmRA4o1SiQdlSlavxYe/39xi0GnXl/hYjTfWUbagRecsY
         9RuZ2WzyrZOs4noqtM3lMJFfr6bhVRSoh8XGlaY2T8csijAaEwo8XcL1+kTDq4WvZlqJ
         4hng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a8fcdesi1382748885a.287.2024.12.10.02.06.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 02:06:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKx7q-0003Er-8A; Tue, 10 Dec 2024 05:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1tKx7k-0003E7-HS; Tue, 10 Dec 2024 05:05:48 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1tKx7h-0003Jj-5g; Tue, 10 Dec 2024 05:05:47 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 1D593608016B;
 Tue, 10 Dec 2024 11:05:43 +0100 (CET)
Message-ID: <78e7fa99-c835-4fd3-8a2d-05209a718a54@csgraf.de>
Date: Tue, 10 Dec 2024 11:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] arm/hvf: Initialise GICv3 state just before first
 vCPU run
To: phil@philjordan.eu, qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20241209203629.74436-1-phil@philjordan.eu>
 <20241209203629.74436-3-phil@philjordan.eu>
Content-Language: en-US
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20241209203629.74436-3-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pmRB350dB9LE


On 09.12.24 21:36, phil@philjordan.eu wrote:
> From: Phil Dennis-Jordan <phil@philjordan.eu>
>
> Initialising the vCPU PFR0_EL1 system register with the GIC flag in
> hvf_arch_init_vcpu() does not actually work because the GIC state is
> not yet available at that time.
>
> If we set this flag just before running each vCPU for the first time,
> the GIC will definitely be fully initialised at that point.
>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>


Reviewed-by: Alexander Graf <agraf@csgraf.de>

Alex


