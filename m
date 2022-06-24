Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp301576lft;
        Fri, 24 Jun 2022 06:02:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tFzm59RmbB+8l9Mn1LOqfdNUoh4nhU7MeKfinPq5k0fU8P1RAamH19YlSvxFWmNwO08UEt
X-Received: by 2002:a05:622a:311:b0:306:4e00:31f7 with SMTP id q17-20020a05622a031100b003064e0031f7mr12625744qtw.206.1656075756818;
        Fri, 24 Jun 2022 06:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656075756; cv=none;
        d=google.com; s=arc-20160816;
        b=Slm0K2bNVcJSCeJqlsZeqGIA1/qCqTXtDVz9wZv3S/jtABAUaep9zn6L/lCS/qe1bG
         mns9SziO6Bp+ZBxSXZSjnqK4spt+bKLKiSQUuL9YjtZbum63HwLpJ9KoUV5nKVgVjKp2
         UsnrZ2rJf9ZvPpSkcMky7TiV8g9iFfIZgvocavsJOy3mYJoGIAfoaigGLj8coBYSNOrC
         YYkcrvw85JnDqA5TdsfwWr8hjfm6vgZMyJNogno/X+0vS2EX4g3UyL8IxxdJlN6OVvvf
         6Yeog4L94Oprtj0eqHDW8tE7g68iAttZ3k5w2dCuLwTEw8oTwCK5b+yoMAIUa3o+yqD/
         wDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cssGOlw3/rNNl0ZDRsVDfMpk5nhe2IrIHnEu6OmX/p0=;
        b=I6/sSfmE6Emfy9saJtVKzRxPb/3EQno6TOQm22kp5CQFAE+j+inHLz2So23yibUps3
         p9w03TSoNvX/j18O+16I/HBgL5IaSMk7DrqiiRXiEo7ZsA0hcNNqt2qMonZDY8djJIj+
         x8DSJtbWeuo9udbXaTcYYJ3dQqLiuXUdYEamipSdPWkA2GlLEczW2jTfsX9EkxTeNPKK
         aUVlNAti7t9b7oXnvEX5E+E4rNP3WuEXfkm6xu3UyARwTd4ZpKfJXbfF2fznSi0faWnF
         KCEU/nWnRnVvM1CT11Ryk7oiTHU4rEGSlOV/FtcgTAXonXyqaZGy06iKBtbscb0WhSNN
         lsiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T3Bgn//k";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq3-20020ad45963000000b0046b8e864d2bsi1387589qvb.106.2022.06.24.06.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 06:02:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="T3Bgn//k";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4ixH-0000F0-Sk
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 09:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ivk-0000AS-Lx
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 09:01:13 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:33651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4ivh-0006OE-5T
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 09:00:59 -0400
Received: by mail-yb1-xb30.google.com with SMTP id h187so2173819ybg.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 06:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cssGOlw3/rNNl0ZDRsVDfMpk5nhe2IrIHnEu6OmX/p0=;
 b=T3Bgn//ktUeXh5X1eY9rwPTJKr74N1Wbpzaik/fMebEN16O87MJfPbaz8Zg+TihJgy
 WkYpFgS5XRV+afhwrikif6JwYXyAcZHBEewfnmm1JxRNS1TNweW1zizO30L+UoAZfIMc
 rbHhoNdR6v/1ohB/dmRfW1rla0IS8osAEnYwgSMz5WL1uUheWkeB5D+PCTir3N9nFgcN
 2U8zVIFE8WAdKCXaYWE+bWUFRBX3wovJrKJdtrY/RdDC+m9/lQ+YAxID+ZK34WnvhySq
 42CqqW+RL3QVNb9EB0EM2M8R7jIZ9BF+7vrOHuO2yVqzsQrdZgZPBSjpGVeLZCyYS1qj
 q1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cssGOlw3/rNNl0ZDRsVDfMpk5nhe2IrIHnEu6OmX/p0=;
 b=i4agN+Hn/5wSZvagqnB7z/rH5j6VoPRPkaukjdLw7Q8LSVpJykLjPrUZut5mEaO99m
 nqXFO9QLwkx1EMlUgVBxwhCVIpPUR1Pr4QHPuhdI8AUAMYeO+9sOg8T5O4WaLPDoNMYC
 NC09DGCf7uloAVCiEJjQ98NMVVZv6Vte/tgigYQ9o5Ezu8HurtYwPT+ZdknxNqdYkciG
 6Whb0KS0W/Rxfzr7pnV91pboedrvFnjgDnM8lp95oFru44CGZCBT71z2ftIafFrPz2QS
 +7CTiCUbI9YerBmaU+Gq5DmI00w50wkccNgIOvBRt32VnlmnCQQ1JDKlI31N5iOrhrZB
 6Vag==
X-Gm-Message-State: AJIora+aBzT2E1ouDSsmKoxCYpFCBlVMBuO4gwTNfexds+kDDy4nm7WC
 fxwDkN+Zv0DwOappIbm8sJ0cx4Rz2IISdnIAEvMpBg==
X-Received: by 2002:a25:d288:0:b0:669:12e2:b561 with SMTP id
 j130-20020a25d288000000b0066912e2b561mr15106362ybg.193.1656075650667; Fri, 24
 Jun 2022 06:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-37-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 14:00:11 +0100
Message-ID: <CAFEAcA9s4jarZ5n80U99Sitbu1M5wdeaMtWkEoMcjRRNQQMuYg@mail.gmail.com>
Subject: Re: [PATCH v3 36/51] target/arm: Implement SCLAMP, UCLAMP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C4LnZegNJp0B

On Mon, 20 Jun 2022 at 19:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Same commit message remark.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
