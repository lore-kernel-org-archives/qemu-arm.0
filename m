Received: by 2002:a17:907:686:b0:a6f:1bf6:7fc1 with SMTP id wn6csp574461ejb;
        Mon, 10 Jun 2024 03:26:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlNIeMA9fx06b+AlKhPK04tohSJtcYSQKPX3a7ANqxZrFNmb14OZj9fagBbFjlKOsXv/cJ9w6Ut1NkE7J0ytOB2e0PcrkX
X-Google-Smtp-Source: AGHT+IEEYOa174u53aH/nWnNzLITOxC0mfHTEKrgB5p+6WCcGstyimD6yPWQC+N/GDErkccMwokb
X-Received: by 2002:a05:620a:3941:b0:795:233c:6985 with SMTP id af79cd13be357-7953c2d326dmr1106784885a.4.1718015196201;
        Mon, 10 Jun 2024 03:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718015196; cv=none;
        d=google.com; s=arc-20160816;
        b=MAktcWh3lmepKfsnCnF9hNUbck+YOxQeHe5D4kG9j6V2T/DRdL6zTLh2t0uSytkz4N
         chyGAGSAk/7p4Fsz9N8kIpWN4tQ70UmFe8TbGUSGWZkbl1PJhzFVs0BWI58sc52/2po/
         oPHnwVnqx/gOUHhvjpUuG/pgcJTejh7u13tCZdIVPnZhZO5WQN6LX8pE8y+/kYwOTQrr
         AwBbsokHh4fMLEXo8GYFmNKTKIwqOdKEmv8Zbxx6FIrRyfYPK7lVV4UE5qEqUPtl5MCQ
         IHvpUZaFQvQNJIs1Ps6UawGe3ged4+Zfg+dFnDpmarN/oQfig4s+GVVjxXWTok4ZQ7yY
         1wYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=B+0S2S3y/CMnhCnf/lsuxsN0Bi/akVzrpyE/1Oik1Ds=;
        fh=2gnJje/I5ZDHeQgQUxPjo4l6feaXR2VccC5Y0FhK7e0=;
        b=jekO+a90z0EpirunRgByRtDM8yEiLtdHsKsXec+cyO6Nhtr6FveoKoDg+Bq5dmMbcH
         SltrHDJUZbREm2lIiO2TL+xKZKdrD9QXNjfgAkGTiEud02Z4oun5d3JIRBBM/6gOcsF8
         hudrWzI/Q5dnP/g+jWkPi+JcwoXW5bvsmRp1W0fkFPWxeP9rsHwbX5smhD4kMEG54y44
         icNFRerC1z8BHGcX6UH3cZIanJJjdT45MJHF8uROHJxaFEc/kkfNIDZP2VVmUyykk15Z
         dups7H2TfkF3kphVVoD8XPec9D3myApXlfSj25MCwcQ2Lr4JuRX6eVjFa/5B+djmURpU
         AWyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rPSctzwC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7953333fbd4si992125685a.616.2024.06.10.03.26.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2024 03:26:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rPSctzwC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sGcER-0006SV-NR; Mon, 10 Jun 2024 06:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sGcEP-0006PV-AZ
 for qemu-arm@nongnu.org; Mon, 10 Jun 2024 06:26:29 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sGcEN-0006RV-FP
 for qemu-arm@nongnu.org; Mon, 10 Jun 2024 06:26:29 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57c7440876bso1788835a12.0
 for <qemu-arm@nongnu.org>; Mon, 10 Jun 2024 03:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718015185; x=1718619985; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B+0S2S3y/CMnhCnf/lsuxsN0Bi/akVzrpyE/1Oik1Ds=;
 b=rPSctzwCaMHm2w1FwGC77gd5hXgrks+gUQK4XBLHZqC8sUudbyYlmRUzUjtWz5ZaMa
 ES3raOtJPJZH+vFc1GPca5AIUIKvWCSEMEG7x3KLLN1cDQ2o/gZN6PR1VOvpuEzX7k0q
 vsnagYq7Y6DyyELwMYVJkAMW2zGu3WrqQXS6Klla4tShmpR1Bq0DvG1UPLOUInvJx2Fn
 5trBwpDfWJthUSlQPK5oT9StIXave2aOugfql+egEhiFB6CoN9AAU3tsvmUy+tOAp38G
 Gm4wRbfjqnaq7eQqpV7WQfJz6qDUE4bXfy/pgHruSVw8GXf0uJPFXbiLCDwTCunjbI9u
 W0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718015185; x=1718619985;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B+0S2S3y/CMnhCnf/lsuxsN0Bi/akVzrpyE/1Oik1Ds=;
 b=MZkNif46Ol0u6zolMRgKeDZzuxJLdJfnb7mnCWBYg+q7iRtuvJpIxuZ19Shpos/lNi
 Zm6l1glA/UR8dIwKBHKEyD2kHX6dac8L9CB2SD7XPuWFEhz9XQLWxZ6z+OstKmQMviN+
 NkmTliOqDaE91ycLYdZ6eZiDu3SC25VpUevKZA6oIUyWaYRaQHxpCy3/4t75/eUbrjxj
 kfBbS/3Gl/fj6r0lRA1lwt+RMryikD62bBXMfHFGyOU3Ki3UqnU2QuAVhscOTiZcV6vI
 KyVKA0ZIcvBSc0IVoqOlCjyee19+qrhovls+3ybAuN0pU7x+y54QC5Y3ocWEc7Ve2/w5
 REww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfNdKWR51CocjV7ExDfWIEKwXhqomvj67MDr9kmThuoAi8/FjIiNKbmT7NhA58Waprb935WD+6i32/Wl37BU6qeN73
X-Gm-Message-State: AOJu0YyCNv/JcSEZef3GvuCp1mz/Zuy4Hp+3U7q+ecYvgTlyOxZzl5m6
 g0LRWQcVqCa9gWT9DNlxpQtr5/krTSLe6LRDruu4x78qccQo0MEdhzZraMtNGg7aTYLPUTXqwai
 oV3OiYX/lFusp2p0Ru4tw7QuLYeLbmExnjrGiMGHyApWddxyE
X-Received: by 2002:a50:8d1e:0:b0:57c:74b1:bf51 with SMTP id
 4fb4d7f45d1cf-57c74b1bfb2mr3461690a12.20.1718015185260; Mon, 10 Jun 2024
 03:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240610052906.4432-1-sebastian.huber@embedded-brains.de>
In-Reply-To: <20240610052906.4432-1-sebastian.huber@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jun 2024 11:26:14 +0100
Message-ID: <CAFEAcA_ixDoJWMvDgkU++kaF4D51YtQFbEX8joexVCZ-J0Xndw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xilinx_zynq: Fix IRQ/FIQ routing
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: Bhx43OBtzPj6

On Mon, 10 Jun 2024 at 06:29, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
>
> Fix the system bus interrupt line to CPU core assignment.
>
> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> ---
>  hw/arm/xilinx_zynq.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 7f7a3d23fb..c79661bbc1 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -252,10 +252,11 @@ static void zynq_init(MachineState *machine)
>      zynq_binfo.gic_cpu_if_addr = MPCORE_PERIPHBASE + 0x100;
>      sysbus_create_varargs("l2x0", MPCORE_PERIPHBASE + 0x2000, NULL);
>      for (n = 0; n < smp_cpus; n++) {
> +        /* See "hw/intc/arm_gic.h" for the IRQ line association */
>          DeviceState *cpudev = DEVICE(zynq_machine->cpu[n]);
> -        sysbus_connect_irq(busdev, (2 * n) + 0,
> +        sysbus_connect_irq(busdev, n,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
> -        sysbus_connect_irq(busdev, (2 * n) + 1,
> +        sysbus_connect_irq(busdev, smp_cpus + n,
>                             qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
>      }


Applied to target-arm.next, thanks.

-- PMM
