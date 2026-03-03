Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C111FEC1428
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 10:35:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxN5o-0000xK-NF; Tue, 03 Mar 2026 05:35:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxN5n-0000wY-Lw
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:35:07 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxN5m-0002Vo-D8
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:35:07 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-64c9a6d7f81so4878226d50.3
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 02:35:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772534105; cv=none;
 d=google.com; s=arc-20240605;
 b=Cu/LSfE6f3qw//pq/tyAbtG9z2V5w9KY6S3ruZvCWV90uVWuF6hd9eLerOlTKfjiwb
 jVTzw6Pm7O87nGOABUVgGdUY3aGh2Fg6yrzNzgftLrOGgb9sLxsmQkx36nRkIybW4b/d
 I5uANNv5lTnIqWzboWtRABa/fWwxTAeUPvbdt94th5pJus9sfm8EGUPe6aWNNCp8a+gj
 BRjGTuL5krjh4ioH9lFUyAEYH84b93QiiGsJ+Y5DaiHVMWKHwi9hcdHbheRHoTnNm4OY
 vzMf0F28+ZJ1BYtRFDaiBh+q5k1Q4vVIUC96XuSAEUTmgdlyS+aiYB/iePHWho0CrFRj
 3BQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dSWjrtdeIUWh6sCdK0VCX1EPJa59CvceicwHt19+cuA=;
 fh=KNxhuBjtMJK3k0/mZheSZvK1fg6U50Fivrz4v2ozyQw=;
 b=RDc3fniUHPCSO1R2Xzn+SKWdFzgqRMObg4Zz9vel9TBLO6Fr10H/DYGmX32Mw+ioXT
 4Waeq7z3DjE5OFba8qWkAWyOIT73Bknanemufe8l6lkDSqm/rNNcqkcEAV6mB4rj3hYl
 yCnaqtnBgvcRcLPZScfVrXrtLnItKZDqQm1nCrmEQAHq7A/uJvO81K4sqwoVsSjM0nXu
 tcS1QM8CWlhglmdKE+UwZx/WmzqFIsZK86fAXxLDQECKq77lp4qbBOELwui+eTHgUG1Y
 4m5hBH6qxXE2cX6GPOG1D+rMt30E/SVo3jV7+BTKXEsJekLDONKT+psz9tPH/ZRNcrrJ
 KyDA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772534105; x=1773138905; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dSWjrtdeIUWh6sCdK0VCX1EPJa59CvceicwHt19+cuA=;
 b=H/gY6GKN1GL0htts8qEapItx7hgjdnMteUM0Zh7z9bhkTYYPJWZ+oC7suWMSe1xk+8
 O1AWhr+Oa7YDriPnWFnU3X2Tsskl9vcknfNjWDSQHTxzu0ms8tFdqYnY2NXy3kkQl1qx
 mfHxNdE9MW9XbAEP3ysyzMlJgHLoBY13i4QoIJWyOE5NgqtyToGp5zOKCFD/N0LlpEO3
 bdXJ5EOGnwciKYRO3/zEgLuJTj1OQEn6PIcYmeCpSi96ZRf06VbOwan8RUsqXjvEaYK5
 /BfckcP34sc47Ct9s0Ks070C4pSHnho6taWCf3cQjwXMK/igTuusYv+K5lkD3OSnKctu
 QKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772534105; x=1773138905;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dSWjrtdeIUWh6sCdK0VCX1EPJa59CvceicwHt19+cuA=;
 b=jcEmVmCqTpvOLQ+lGGi4rVDZJq4Drtx507rtuC8Cu4gxrcdndGducKcDGzxy5lMNfJ
 ptlSZTBAlrqGV/5r0eAVih0ki9SOU2tCTblwFBc09obp4ruOmhCApORS5Uqr5trpDfNw
 D5GLBwvyVUE3f/8s1WnClIztWvfDPl3G580tHznX909XgOc7clSaQk/UEEfZMnAQZmHH
 TzXeaCHFW5dpHJuvrlhUKuB8uKkuMV4idVO1/1HhIQkCfvVwVFi07ACd6BPIB5NILCGk
 KUKVwaYc5HPh2jQH/JdR/QkLC4BxdGPfavNLxPK/dB2w50WiqWlRIx6gulfQ2SFe04Rg
 z1Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi6s8tOjphBVWBIIVQQ2DOMc5yoRo1uW3UT0W2w139/VeaDwejzhxSrqY4xVSuHOdla6RuKFhpqQ==@nongnu.org
X-Gm-Message-State: AOJu0YyTKjdNu7IS9FLc9uHlxmPRTtCW3xwPYIZdRf1bKh3ARLCzCIzl
 M+Uuk87VtR5QgNBqe/9jJZQeObkG3cTZI/w/iuJ1gcJj+EqcbWotofvW9WP3vRUno8HRIfmyVm7
 sh+nzRnfpORRhGERwAQW2AzOdygbIvlXIBdAEgiMpZQ==
X-Gm-Gg: ATEYQzyhwTELegxuPSzPPLS2wWEAyG1C6Y0L67wohdB9FeC8nmqdHCMP8EfVxulnV1h
 fqXdv8LCv76yYm34toRUcSFE7/EP9YqBpjdmf5Qp/oaB2DT17S5eikSf7XUUIY1Mr2HfCdJG87W
 Ya/x2XBoWKYWfD4XJ9qAPoqdzFE3Mi9TIHz866a5dAjZiL1/GvK7feRZOz0MLq3yzB+LDD/7J6m
 vdjZD+iXdANmQs2iDwZFXLkb4EtBFw5A50lumEUzGwx8RFZmX4kckht4lUM4UiQoaIKbVgdav76
 y+VCGSTePufLu1izMcjXcT4sNbJP5YCAfJO5qcae49MbbWrbYXYB98JsTjpFRCfWgaQ=
X-Received: by 2002:a05:690e:4499:b0:649:443f:ab2a with SMTP id
 956f58d0204a3-64cc2183cecmr12149354d50.37.1772534104664; Tue, 03 Mar 2026
 02:35:04 -0800 (PST)
MIME-Version: 1.0
References: <20260226100232.500781-1-eric.auger@redhat.com>
 <20260226100232.500781-2-eric.auger@redhat.com>
In-Reply-To: <20260226100232.500781-2-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 10:34:53 +0000
X-Gm-Features: AaiRm52lukkB_g8SRT_SQFgiTlm4nV64BKKWCDx_0jgabEpmvBpQqhMfVLzUwYo
Message-ID: <CAFEAcA9Mg8fdazeBtrg88k5YYHDyYNsWXWZsPfvo5sWcYGitog@mail.gmail.com>
Subject: Re: [PATCH 1/5] vmstate: Introduce VMSTATE_VARRAY_INT32_ALLOC
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Thu, 26 Feb 2026 at 10:02, Eric Auger <eric.auger@redhat.com> wrote:
>
> Already existing VMSTATE_VARRAY_INT32 requires an array to be
> pre-allocated, however there are cases when the size is not known in
> advance and there is no real need to enforce it.
>
> Introduce VMSTATE_VARRAY_INT32_ALLOC as we currently have for UINT32
> and UINT16.
>
> The first user of this variant will be the target/arm/machine.c cpreg
> indexes/values arrays.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

