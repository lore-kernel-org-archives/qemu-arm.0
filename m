Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E22FDEE35
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 18:01:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFyMK-00053C-Iz; Thu, 23 Apr 2026 14:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFyMA-00051e-O2
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 14:00:54 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFyM8-0004Lu-JM
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 14:00:54 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488ad135063so61864005e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 11:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776967248; x=1777572048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rT7XeBu6ci915sJOi/abBOcvlpcNLtTk7WfwADEkJvY=;
 b=mPudgdUuOLzjS9cRtTJvmzou9R+DC8fxqA5cbsoBl7IQc1j0sSv06sFlMScJSwlq9q
 usvANlBetmJz7P5vglHJgxeVaZ3KydZXll9zyAy98fAxH2Q78XAXABByg4jgiq0jb8Gi
 9fEfNkUZ/d7KoSUNGs8u1qTFFKWua+19hDqBmJJo8rqs/yVr7oRGTVefketgnUo2AwUK
 jS28cFtaWaZxkWe6DC7+m+U77/cphN9pk4gpfrx8rYvD6XWH85entKuQ3vbFFNWjtEnA
 /rxIbyhgIxxmLvVDwZ7HM32xUWA4GiOhpx25612SBL3sEXOsepbYaS96XCicDE3UdDjd
 efQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776967248; x=1777572048;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rT7XeBu6ci915sJOi/abBOcvlpcNLtTk7WfwADEkJvY=;
 b=sqsCOj7ZhvuolSAUG22lzzRFHyPSGukR4u1M0OfYX0sS2RXs6eQzOyE3IMYEuLL1Vm
 93Ze5IYYUgF45LfwDAaCcTIZCJi9vabDDIXRnn+72vLpuO99mT95Xn2ygs3yq85n852q
 ZGuSVfZzO7i3kNuc2pS1VqilSpxgii2fh3eRoUgcRAARf2sIi782fIxCToqeTJ9t5cnL
 KdqVYPeprWCHSmj425q3JEj29SK4IZ0pCDEZb40H1wazNI5hvcjQcFXlNMzFVrUcBtMn
 WZ/eaPRfHF+lqrpTqy3AtK21JC9C0slkOi21Nv35ObqPK8PwIl6AgOQpIMFWcbLWYvGt
 wIYw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+rpDltXnvNb/J9HfXQlnfkEXNGF4nJfg/5//SgcooM1aCgZ2TRYDiNY51Fprp+xgeSreLhor4cPg==@nongnu.org
X-Gm-Message-State: AOJu0YwbpQHQQ1sDs1Duln7ZVIPyK3Kx5BY9h+dM3Vz2dkwAaiPHrTKK
 UZGSRTOnXlkPApruqXOCcnW5p2RRsucqMR+bstcTinr/4mgZOf4ZVnYsqcUerCaAFhg=
X-Gm-Gg: AeBDiesIMx4mTVGRJG1obwSitVUW/IJ9en/6qGyJJJSYAMTXVF7TRMiCUMExelR/Gk1
 elQC+FaeXlqFd4ITRNeWvJDxRamlppJCz1lBQLBBPIzfDmzXfEV8cfJ32ou6AkKJNXWQ+/gMxH9
 5toxwEcOJSYsYQmidAfiOsSzx8z2rkeMLmFWFI+NPIYZjWWuZvGJ/Ai0XH6T5ELbNZDJCSZQ82s
 nSIEssC7iE2raKijgKGFHZ/oD5efy72wLgkFKHWznkecEIR+RkqjTAcn12jeb0rpQkT6OYCKuVE
 IfvDYKL6A96f4COLGopIjW3GCaR4PX+xdp2L04oIDryJlVXTJw0PpDHZp0X9mEAHJKANchKKb0a
 tWQxBd3DjSWLR5Mn1Go63WUXWZtBk9cpctV3xUK56W+rg7PtpI/vxY3TUB1QWefv8WaW8EPzxmx
 uovtjzD23nEwL8n6U52w619isNHJFhKkzctQ==
X-Received: by 2002:a05:600c:4e4f:b0:488:ab37:b442 with SMTP id
 5b1f17b1804b1-488fb793c6bmr412699555e9.28.1776967248299; 
 Thu, 23 Apr 2026 11:00:48 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4412150a092sm20111411f8f.23.2026.04.23.11.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 11:00:47 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 17BE15F941;
 Thu, 23 Apr 2026 19:00:46 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Lucas Amaral <lucaaamaral@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  agraf@csgraf.de,
 peter.maydell@linaro.org,  mohamed@unpredictable.fr
Subject: Re: [PATCH v4 1/3] virtio-gpu: validate host page alignment for
 MAP_FIXED blobs
In-Reply-To: <20260317175744.32469-2-lucaaamaral@gmail.com> (Lucas Amaral's
 message of "Tue, 17 Mar 2026 14:57:42 -0300")
References: <20260317175744.32469-1-lucaaamaral@gmail.com>
 <20260317175744.32469-2-lucaaamaral@gmail.com>
User-Agent: mu4e 1.14.1-pre3; emacs 30.1
Date: Thu, 23 Apr 2026 19:00:46 +0100
Message-ID: <87mrytwo8h.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

> Commit 4eb0aace ("virtio-gpu: Support mapping hostmem blobs with
> map_fixed") uses mmap(MAP_FIXED) to map blob resources into a
> pre-allocated hostmem region.  Both the offset and size passed to
> mmap must be aligned to the host page size, but the code does not
> validate this.
>
> On hosts where qemu_real_host_page_size() exceeds the guest's page
> size (e.g. ARM64 with 16KB or 64KB pages, macOS ARM64), the guest
> may provide blob offsets aligned to its own page size (4KB) but not
> to the host's.

What was your test case? Is it possible to publish some images for a
functional test?

> This causes mmap(MAP_FIXED) to fail with EINVAL,
> and the subsequent unmap (which also uses mmap MAP_FIXED) fails the
> same way, producing:
>
>   virtio_gpu_virgl_unmap_resource_blob: failed to unmap(fixed)
>   virgl resource: Invalid argument
>
> Add an alignment check before attempting MAP_FIXED.  When the offset
> or blob size is not host-page-aligned, skip the MAP_FIXED path and
> fall through to the existing subregion method, which handles any
> alignment.
>
> Fixes: 4eb0aace ("virtio-gpu: Support mapping hostmem blobs with map_fixe=
d")
> Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
> ---
>  hw/display/virtio-gpu-virgl.c | 45 +++++++++++++++++++++--------------
>  1 file changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index b7a2d160..f6583b48 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -185,25 +185,34 @@ virtio_gpu_virgl_map_resource_blob(VirtIOGPU *g,
>          return -EBUSY;
>      }
>=20=20
> -    ret =3D virgl_renderer_resource_map_fixed(res->base.resource_id,
> -                                            gl->hostmem_mmap + offset);
> -    switch (ret) {
> -    case 0:
> -        res->map_fixed =3D gl->hostmem_mmap + offset;
> -        return 0;
> -
> -    case -EOPNOTSUPP:
> -        /*
> -         * MAP_FIXED is unsupported by this resource.
> -         * Mapping falls back to a blob subregion method in that case.
> -         */
> -        break;
> +    /*
> +     * MAP_FIXED requires host-page-aligned offset and size.  Hosts with
> +     * page sizes larger than the guest's (e.g. 16KB on ARM64) may recei=
ve
> +     * non-aligned blob offsets.  Fall through to the subregion method w=
hen
> +     * alignment requirements are not met.
> +     */
> +    if (QEMU_IS_ALIGNED(offset, qemu_real_host_page_size()) &&
> +        QEMU_IS_ALIGNED(res->base.blob_size, qemu_real_host_page_size())=
) {
> +        ret =3D virgl_renderer_resource_map_fixed(res->base.resource_id,
> +                                                gl->hostmem_mmap + offse=
t);
> +        switch (ret) {
> +        case 0:
> +            res->map_fixed =3D gl->hostmem_mmap + offset;
> +            return 0;
> +
> +        case -EOPNOTSUPP:
> +            /*
> +             * MAP_FIXED is unsupported by this resource.
> +             * Mapping falls back to a blob subregion method in that cas=
e.
> +             */
> +            break;
>=20=20
> -    default:
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: failed to map(fixed) virgl resource: %s\n",
> -                      __func__, strerror(-ret));
> -        return ret;
> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: failed to map(fixed) virgl resource: %s\n=
",
> +                          __func__, strerror(-ret));
> +            return ret;
> +        }
>      }
>  #endif

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

