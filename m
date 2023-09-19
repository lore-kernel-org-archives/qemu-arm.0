Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3780222ejb;
        Tue, 19 Sep 2023 11:00:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpBzsuSOqo8sXf3dlOWcSCWNMuGnCZV7nk84hDkf/gi8pqbprtRQC3qR0zFY4kmgawmn4f
X-Received: by 2002:a67:e2d7:0:b0:451:64e:4645 with SMTP id i23-20020a67e2d7000000b00451064e4645mr648886vsm.12.1695146411783;
        Tue, 19 Sep 2023 11:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695146411; cv=none;
        d=google.com; s=arc-20160816;
        b=SITMrH8kSglmxKzFz6Tqf2/QH3HKW358p9mSPp1ZexUfDPXF7lGTURadLAN47w0KQ9
         gLzSVfwObigTTHlnff37tHQaYZckqpTlCmMDyucgwwmVQqX6Zp13HiYguWkXFN/gJBr3
         mIa4YzIP0Si5SJPxWGEyLetF0afxR3plVIZnRU8DEMVzOE+n0snpiNT5gtDsoJk0bQHZ
         4jeOHLA3oXN6nfIbFke3aeVjuP4qLfZ41VaK7t3yjyNW1ot4TTk7vPl3ZssyKj+FN39T
         AIYBDSK0unuw8oCoxVaz3mf0myIi6qhPfRJUyCBJ4YauBgAA4fDzLZUM79yMY8tngQbz
         YMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sh5xh2e7bs6SumT4MbG/jJKUyxEtpyvDJseve3g3Xqk=;
        fh=ltNevxYH/waEgqf45MwYono4wQddkkM8F+rv5O1bmL8=;
        b=x4XjGUMEMYhBu3MdurdRBSdDvB0eVyrNMiuJQlhB410CaiVuM7Bf87ZWtkU4+Xukgi
         7zGmC04zq+bIALo5cPCyRMeHhcFKlhtfKIXhBtpVwevP8Tz9uE526ChYGq37ajKrwfB2
         fZptNwaFYUd2eMAZhGBE/4HcYB1OeAbVP2UgKDgIrUJXVtanzM8XwEGzrRcAJOHNdbP1
         TwWxSohvPtMp/pE4w96bN4kcD0Oz89nYXPfNbOEGUCc5mEmocyB905Bz3+4VxXkbLhNn
         i7BfCKhxCeHH7IfksPlaVdsoCXUsk0aU4UCmIPoYpCjBQ/urRbdbUw1TB45MSok8Y6A9
         b5ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=gy9UBLZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a0ca609000000b0063217340105si7674836qva.536.2023.09.19.11.00.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 11:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=gy9UBLZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qif05-0005Lr-35; Tue, 19 Sep 2023 13:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1qif02-0005LH-PU
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:59:02 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1qiezL-00017k-NG
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:59:02 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4047c6ec21dso11095e9.0
 for <qemu-arm@nongnu.org>; Tue, 19 Sep 2023 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695146294; x=1695751094; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sh5xh2e7bs6SumT4MbG/jJKUyxEtpyvDJseve3g3Xqk=;
 b=gy9UBLZRxTw80YhG7VIKHncUSHqtq5VZ490qklsyCi5NqmObjRsmcMHIyh9nFhw98l
 zbUctGJB58bLEyag6GiHO0ld8qIe5FLHMiMdwUy+FwZkL+tcI4z10h6orIB/6lx0Yex+
 VxMDE8xL9mejOOEhVPp8zewTilWkWCOAUJy8+PcgZIOaJc30cF+rhdOGr7Eqf+G7XVeV
 nFgdh0Lbi8sWoOWYb7uNn1n+YSayZAGN5uxEMlW2oe7kF4UD2e7ltSCakBlF+l8rBTLo
 sCHBeyHhZZ7z+hQDbN6bHXiMSmoasagfLWDMu8V96EF7VEic6HhIs+4Y+KLL359WVz1j
 QeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695146294; x=1695751094;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sh5xh2e7bs6SumT4MbG/jJKUyxEtpyvDJseve3g3Xqk=;
 b=Uy/RfgGKiFv3M1gJKqckpLarYHsX0l7ORTcj242m/z2WC4O4KyGCqHuyBMtmKLtzKB
 gvYgSai4U2qr0NBNEQpXHpdDjR+Lh/gDYlvGqKlLrUAa/s5976Z6zjxU3Lq5FKO3Ww68
 lzaPgPuSDomiMcx87aBn3M83k1Uz84T9xCxpK3Ic8iteWx8E5nR2fHb0KndYzza5ZDZ+
 O0jGvVmb271cslDykaS3QXiDwQ2MB1omJUGUvBnIyiNYUODSRbnAguirMwRU70mSzgLc
 oDPXrITQ+ijymX6XsfThmQRUa96wTeOLUxmwZ5QFbkng6lCc6tXr4REXRCWr//WQ1+sD
 j53g==
X-Gm-Message-State: AOJu0YxTKHD/Vze4AvyXvOJikaWsPkSarKJgxdzctRD+Hi0ER4uN8ehK
 39/kRF5+zcHirazvzzhFQ7kBL0OMIKGGuTGIWSdf4w==
X-Received: by 2002:a05:600c:1d09:b0:3fe:f32f:c57f with SMTP id
 l9-20020a05600c1d0900b003fef32fc57fmr9280wms.0.1695146294094; Tue, 19 Sep
 2023 10:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230919174200.GA1542425@fedora>
In-Reply-To: <20230919174200.GA1542425@fedora>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 19 Sep 2023 10:58:03 -0700
Message-ID: <CAGcCb129WnfjYqP-mi2j0wo2LT76ATj4yVS3rw+WMEek3R-aeg@mail.gmail.com>
Subject: Re: npcm7xx_timer-test.c is unreliable
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b3f9f50605ba00ac"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=wuhaotsh@google.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: Rzgynywj88bO

--000000000000b3f9f50605ba00ac
Content-Type: text/plain; charset="UTF-8"

>
> Let me take a look at that. I suspect the timer is off by 1 tick due to
> some rounding errors.

--000000000000b3f9f50605ba00ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Let me take a look at that. I suspect the timer is off b=
y 1 tick due to some rounding errors.</blockquote></div></div>

--000000000000b3f9f50605ba00ac--
