Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B63C61DBE
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 13:39:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyrN0-0002i4-21; Tue, 25 Aug 2026 09:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wyrMz-0002he-1R
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 09:39:17 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wyrMx-0000dz-H4
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 09:39:16 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c1c52d920b8so678956466b.2
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 06:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787665154; x=1788269954; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dcqrBR9zLvo/3xxADurhNk8ys9RwYSSiyiJMH61KDH8=;
 b=vALQb5SXo06Lr0EOGPSkC0t87fyTEVjAdFezFPvAbXdVpVxXyHqUhRKY3qW+ddj1tv
 YnmbdkWmAx2xkegeqdX2TD7wSdL0pxQUa6iBE5/oOYxd1aeMHyHobRstpyCP4mOR283v
 o5i3TrjcNPjpVxjJ7LgFTqkNPGSiGhIcZ4Ff/BFItMkLW/K1VBFJD61fc24hQ7SIedr9
 Ac3LUzUV1av3g7CsQXGKM5FPf7GrBzTyOzg/MyQy1aMGOWmdPVfBa47rU9+QDQ9+k8Gd
 bNKEMpr1vOKt1XhTgVoRN0icEt2c1Rlg4sJerxDAVBjktA9anltj91sikCR9sXkmagZE
 jF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787665154; x=1788269954;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dcqrBR9zLvo/3xxADurhNk8ys9RwYSSiyiJMH61KDH8=;
 b=A3BHBHfZwxcEi4bvmBv/vwGaGDed6UZz9KMVU/ihgJpnbPNbRc01OBPy/j6meCY5gu
 m4kiZ6TSTVgMCtVPbYpJx8vThPsjPLJwCxYJJ6CM+Jl8c9fKovhrjywVgVAQKLcO99Sf
 RJx75Ro9r9Y9MD62B3XmLwKvTTxqp4SOgIcmlbEn0pDHHe9MHsW+wOM+AH4rH6zNPiba
 YQkh8KG46XCkH0kAJaPI4lnkBqoAlGrEQnZdNFIhzyTMcYB2zDsGIVajMBdnuN0DURGg
 vx/79fT1QdXAJM/DtWQLFGrre+OBBui9JKx5yRSK4S7tTfpoFKQQ0l02vtqcjiB1+y0u
 52GA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoF82Mjo/Oq1/r4JKCN4sY7JxZ9tksy5ChOfCjAzlrfAhJhw+7ycr4MtBCBSDNJORG3DcTBEUXfbg==@nongnu.org
X-Gm-Message-State: AFuF++m3XECU18stlgAAiQRhksK+4r3T2y9baI3tLntJ9jxcd2rhLvnJ
 SyYHjDEuMr5lQMgmt1BgN5zJ4uY23DgVNTaKIrp2MyHcgBC9qtLoTsa8+vtbqBFqEcI=
X-Gm-Gg: AR+sD12/8eVlbLlcgraviY733DemL0Thfx6uOmXcZC5V5OYwVeMEfeKgr3Ai9EXeOBX
 qYW6Q28yro3bdBP3TCtkIHdK5ov/vTIA3QyR7EHaT8zeRQ0vgqG4H8lO5QrIF44ed4z7y+EI+VU
 oOFn/8liCkrEn5Rz+XcL+9msxyUvxSsp72u7VXLN6ziMqh+8ANtotN2td5KhQqwqDdfgZzHm+6t
 Y7xSxvFUNyObYnysBtBKl7/fpVIlsxm2AnJkdfOT5+pl9LV03xxs/H/0yhujqDBLS9daPPaW5IR
 SPAwfWj7dZvU2USsQflVsDlfVQPxnDxupXcLS1Cx/oyhuvz3wWVJ6dLXUFkSWwoDdclWsayodza
 YHXuBTnUYaq74fvwYtI44Ta47J4Fo2GhoNvnmz3LKCNNSd2qv4f1uFKsuFP3Vvjxp6b6NQW5BLt
 KCr6xDHkq96D70NFGLV/F443uvJIk1bp7X6nCFpUfdzI0dXIFMQxL1UiAVLREhtuYKPQcK8qVvk
 eQ=
X-Received: by 2002:a17:906:fd8c:b0:c24:b11c:6c05 with SMTP id
 a640c23a62f3a-c24e5b541a3mr715720166b.14.1787665153689; 
 Tue, 25 Aug 2026 06:39:13 -0700 (PDT)
Received: from linaro.org ([2a10:d582:31e:0:8679:ff59:1b3a:5e93])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24d6f203acsm809960966b.24.2026.08.25.06.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 06:39:12 -0700 (PDT)
Date: Tue, 25 Aug 2026 14:39:10 +0100
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>
Subject: Re: [RFC v5 26/28] hw/arm/smmuv3: Initialize the secure register bank
Message-ID: <ao2a_vm8vwEzpvVC@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162624.2809349-5-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162624.2809349-5-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ej1-x633.google.com
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

On Fri, Aug 14, 2026 at 12:26:24AM +0800, Tao Tang wrote:
> Initialize the secure register bank (SMMU_SEC_SID_S) with sane default
> values during the SMMU's reset sequence.
> 
> This change ensures that key fields, such as the secure ID registers,
> GBPA reset value, and queue entry sizes, are set to a known-good state.
> The SECURE_IMPL attribute of the S_IDR1 register will be introduced
> later via device properties.
> 
> This is a necessary step to prevent undefined behavior when secure SMMU
> features are subsequently enabled and used by software.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/arm/smmuv3.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 


Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>


