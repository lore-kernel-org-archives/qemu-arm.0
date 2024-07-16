Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp223653njk;
        Tue, 16 Jul 2024 07:45:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSZUcUaHNiB1Qfs8c1iCOHToG2iKa8n2LTVkxsWjAfjv95hV4VNLe76UQFyNsunhH6qPopWfH+2Lrg+0TOAjUNBIdQlnju
X-Google-Smtp-Source: AGHT+IGXYpDW7yUlsSyrJd463GH+H1dEn7QGc1aOfbCU2PYbVLRsUWMn2W6YQDYDkdolfSBlydpJ
X-Received: by 2002:a05:620a:4311:b0:79f:1388:1ae with SMTP id af79cd13be357-7a17b6c9c80mr297333185a.30.1721141108916;
        Tue, 16 Jul 2024 07:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721141108; cv=none;
        d=google.com; s=arc-20160816;
        b=uvFvB72r+qeB5BUmWrIF4vhMXJF4SrJKUlE++cEHPWJ9RoFOxtpOKjUoywkAZkoMKj
         C2X7A6i2jMj6Ho6sNX83NlElW/DezuK9N1CdilqWDFg8iwVAs3Wucn+jhBaGLx4Bu4ra
         WPmT0+eIWhMfUj2uaAPEibUC8pVjZm6RvcrmEtxviSX1XiykjiF9ws/wc0SmerIVTWR0
         fashsvBFstjIJUvWzQscicliev/9gyQLgRG/+qe8lOxdMlkoDB3OfjwnupSrzGEZwMJX
         QB0yg2s8xWKHnKIJ8LKnbbMatdWkjzZbo2Sx3Qjw2GgGmxMit320TDi4nN0sTwX6hHVA
         tsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9rzLZmf8wi3VJrCA9+xiQjVWImQTbreBpuPWfZU1qY4=;
        fh=GkTNctjtZVjga7gcNAZXKTO5SyvYgf1nc9zgiDNQtV4=;
        b=WjByEglgREmeNdChyI9sMZdRKlK8nZbHQFDgezcDfSY67bYzMk2TukQozx2lSd9CV5
         Y6xf8Felo+XD/2Z2rVfa5mUQsWVo0e6qbrrx7Y24UqkP9RpEMSShw3V2lE8+xYhZ3v4k
         RSdpulEcGbO482Uq7NwRnl+QpEMqqih4rOjfUp5KClOG3EwyfD87f2EidG3z2Pfj83CT
         YpkKoiNQxrUA53Uzrhxwy6TNQTtVq6+Hm1X6e4N8WVXVc6xrGKElM3PL2Zf0MPIi72kj
         +Rrn4Q69ZEz8w8S73nVmR7eHSDU9Ld94L94eao9oAq4FjdypZUGYV0ct83yxRlAvdjmP
         8W6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ejPZ+WUM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c49688si768241685a.231.2024.07.16.07.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 07:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ejPZ+WUM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTjPt-0000pu-8X; Tue, 16 Jul 2024 10:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sTjPr-0000g8-8f
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 10:44:31 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sTjPg-0003AU-60
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 10:44:30 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-595856e2336so2501142a12.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 07:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721141054; x=1721745854; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9rzLZmf8wi3VJrCA9+xiQjVWImQTbreBpuPWfZU1qY4=;
 b=ejPZ+WUMRG+zUnrqRJr5YCo2iUX8oe/tHFv9tgYikez02z+7msW7Ast23OQ0qdMieD
 fwQIRVwqkOCFBUUMe8FWB2Uc2mjNlnmAqtpatzf0+sFDjm7zlfZJ7BMMnQn3o4Gf0/KX
 nNVSqm8yj5bWqCm+7WwYcREDycZnUhXAR/k27Tn1zuR9VrcHgchzyXhc120u4E+eiMfr
 dQRaSFjAbDR0oAPjshi/d7J6vOp57OLz1iKP3tDT/rji7MxCendY2zgrjB71R/NRiyI7
 nat5TDBdTFwlgaJmErxeXfmzqeVgZXsfefb1eucxLKX80WJBqzAKSjfeSq7qhy6b3kpK
 4aIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721141054; x=1721745854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9rzLZmf8wi3VJrCA9+xiQjVWImQTbreBpuPWfZU1qY4=;
 b=f0EW+aquDPQl5WVUytFrtjpLTxPjlE/XLSYlh9mWhvCgRIV5czSwugZnzYgK+a8euX
 ptVpx6oqcIozZ553pCtJliCiWDY90JRCPGLuSPZEINokpZb8IiiMy9jI9roqPWqUTp/Q
 aIfs/xjeTaTm+uV7WkDuU6GXLWXiavfkv8JBVg0WtYG/AD/7SzR9ILNboTu2ZKk+yzvL
 88Ep8Ln30+hqXzF0GRFnjggNElFrU8mx6EKppEStBIGAEr7ygqA5OteEhOSxglVVoDqP
 PkV4nKx8TcvTM2vO7xh2MPApE4+V+Taks8jlvcYaF15z9JcDBb2UcHWGuiGzGCNW7s3u
 PirA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBqb0D4ot+hAMoB8MIhNvaAwCwLCdDlxIKBxYcM/G2IbMWbpO1WhCdbs5x/3BriDQR7UfZYQbFb5Ux9tjSGIRlyg/c
X-Gm-Message-State: AOJu0Yz0F/ZDtdm8BUJnAQ7OIXWtANpADP6DcanWOClpGZbFTyUW/53l
 mUb6IExuawpBXTFqLr5ElIDZX/5mjugOkVEezuyj6VRiXE9PJbnA+oKtRnRSKji4RShGsK4CMYy
 vzYFI5lFTrapmlT9DxGkv7mPfZJgDUv8DAPEY+A==
X-Received: by 2002:a05:6402:3594:b0:58b:bb69:763e with SMTP id
 4fb4d7f45d1cf-59f0ac09412mr2071906a12.7.1721141053847; Tue, 16 Jul 2024
 07:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240713160353.62410-1-me@samjakob.com>
 <CAFEAcA82m+8K8rWDMBehPp=NGUezHZPn1LVoyU3DJ3LWq+ZnAw@mail.gmail.com>
 <3e35a80c-fa0f-41f5-8a63-30a873fb3bad@linaro.org>
In-Reply-To: <3e35a80c-fa0f-41f5-8a63-30a873fb3bad@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jul 2024 15:44:02 +0100
Message-ID: <CAFEAcA_jA9BnBRYZK8b15ibp7SFw0PNKb7H=-xs4p=ttOesahg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/bcm2835_fb: fix fb_use_offsets condition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: SamJakob <me@samjakob.com>, qemu-trivial@nongnu.org, 
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: CKFvV9K12K7u

On Tue, 16 Jul 2024 at 15:37, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 16/7/24 12:35, Peter Maydell wrote:
> > On Sat, 13 Jul 2024 at 17:04, SamJakob <me@samjakob.com> wrote:
> >>
> >>          It is common practice when implementing double-buffering
> >>          on VideoCore to do so by multiplying the height of the
> >>          virtual buffer by the number of virtual screens desired
> >>          (i.e., two - in the case of double-bufferring).
> >>
> >>          At present, this won't work in QEMU because the logic in
> >>          fb_use_offsets require that both the virtual width and
> >>          height exceed their physical counterparts.
> >>
> >>          This appears to be unintentional/a typo and indeed the
> >>          comment states; "Experimentally, the hardware seems to
> >>          do this only if the viewport size is larger than the
> >>          physical screen". The viewport/virtual size would be
> >>          larger than the physical size if either virtual dimension
> >>          were larger than their physical counterparts and not
> >>          necessarily both.
> >>
> >> Signed-off-by: SamJakob <me@samjakob.com>
> >
> > Thanks for this bugfix; I've applied it to my target-arm.next
> > queue and it should get upstream within a week or so.
>
> Since I'm seeing 2 times the same patch, adding R-b again on
> this one:
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> (BTW Peter the commit description is mis-aligned, if you
> don't mind, correcting it while applying would be appreciated!)

Yep, I already picked up your r-by and rewrapped the commit
message.

-- PMM
