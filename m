Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23D9C61DBE
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 13:50:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyrXb-0003or-IC; Tue, 25 Aug 2026 09:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wyrXZ-0003le-El
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 09:50:13 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wyrXX-0003vX-Uf
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 09:50:13 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c2074710751so869552866b.1
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787665809; x=1788270609; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=R2iz6X9vpQkrnDw0JUgesRW1kCxGnftKGSmfjLVpShI=;
 b=EHG9RYNYfK4WqbFTQdRXLiOlzQrV6hg5pz6kOeKRlEp+Lq7D8BTVjnbhn2YyBOZaoc
 nYaDXbat55MJChvNByk6ChT9rDtUXNsmdgTqm0/Pl4mp4XqR/qBexLFMW7iDmRtEz2sh
 hTb7F502PbkIKESTYlk10dBPzOmu9hSShXgMS7n/abYfuUvpZsz/OrcKtnfTu1ZuFPHh
 536zG0cIFfCdeDucyrZdnOEN3DM1NAfHdwdzGdOzqGLXsXz0dY9vB47Ha+j+p28Qfbdo
 0leKd/QviU6xfeZhBNKqlmeFoN5hmmqX3NgmvQhMTqaepf07USUmA5GcLdhyfKAwuOHO
 BpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787665809; x=1788270609;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=R2iz6X9vpQkrnDw0JUgesRW1kCxGnftKGSmfjLVpShI=;
 b=JZyn124/MujMdkotuCeMKegh50TY2XnMMk4WIDlYWO9S7EV5w7t2LUjEZhiQsyiPa5
 a+UMq3YKIUZGvzQSLLh/dGR3hKfoR1QaR2m+y8G4ZEo6pkxgBNGH8YYEyxMvfFegeIBQ
 DNv1YAo0Mi4Af7FipBCm/N+QL7Opkcq66qFBhD1wPSPrqi8XJ6O4YSlCbiTRYvWW1Urz
 7yCi9sriJsk1ZU8blZ5yb/7XNkjqFL3GEVgJadw59l4iJX2BPiH09V5yo1JQqIE8MS/4
 ggFkBlEP+ZA3nNOHUYC8jZXPeniQlZYsepFksBOkmq2ht9KH8bNTL1EH9LoYf7VEOya6
 SeMA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrvpK4D+d0CtW57cWoGKNolaiJ18PmdBpStkE+g0NqiRdA9TGoYEhopeDIJ/gYJb9aWW1/qfSM7OQ==@nongnu.org
X-Gm-Message-State: AFuF++lgOaOcuMR5HHfPw1x2zfmsnMe7HPUC2BhHxzVWvVCuztNdyAE+
 BkVa3rtOp7mbQ1M3/u2D9/jD8zUncJikVY1bD/MwJG11lYGOqMVjVPhVIQHfGy2Dzfc=
X-Gm-Gg: AR+sD13PVGq+DlXZps2gd3BB0zsU/rXwOR22uR4wOvmHkn7JcOwcHwaIlWyYAjf9Ahf
 9IMSodoWsz7tJB5Ic4R/csF/quBljfkyNR9m23JDkxL7g8JPVB7H3VAu9zTQAWVbM4OOEuAjjJL
 uxuck27BtkTwZwc1tmce0sz8WYo8nFsRuKaObRrtegIrAJMmjUfBThjbWU263xUflO4fPSvIn22
 FGUef6Z7uBbw6xnsobJSv82kgjj0eSJo++MUyM0A8/stJNuiC3xjzPuQVDcAuSl8qhTsR6stD3D
 TvjXy2L36DzAHmAyBqmMKT04pfYQiq3Tsf7g7aaDFNH9CHBUJlqnc3sZ+BbscL1V4gnS/uTNx2z
 dpG4mPkKr+3ReNxHGbKIwvawMTPO8db9JpebipTDDNWh9gWyN40RgRIpLgVDgCAUn4iG1hlmAPN
 /B+AsHOi7o//RonjoiiAYpTXAT7pilfmeCKm3Jj7kpG3jtWxxIQAXTv6gIAMADVvY=
X-Received: by 2002:a17:907:d0c:b0:c20:d90b:2cb1 with SMTP id
 a640c23a62f3a-c249188eadbmr3038148766b.0.1787665809576; 
 Tue, 25 Aug 2026 06:50:09 -0700 (PDT)
Received: from linaro.org ([2a10:d582:31e:0:8679:ff59:1b3a:5e93])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e2da49bsm15832653a12.29.2026.08.25.06.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 06:50:08 -0700 (PDT)
Date: Tue, 25 Aug 2026 14:50:06 +0100
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>
Subject: Re: [RFC v5 27/28] hw/arm/smmuv3: Add secure bank migration and
 secure-impl property
Message-ID: <ao2djuPIvi--MTI3@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162644.2810021-1-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162644.2810021-1-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, Aug 14, 2026 at 12:26:43AM +0800, Tao Tang wrote:
> Add a secure-impl device property and advertise it through
> S_IDR1.SECURE_IMPL. Reject secure-impl=on unless Secure memory is available
> and stage-1 translation is supported.
> 
> Usage:
>     -M virt,secure=on,iommu=smmuv3 \
>     -global arm-smmuv3.secure-impl=on
> 
> Add the smmuv3/bank_s migration subsection for the secure register bank.
> Serialize secure bank state including GBPA, IRQ config, stream table and
> queue state.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/arm/smmuv3.c         | 93 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/smmuv3.h |  2 +
>  2 files changed, 95 insertions(+)
> 

Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>


