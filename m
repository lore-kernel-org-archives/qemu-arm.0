Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976D4CD4F3C
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 17:32:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPOIu-0000xF-7a; Tue, 19 May 2026 13:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wPOIs-0000wg-4R
 for qemu-arm@nongnu.org; Tue, 19 May 2026 13:32:26 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wPOIp-00048v-Sn
 for qemu-arm@nongnu.org; Tue, 19 May 2026 13:32:25 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso39374175e9.1
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 10:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779211942; x=1779816742; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09CYASD6qgjFmOFXkkhkmTSUGGrPb48s0VTnya5OKuU=;
 b=RjO/szeb60RHSBrE3OJZVbM0B3KG4CMpPtl3BBJNv+/QEu4+YSP/OUklYkxLAhOaYQ
 6qvq+3gZREpG7XCTEVvld0Za6EKHiL5B7QiL3BcOxO1EhI4DxWjbqNLaQfXQ/ZUW4Wyi
 8x/ySGIbNIIQKAdd40Cq4Z6z91LE5WYiz4A/XMyoWHInVM8GB16u8Ge1tHji+uj0jkUC
 o1gzx/kjl9Zb8Qp6WKwnj133OjdZ9lBPtuOlNGNUW9Lg7UKVd/iIWCwIiUiGHpCYx8ji
 lPLyloZ34xGesVBtiigY7FduM4AZ24WCXTFy0DEM367Yu0hQLHZg+xPW7kFoe68h3cLU
 1QMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779211942; x=1779816742;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=09CYASD6qgjFmOFXkkhkmTSUGGrPb48s0VTnya5OKuU=;
 b=d56RYoSUmlutvvqr4vhJRZnLh/UV95pB8uOaT59L2tDWrY3iWLmQvNdpIA43+pzAzF
 U0gW3lwVBHkJCx3h1l3Jl8rw9xY2vCidm7uHSV2LAHhegbYXuqcEvAy+QtyCliVJOFVY
 WgP2/HnyGzZMMKAZCgzuapF+zafZ7sPa1OTzaFgUFsDnbGisdv5Vp3C83VZeC8LPJoU+
 3C/maohOsKHOXolRRELeT4kTP+d/ftpZp+w9A6JRsVlEXkA3OOjx7ZFQhxEcGT1HIXKb
 kMM5Ovw4clzmIcVsG4fUttfHKummbBWalGT0Kjuw+82TbABfHaYFAoLhSc7/Q+rHC+bF
 lS2w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9VTEb4xkB9hAO2H+L+es+df2grBaMoNMF8jD0XQXAUEHU5/BgiZDVQgRdd3aIw4GbmoT3OL1888A==@nongnu.org
X-Gm-Message-State: AOJu0YyCmL6xHLIICLj3z6/8dHCPd+YJptnAzcY2pbRPjnO6w6Q3RZb8
 eUFCHnDAzWxH5BvnhpUbd2WeCdX0PMz/JEPeSEDLUvKyiI/i1vmyItjlpsMZVsGTA+c=
X-Gm-Gg: Acq92OEvF8+eZXVz/LNxyP1jTi15gn4fJfQzRW1xPH0FIM6li9w+Cye4U5++/4cksUk
 JmWs1ECpDXAz+VObbucXfrqE+M1eSuYMThg1A9b3vz7FVkUTfaTw2qSRL/4ZiS4v8LFvhd5mTn1
 WH9j2Shpr57+ABJauswkVTjepOBl5s6RlLrIR3zEd+oKNPBxoZrzvuGYT4CkXkjr6/I01zdqZyI
 WhZM0ywyXY9RfHDdXLx/IOwEn8PSjTDAMSHQsqrLBbu6frUEewjrH+Y4n0ajAGrDRdm0WKPDbuG
 Bj0qjjJ93V19/4xJZllO8IxeyScEKQ9XDXluqmeob95lus5l2m0yCxlfHJgLXTCeIvkLgvEEGOM
 59FEuht0/tScOT4UIZdYaY9YcrcqlSzosmjCNkz1bHr6py2UbdRSy4ajwLYI5h7orfyYoHrMTAJ
 LPSmtGrS2EN2vscujbeBr3rj4=
X-Received: by 2002:a05:600c:a406:b0:489:32b:ac0b with SMTP id
 5b1f17b1804b1-48fe4fa1902mr245647905e9.6.1779211942046; 
 Tue, 19 May 2026 10:32:22 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5694fbfsm587747265e9.6.2026.05.19.10.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2026 10:32:21 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0C3DC5F8C7;
 Tue, 19 May 2026 18:32:20 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Lucas Amaral <lucaaamaral@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
 dmitry.osipenko@collabora.com,  marcandre.lureau@redhat.com
Subject: Re: [PATCH v5 3/4] virtio-gpu: decouple Venus from CONFIG_OPENGL
In-Reply-To: <20260519164432.22759-1-lucaaamaral@gmail.com> (Lucas Amaral's
 message of "Tue, 19 May 2026 13:44:31 -0300")
References: <87y0hfbrbd.fsf@draig.linaro.org>
 <20260519164432.22759-1-lucaaamaral@gmail.com>
User-Agent: mu4e 1.14.1; emacs 30.1
Date: Tue, 19 May 2026 18:32:19 +0100
Message-ID: <87qzn79ufw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

Lucas Amaral <lucaaamaral@gmail.com> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> Isn't this entirely in QEMU's control? The Venus flag is checked
>> when needed and set by:
>>
>>     DEFINE_PROP_BIT("venus", VirtIOGPU, parent_obj.conf.flags,
>>                     VIRTIO_GPU_FLAG_VENUS_ENABLED, false),
>>
>> So do we just need to define:
>>
>>     DEFINE_PROP_BIT("virgl", VirtIOGPU, parent_obj.conf.flags,
>>                     VIRTIO_GPU_FLAG_VIRGL_ENABLED, true),
>>
>> and allow the user to squash it and drop the:
>>
>>     g->parent_obj.conf.flags |=3D (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED);
>>
>> I guess we need to drop the prop bit definition on platforms that
>> can't support OpenGL?
>
> Agreed -- making "virgl=3Don" a real OpenGL-only property bit, distinct
> from "venus=3Don" and no longer implicitly forced on whenever
> virglrenderer is initialized, is the right shape. Both TODOs in
> virtio_gpu_get_flags() resolve cleanly: the GL scanout test becomes
> a pure property check (no display_opengl runtime crutch), and the
> GRAPHIC_FLAGS_VK slot for Venus direct Vulkan scanout becomes a
> one-liner once a Vulkan-scanout path exists.
>
> My hesitation on folding it into this series is scope:
> VIRTIO_GPU_FLAG_VIRGL_ENABLED is currently forced on whenever
> virglrenderer is initialized (including Venus-only configs)

Venus-only configs being MacOS right? On Linux the default would for
virgl to be on unless the user explicitly turns it off (we can expand
the GPU functional tests to make sure this works).

> , so the
> cleanup touches property defaults and existing user expectations
> (virgl=3Don,venus=3Don vs venus=3Don only) -- probably wants its own
> changelog and review, somewhat outside the no-GL plumbing this
> series is about. I'd prefer to land this series as-is and follow up
> with a dedicated "split virgl/venus property bits" series
> afterwards.
>
> That said, if you'd rather see the split as a prep patch at the
> front of v6, happy to do it that way -- your call.

Yes - have it as a prep patch in the series.=20

>
> Thanks,
> Lucas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

