Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314D1CCA476
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 09:51:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v64Ku-0007Ee-Am; Tue, 07 Oct 2025 05:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64Ks-0007E2-Tl
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 05:50:22 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64Kq-0003I8-9V
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 05:50:22 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-77636fb28f6so54851197b3.1
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759830618; x=1760435418; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dd3HAV1p80VpWKfyRd4aQR0J95DXAq/zpGcN7qI7ITA=;
 b=nGyLCvIb+1fqerjozO/MyNuoKtKoaLT8VKEYqP1KVmndxs0PoBEStVQooIEm36f6v8
 +Dhn9MCAfZKA4o+zdSbKpEURGZg9Pq1nGcDqTZG38nmROBFQHfvBgBwQ82k2auHWLHLP
 ib6KBFWG5AN72EIxroUjsWU+P8g/18KBHNjmSSBNk5utyhKzNvKLMQMJT3KS8HQ+FwWf
 pFCn4uAQjjUgQZ/9qQIh+g32jXzP4pkj9HlNmAjwbB3QkPjnfDltyDMBH+YqX3XWgvTU
 6eV2K9wRwoQciTmxbd8eEfy7cphWRNJUEHvn+KZSde9BBKENaMyxUXj6eu5tuDW4g9lr
 53ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759830618; x=1760435418;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dd3HAV1p80VpWKfyRd4aQR0J95DXAq/zpGcN7qI7ITA=;
 b=Utr01zTiZSG50L8EyYu9K75xAcIXey8eloWvCh+R/CLyi8yQVPlEvaQGp7aAfzfWoG
 jW+OgriIzw9aJr5kXzIXXjMeNcCKQQiFNzIUCJ0Ag2Ewrk2ccPaHHOrQ4QnK06yFlXoG
 33V5bpbD//4WKC8eWrvDB0KauVaXIYMXmQ5OhMJfZhUPQN5ymnay+1bB/Ndbm0ZPFMWH
 HrgdET03EPJ95dQoMF4VLNaYGPoPSaa5awcZ0xdqlqAnKfPmxIwc7DStr4FojlkMPwAk
 wduDEG7d5cvh7RLn15AbDjM9eEEZ5NGS9DJIK1lPso7m0o7wVs2/mhrNvWK1sN22hFqr
 uiSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKDJEfbRwKJOx9bXEa9DL2+lcfLfPMeWHn8DJ7I36GzgMzT6s64AAbhhsuqeKXdPB8LfeNMNrDIA==@nongnu.org
X-Gm-Message-State: AOJu0YwcyFeU52KiQI9cK6GywuzfDBqvL63A8dJGMa9LiBm5l8/BNA52
 bVlMnnix0FN4PvltlYsyIerXVzquzy7K/w0etdBDV9TsO+OuwvfGml5ONNi0Lyw3toa9TEUvlSf
 bQ9Cr6hFO3DidzXxrjo6oKA5Ls05Zui08N9pGK3o1ug==
X-Gm-Gg: ASbGncvKQ9YoLkKFe838kLScj1tmEHNz3O9jDCa2aSAf/7VIYnYkpn+J73deejtlTDN
 rOMcINlVpyxUoCSv39+FybWtKmSrDD29Xer4MpQIqAqZKO5C+30pAp/YKE/Bw3VNQjeAeyT83A3
 voC/VU3iVO3fx/Q0A7n4Tm57AAVsMYUIEEkp302yb3vFNrPUu8RtU+0k9CHpgpiqeTSl9KMaW9S
 MqXaZIDk3xRYCmY7eZJ/5o4MgGyGhrGw3Rm
X-Google-Smtp-Source: AGHT+IFBSDZaRfUA0PhdtuZfWsUfNh++pegHP6ING5ZFSMqlU5Zr97ceSyexfYE6nBD6OvL5boyw32b+GV3jkA45qeI=
X-Received: by 2002:a05:690c:62ca:b0:77f:90dd:af46 with SMTP id
 00721157ae682-77f945930b1mr244167027b3.3.1759830618282; Tue, 07 Oct 2025
 02:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251001084047.67423-1-philmd@linaro.org>
In-Reply-To: <20251001084047.67423-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 10:50:06 +0100
X-Gm-Features: AS18NWDc_Dwl6juhRQ_ZxETKrD6zuLry2BB3t0yD1C3-mW6O2QHvLSHkTHTmRNE
Message-ID: <CAFEAcA9_Ysh7CEj5UcEadR-mDSGPcBFQN7V-PvkVg8yLLZnRjA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Remove sl_bootparam_write() and
 'hw/arm/sharpsl.h' header
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Wed, 1 Oct 2025 at 09:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> When removing the spitz and tosa board, commit b62151489ae
> ("hw/arm: Remove deprecated akita, borzoi spitz, terrier,
> tosa boards") removed the last calls to sl_bootparam_write().
> Remove it, along with the "hw/arm/sharpsl.h" header.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

