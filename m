Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3696442lfk;
        Mon, 29 Nov 2021 05:24:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6wrsGbim64//0xTgRkRUbx3ikntVc71zBILulkYLHF+iE1uYRwMqpRWlqDvxxgjMScwFz
X-Received: by 2002:a05:600c:2dc8:: with SMTP id e8mr36577852wmh.189.1638192245005;
        Mon, 29 Nov 2021 05:24:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638192245; cv=none;
        d=google.com; s=arc-20160816;
        b=q50rT8LKlhdtIoSN3Q9WbV5X/PPc9oxTYnfWVBrDti8iDN81PFi7AOIE3jK6nLxBP1
         bOywI/0ud+MqD0x2WJmJvXscWJcqjgDgkDOFOGWraUAWj60tuvzzhBpF4Q4OeI8Fx9R9
         Eh9gytzeXMJD0dqItSSgN6NUQCRF0rBdOWcyxuqJu+z2hhtqeYxEYJRHAKWxbO5HJEPN
         jjiJc+4OmwV5fEcTYmXUEBr3HFy1Dnt0upMDGW7q3hV8/3Bfeurjqo8119MxCKDMBJvC
         6uS4OgjiMEHChAjgXKUGZTEk1oDJU16wOfh9jofKc8NVzOM2MyXHlld5NkhVOzpJ+5r/
         lEyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j+OaQc4EFLLIk4Ngs96CA869eSl0gwol9QOp0Hx7KIk=;
        b=GKNk6iKJLWSfPxRD+by2DfucTP7GFZ0VNI+kmSCuqBabjNrgSRkTxDQyxlSfdUOWz7
         k8619z5Ixgquso1tZcUJ8F12qHjhjVHMVLmy+Q98/wipCU8+hqmBe2E3rix13hEoSq+K
         eOnjSrRFJtUunr5ZtKtWfNFOFcZbZ1D5vrM8pt4YEW3dL7/prrCoETQM/uvGZ5ZHbSfQ
         hw3sdloM3RDaQRFlBo02jLtoCdThFUGSaQVbZo/ZGsGs4xaKmONqO1MGOHE+Z80TYNEY
         dHGNBhXWNP+N5ZgVNQ5A5OLVg7F70X7AmvZUz+XNMzMNQqArBMyMF77R2UB+4PNj3Mul
         mxzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vKkkd3wb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1si31289228wmg.100.2021.11.29.05.24.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Nov 2021 05:24:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vKkkd3wb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mrgdX-0005cW-Tp
	for alex.bennee@linaro.org; Mon, 29 Nov 2021 08:24:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgbo-0005ZC-Ne
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 08:22:16 -0500
Received: from [2a00:1450:4864:20::330] (port=42901
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgbg-0006Hb-NV
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 08:22:16 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so12394991wmd.1
 for <qemu-arm@nongnu.org>; Mon, 29 Nov 2021 05:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j+OaQc4EFLLIk4Ngs96CA869eSl0gwol9QOp0Hx7KIk=;
 b=vKkkd3wbaM+BDiecJiwAOybhIzapHCnpfVDBjvXgS0j+YoIzqDiV8fa6iw8godHF6S
 KZb/BGk3FIMpIeY2DHIgt3YnkH9mDMvHzYupSsdWimX7AxolQtaILz33VzhibNpxyFy4
 rqVEZf+GjXxgdHmpbZeExjpHQ+JMuCD77y5GyZumWE2K9faEFgC9ImfixwSRLqT9uNp8
 +aw6xAEdhF1wtMK2hXtDsYLaEdaWm9078PjCtJUlx3CS8hSKXzJLdgwF9fKKU35r8FJq
 bY8PjbtYvTlYz9BE3GmkfTNmCA6kA3bMM8LlIuusenYO6OFLhO0Z9Bq+HIZhkFriWTbx
 92Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j+OaQc4EFLLIk4Ngs96CA869eSl0gwol9QOp0Hx7KIk=;
 b=MEAJ97dukudACQjnyfAzA+Wd7ngBtgUv/zO3jtGW15xbpG8ULRC/fEM8GItJxm1CBm
 B2zLkhJPKFSpQd6ZACryBJadILDEHgBy2keDtJbtuZtofQynvhDOYsO0BSCC8cEX/pWP
 rBdMsHYR7ogBaz0VctbCCL5r/m6q3939Sp9PRSBPLDU5OkQwrPGiyYyiPbS65bcLS2Ch
 v1RGVzcBTuLgb3BVTJgnQfJWzWycDa0kQoe/eV0C08s1JtL7GtNSk0gPItayWHtN3ZOR
 9E+VB4mFFMbqwic2PDDScDZYbejh7zL3YxLpFrz9xWKifKS9+LawgpGYPkgvFJX1u0df
 lTnw==
X-Gm-Message-State: AOAM533UblxqkJEWExpY4l1h8Yz4sgdVQabYszQRLD1cJSZmlolpaHDA
 MFOB5IEhMGA227CAxX5Vn6hhxMXmiSKpDuzpZhbbjg==
X-Received: by 2002:a05:600c:22d0:: with SMTP id
 16mr36488673wmg.37.1638192122850; 
 Mon, 29 Nov 2021 05:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-5-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-5-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 13:21:51 +0000
Message-ID: <CAFEAcA9d+pLFmrQa-kMUpCEEmdi99NzN4AjFgM6oU3-w4TniQA@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] hw/arm/versatilepb hw/arm/vexpress: Replace
 drive_get_next() by drive_get()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eKPL3hi1pp75

On Wed, 17 Nov 2021 at 16:34, Markus Armbruster <armbru@redhat.com> wrote:
>
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
>
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
>
> The versatile and vexpress machines ("versatileab", "versatilepb",
> "vexpress-a9", "vexpress-a15") connect just one or two backends of a
> type with drive_get_next().  Change them to use drive_get() directly.
> This makes the unit numbers explicit in the code.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
