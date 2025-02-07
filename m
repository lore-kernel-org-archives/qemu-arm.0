Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp331899njb;
        Fri, 7 Feb 2025 08:59:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUh2dOgcMnHiby5FjU59RyigHgUQod5c4ZAO3LTJIx6TOa0LxX7A9kmcVEbWMX7ldtY2cMOlIRZ9TkOjg==@linaro.org
X-Google-Smtp-Source: AGHT+IG3OUBPNd+/a7WPPh7BEbtnih/8xmLTqhgFqEEdQ8YykTO/ueChKzSv7SuZ8fiGbv7e729d
X-Received: by 2002:a05:622a:180f:b0:46c:729a:a5b with SMTP id d75a77b69052e-47167a2c978mr55511121cf.28.1738947599089;
        Fri, 07 Feb 2025 08:59:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738947599; cv=none;
        d=google.com; s=arc-20240605;
        b=V4Wwc/uqJK8cpi1G1dNvfjw8qrCWn4FS33A8IoxpHXwWeCaN6dDaAi+3OuJE6KZcAw
         PxKgnXivOT7CfSQ90CJ1h6Pg9W7MDJqkUnI67uxTTSCR4Euwt7oy/SOnaKc7bwj24cDZ
         jDez3UBNgPXROmAmAOJ/1BeNElVUb7PAb4F0gvQ8X0W8ybix8p+54WvhM/LfEamigVfT
         +mqKggIRAYoPGmxrNxZxVazXZwH8PiqW81drXtVDjDgcFPy8bfaAdeL/hekm2oemjfYA
         0P62Nl648S9FR/pWQSQzCRPRaUrvw4em7TzBhLavQOZ+SRGQhUDhPTzoSVrFAAGAsCDJ
         FwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lqiveB9osXI8XARFYdujgt/1317iAppaAA9K/dytfNw=;
        fh=uI9VIL5slj+bqUpl+B2q/FLbMnD13X6TMZJ2r5Lvjco=;
        b=Wda3zPcbqe0BPsmkEuPvkT57P+jEbTiZT2doHD1fMp2Y3LcLY8G3wQRGyyE5im6DAE
         VtFPC8B2XIAFy3gDJpI1ex/kQq7q+PakD2fJCenL3wjI7riNQHRCg+Geqw7JfBjjCka2
         qzJa69a2VDB1xOo7SAX5LbtvOD9iKH8HbvHXlcFryY+8y84/jO9f+LutTgeZH9PImp/O
         gpmhazU2/r/YLvb0wZuOaI9nCH2wIW1Rr2PgQSu3ECpmq8TZDlEluYWGMxooO2hdSQgc
         ofBuIsXTZeVY/igRTUJnp48KLuZvepwzdanAqJanGFJJVctYvMjMxUJBaFQx8guSIjAm
         sA2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Vdt/tc6V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153be5069si36349751cf.620.2025.02.07.08.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 08:59:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Vdt/tc6V";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgRgt-0001c1-0a; Fri, 07 Feb 2025 11:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tgRgs-0001bb-4k
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 11:58:54 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tgRgq-0006E5-GY
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 11:58:53 -0500
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e549b0f8d57so2072566276.3
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 08:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738947531; x=1739552331; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lqiveB9osXI8XARFYdujgt/1317iAppaAA9K/dytfNw=;
 b=Vdt/tc6VcRN/kGueVQ4ACjzgUZWgSfNA+vFG33FA944SQ0yK+TEAArqWdzWk4I/ggj
 xqVodAXMI0cGPwOanppuf/4lOXBuKtXWyzOXybgWbC5VpXJz4WCfi4RZLlNkwuri0+ZA
 V/ESszHXw/9QwB1KDIZqdcDeRddlbp8dqEvvhGhuKqpDXpBFEY2kAlar/R/f7ZqAd7Yu
 Pm8C/Kd+l4xhIFt8/tM1A/nMNuLao+8w2Sz8MCJL1w/UbKB5lpNQOUIp94l2nAh5fp/t
 j+3owrmFZyv7BUSk+Z3PlAxuey2zOaRxBjmevamMG+fX9tH4HBDeMJicSJ4639Yhdwtb
 JvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738947531; x=1739552331;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lqiveB9osXI8XARFYdujgt/1317iAppaAA9K/dytfNw=;
 b=m+nvhADfuI5hT4UTJEMZVvv+IGpygtV3f7O5IHrXzXABypHAbiPdKRG5xtQz2WCR6Z
 KsQnt6CYvWZsWNBAOole0qikURNKdqeoxeRMbbr5oZJcdpzWgoMkKM3RFTf2aFl1QXJV
 fubXQc+ohE42+bPlUknPHfwFqRZa6HgX6NHaqEWHBp1zzy/nY6XS515pccKkhniHs768
 OPn8SLULevAm2qyTgBGvQ771vM6iu7IGtO7kPv+NZ8aQe+x0XwR2IjG0Q++2p7/zD62s
 FMNd1pHg4nR1F1cCwfOMoTSCvfKFJPt+ISbYB9NzrNs7W943Gtpg02Ke9djrm6fIBEtv
 XfzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0F6yJmMcmWBTxFuMryiajgCa0PDvORwYWgLwPJyZLRq53g5QckuUb2iyhMLJsAKjwO6VhQIRkyQ==@nongnu.org
X-Gm-Message-State: AOJu0YzmCSUZf2lbS95muZSEggPvwyHfhldTm7prciHirAmHV/YLUoka
 E8ehlzZDwo76RLDxzFVdhBV7wlyV+NrsoDpCM680tPg4ZP7I0bk0FTvJjSLS+zJNRurd9KHgXsL
 BJ0Zmlk/FRyr1ho9jeSks6eVt8r8LsXHQxRy8xA==
X-Gm-Gg: ASbGncsG4RVbtC4B5IfTYnYKzEExXq32BL/EWTDSviJ8Ela92fai7XI1rknvyj7ndxk
 FBT4r3zX0KdzNeCf8EUpy04PAKh0XGIuRTYZo4qTfryUz2iwQKVMo2ciAl4Xtads29X5qfEBY/g
 ==
X-Received: by 2002:a05:6902:2682:b0:e57:fd58:ad51 with SMTP id
 3f1490d57ef6-e5b46176227mr3076012276.1.1738947530971; Fri, 07 Feb 2025
 08:58:50 -0800 (PST)
MIME-Version: 1.0
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <20250206142307.921070-5-eric.auger@redhat.com>
 <CAFEAcA_LgrBRbafVQ0vLGPd8xG=wsLjWnKTJ2JSEREYUqgRQBQ@mail.gmail.com>
 <7102d470-ac72-4c02-b8bc-20f1379a4843@redhat.com>
In-Reply-To: <7102d470-ac72-4c02-b8bc-20f1379a4843@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2025 16:58:39 +0000
X-Gm-Features: AWEUYZn8C8vUHzllJmbOc_heUb0gKDMG_YpbjTi8jXw7jhfGEEwsVKT-MCiG41o
Message-ID: <CAFEAcA-XK5GwT0b_Ff-8fYnWcDgzaE-0Ei-YqDoXv-aXFGNXUQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] hw/arm/smmuv3: Move reset to exit phase
To: eric.auger@redhat.com
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 mst@redhat.com, jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com, 
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org, 
 zhenzhong.duan@intel.com, ddutile@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
X-TUID: AiL/bPeTerno

On Fri, 7 Feb 2025 at 16:50, Eric Auger <eric.auger@redhat.com> wrote:
>
>
>
>
> On 2/7/25 5:37 PM, Peter Maydell wrote:
> > On Thu, 6 Feb 2025 at 14:23, Eric Auger <eric.auger@redhat.com> wrote:
> >> Currently the iommu may be reset before the devices
> >> it protects. For example this happens with virtio-scsi-pci.
> >> when system_reset is issued from qmp monitor, spurious
> >> "virtio: zero sized buffers are not allowed" warnings can
> >> be observed.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> ---
> >>  hw/arm/smmuv3.c     | 9 +++++----
> >>  hw/arm/trace-events | 1 +
> >>  2 files changed, 6 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> >> index c0cf5df0f6..7522c32b24 100644
> >> --- a/hw/arm/smmuv3.c
> >> +++ b/hw/arm/smmuv3.c
> >> @@ -1870,13 +1870,14 @@ static void smmu_init_irq(SMMUv3State *s, SysBusDevice *dev)
> >>      }
> >>  }
> >>
> >> -static void smmu_reset_hold(Object *obj, ResetType type)
> >> +static void smmu_reset_exit(Object *obj, ResetType type)
> >>  {
> >>      SMMUv3State *s = ARM_SMMUV3(obj);
> >>      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
> >>
> >> -    if (c->parent_phases.hold) {
> >> -        c->parent_phases.hold(obj, type);
> >> +    trace_smmu_reset_exit();
> >> +    if (c->parent_phases.exit) {
> >> +        c->parent_phases.exit(obj, type);
> >>      }
> > If we need to do something unexpected like reset
> > register values in the exit phase rather than the
> > hold phase, it's a good idea to have a comment explaining
> > why, to avoid somebody coming along afterwards and tidying
> > it up into the more usual arrangement.
> sure
> >
> > If I understand correctly we need to keep the whole IOMMU
> > config intact until the exit phase? What's the thing the
> > device behind the IOMMU is trying to do during its reset
> > that triggers the warning?
> The virtio-pci-net continues to perform DMA requests and this causes
> some weird messages such as:
> "virtio: bogus descriptor or out of resources"
>
> Also VFIO devices may continue issuing DMAs causing translation faults

Hmm, right. I guess this only happens with KVM, or can you
trigger it in a TCG setup too? Anyway, presumably we can
rely on the devices quiescing all their outstanding DMA
by the time the hold phase comes along.

(I wonder if we ought to suggest quiescing outstanding
DMA in the enter phase? But it's probably easier to fix
the iommus like this series does than try to get every
dma-capable pci device to do something different.)

thanks
-- PMM
