Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDB4E9A03B
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 09:38:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt0UC-0007mv-SL; Thu, 19 Feb 2026 04:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt0UB-0007mg-Li
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 04:38:15 -0500
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt0UA-0005k8-5K
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 04:38:15 -0500
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-649e97f1e99so589847d50.2
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 01:38:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771493893; cv=none;
 d=google.com; s=arc-20240605;
 b=V2pmICGPqCDAJi2Ui0JeCQHQg6wedxpo+eXLa1TbP6OJBXoFAtEg2dipR4fAvgBdAt
 RXQgLbkt6bDS28SY+REl2/vLpFuQQe+nBDxzH5r0RhDyg2dWMoTrI38XhmGO3e9r81nM
 J/v4ffZ6EhWVH5IQVnICLf+wyupAt9nq5n1zguGmy5rCxWBdoX0LKM/h7hJbztz7+v0K
 nZtiH1FVX+4+N84o7QE1M7iIq4xn6d8jTMOMboKD9CZ9cB1hyff61Stk3vswBNw6mVyE
 PDO2eJRbuHo3tpM+6IBcSSdjUbFMK3kfYzMMhkt2A49JbjN3vug3ONBzBr2fmkoeKvk9
 w2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gpuxha4eRNUboHr/8D8+pnu56CeGJjt6qpHHARu8F6s=;
 fh=bg4YYg4tzq5jtRTxtuo2YihrQ2Tun43i+USVLjpQRHI=;
 b=buXr/aLpaf89E38ccginPrsNLCAo6XxL3cukKbLPpaxMUAIExa8Uw9mv0c9ulGF6wt
 XvIU/aJ+FBINnZxMNYVKxpk+T3PYHLMYEY82vOAxm6NKLL9wsaOrSQ6qqsBmuv6WPFh/
 GtnrywUVqWy6+uVDFsiReXMlaLyCfhMsO8NP3RHvzWp2bHjWiiuhtEjSnih3Vno3BXUu
 kPGVKQfbVvW6hylYQHQIOCdfObIe7jckJm8/ibhZd267Q8FnPW85e8MNjQi1pcD3olLm
 JGb32/K+RAN87IeZpYJ1np+2Z1KK+0P9Xe1vPwffg5qluZXptYS8RBeaCThK7aixpU+f
 Lb7g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771493893; x=1772098693; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gpuxha4eRNUboHr/8D8+pnu56CeGJjt6qpHHARu8F6s=;
 b=cEXupcjhTEV3fblp62VxNHmBEQB/nFbV6XVCVl/9y2lgwCVLzTUoSarYQbDW7ClcbS
 YcaWGsBvAaqnsIWVd/ufrYq3ehV98OndSTjnPzHLrA/VED9wb/Z2XnuTwe/UJCtrNXuw
 N3LBYKk2GiRnXPDFoaKf+rVzE+zBOscbUqf9hroWSAKQr3DPKIEfLQlKtgn5RpfQ77RM
 W1TqG7LUT0e5gxkkwbReQ6/uU6L+U+4Q68niN00pnz2t/SCskvoPn5heco41MNjF8F2E
 bYQtzmKtAGNfjzA+Y521WoYBXX/yDlYtshyLvB1ZJQ7h5rc/5TnQZ6IxKneWZon/60GF
 9QPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771493893; x=1772098693;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gpuxha4eRNUboHr/8D8+pnu56CeGJjt6qpHHARu8F6s=;
 b=U6SYbNYg0+j1tvDW6tXYrh6IPLC5cEIkX234jytBE6fwcrQ1zr/9sqkxPQJ6sDorL3
 3UdHHD1glHFVIoRDr6MQZYIucAV8Td+KuID78vxANjeqGHVAYsNgIFEVZAjMxR2dAQeA
 IL22Rw47DANl81R60+IWrSlJj7TcezucKKUvS80ZBVvKCQFptmOvOvKCFJytYS1KfvNE
 GLc5mqnUANziBPda5wsQXWvmGBNi7qRT52Urpgmoyh4k4Io11RSjkHg7ZGurZs1U1zEw
 b0XiionytZ+Hvxe6GJAt/+CagU2uHFui43QymmgcT5wUP2T24Y7I9qTSNkjgVtWgvbG+
 6HyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoWvpkHWbKnJ87+TQ7OkS+TL6QzZE1mf//Q0Mjt4H+H/hJRsi+4A7rrairUYbtatKpg40BESc43Q==@nongnu.org
X-Gm-Message-State: AOJu0YwITZqPhAbTdhEJsBgGXvvM3q+2WTl8EVe/8Y8yDzRZss0F3QPQ
 T9Ad/Nz65AUa2KeGqSlMmmtB1KoXZqQnG7at3gga0oGZ515fEqmrtcevH9Rd9h+qh9xp1iNgqMc
 prIiC4+jn+z05lYYk18b27w8jlZTLjyZcyrkGE7SDSQ==
X-Gm-Gg: AZuq6aK/ORMb2UEE41PDhnAHBXhFix8tH3AANQ+etGn4F65ZXbbyYJpy4fK3h65kyHr
 TVITA+3RVJtw/RxOOA0OdtrH1IdQlz4AEMP5T8EJ1COPCuPJLze6CbwUY8QqCOAY+c+IbNMWmTR
 0msJJVaXA9lt0vtwRxfwm8xARgLsOGMAzHx80mil9grdJirvRt8ZyxYGdylEKQKqVZ+Rb9yxSDg
 TEaj2YYCwJlUcGtx2JmlB+s8awaMsDVhwk19AZ4oZcfcxNYw79Vf0GA+Vl90yMDgWCd781LWsNJ
 QR7Ct6t+QpflReLwToniWtTSfgJAm/B5sNnUCDzIDsSZof8RGrEKYH6wKTpwgF11clNFnWE/vIG
 bQw==
X-Received: by 2002:a53:b6d1:0:b0:64a:d607:30d7 with SMTP id
 956f58d0204a3-64c614c5a1emr1352603d50.78.1771493892946; Thu, 19 Feb 2026
 01:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
In-Reply-To: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Feb 2026 09:38:01 +0000
X-Gm-Features: AZwV_QgPxQm_4WHz5YVXddgB8CRBzKT1jW4-rQRItT93j70YpskswASSwVfG8rI
Message-ID: <CAFEAcA__tnvy9dUUPrEG8jynGGSp9iz0H7Q2MFGdw4--NDH-ng@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] target/arm: single-binary
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, kvm@vger.kernel.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, anjo@rev.ng, 
 Jim MacArthur <jim.macarthur@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Thu, 19 Feb 2026 at 04:02, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> This series continues cleaning target/arm, especially tcg folder.
>
> For now, it contains some cleanups in headers, and it splits helpers per
> category, thus removing several usage of TARGET_AARCH64.
> First version was simply splitting 32 vs 64-bit helpers, and Richard asked
> to split per sub category.

Thanks, I've applied this to target-arm.next. Patchew says the
last patch here is the same as it was in v4, so I've copied
the R-by tags from Richard and Philippe across.

-- PMM

