Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E98CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 15:55:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBDhU-0000WR-4L; Mon, 28 Sep 2026 11:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBDhS-0000SH-Us
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:55:30 -0400
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBDhR-0006DQ-H7
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 11:55:30 -0400
Received: by mail-yx2-x0f.google.com with SMTP id
 956f58d0204a3-66f7f72a284so3080480d50.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 08:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790610928; cv=none;
 d=google.com; s=arc-20260327;
 b=BjMf7QfhpxwwjbqUdBvu2FIP8lzquXUcijsqhvWXjfjbijNy+smacvh65UlcSQY/QM
 p6/E/NzfM1IrIPZPGuGXJ8/rkWbjsQkNK5YKMDDNOte9Io+/JjC3bbTaJTBmD9qJY3Ac
 u7Vv4puU0mB8/lJx90CExX6wmDnPyHO+PvR991ElnvVRlfNFi9AwhkuMxXcUnRAtpQGN
 5uNJGipzD2F9L4tZLr1pdqJL26rJDtDHVudTpOK4JrIO3IZEmsl69O4G35qW3nqPJNrA
 2itoUKKpkw92aotwLAy0F8Dsghtk1ba57BAZbGfFFscPvaT6XCbssMmW505iLUkAW2zQ
 d1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=qEhnR9xm4iKIjH/9JsEUOpJsPRWZSCxoPNER30ttDt8=;
 fh=E+PmAUpa2XS6s8NboqzpeQaSxzHuEZwh8qvAPY1Uchg=;
 b=eBhq7b2+oLlfhi4boU9wVHnXxUgU3wRHKKAO3qbtOt5VA6l8v8bu7j+yG0kzdMt3LZ
 6ZfSmcHQWWJQB9JqLId9PKdNBbcFDhdEeexOKTLUw4vV0y1w+ki7vH2d6jVJ+j/9llWy
 zgpbjMJ3yPKeeoQodTLj56LkWMAj4lCA5oRcvkypBabMF5RvvS2sg92iIkkcUMmxkJT6
 JuMRMgMY7j/8FG9xITohjcFBCyU08mA+V20UybTwT3+VrlJlesi96wbXd//KfMl59PV0
 lD4ygT7xHXXQI5AsPVNQZS+zT0VQSqLf4evjnDNvKXIYHs93mVsSpo+9jMeCalELoO3C
 eLnA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790610928; x=1791215728; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=qEhnR9xm4iKIjH/9JsEUOpJsPRWZSCxoPNER30ttDt8=;
 b=ajaASGykLVyYwjwrM2YIgq4W3ZBiIR+Sfy11fdMQlYPCKXhPHgsESbUi4Tab10Ke6+
 +cb/4hmKnJsyTf8RODBfHy7n8z0bnmba8N3zTfpTGbDMQajcT8dmOYzUiouEIMCPtX3L
 3DbKGzL5zkerN8fqMnwwKseXt5x7NUGeGPYwymdRKoEassv+Q/kxCwLkovB6t1Ln3oXV
 thpfAm3oVkAU+0CSAdeV/Xp1LKlwr5mqfGyHbVG1Wisrw5wJuY01FHdC35KcntScQXB+
 49Ih3sbl6R7rheOI8EXT6qimlcXBIfSV8TO+yVnepbUBVuXg3J3RFwKb5XSmpMzY51Xf
 ysZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790610928; x=1791215728;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=qEhnR9xm4iKIjH/9JsEUOpJsPRWZSCxoPNER30ttDt8=;
 b=2anKtEl0++u98+lDYNtmOmUu2i5Uwh8M3vIjopUUijmgh05ggQA1jI5S7Hy6amLDck
 bCx9V/NwTeQJe1MxHC62hQM0FJ5p5pRj7NWWx858fRWiF7OZpjFDavXbNu8BanMcHf8w
 MedKREmJOKRSDtZ6QQtgwq3nBcaFRpf1GIrcW8EcWdIUnTe05iJjIxRaQK5dr+pfU3TN
 Ow8nximHkLmaPIKI+4CS2u58L249AUahuBi9fhKL4vlIEtO36mx3NEwUHaNDM6KP3HfK
 2qXQ+A68Fh2EykDNhhx4lh298R9ZorcKZNdKr+hhK2GK8D1S0iq6epYpx9kRVt6+RUA9
 1KTQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzn0xqa25fR5wSDaeS5Xsd3aYv9ImTX7BoN1MBWHD4PBE8Kqv1vaw2UyRNLFueyff2d8viUE0qKMw==@nongnu.org
X-Gm-Message-State: AFq9FYIMfBC+FhkKwnx2d/JB3g3ICUWe/fVcvikDp1syaaLtB6zYmjMx
 dowgThcAmzz3y1sT8LBZRQiTYUK/7EAo2iq+f9QxSX33uaRo2P/m0EXKGBeqVKIs61iKp2sz9v+
 YfMD5bBqkIraxhqij8NAJR9eJHt8AMS6lH56zXSWmww==
X-Gm-Gg: AYBFou3AiAhhX/fGfDQyfXE5xqpHWFM6mrUIiOIZDu1dMTbtjghPHYlZyX2ziMMP/Wy
 3YgY3ZDyiX5iCo7iMsp8aS0V24X8EKBclV+r0E6K00iQGxfkMbF57nGEuLq+CDIHvIiUzuuT+FX
 pOYPOXHvhoxT2e7x+9HJC6ODYkGIKX2+os+6OA3b5q68VXPdWfCiPWVxN4G9kqQe6MWz7duJjs7
 sU2HH32SzaGkVX3uueMr50u2Sw3Dy3flbxwUErlm0MDl5fZQg4QiPO5VCPpoJecH1KCgiwWDdM8
 QymGpM96w5rnfUXFPpC2r5rapimJYzcm3K/LOLWmXSvsMdr+jIEjMhbuQsqc+rqS8IvjXaES3o3
 Ln+sY5/N+SU67Jpqgd+ytR5MYwSJBWlyCQmFML+A=
X-Received: by 2002:a05:690e:1246:b0:675:3b5b:3c4 with SMTP id
 956f58d0204a3-6753b5b0461mr2399674d50.106.1790610928180; Mon, 28 Sep 2026
 08:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260904043742.96613-1-mohamed@unpredictable.fr>
In-Reply-To: <20260904043742.96613-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 16:55:16 +0100
X-Gm-Features: AclHuK9kFQdVBSG5yzS1c6px1zSdv8gwtOzojkky-v-5N8O-sWFO7p8YK_Wlp8E
Message-ID: <CAFEAcA_mfey4ue_6vgBFxihnBXryKWspujyp43YYXf_XuV-CPw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hvf: arm: add experimental VHE (x-vhe) toggle
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Fri, 4 Sept 2026 at 05:37, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> macOS 27.0 has a pre-release VHE implementation. Add support for it in QEMU.
>
> The first patch in the series is an independent bugfix that should be backported to QEMU 11.1 too.
>
> v2:
>
> Add:
> hvf: arm: expose E2H0
> hvf: arm: ignore accesses to CNTKCTL_EL12
>
> This is to have working KVM under the VHE configuration.
>
> Mohamed Mediouni (5):
>   hvf: arm: advertise ID_AA64PFR0_EL1.GIC
>   hvf: arm: add experimental VHE toggle
>   hvf: arm: advertise EL3 support when VHE is on
>   hvf: arm: expose E2H0
>   hvf: arm: ignore accesses to CNTKCTL_EL12

I would prefer to wait with this until the interface for
VHE is not a "private API you have to get at by playing
games with dlopen()" setup.

thanks
-- PMM

