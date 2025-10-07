Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6614CCCA476
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 08:28:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v633F-0006q9-28; Tue, 07 Oct 2025 04:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v633D-0006pb-9P
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 04:28:03 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v633B-0003DM-K9
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 04:28:03 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-635fde9cd06so5575311d50.0
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 01:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759825680; x=1760430480; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNjLpGx1P1UwQzPXRsaQNEN9N+5FKgvGjX5p0wxxQio=;
 b=oV2RK+0GnY+PCNQ5PAqMjlZmgCq4fJfSoEjfvzQgGCiTQLD2e6O2JMoSY0S1YgJqlW
 8ZYTpKS/UlJ0PwdFnWGzNCfC2ahNPUeZl0kj0eoZTBSLPhtJjfUYQU7Hz29J545XNvuN
 DUqEMhHCYcrNMYIYVZMgFWJCsedcqm6TjMOefzopSNE/yLjDPeuTE4mKgu5YbjnN0eVY
 NG/uhGFFFy1CVSQ1OLnd+q/DYWA36zzWMVf7vHEhaO1dPem7AwneePhx2Z5PNYuwRjfU
 n9eRx43GJgcm2WTKnrLwiDFwVAvrbjCvQlbopgx8lrjVPMbYr79I34e+2eQa5aDbFHX2
 wGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759825680; x=1760430480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UNjLpGx1P1UwQzPXRsaQNEN9N+5FKgvGjX5p0wxxQio=;
 b=cxYpweqOZg0N8S5Wlr/a5CNZs2AxOOH+YLnCExgbgyxsVcwoDQ7jc69KzW/KxzFdhr
 8BGtCbpIcqBqh6ozX//9nSK56C2LxjAzskG5rR/HNsexy+B2NFg/JGU/owo+NrTs8M7n
 q2y4OSxxAGVPiqB7xW/SDQOk6E6GxX5fI/lj3WcrLwsSqE7eaoYPE+YSJucW+2/S4TAQ
 te7R/UVGH/9wO2sVQiHmQEtMF5mdFKHSaa+/MPcnIT7l2+PSF56DwyTxh/LweM77FlDm
 SQScNxI4FUebVttBb7TJibeVVt41qSEhibBIprzo/k45Aszb8rCXF8f3Vy+yuss9IXNt
 PIzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3OdqAy5BTJMA9lRdJVAr1fizEoPXlVPznvoyFZspmRJwXEf3b5OteyNx9ZjoPcbYyK9fpDhenzw==@nongnu.org
X-Gm-Message-State: AOJu0YzDFFLO0vVICmSplkl6zzcCFithRJtuaEPx7A8H7YbmZr8Mb0z5
 HxUSVFPIgx6IX/Txh3Ch1yVuxgpktuADLt4hy1iYrih6pbFd0nBe15TahsOL7zyAAFXrpfz8baU
 XqA2tkghCVKxpKVB6INtdBBsUm4T65TXY1FT8vnVESw==
X-Gm-Gg: ASbGncteeapuJMTZVZFBjzAkTDD7rXtMG8TgxdwhsHBcQTwkLsuIpftaAu1UDdHZJo0
 ZTXPpZ3y/PsZQLfik6/8Ew3HzhHwek1jmWl8NYRbGs732mKZf+q8zi1tHYXXRfPxohZQU4S9812
 axnkUyGxJqbJpJbwUvYRVap/c2ft6oJXKnhHrCY2fs6Xp4OjDuvoJRo1kU8S7XEWAdQqUdWF1eQ
 qGoF8A0aUkP3MnSV+F083mEkBdT/GOjNPDqItnkSB0gghg=
X-Google-Smtp-Source: AGHT+IG7gliDXKbHxttnwNWKZ9H313WRShNBdS3kwuPk7XXlSA9tJcRY0AYDnxg5Rn4HLpPlxilk7Y5WvNgcV//zJgw=
X-Received: by 2002:a05:690e:23d4:b0:63b:8e80:c017 with SMTP id
 956f58d0204a3-63b99f35953mr14222164d50.0.1759825680014; Tue, 07 Oct 2025
 01:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251007024006.43166-1-philmd@linaro.org>
In-Reply-To: <20251007024006.43166-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 09:27:48 +0100
X-Gm-Features: AS18NWDLvhQOVDDYsnBFkgn-2H5She6TB-swOpu175Flh9op4jv2jCCGhL8o1dI
Message-ID: <CAFEAcA_ytH+AwTr9LAZBP2nbSTod0FkfuexbewW=T7Pbb3nkmw@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/max78000_gcr: Do not ignore address_space_write()
 errors
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Jackson Donaldson <jcksn@duck.com>, Jackson Donaldson <jackson88044@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Tue, 7 Oct 2025 at 03:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Convert max78000_gcr_ops[] to take MemTxAttrs and return MemTxResult,
> allowing the write() path to return error on failure.

*Should* it return a MEMTX error on this failure, though?
This is a question of what the hardware behaviour is,
and there's no reference to the datasheet in this
commit message...

thanks
-- PMM

