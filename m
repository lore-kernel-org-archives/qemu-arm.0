Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp6567375njk;
        Fri, 27 Dec 2024 12:42:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVMyNt+Q60x3HXy0bV5aXvW5DmhfHZYHHMjpXkdZLdZsKVzS9z0BrcWC2wRb8mKrc45Kj5eLhdLG2Bulw==@linaro.org
X-Google-Smtp-Source: AGHT+IF8NVvRIfmlzqusQDkDkc5Ok7kiBBOIwZMcUCl+J+G2pvPXu32WsZOXyxm7xpL1JCd5pdEf
X-Received: by 2002:ac8:588f:0:b0:461:9d9:15c2 with SMTP id d75a77b69052e-46a4a8b7e5fmr454281241cf.1.1735332120487;
        Fri, 27 Dec 2024 12:42:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735332120; cv=none;
        d=google.com; s=arc-20240605;
        b=II6p0hs8AUeZcC6jf2HYkcsNzRTot3YieCId6uB+2tp3RxDHmBAq3b0N0oCJFvB3yB
         uYqYJWa5CTfgeI0oriCQWKlRfofhfs9Meu21TqoHosZh3esWIisnpTVoIM2+o+BCg5kE
         BV5oEXHKGnuaz3tY7+/KoPrQ3lYiOlIR2JZA3CfVzH+IP1Mk+Qv1Bnmmka3EFC+LMZ6M
         Pjf2WYwtgXr3NIeRAWlGiqAeOZjVPBpdoxXRliNXzTbKp1t8Lo77ZZmp68eeE/Z4LwVW
         TTqZXrhnIZn0K5SozuGSS81+Plshvu0qv4rL/GnxCr6tKYrwYexQWIOXXnkf1DSDOEhu
         PfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=k1g0yMNc8Ofwicq9K7tYxRbqKa39rJocmuDDcoWvfeQ=;
        fh=TvGwTk3vuqOBkIsmUfR62WjgRtS6JRah3JiUwL2sIzA=;
        b=hDdN/JEPYV8+WSf3j6G/oMf9iqxQYcbHIA7xgs6H3D8pA6DSfmLTi4xn7rFoWezkZ1
         2MUdWT4mFXqYi1Vim7jRwm8jYHRgjKuUMuLnL6Y/btuqZFNMHpeK4M6H3umDpw0mA8d0
         wW+mbasoPi2Ot8SSMiNsJExyvOhswtnjDDQ/bCVjJZTxkdfY9TGCH61OKfIFeSdCQ225
         gG5RN2B2kocendQdNH6GrsUPeYNZ8YPgntHOh3iHQaGbwNIdssAqScUYoflg0nIICNnm
         6tE/KeP53hJrWj7gdn1HbCI0CBDoeDR665xyh8rUQutkFKHFajxY5VQKipfag4FgMEUT
         yvhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VETewpOH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3e688a58si204339381cf.142.2024.12.27.12.42.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Dec 2024 12:42:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VETewpOH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tRH9U-0001Hp-ID; Fri, 27 Dec 2024 15:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tRH9T-0001HZ-AF
 for qemu-arm@nongnu.org; Fri, 27 Dec 2024 15:41:43 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tRH9R-0007h6-K0
 for qemu-arm@nongnu.org; Fri, 27 Dec 2024 15:41:43 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso48978355e9.0
 for <qemu-arm@nongnu.org>; Fri, 27 Dec 2024 12:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735332099; x=1735936899; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k1g0yMNc8Ofwicq9K7tYxRbqKa39rJocmuDDcoWvfeQ=;
 b=VETewpOH6SwgvfHw4buJDr1ndRdanDLzmA0n01P7kSBpd9UOLUJ/6o2IQ2sk3sPZ3+
 hS+NRPch34iDCaA2CqfbSW67gmVLPR+Vi9WtYnzNLTgwd5VSmlJqqXCB3wGG5d5F7uCU
 PvD1diatSe4dZTAcTWpQmAj8iYSN7FLkS3p1jvgkDB0FInFgW+As3doRRLeBDoM/e2XQ
 ZXgIDK4F51XbtWW+9pUN+wY9mHMa/aKUF5ZazoUG8oKPhw+MZQeh21AShrtw7rnGxszr
 sBPFRwHDvov4WLwD6xkCYfQAa2IU5WUuhIUosgRwlj9aAo33o3kyb9E2MqEk71f4vy2x
 I+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735332099; x=1735936899;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k1g0yMNc8Ofwicq9K7tYxRbqKa39rJocmuDDcoWvfeQ=;
 b=RaJHo0Ifv6CTcUiuogm4Hn/Rj6DTilFF5Q6zreloydSwj3T5yuTQIeercv8CyW/Y0i
 7XRURtWQ9kSs0B8GokFNal5PHOoyVefEX/mHRrEVmhArvJraFqVZ9OZ5UbtzHV3ILghf
 0OeH57RzyrKyuUA6/HXg4sPWa/S6BbMQ2C6RSsMyFJHZkjx7DsxrwFs4k1QReqYmxjXD
 nHr/uRHCgs6+POjzCQXbiKvj454eSbBNx+4LHIr00iQ2Feq4Jv+1noJ8SkeVH6iclh3C
 u++nF3SivBaxmqbQrOIWVzkLf2L+2o500rKnPD1ZsUR/5QIMhXx1LodIZ4S6tUfPNJUD
 tdEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbwIqmEWQ0vmimbpWUirAZGz7i0MTONwEsuSqtm0ormgRAErsNz8RVQuYAV5Viyq3YO2Ex2LWjgA==@nongnu.org
X-Gm-Message-State: AOJu0Yy7JnMFvBWnVCArMuh9Gunx19tEAjUlNGfQgrGd1WnJZzhhQLp+
 uh9jK6Df2p0sXLyZSMyOZc046KM7w3E3z9E7++GGyT9DGJi+UyeVD7is29E4Qp0=
X-Gm-Gg: ASbGncspf7cnkE61pi9J99MVr3kI/Bj5vQsv9L1DdlEwG3z6Rk32hN9DZs/g/Ry5/O7
 qcypMUshvi7E0H4wp+EG6OZupHIBmcRq1OyrAR8m6Eh+ngknfiqJPsAa4YXWXRV/tAP6YmrzIiq
 /fwuMZ5qBpZm3Awn8WSL4xnkdcqxIVKTzAkEWZ07bbApgyHqX6WUk5D13C5WkfBxwv5THUoadqn
 JHOMVYXM++oSXmmOpNJu7NMwbPub9OyBx5qh5dQvvRDwcni0DGMRJu6XJvnwiNe06nTvTEv+Jc7
 D9YAZdLXxLXB47D7IjBl9dWE
X-Received: by 2002:a05:6000:2c3:b0:385:df73:2f3a with SMTP id
 ffacd0b85a97d-38a221fa8eemr22241467f8f.14.1735332099400; 
 Fri, 27 Dec 2024 12:41:39 -0800 (PST)
Received: from [192.168.69.103] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8292f4sm23399878f8f.3.2024.12.27.12.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Dec 2024 12:41:38 -0800 (PST)
Message-ID: <49188838-5e52-4d9e-9c50-933e62678163@linaro.org>
Date: Fri, 27 Dec 2024 21:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 14/14] hw/vmapple/vmapple: Add vmapple machine type
To: Phil Dennis-Jordan <phil@philjordan.eu>
Cc: qemu-devel@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 shorne@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, akihiko.odaki@daynix.com,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
References: <20241223221645.29911-1-phil@philjordan.eu>
 <20241223221645.29911-15-phil@philjordan.eu>
 <1211286e-9211-4d89-9021-f353169af6ad@linaro.org>
 <CAAibmn0q6cBc41J5mABd4bkUEo6pS0MhL8DU8fPfygDvjLSPBQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAAibmn0q6cBc41J5mABd4bkUEo6pS0MhL8DU8fPfygDvjLSPBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: JjG3AO20nU0C

On 27/12/24 21:12, Phil Dennis-Jordan wrote:

>      > diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
>      > index bcd1be63e3..6a4c4a7fa2 100644
>      > --- a/hw/vmapple/Kconfig
>      > +++ b/hw/vmapple/Kconfig
>      > @@ -10,3 +10,23 @@ config VMAPPLE_CFG
>      >   config VMAPPLE_VIRTIO_BLK
>      >       bool
>      >
>      > +config VMAPPLE
>      > +    bool
>      > +    depends on ARM
>      > +    depends on HVF
>      > +    default y if ARM
>      > +    imply PCI_DEVICES
>      > +    select ARM_GIC
> 
>     Hmmm I'm getting ...:
> 
>     qemu-system-aarch64: unknown type 'arm-gicv3'
> 
>      > +    select PLATFORM_BUS
>      > +    select PCI_EXPRESS
>      > +    select PCI_EXPRESS_GENERIC_BRIDGE
>      > +    select PL011 # UART
>      > +    select PL031 # RTC
>      > +    select PL061 # GPIO
>      > +    select GPIO_PWR
>      > +    select PVPANIC_MMIO
>      > +    select VMAPPLE_AES
>      > +    select VMAPPLE_BDIF
>      > +    select VMAPPLE_CFG
>      > +    select MAC_PVG_MMIO
>      > +    select VMAPPLE_VIRTIO_BLK
> 
> 
>      > +static void create_gic(VMAppleMachineState *vms, MemoryRegion *mem)
>      > +{
>      > +    MachineState *ms = MACHINE(vms);
>      > +    /* We create a standalone GIC */
>      > +    SysBusDevice *gicbusdev;
>      > +    QList *redist_region_count;
>      > +    int i;
>      > +    unsigned int smp_cpus = ms->smp.cpus;
>      > +
>      > +    vms->gic = qdev_new(gicv3_class_name());
> 
>     ... I suppose due to this call ^^^.
> 
>     $ git grep arm-gicv3
>     hw/intc/arm_gicv3_kvm.c:45:#define TYPE_KVM_ARM_GICV3 "kvm-arm-gicv3"
>     include/hw/intc/arm_gicv3.h:18:#define TYPE_ARM_GICV3 "arm-gicv3"
>     $ git grep TYPE_ARM_GICV3
>     hw/intc/arm_gicv3.c:466:    .name = TYPE_ARM_GICV3,
>     $ git grep -FW arm_gicv3.c
>     hw/intc/meson.build=9=system_ss.add(when: 'CONFIG_ARM_GICV3_TCG',
>     if_true: files(
>     hw/intc/meson.build:10:  'arm_gicv3.c',
>     ...
> 
> 
> Ahhh, good catch! I suppose this is with —disable-tcg (or equivalent)

Yes, this is how I test HVF.

> 
> 
>     I think commit a8a5546798c ("hw/intc/arm_gicv3: Introduce
>     CONFIG_ARM_GIC_TCG Kconfig selector") is invalid as being
>     too restrictive.
> 
>     I can go a bit further with these changes on top (ignoring
>     renaming ARM_GICV3_TCG -> ARM_GICV3):
> 
> 
>     -- >8 --
>     diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
>     index dd405bdb5d2..9e06c05b449 100644
>     --- a/hw/intc/Kconfig
>     +++ b/hw/intc/Kconfig
>     @@ -26 +26 @@ config ARM_GIC
>     -    select ARM_GICV3_TCG if TCG
>     +    select ARM_GICV3_TCG if TCG || HVF
>     @@ -32 +32 @@ config ARM_GICV3_TCG
>     -    depends on ARM_GIC && TCG
>     +    depends on ARM_GIC && (TCG || HVF)

Now implemented as [*]:
https://lore.kernel.org/qemu-devel/20241227202435.48055-1-philmd@linaro.org/

>     diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
>     index 6a4c4a7fa2e..374a89f6a8f 100644
>     --- a/hw/vmapple/Kconfig
>     +++ b/hw/vmapple/Kconfig
>     @@ -19 +19 @@ config VMAPPLE
>     -    select ARM_GIC
>     +    select ARM_GICV3_TCG
> 
> 
> Is this last part necessary/advisable? It would seem like the above 
> changes in hw/intc/Kconfig should make ARM_GIC work too?
> (The PVG dependency means we currently can’t support anything other than 
> macOS host systems and thus HVF or theoretically TCG anyway, but if QEMU 
> gained support for the HVF-provided GIC implementation, we’d need to 
> change this line again.)

Hmm indeed we can skip it, but vmapple machine enforces rev=3:

>      > +    qdev_prop_set_uint32(vms->gic, "revision", 3);

So directly selecting ARM_GICV3 sounds more explicit to me.
The diff is now (on top of [*]):

      -    select ARM_GIC
      +    select ARM_GICV3

WDYT?
