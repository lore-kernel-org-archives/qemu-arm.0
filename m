Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp337345njb;
        Wed, 3 Jul 2024 20:12:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6V0v11VOnRmRsLya603ate3s1t+kugXJK0f92X+oIfC/tYxWzep7FB8pOPGTPDP5soMS1Z9vasqMx/uhfQ9c6m3NSLTbf
X-Received: by 2002:a05:6808:f87:b0:3d5:66ed:adc7 with SMTP id 5614622812f47-3d914c93ff9mr452367b6e.30.1720062749514;
        Wed, 03 Jul 2024 20:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720062749; cv=none;
        d=google.com; s=arc-20160816;
        b=fMszqCu2fdKp8d7z+XF2JrOas2q2y10i/qiysZPFfAPYq+H4b8wiAYW5rDhQDaUPjT
         d42v3ew4ggLNqug9LBbW+ejLofjy2RhJjjJOJ5Yn4l9X/FkQUSAPz2YOodF28oZGazXt
         E+gRQeAH4ktNGlBNx9tbpfa2GRxBOh+wjKcAxyZTyhdx58Cr4mDYDA21zSKM1zpLV3p2
         +v0xjbphLTFyPoLHLlKpVC/YVkAoBF0xd3f21tSPfsRcV578Aio8lgMLTsHwRUBPhFZ8
         x8yGM+yBAZzBo7THxy4nlbdY29SG6D5+To7zAh4+DXtEbdFfJTQM9YatkyE7WAjgGmT3
         xmDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=0vIpk2hTuboav/csV+AvXPd9VbWUOPpLMO6LH+weGUY=;
        fh=WTais5IwFr/xIY87YTqfHKCVUKJBpuifEtwwGM0E6GU=;
        b=rs0jerkcgwM6nTocD2RqUVYawhiFCBAEJtlxLLu7h+DFZx2zLRqomd7V1/wBupZ8K6
         M6gdwBCdx8fzv891rjr+Xwwm8In4eRdC+Fqbz8hrur9QW91dri6FvygJGVnk2sy9ymZX
         mcj6xHX+LdK5GvrHWHEcTDr81uLzFKeKctoZTPKWKCDw/YHXXMHbYrqnffHYoW/CfZd1
         1wOTPSzK2ZbVhjx/4ghsUELIuJ3MKetRcHg0yxJeikZxu8/pLgWhua0pApWz/nAAdWp5
         Qu7Os1+YOBFigCIriHZsn5ryGZ68ZA1iwY50O9gujZUYcHqmyV3P5A0VC98Iy6u5pKTx
         XjCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=A7PvQC43;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-706b4a49224sor11673515b3a.10.2024.07.03.20.12.29
        (Google Transport Security);
        Wed, 03 Jul 2024 20:12:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=A7PvQC43;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720062749; x=1720667549; darn=linaro.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vIpk2hTuboav/csV+AvXPd9VbWUOPpLMO6LH+weGUY=;
        b=A7PvQC43Gy/oHHbqeh9hcJgnAzu2kPpIX8M0/JDR6g9pu8wczw3Nq6KMzgG5wosAz0
         pqYtfUKfMygnF3crjerLMveK4K4IG9eUY4QQJyFuCZ8rSGs7KWwQyvngsdRhHQtPTuxk
         mKLwLS3QEhydImTsCLn5zEJsQ48YYm86JgL3qDy3U9fkpOuMMK9cPUDvYPDHMCmTHQE7
         tpRF2eV7aXGVOduWSRC9Cxr6kdg4PsOqOIUSo4HLDP6NCp0aSO8nENpQSKhaxbX9aM+1
         LEVZyCR8uUQ3oWC7RPRi2ucZFxtqXB/5q6MYk8KjhjAUC5vPFrG5qzjzYCaViDuDa6D1
         RLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720062749; x=1720667549;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0vIpk2hTuboav/csV+AvXPd9VbWUOPpLMO6LH+weGUY=;
        b=DQobmWHUK2Go3bezpIER4/GEUSI+nHo3o/NhNJYmJ/S2Q0hTjgQ/eZGbsTebcU6Mw8
         Kel6raE1Yl5D5wJkPHaHhcmx76kqMKd1wCcH+2k3p/AHhNOFV+oF3sEhRsOryqBXcDQR
         PCaZxhdquOFSXaNQ/tFy4Ry8pWysih79EBHfmZwKevVgjDpoZNbVPZzq6PBLvPbXSBqB
         kc/nocSS8PaZfW+ivpwMhtmcGXBFbKqbDfa5VU4Lak9o7p0IzOqfDZ3MLnyzyiHxYoPv
         k8QSk4yf+P/HKU7Fwcesvtv0ywcjao/vrgEuvgQTdAdpKpLBvqp8ytyYWjV65/jmC8us
         WI7w==
X-Forwarded-Encrypted: i=1; AJvYcCVCRFvLSwb3ICUTAWJWEj//PIN3BvMwy014weWznAPyugAdGurKii/xa50VDV8iceqGMTYMNLB0YTi5WQ3chp17c0v/m1jfuOEHn4vIwAsOmrXyhUySOsZWJ8q5QYxv5Ia7C9PErSWdq2I3MyLIVSEvG7lHfuPWi+ex2dSbsSsHSXZAKY6Bf4U8Aj7eNIsJTKEjcJED33Y41FcekfngDKIfD0IxQCv6pGbkKPM=
X-Gm-Message-State: AOJu0Yww/pRAE5n4rBA2M01Qinc1ZdpSR/EnyJ858ORNmWO8FibsmA0u
	qRfzr8GPZamwOFlKr+9V4S++DpVOS5z/EgGWgrXS4IaQ3rdF9K1Q
X-Google-Smtp-Source: AGHT+IFBChDeP18JaYtspV3IbogoLdvOrmlHkU1d3RmljlmXg2SJagSablEjptJiZu/gdMspX721zg==
X-Received: by 2002:a05:6a00:2401:b0:705:c273:d19 with SMTP id d2e1a72fcca58-70b00946d36mr417167b3a.12.1720062748748;
        Wed, 03 Jul 2024 20:12:28 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([1.146.95.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70af8097796sm879452b3a.84.2024.07.03.20.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 20:12:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jul 2024 13:12:09 +1000
Message-Id: <D2GFCLH11HGJ.1IJGANHQ9ZQRL@gmail.com>
To: "Salil Mehta" <salil.mehta@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <mst@redhat.com>
Cc: <maz@kernel.org>, <jean-philippe@linaro.org>,
 <jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
 <philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
 <ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
 <gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
 <alex.bennee@linaro.org>, <harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <shahuang@redhat.com>, <zhao1.liu@intel.com>,
 <linuxarm@huawei.com>
Subject: Re: [PATCH RFC V3 02/29] cpu-common: Add common CPU utility for
 possible vCPUs
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.17.0
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-3-salil.mehta@huawei.com>
In-Reply-To: <20240613233639.202896-3-salil.mehta@huawei.com>
X-TUID: 5/XPGQtqEXew

On Fri Jun 14, 2024 at 9:36 AM AEST, Salil Mehta wrote:

[...]

> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 60b160d0b4..60b4778da9 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h

[...]

> +/**
> + * qemu_get_cpu_archid:
> + * @cpu_index: possible vCPU for which arch-id needs to be retreived
> + *
> + * Fetches the vCPU arch-id from the present possible vCPUs.
> + *
> + * Returns: arch-id of the possible vCPU
> + */
> +uint64_t qemu_get_cpu_archid(int cpu_index);

Not sure if blind... I can't see where this is used.

I'd be interested to see why it needs to be in non-arch code,
presumably it's only relevant to arch specific code. I'm
guessing ACPI needs it, but then could it be put into some
ACPI state or helper?

Thanks,
Nick
