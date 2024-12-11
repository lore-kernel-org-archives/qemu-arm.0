Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4169553njb;
        Wed, 11 Dec 2024 08:07:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRaQPjn3X3kuSr8qOWA0y3Ub7N1DuM3M578QLTkmCOnjES6vTQe4V9lEpbm5QldLLX7IzwW+QNEpY5ew==@linaro.org
X-Google-Smtp-Source: AGHT+IG7cKUiuAnRA8v+YBVVq/M0qkecXlmrEZwND6uopXmFsBw5pLZwONnjiYHNWW0IVuQ9cV7n
X-Received: by 2002:a05:622a:20f:b0:467:687a:fe30 with SMTP id d75a77b69052e-467953ecfe2mr5460451cf.40.1733933225905;
        Wed, 11 Dec 2024 08:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733933225; cv=none;
        d=google.com; s=arc-20240605;
        b=JRBd9hayJio4+e/cf7kwtb5LWt9ggO8KxhbdAuP17GkGoIyRqEJcYLk6YBsMInua3T
         a62wrK76LaJBuI3SAjAks/K1O5bdh17/PyQruvsvCzSLvZMK70irCTO0nvaTYgbvWksl
         nio77G9q/IzLhz9JHTBfjhvqTD29sy2sU23yx/96AVm+Qzal8vgaACzDImD43OhLemmC
         eJ8PjMDcz3AwNazIV2ZTtwuhNxOM28MSrhhLcSgiAHtcHQ77rZjStI5tg4YAiKTtZLdW
         UP5GolYwIi1sre+Mxoas3WJdLEDG3Kvw4t6pQnRZFPWpGv631rUZrnS2zGOkHCn6zx3X
         KUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VnovJPgixDijZrPnP0lHYxsnngXcrD8HJjXxr8vQ+wo=;
        fh=17XyrV/CZswJg5aJA6nUGpK8fXtUEd1I0gxTVuXfWB8=;
        b=dxOUMXbKmbHW2I3uhwUcmbhE86c4V1Q2IijaQ6ygJ7y9B+pvI1eWe7cnvmBcgjUGCX
         7Kvg1zLDwjT1+2aCJE1YkOPv1lFi6ai/tfEFnv+jJXlYGUVttJj7lWjedQtmeSHLcVpV
         yMPatDF+x4fkNd4tRQvHnZ1CeEhvnqkfvfOqllw7ViI6rWLwSfayBqJ94NtVWIaKIZDj
         /CortacbedgEyFC2nclC4/FU7Ybh+lOw9QS4ixL0ry+BInVV9+CuDo9Vwc84k9gPQEHd
         UVE5OhLINFkaB95JPeclRCriCYwGSmDGHcbU+yomcjsUwEhdXS/z8RP5mDjwW9+jf0zh
         Q28A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2Hl8YnZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46785fad956si31955741cf.716.2024.12.11.08.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:07:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y2Hl8YnZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPEh-0002KB-7Z; Wed, 11 Dec 2024 11:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPEd-0002Jg-HD
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:06:47 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLPEc-0005PC-40
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:06:47 -0500
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e39f43344c5so6347860276.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733933205; x=1734538005; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VnovJPgixDijZrPnP0lHYxsnngXcrD8HJjXxr8vQ+wo=;
 b=Y2Hl8YnZxwL3p2CjeVhP4a6wRP5wVGn7f4Hj+RfmoivghsRojXkumettv154/uYDZN
 1jvWEHqW9OsWpJ/jD4yXJ7ffox/NXh/4w2W9cO1A6Dsi5YkoYCcC3JVuFVrjFqT0D51M
 97GFOcJ8Hl4GRf13u23BCgZULD3odVNGX/MlzUlt/v3/ShGNyow4O9ZEtdtnd/az97CL
 vtaFNJloC/ALOLmHdf/5MnodJhg1KUUf8gO4x9D8O4IoWdU9r/vPn3GHvSHKzkreaeUN
 JZ9pbtilfu35cMkO4X3xvAa0TDd94ugFbuI8px5G2dCvp8xnweb1gtLrvMw9PiaDWkzx
 cgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733933205; x=1734538005;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VnovJPgixDijZrPnP0lHYxsnngXcrD8HJjXxr8vQ+wo=;
 b=O/wBv4eMa/w42UztnuGYYF631Anp5xxd4Hr06ngqI5tHca78Tlf46KXmYmOofMT1KZ
 6K46PpVDpLNcBmSWKCw3r9X8Eg5+umqe9HlGwMGUJFpz2N0KFEUJd0BlvHtdmqX/ooYa
 eSzdFihn/7Vhta/hdfTDdf6QrwkJN2/T6f6Yy5J2M+wKcr6B6lxuW5Ei/JZ2mTZsWxyI
 0m4PD0GwGtIzC86cjAMPzOYbAHLGH22Ap449R3Qn85zj29CBI+fiOBgt2n+SCjurDlCk
 p064YbGSZNhnhMqW+KkTqTm9fVTBrylHQU7vD3hYddCLusQbbtDau8wdsU41lFDf5ebJ
 1FCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqqs+gL5xGenLlqoC959YDBLAFTpWNxsmjkpULZ7WkITG1uAMRsSFEn08RN+qCYFOqzYSCPSlJ+Q==@nongnu.org
X-Gm-Message-State: AOJu0YwlM5ZgBbk+npQWTya/4IDMAwG01ssf4CXBsyoZyWgRJtSwYujL
 B6JyH2AyMQZoSsVTOWLoG7G5P2RRV+UU8AnBxdRIEHIe34jK8cXLAjk1nwL2DTI7QqLlKmFu1Rn
 /88V2iRZ74AshT5Ey+EauyZysGSmg2fPto2Y0t98HeMVeoTwG
X-Gm-Gg: ASbGncuHb0FdICkrX34GoooOWE3dVK3cfpItETnBPqy18SRJlgROvv3fCC12ItX0LXp
 lyjSPb/ZvnFUbLQObaqmC7gKs2940p3kSSIJ/
X-Received: by 2002:a05:6902:1688:b0:e33:121:4150 with SMTP id
 3f1490d57ef6-e3ca022c9dbmr556423276.0.1733933204728; Wed, 11 Dec 2024
 08:06:44 -0800 (PST)
MIME-Version: 1.0
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
 <20241210161733.1830573-63-richard.henderson@linaro.org>
In-Reply-To: <20241210161733.1830573-63-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 16:06:33 +0000
Message-ID: <CAFEAcA98UbhBpYFdCfjp3=6qNFYByBZv0Y-Z=AMOZmazgqKt1w@mail.gmail.com>
Subject: Re: [PATCH v2 62/69] target/arm: Convert [US]CVTF (vector) to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
X-TUID: DClrXeJvOINo

On Tue, 10 Dec 2024 at 16:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove handle_simd_intfp_conv and handle_simd_shift_intfp_conv
> as these were the last insns decoded by those functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
