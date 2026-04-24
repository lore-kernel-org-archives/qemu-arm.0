Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D54FED3F5
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 18:02:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGKqa-0003Hf-VP; Fri, 24 Apr 2026 14:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wGKqD-0003Ef-AZ
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 14:01:27 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wGKqA-0004zP-P1
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 14:01:24 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-651c5d525f6so7439106d50.3
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 11:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777053680; cv=none;
 d=google.com; s=arc-20240605;
 b=UaRA6jCE+oA+d4mcLJYLu8l+21umq0j0dBEu1f53jhfHlVZiCA/eWLa6LtRG6pQ7SZ
 Xaib00mv12yWqc4K/+4UlUekSqWuNLb7MJDhdqhJlqHGR2OHapw6Mj3aGCrTU3ksShgm
 8rNZaw6tRXrEhld32IjlxwPaXvHQfnZVdaRSgMR47+1eMTd12Nbi3UaBFLyskfkiiOFd
 191hORKLhFJSAMrI6yW1vSdSBs6xFdBLrDMt3efIdK6CBtQbcInXeSdQiB7/jmSaJXS3
 RgpTaYtWy1LYM6GIw9Tk03E9UlQrKZmtHj4UDwyn9xKzyFcLpUxdbGcR+ajUtVcnJGxQ
 7mtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=H6xKs2JcMzQ9U+izquUmflV6O2vtt6hKMo3n/a44qso=;
 fh=AVBk9WGG4RzMLaBJ33hCUzZAMgfotgDgyvnVJj2Olg8=;
 b=U2R5L2GJGV8hn9l011+o2ni7+807Q4YQtu+imR/uOhhJmKBVo+iZlZgRUhQkgb+LU5
 YdfTGpTdjzcu0jn2BOLZcF/oGPu0dvgUn2hfsFgsO8IkqKuzbXM5TvKhhv3SFWyFDZBo
 Uuz6Lmv4KI1jPvyYzgSo7w9nel/5SBIsql17aCdfvSFJAX9h9mg7Wk9wOEe9D4swalpk
 NNBWBz+pyxxnEkVKwIguvtAJnHOUUEW3boFUIDwZy516SPaZ7NsQ1JCPFB5+JqPwHuby
 E43fDNENhVnBmksI6UgwCSZtJs9zV7DGRdO4cEiFwdvAwxOKbUxoK8iUbO+zlYf0S5Ky
 LarQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777053680; x=1777658480; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H6xKs2JcMzQ9U+izquUmflV6O2vtt6hKMo3n/a44qso=;
 b=lIdGQEzHw30Sy0Wj2u/qhipoapIEt2FdI/olA4cDnU9GZ6eDfjMj/1lPsDoELDkhRX
 BuaTn/tfGpXLkBtUUrv9jtwpjoiGThccS+i9dahYOfGpDS/QG3YQt/2fHPTF2gg47Xdb
 Eyd/D4sIyew/BAgBSMpkiLeJH0luc67wKZQzBW8VKb2UGqiIcPB3v6HkqjkIZawD5vCj
 ILHRdX33lS0C3BnHHnfQesNjyOY1wrNnFEavqjxUXQd5W78TvEbE6qQepxKucpawfh0d
 3alFR9xBTJMUDuJxDxLnzzIBlUA30tI93xq00TxDfccmOVodQvC6sCndwXcPT42BX+L4
 NaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777053680; x=1777658480;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H6xKs2JcMzQ9U+izquUmflV6O2vtt6hKMo3n/a44qso=;
 b=iDOYIC9TerN2PMmB1yq7LAMP2FXRiTL29tw83kPZbR8jl52Eo1e3YsHgA6qZgBm2vq
 pUnFJ9KSHge9TfqYOXcy/f6tBV7DW15z8Gn75rHmsU7HOa2K6xOt5mBURvcHKkhW9oRb
 SLezb8+vUPwBCeaUbezTX72CwanCj2wPCd3MkD+7CmC84RYJZcAoPbwK58Epu8n3EVQ4
 otJGKp/rjKZ/AlLRYbMUijRXr9C4YgQrHcf7Za+NC4dBdK1eZTM81QfA+GWd5qpJIBD/
 xLQqaFVFa0B5PV6BqkWLolK0gvh7B2+WtucFVLjZDx7yyNXnwWWT2v+ninU0yGD/hTLZ
 /PXQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/TTFwQzAMGH70AZ6Z4O9tJdR0TK4+8Y+X2dkC17sWyxqwo6R7NXXv2YibwRfb2MObpRJwYJXURVA==@nongnu.org
X-Gm-Message-State: AOJu0YxgO62kNVho4balzDhsiWLctvpYTAquRKsW7s7g9jR0NO5+uM5Z
 z+CTU0668Jz+seyv7EickGYOOSRBAKZSDr/l9bowc/Ug/UCmw4nBP2lY9piO0NWZTYmUJeq5lsf
 PKy061rJkeREy8QUmvoWHUxHvY0bKHImKkmLsKjfsxg==
X-Gm-Gg: AeBDievApWHtVJECl0lDSj6LiNc/vmvsy1TpBv69/ZESM4A7Zsd+dYvr9zhdf2ulO0f
 YeLl31HNb0k2ulsIDU1vs/6ege1VvLxFkKCS4ByZybY2f/rFlMwMd5N819pZMtzPp/LZ6cV7yQX
 0evlBQSA6UKnckZk/AeDZ0F5VMXzeZqhqEFumO/DD/DtzuoxQ4UfLfiARRUPc85Ntab8pWA15Pl
 Ee+4sEeKpvLLCQPPDDccPUUgUVsSTBiN1uke8YTtfPGupZIF3AUmeyP0tpHWPcLZxyAuZjG5Y+H
 Y9SmFq9pCkqMX/IiSLsCBupluGU75+CDlRugFdArbCJfCkB8/J9obqybk8ujSNAQRD8wOLBz8yv
 aGA==
X-Received: by 2002:a05:690e:138b:b0:652:738f:4461 with SMTP id
 956f58d0204a3-65310aefc52mr30861629d50.58.1777053679378; Fri, 24 Apr 2026
 11:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250822092410.25833-1-cjchen@igel.co.jp>
 <CAAMq-Y86UY7LNe-p2P_d8mw7FgTqLm=HQdqbMvV8xxTdsZmx1A@mail.gmail.com>
 <CAFEAcA_EZxgnSHOEwdF5QayAxsncYnGGe4RDPP-vwYTqwU+dNA@mail.gmail.com>
In-Reply-To: <CAFEAcA_EZxgnSHOEwdF5QayAxsncYnGGe4RDPP-vwYTqwU+dNA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Apr 2026 19:01:07 +0100
X-Gm-Features: AQROBzCWjR3L1uL0RP9JA_c0WECdOHMhhjXkWv8Bfxkxy6uMh5lBSjMdEW3O5yA
Message-ID: <CAFEAcA_-XVMWr2ksaypuCiAZwU3GUKnvK26e35W-Tne8+BMNCg@mail.gmail.com>
Subject: Re: [Withdrawn] [RFC PATCH v2 0/9] support unaligned access to xHCI
 Capability
To: chen CJ <cjchen@igel.co.jp>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, 
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Tomoyuki Hirose <hrstmyk811m@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Wed, 3 Sept 2025 at 10:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 3 Sept 2025 at 06:03, chen CJ <cjchen@igel.co.jp> wrote:
> >
> > I would like to withdraw this patch series.
> >
> > Sorry for the inconvenience, and thank you for your understanding.
>
> That's unfortunate; I think it's an issue we really do need to fix,
> but I entirely understand if you don't have the time to work
> on it further.
>
> I might pick it up if I have the time to do so.

I eventually found some time/inclination to have another
look at this. I have something that I think is mostly good to
go, but I need to chase down the last few issues with it first.
Hope to send a patchset next week sometime.

-- PMM

