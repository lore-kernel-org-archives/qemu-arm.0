Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335B5C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 10:07:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1we8t5-0004sH-3v; Mon, 29 Jun 2026 06:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1we8sz-0004rd-I5
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 06:06:42 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1we8sy-00008o-7q
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 06:06:41 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-664cb440f9eso874197d50.1
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 03:06:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782727599; cv=none;
 d=google.com; s=arc-20260327;
 b=EwJisBCaGdmrB3Rp/OHhAaSfhrcwQDkkCeZQMV64bOZ1l6BoZoEglj3EX5GSMJk+w9
 r67fn8gJPX8LdAXp/kT/SGEv2GhcyBepzw7svMGfgJeH4LA3hC00Yxsl8MRNUW0u1s+z
 0jhEV2TwUTDhU/qFztC9WMpowuPYK+P5xErRyXdh/lzB/fSA61r+u2uu2PPGN6E1rxvK
 fJeIhdwwbwoOoO+cni6GHQ9MW68yg3Dt69wy8AxId+oLi/XQbWEwmGmt8mtRgA1pKNix
 mZxAfj9MrMPqnsV8vvl6LuZioYQ81z+nnTjURhocHZ9esB17s6RM25CnB5a9eknConCe
 a28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7ckXbkvmiBBZTMFFMg8C4vhbQU/5Aq5UiYOucG1zO3w=;
 fh=REMAhb2NbWLgByYQX0+X7hyjc6vgRQ2rgmC3/GiZ7Wk=;
 b=l4gBlMk87yQKctu0ZFSfMii2GCa4taJezy9VGjMv0UFQxa7+iqqBuVCxzokpfai6Fj
 mKqN3W5XzNbhitVK2b8rL51loa/LW8L3EIQ2m/yL8+7O6v77FoGpu76UwE6bUDovCCw1
 ugxabXKcHFEhyMqFmdUydvCNOTISwmULqzJLol598s/6f2x+PT1bDxC7oIh7uUzm4rPp
 PWAeMnIolO3Jka9f3Bx6xtRP3TKFXn7h2RMgs05vZQoKNxuEIEbTCQ21qjmw44BjEhbU
 7hQCuB6ObptX1i5gFlTNXr8KiDwO7XYdiqYTVUHcTomnumrajKS/FKJVXPcBrDvf+NEd
 1wcA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782727599; x=1783332399; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7ckXbkvmiBBZTMFFMg8C4vhbQU/5Aq5UiYOucG1zO3w=;
 b=fYyBauLgnFEq1MvTchdPngvLfG9GfyFnPOnt57iO5eWKP3CBdFXFfLlKcIpVo94iCP
 A56tnux8aYnh+G2CQ0NgfNrMSV4XQ0ft3RltatgVRUmvXahYgd8aG37vqW6z8RpdY1c2
 0WPo4GgNpvVojZJfeSJi104MwJR3+mFq32Itf9UXCuSh7a0+iXHr+2/za+hKulfcV75k
 4mXmaUNUgVZhqP0nSUjsZaK2UO/rTXUVKsf1jTzMFNV+h4gLr5ohpkKvGhEs+dzlgN6H
 1jBhuU7hMAaFE/TonC9hJZ3JhKQbEGB56m2iVSivmurttbjAf5ZUaE8jE1MjJJUlvY/1
 zDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782727599; x=1783332399;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ckXbkvmiBBZTMFFMg8C4vhbQU/5Aq5UiYOucG1zO3w=;
 b=TRPt3AUZsI8zzHc2LHnTojxDIGPzcqX33CEdyhxeJnii2N8Gmq0GXK7jth7AHbhGI4
 coMXi+4fWR5OPfLpIa303dE7SrJyBRiNJNhCrlVr+1EAFpl/O9xmAo1AY8ebYDHKsEvR
 qa6DuqbEEPMUQn11UJvs9a+nEfaf5434L/ehcf78tyxJ9bQ0TD9GRIjdosT5eu1CKGJk
 3jAd0p6Vd2Yphd7sXxkYCxpsBV+gjCY5sFfMGlSLDrdf3n6CVPkF8M1/49dyDixHFFhw
 dxZHh3ZOT7lZQi6DdFaAeP5BXilqV1KpQNIsyiCiEpqzaz+joOhX6HJA9ElmQQTkkA6G
 ZYaQ==
X-Gm-Message-State: AOJu0Yw4bsliFZ+jsCBdT5uoOAnmPMIIBDr15Qit7xil6+vpmcGHGh1z
 DRIvYmaDVss1Bx9kO1WbKjlD61/qrE5WRiv5FxRp1fDLTkTVGkCXPOxRzsiABzJHmfdjiwO7f5B
 FDt5pW5ZqITv7f5e/DTBDy5VAMfMrhwSbdhlOuSY3ZQ==
X-Gm-Gg: AfdE7cleXLW4nMY9dEgw/vT7za0oVFoG6z36SELRYCGmPTQQ8fFZmTt52cTBy/76uVN
 ijHtpz4Mksy/D6j7lsqT1snHqb9boqd3wGPDmOevCU1QiJfKwmb8M3G4vi4X3xzX6TKPCYhXqwa
 HrnsgGwEjoonKHIi4qhqotdjBKtsVFJ3KLanLQ9nIvmC/HWun9/ozGFCaSZnEWxuT2tLd7rL8Wg
 XJUaQWxOXgLrDwUDRijSIz6HmD1RJQa/Z55hAIS3+tZ4gKC2QdvXL36jFn8WEpncBDlKc3iDCM6
 cKk6Oyvt9CvWt0EpXp2c+vPVc93TRSzVlX99llyUsE7CMQljyyoDcKIaZOuMuDjdiDc=
X-Received: by 2002:a05:690e:bc6:b0:664:be26:3cf7 with SMTP id
 956f58d0204a3-664be263f59mr5955863d50.51.1782727598749; Mon, 29 Jun 2026
 03:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260623104003.36590-1-skolothumtho@nvidia.com>
In-Reply-To: <20260623104003.36590-1-skolothumtho@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jun 2026 11:06:26 +0100
X-Gm-Features: AVVi8CcwcsdFQpofYenKAbnHdmEQTTxr8mx9HYp6rHaA7K8jEzIGGIwPAOvwC-E
Message-ID: <CAFEAcA_j2CinOuRpitS4aWe07XNJ7=JRBLAh+mvdqcBWd-iLuA@mail.gmail.com>
Subject: Re: [PATCH] docs/system/arm/virt: Document accelerated SMMUv3 and
 Tegra241 CMDQV
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Tue, 23 Jun 2026 at 11:41, Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
> Add subsections for accel=on (nested Stage-1/Stage-2 translation) and
> cmdqv (Tegra241 CMDQV hardware command queues) under "User-creatable
> SMMUv3 devices".
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

