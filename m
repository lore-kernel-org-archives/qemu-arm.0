Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B20CCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:22:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kMV-00084h-4t; Fri, 17 Oct 2025 09:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9kMH-0007lx-KQ
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:19:06 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9kM6-0006Hc-K6
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:19:01 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-63e17c0fefbso1130488d50.1
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760707127; x=1761311927; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CVwhx/Y3jd9YTRbtqmLkOCCzKA/XZRPfggZEaUB8WTI=;
 b=CFaO67a/oLfMJ9QrBD2/c9qmMtGQE92gOx6Sg/pDRR8V5pGLwV+n6yCNQUREkIUQnq
 aD2lM7HlR09CsDUQrFGneEyL3fykL1tXcP3Bvt+Fug02RTmdNHvFObMs28fn4T1W3/50
 ETD2/49vImLah4MFEef5n5jmjemZl/FpMwdRISLwuNdkmU0sGZsduOYxzDJq5SxUDLvb
 siVhB5fzkMIeoRYb5rmBmvwPRSGQTuKtgKZGFKBZCdPeQeV84HkdPOC3gR46b7hVcfUL
 Lj5HIx+aCE9CAGHo67735KlJW1WmuNvPayfvE8abdRhhduqOKp8jOwCHexHbykD+4w13
 bYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760707127; x=1761311927;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CVwhx/Y3jd9YTRbtqmLkOCCzKA/XZRPfggZEaUB8WTI=;
 b=Ac+FXMVwRN2dhE+1ePVXevWFSOd5d+KrfZLdZF3CTlTxKeP9VraEviIIZ5/nznckQ7
 bB4JBl2XjWWt9vS8Sc/H2cq6gxw/F63fsbKfeIa7bxPsn4BgrfS/JjfIjwIxqj+Uvyrc
 2ml6O40A55J1IkQeu+rE95kiKGuEPAd2Kej+ZULSkKf4VDzXDHRn/PQrBCQs9MTH5oP8
 PipqddRvxaXnURi1P64aJ1OHnisxagG2VVtPOKTiSV6qjnaymOTztqx0o2g4HELlFRvp
 +vylbwhmSfmKf7B6gdKVfjHOuMIt7qqQF9NSjqD2hjORNgMoIl+vD0s3IBVyLL1Ki5Qr
 6hwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYJlxUWKYx26ToORCVZ0b+J9VEVcKtNwU+8jidYXzyfhk/8dn2Ez5sBnDRPhxj7FuT1C8nkYnNTw==@nongnu.org
X-Gm-Message-State: AOJu0YyWbhAZ5btT9HTP50HZyqILtz6SgddVcZ3qJ2KRnmidmmWyMXuH
 FPBv5T2qVcuVJK5/I2elgYsDi5hhSMrB41sF2b0ACbuIJA8AC/op2Y5E/1yf30UsYRKY8+fKX/b
 q1TK/zHyXxgFZez4ZzqwQDsN89kUIUz+z46iiymagwnEjvcdrSS5V
X-Gm-Gg: ASbGncuY5Yi3H31u7LMQB56TSCVCtl6ghPVM5jN/tdT32Bf1TCX10nAiBNsSH6H7J+d
 Oo/WAP4dFRg9vjrlxGd+9ufvXl786/5yH8OU1x1vs7CaSjWTRoxDdtGBXmBgw0JL8a5O5Y+oU4G
 kbAmUEteuDbTEWY0IxdE+HvL740Bu5MzRHF2haONjRjm3tKsyEG93DM/tN0XV1edNtzBXyCWk56
 1uquFy1AlhyoAJ7awCzluDvkbuP96VLsztuplVFMcoOSF0dTowjkxkxZxSh5bhp+kheTugO
X-Google-Smtp-Source: AGHT+IHfEwqoXakU6nTuWLFz3/JWHZ+0hbEjkn+LshmqaNjTUjwQl/cSptR2r+6F0A7aqt3Pjh1Mo/2q9IubPr+AMsM=
X-Received: by 2002:a05:690e:408b:b0:63e:2284:83c6 with SMTP id
 956f58d0204a3-63e22848539mr550523d50.49.1760707126795; Fri, 17 Oct 2025
 06:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-11-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 14:18:35 +0100
X-Gm-Features: AS18NWAE0aEdvQTkLUxgrpK93SLD59xlfe2VkVtmAec-F21-oiILg9wMbVS56XM
Message-ID: <CAFEAcA-AakSNHvFUDWz51h9MvdotBJMc94UdSxCYvaiRWyEHUA@mail.gmail.com>
Subject: Re: [PATCH v2 10/37] target/arm: Handle MO_128 in arm_gdb_get_sysreg
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Tue, 14 Oct 2025 at 21:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Handle gdb reads of 128-bit system registers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

