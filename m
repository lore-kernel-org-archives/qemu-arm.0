Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DB5C61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 08:30:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzVUn-0005RB-VS; Thu, 27 Aug 2026 04:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leonardi@redhat.com>)
 id 1wzVUm-0005Q8-Du
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 04:30:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leonardi@redhat.com>)
 id 1wzVUk-0004P9-Tq
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 04:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787819397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DBdUyAsqfJt4r9dXvva+et1CD5naD6J/mWEbiwE2yWI=;
 b=R5DXwoSAX/IN4hn7kjO/YxnfuE0i3LVA1BOv7VxI4X/eiO/FylEymoNctym86MJbKjmsAY
 eogq0TGlj9dwDvV9YRtW4UnJ3jb2VTyg3ke9rVdjk8a9gWKOCA0i6foVt6WPJi4OsN85dc
 GvX6XX02SjLMd5osgDd09bTtb5Zr6hE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-20EloIMSNY27lfkybsONRA-1; Thu, 27 Aug 2026 04:29:54 -0400
X-MC-Unique: 20EloIMSNY27lfkybsONRA-1
X-Mimecast-MFC-AGG-ID: 20EloIMSNY27lfkybsONRA_1787819393
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-482e8e1ac69so334027f8f.0
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 01:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787819393; x=1788424193;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DBdUyAsqfJt4r9dXvva+et1CD5naD6J/mWEbiwE2yWI=;
 b=q+3a+e8vfXuTWtmESE8fib48tYmIEJYed3NxJIC3PakCUTLKQF24S0yLtMiZi20hvt
 lIC4JpClFbsqSMq87T9qWsKgKNbT7v4657fAspD4F/Rxzv6Hxey4hpkkhzA6JU6DMDVh
 OMM0i4KaKh7CGD7m1tIGEWqOeh1zl1v62vfimlA/JeUwhRU43T3To10KAGnrf6BEUJPG
 TnQSTDLi/3s7814+nNl5KX6XygVBM2PeKn7b8zV3ggCbfI2UfH3FqnBjTl1odLOcKb4P
 Qwn5HK3eG9QHUhLL2+FUi1GYr5Ni8PXiI8Wcz3MAGoYVb4Qq4QrhH1Bv1tFBCoSRaIrk
 A2fg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro2abp7CsycPPraQI+ZTIAO9kJCPZggA8PjAV7KLh2BqUrqPjtJk84VZt1HynMgcCIfRjw6ydPeWw==@nongnu.org
X-Gm-Message-State: AFuF++lK715426sEJVRp7ZPRlXgeP2ctqYiQqz5Vg3KxvnmHtgDbASQN
 ciuqjDjruomnqos8EjkKHXiXz7OVN1pazK2ATD0+YDTq1CYD9UoPzT2vavd21PYf6YQkPBCXhmv
 I3vN3XGrZfJoAN87kCwnJ9ImQqZSL1xkHFynB0na0/RlGd/Iq6w57lg==
X-Gm-Gg: AR+sD12NNLkuLuj0nvnJgazchgQgqZGpHJw7fn1ow8+xg4zdXFDji54Lw+PVa+6uVJ2
 661iX1xS2qVeghephIFkhhlVH7MzN0VSyK1/24u+IGgTRmZTkuAij74TYLfmW+X1fFnVzsGvAxV
 FHzVre3jMdRUEz7STbQ8h6BrYtr6awrPrWQbCtO4Kd7qP42MueKTlcvdIOBg1Re+fOkBtxlBUrH
 +vhk0PLoMCwTtvR2A8Hr1Qb3ZHOQWZkalN7paa3peqOUKU4OYKQpu6/N0XmAj6aJEi26+Fabb2X
 WMPKqAYIiQponGgdaxJyerEwOj/Utkl+qX57YFB/Y3AkuGBof/dy1unMwMe982HlPHskQBjyKb7
 aGylyZEjnhcCZXz6buwzDID3K8gdd+gpvqsbc
X-Received: by 2002:a05:600c:138e:b0:49a:ce8f:1a5e with SMTP id
 5b1f17b1804b1-49b0dea94a8mr47891225e9.2.1787819393207; 
 Thu, 27 Aug 2026 01:29:53 -0700 (PDT)
X-Received: by 2002:a05:600c:138e:b0:49a:ce8f:1a5e with SMTP id
 5b1f17b1804b1-49b0dea94a8mr47890615e9.2.1787819392771; 
 Thu, 27 Aug 2026 01:29:52 -0700 (PDT)
Received: from leonardi-redhat ([109.52.148.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499dd5616f7sm57605615e9.2.2026.08.27.01.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 01:29:52 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:29:49 +0200
From: Luigi Leonardi <leonardi@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 03/12] edk2: update submodule to edk2-stable202508
Message-ID: <ao_1WPt4pzUf5M-J@leonardi-redhat>
References: <20260824164751.1700783-1-kraxel@redhat.com>
 <20260824164751.1700783-4-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260824164751.1700783-4-kraxel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E7ETFPrKux2wHmdZhlRn_mofsU6RuEzciT-0k9qkyl8_1787819393
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leonardi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

nit: /s/202508/202608

that said

Reviewed-by: Luigi Leonardi <leonardi@redhat.com>

Luigi

On Mon, Aug 24, 2026 at 06:47:35PM +0200, Gerd Hoffmann wrote:
>Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>---
> roms/edk2         | 2 +-
> roms/edk2-version | 4 ++--
> 2 files changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/roms/edk2 b/roms/edk2
>index 4dfdca63a934..2970e5699ba6 160000
>--- a/roms/edk2
>+++ b/roms/edk2
>@@ -1 +1 @@
>-Subproject commit 4dfdca63a93497203f197ec98ba20e2327e4afe4
>+Subproject commit 2970e5699ba6267f3384ffab20f96647578aebc8
>diff --git a/roms/edk2-version b/roms/edk2-version
>index 069f19f8bf49..8a0cf62749cf 100644
>--- a/roms/edk2-version
>+++ b/roms/edk2-version
>@@ -1,2 +1,2 @@
>-EDK2_STABLE = edk2-stable202408
>-EDK2_DATE = 08/13/2024
>+EDK2_STABLE = edk2-stable202608
>+EDK2_DATE = 08/12/2026
>-- 
>2.55.0
>
>


