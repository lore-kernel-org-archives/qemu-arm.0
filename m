Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp944801njb;
        Fri, 6 Dec 2024 07:51:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUGVDRddoPYcOlfjMjtJ+zxkUvujfWX+fWh8VzW/nXzur/jN6SI0AO1xZyg9zgEpCJBtwtAKBrdSCBxGw==@linaro.org
X-Google-Smtp-Source: AGHT+IEP7LsE+AFe78WA8Mam48i4nlMDqaOc7P/Ic2ZU4Q42DaawBB3VH6v+PBUy2lwiqdiEN6NP
X-Received: by 2002:a05:6214:262e:b0:6d8:a9dc:5a65 with SMTP id 6a1803df08f44-6d8e723a5d3mr53038306d6.45.1733500271581;
        Fri, 06 Dec 2024 07:51:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733500271; cv=none;
        d=google.com; s=arc-20240605;
        b=ENqV7nZtkNLITvpO9WFcWrdRmR7RhNOvu+6TbAv0UWLJmukw5ubz3aJC4ljBmDKwFN
         PEnFDSTcrHzsKhxVFLpuyqC6A1cF+J+Juri3poqbt6EP1/yKH2Hl1Ju0bBqk5l1M6Z9x
         hMQjV68AZzYrzDsOD4yURiEgdKikRHnxxkqDMIeKkdvlinsi8rk2wqoowdEmWWLFWqp5
         /z9IXPV4aWHYYwuGcKyQjm/hEL8ZkMXlTYnsEqHnIHd+JCbOlzPwzihit5AL/80n4pgZ
         r6WCus0ZutHGe9GyKYAEaq4AyOAoe78uxSZfu6g4fTxbQ44SEJW3qHrdNiZaJJDaEWQP
         un+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7dwN+5iJ/zEeDGeitQaXAjE3tKiZIOqfGlNo+OpjxBA=;
        fh=1KvbSIU13bOmgY7svJlNizLKG1zTqg6612s3BY0RBdM=;
        b=F4cvc294qXPF3pfsjz3kSltPZuOJoH9+XTIkxeaMuxNHOKdk71mQzynjTMF2QtXS/x
         Cez2vD6ObaU5ym1nJ6QgfaabJDgdbhYtEyo3/GUKMC1IHhHQEnRTfV2jNqVdcXRYaIOG
         pbZN0OXyL2xe/14nhwY0BIQEnxKAcTNEB5R6A7H73VWvKqL+vR3P6PEfMdJI7EbwxywV
         AZvr/f2htzMIXNOdpMhKKfhAkDHFb4i1ixA2Zc/vENI0UvpTUcnIXSeqcx9ftq5aYzx3
         bS+kLFxLaB67ZXFB8Ng4IYVzbfXKSEqvqcuSiHiw/qpmKedrHspwa32EgmEGbwh2xPkO
         Rsvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CLmEQzeW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8f4b686fdsi4209076d6.91.2024.12.06.07.51.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 07:51:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CLmEQzeW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJabk-0000GO-5M; Fri, 06 Dec 2024 10:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJabg-0000Fp-8s
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:51:04 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJabe-00052z-Hh
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:51:04 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa560a65fd6so388789466b.0
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 07:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733500261; x=1734105061; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7dwN+5iJ/zEeDGeitQaXAjE3tKiZIOqfGlNo+OpjxBA=;
 b=CLmEQzeWv4NRmnJER/plMkjYXv5RD/5hlectaamHwd6xkvUDtgNfJTn6VOQsaz8bDk
 P9JxZ1W+4HN0x83WeGxU4g7W8abycV5KD8WVOVg66mXr+qO1+xI02BlDbNifkQpgmkK7
 JL94X5GERr22bKbvqBEhaY48JtuxfgPu6uYaZJ5SrGtqowW8WWA04MOjGVCkWaBCMNE2
 qybCiK1eM8e+uTh8sjn1CB3Jd74WL2ODe9Pv1wxMeAvoQCeY6hz60VuLzHeuNwWHv70W
 sh7+2U/xJ4F6hEMWqXtz6Ayrkay1tjyY/W3aAQQ/Q5ljKxLttyYShxZRwIG94AHenPJi
 kTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733500261; x=1734105061;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7dwN+5iJ/zEeDGeitQaXAjE3tKiZIOqfGlNo+OpjxBA=;
 b=RSa+/Q2OV4jLuxMSHIHOy0f8OZF1dyoC3Rh1R7IycQeNm7OnLH+2kDuJpLQ5QiNZNs
 gJnhGmhmIwb874Cu8cw+Dn5/yjMWwOi5sdgqDCgE5/pWKZWndF2oduQ1EYGAt7jSIwli
 vxSEGt4p81aIJ3LkXO+UOpaw/9Mo3uZZaYrq8QPoZ1z4tvMBuWI+3ZxTYLAkRyJwhKIF
 K3iVVG5vkavgRfi2JliV+AmIRTKBvjtIfR/uPcYT0KvzQMf08Y5SdajLNkm6tWRSj6I2
 msn/8iOvTc3iB/46/eFsA2aR1tt0z6dqtDGii1HMW6tIXhNip68JCdfHRFHx/t0qxpTM
 1bYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+JIwCeQuM8pypOh+zdZ7dGqGQxkjTr7qxCtwAtCeBZkbtPZjxeSbQypVicGg7d96YmYwcTQtCnw==@nongnu.org
X-Gm-Message-State: AOJu0Yz1+zf9VlYkInq9TeNIbAJFMyaM5xAlEmslRaCWXtrHYsBe9CUI
 3v16Tl9q3eeHObaNjhQdui28wdsfg7hZdBy97cyQfr+oLuNG0DAbBqQMpzvssxHntvvyZnuZIIn
 X4NOrPBs9nOkAlJ445sC9dr0ERqabLdKD5nVLsZ+Mt6vAwOv7
X-Gm-Gg: ASbGncvtyqP1gqoybUpfkK5NCrErAlaQPVoi4Fa0DhYVfT8+duiAsxxSppPjgJY1nBA
 THx/pA+yKYCEkLdFeu95FsOLOgLMEyv1s
X-Received: by 2002:a17:907:7da4:b0:a9a:6c41:50a8 with SMTP id
 a640c23a62f3a-aa621892191mr785701666b.17.1733500260853; Fri, 06 Dec 2024
 07:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-51-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-51-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 15:50:49 +0000
Message-ID: <CAFEAcA8bsoLXP5yOEnuR+uy1gOHdGNfPziZ6K3sZ0H6j=oPQXg@mail.gmail.com>
Subject: Re: [PATCH 50/67] target/arm: Convert FCVTXN to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5UJ7zFK51gj3

On Sun, 1 Dec 2024 at 15:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove handle_2misc_narrow as this was the last insn decoded
> by that function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 101 +++++++--------------------------
>  target/arm/tcg/a64.decode      |   4 ++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
