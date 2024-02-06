Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1845696ejb;
        Tue, 6 Feb 2024 06:53:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFya3Nnv2nx4lTWgG+YwPjQxVkCcIEdbmYINnen7FOgUgbBymJj0NF+qemje4kQCkPJ2WIu
X-Received: by 2002:a05:6102:2139:b0:46b:457f:c081 with SMTP id f25-20020a056102213900b0046b457fc081mr1980785vsg.10.1707231211925;
        Tue, 06 Feb 2024 06:53:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707231211; cv=none;
        d=google.com; s=arc-20160816;
        b=wec3JFu3UUchq9WpbIZoPW7/H/fBQAnJu/VNl+H+PPHthXesd0set5zU+4jKvJ/YuP
         bc4+2vhsCayTyCmE0aK7tpX1sQ1eF6m5Xn76mUEzK6JCYVv7zewlko/ocAhRSR0ITWin
         fXZ8vNWgKdMTAZxSuiOZz+6Jq1DJY+hzR7T8lLci4xqx4koD0sjzQxxxruRpt/D3iYSx
         B4BYPBtRYl3ZwbRUib2TjM6G8/1AzKvLaotH33bsQeIozEj/L9OWI8okRCKEBBOrcmPB
         GCiWC6/3gCpn99RCdXZkgLqRPASorfnLfy+KjC/dMCSTI+xTSiSHGBLDPoV2XJ5NE2kO
         fFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PgyAndVS4dZUfenG/kBFzhbzoUms17uafKEor9TpUMM=;
        fh=XwdkoJ9efYfVtWETkAqOwxUrKYJWm/Vo/1WT2hmO5fA=;
        b=Tz2w7GKGLJJ2yr4jxyH6G62PEeR1T3xDHDwjSyE21FWLsXYDt7jWijlnKIdZGeR7Ft
         bHaOf41SXrKwVi0T9Em7tkwbNP+kr/NZdcaF0REZQeQdMv03U4KNpfHNKoWfFmHl2omC
         k+ac/16r0GeJMsHRHyEeLj3Kkr64Nlrw+zRQWst3euuc94OxlZq9evRfIT3bcpTMpLk0
         yY6ppeWOrh/Os9WeBG72gpDY6AQbWHv6/g4fBR3/u5YLX8jZkey11Szlgnp4UkQn91G3
         ZmhBRn6Q7DTkRyryjp+fbdzvfReHPUCMPfhKQKjEL4DaAAWuFE7f0dSkm5JfmF3+LWb9
         iH7Q==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=onYrZG1I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCV0DtNJvEwhjvIzxu9+h//WiK6lIe5jfyWF1zXEhBIimMnd2ZbKWu4i/wDBYa4dnvXeMfIy5TeyLipbaYQ8L5+PdY1oUj32
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18-20020ad44252000000b0068c398be522si2495590qvq.64.2024.02.06.06.53.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 06:53:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=onYrZG1I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXMos-0003QV-FT; Tue, 06 Feb 2024 09:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMor-0003QF-Lk
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 09:53:05 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMoq-0000qE-9z
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 09:53:05 -0500
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5112d5ab492so7940950e87.0
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 06:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707231183; x=1707835983; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PgyAndVS4dZUfenG/kBFzhbzoUms17uafKEor9TpUMM=;
 b=onYrZG1ID6mVGJv7Bam9q55HSbcazLONHjOkZiIGYXXXFv6388R5NuVc5YUeVQQPuK
 PGlOIg9bXzg+O2z7UxxTYwy2TTn6T7Fv72APS8rlvaq78j7zVuxyb+XyxGL+7T6U5dw1
 aqsnwnC+HY6Zjs3msP0MvG4Y+u+YCQg/ipbFWl0boyDj2ysqonSLUBYU+nnHKhZEXvKC
 bspz1ARXwxv+dYnAMdIdGTtLK5HNHwTA6V86HkLwmZ0lmy4T03csg+mF94y8iUQGZV0k
 4vTiRzsMCX6CR8A5ExwIkd05apUe9AUQ3o0I1f4dSuki1HoFDSNMDy7n3EarUzpOLEKi
 wr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707231183; x=1707835983;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PgyAndVS4dZUfenG/kBFzhbzoUms17uafKEor9TpUMM=;
 b=wNeFOqfaYEX9y7ioM6JRQk+pQzIK05rR31QISCaE8gzR/jf4F0GR9uMVFSApPXknDo
 Onv3VOp7w/wiQEkEygU7pjWBsBMlDz52y855puQF014KV9hdeKE2UO8Fv+G5O7IfStot
 Ob5KirDs/6WEKi/ZTm394cYwBmS3Juwuxk7TH+ud4StRkeHwdW2lv7fCVWnxQf9jV3/Q
 L6LDspogS7oF4Ws2Un1ueUItOLNvYsfrKXAzZANxWPVHXR/hSp2CZs15cYZgTEietAxc
 7k12+1UUsBpPoNRCdXiTmtpjUuVkqdHzabRie2hhfkb1fSPh9BFdmDdkks59NXQEN4cI
 17jA==
X-Gm-Message-State: AOJu0YyUfhdMdbXfMspaQ7v+yHJ0GreyDSeY1f/9v2XchmvbXPmYsSLD
 Z1MfyDGkgMxQn/rsz+tcL/NTBXZrmjzgM6rSadvyQSCMzQ6yhAeBndmE6juAl5/tyMRu07xmPLQ
 ePBuoe9/3mq5ZXLtdO6AabH/Z6fip+nm31/GYLQ==
X-Received: by 2002:a19:8c55:0:b0:511:58d9:a253 with SMTP id
 i21-20020a198c55000000b0051158d9a253mr1783164lfj.56.1707231182690; Tue, 06
 Feb 2024 06:53:02 -0800 (PST)
MIME-Version: 1.0
References: <20240206030527.169147-1-richard.henderson@linaro.org>
 <20240206030527.169147-5-richard.henderson@linaro.org>
In-Reply-To: <20240206030527.169147-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2024 14:52:51 +0000
Message-ID: <CAFEAcA-KVKmRJeq9B185xFXHgrSUjm383Z8Tnr=B5DX5DeqK5Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] target/arm: Split out make_svemte_desc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, gustavo.romero@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +gl0n8R/EI6m

On Tue, 6 Feb 2024 at 03:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Share code that creates mtedesc and embeds within simd_desc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.h |  2 ++
>  target/arm/tcg/translate-sme.c | 15 +++--------
>  target/arm/tcg/translate-sve.c | 47 ++++++++++++++++++----------------
>  3 files changed, 31 insertions(+), 33 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
