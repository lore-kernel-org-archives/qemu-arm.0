Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1086435ejv;
        Fri, 22 Mar 2024 03:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUE/T72z8awtFrSvmpqPAcXY+FLwhWzMTxNAxZKFmGOE6PkOIzzMNwagDNXXS+jn3HMndV/RTmFcBPqnEmnKDoASbEYBpdj
X-Google-Smtp-Source: AGHT+IE/qarp0yldJ+dihbqhdIZAzBW+GSk+Wqhg2n/OYDEuBP/Ka6+5Og0L/0hxP49QU/jWO/XK
X-Received: by 2002:a81:73d7:0:b0:610:3b7a:c17d with SMTP id o206-20020a8173d7000000b006103b7ac17dmr1769162ywc.6.1711105036587;
        Fri, 22 Mar 2024 03:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711105036; cv=none;
        d=google.com; s=arc-20160816;
        b=pKDz0OoyjKLXR7Ql2nQrOEXgnQshlZj/s/ByB83g+NJvetPAMcm3WJAxnqM5ddiIIM
         BsEw+RLG/3ZNK6LRzqfX0AaDtm+/67xDxO8EyCeWGLhQciB4gfDFoNWnKj5Ww+eZTzlh
         cpyp/lbPjEOLkNVTjxu4zfQK/vR2tQ6VSpqQIeezW7JbiMst3Q9AF1HipkUHuVVhqMrj
         y5DtpNjkNtR/Jfyut9vqRPbhzCUrJ3qaTq9yNwkGV1so8/lJXBkDyF7VjUpJhqv/Gg3V
         VV4ajYpCzGSbmLtpJz847e53h4zK5phYCPMEM6VBGkWO16eC/hon3o0/9Oi+o03zY2yD
         ZKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=83Wh1TAIllHiFRSTsiBmuzx5iyrrRJxfmDnBiDGpJlU=;
        fh=bRzcio0dlij2xMB7z0hjSbNg7getVIfeLbMFHaSITnI=;
        b=eTz+tKGpciwfSNcF8OdvSGzt59y5aeyfVk1eht0NETKmsOUV4jTRdfMQfZ1wy6RtHM
         y7j8VwBPcJaA/dN5XzEJpNuNnvTXtC+kOTEfnwK+pLNAPkSiq8H5mn1DbEAkwZnqz6Ey
         ExwKaAAAUVuIL4MHs++Uns7QVKzEZaywCKev4wr9CPX17nVQh6btLN0XENoUQfWkMqxj
         3fVR8ix1+0/VRRQ8Ev8NV1EE7kdWrVRZcW0NGga4IOlw6pUWPj2wvlnjHXl8WbbIFuA+
         o+qtycdqMF3Iv9aq5Hw7De7mQk0IPevQjQDr8QNPzmSgCB92g37+WqC6bPy8F5otHs86
         9Kvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KYOl40Jh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9-20020a05620a220900b00789ebdb2ef5si633679qkh.288.2024.03.22.03.57.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2024 03:57:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KYOl40Jh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnca2-00024C-Ty; Fri, 22 Mar 2024 06:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnca2-00023q-2K
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 06:56:58 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnca0-0006BY-IX
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 06:56:57 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56bcb9640bbso2091699a12.0
 for <qemu-arm@nongnu.org>; Fri, 22 Mar 2024 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711105015; x=1711709815; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=83Wh1TAIllHiFRSTsiBmuzx5iyrrRJxfmDnBiDGpJlU=;
 b=KYOl40JhDdkv4a9FjgZLLu91tPODA1z/ETdWENnUXjOdF6aGpBvH9x85O8LLIxJkIP
 ecjBmvOExJqYnxyDbB6iMKwgMAI4xFe8Eh/RHzbHk9ub0ke1RJUjLNlY3wkXQrF15gYa
 lxs0+HCt+hobrcoLCsmeyJkyvgRFaPDPRpfQgKrN5lOcjiXpgwCKwPmPHG92eOBcgE3l
 WKwMRxOYU9/NYpffZax8OCcpBNdBgoV4ffm+N9xlQquT91N+Pnqb8AvTwvN5jtTzbYJ+
 Nm/Z7JZhplSxb1MuTjLIZmU2HHrLcQLEDwnQI+GqBYwtsJe7FUM8Uob+TXkkYolRa1VT
 TlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711105015; x=1711709815;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=83Wh1TAIllHiFRSTsiBmuzx5iyrrRJxfmDnBiDGpJlU=;
 b=ogLnf1jmjigHrAZsLYYQntaa68NNMNTgEuiBshZagLT1uGS2l/Uq7HpRP65e1RmU3E
 /Pz8+WUYGiZLse0sA/Nti5Hg0tRZJHwzB0dxWSCco578/vGtM7WQA9RoM8aFlMdZoIqL
 gEq2E2qWamOnKBc9ERptU9nvXduHEuKIyQD8g6nuLiT5HTkjIohvYn+Cglk28dzlrkOW
 NLx+JicuRiGbnY+mqTWV0+w1kxLF5MgD1dR18w0Y8nTik5AT0dFW0wrrT2XUENJ4TLRe
 1wK+6Ajejr03/Wvl6nb8YPHnznaSn4+VQ9sPbmiu8KUWiPSHm+8F272ZPL6Tkd8OJMqp
 QI3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc+kxtzX5sgZFLQ0AeQQDyy4lHi/O4J2iPpUtMfIHkQQTjRjSDwo/+G+F11VaBC0r/ukIFRZpaHPYHPqZJECklAWl6
X-Gm-Message-State: AOJu0YzaIHW63944ITZ8J/7EvbOjwEllmCtezh9WnbTQlBChimciFjMe
 S1tEd4MjPKc6J5Q1p/BCAmpaatCuLbcz0q7PGi5jQQb4hmWBoBkm34E0FAilIevwA17VHbV0EPK
 q37lsHo9UuLUlTO3PPVFPDd6BjKDVfbssSwpKkjKALwqHfoGS
X-Received: by 2002:a50:9992:0:b0:568:32f7:6c53 with SMTP id
 m18-20020a509992000000b0056832f76c53mr1243243edb.3.1711105014767; Fri, 22 Mar
 2024 03:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
 <20240321130812.2983113-7-ruanjinjie@huawei.com>
 <CAFEAcA-SO3akirm+jgKGRvKH1bcsf1bLJE2uOCOoXi1h78WwFA@mail.gmail.com>
 <1b4f0b6a-f1b1-8531-e117-fb85aedfa440@huawei.com>
In-Reply-To: <1b4f0b6a-f1b1-8531-e117-fb85aedfa440@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Mar 2024 10:56:43 +0000
Message-ID: <CAFEAcA8qSq0x_tu7zDfpghzZNSJtoHE4fZ7Hhu5nMJbUKviUtA@mail.gmail.com>
Subject: Re: [RFC PATCH v9 06/23] target/arm: Add support for Non-maskable
 Interrupt
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: FZ0qGiAgilGw

On Fri, 22 Mar 2024 at 03:56, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
>
>
> On 2024/3/21 23:46, Peter Maydell wrote:
> > Something somewhere needs to implement "if SCTLR_ELx.NMI is 0 then
> > we don't take EXCP_VINMI etc but instead (maybe) EXCP_VIRQ etc".
> > At the moment nothing does that:
> >  * arm_cpu_update_vinmi() doesn't look at the NMI bit before
> >    deciding whether to set CPU_INTERRUPT_VINMI
> >  * in arm_excp_unmasked() if NMI is 0 then allIntMask takes its
> >    default value of false and so arm_excp_unmasked() returns true,
> >    so VINMI is not masked
> >  * arm_cpu_exec_interrupt() doesn't look at the NMI bit before
> >    deciding whether to check the CPU_INTERRUPT_VINMI bit in interrupt_request
> >
> > So even if SCTLR_ELx.NMI is 0 we'll still try to take a VINMI
> > if it's set up in the HCR_EL2 bits.
> >
> > However we do this the required behaviour is that if NMI is 0
> > then it is as if the interrupt doesn't have superpriority and
> > it falls back to being handled as an ordinary IRQ, VIRQ, VFIQ etc.
> > I think the best place to do this is probably here in
> > arm_cpu_exec_interrupt() -- if SCTLR_ELx.NMI isn't set then
> > treat the VFNMI bit like VFIQ, the VINMI bit like VIRQ, and
> > the NMI bit like IRQ.
>
> A PE that implements FEAT_NMI and FEAT_GICv3 also implements
> FEAT_GICv3_NMI. A PE that does not implement FEAT_NMI, does not
> implement FEAT_GICv3_NMI.
>
> As the GIC side has checked the FEAT_GICv3_NMI is implemented or Not. So
> if cpu_isar_feature(aa64_nmi, env_archcpu(env)) is false, the
> FEAT_GICv3_NMI will also not implemented,the CPU_INTERRUPT_NMI/VINMI can
> not come from GIC, so we only need to check cpu_isar_feature(aa64_nmi,
> env_archcpu(env)) and SCTLR_ELx.NMI is set in hcr_write() and
> hcrx_write() for CPU side.

If the CPU implements FEAT_NMI then the guest is allowed to
write to HCRX_EL2.VINMI even if SCTLR_ELx.NMI is 0. (It
might for example choose to set up HCRX_EL2.VINMI first
and then set NMI = 1 afterwards.) So you can't fix this
by checking for NMI in hcr_write/hcrx_write.

If you wanted you could not set the VINMI etc bits in
arm_cpu_update_vinmi() and friends if SCTLR_ELx.NMI is 0,
as long as you ensure that the update functions all get
called again when the NMI bit is written and on exception
handling change.

-- PMM
