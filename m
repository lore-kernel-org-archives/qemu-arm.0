Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp963198eja;
        Fri, 1 Mar 2024 02:22:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXClx16ES8X8Ko2F5P4p+Fqp5F2MC6aiwONraht2fFonRAJKybfAwi6ZYSVa+yXaHuw7hqMllmuDMVB3HYvBcAbgYbsx5M6
X-Google-Smtp-Source: AGHT+IFdj22Aji1ltpHPhmARddly9jqcQx2wo/sgJSWGwo3GHE3RirXTYPATKzQc6uJ1FrScdyJ3
X-Received: by 2002:a05:6214:2aa2:b0:690:2069:d413 with SMTP id js2-20020a0562142aa200b006902069d413mr6149787qvb.6.1709288534248;
        Fri, 01 Mar 2024 02:22:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709288534; cv=none;
        d=google.com; s=arc-20160816;
        b=gVtTcL168gMNtXevcm0QtfPyPta31g7zDH3DRYMpT/2ZSoS5JyNRZDAQ5pclRkbHr2
         RdK3e0uq93lkXHjYnSU8hJtF68GO7ISqq8fIW8MbuyoSIXKat1KM2YT2UrTxQFnLvRDg
         0INGIPTtN18lLw4g+MtTjkj1DjQUDFjyNAO8mydOsAUTvxd4tmMEP73as+uxQmwVLe9k
         dxtPq1NYiBiVzZE+AwDGAFBVpZn0wGn2PliLeD21WYpstYmM1kO8bW3GCLbX5pnT2ixb
         92dxcUK0RXWN7qGH1rr1URJPnbDgvtY+ZNpnJsNDD9k4k4rFGmBbF+gcblq9W+HQemET
         2dFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=SXZCdJhl+MszfFCQiqPABiD8VGtntDwPs8z8rJpPnC0=;
        fh=XjWUcZGzK99b699SfXgQgvkJkfa/Lx+rxJTjoS5EZqw=;
        b=BOf4YOxXsU4aVyNj/IMxgoW3upEIhcDVxHmHch4MIppyhPtJ4I52yam8/rNUhQ4sz4
         VS46Ip+aYHNHqckyFb24I76It+0thwkfSzmeNAsm+09nfX5MzPzIUm4jHfjdr0Gx0kVD
         /QSfCHHnAT9cnrXhTNUWkgCz0YSgg/n34kUBgQj/3ESjMrbKQn8Mj1kEoQK1JjMX/7A4
         IH7kQ/YPrKxGjCx2Bu4z9sbLwVXlVXj1m+hrNv0BbPIOZN4CRFdHuFNT2sIZE293FtKQ
         MfrnhV9+PhZ+bONzIULukNSK4NlEvlijNBfOy8z/LSQ9kyuHBg8JHSG268yNdl12wQZ8
         ByrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KdznxIYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ld24-20020a056214419800b0068fea008b11si3174584qvb.306.2024.03.01.02.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 02:22:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KdznxIYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg01Q-0002Sy-Fn; Fri, 01 Mar 2024 05:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg01O-0002S2-Fg
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 05:21:42 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rg01M-000636-JF
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 05:21:42 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so3150415a12.0
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 02:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709288498; x=1709893298; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SXZCdJhl+MszfFCQiqPABiD8VGtntDwPs8z8rJpPnC0=;
 b=KdznxIYKe2CmiU6dnBtJ1tznNYN0AXExs4USNIaqsK+1/4E8Tia1G9B+hsertounnJ
 kxUPBLvH9ebmUrD4upit+Y9VsNJDte2cSRo4d2nyZekz5Mh/Xz6wRFn8UsJ9JBUuWxoF
 toj7lttClaY9ghbqLfDhhleiluY5ng7/ZYXKmw2LNYMCLTcaOVUe/C18gGspat6md3jh
 GSeY/ksgHlT97eXd7/81zKBJCCqKXxU0AYuqGrw+SIIqyfDn2itBVuMhxEsQDmDmNDpx
 YDGJ1mslHmrjkmWu8GQCuiyPaMkuqlQwsabBrAhzaOXbkf8RjGFlDlTdihPUtP8VCCad
 TuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709288498; x=1709893298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SXZCdJhl+MszfFCQiqPABiD8VGtntDwPs8z8rJpPnC0=;
 b=WOT1tAWLkHzGqyIeCqFXUijxCEsOM74cFBI1Zxlfh9x9404S8CRWuuE1k4mCPJhGBs
 DM3UZfB2WyoIQ9HL8ompaZ1jpRjfjCXrV40RXb+fiYqB1OGFQ9OdWswovu32LndWyeMx
 mJk+YxpThNLg5JNOtiLo+wBkc9xt975d7LH40v51IyTQkXMMvQko5D1ztNUUZGxu60Is
 hXHycU7HD7EG2Jfmn4Yl0DNXC7ENDOLZ6Paa/ZJLpJl3P7/WK5FnzZUrpSKxX9ycqRoW
 ruo6qnoHwDFI8k967Pm4/PVwI8zyJu//zR1Ijri0RsoCSZTLq10ZksUaIQD04KvQL56q
 eIQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW38Jnw2RC6C/8pSta3rmf4Bf11tLSFdzXOWasuU6bsxnb4crxw1FtMiCxaW1SeI4BLn/YLwumhfG7D/YioVlhD95qN
X-Gm-Message-State: AOJu0YxjsnftIGRbWsRIPCyLyzL9/d2NlmefMtwQEocoBdwAeBRUmdhO
 PEv24q5fZxEGZORbov/3cSgU2ykzPc/L28Gqyz52GmAUGJfP/zH/UJJgksj4k4FKSXdYg/2ATR0
 +RbCJqUnuOxzEkykiWof7HDtPLEUTu5QVAk+W+w==
X-Received: by 2002:a50:8dc5:0:b0:565:98c5:6c38 with SMTP id
 s5-20020a508dc5000000b0056598c56c38mr919784edh.7.1709288498324; Fri, 01 Mar
 2024 02:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20240228114555.192175-1-ines.varhol@telecom-paris.fr>
 <54fe3a53-5bb8-4907-94ca-817c3000048d@redhat.com>
In-Reply-To: <54fe3a53-5bb8-4907-94ca-817c3000048d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Mar 2024 10:21:27 +0000
Message-ID: <CAFEAcA8Lbqgp1d3DCp+qXz=E51CfnAp_rbA7eF7C2BivJrGGtg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Add device DM163 (led driver, matrix colors shield
 & display)
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Samuel Tardieu <sam@rfc1149.net>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mpjdYwJjh8og

On Wed, 28 Feb 2024 at 12:06, Thomas Huth <thuth@redhat.com> wrote:
>
> On 28/02/2024 12.31, In=C3=A8s Varhol wrote:
> > TLDR: how can I provide a test or an example?
> >
> > I've tested the display by running custom executables and
> > comparing to the result on the real board, but I don't
> > know how to test it using a QTest.

> I'd suggest to try to take a screenshot via QMP or HMP. If you need a thi=
rd
> party binary to get something on the screen, it's maybe best to write an
> avocado test instead of a qtest. See for example
> tests/avocado/machine_m68k_nextcube.py - it takes a screenshot and then
> converts the console messages from it via Tessaract to text and looks for
> the expected strings there. Alternatively, have a look at
> tests/avocado/machine_s390_ccw_virtio.py - it boots a Linux in the guest
> that writes a string into the /dev/fb0 framebuffer, then takes a screendu=
mp
> and then tries to find the string in the file. The latter could maybe als=
o
> be done via a qtest if you know how to set up the framebuffer without a
> guest kernel.

The other extremely popular approach for testing display devices
is "I looked at the screen while I was doing the development,
and it was fine" :-)

-- PMM
