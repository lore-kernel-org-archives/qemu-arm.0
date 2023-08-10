Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp701052ejc;
        Thu, 10 Aug 2023 07:10:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjlBih2kmDUo79tnJo2pjpcyg9m8zxbyu988mOklw3BXXy5Id4dEFGmembJz8QgOMPhyIE
X-Received: by 2002:a67:f489:0:b0:447:7dc0:e15 with SMTP id o9-20020a67f489000000b004477dc00e15mr1487940vsn.28.1691676616892;
        Thu, 10 Aug 2023 07:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691676616; cv=none;
        d=google.com; s=arc-20160816;
        b=wGpOM8tHulAjcVHgu/oyEVuzt7IHpu3HU8GG1ZmondwOeEsEfLgW2NQhXgUhSAfRJ0
         md3NC1npOMpsNjNce/Hji+8HfM1bJ8IUkJkaTroXFamuP0c5iVvF/gIrHjBIZkbBQ1mu
         9ueQ+DK4GQ+vA1fjJ1rpy/5hU489iMfkaiYqA3Ks9ppAeh5hdI1Oaj/nolQKRTG/2Eu7
         IL7th2JfW0CI4swkoAdCeRxj/+5EumaZwh98M1wuefQHiPVBRdEVjxHfmz8IspeI9uoM
         ESqim2Y1lnLV57mb5FN8JG7GE5pm+OExrjAMTKP2qI2nnp4r+beNLOcfbUy5KMrrqD3Z
         dCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Or+SN1P+qniOlJa7fh3LeBLSqmGsi514YxLEzNOhGGw=;
        fh=fQSWUkMuRxigFAyrwqJDZVDXvGgDP9IGeNAJ2g03mw8=;
        b=s4s38IE4qbq+Bn2MsovJH+6DK9ZBV5MluNhqBW9nLNAWxOLhQFADLcfj1Bd5PWvXUw
         6m1O0k9AU/u+bLijwjUxfBrjBUcSiX26pnZkBKNGkSc5p1GAP/epfg5XQiIPmskEsgLQ
         PEY1sP0N9f0GYxzZIh/4smL0CuhL5gVudFhOphg5ySlIxqKRfRfkncshr9nJ2awy8kYa
         hYR+A510SpmWd2gOtDW/gdzk2uwLxh99B0RwmAK/lcyIpfvk5PLzTCd51rCeNI5mbnbS
         rIBRApfC5iSlCJpi+T9x8YjWgJadAJbtDqD8/HRos0KDuNukuIl3MUggG8+5ftwjf5sy
         L0tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MeJj0qTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t25-20020a67d919000000b0044357459ff4si118472vsj.698.2023.08.10.07.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 07:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MeJj0qTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU6MB-00034V-WD; Thu, 10 Aug 2023 10:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU6M5-000320-Ta
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 10:09:38 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU6M4-0003Bw-DH
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 10:09:37 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-523ba00a581so290961a12.2
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691676574; x=1692281374;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Or+SN1P+qniOlJa7fh3LeBLSqmGsi514YxLEzNOhGGw=;
 b=MeJj0qTcznUHqVWV609a82Fz5okb1XIz9PpD2ZU5F2fndqOdd0Iq/J9OxnV9CntGyU
 NiA69s2t0HNJt7owvlg5jS6IHc3ahrZxWUo4zeZAgsHrMHoiPEMYcqVbSOx1TcpoYbRa
 ufDSCVpbeP8P5hZyywbzRa45uizgYH3WA1o5xuCC8HxLapc9BrW1NuAMBFDqSHsXw1Rv
 9q+0fYjMabNOZgHuB0jjPSjXU9smV6Nw4+SZuhEMjd7iLTurhJ6SyJuE+PetEt4p4IUy
 trC88GyGIFdN2eg4FSMd5fcERBsv0coJc9GNvbsgfxtfc+4VFcO0CEqb+KBWeeJc9MJw
 yowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691676574; x=1692281374;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Or+SN1P+qniOlJa7fh3LeBLSqmGsi514YxLEzNOhGGw=;
 b=Q0CbepFLE8WiQeePjgdDoFIcR3hSJ7BZqGjVcLNa3nqdVR6oV19KOTRjeDZH7SzblY
 xwCA1nZYhR3liibJpO3FbOm3qFce2zlVa//ik9nD145/O5snsVTXUHahipRjoRZkXpC7
 fx/bmBkt7R1jhK/ho89l7AbzDu5HSWrL5nGAn+s8Qnys6BDrM0uDJjNR9ceu+UsZu7um
 Jpsb58KouBSmuIMosJeGx+vrpLh3TWe657pZdoEbzU8+FzGjt4qigswzbPgZ8oZ2Ngxf
 VjuX6iTVYVl8DZaGHdPqr1TtlTR3t7jHSfm0z5Zq8TQ0twlft2DHXEuuZpzVqsyd7KUn
 bnhw==
X-Gm-Message-State: AOJu0Yz23ZAv9VoDty4kFSI9TtWO9r4bX81/FOkqlBoUarU86H/IhV/r
 WBxst2l/RczHZyTtm3ZcV4Pmko8uZUY+18TlxY1E1g==
X-Received: by 2002:aa7:c30f:0:b0:523:3e61:c044 with SMTP id
 l15-20020aa7c30f000000b005233e61c044mr2329873edq.23.1691676573668; Thu, 10
 Aug 2023 07:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230810023548.412310-1-richard.henderson@linaro.org>
 <20230810023548.412310-3-richard.henderson@linaro.org>
In-Reply-To: <20230810023548.412310-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 15:09:22 +0100
Message-ID: <CAFEAcA9JC_-R5AsvmtBK+ngb7LEuvaxU_7UT2U+jDvze7CqyxQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] target/arm: Reduce dcz_blocksize to uint8_t
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: cHPKWI4qVqU8

On Thu, 10 Aug 2023 at 03:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This value is only 4 bits wide.

True. Any particular reason to change the type, though?

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
