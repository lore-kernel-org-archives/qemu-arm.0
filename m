Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7234CD5BB3
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:21:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3Iy-0005w9-LW; Thu, 21 May 2026 09:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3It-0005l9-JJ
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:19:13 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3Ir-0000jX-5f
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:19:10 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-651c7ddf514so5710204d50.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779369547; cv=none;
 d=google.com; s=arc-20240605;
 b=HS1ABtWcQa/pqdhs/X6KWUReQv/K+qBAwUT62B/bGA1Gjks0BHjLmXxiaJ0M793cdi
 pBUMpMV4sJgPVpYkS1kGicQOYwNf4A2gALCLcize0iiGUFw3UR8xotkcVzA123SlesDT
 8gohLkARTGQ3Un0QkAHUwjWWxoUEg9wVVv8XAkdJDQkJ6BoE1EapNfOw2whGVoVJMYEe
 /Np+v+d6XFF4emmS0F59ELdqq66FG0YYrnG7q/V5I2E/C3jUtMwpuBrr/AjUs+Zra0NE
 8vvsaGlXt0nIS5S0LpWAQNJsMOgpHvWApsgLig/rxnhtPIgEOjOHXp0Y4wYPRsAzsXDN
 Mbtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4ADeTWTbLEZgRpKwc8gUJG1eyXF4WIMUY624CQyg+ZQ=;
 fh=PWMfhUNF+Vicf+lhVvRf0f/fQaU6ZydFaSw36NeOYM8=;
 b=INVWfcIzBBjUtID0o7HK4m0IvfCDmZHpJ0GX0NvmuGwxCFF5DUiegTXvrc2LrbNYKb
 rKg9lGBTDqb/iC1i5dEQ+HAh3PMqDNzG36ivcYo5LxzIc903ee5BxxFyauHlsICO8F3z
 9+DyMdQBD6Eyn+ykIFFuZWYW+BJpXW4f9zYlq43fVasrHqPefTjlOf2GVhs0wNd2AK2u
 os9HVJ0vP/PXtis9fNBhhxvfljxMi18xd1+dGudOFZnNUjhbpqrZjSX9sqwwcq/Xaip4
 oUZK9eTUCvOOzlaDImPWSesdG4wXAsINlKCkXkqlWxCEjnxWDZF5TIfd6TrK9ttDLqQw
 +MuA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369547; x=1779974347; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4ADeTWTbLEZgRpKwc8gUJG1eyXF4WIMUY624CQyg+ZQ=;
 b=QVhipjxQ0REumMyq0rGFuZWQ7k/KUurfGFxKNH9OVTnmonmXeYwa5dsd+/ffK+cz/N
 ij3fopIjTTVjY2oOaa991Wx5AN1Zpx0J/0Sk2R0p0cJyGucKJv2fL3M7NsrXSvyJcUVi
 fyCmlsOZoavvhj/VcQ96iopA4JcnmiRg8kjWjzsFuGRR7cXMyO/FvrIiQ/NzOJPgGXvm
 k4Gx9VsAqN/ACv9x8D9fPKYy6h7BpIfp8SdaGbgGrCa/qMAfpscapQmEH+aOyM5fbUxt
 /ZEHXnmKnywB3G/1Rxm/iHHn2vcMFr1aCqvbdqhLo0HM66unURRQuNYgjCdETRWUaWes
 RLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369547; x=1779974347;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ADeTWTbLEZgRpKwc8gUJG1eyXF4WIMUY624CQyg+ZQ=;
 b=avVdGbvh9eyzIdAdM8822JPsGXreAfRCuuxiQEYXz0HPfz8muETmvCWS36XCapBvws
 J1y/tfM0kIfCwk3+WMaOJ8VmPqawXXcxSOEYHCWipzISq6XqViF1a3Y8u+6wAyPSAffY
 PI3fONaVTCZYC8tvuYKZAt2Q8uA5IPHtfV7BPd3dlDjQ6oOtths7mJ4wJb51qbigEeYi
 dWEr1cg6r/WP4mE0xTJQVFW6qXt0sz0ZdFRSk9bcNjQUMuqgwjDNvaLhdoyJat4TJel1
 MnN4sHrqD7VYsrCweTMhsxji2XJvwCAxqEqEsCyEG9Ow8dA8LWgL+eLvGiGzT+RYv4BR
 2IlA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+cUy3c1jadzuS/RRL1LlSCGL4Yuo4NDBieDe+J7qpzw8BT7u7FTnzPkucKVXjdguh9s2jBEwQf3A==@nongnu.org
X-Gm-Message-State: AOJu0YxRP5qlM651H5TKhKvFUHV3kDiZg+Tx7uqUJLrQrjLVhZQyjH0N
 D4gdtVJ685U8cTgECRW4tIbkfMRSAljOZAk2zZlRnuvDJxtz3au1XW1RDSBNceQTI4ZCXcouY9P
 tt6Ueb1pxdZhcNUUdfPmjFNKmVt3KDPibmzuVmuhw1w==
X-Gm-Gg: Acq92OFr3SL/xq/pxKFpAQCJM+OQkflQmjQAP+aRBRO/2Sv6DWRMAiWyShHa/yLuzIM
 DgdPJO15UcxtNY5K003tD1av7g5r5g8p1X54S4497KO6jYh5GaaBWIqsoBk7N+MuqDSw8MPPBKQ
 yz3Pe6EkHRj+uHn8N80KD1rM/ocldCbAjnOZCX+BzWWe4iSg3jU0W/8JzLIn/rpIiyzzGU9H565
 v7q23U4P6JrCksg5ZLYXqDf6MrE/3Elddd/vW4xhmvKh02QT/+H2YrEUQDALg/WvKNWawn71LYX
 kcE/KihLcjy3Zev+LWZDHSxcttpH6H64Ml4ZhvF9rTboijnEyc71ukNwqW1vSxI+PwY=
X-Received: by 2002:a05:690e:43c1:b0:651:bacc:77c with SMTP id
 956f58d0204a3-65eadfd336emr1605137d50.26.1779369547270; Thu, 21 May 2026
 06:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260520171820.848839-1-richard.henderson@linaro.org>
 <20260520171820.848839-29-richard.henderson@linaro.org>
In-Reply-To: <20260520171820.848839-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 14:18:55 +0100
X-Gm-Features: AVHnY4KagCTHOrZmxJxXHto_JjfpwLFPOmufqrJLgDI0jubjrm-GqO1PStTJduA
Message-ID: <CAFEAcA-JQxegrEPrhoTNx3Q_1ctiE0EYQCG5Q3t5sVKBvnSLBw@mail.gmail.com>
Subject: Re: [PATCH v5 28/30] fpu: Introduce float_status.e4m3_nan_is_snan
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Wed, 20 May 2026 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce a separate control from float_snan_rule
> that applies only to the OCP E4M3 format.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

