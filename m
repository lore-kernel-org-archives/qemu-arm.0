Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp431309dyc;
        Thu, 3 Jul 2025 03:15:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCVREI//a55xGYKzwcpovX1VFac2vp0QKErOG5QQr2HAP0s1HXBrHEs5ZXk/dy/+25H/6IbJYgmjlTng==@linaro.org
X-Google-Smtp-Source: AGHT+IEF5FeCCTGlV5KXIOhzAG4ARuZL/JP/FP20klsOjxGechZZz9z3x3lP2PrdIUlgnAoTn37h
X-Received: by 2002:a05:620a:1a24:b0:7d5:2332:2830 with SMTP id af79cd13be357-7d5c4717764mr839167985a.33.1751537741830;
        Thu, 03 Jul 2025 03:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751537741; cv=none;
        d=google.com; s=arc-20240605;
        b=BoslTzC1ksMbKpiLAq2EdjKOGXbLbK329AdQZUvvMPbjIBrjR0S5NLBUSNWXaMW/DF
         R4/v36UHfPXmboK6aznbiWq4IUoveeiEPom1OzakKW6PbbxhRHByQAWfV33JCmIL9Uey
         ARYwwFHQA7foeyWHXoOteIc3jwBUE8j51KxXUZJ1Je1U6ykpKXMickMF7qdmhwDzAxOs
         b4y8zS/1jHup74HFRMETCrPfIc1W5H2uvyy8YIpG1mgGsCYGAZVjuEs06kvVG6pWtwqp
         rJFtN18spiyKiB5rn7rhmVu6YoG+P2kz3xDkViPlea10gKFkSoOpiE50CpfTZ/9DBz8q
         XeHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8WH0JmMBT6AWG/mNHZQ4kH8iOn80Ux2TucSB14ZqeHw=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=NgOqRQRik4diiwK8wi7zWXaciaSZqLlwqA4MwYHsr1HJZOTGCMff1QsvNCIaWPMiDc
         WkNZ8nBxcWxDfr7B5IfBoE3XUnWjQOQdnQqVetMOIqiHSCl/XQMgJK1OXXIstwo+anzd
         lJj13Oz00hVIh/k8AcVT1N0X2Za8Z+lAVowKP/LcCiNc90mQwMUAG8nRb9IECgdyemNH
         Qjul5VyRwZPvpnaE8kW6DUgh0OsOJzWJFQHVuzxFLEy2Pp3lcDdSNJprBbciLprhEfwu
         8V9rajCF+ocCLvJw8fk9hCmw13WLPL79H379Z8SePx4xfVwLG1bUE206ET6OKfIAPE+B
         zKEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SerMAURu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44324c92csi1357783485a.366.2025.07.03.03.15.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:15:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SerMAURu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXGyX-0003bw-Tk; Thu, 03 Jul 2025 06:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGyK-0003GP-FH
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 06:15:18 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGyH-0001aU-8l
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 06:15:14 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-711d4689084so85051437b3.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jul 2025 03:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751537711; x=1752142511; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8WH0JmMBT6AWG/mNHZQ4kH8iOn80Ux2TucSB14ZqeHw=;
 b=SerMAURuJ4KkvHk6KsSZfunLKVUahqivHVP6fuXon8qJoNSrT/QrQq384KZ6HJ9hkj
 SBIQG0FwDlVA6/KJhGdcsTl/FMdCrZhRtzh/iZ9JdmRCjg95AmfTxiBrvo9J3/+4kLRe
 4ddB+iQ9E7s9UR0n0G6FEUzXTCg4A1/LKMhNugsslyePOzg3EaOXHDdPxrW0cnIXFSKJ
 VOEyQyVRMwUd2aRRQJtS7yEbRI1oWUv4fZRy6Q+tpceN6lKGQ/VvYPPhqMXDggKYwySJ
 JZ3ggXjPGMoH9YjcyBIUnJAHDcmD15ogSPhmwC2OYwk0bsrU6AEayQXcPW84ckUAJT6q
 4utQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751537711; x=1752142511;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8WH0JmMBT6AWG/mNHZQ4kH8iOn80Ux2TucSB14ZqeHw=;
 b=U4k5GgMWWeGGlm9Q2KQRtaVWYf2zzE/B07+uoAeIJFTLUoEZ9Lai46trpcdasHZLHN
 SDGI+soEjaApvh4cK45M8RH+3A6POMBRvMuVNDcA3NhVBhCxMnK9cx1hW0RApdLSzsBf
 MkfjfTMmIw172pXJ0KNerKQuwAhUMU6HOmNGD9h5pw3xZ4c9pFX9W36nVozhlpZiwkee
 y9OH+8HtA17WbUrkZsDdxEVzEKWSPEfCcvBecVy2WEf92QeHMxK3pFjLeUn8UWWEfAOC
 h8ls13xKMyhSR9aniREvBJbQWTG5AVfiyxRbnxxG4SVPAyfNesa0gt2gBkut3wrg9FET
 hfpg==
X-Gm-Message-State: AOJu0YzuWejUGuTIiEUf0dauwHshTWSYK9U0mg4sej4ZxaxEPY/pXPZ7
 PxhoC0E9rIEm5zewcIpaIUBJ7PKNl7BxZWli+jR58ynuJsxSc1wjpGGgsAOy8qEbp4VYKtsxCAO
 GTGceDnRPvfF7mhrttZRXzD7qjo3Utk3+QTO68LUPHA==
X-Gm-Gg: ASbGncvedNceFxsuTw4d9BDNktTTkmpGkkab/fisf5A+OB2t+ZawmsP0jxFL/0u61dz
 5AlisRRyGcOPBhjoMKWVSd/oBf98uyARxm6eaprHxB50ymH5qm2t7zZO0Q9FyLntE3z0KZzU589
 qqyPmWxRO91Tz+WqztJr/XKJpAEryr5aeAJinM7dq0q3pF
X-Received: by 2002:a05:690c:4986:b0:70e:2d30:43eb with SMTP id
 00721157ae682-7164d358adcmr86988817b3.12.1751537711669; Thu, 03 Jul 2025
 03:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-48-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-48-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:15:00 +0100
X-Gm-Features: Ac12FXzquvm_wKyXF-enRT2RB-yaVR0l_VBoMhuX5XkIGanGqL4tiXFUQvVsRHk
Message-ID: <CAFEAcA_G8xXBdrf_QneAKYz=B1A-YPU1iqzgxWZ9nC0fwuG5jg@mail.gmail.com>
Subject: Re: [PATCH v3 47/97] target/arm: Introduce do_[us]sat_[bhs] macros
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Pxjn1MtUuYgm

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Inputs are a wider type of indeterminate sign.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
