Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp183722lfo;
        Tue, 2 Feb 2021 06:55:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygVQrFF4qDgGBeJM5WlI9tYeE6Q+NgWM07RrhKQaTFMWnnoggysLXI33mfyqdy/jlxGe/Q
X-Received: by 2002:a25:807:: with SMTP id 7mr14940812ybi.503.1612277707570;
        Tue, 02 Feb 2021 06:55:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612277707; cv=none;
        d=google.com; s=arc-20160816;
        b=F9Oq8pWzmDRmCyxwk3uF3GDsZQoO3CYme7x08Wd3RsNy0z47J49hrcdMPInwq6GWeC
         /gxWQSzBIVjSZslBAVuxPkdC6IAZWIwXImeHo2Lntq8XQD7BErBOaocti2drFFSCPI7D
         TzH7IFUSC22sFJgyzHeXmN+VBAFOiy1ExXWWuy1IkfLVNc7KR3mugnOAC4WMhAU0ZudB
         DeGj4N7PPHj7hGOKz2wVXHj/ygkZpli/Rcgb4+qctU6kEr5ZZ1OLIpPbIImCtlwwoI85
         kadaOuXpyiEqrVfv2k0r4bxV9/Y8WOg26YNejG9H9xdXWXZAXwY880miRb5aOUOvSeUu
         1Flw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RwEffi2ApU9PvarO1zv0ZcWghpwVHedIiRt8oaEEZW8=;
        b=T+G96N+yNy+xu1zDriGHGRK5r2KVI4e1Gx9Yd+w60XWdpzJ74iPX0KPUit4lzf2RFW
         fWN2jwUq0kkrJ3poxz+hkjE6Qky/xWEL8EBifAk22MsvR1S9YGbR6P5MQteFvSgIlpLQ
         XCFpgr17ez/IXOL3ehSx7kvCSgwISPenBiflag3nyrK5yDD1OC1C0qhMuG2G+bJ39GGL
         I5c3c3GHMk4ACpATp11MeeoCdQHldoSEvPMTmvDlApZdHUXrPkkIZSrJJyWgO0xRyyON
         LekkVDVpolNnHL+HbZ5ocxIS8IyBiZAUnDnkXT8e4mthOAj3W7skqIxJ7Gqxd9bJTzMR
         T+lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E3NEftpK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l128si22022879ybc.8.2021.02.02.06.55.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 06:55:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E3NEftpK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6x58-0008Qz-Qm
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 09:55:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6woi-0005Ku-Jf
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:38:08 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:35164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6woh-0007qv-1M
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:38:08 -0500
Received: by mail-ej1-x630.google.com with SMTP id a9so11936408ejr.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RwEffi2ApU9PvarO1zv0ZcWghpwVHedIiRt8oaEEZW8=;
 b=E3NEftpKhzOtFdkqUi9tfQ21TGuMHkD1we6/+nArD2TrUL0xZQKrKlno7x36GRmhiJ
 4yuuC8qQ7Mk833rrx5u57r1uRDUhwY9ZqwIxnXnps2EjW02aCS6wzfXk/IzljH9Urcnp
 cXxUF4QRuuZheo8vh2iYbV3oRdq8Z9/tMI2+kFnYHT+GUoww6HWgS6vePsq+C+WEiYZc
 hQXgSGaIRq6aeDgXST7+gJkaWwHJRIiRhNHJtJww3kAzkGrklMHFv3siUdO66rPiGt0W
 arORQDLF3LMUiwhtB3ero7ZLF4kpq+B1VszpF9k6ZgIO14Qci+r6E5du40qMicbHcOd+
 W8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RwEffi2ApU9PvarO1zv0ZcWghpwVHedIiRt8oaEEZW8=;
 b=rEq1VUHzrQly9Ao53Iz9qcSvF0dyc8lEvQxS/gaSBCXURVkWfYKGoGg6gMJGOduegj
 MgXG9W5oe1YgZRGOmTWjhUA/FfWV7j+K+vDOyawdRGyKZtblg1BbXG97xAmxsyGe0OEh
 9mYWT0uEwo1cKBFkNySDtAm7ks0mtfmMczLBHqndUe1B8SmF3+/liVtnLwArYvB/L7UW
 RjNaNYfIfpIihCA/UXgQR4jZswFxdAkTIS7I8lF+abgFLING8iWSgGqIx5Rv74SEae4+
 SDPMKbSzx0KhQLD8W1eq164co13/jBdaysfYu4ojPcLtPnllEjMqy0PLzOf1KRhNa7vq
 2vsw==
X-Gm-Message-State: AOAM5314eH/rj3z2gIxZzimMuWwGynP/sqCISdAPsktXQaHiq1p0TxXW
 4dRubTc9RazHBFZMTg0jVMdF8ymu+xQ3qrP3ENyiAQ==
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr456477eji.407.1612276685253; 
 Tue, 02 Feb 2021 06:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-13-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:37:54 +0000
Message-ID: <CAFEAcA-uYsR3qE4f5XuG6wy0+eVeZ75mrrf1+CAhJ9qWOdujpw@mail.gmail.com>
Subject: Re: [PATCH v4 12/23] linux-user/aarch64: Implement
 PR_TAGGED_ADDR_ENABLE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: L8m0LMkjmg3/

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the prctl bit that controls whether syscalls accept tagged
> addresses.  See Documentation/arm64/tagged-address-abi.rst in the
> linux kernel.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
