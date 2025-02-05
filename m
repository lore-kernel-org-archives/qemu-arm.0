Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp930149njb;
        Wed, 5 Feb 2025 06:48:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXgYD1na2QdjsAqQrfwU0419DD9sbRQXYHjP6xHoCLJfdm0zH32r2CuCDdY45OXXIEwrz8SrHSumfwQdA==@linaro.org
X-Google-Smtp-Source: AGHT+IFuu4Og0IWLU7nZm33DBfIPutMHu3tQTtWtSmEeSl+URTeInj1XFW/9v7OMcTnuY0i0fumm
X-Received: by 2002:a05:6214:5f0c:b0:6e1:a59b:3e59 with SMTP id 6a1803df08f44-6e42fba4378mr37562106d6.14.1738766935504;
        Wed, 05 Feb 2025 06:48:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738766935; cv=none;
        d=google.com; s=arc-20240605;
        b=T9xLulNrhIuFCnE85ugLor4HZbpFK1G5EuuSocCtmjNHH0w/fTkvNV0MR3OmKdEo4k
         9nDMuS9mGRgz6wzu39lH5U12cx/vgbjRH1LI5Zdrdli1n4PlWf1YPkeozwAJtFXDR7yE
         T7CzW4b8o/BYNF/NMmDVsXugpkRBhFFl0t4BaAnN5rfMwSCwAyM9ESlAW4nPza0Mz8/1
         ra5/9NGf8sSIbGBr/Ho6qat3xoPecf+i1CQxBbt7SjuGDBhpOKF013xxo1IvOCufGWMF
         RRHoCkkKPjSjDRAheiWFFfscgljXbeu8sAdXav5HCCQ6iAkr4AJvSe6vQDoV8AfqFUUZ
         fUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :mime-version:date:dkim-signature:message-id;
        bh=GihMlY52E+tqDtb6LBuVtlIjkxOQON6Oh7+f0QSJ3Pw=;
        fh=RXvyjZqZdW9Xe+0k1608b/EmUdccJbhL3FutHe3c5V0=;
        b=E0KOcq0jeYcik8EYcPPXnlTN1RjNlNyLXOxRdLrB2LVcGS2Op3AjqBv2tPMn5JtnrG
         7zfvsE6RNapZ9/81JFdP6wAH2vo+HuJlL6Yqk54BIW10ixRjJ1dsL2G5th/0XmU2gvt/
         m+qkMhf86npomtiV1nVCtmRFLt3OdGHAv8cbZI/Tp+Myw3W+D4a9rigpiGZGf4hklpJx
         1CNl2VbNcWaD0XAWJeisT/LoYqaTRpWw4pljQQ962WdGSXYM61JWhQDrK1zO28xPNbQh
         k88BMRmlk2WaQbCz9pe5INl9qWNH7C3SkfhUV/Va6yTFgSJj8tbp51N5li5t+H8DZiWh
         MUyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=kP1rKkkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e42cfb81aesi26659826d6.223.2025.02.05.06.48.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2025 06:48:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=kP1rKkkX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfghd-0005GB-3W; Wed, 05 Feb 2025 09:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1tfghX-0005Fe-5s
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 09:48:28 -0500
Received: from out-181.mta0.migadu.com ([91.218.175.181])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1tfghV-0006w1-JW
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 09:48:26 -0500
Message-ID: <1080d4d7-81d0-4497-bef9-22191a4b999e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1738766888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GihMlY52E+tqDtb6LBuVtlIjkxOQON6Oh7+f0QSJ3Pw=;
 b=kP1rKkkXr8nGIaYn4J+fedd8GACJSCJFvgDMssOB0NOiwMS22cCLkJpsKbFI58PhYRBl/S
 ifTss1Q7wnzoFgOIpb22i6QOioyIRyQPW2WJdkCQgrU2eWOtIic3jvmvEIYK8gQbZyInXm
 X0lg0qPyUn9nZIug7heoJUMOBeCSD2c=
Date: Wed, 5 Feb 2025 22:47:48 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 02/11] arm/hvf: Initialise GICv3 state just before first
 vCPU run
To: phil@philjordan.eu
Cc: qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20241209203629.74436-1-phil@philjordan.eu>
 <20241209203629.74436-3-phil@philjordan.eu>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20241209203629.74436-3-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=91.218.175.181; envelope-from=zenghui.yu@linux.dev;
 helo=out-181.mta0.migadu.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: zw75N4rieVAw

On 2024/12/10 04:36, phil@philjordan.eu wrote:
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
> ---
>  target/arm/hvf/hvf.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

Tested-by: Zenghui Yu <zenghui.yu@linux.dev>

Thanks!
