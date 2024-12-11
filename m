Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4156934njb;
        Wed, 11 Dec 2024 07:50:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUriO1V40MbNB+q1gU1O3LYj04Qzy5VSVcN/AzYEEEruNU/vEJGuRNYqQ3oxNfu07ibMhY2lEJHlPTZ6g==@linaro.org
X-Google-Smtp-Source: AGHT+IHjAzmTOn3Ag9XluehC4vNfu32mZ9M0EJ4jbBNleCO48E96PS7jzZE+RKXpiOR0pzVuB2dK
X-Received: by 2002:ac8:7d4d:0:b0:467:7b65:383 with SMTP id d75a77b69052e-467953ec588mr4126061cf.35.1733932256742;
        Wed, 11 Dec 2024 07:50:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733932256; cv=none;
        d=google.com; s=arc-20240605;
        b=iXwFq4ywSB9CFQmNQSluB967dqPlI5zbDH1ny/MGj10vVGwK1d+7UIAE1VmS3fQtBJ
         pd9aWEMNAXMfMy9bwryRV1iD1hHvZLf44bZOR13k5TdovDeviqcNha+gS6AxgUnb4QqU
         2UarSDs8AMo+IFJBIFwUDBnuVZaw6IO/acqL2cXWhYNgO+benk0gGMqafG7G+tERPPz/
         ylx3yJdFhT1y2BIDJthTTQaTKLXiHgKFrKTo3HVbTQ8/5bWn58Un6ClO0QhEA2+bz/9k
         uQDQcWvIqScOCwdlR49amqzltWQdTwOKd0Q9tTVDJ33PkaUtAl4YKO9CPiY8/BldLUEL
         jVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=J2Y2/OOkfbhybpafVDJ1NXEoF9DX4I1K6zMWGuQvss8=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=CpKyZh8GWeV9eKqMF2X/IkNC0YrBYzu2DqPPvRQ5gHIiSz3xMISSTLpBLWPOo9lGQm
         FmDXEG6IK/7wrs84FrxFAd0DYDCLQKQgVmTsHvU0Y9pKCyhTAU1rY/QktmHV+2+gHSFb
         vfmfm0osm5iyY3JE6/DVqoNcFrcKETF3NHyu9JfJrAhHphVhHHXbNA8wYxXkvel0F5pT
         qFeUQfmJr6OjVxe2hzW3B7jIMMiA9PWiuj7czFNEiJ/yY0B2oSPc+G7douYy/crAxirf
         I3/5WMXqCx2uiSWORMvLwiSwWpUKtcv3rtuSQbXt/hK3Otfa6mo3x6ufui+XzDWv70M2
         GlJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lzm2XtKE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4675fa0e460si104159431cf.4.2024.12.11.07.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 07:50:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lzm2XtKE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLOzB-00019z-3J; Wed, 11 Dec 2024 10:50:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLOz4-0000z7-5k
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 10:50:44 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLOz2-0003Yz-Ho
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 10:50:41 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-6efa5bf5202so63159347b3.3
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 07:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733932239; x=1734537039; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J2Y2/OOkfbhybpafVDJ1NXEoF9DX4I1K6zMWGuQvss8=;
 b=lzm2XtKEX6AmFF1O+grN+qTcqi4SFro+Nz4pTPMkqRSzyUDYdNxPdcd0PaLvRbGCtW
 X2LBnGqI5T+xTjOAFnpZNH2u1LhhGEq7tqDxshNCbc9MuwPYEi/sYWZkZM6vZPU+nhkA
 MOaNOeHDHQX7jtoPpDChebkCLyU1kzJGwlNUktcZzSa873IjLZdKiJjiBhChTrzYOR9A
 jOZ6AVgaCbyeAHVd+kJylRKOSn4IS3euBIOvMOtRm0YyhUUJCZWKPdeCxdkN5YfhsRo4
 qS+pUWhkPPe9oQ9FTzVj6NjtcJe+BnwNbT15iGYyyhP19Shbr3T74NaanitMDq5GLxVQ
 +8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733932239; x=1734537039;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J2Y2/OOkfbhybpafVDJ1NXEoF9DX4I1K6zMWGuQvss8=;
 b=hMPY7vvgdodWCPCzPlSZarSK+LpdmHBG0ZH6jtk4tnqiPC/7AlxsnzolKcvyikv0HC
 7WtkyrXo4Ir7FjUUxG+JbN4LxP2saq6Bcn88f3uDfwoBgxSnp/tAMQJCJ596xtvhjufr
 zMIOq8qSjfTjmFJ/fkFyF5EKyy5LpHPjdJDXIcg9d3BIAYcgXTq3IGPM8bLqNhQ3DMFW
 /jnK+AYNyvtWI1LXqM9jgeD76mD1HxwlWjzKa+hG09LAHwE8FeQ7pf5W03GvmHxskchE
 HX4RPYSCP2bek9N5UK0O5A1Pq42sJvahubisociatFC58QBXi3xTTGQQOHfMtrUPUlVc
 SsAg==
X-Gm-Message-State: AOJu0YxXv0TabJGel1x1hq8A+KmlHFAmp7WcOG+2exPFFxScXOl3jgSz
 /cze50VwZPg4NQvXoUG4PEkVxejjmiRU85AMBdXiYbFiu+lkNyYL3/EEKyWmCJiA7dFu1YC7MiP
 GQ4wE6NmhWoUVacVTTNZaJpQ7owWmejKnZPzlx4u2QQeMxK1r
X-Gm-Gg: ASbGnctDXWr8+BZhvTgsfYCfSnd58xNE4DnW6dcCb9nURXG5n8M4vRDiuLvYZ5R5wEK
 8ph8Ii0GgY2KmLqvcuZxlDbvNt/XKHsznvC9i
X-Received: by 2002:a05:690c:9987:b0:6ef:8296:359d with SMTP id
 00721157ae682-6f17d61fe4cmr1145417b3.22.1733932239331; Wed, 11 Dec 2024
 07:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
 <20241210161733.1830573-25-richard.henderson@linaro.org>
In-Reply-To: <20241210161733.1830573-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 15:50:28 +0000
Message-ID: <CAFEAcA94MKwQpBnr04xNhL+jFFqysad8Ka1XPiciuX8S4r2sfA@mail.gmail.com>
Subject: Re: [PATCH v2 24/69] target/arm: Convert FMOV, FABS,
 FNEG (scalar) to decodetree
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
X-TUID: 39Sa6+MYep+f

On Tue, 10 Dec 2024 at 16:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 105 +++++++++++++++++++++++----------
>  target/arm/tcg/a64.decode      |   7 +++
>  2 files changed, 81 insertions(+), 31 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
