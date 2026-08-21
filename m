Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD94C5DF93
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 15:59:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxRe7-0001pJ-0j; Fri, 21 Aug 2026 11:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wxRe4-0001oY-BH
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 11:59:04 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wxRe2-0007SD-Q8
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 11:59:04 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c15e592da74so170246666b.1
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 08:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787327941; x=1787932741; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ipXk87hRrBVPPFEG1cgHwlJAVff8zSkNe7NfBfKH06w=;
 b=L1YN3OXSALBabYZu+BNWBJncnoh7HU45izQq9iQTqXd3hjyoaHoh8rLpNJewypqpKY
 DXktyDSLbpRLw4hIrYQje8uiITieDC4T0QMYim2DlshCCVGhe0EsNGLeuYFO9I7eXtWz
 6j0BXVHjdObP0NBBGTxI92nMqIorbJvhDEuXztvKcFjACXe+RA5fbj5UC/MrJ6BrHvCg
 33t67OshobGfWyPTgLKDzrHDqiDBL/dsGlciajaU0lGaUjJDsoD5TdPzLLmQomatfyLQ
 Me0O0yICFqwh8u0iMR2M7ht4EQC5JDG97lnva/Fs11voV8oMXxpsBQMxsy0hMUmG84zx
 Unew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787327941; x=1787932741;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ipXk87hRrBVPPFEG1cgHwlJAVff8zSkNe7NfBfKH06w=;
 b=H3zYj2otaGP0N/EAB4fb+Dc9q/iu5CxS9i2MQhhIqA4xCiNCbaS8RBUhXxL6wjeGIS
 jYBZbijEb0E9JC2AFFmQMFy7S0mvsVJYfk6QB3kwiJJPkPp5A8AqYOA69g38Y9mkSgXO
 iyBMwP4pzoQ4zMluJK9gdIIilsWoVnOCZozF+qfaNQpwXCyz4+yDrZBc52XXzVab6Y2l
 d+4X9zryZPQR6jN+RsnfgnSY3fCMKy78mnG2QOY+DaJFjElMd1nSSus/61U7T0Yn1bwq
 r+bj03GdZyHk9ngzAB4DuBcYadiOmqoqoeCRvq8VYZBC5KSKq3wCaioQeZeyPYVRUJfl
 HA9g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpaLVeoKMV6MLGFTNGfaJ8Ayb3M2ZPfpYDuSL6GMq4s9r3FCsiRHJE09EBnrEBfUFds4A/yt4p6IA==@nongnu.org
X-Gm-Message-State: AFuF++kY55DJ/zevcAbjTsDPW/BC09oLxH0Fhc6+mBOdA1hfInwOHAMg
 h87K84P0zZ5TlBs5+XN3EacGJ4grBqrwooFecdeYwUC/++5n7JxzGpqBT05+RKlyVpU=
X-Gm-Gg: AR+sD1337Inlpn1CWI3DrfdEINv2A7kq34IVXRbco5/QyWMzTwcUUzBBnnD0gbc03OM
 adyFvy00ZwauX/yfonalJhoLuXC95GyDIcCBMqVkspimk6Co71eSmYDA3ZkgC6w7ZZl0U6Dp0kk
 OtHM09urE1nOn3e6sHChFcjDOsIw0OJicQ6DmvVblIIwVjSYYWKr2VIuQomeOxkFoCOPRvnGHBV
 bep7wh5YM57PBnHI5fyAlq8Z3HS7Gme8BYK3oihm0YCmyJZJjNwTF+rZxomz7EAblVUN1Yl/l+l
 RjJql1BRMYN0WUXRn1DMlmoYBwbscz11KzWxQGvoghzUUUzkH8dJZVG5XPSm1K3g4sjpuITF9lN
 UBQZ4QSFHAIOhoHUlMcr+ZB+SAREB5QLuDhbDqt81tTyNJaIZtFskV8yDrQVzXffuR9V/cbR2xo
 FG9E3omms8F6DvNxVISxdoycjBxuHAdKhb0cmEQzq6XscqaPJFgxBmw/OchZfgLu0=
X-Received: by 2002:a17:906:581b:b0:c16:14d1:b529 with SMTP id
 a640c23a62f3a-c246a62761fmr593753666b.18.1787327941144; 
 Fri, 21 Aug 2026 08:59:01 -0700 (PDT)
Received: from linaro.org ([2a10:d582:31e:0:fa47:b339:78a1:d4c6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2459222200sm490316066b.56.2026.08.21.08.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 08:59:00 -0700 (PDT)
Date: Fri, 21 Aug 2026 16:58:59 +0100
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>
Subject: Re: [RFC v5 14/28] hw/arm/smmuv3: Make evtq producer use SEC_SID
Message-ID: <aoh1wwbdXJUdzpSC@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162512.2807281-4-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162512.2807281-4-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ej1-x62f.google.com
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

On Fri, Aug 14, 2026 at 12:25:11AM +0800, Tao Tang wrote:
> The event queue producer path wrote entries through address_space_memory
> with MEMTXATTRS_UNSPECIFIED, so produced entries did not use the
> sec_sid-selected DMA context. Pass AddressSpace and MemTxAttrs to
> queue_write() based on sec_sid.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/arm/smmuv3.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 

Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>


