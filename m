Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3477027lfq;
        Mon, 28 Sep 2020 02:36:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGylx9/BARjezPlkKzOm/6uzwhUg1r7GpF4m6SEbHGeclIb+/PNnMBemfa3xgUPDU88yAx
X-Received: by 2002:a05:620a:f85:: with SMTP id b5mr507520qkn.239.1601285776422;
        Mon, 28 Sep 2020 02:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601285776; cv=none;
        d=google.com; s=arc-20160816;
        b=pbbc7xLyw9NfGrdCDcXraq1N8+naGasL+y6MLGPIMm1sp/BuUCaeEj9Dlt54PNVUQZ
         QLqTpqaxFClm9ygaOs2oZOjQBeq7wEoBT84EytP97uu3l7Ahw4o9nVuqq8gNTuZtIZF3
         3p6WudwsCni/TPvSikjGShBHiIQ8AqUa4nJyl5LWLZJDujSlNwAiXxrIgsbwdhbhUz7L
         GNqCjMOSCGpSE2RGCvS1ekAPXBUAYZ2tKRe5gppOICJv5oYYoIc/Pw9vP1IA1kpOUQQp
         u3n43+FfF6Sj6oGO7JwWY0RPGyIXgw7oNZa1YaNV104PGAgw+fAno4Jj1QQVzYK3exmx
         pnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=ynyAuloBqMxpWXLnS0x1CRYgjLxv7glQL157MRYGbaQ=;
        b=SOR9NAsLVtFM/9gUHoYD93oJsRcx/Kl6nIlydHmdlq/ZtMa4jMmXwwZsQQ0KumVoUM
         bTfPJpkPhlm6Swqc45d74WZJsAjZ/5b1LsilpprvM1hqZn4I/CWOQsLKbpwkoic1djkp
         vzyqKcpgBzqJC1VFfRCD1NiijvRKJSpr7GC9XUzvczMi/T1V/HWBXHp7m+H5pgMi6lnY
         NJNBpkJ4Gku+B21SLulwjVJeWjA0j0fxt8WR/+nAb2CJX5oqtQ3CTHI3ypJvP/811X+h
         E4CsXUKQ+i9LDcZqZL8a5WiCWuk6e/obeor7W7jBxdmr7oW9PRGy5vEGw5wzLws2eVxo
         aSGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=NOm68y4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si4836403qvn.30.2020.09.28.02.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 02:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=NOm68y4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMpZu-0005b3-69
	for alex.bennee@linaro.org; Mon, 28 Sep 2020 05:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kMpZe-0005ak-4b
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 05:35:58 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:39842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kMpZc-00052S-17
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 05:35:57 -0400
Received: by mail-wm1-x344.google.com with SMTP id b79so399327wmb.4
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2020 02:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ynyAuloBqMxpWXLnS0x1CRYgjLxv7glQL157MRYGbaQ=;
 b=NOm68y4GdOW95blTIQOEA3PlCVuKuVXVjrKBDXAbxFjkC7fgtvoxvgRK2DeuGk3dJx
 vKJcauN1XSCD7BLZv/H4dlw2UQ8Zqpm0kx5m5/tk7RC31JkmbYBhulp372x7e4fxXqSA
 D1BiAS9UHDx9UPtoIb17zkfcyWniYZOf1QA5dmRtof6VG3Z/ueIkcRBoCs+ZNjz0R8zk
 oP343K+HiO46/LmGCESPKE69Y2+a1xF+ebx884SU8lYvtSbrKb02bbUWG588CtHMIyxH
 KieOIFuPzAJ8p7WY5moIx163tHSxHHEF/GTu5vNjpNMmkdHCVdo7VP0LwKEYXvEwMSNM
 syBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ynyAuloBqMxpWXLnS0x1CRYgjLxv7glQL157MRYGbaQ=;
 b=XlVzZUoBqlTHnpq2sGaWLDQ1vrwT/yi6h/TeGyCdD5ss/sllShlJ7JYfOslJT3BlRN
 bS29BrO/ZBhRq2u4f8xAnJLZut4k8lMETG71/4nMRJBcC9Wn8vJCEa6rwE5GiB3oGsGb
 KetVl4jMaP/rKHwz7dcj2QZXm9Y/MkxvAdbiU4wNf8dZVVic0vyOmjFejyt5sAF475Kh
 6ivdai1ICV7sHQdXmzQh4/TgHRoKFfltGM/Tf7w4MlP+ZsfAk51AaT05CIkhj46JMO0f
 GyY3EkkYQoFVrfQPELBBpC3ne5gL/vPNN4xHRbMqmsYuzrQmkHiKbdSZ1lRIzTgfZxby
 3OHA==
X-Gm-Message-State: AOAM530yN1SUK++DviFkaCytnqXUMtOqgzZ4+FK9nTEli05nuRKD6NTY
 p6XMW3W6Fu5pitd1X2MezBwwmQ==
X-Received: by 2002:a7b:c090:: with SMTP id r16mr734026wmh.56.1601285753984;
 Mon, 28 Sep 2020 02:35:53 -0700 (PDT)
Received: from xora-monster ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id d13sm672886wrp.44.2020.09.28.02.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 02:35:53 -0700 (PDT)
Date: Mon, 28 Sep 2020 10:35:50 +0100
From: Graeme Gregory <graeme@nuviainc.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/arm/sbsa-ref : Fix SMMUv3 Initialisation
Message-ID: <20200928093550.epbudrvdk2v47bct@xora-monster>
References: <20200925133902.28349-1-graeme@nuviainc.com>
 <f67b75fe-c5ce-8b95-e19b-fc4ce2217b31@redhat.com>
 <e548848c-75ac-e82e-f40d-7c1ae70a6e02@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e548848c-75ac-e82e-f40d-7c1ae70a6e02@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=graeme@nuviainc.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, jamie@nuviainc.com, rad@semihalf.com,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 leif@nuviainc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iUF2sqImcTT/

On Sat, Sep 26, 2020 at 09:45:24AM +0200, Philippe Mathieu-Daudé wrote:
> Hi Gregory,
> 
> On 9/25/20 4:00 PM, Auger Eric wrote:
> > Hi Gregory,
> > 
> > On 9/25/20 3:39 PM, Graeme Gregory wrote:
> >> SMMUv3 has an error in previous patch where a i was transposed to a 1
> >> meaning interrupts would not have been correctly assigned to the SMMUv3
> >> instance.
> 
> This is a first issue, fixing 48ba18e6d3f3.
> 
> >>
> >> The code also contained an error in that the IRQs were never allocated
> >> in the irqmap.
> 
> This is another issue, not well explained. IIUC IRQs *are* allocated as
> IRQ #0, right?
> 
> This fixes commit e9fdf453240 ("hw/arm: Add arm SBSA reference machine,
> devices part"). Can you split this in another patch please? Eventually
> Cc'ing qemu-stable@nongnu.org as suggested by Peter.
> 

Ok I will split and issue v2 ASAP

Thanks

Graeme

> >>
> >> Fixes: 48ba18e6d3f3 ("hw/arm/sbsa-ref: Simplify by moving the gic in the machine state")
> >> Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > 
> > Thanks
> > 
> > Eric
> > 
> >> ---
> >>  hw/arm/sbsa-ref.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> >> index 257ada9425..9109fb58be 100644
> >> --- a/hw/arm/sbsa-ref.c
> >> +++ b/hw/arm/sbsa-ref.c
> >> @@ -138,6 +138,7 @@ static const int sbsa_ref_irqmap[] = {
> >>      [SBSA_SECURE_UART_MM] = 9,
> >>      [SBSA_AHCI] = 10,
> >>      [SBSA_EHCI] = 11,
> >> +    [SBSA_SMMU] = 12, /* ... to 15 */
> >>  };
> >>  
> >>  static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
> >> @@ -530,7 +531,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
> >>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> >>      for (i = 0; i < NUM_SMMU_IRQS; i++) {
> >>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
> >> -                           qdev_get_gpio_in(sms->gic, irq + 1));
> >> +                           qdev_get_gpio_in(sms->gic, irq + i));
> 
> BTW this fix is already in Peter's queue:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg732819.html
> 
> Thanks,
> 
> Phil.
> 
> >>      }
> >>  }
> >>  
> >>
> > 
> 
