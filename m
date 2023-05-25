Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp342255ejb;
        Thu, 25 May 2023 03:45:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ54Bzi7IDcHrPMTA21llBRVVVe8mVRIQEoy6Z1v0U83Gcdx5pLe2xUSzCVYVDa/ssUXIV3M
X-Received: by 2002:a05:622a:115:b0:3f6:bb5b:8111 with SMTP id u21-20020a05622a011500b003f6bb5b8111mr9399902qtw.60.1685011514381;
        Thu, 25 May 2023 03:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685011514; cv=none;
        d=google.com; s=arc-20160816;
        b=eW7iB4mPuniOCa6YtYLbUcytIrd8YxYIyOu4+9xBWjNVx4QVRC3yizezFePG9yGGmj
         JH828QymKC9R550MMxz5FS73Zn82ksUixkagDcoCKHuzMh8mTUbvBAdd25NwC0ewbSsl
         quPTAlIyCHtc6PcI91Hk3mazwXhvprY91XUGNqQcySKQSQehLKjGlk28y7OAMvooaXIX
         /qoC8wD5gtVozI8oxOBnrrBEPdp3dELUKZR0pJ0YE8d2o2HlzBPRg7RhSh5nWnl1WPxc
         ZjoKUuEmQUFgtR06kU+cz0wRUNz3hKsv7qaLsviXwHYRw+Rh70DZcWOfR1uo/kZr3aJR
         +TiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vWYowbDvLeOrwzMARKlVtdOqzmJwepXc0cA0rkSGT+U=;
        b=I5C+s4JfhBsDmeZFa3QzZwf1897osJXE4XKjcr1yHUM0/+oMIo+XQaJH26Z+dBk73H
         VKX6cFVSyrnXSB6tWS/S8V6bWyXRdmJUgzTILowKJHo4tNGnSrWy1aUIweQRQg/Xkbvp
         MuLriBI4433H613YzzTh/EfxDgTipUV499l6OJa6/bShanQ2mCIt44rQedRInnA+JRmq
         8s02xkn6lr2XpsPZR8GNjjHDB9wQLW1v/sKmWdVEQsjhkOHMJbxmX8GmoDuYWNv2oQwP
         t3zwok49UsONO9hdrWTn1fjpTfcf5Y79G4ecHSnxaq+wv8RLkihMvUKYry10HYBdxAuQ
         4lvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gnymi+Kp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12-20020a05622a174c00b003f389d7996esi318468qtk.605.2023.05.25.03.45.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 03:45:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gnymi+Kp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q28Sr-00006L-Ly; Thu, 25 May 2023 06:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q28Sq-00005j-DO
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:45:00 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q28Sn-00050r-RE
 for qemu-arm@nongnu.org; Thu, 25 May 2023 06:45:00 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-96fe2a1db26so85187766b.0
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 03:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685011494; x=1687603494;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vWYowbDvLeOrwzMARKlVtdOqzmJwepXc0cA0rkSGT+U=;
 b=gnymi+KpwGWr1cGL3F0TWcWB1ENDjopoWsHiuKi3KCFZLX8DH6TcQHo566tzsmSMfO
 qXdHC0MEI5ZjYPNWnI/eI6GNbfNLjZuf+IN/hOlu2BcX+gQ+vEXtj8m6EwLZNaK4vupX
 cs0+oWr/P3DvvloXE5eioC/yn0HqWY/8T5DqJA6sfKA6x4U48CGn/m/WTgRAWTWCVpIL
 mg7/zltsITNm9I/OxP0RDV1I3TmnZKLtk95DOm9bCJLJQpVmIHdyCQT1Z75Vw9+y/+rb
 tYBV7P0jo+kGhxVQBYLwfjipfmDv1Mh6oxJgaHDI48chNQUjSCiD7cWLlZp9bsEZCE3O
 HI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685011494; x=1687603494;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vWYowbDvLeOrwzMARKlVtdOqzmJwepXc0cA0rkSGT+U=;
 b=bFNdmV7jfaC4tO+gGqBtUgLPMP8lN+w8t8NvPHTCgJdqKIkbCvVY1d3yVVEmQw5DfZ
 59J1Fj9VeCq8RimMMcjHzkkK1QaPX27yFS98qG5FhM+L7yyr+3UGbanotL66NvptBSKA
 rTT2BmFRUNCA0eHquKHHeB9XCq6EQm8eKVltc/XTcyoZwTl28irz3Ro++FBK6JhrYMQb
 9jdniD6LyRaVy6GvS8LMwqu7cxvxceQhZiJpOk/IsPwvvc0jQZHmgJ2ASn4yC3NBsOh0
 5yjLU+qWS0BPDSHinp3TXMWxWZNcbAn3gKlXwYCWWCEpaKuLKGkfNWe/Xc/iqlWbzLDa
 xdsQ==
X-Gm-Message-State: AC+VfDzW0P0ah+h10thlG7GveUbVaHCIl2I5ivAXdeJYjTVc9EYWc2M/
 tHQLbejzboQWAOBU+7lPG15kgf182oPr7mzZmOCj8A==
X-Received: by 2002:a17:907:3f8c:b0:966:6035:c81e with SMTP id
 hr12-20020a1709073f8c00b009666035c81emr1183251ejc.52.1685011494558; Thu, 25
 May 2023 03:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9GamGybSzd8FKBtmZ2qMgjRFy6D=Vhu1y0dL8m9Sa80w@mail.gmail.com>
 <20230523155644.678524-1-marcin.juszkiewicz@linaro.org>
 <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <4101dedc-91d7-1735-4655-81082931b79d@linaro.org>
 <49fa8502-70f9-cdc4-1058-9d4202400db6@redhat.com>
 <CAFEAcA8OUP9vnJwRxcT7AUWPD5ANhc17ETgePYPe2=-N_ZvCsw@mail.gmail.com>
 <e6444d41-62ba-2381-3b26-78e75c2da56e@redhat.com>
In-Reply-To: <e6444d41-62ba-2381-3b26-78e75c2da56e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 May 2023 11:44:43 +0100
Message-ID: <CAFEAcA-BX6n3YWy+PtSED=Jex9waiez4vxqBK0+Ob3hT-SZmPg@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: sbsa: correct graphics card name
To: Thomas Huth <thuth@redhat.com>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
X-TUID: t9ZPBdVOscCD

On Thu, 25 May 2023 at 11:32, Thomas Huth <thuth@redhat.com> wrote:
>
> On 25/05/2023 12.05, Peter Maydell wrote:
> > On Tue, 23 May 2023 at 19:41, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 23/05/2023 19.30, Marcin Juszkiewicz wrote:
> >> ...
> >>>> (is there a reason why it can't be disabled with "-vga none" or
> >>>> "-nodefaults"?)
> >>>
> >>> That's something I need to check how it should be done.
> >>
> >> Other boards set mc->default_display in their ...class_init
> >> function and then use pci_vga_init() (or vga_interface_type)
> >> to instantiate their default display adapter ... however, that
> >> does not seem to support the bochs adapter yet (see
> >> vga_interfaces[] in softmmu/vl.c).
> >>
> >> Not sure whether it's worth the effort to extend vga_interfaces[]
> >> in vl.c
> >
> > Isn't that a legacy-command-line-option thing? I feel like
> > the recommended way to select a different graphics card
> > these days would be to use -device my-pci-vga-card ...
>
> "-vga" is kind of legacy, indeed, but currently the sbsa-ref hard-codes the
> graphics card to be always available, so if you add a "-device
> something-vga-card" on the command line, you'd get two graphic cards on your
> machine, even if you use -nodefaults.

At least some boards do "only create the default graphics
type if vga_interface_type != VGA_NONE".

Mostly what I would like here is consistency. But also, we
haven't added a new item to the '-vga' option list since
2014, which makes me strongly suspect it's legacy and we
should only be keeping it for backwards compatibility.

> So there needs to be at least some logic dealing with vga_interface_type if
> we want to be able to select a different graphics card for this machine.
> Then why not go the full way and use pci_vga_init() here, too? ... that's
> certainly the least confusing way for the users.

Is it? From an Arm perspective, having "-vga" do anything
at all is pretty confusing: it's a rather PC-centric option name.
(Also pretty noticeable for the Sparc TCX/CG3 framebuffers,
which are not VGA in any way.)

thanks
-- PMM
