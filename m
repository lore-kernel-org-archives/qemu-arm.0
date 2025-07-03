Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp418974dyc;
        Thu, 3 Jul 2025 02:51:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXR60GdDJfnRiP9kak0chIEqcP15weO4SHrwmTSfZNuu0JVs8OtSRfBmFfaKBfPV7rDdu4bzYnppzD/aw==@linaro.org
X-Google-Smtp-Source: AGHT+IFNLqHidRU0dMkHzae4oOJyyIniyL4va/V7xefXUyBUsptT1Bk0K+xWndw5qiCZU1Y1PEme
X-Received: by 2002:a05:622a:4a0d:b0:494:7e69:137f with SMTP id d75a77b69052e-4a9769ba193mr100621311cf.42.1751536260223;
        Thu, 03 Jul 2025 02:51:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751536260; cv=none;
        d=google.com; s=arc-20240605;
        b=EioYQAc/okZvd0VWG5Fk32gOcAcEskGm6pzchMDcwri0q5vODvWIAfIw70Pn5bLHs8
         f733XfTx+4z3h+S15a/21H/ggX3JM5FgbUWva182knZetFZixHKzCVkcsmjG1i0Z0+AR
         kRkoemfg1UBo76Ff+qXWw0FYFZlvDmaqBH+w/oq85zKGlo1FsvG69J0oRBMNI5B/V3bD
         BzMb24VZGlReoBri0ASzYpX4Akp+cLMyp0QToFMjCitxS84c+M7UNC/32TlNfccqyuML
         gz0pqMk6yRwsIupr9DXVhHHK3rWKsM42KNPZLU25+x3b7Lhj7sKDv1LxG/VJ85HcO8dE
         Waug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BJoVjilzB6RDEDJ9vIifAy8Oz9jiJnzPiIAOzFxI3Hc=;
        fh=sYtT3k9Ku2r3uEDE6FtYlZJAqF44q2C0/X/cuVWmJdA=;
        b=W94qA0+utyZOJjn4yhCumABU8qBoOcKWbJ2c7ED/y64/P/HmekAM5dSxGDJJ1LJDxp
         r5ygdxkILAd+WfjEXcNGUK43MeAuhD454k6H7cBsNH0Mvypk5YEjaEq4UVmQtE5Y6/E5
         5PRC3spBGjIfszgzypTieBAkAtY4dOgvyfRx3wEdwWBgcljC5g/Uqe+tc7DVR97CA1S+
         gC8ENaccJqt7n+QdXBXNs8t4Ont0Td37lDHu/nFE/GvTmbXW/ynSRtM5NG6kxTen/6iZ
         oFQpO/5TUraGzkA5dLN517Sg/9RehbvftdoqChldi938ZPLNEsM5rikMl3w8FJFKoY6F
         YfYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4CPVYq0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a804858b15si145654591cf.467.2025.07.03.02.51.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:51:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N4CPVYq0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXGaY-00080m-H4; Thu, 03 Jul 2025 05:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGZr-0007Nt-II
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:50:04 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGZq-0000V8-0Y
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 05:49:59 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-710bbd7a9e2so55812537b3.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751536197; x=1752140997; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BJoVjilzB6RDEDJ9vIifAy8Oz9jiJnzPiIAOzFxI3Hc=;
 b=N4CPVYq0r4GY/NlpsOgCjkuvWVchXUoxBMtzLARwawQBMA60Rz1h4HHJKk61lMY9W7
 AOWecNLb0T31RLlzCZLg1vx18fSgcTwX0T52Y1Ltn9Dlh6U6LHAQgYHqeEYuplb7oiVQ
 Jp1+1juoOr8DVsc/APT5N6cv4FxkfY/sKmVYn7DKB34jb7hXEu3HkfOqZthNzJAl3VBC
 OGTl6XunukGTd9LsNRhwlCAX4kPb2+nEEhsS7WQqtgVp49q9xQjjdIgUS5UJFY6lPnne
 m3TCBV7ax6/n2UT/IyFyHwwvsuHB0n9JPM8Av3McQHPium1iWm9xnb8jNrr283PAPtUd
 Tkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751536197; x=1752140997;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BJoVjilzB6RDEDJ9vIifAy8Oz9jiJnzPiIAOzFxI3Hc=;
 b=eNJm5Su1QRBmlFkfY+yfM5uiIlIbq6M4uwwAXqcQHPfWAEbZKoZKKM9ZmFeVQPvgMs
 OAukxVRu7qK5VPemrcBG8Jos7jp184KkADTCedsssCsEa8trmRxxJJDsbxwUjOty9IvH
 yWKkNc6IR9zG5uLu9LfP1BNX57zfJ9Hn1BIC/Dh04zlvY0VBUAhyHDrqfqqPP668YXir
 3DoTTsUUKJvLcCui/ZFqFMJ3RgEzQvqj2OP61JvuATlYFmzYkn6oLCLFs1pDwS9WfsLu
 oW76oK/2HvXPX1oZ1Y6i4G1UhR0zuSzZnFmMsInWYOjlPw08HAxXptD6QopirC5lZOyu
 T25w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5RK+SrF2sUdQQcGIwGiAS2KnOaFbDYes2/mjC1Z+1c+I+eXMs2+yZNbH+o7JitPOXH+A1G6hPxg==@nongnu.org
X-Gm-Message-State: AOJu0YyyeB2nbnGk+EVugJQL7nElA3uAEx9k7pIIkJ6FCGIiYIl3GXmU
 Pe2UC4wc7KuT4ZTLzrEoCS1Xlb/Jy3xKk6J2h5MuCvACTQJICKMM7OMrF7IMM+lUVOFm9EpP/EE
 Etak8hd8iIRnpZCcPnztB4lm8DD8joq9HYSiJWeQOgQ==
X-Gm-Gg: ASbGncv51IQh8DLMkULSNkzW3gh3iICMxvg6ZsD8CiPMdDZ6D7oRyR/AEGraVFW36yi
 0zlxnHkVvnlOvZsY7eGGIy2MWZtcAWA6jbw52KyR5clWo2ZZtH4YYTpRDk/T+QtEDDxb+9DAyYF
 NU6YozJ46a6qrBMh9NjXrqxKeNdGgJf0UPrYeJ4Ma0xhx7
X-Received: by 2002:a05:690c:39c:b0:70e:29d2:fb96 with SMTP id
 00721157ae682-7164d4d235emr81444997b3.36.1751536196721; Thu, 03 Jul 2025
 02:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-35-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:49:45 +0100
X-Gm-Features: Ac12FXxG9xC4wpk-tr_kpRZXRDXu99AVOry-PtXFoShv8dYom1LOJlUdJtkNFKE
Message-ID: <CAFEAcA91g2j53UaSO241GQnt=3qM1Rcufg_84Q5uYvgdxT1OJA@mail.gmail.com>
Subject: Re: [PATCH v3 34/97] target/arm: Implement SDOT,
 UDOT (2-way) for SME2/SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 32CN6owvCXyg

On Wed, 2 Jul 2025 at 13:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 10 ++++++++++
>  target/arm/tcg/sve.decode      |  8 +++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
