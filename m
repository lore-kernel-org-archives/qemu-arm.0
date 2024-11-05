Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2853349njc;
        Tue, 5 Nov 2024 06:19:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0SpcWbvOE+VrIFzvOEiy9TvjbgP4vd56jmG+N/k0Ltw3DfCvalzdcgLt0ZEwnjK28ESqap/YQPhpkYw==@linaro.org
X-Google-Smtp-Source: AGHT+IFCifY+lxU8inJhmChKLaNgELqf6EYQom3EHR9YhzR8oYyw0USu9VAx5ySueatX/Pm8/BxQ
X-Received: by 2002:a05:6102:6ca:b0:4a5:b543:ee64 with SMTP id ada2fe7eead31-4a962e16391mr12745488137.11.1730816397328;
        Tue, 05 Nov 2024 06:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730816397; cv=none;
        d=google.com; s=arc-20240605;
        b=fGMswbiHHmjGc6sghKs7/TPnjIQ13OypLcXh8TjnczGXKfABFsQUKNsxksJH00POxr
         IqFXQ9fU9bpek1zpb4O/yxNUvbeLrrNURwV1cUmiijvATuhc+mRSbjWQKz2T9l5N5ECb
         FMuvPnhSMxoX5XYsV00ZiXfxeXWtf7n7Xd5CoRC1OvQr+/G7sqVQ+HtqGrHkXB7JJSEs
         l6FEIrdvHTp6FxA1KQLNvl2eFdE6x4E+kPsb5SlSDumHyO3+VDaO8vMPxWJVk+X4FNyf
         AtsBDoewimS23BH7cMvJHea7WSoRUcjXTU2O0RfP/Bfkfb1ifFAKpvg69tLyM761LYVl
         YKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:date:dkim-signature;
        bh=Sf2nRsa9R3FTfHINSwX9ba91xIokEkud4HD26k+2D6w=;
        fh=vDt2tAnSauL46jd9IHShjTjOSYwG1bOsam4bHq/qpFQ=;
        b=Z31u6gAASBr0If+YAfd7vCH1+JaPeEtkvvS4WTuQ/K6GBAn82GdCdpScSZwblwncXU
         XfKswZvT/BDH3bQS3g2irn5HKAu2xo8McYXeRVGlNOSsdg22dID6U4hrcLlcPvSGZxgC
         K2myr9FmoEqDpn7creI9IzbacEu7bD3fM5mvcqkUiuAZgb0BufqmAehZinm09I0rqJBh
         KQ2jJRw7AYvOIUtW7+mECQ+4UmlHAxCBb2H1ZVAh05bhaXX1ZlTXBcpc9pqJfTHVbAdH
         oNh2O7a51+fyClTreavbU+axzBslV7lak5MeC9frb1A659v0gjT7tFqPftBdcnHQy5vy
         t6dA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=ITjCPNtR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a9575a6179si2468436137.726.2024.11.05.06.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 06:19:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=ITjCPNtR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8KPG-00031f-FB; Tue, 05 Nov 2024 09:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8KP8-0002wg-Sm; Tue, 05 Nov 2024 09:19:36 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8KP6-0004S1-Qh; Tue, 05 Nov 2024 09:19:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=Sf2nRsa9R3FTfHINSwX9ba91xIokEkud4HD26k+2D6w=; b=ITjCPNtRY5fld6P
 SejlSXKieV1OUcc4iMHFQEBBfJsRMIZVRZKPKRaJ53J7gnlU0h+Prunyzg6PmGIJFjbZXEOZec+52
 7C8ZYZ0NvvDbZ7P2hCniL/+edLN4VJbN87Cg8KF2RDX+CVEA6bBKH8MdAevxjE1hpcGhUULZ3HQve
 j0=;
Date: Tue, 5 Nov 2024 15:22:14 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 02/19] hw/microblaze: Deprecate big-endian
 petalogix-ml605 & xlnx-zynqmp-pmu
Message-ID: <q2ii7cmjqqxx2eudb7d3nkkx3oaxv7yfi2gnm75wmqk7s23zuf@7c32yuqtrh5r>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105130431.22564-3-philmd@linaro.org>
Received-SPF: pass client-ip=94.130.142.21; envelope-from=anjo@rev.ng;
 helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TShaUVkq4zlm

On 05/11/24, Philippe Mathieu-Daudé wrote:
> The petalogix-ml605 machine was explicitly added as little-endian only
> machine in commit 00914b7d970 ("microblaze: Add PetaLogix ml605 MMU
> little-endian ref design"). Mark the big-endian version as deprecated.
> 
> When the xlnx-zynqmp-pmu machine's CPU was added in commit 133d23b3ad1
> ("xlnx-zynqmp-pmu: Add the CPU and memory"), its 'endianness' property
> was set to %true, thus wired in little endianness.
> 
> Both machine are included in the big-endian system binary, while their
> CPU is working in little-endian. Unlikely to work as it. Deprecate now
> as broken config so we can remove soon.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  docs/about/deprecated.rst                        | 6 ++++++
>  configs/devices/microblaze-softmmu/default.mak   | 2 --
>  configs/devices/microblazeel-softmmu/default.mak | 5 ++++-
>  hw/microblaze/petalogix_ml605_mmu.c              | 7 ++++++-
>  hw/microblaze/xlnx-zynqmp-pmu.c                  | 8 ++++++--
>  5 files changed, 22 insertions(+), 6 deletions(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>
