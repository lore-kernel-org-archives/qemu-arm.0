Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BD3606A337
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=b4WgsQAn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOxmJ-0007wi-EU; Thu, 05 Nov 2026 08:45:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOxmF-0007ve-A1
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 08:45:15 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xOxmD-00056T-R6
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 08:45:15 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8b31448caccso16268487b3.1
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 05:45:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793886312; cv=none;
 d=google.com; s=arc-20260327;
 b=a2sNO30kqRzhAGFtlZQ+QYfG+X1NbaLAAuFdHc8N5gm0mDCEYKbjnndDoppT6/YcIs
 l+cKWq/EMeRSsIH83OS9cgt5HRqk/GoSgyJf0N6X7/6G9cHmS7XuQ84DwuhCUjrBLOxg
 7EznY41J+LPdDLUB1uFuH/q+e7lES86xw5ERmm9yxamEcq8qEbwBDsLii6+2jl8EDBH1
 /0AoYJbSxWqT9Bu+p4WwzAV9TP4C2tg0yQXePLjQG1gWX30iAgXBpeVuL8XHhwzp4WzS
 z2lamytBMBjynswtxXlb1aVYHfP7hTYK5+FpZ2dXqgksTKBg76W3ZkyHQx2HVf/uPXjS
 a6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4xHjQ5+iisONzPEzgfEzYQovtvJlwye3sZPa+H0ZY44=;
 fh=kVdi7AhmoDJP1/IpyQl2pzM967JyMx5+TW2pe+i/fqA=;
 b=sItK3hxXorC7m2CSO/d2LJEkCoTTc/2Day84VydMlt3jq+0j7yNOerJfCpdan4+GwR
 /F+QUFGoZcE5qOjx7ppBxDJw5WbX/kZnUA9N6Bm+zUecSE5qWx2xYDEg+u0ZjxhFkZAZ
 gTCEcHRx7iDekJD3dc/LI4ZPGuS5pdxBFvbDgcO9T6JiopBXqvwExcxSsRWRKRyc9mKC
 ulntBqVBifwsiZObL4J7PK36aguHFpEI3i2avI7njZrSY1omMM0x3+3WCPUbLPz1rCaF
 +Ne32RXg1N9d4+5Y6QZ1Rh7FbusoYFZ1p6B4UobcQ6WOoYn0fvT3xxgzYVSgDc+rz2bc
 lofw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793886312; x=1794491112; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4xHjQ5+iisONzPEzgfEzYQovtvJlwye3sZPa+H0ZY44=;
 b=b4WgsQAnyK4Ct+GtFcFQk2pYcdAouVUmPEoc0fxSHbwLS00AJvc734wd46acRIvGZS
 6gEe5ArDx60H2JhDspN6MoBBHj0U14rTAg5HUmpwIsGBM5evbd/gXGj6yKiDYsJKb6HQ
 eRPvMIR9ikDdYDuDGcrBVlMCuqiyonLx0uqz/v4/fkL8u2ntQZKAhVWfUs6PwSPOAyr5
 6qBBQw+vAPpUwALognU7Ecy1mEMOnVy2n//h6uoN6Dr2WlRchs6ONKVzY4nU3MjNy3dj
 mcoKUpSlG6TynoHi3xRuTLYXmHlFttgrBpIFzSO5Wh0mFLxquX3TP2OpkLlZzxXmBY/7
 PMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793886312; x=1794491112;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4xHjQ5+iisONzPEzgfEzYQovtvJlwye3sZPa+H0ZY44=;
 b=0JiQiLJFzr5zFyOvoKkYR/pIYG6tWaKxnyZoQ3S2YoIntRSl3gFFL0J0+lgMcijlar
 HzAXtIGgr/noPrFx9qrSEGAHLTJyDJJsAf0tNTMigJbm2n2NgU9ItDx8VQSyjvlTQlOv
 Wu5M+PRs9Y/tcasDT1ws/HWz9TeIZu1iCrJtQXUIhg+E1TlFIgLY3i9qJcWYUZZJlbwh
 RFnyxeExKtJ6t6DQRe/wB+I120Lk82eeO4X97XIJZIZ3SpF5je/34VZCVRvHAwZtHOiu
 yT2b02l35FxXSFxGStUwAgKOfDBCTiP+2iAvYLI+IffT/ezIGneH/aj8KpbtEiQ4R1Uj
 I5Kg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwUbmCi0jPopY3QYY/T1PlXCA+mEk62TGFzSf8+weGtgfInG3Wcre0ueZfxWrWeCSZ4OnncoUgH4A==@nongnu.org
X-Gm-Message-State: APuU4Z+73hAhzdSZc4YVck7DoYfPLDhnKg+NYp4n0uKowt4cW77XQMnL
 +Cq2fmyLKBsgTcSQHhVwcpRk/H2BFffdy3JjGClWBU+vwp6OunxNOLpygzj12aspRr7qALT0TT3
 Mz8zII47Vcwk9gKakSe+llkvFEkHmawjw+936VAjkFQ==
X-Gm-Gg: AYBFou3eti8wVYfwPCIGn6iW8S8P9eIGzlHeV9ApHsCF9YCLX/6LmnclHiRbYecKAXK
 3ZAhLcq+nfAbtnUpzrowYLDNP0e2rbwoZNcIgy92Yq1ti2/auO28bSzAK9ejLJBcvxaArfbjnrR
 1QBp3HfbPM//LfvMgid6Kam+FKzai8yDklpSFUg0drpswqyp9EKyddYbBfigVYQ3J+2FxLaiLo9
 mAlFJDCFfLcyYVo1K7PHyycVj2Obx3ej31pd3387QkG5sP3D1cIQ1YQsoTnaCpf0tWkFF9y2LaG
 hztzQUu/TP86m7PGZbx0GVHnDNy+0s53sheHgvQ80Ml8j47HUctiWb+yaEDV48+5fO4NGW0zUGQ
 miMbu5xGMYG/kB88fQgxjkW8SBbac1Oa/r1MCEu/Tc2dWRPcWM13xqAFlK0dnJLGWdLUgiiz0Jb
 T/D6qDZU+dg9dBbhAlf+fI
X-Received: by 2002:a05:690c:c146:b0:8b3:2e4f:6bfd with SMTP id
 00721157ae682-8b3388bee1emr3520397b3.15.1793886311578; Thu, 05 Nov 2026
 05:45:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031164009.2048-1-luoyonggang@gmail.com>
 <20261031164009.2048-7-luoyonggang@gmail.com>
 <auxgsFyzv-5UiyNk@redhat.com>
 <CAE2XoE9J++-BHL5BDx4_jxuto+xwVmvFS3F-hE9gLbgfUmaFdA@mail.gmail.com>
 <aux5vwTnbV3cXcFX@redhat.com>
In-Reply-To: <aux5vwTnbV3cXcFX@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Nov 2026 13:45:00 +0000
X-Gm-Features: AclHuK8Nu7VnKXQFeeQWzk1m09hU7tD29uXNUYrg_NDcofC4G44XRULIcdXEzaQ
Message-ID: <CAFEAcA97kTiGVdPO-QtEkQ0+AuVS1z3Ctfc-q8bJJnEqFwavCw@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] target/arm: register separate max-v8 CPU types
 for arm and aarch64
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Fam Zheng <fam@euphon.net>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 5 Nov 2026 at 12:42, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> So that essentially matches the historical semantics where one
> CPU class magically changes its behaviour based on what target
> is running.  So in that sense, it works, and is no worse than
> the semantics we've had for 'max' models forever.
>
> Splitting into 2 distinct types is worthwhile if we want to
> make it possible for the aarch64 emulator to support a runtime
> choice of both 32-bit and 64-bit "max" models.

What would the difference between that and configuring the 64-bit
capable "max" to not have AArch64 via "-cpu max-v8:aarch64=3Doff"
(which should work today) ?

-- PMM

