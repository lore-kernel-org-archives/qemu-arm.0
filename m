Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1748499lfq;
        Mon, 11 Apr 2022 09:34:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCgJvdXnWKIu4ToVLIn84+Cp0kQtOU1icrjYQQ9ls1/ZewmB5ZEnZ1qWD65AECFNwNAu6H
X-Received: by 2002:a25:b982:0:b0:640:df8e:fb76 with SMTP id r2-20020a25b982000000b00640df8efb76mr10896204ybg.0.1649694862112;
        Mon, 11 Apr 2022 09:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649694862; cv=none;
        d=google.com; s=arc-20160816;
        b=N+HYP+5KvFEuoxVpMBNcIPlTKgQO1Y/qSbAAyzNghxlZuJVos735VM5rCCtFM2bjDk
         EgCbkj7VlV/armEQqQRv/oOCUtoGIhoszNE0aTiwKoShxA/ahkiJtGijF4bl2qamxfzD
         W7ydzs2VhmTwOQFpKzHOtRbLmFrz0aOBiIBhxGNimS7XtFq1aLbjoqDTuo3c9TgzC8On
         YX+eEbSDQVTRkqmvlB2K4CatH8kj9w+QSOXo45cFFS9N4ohT7GNTAYCoQ09FiHQv+5ZR
         5vjxZMcwcVrCi6IHYKU/QoL/coiLleeuMg2vDglvNC9l3kyicl1/Tr1RN+rEwVeRyt1o
         mSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R+746jga7E5ql+MNSzruRiD+VHG+W45Nqk/tHqnCE3A=;
        b=beSlxd+JHHOpEsaB0srq+TzIm3WDcEZzOq20mbVtTobd7r4+aabeOd+ZIp5VZrqgy8
         YO7Zar6vDgd0BSf400hhm/7icH01jvCWtA5PiFqAROgAsTiFxUKXv5j5puqr55YuiLXg
         sE8/jnBQsjQgwGlKOS+obxhmKViivQ/C95mIA+68XDCvJ9zp7PJoVyxd9JflUU/xgs8a
         oKr1nEggBBbMHHUc+gVGfWLkGisL92I0DVzs0l37jUI5S9MTe5VcVAkMEYK5TU1M2OH4
         W8fbxwIRKlcmDiP/9JLlyq8PzVN0a71FwbHJKv+NV3InV0Tyyqnai2oGUYW/LB7R+yZ4
         Q3zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=whW7mdAZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h81-20020a816c54000000b002ec30003f62si1566642ywc.319.2022.04.11.09.34.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 09:34:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=whW7mdAZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndwzd-00084O-H6
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 12:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwxx-0005lY-TX
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:32:37 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:35416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwxw-0000Pe-H7
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:32:37 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id t67so11657234ybi.2
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+746jga7E5ql+MNSzruRiD+VHG+W45Nqk/tHqnCE3A=;
 b=whW7mdAZTjTfPffYO8atGSerzcOGX5UMiOBPjs4v+ikQdU6aYClQ0HVlKezxaWBFrr
 xcPEb1YjeRoI56wx7VnSXlQia6URa0Q7vPLqFqTnYKurbGc1JsCZ1QdzANoKycRIN7zB
 ewjPboTZNcMBIAUgv/UVik3zrRG4gCsDg7cSZh5V7PouDzrDvMuUROFXVHfgilqbUJHz
 Imk9L/ES9KwL8jHJHqQBtV0NLhbhRUjDMgzk8H1yN8pegMrFjuitc+H9isId8Ilza1Q+
 thop9VHkS4IpqLytNtK/kN72rh+Uq1MKFHepD4d8GkOKInJW3yiYgI/ntFQ13y43BhNK
 Xqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+746jga7E5ql+MNSzruRiD+VHG+W45Nqk/tHqnCE3A=;
 b=O4UsGjMApq5kaXHCfh3yJ79O41C93jzBsLSsbZRsK55THpB4G1YRFQnPzvnCCFucaq
 RgLAHDkoipPinXNHoPWhyfoh/QJuDLtWQTnWBQg3nZFjV0ltg0A5j41nR3zx2s4iB0KY
 do5aRSzYeJbVuEbAW1JBsF/tgs6Jo1YX9DoBrxAqlcpaunwQhDQwly8T1iQXNiPqg5E4
 7nPewplXPvVD+ynuEekoxR4fFGJO6Ue81plfnzURfHvsqWK3eCagng9a4L/kKhLKaRqD
 8Zwhg9brWwD9Gx7FjsyeENhwYX2nVVTLLSL4LgDTN+6a5mc+8Jkc65AvdzjRtmlxGSV7
 EQrQ==
X-Gm-Message-State: AOAM532ctsIkZ9iM6soTYIPx65g48OLaMWXhmmWq3zEam3Avx581nnHA
 +OW0uhY32saC/xPXUYoU1Ulu7Iq7Co0WRUzc+bK7vA==
X-Received: by 2002:a25:d4c5:0:b0:641:1569:17a8 with SMTP id
 m188-20020a25d4c5000000b00641156917a8mr10056193ybf.85.1649694755663; Mon, 11
 Apr 2022 09:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-16-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:32:24 +0100
Message-ID: <CAFEAcA-6xJy0b2C49QV_HqdX6X+L2sxisbDZ=7DaD7-3zEnKWw@mail.gmail.com>
Subject: Re: [PATCH 15/16] target/arm: Enable FEAT_RAS for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iBoqWoLCFgvE

On Sat, 9 Apr 2022 at 01:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c   | 1 +
>  target/arm/cpu_tcg.c | 1 +
>  2 files changed, 2 insertions(+)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
