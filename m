Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2641655eja;
        Mon, 4 Mar 2024 07:03:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVl9Vvn/ZtUbfKZaiC+en4Wx6aDJsECj4pQP8NatydwKxsmwo+uMti9Xv1oj2kE3+my/hQCpMgbR91kgd4jHdNzDxjwUssD
X-Google-Smtp-Source: AGHT+IFJRXKyB9W6dmaA/4VODI42jceqhHq6jiGmSIKyr3CNcAPIXje2WORid8hpAtVRtAaQXms8
X-Received: by 2002:a05:6902:1108:b0:dc7:4460:878a with SMTP id o8-20020a056902110800b00dc74460878amr6673615ybu.3.1709564580499;
        Mon, 04 Mar 2024 07:03:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709564580; cv=none;
        d=google.com; s=arc-20160816;
        b=wlq6c/jbhd8IzvgecIF74GW3J0aoZ3nLhWM5zbxLp9SR9KXTkpsd6xMTql+c1UaRaK
         FHmqUqsBekdU1Srbym6J5Rs3AiNRAVjWqfKh8FIj8qkSooiID9FtXfWp6se/FsTG7y97
         PIxUAcEhfYO01j/UIL9mUe3jmtUb/I3m79ucFs+iIMWvjQ51VoyjDX0pEb6YtkVBdJAW
         tno03tKRG4rbgO6nfD29xigwu2ymMFNCAIMT3tqyY4OqfiGDxR9LdAalIYlMBS5Z6YxN
         u5ZIDQkwM3l7RQo0sm+NmBdSQjhjqHHY1BkAWPGaIkReIttO3x0fx9EEQR54ji2DTH2d
         msYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=otbtgtUNVpwfIth7PNDoBPWCzPaH5tButK7oNpC0WYk=;
        fh=qXYAZEGsmJzvLt0ZGrb18mxIGXMtPPEflpX/lCVLtWA=;
        b=jcekk+DCTSqQA/ZrKe7IjykqeBC/gbSyb3e6MyUQQ3FUkXwysyHq+R24bjDEAMyjwv
         LiB7qJ2XY4iUaFHFQgtoc+wnZQlaFXGQJHeIu5nAEIHXE4SPvArfMPDqSlSMnDCgjvS6
         XT9naAbfY84D//RDt6MCSBPoD28KU26ocF7znzYjNfuyXSYDO+0ngYxPd9j7X0lM9Y4K
         iQ+CQvSZ6ioSd90YfQWdlLqVc18MmHiCUV2fIwtpDw9c7kKJpQHLvBfwlIPlc4zOrtp+
         hDH9K4Sk4yviPazeXIN3yCkkqFsMt4qtt8iDXbPg15t+NNFU3Zt3U0qFyn56GAI8nJpM
         u9WQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z7/K6HQ7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e92-20020a25a3e5000000b00dce19d60b46si2320117ybi.474.2024.03.04.07.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 07:03:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z7/K6HQ7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rh9q3-0003bf-D9; Mon, 04 Mar 2024 10:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rh9pw-0003b1-Qs
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 10:02:40 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rh9pv-00019P-5D
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 10:02:40 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-565a3910f86so6861471a12.3
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 07:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709564556; x=1710169356; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=otbtgtUNVpwfIth7PNDoBPWCzPaH5tButK7oNpC0WYk=;
 b=Z7/K6HQ7yYhfp0z/EVQckfqasJWY7Cpj7c3o0r6i8r4OvtfldXXk82XgUcXZ1TwrAa
 C3KBapgYHPPVHUnc16WEPx57aknBu3p0lDV6LcDutNMaFUEYKo5plzkaeWSJqM0XsD7K
 D6tVKFxQW09tGF+2BtaspnPq3wySYaqTFPWyDTNPPB8pSSrWKilGIpO+F9jsSYxGtr0J
 3KdAs2CksbHd6enI0ozs26FL0wXClRk2Nmnepoct4TQzg3j5Qr31yVgeZ9CHBefqc2Zx
 s27+oB6v5MM/KGaCmCMcBV9qi4ZIInqDx3BcDfHwvkvRLMHqEeLsebjeZm2YolDZwgk8
 JQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709564556; x=1710169356;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=otbtgtUNVpwfIth7PNDoBPWCzPaH5tButK7oNpC0WYk=;
 b=ZgU/yIHSLvVTUP5f4gnWYAZIqJ5Ynk820134Y74tQdEBcJ9nUVEX25o5isN987Cwns
 gUkXSm4mcnnRbnM9T1Vqcv6UoF5jBcfOWsrVGA2dQp7KgCttkgzAU5ruKTcK7PlqAgfK
 8SnsKd8GPnHRGMgFlRJ/53oQrTSFLs2ErNLELd2jmA1OQ6303AqaJ1nBuus99Jq839+6
 UpEIvNh2NNmgfGdYFdRHt6JBkPUxr53JNlC1e77tLAoZNcOx0Jr8pGMLbe9buqGyaAm1
 mcTtLx+iBlaQIINmRrRIU5bymyVJTanPsl6k+bKtnvQQYxJZkBK1AhdOtVB2Dq7h4YSK
 CO8Q==
X-Gm-Message-State: AOJu0YxNgPclMwU7Y6RjjPQ02eVU6G88GI9l5RWYK4FTf3YD78FnfmOw
 f6DZONdi/DKe25lJadbZGSgODC7YdJ1Prx/kCAPALNgIB80fcTnHvtPpsl9DKACJ29j+klHXhpz
 2Tw/8HQESXCnP8FvU7F4A6rhADQP1wOqrpqQEUQ==
X-Received: by 2002:aa7:d8cd:0:b0:567:56b5:8960 with SMTP id
 k13-20020aa7d8cd000000b0056756b58960mr1710862eds.13.1709564556606; Mon, 04
 Mar 2024 07:02:36 -0800 (PST)
MIME-Version: 1.0
References: <20240227054855.44204-1-tong.ho@amd.com>
In-Reply-To: <20240227054855.44204-1-tong.ho@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Mar 2024 15:02:25 +0000
Message-ID: <CAFEAcA8EH1VLRPBb4gGCHotLbG6Gpnf3OqGM5Vy4GUX+2h_=_w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/char/pl011: Add support for loopback
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com, francisco.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: qUceIPBwJiOH

On Tue, 27 Feb 2024 at 05:48, Tong Ho <tong.ho@amd.com> wrote:
>
> This patch adds loopback for sent characters, sent BREAK,
> and modem-control signals.
>
> Loopback of send and modem-control is often used for uart
> self tests in real hardware but missing from current pl011
> model, resulting in self-test failures when running in QEMU.
>
> This implementation matches what is observed in real pl011
> hardware placed in loopback mode:
> 1. Input characters and BREAK events from serial backend
>    are ignored, but
> 2. Both TX characters and BREAK events are still sent to
>    serial backend, in addition to be looped back to RX.
>
> Signed-off-by: Tong Ho <tong.ho@amd.com>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>



Applied to target-arm.next, thanks.

-- PMM
