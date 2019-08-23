Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp507055wrs;
        Fri, 23 Aug 2019 05:27:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMX0rhasbGCdhtT6m/oE/m7JBIupfcxrSl+PucEgn6KBXEe1BtGYjMYXaBcx+pjpBaDk8j
X-Received: by 2002:a50:d65e:: with SMTP id c30mr4180442edj.38.1566563246303;
        Fri, 23 Aug 2019 05:27:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566563246; cv=none;
        d=google.com; s=arc-20160816;
        b=MdYKTqZWx2JhcieAnX1no9Lc9R4ZIwGp5kc9j4SrpD4K0njYZPs/xyb9K6ZAX6yZYP
         +epSnExR62onZ+NDpRijyDlKSJ8LO8edErD9LZlVyI1TnApwwt3YDwhKDhUVKyVL9gOS
         r2M3uSki5xySdeyoyQBijtDLDHyUgAZ1i0IiKxqlJZsEf45WspXpAz1bbSuHnjlG+Ovb
         s8yXrbynU+fz8znQu1mn/2eTyhTCBIHZoVDQAjQBfPBmxcrASpwuVNJ/R8V/goOB3Irx
         ID46Cp369rWYmcpqiMi9Q4TKjOoQvoe83fqQSu3fHZLJPNGB2gDBjKP9ssL81x779fZ0
         j+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=81SiMvlJs7t1RqWDKJaXA8T7nW9rMSm+rqMKJ0GJdrc=;
        b=VgNF1dvmUKYq25q5UoyBZYaJD3gyA88kfCXl9o98ysGh5zyVkBKIDVwaiif/PY8+kF
         tbz0Sv//FYyHd7cUiBRZqmw8nLrUkrGK8d7ENJzQYqW0jaQ0sShdVUDoGVAZ5obZyyAq
         nx9vT1nX/MYA4zKYnkBrVxAbp5WbnPEaaMAxAYbJZ4NcloVrEZYjTQAhdheKU5Lgzt38
         VoDZu+wBby5vX5r28sSYC0u3KCAYfgViYCojjfYogPfxAeCR2GBsy5eTcwUE9FwNSSQ+
         RwEklGxf1Zs4hDSQM29YwXSWOoY1T+rEPNAJAlan1yIvqOoSartTSLpP2Sc/5WaFr26W
         9p/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sv0UYFYc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si1601732ede.278.2019.08.23.05.27.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 05:27:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sv0UYFYc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i18f7-000561-Bt
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 08:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57391)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18YO-0007sN-Nm
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:20:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18YN-0002Uc-AR
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:20:28 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33978)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18YL-0002OQ-Ea
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:20:26 -0400
Received: by mail-oi1-x241.google.com with SMTP id g128so6867979oib.1
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 05:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=81SiMvlJs7t1RqWDKJaXA8T7nW9rMSm+rqMKJ0GJdrc=;
 b=sv0UYFYco8pL5q2lIHVtpH5o42n96/JhSMPV6jEH43VkXrTgO9YXu/jdj8YJ0J4wt0
 crC70QpSC9t/OqZF7FbJ/pOLyBGB885IzcShQQ13NuTZFH5odH0TxtTksP7AjuV4hnIC
 nwA83FRX2uHyUdIlwFDd9vijKOWF3hZPUAk2mF/A5yNGe5jcRaHttq2knnk1gzmZJZaM
 tdVJRsqJyB77SH7vg1JQE6ZeFp+lUHWJPe9AWxZbwdZY4szDYOCHK5b35NqBWhL+ezGG
 hR2ajsYl/pMIg6LMulW8HXvhoDthW+6PDClMkWFhdhWdQmvxvYFv8oksoyqYIhLjr6Fw
 0cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=81SiMvlJs7t1RqWDKJaXA8T7nW9rMSm+rqMKJ0GJdrc=;
 b=mc5CAiA0dp9QDI7UpiL1HI+bN/tu1jouG+KuKY/V9Bh2COQbh2E57kHaCJIZKNCxuP
 mjSdUdYRSwjnoOakUEY5KOhYy7nq5aAo8iLVbbTXX2xv//Gk4pf8/w54gl0g5eumLuiV
 nt7vJeMFH+MdNqOXcjHwTJ1MsvUvweEamBFsS9cZSpcIuy6hIOFYv44TG7y7OzmwI3/R
 so4uUUXR5W2hsWWZKjg/5++kzGG/QvX5zUUMbMm4Z0Bbq2+D3e5TJ5a4KsdtnBZZxWLp
 qWVmSU9mDdRV9jNZnCGSu1sPjxfCC5gI1MuYmePPDddfZd9IrWpKsXGtx5QGyzqbznJi
 LjlQ==
X-Gm-Message-State: APjAAAV7vqcIVpuVNYNFsbsNYL0vIFOSKYmVWhJaR42nicSnCQIjbFl1
 sSWBWrvfZMR/Cjjb782iRVbv+n9f9IEgE6MZtdrCOg==
X-Received: by 2002:aca:4814:: with SMTP id v20mr2974639oia.98.1566562820056; 
 Fri, 23 Aug 2019 05:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-8-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:20:09 +0100
Message-ID: <CAFEAcA_zScEjd8YT24cUQwXvqT4waCAdvWcNzRQby_6euzzzCA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v2 07/68] target/arm: Simplify UMAAL
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bALFMukJYThh

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since all of the inputs and outputs are i32, dispense with
> the intermediate promotion to i64 and use tcg_gen_mulu2_i32
> and tcg_gen_add2_i32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>8
> ---
>  target/arm/translate.c | 34 ++++++++++++----------------------
>  1 file changed, 12 insertions(+), 22 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
