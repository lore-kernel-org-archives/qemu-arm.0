Received: by 10.25.159.19 with SMTP id i19csp563348lfe;
        Sat, 6 Feb 2016 10:55:45 -0800 (PST)
X-Received: by 10.140.232.15 with SMTP id d15mr14311954qhc.87.1454784945714;
        Sat, 06 Feb 2016 10:55:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b93si22396524qgf.85.2016.02.06.10.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 10:55:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS81J-0005d5-A7
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 13:55:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS81H-0005cr-AW
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 13:55:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aS81E-0006mB-4L
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 13:55:43 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35573)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aS81D-0006m1-TB; Sat, 06 Feb 2016 13:55:40 -0500
Received: by mail-lf0-x244.google.com with SMTP id j99so3946652lfi.2;
	Sat, 06 Feb 2016 10:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=FiqpCNWdNZ5RvVd2WPJ4cXl9UQeIQZNO/yLOPVWV1Lc=;
	b=mFouqIU+/Z1t+5WGtVVCUQ3nNXc4toTAmD3rgHLH/xI/qWj8jLVX6ipsNwWfZFZOfI
	j+Ij8Fko4Z12JLU2gGylDdXf4hq2IKr0e6/q8bI2ZIFC2c3ALuQsEjCbUiMJsaCPgHiT
	W5xksbtDJ2p4E2Dj7LuKUJf+AAha+0liY7EyrWAa8epKbv1yL6OalHRfiQ9wG/Tx1Odv
	dIzPgfGxHQmF9n0B6vzb8YzcPK4f8CXeH5BiiJ3aikFp7YCz7JVrzVGpIK/kOuhpR8oA
	xTyumiqOAJJUjjsfHf8lNaN/BnzX0juQRzCJCj8WsNHjsbpDCIU+WDIjhJV0dNPX5hWN
	14lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=FiqpCNWdNZ5RvVd2WPJ4cXl9UQeIQZNO/yLOPVWV1Lc=;
	b=Ac3WXQlWsu8reOQVaO3nOYGLTH50z6ZfuPhx/Q3ClG3cjyapDEkv6J7uCMl3jvW0NH
	tFGI/0O3JgBz34xPdqBv/7e9OnomNIyguz1I7rVSWh3/GC4C2J7fMV2QrGxI027TAu1N
	zc6231RRdqQG6X/czw5kzMkO5NBS4CXwYN3MgVFjIqTergMOKEOa6d1p0RLmx1mEOPUd
	0NzpCahLdN0zopHRcXT1cIYa4qTQTnSH60vzyUslhB3V7hvXxN+IYYo3E+FreEmArTcq
	d+n+sPlEUKMXiUTi2w8ufeBVN2YInwarYKczmFv1LZ5dv90VrSTKPcCjuL8Fn++7CdPJ
	4FQQ==
X-Gm-Message-State: AG10YOT4K2rOanqfFKqCWXV92NRGlW2nr52b3a63eSdhQZwR3EG7qYXIHtxLFgK1yIT8FQ==
X-Received: by 10.25.139.6 with SMTP id n6mr7106739lfd.61.1454784939108;
	Sat, 06 Feb 2016 10:55:39 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	dt9sm2865546lbc.47.2016.02.06.10.55.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Feb 2016 10:55:38 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
	<1454506721-11843-8-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56B641A9.8020406@gmail.com>
Date: Sat, 6 Feb 2016 21:55:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454506721-11843-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 7/7] target-arm: Enable EL3 for
 Cortex-A53 and Cortex-A57
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jxXC359B6DzL

On 03.02.2016 16:38, Peter Maydell wrote:
> Enable EL3 support for our Cortex-A53 and Cortex-A57 CPU models.
> We have enough implemented now to be able to run real world code
> at least to some extent (I can boot ARM Trusted Firmware to the
> point where it pulls in OP-TEE and then falls over because it
> doesn't have a UEFI image it can chain to).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/cpu64.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
> index cc177bb..073677b5 100644
> --- a/target-arm/cpu64.c
> +++ b/target-arm/cpu64.c
> @@ -109,6 +109,7 @@ static void aarch64_a57_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
>      cpu->midr = 0x411fd070;
>      cpu->revidr = 0x00000000;
> @@ -161,6 +162,7 @@ static void aarch64_a53_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
>      cpu->midr = 0x410fd034;
>      cpu->revidr = 0x00000000;

