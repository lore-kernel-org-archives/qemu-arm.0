Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp872087wrq;
        Mon, 4 Jun 2018 10:31:16 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKaEheTBo5CdOicFn3+av/2+bvcpC2+l0tt/VQXGDDKGl8DyCbNQ8EpFr9a5r9pFUHq37Pd
X-Received: by 2002:a37:bf06:: with SMTP id p6-v6mr18753283qkf.143.1528133476257;
        Mon, 04 Jun 2018 10:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528133476; cv=none;
        d=google.com; s=arc-20160816;
        b=Rut9xnhqF6YdkMkYNaufmjeJj4+ust2280lcUI+cToNSKrJs1KX5TiETB0szKZykqU
         QEM84RUA8BPxW/5jfnZBoawFNZdCgKo83VcSxC+oq08R/dWHL1RIcHjE2x2VKUzSWgSr
         M8gXri+f2WlJKlKBAas4qbgJ6y5GlQzvRzgTUg+vRX2kEDRfODGETLn75+1XTX+oL6Z4
         bIoglmmKZq0qFt4vX6PqC1hi1kq93AYQ2LR7P1hjPDcpBTy7C/h9Qo3JUZLx8q+mEdhb
         zr6otjeU30hHq1LvKkfKkFYJQOogsiUhIit7y4Uv7NRhgnISJzk28X76R+kJfYcPfWaY
         45mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=r5fsJms/RiVMx5LsN/NWy/KrRwfSDUr14e3Wc7bOfT8=;
        b=0Z18Bx26qb42NvGS3LCw+ww5zIL4dflgAOU3RRVFMykJjazcGCJTUWLTqhOWk8nX4p
         yXg958r/exTB54Ccq8sGqT2j7xDdOfR4qdtyo4yRKmX+9iwNfX0VtHsdgb6WFGTxkPIH
         1r2Upo6ItHdrnsrE2OXTI03mI94bmqg2ZFy83ej6X4szQ3bR6QigSTgq53s1TCpgMXWC
         xuyURZ0C80rqKi4KzPaq7/qfv9NEEY25n2fauvnHLslphcHap8E1yqFOvDKFaQBsPvH6
         Bo+pTgJ9JLVKBHCftlTVuMhM6XS8dSljxA+vB/P8II6XBqk5tEE4F8ZiS3uuTOS47zuT
         b2QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WdDnqJIc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k1-v6si991363qtk.400.2018.06.04.10.31.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 10:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WdDnqJIc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPtK7-0004EC-Ru
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 13:31:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPtK2-0004CY-3A
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 13:31:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPtK1-0003Vw-A3
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 13:31:10 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:36557)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fPtK1-0003VQ-4V
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 13:31:09 -0400
Received: by mail-oi0-x242.google.com with SMTP id 14-v6so21145095oie.3
	for <qemu-arm@nongnu.org>; Mon, 04 Jun 2018 10:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r5fsJms/RiVMx5LsN/NWy/KrRwfSDUr14e3Wc7bOfT8=;
	b=WdDnqJIctmRcnbTr8XFEMXplolG9UWJEbk4bD6ekKq/fKkVySq0Qjftm8g7OyyUUcp
	3XYwAhvhvg4g++Ow3Qi4Ym1G8EnH84cPJNRPS+bWTvTCJl1ynYAGLaFYsX3DD6TElnH9
	olVsKPwJ5YQu2bAc8YWIpQQCwqs51X2THFf9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r5fsJms/RiVMx5LsN/NWy/KrRwfSDUr14e3Wc7bOfT8=;
	b=XMe51envv7Ev/+pEif3bNCG567RvICPcBtmQkLy1MnWncoS7yOiiKvZltOute/Oult
	EMvefD1VcFJbB8KerdOvljNCDEYqieYe86RzUCpEwKZpolzoQ/+OMKrncKUAug4crCF1
	WQu7SfMgUJ7e0Xj0wPJUdU1DGy7hJxqBX9ikUNcneMTHlJvjgDvq2CpXkh+HyMIkMhS8
	Yj2CMtYHNJovF4m9HTJm1bxRt5vFY4N4ARtZObCjywGPgpRCejTy7NSMG7JDmYheLADC
	SuoBSXLYOi3jUYAwlXM3dYsKXsAXg3hngQLyCVwCgnB8EaVG9jWkN/3RDR4i8DiqeNx5
	MQEg==
X-Gm-Message-State: APt69E3xyJAFQhkS+fVCYv2mjX1nvBFIZu7+WvzQBpuSYkvgQiHEkRD3
	U0mL1YfgcLCMAeWUS4rXeKRv/T/HzCHz6DbFl23H/Q==
X-Received: by 2002:aca:5383:: with SMTP id
	h125-v6mr8338030oib.252.1528133468387; 
	Mon, 04 Jun 2018 10:31:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 10:30:47 -0700 (PDT)
In-Reply-To: <20180530180120.13355-12-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 18:30:47 +0100
Message-ID: <CAFEAcA_XOOmepstD8n_hSU+McfVcfaoCzxe6P3PgiCEiERMntA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v3b 11/18] target/arm: Implement SVE Integer
 Compare - Vectors Group
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /XMwd5mCxbcr

On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 115 +++++++++++++++++++++++
>  target/arm/sve_helper.c    | 187 +++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  91 ++++++++++++++++++
>  target/arm/sve.decode      |  24 +++++
>  4 files changed, 417 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
