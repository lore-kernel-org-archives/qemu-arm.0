Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAC7C5CFCF
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 10:41:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtjuZ-0004nm-ML; Tue, 11 Aug 2026 06:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjuY-0004nM-EU
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:40:46 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjuW-0007Ob-BF
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:40:46 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-8228ed0081fso40115217b3.2
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 03:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786444843; cv=none;
 d=google.com; s=arc-20260327;
 b=VzFItk4iWTG//Kbwh1+lnmJ2y+oH8dnzFmgaqd2JeKWT0X1DPw3a7bVLEO0RXgBsKT
 1Ly2NmS2ZAFkf1tDJCzxQ1bX7fqMrl2MBHkPU4+Ea54v4/2fbWY5LJS8Qxkm/3FGgXHB
 NEtPM6RtjzFqhwvFPCYLPbhdqSZCS8qHcRqG/94dVmsYZIeeg29QBj3pQsbVrh5umRsi
 YQU4NrBDVvjswPmFa+3T73LJQuAwyDGpNlaehD6RMs9LHa51MAsyB50jPobsGHm+0fnP
 F/+Y+u7RZm4mLUoCH0JLaqCFdPCPZli936/FSwgEWRBAeC78y29khQToURq0kr63Mzdw
 twfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8VCQ1mJhXUi8Do29pZP6KhrLWhAThZO+A7xqOWH2u8w=;
 fh=50ckP+blB+xVfBrmD3Qrcl1u9X5VJw4h9+BcDT9E2U0=;
 b=mOy8Qp1U29giew7kCCbiHkXxhnyc7Ktmncf7NkcfEpvOAsjSf8VmZG9WvjaGy1ji4P
 aXrxkEIkdEZaO+nOxuNpJuCYHaVbtxqQK1CakzyEhnr0fhilqM967WuWAupJ6eWTisZS
 ASdG26GFR5XKTCzFCFeEOKRMcIRBbHKX7hSb1ZWrgeS4NTLJMdlFVOTwNn3TAJBvk63h
 t6+P6F844rxY4RObtp1UfBLK2bS5V31WyAiVcK1hgGI+Vz3Nx76a8AfC1UC7DPZbmMph
 LlvkNLPGPqVWfPz2k3tYSri0GFi6Q64qYxNMacqA4bBxkkevaYwmjSVt+nPM+6iJlbJv
 UXvQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786444843; x=1787049643; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8VCQ1mJhXUi8Do29pZP6KhrLWhAThZO+A7xqOWH2u8w=;
 b=ScYr8gXEiRsGxXU64r54s2GbWpYhfYBBPvdcOPYKr13wkCIEG7WJSX7QGD0iqS8jh4
 rNKgfcZPZLGVeeYNA3JL9FuFzuruBSOFFitHz0pwaPnYbFDEpUwTr1gdML4L5tgzdmH0
 TJWtpDx7lfPCLZKw4QP4+EkuO5uCRQDqwrQhhDwIyT3vo8PmuOCPAbMLlBrJEW4XDmIU
 +gwLzKqZTiyWgFvnpcNearEkn+AGrJaf30JUycZSU1fefADl4Vwd6ek2tFW+fmmNvdUh
 j2TGbuzsJNWePwWKjzhynA20g1cfHPU8n/1L3ycPMMZ5xt296yFCc+BWZF6bjUDt+60M
 7ULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786444843; x=1787049643;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=8VCQ1mJhXUi8Do29pZP6KhrLWhAThZO+A7xqOWH2u8w=;
 b=pe77X6v8MHqs99wH2B4RDdAAulI1JMluVfESZl3HfNO7udhpBpj5s/WyxNUtbxRSUC
 rCLcNMf8FsoxCEyE5N+8BGYHz3sMmQxPxSKidAYHY/Tq0RQd7j5Fl2HLDiu79YGSC+FP
 DOMPd79m2fJxZhNFI4dfqYYWH5UMgdv/2YEpQfiGluTSYrvqrL4NDXytaPMbbNlY/GqD
 uV4+LFHF00UDPZU9JVkfNnXEUIFpcpjHwPo+saiiyx8gZ7VMc9HBgSSe9RM5YVz/e3oV
 s4dtNNai/pnM1pt7cIvICTiFo6oJgbeGAAh4EaU4E/uLl0CQqRPKvsXqJ0beofs7uzyj
 03fQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro3tUo5dBwkzfC4osclS2jzVe5YJpL+RV8O6x54TMIehg/zFa+at2oEGd4d29xnR0kroEpuHI3VnQ==@nongnu.org
X-Gm-Message-State: AOJu0YzwrZIYkVJVDVwlIk4aWJW7bd3AMNw05aCxbJt+oFZeoP/yuhwM
 mdVis47kwfkbfVeNgh7Hknftj2PD4k7swJlKpWKASKvBTI2ofPZrs5mbvH9hib/XslFLV23AuHf
 CxtwqyuHJoMFZRprNpGHqx3a6c4oK43OKn/1GUFjUPw==
X-Gm-Gg: AR+sD13ZbWT8MorP44doLLSu2cgcoPqGK5ow6Lh4uSNt51CSRt31k42SvFno+ikfywy
 9w4o+v72V9f7fjpDqTmeJPezEbNTAdj+0BATGDomi75QjPSpQm93UeThMT0lRy5VrnLDsKIVodp
 41KKhft16OipbDJZM6xI/AgtlKYWG1I24hqrOhS+i3nd3jT/hktTnbzXQ/YIXyG/lH7Sh7HJGKg
 fwT8MEtOjzJH/csAVl1aeZxJ9r72krLbY/iMvDqPTkl0ZJ8qT6/qg4BqZ7MDLlilEQ6EN+/B7fi
 W1TEPeTLa9YZUYmBAuP+l3RCGILUx0NAB3gMDOUZ77CgwuyX47p9ewOBGsjZ/eR+SSTaSCksVTR
 Z6XJucB/HLqEiReWd8v6sFoKqTECL
X-Received: by 2002:a05:690c:6a01:b0:81e:f1af:f78f with SMTP id
 00721157ae682-82f2f6e095bmr14613077b3.26.1786444842941; Tue, 11 Aug 2026
 03:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260725124231.86233-1-marcelomanzo@gmail.com>
In-Reply-To: <20260725124231.86233-1-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Aug 2026 11:40:29 +0100
X-Gm-Features: AUfX_mwkQh2Olo5-46IMzTu63kn63zCwuEM-kwmFCLB2qWF3swwsTk3PbeUhOdM
Message-ID: <CAFEAcA_Jw=CKKpXMfmEby160SKvCg7p026RdLdQcpQ2gA59-ZQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/arm/bcm2838_pcie: make PCI device enumeration work
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, 25 Jul 2026 at 13:42, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Follow-up to "hw/arm/raspi4b: working PCIe and GENET (real
> networking)" [1]. That series got the PCIe Root Complex link up and
> GENET (a plain sysbus device, not PCI) working, but nothing in it
> actually required a guest to enumerate a device *on* the PCIe bus --
> so a real gap went unnoticed until now: attach anything to
> raspi4b's PCIe port and "lspci"/"/sys/bus/pci/devices/" come back
> completely empty, even though the link itself is up.

> Marcelo Manzo (2):
>   hw/arm/bcm2838_pcie: make PCI device enumeration actually work

Since bcm2838_pcie isn't in upstream yet, I think we should fold
this fix into that patchset, rather than introducing it in a
broken state that we then fix with a later patchset.

thanks
-- PMM

