Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EDDCD4F5B
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 16:45:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPNZ6-0001Gy-Vu; Tue, 19 May 2026 12:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wPNYh-0001Dx-S3
 for qemu-arm@nongnu.org; Tue, 19 May 2026 12:44:45 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wPNYf-0006gg-KN
 for qemu-arm@nongnu.org; Tue, 19 May 2026 12:44:42 -0400
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-50e63771eb0so41372361cf.3
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 09:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779209079; x=1779813879; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tfehY9vqSVvZeKbLP3kdeWFCQ5ohe3KlSn84MCfsqfg=;
 b=dVsQWy2nTeZEPeKSwNuoSp1fEK4KC23EqFzSOESRec698RkQe6pLn3GVj1dxRsJ7I9
 SvpCJKSKhOSKp+pzuwZ0L19jzm8+ATUQEQWt1gQjWHGvoxGrP4XUEuH2mTNBiuXKAXXF
 j/HT5k72bHGD2SgtIZU3j90RFhWvvSJgcBXhnYaFXYpnOeBLrz4vc6yKRhRvx8NSOBUw
 zPGLp5TE5EpqXqcgtMMZYe7zCnbZYhdg1taHyrLQ8Wd5cySnksBr4TWW8wRTtKMWh4tg
 d8eIANxFaSuB6DBG3kxJkUV+qL652d85kXiSH9JJgAMxqgYZdXioJHzVhX0nGHbbrh1A
 6Ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779209079; x=1779813879;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tfehY9vqSVvZeKbLP3kdeWFCQ5ohe3KlSn84MCfsqfg=;
 b=BWwMyUVKk9bwIQBh5kJDVDmQBObRzzDRJOPD4L69KoAtMiELwkHUkBSh+D9WFJdS3b
 W8qsChw5uDDhidB25J3KtHqdoyLWOrB9LwHebgdC3vxdgZhSz7bNWlEq9+v/2ebFTO/H
 EKPez+TdDDPOM/GM3cHZ+sxJAo3Vch/yz79WFO39TvkRGmmfSMRW5sOKbJkwO3tBKVrY
 e0dXZbj6TCCDyp7BzwaUt/o4/4isKMB459b6aWkyp0vkYBURXpSg5tKaus1mEWlyeeqq
 c56b4cD1rOezH5iql/bCy9Wam3oppwVK8+DArEw1kWL/xsO5BcYKUNZkWTCpcZA55x7c
 Aayg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8jba20RifeO595TaD1JjYWKto7ich+wG4D8/RIyegNFlkweIyNocaYNgln7+hh+LskubuBqEChxg==@nongnu.org
X-Gm-Message-State: AOJu0Yy7IELqd45syWyMzrkOgnJ6LZyFLeXRn0uNHWCgLdsbp9Gm6TVw
 7tOfzdBZUNg6o5DGMLMwrEgSytORiTU6DQ9uJBaGwO74kSP8TRlXp+sR
X-Gm-Gg: Acq92OGn7X1XU9ip0oF5LCC9mZulklazp0rlQXXdVeYU07+HrPlYclFoTX+EUxeP0Bh
 7fecX6x5k1jWhuf6spughpnMtieVvp+VcNEt73cntMVTyrfm3n/bLMMAQCB/Bzn2OLx4jnKHvLX
 x+ESIJvjFTWwGBqbh4/E4rFvyi7HLI968briuzqv6tR+lbBUUuraXVVB0Ml/JS41HaiZ04DD4uG
 /fmmHymCnkSfCgsSCTLazH+IJjPgKUPWy83obE1sTuxTpV9tL8Kn7yq4VbGvwwKKJrb06REjKP5
 /xQfk79uXdUB+7+eUQ2y5EtRNH4D85Guse0fukWcXd7msv+7W+937/nF6bxjBNPX5MstxpTPU7t
 59PaOtBgXuyAaBUSR52O0UaE3BA2zuWvPYuT66RFUBKVkcPQV+ecTK1uWTRqmPLv5ZrbypVoA1T
 8p/1bmfRQCjUp+shu5gzj6GP7GWVho7uF1QqdpTjsc/H/T8nlf+oKeq/ohpnLARSw=
X-Received: by 2002:a05:622a:4886:b0:516:4f8e:300e with SMTP id
 d75a77b69052e-51659fd9c9emr265798871cf.8.1779209078576; 
 Tue, 19 May 2026 09:44:38 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f4:c030:208b:c9c5:39b5:dd2b:4560])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5164f222806sm163058511cf.16.2026.05.19.09.44.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 09:44:37 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, dmitry.osipenko@collabora.com,
 marcandre.lureau@redhat.com
Subject: Re: [PATCH v5 3/4] virtio-gpu: decouple Venus from CONFIG_OPENGL
Date: Tue, 19 May 2026 13:44:31 -0300
Message-ID: <20260519164432.22759-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <87y0hfbrbd.fsf@draig.linaro.org>
References: <87y0hfbrbd.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=lucaaamaral@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Alex Bennée <alex.bennee@linaro.org> writes:

> Isn't this entirely in QEMU's control? The Venus flag is checked
> when needed and set by:
>
>     DEFINE_PROP_BIT("venus", VirtIOGPU, parent_obj.conf.flags,
>                     VIRTIO_GPU_FLAG_VENUS_ENABLED, false),
>
> So do we just need to define:
>
>     DEFINE_PROP_BIT("virgl", VirtIOGPU, parent_obj.conf.flags,
>                     VIRTIO_GPU_FLAG_VIRGL_ENABLED, true),
>
> and allow the user to squash it and drop the:
>
>     g->parent_obj.conf.flags |= (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED);
>
> I guess we need to drop the prop bit definition on platforms that
> can't support OpenGL?

Agreed -- making "virgl=on" a real OpenGL-only property bit, distinct
from "venus=on" and no longer implicitly forced on whenever
virglrenderer is initialized, is the right shape. Both TODOs in
virtio_gpu_get_flags() resolve cleanly: the GL scanout test becomes
a pure property check (no display_opengl runtime crutch), and the
GRAPHIC_FLAGS_VK slot for Venus direct Vulkan scanout becomes a
one-liner once a Vulkan-scanout path exists.

My hesitation on folding it into this series is scope:
VIRTIO_GPU_FLAG_VIRGL_ENABLED is currently forced on whenever
virglrenderer is initialized (including Venus-only configs), so the
cleanup touches property defaults and existing user expectations
(virgl=on,venus=on vs venus=on only) -- probably wants its own
changelog and review, somewhat outside the no-GL plumbing this
series is about. I'd prefer to land this series as-is and follow up
with a dedicated "split virgl/venus property bits" series
afterwards.

That said, if you'd rather see the split as a prep patch at the
front of v6, happy to do it that way -- your call.

Thanks,
Lucas

