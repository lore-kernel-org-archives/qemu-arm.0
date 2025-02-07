Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp320185njb;
        Fri, 7 Feb 2025 08:38:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX8IEeUDp7bjRGXMt01E+cIM4AnMPu/wKs5eIgUhGKZcduNK0j5UYO+RpKXL/x5XuvlpPImKrh+AoLEag==@linaro.org
X-Google-Smtp-Source: AGHT+IH3zuJudiDLgKNRKQ8pFttSe+iKEEuVeMPLcUBq1T+q3FUxQlMm5ztGlK+x9MlomR0My/Px
X-Received: by 2002:a05:620a:404c:b0:7b1:ab32:b71e with SMTP id af79cd13be357-7c047e2d53cmr486220885a.0.1738946331283;
        Fri, 07 Feb 2025 08:38:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738946331; cv=none;
        d=google.com; s=arc-20240605;
        b=IRcxHfiRFVQp+ELesmvbMEuGIhQPWtxVdATb2Bg6EzUZ7ysSGtcIy+qyqKO2FN4MqH
         742tGwVw1mnN+DS2FiYBjjD36VdhgRzPNCJyOpawz0L9h69IrWkmuTnRHKuYnfYEsH+z
         NcANi5eQZE/2mEFLGQtXa18raegl+QUFTWc+Qv9jO9hMeqUcRW/hG73TWJiyRu88IaiR
         dm/UxBiVwob04P2n+Z5K4YlZfNpo71eDaOdkOXwkRRj1Nc4YHeoHxontrz6repWdg5J7
         YWyIJOA1LFDsPuhQuUEKHO7c9DxYhmqwui+K98vMQzH0dH+xAFmhEKLPlELiVNOJMLni
         TReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kAm+8KqVWhVPm/FTHeR78fkBlnBEZqi3WmpJ5OUjub4=;
        fh=+i8suTA/2c4Xq8BipbWI26RbGl7ZQA1JIXECNCLw1hY=;
        b=iaQCHfnIm/5U/7cRE/D/zO7x/hS3OUuuvgMuss/Bcm3+Zxlr66VFbqDmsNrYWxyn50
         wWN7LyfeeOK9uQKEYoQbtnhTqv/luyJMzDJdWkAOKJND2/4fT3+wYIgmqZrDFGKYZa0g
         CGqgEblXlUAPBwe4qgq89O0kPeZyfOJkWuXPeWuBGFAnlXB3cHA33NJaY16sYfZ6sH5b
         MtTsw29sjPgIeIv2RiRom3hYi2MdMD12J9zTKpL7DA2mRKnseZXF2ru9sgMVT9K1S+xv
         1fuIruKK2cHeWjJdqSwPNuQ3UwhcLEUeYVcWVPXKYmev4ERizhZ8WnIOIGWbdaJJ0w8z
         dYHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sVkIHzGR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ed0d37si376218285a.473.2025.02.07.08.38.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 08:38:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sVkIHzGR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgRMu-0003Di-A2; Fri, 07 Feb 2025 11:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tgRMo-00039u-G6
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 11:38:10 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tgRMn-0006YW-17
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 11:38:10 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e5ad75ca787so1993651276.0
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 08:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738946287; x=1739551087; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kAm+8KqVWhVPm/FTHeR78fkBlnBEZqi3WmpJ5OUjub4=;
 b=sVkIHzGRMMu3SPL9x3NMZ6mEQZCr+5otl68ylEAjzVjhbPol4LCe9gFVHKKftV9ICa
 cZn4nkDGssXrhdYenqyuJwTBG4sUWuiEYgiebMQKfzV9LKXa4kUNk+mQOcz2OK0Fk5Gf
 UO9jAYmi1bFBpTu+GoZHdS5E+BFpFN1G/ljGIoDYSRaz41GEGH86KEXM4i9prNf4W3KL
 9ncKguIL6Qb4pnYOGXwxC/T24sV6+q1hOJSDzoEQ5xm3aFogwJU6MKOIfMJ7bOxZib5g
 UKCzPUpZVxLMTDoomozfyE1wRwYo5zlT7WNWW2ZIySIjVFgQZ/WqTBKsxjV9Y7s8GOza
 sAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738946287; x=1739551087;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kAm+8KqVWhVPm/FTHeR78fkBlnBEZqi3WmpJ5OUjub4=;
 b=NPaDSi2jdHEgbsHfViGkxKonJN0Fx8RiAwKqVkHj0AWjr0m9o5rYx2Kxqq9y0buvqO
 GJI73Q6IXB6TdpctMWEaxDKoxChteGjm1VkCg6dM1mngo2xZ+2pPAtVId1Gb/+UaNWVU
 hzwfi1bm5h6M6JuBEyf5J1w1EnrZal9Ayl65pWycC104qQNwXu89L8Fvpd5x59hVcMMq
 NDvfMSkAECRA2gNpzBb8NvnfxkbNqCrSYvq6vum423E8ePjqcfhkoP2s0yuJ/rUAFHxy
 a9riaco79rKxsX0tdSkvIdoHTSwy4IkCMDonlLeIPWKBA2/nZk8ROH9dGwDvkf4kBKx7
 xPBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1YC7oiBW6YfmMJNmIyFosZF43+J9BD0nCGFKcS/musbt9PndpqV6OO2A4Tn+heWlRGBtiZiq8ow==@nongnu.org
X-Gm-Message-State: AOJu0YwbrwmgffofaRM7Bq2hTpd3tKJ/RvoglqxHmf4ZNHgQjE3u808u
 6M9jWGxOZL1vU9Mj3779ED/Mw97AyfrJUl63BOMGc0EfH6JBkDXpTffD+uabxQdrrXW0PpDqlsa
 JbVhMGh2POyjVaYTH3Be/0mH0JvvDDjnYJdp/hA==
X-Gm-Gg: ASbGncvL5CN5QuvdPc+dzmfXaEtD2I2pbVupO9gHv9f2klfsXRs+GzgKRuCb2krbFft
 BVFh9wpRG7VFsuTFa4JkjX/hrWeUequEKrZVBqJo5iIiUSLxj5kF4LWEWifgWHmoXiT4tc/vQ1w
 ==
X-Received: by 2002:a05:6902:2686:b0:e5b:3b7a:fcb4 with SMTP id
 3f1490d57ef6-e5b46b7d66emr3320873276.1.1738946287287; Fri, 07 Feb 2025
 08:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <20250206142307.921070-5-eric.auger@redhat.com>
In-Reply-To: <20250206142307.921070-5-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2025 16:37:55 +0000
X-Gm-Features: AWEUYZmnqP8S6aBg0zaVPZKtAHoxLWNEwTxS7fJ_Lrt0VeWRuuqsHzAQPdh0M8M
Message-ID: <CAFEAcA_LgrBRbafVQ0vLGPd8xG=wsLjWnKTJ2JSEREYUqgRQBQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/arm/smmuv3: Move reset to exit phase
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 mst@redhat.com, jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com, 
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org, 
 zhenzhong.duan@intel.com, ddutile@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
X-TUID: oKUwtUDoYfpH

On Thu, 6 Feb 2025 at 14:23, Eric Auger <eric.auger@redhat.com> wrote:
>
> Currently the iommu may be reset before the devices
> it protects. For example this happens with virtio-scsi-pci.
> when system_reset is issued from qmp monitor, spurious
> "virtio: zero sized buffers are not allowed" warnings can
> be observed.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3.c     | 9 +++++----
>  hw/arm/trace-events | 1 +
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index c0cf5df0f6..7522c32b24 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1870,13 +1870,14 @@ static void smmu_init_irq(SMMUv3State *s, SysBusDevice *dev)
>      }
>  }
>
> -static void smmu_reset_hold(Object *obj, ResetType type)
> +static void smmu_reset_exit(Object *obj, ResetType type)
>  {
>      SMMUv3State *s = ARM_SMMUV3(obj);
>      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
>
> -    if (c->parent_phases.hold) {
> -        c->parent_phases.hold(obj, type);
> +    trace_smmu_reset_exit();
> +    if (c->parent_phases.exit) {
> +        c->parent_phases.exit(obj, type);
>      }

If we need to do something unexpected like reset
register values in the exit phase rather than the
hold phase, it's a good idea to have a comment explaining
why, to avoid somebody coming along afterwards and tidying
it up into the more usual arrangement.

If I understand correctly we need to keep the whole IOMMU
config intact until the exit phase? What's the thing the
device behind the IOMMU is trying to do during its reset
that triggers the warning?

thanks
-- PMM
