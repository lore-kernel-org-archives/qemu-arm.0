Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1601522lfu;
        Thu, 28 Apr 2022 02:46:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCXTT6F+/kbH5+jmgnegu9UPjA53lXxlIJ4eUJohj/eMHU9bE54OLXod/FYjryU42o0zwk
X-Received: by 2002:a05:620a:28c4:b0:69f:8e2:3550 with SMTP id l4-20020a05620a28c400b0069f08e23550mr19232200qkp.511.1651139188961;
        Thu, 28 Apr 2022 02:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651139188; cv=none;
        d=google.com; s=arc-20160816;
        b=ZEYNr/LR8c8+C0Lx3ZElxUGLBvRzwgiHcqlNy+FZff9KGsMK4Vud1HRILX7v7ZAncV
         PDyfAl5aAssvTqp16sY4YYkVmpBiGJmoLYKNQPscxkUzp7i25Tz9r+jVP2Au0NBvcvb7
         3N72HRITpChGXlXq2ELuaHgMcCskh0cZMuA+y9PB0wkIECTuiyW5FLF7eOqWDFQUqnMH
         ftHrKtA6AV3IGL6eiQ8VCXFqzrkozxsk+bS0q7pOEqdsyTXNUYILARI1oIpnebWxSUCj
         6rM43TEEaiKz7OMU0TgZXXg4tHfvss3afyXPg0ze78EZJpg38V72uvLQiLFTeJTvzOcg
         4hiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f4fyclb+xTkjhM8px6Fa1jTKmdI88iRNedFML/RKbQI=;
        b=LpifNpPJIAkWkzFG+xaSDUvsUEztpkCLm5Od/Y80x6PqmGRF6iGKvnlh8zpRrag2MM
         KyqZizLrdvF/HkRbDZ/MRQI025pvDdWqjlKvUOo+HwCIY3J1ljFgxaVC49HBRC1rDDkl
         a69lu6FCcarkfEDkdpkuMVDlfYiXXvNgDEXPCnwMX1AAh2lsA61hwJT+jkR2SNEtG3Nc
         56VDI4w86rZ7gaGzs6TAkwgcPn72YlANaINTXRg9aZ9l1nMZcUwcoOHOR0W5lQVs1zXV
         J+C/TK8t+Wq5Mu7O5yOdppVwOLTy6SukMyCyNI2reLBRyfeeP+jU+uA5RedlV3ItHLgY
         vxYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dJh0c9v4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020a05622a008800b002ed9a000642si1534832qtw.154.2022.04.28.02.46.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 02:46:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dJh0c9v4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk0jE-0001es-CJ
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 05:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0eb-0005as-Mb
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:41:43 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:47084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0ea-0007Ny-6u
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:41:41 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2f7d19cac0bso46122917b3.13
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 02:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f4fyclb+xTkjhM8px6Fa1jTKmdI88iRNedFML/RKbQI=;
 b=dJh0c9v4d0DkJje5DKqvGkVkxHxVtHsKvqGG1xCpKhcEst76C0bL7u3aHMxco3WwWV
 MJKGqncI40LdOVts5UONddNwkS2+mv2TcGKXqwzCb7omd8UFQOY+LbL9LCGx75B5gpsk
 Y4cO77ePj25EPmxpnYrsf27CYFsXSTBgy3Embjz+Q/aqzBHLKHxSzoLYMFeEjpuUmTUv
 JBU43aRr3QY6qEZVBErRH/PmVTzo7KxIZXPe6Uqa0hOR4mnJV/Bb7jNd7+NA4Iye/zcg
 +GUm/+rCGKScFv5NqWQhh2owcOGwsa1atg/ueNvICT+jrCu+gXhBN3J4iTslQY3oUHFh
 lLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f4fyclb+xTkjhM8px6Fa1jTKmdI88iRNedFML/RKbQI=;
 b=Guz+sBhxIxKslnbInL94qSFkUgv8uO+AeXZCb7rq4DxEhrTcHNCg4ph5500wN5JPgN
 ncYos2QBp6w1rAQual+X4npMGJ1r4UcCufh+EdmxX9eXCwqPxbI0k5Nxd3PlRcNvsbmM
 n6SKP1CXIlXhkunKcv18eAhGfepiIf44vvsh14zI1APzRpVY9bmPE7r/v0SD0A7q6Muz
 xrkbfyC7h9O9k7yqT7G4g6mKz5EiAgUXzoyTC+AX+vnDtPP5dxEszajiWH/54tPcFtVM
 wmx+QIOGzurmVUqtAzWxMpMOXh5UwZrGqcfZanK/b/kSedMI8uJZ/cR96SqiyD8XVzYI
 AzaA==
X-Gm-Message-State: AOAM533E3Nz8vvTas6526Bcsu0OVinHI4IR4IfQvooRP1i2QOuCp6Tlx
 sFpjNonuAVkD38ERYPITIDnoR2TQqAzIkezu+eTKyQ==
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32000041ywf.347.1651138899072; Thu, 28
 Apr 2022 02:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-7-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:41:28 +0100
Message-ID: <CAFEAcA9PpQ3oUVkH0dG2eKa-xn7h-K37=kBS4gy9PPankPsF7A@mail.gmail.com>
Subject: Re: [PATCH 06/47] target/arm: Use tcg_constant in handle_sys
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: brmbDuwp8YyI

On Tue, 26 Apr 2022 at 17:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 31 +++++++++----------------------
>  1 file changed, 9 insertions(+), 22 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
