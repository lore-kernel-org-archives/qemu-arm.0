Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp797840njc;
        Fri, 9 Aug 2024 02:01:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSDMDE9fe3rfGEyYoYIuBFcYB6lvOypKLBug/W9y+jktmBCThWj/xAU3eyr90tAjc47IaZ7EGK228iYNm5PWsO2l5oG8km
X-Google-Smtp-Source: AGHT+IE39mBCtNTxq8S/3jHLN6NLERKbGsn6/w7nXHcsgN9VZsEav87kR8C3WYWwZhUEjS+5Rpb0
X-Received: by 2002:a05:6122:2790:b0:4ef:6865:8ffd with SMTP id 71dfb90a1353d-4f912eb0b00mr975053e0c.10.1723194072397;
        Fri, 09 Aug 2024 02:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723194072; cv=none;
        d=google.com; s=arc-20160816;
        b=wHU0xPufgS5F8DfaHu6XFvWHHPIWoFwaEMntzttuLz8HR7UOnQSP2BJuSfLisR/69F
         RNlU2aivmhjjX+C0oYLtXAdFSDw4Kw3KKcbryXbi4Q3ekTVpPVTVHRCvcgRYCeHTJPhc
         F9OrdNuEZMATvftB/oiIkrHIexqFFGaiNV0/Kn7jMFIpQ9mBf9bYZ1RaXeI11BtNmmGZ
         rTxsZ0aNvLyIQbNVoYTLwPdzyObO+7U2Imb3bqfDDpWOauRfUdv5BJETOcCRJUvSqV5U
         JZjGob2ywRDVCRoairqvtr6qbDPbmC6dk8UxhwfTDbD4e17lE+uvS1MpRxBSA45ZmxxA
         aVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wdNs2+O9KQW+Tn/V+l6owBLuH0Fbvc2TS9Xg6LAqRd0=;
        fh=EKGjO1Nn9TnJ+6ivFYW2x9gtg1S+b3UtvD9oICEXIjE=;
        b=HuV+jxjwoeNgx/tgFvJsdtwnau1AzMACzKM2xr3ZsJHlXX6M+kJm83VzUrKRZl8ZdD
         LTiqMdSW68UKPlBKuR7ZjaBzefOfbJkIgNf5Z/5zY6wezypkuD1zfxb9X+gqGwXWqtIZ
         K1XjOnIJOtQF081tcnXU0e4xzIsV++LsOONENxRTW+nKlyCO/iYQkj+O5gl2fPFHxPqO
         Y93VMG7VllBHmlvKT+MTIn+hk7o1NcW5OKNMZI90o/QJr9sU9nz7tvR8K8K6EFLH1PPV
         MarC4oAYmyR6Zbz00TTgLQS2bFXSYzHF5zhcuNlId+bdgoZ5D3zXJVFPrEH3K3TLaMaF
         fqcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nXcyl3po;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f8a1b0b357si3647991e0c.144.2024.08.09.02.01.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2024 02:01:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nXcyl3po;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1scLUZ-0000LB-UT; Fri, 09 Aug 2024 05:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1scLUX-0000F3-Ds
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 05:00:57 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1scLUV-0004tO-R4
 for qemu-arm@nongnu.org; Fri, 09 Aug 2024 05:00:57 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-368440b073bso1064865f8f.0
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2024 02:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723194053; x=1723798853; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wdNs2+O9KQW+Tn/V+l6owBLuH0Fbvc2TS9Xg6LAqRd0=;
 b=nXcyl3pom/WndOHHxVH/qORyM8jD5LLkrg4NIupqGRTOAUnFOrX0HgqCv4Hqm3iz+d
 84epSVBCxruMKDEF2OvML7rmECLKSsrA1hxeXqLeG3kWOX4qkL4eY7yKtpu6aNoI/NhP
 cltB2yf/9I7C1D3NL9rKaw04vVIdm/BvD0in2hju6JRJHQyto+YgjqBXwsofEWqBAeKy
 +rcINVbpuRCNIeyWNDlu7ssAdSFoKDEoOc0G/kEm4/RrTMw3i8ZkliU1hzS52WVpXtUE
 2ZyA3F8N+cGiF/PJGLy/Q5Luz//MiHKo+cgBby3TPSWX3euX7vFaiqqfdZqK8AYZ1uVI
 KA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723194053; x=1723798853;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wdNs2+O9KQW+Tn/V+l6owBLuH0Fbvc2TS9Xg6LAqRd0=;
 b=phC+lIXRc3FcEX3pCdNhXM1hBiqllqclDhg4EEvUaZQhG4yBrgftzRnDFkDz+LimSe
 C7aqwQj017S7o4vYrPjHIVBXNNhIfbGmqPluRY03Rogak49UmNrsXOal+U5xLx74GAAz
 bx9RwSk3IY8LM3rdFvahcxRFFnWHAPDhFlt/vOcLRnaiDfVaXVlPvH48CuIAo8/LwZZ9
 U2vir0UsB5/3Gbq2+7Jx4kLwCyrVkP0d6N4l6MK1qpaaQwlr/Zz+lNg//x5+Ol65S8A4
 Uh7QsaLXFfzwYzx3Waei+HcKfOYx3aF38tWTHB93If2/ew5W+lt6ZyF1FltdDa2wMeeZ
 w6NQ==
X-Gm-Message-State: AOJu0YxnP2SRgxh94XuLBv0+6AjjCy4YqDNTPqqxOfvvxu7sbqQNCFKd
 eUYpvdohVh4C5XGZ8Yp8fh3M5+sK9xmtqx7IvK2s5j0+M7YM57ilYEAHI8+H4274y6H2QZOcnY6
 mkjgHwjJ8RCLwbxMjTibqnBVv5nhRBHVa40K5Gg==
X-Received: by 2002:a5d:6691:0:b0:368:6bb:f79e with SMTP id
 ffacd0b85a97d-36d6829eadbmr831839f8f.4.1723194053252; Fri, 09 Aug 2024
 02:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240809035134.699830-1-gshan@redhat.com>
 <20240809035134.699830-2-gshan@redhat.com>
In-Reply-To: <20240809035134.699830-2-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Aug 2024 10:00:42 +0100
Message-ID: <CAFEAcA_KWo2fkiFJ4CrznNkti7bdp_QTXWEdc2nJtd-a6=SPpw@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/arm/virt: hide virt_kvm_type() on !CONFIG_KVM
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com, 
 philmd@linaro.org, richard.henderson@linaro.org, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: CUMRtHqzm76r

On Fri, 9 Aug 2024 at 04:52, Gavin Shan <gshan@redhat.com> wrote:
>
> virt_kvm_type() and mc->kvm_type() are only needed when CONFIG_KVM
> is enabled. It's reasonable to hide them when CONFIG_KVM is disabled.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 719e83e6a1..83be57db37 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2991,6 +2991,7 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>   * for arm64 kvm_type [7-0] encodes the requested number of bits
>   * in the IPA address space
>   */
> +#ifdef CONFIG_KVM
>  static int virt_kvm_type(MachineState *ms, const char *type_str)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(ms);
> @@ -3025,6 +3026,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>       */
>      return fixed_ipa ? 0 : requested_pa_size;
>  }
> +#endif /* CONFIG_KVM */
>
>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>  {
> @@ -3084,7 +3086,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>  #endif
>      mc->valid_cpu_types = valid_cpu_types;
>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
> +#ifdef CONFIG_KVM
>      mc->kvm_type = virt_kvm_type;
> +#endif
>      assert(!mc->get_hotplug_handler);
>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>      hc->pre_plug = virt_machine_device_pre_plug_cb;

This adds extra ifdefs to the source code -- is there any
reason why we need them? If nothing goes wrong, I'd
prefer not to clutter the source with thme.

thanks
-- PMM
