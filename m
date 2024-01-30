Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp984117ejk;
        Tue, 30 Jan 2024 09:50:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvOP3cipOp+scQxXirnwzXlkIGy9PIZBAmcsdNXl0ftBl7KD6JU6UMVR+AkcY0sWW/BnQ3
X-Received: by 2002:a05:620a:f:b0:783:bf25:1f13 with SMTP id j15-20020a05620a000f00b00783bf251f13mr202627qki.21.1706637023157;
        Tue, 30 Jan 2024 09:50:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706637023; cv=none;
        d=google.com; s=arc-20160816;
        b=mOJNceQRN/DuE+pjqXUbNu8Dub5T0JAFLvj98SiiWldFgN59KsbaOtdJFcBtDFJ6Nu
         SGMfZaBFwBS50JuTzt8EXzU7fyEzGC9vNPJl68G99B2d9DgXbMJ+Awz3rsw7xv/2zsgu
         dsioCo2lO+e6S0I8cYxpR6zSNioh92tSed2edl8ZKdU9RvOSij4YtY0GTT8bOdA8K+Qt
         BWfe4fgPSZ+iKgLo1dOH8ajWmeeLZG7jhL4X28hXZO0P28cAeAUTK1cZe1Utiakq/+id
         aEVVFdLxqtgxn4hCDfzvpg9ztO+6o7AN6cJ/Zw3f3YEBxPFRXzKYFK6eKrM7+C6auqcB
         I9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7C70GGg6nTSa5RvD+OHe9RS1Dt1in06RTmJma65o/RA=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=MMIzYkQ9B5Vp70jaiktAm9p8u1bJQjkkTC5iIznsIU+aYQlSuWetwa2a6g+f5deexL
         1G7VKssKrfxGgFFthF2sfzbtUskma1HRZxSqe76QZp88Sp7JeGCWOJKFXn98vdZE7cfE
         oov1LZHD23rd96+wcgLs5u3qWNh5eIvmBzVgVrOxs1ybllRSr/Dn/tVJijuAny7Vo1q7
         YERhUqu6mqZQTkAZsWh/WS7QR0WZ6z4FLUMH48pDVWOxCIeKLgz0Y7WZ3SbKRaxzDlsY
         p4NP0Ac4PF2Us21Rygt2p12dmakngBCJCTe75L6s81KU2bUkOwkVIIFgpyWn2Jlta5TD
         QzjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gnf84FkF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020a05620a0bc300b0078323154c8esi11313374qki.445.2024.01.30.09.50.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 09:50:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gnf84FkF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUsF2-0000fZ-98; Tue, 30 Jan 2024 12:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rUsEv-0000Y3-0w
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 12:49:42 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rUsEs-00027X-GD
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 12:49:40 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55cca88b6a5so4247611a12.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 09:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706636976; x=1707241776; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7C70GGg6nTSa5RvD+OHe9RS1Dt1in06RTmJma65o/RA=;
 b=gnf84FkFQA6YvvRNI7UAFPm5uPQUvveWXH9lnDZp9YskT+trn36HpI6wcm/6fSl8gG
 Jy5SXt1NUHCclgoKtXEZENG5cxIVuiJfR893UPW5i0z4hpi3iMD+tlH2ocr7lvH0/3JF
 zUhGucuEzze235UEiKHBYi5wUCH1TGxSs7qyZDCnGySlSESUQ0+5jDtyEIjYOMrCGTTk
 QotquIwv93kiYsScNHrD7M3ko8k1yZbdLJDdo8WGvwl82OnBVg8eZ7QbOxnFpSjI0ENt
 ZSmxV9lZr510PeAJe0JV/19GYXqigl0HH+H88vDq3k6xpZohJS8BpC6sfgBtjBzR96re
 OkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706636976; x=1707241776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7C70GGg6nTSa5RvD+OHe9RS1Dt1in06RTmJma65o/RA=;
 b=fGnouJy9fXAFX5I6fHsZNuHfdtA3OmlpAFcC73UYKpWvzgwTx1KFdfbSZXj2rrzOM1
 EcGfh10Qvyx2urJb7VodhJlX3PO/1Zy3M1ZFRcJtlHCt8k4cx0a/PsmVSzOQ2D1TqJaY
 pTFkRSTL1sVs3OcKAy2fLdUqT99G7D+8YO9VItYiqeNlif2ImkJNfBUxXAX6hyTigSuo
 KrXBNUfYuoXCAtwfuA2yb00G/roXiEM8KDvb9wM+ae9rwPN24S2jssNE+Sp9hBQYJxX0
 e62xdaAM9gwCVjNVUV2a2nCjFQi8xM9bk0lj/2BouzdqxtiZ6YcYxiv3m8PCwOpM/zJx
 BPJQ==
X-Gm-Message-State: AOJu0YyKaqpTBRJbDA7pj8pHTieFOR+eA8p9dmZjHENcBpr//CMqKzpt
 ci9kSnWEpYu64keqXSvNdzTLNPLkwAdjLxULBDmwjwGhwiH7Cp1GelwRB2Rv2/9sqVrI79EdpPq
 iZ95e5E53aTzohI77SZpjCa01uHYZdS9C0Jrnzw==
X-Received: by 2002:a05:6402:f93:b0:55e:f047:92f6 with SMTP id
 eh19-20020a0564020f9300b0055ef04792f6mr4331226edb.38.1706636976601; Tue, 30
 Jan 2024 09:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20240125194247.1589037-1-nabihestefan@google.com>
 <20240125194247.1589037-4-nabihestefan@google.com>
In-Reply-To: <20240125194247.1589037-4-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jan 2024 17:49:25 +0000
Message-ID: <CAFEAcA-spMr3eHtdTYppD=Pt_fYQ6pjkD+b-Z1VM9gSvLT309w@mail.gmail.com>
Subject: Re: [PATCH v15 3/9] hw/misc: Add qtest for NPCM7xx PCI Mailbox
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: tgFtaeANy7V4

On Thu, 25 Jan 2024 at 19:42, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Hao Wu <wuhaotsh@google.com>
>
> This patches adds a qtest for NPCM7XX PCI Mailbox module.
> It sends read and write requests to the module, and verifies that
> the module contains the correct data after the requests.
>
> Change-Id: I2e1dbaecf8be9ec7eab55cb54f7fdeb0715b8275
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>

> +/*
> + * Create a local TCP socket with any port, then save off the port we got.
> + */
> +static in_port_t open_socket(void)

This should be "int" -- you've lost a change that I noted in
my review on v12 and made in the patchset I sent to the list
in the pullreq. (in_port_t doesn't exist on Windows.)

thanks
-- PMM
