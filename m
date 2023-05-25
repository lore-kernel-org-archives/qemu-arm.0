Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp371886ejb;
        Thu, 25 May 2023 04:39:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XryCbvljCu5nJ8HaFQZXKq6v8OdkHz30TsjzvnIYw6uq1mMrN3f0DDmTaDLa+fhadshJZ
X-Received: by 2002:a05:622a:89:b0:3f6:a5f6:c03b with SMTP id o9-20020a05622a008900b003f6a5f6c03bmr22858856qtw.39.1685014766832;
        Thu, 25 May 2023 04:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685014766; cv=none;
        d=google.com; s=arc-20160816;
        b=xkBmb2fTvPVO7R7xCeGtqONICtXslxhqp0MuAyoGtfhqW9+SBNmxaSufLIGwh08jqv
         NqrAcRmDvtsK8kRTp5rcuVUGrE5nklDLeCdSKKgOBj/rPxOIdMA0Qw1IZ8REf0Gv+WAP
         jlcIf1MrZZuLmPm0DkUSr0rLMOTFmFDgHFXrTxLF2Dr6avTi0anMaaO0qxcnC3Gnwl97
         G2ulp6AnWHALzkXNYx12kLxVdxAguO0SrNzBQ4/BqOE3Q1WdEAxcbFgWTAsrVi0qFLfR
         874ADRsxbQH+OlLXGdIn34f8X74jS+cH0qqsxjz9gsXnkcIIXaID2SgT0/666iXR7FfZ
         savg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=C7VNf1rb4TufGf0vP2KuXiH0NfhrgahrSq6nimSchmE=;
        b=dO7v5PSSKB5+obEm5rRQKahCaYc4XevezGS7e/J/j/hqnBbMIS56YbFoIkjg10WvWv
         54CxZARmOmrMvhkzjzh+ow88x3mWX6pA/Jg6USEfIzi7BiIq7cguX0NhMRQLy8GEtMp+
         f3IBwL530GrUoSRoUSRVJhJG9ZQwUGay4PtEe//5FuEQlCc3RGxvrfzWlDMaOVZha8hR
         GQbQ0OOc8Bq4UtH2vKUiui0SAr0DvD++q2qIkOhj0J49wbmLBnZWdNVaiDLfFSUjymau
         EAmarBNj8wliXyo0zHe6DEgThL8Y2XGMSBJDGJHc2jhq44spu28KKPOTKusR4lKaKOYz
         cCPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DdKjQn2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4-20020ac87fc4000000b003f7f53ce94bsi379939qtk.227.2023.05.25.04.39.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 04:39:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DdKjQn2e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q29JT-0002EE-Kn; Thu, 25 May 2023 07:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q29JR-0002Bo-Ln
 for qemu-arm@nongnu.org; Thu, 25 May 2023 07:39:21 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q29JQ-0003D6-6a
 for qemu-arm@nongnu.org; Thu, 25 May 2023 07:39:21 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-96f7377c86aso90148066b.1
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 04:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685014758; x=1687606758;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C7VNf1rb4TufGf0vP2KuXiH0NfhrgahrSq6nimSchmE=;
 b=DdKjQn2eUlxd+yG8GJEkNxQYm4V4NAOoueE0wl1lBorTgurB1oOOb6seSih5EY0/8h
 XX8xWdWIjOqnCP3HyYffniy6A7TzpifZDIMBfQpFz7MHi8CaIiDkBONFQJIFhEY92lSI
 Ea3xwiujN+4UWXjx652KyJIFgQUiG0SM12UnRmeCYwOund62jWcKfoxrAZVLrnxxSy7r
 nVnX2tWrLeAbNiCIhZ2zOI1ZvXrQJvWYi/RntVmxwrBMo2wZezKQaszNir20eONNToM6
 3q88rU1pIzb8VvfsbCEY3tm5O0kMfj8Szb3/CUU3HTJ/u7m0kFxQ+E+TFEPyCzOWt2nS
 WktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685014758; x=1687606758;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C7VNf1rb4TufGf0vP2KuXiH0NfhrgahrSq6nimSchmE=;
 b=c/qBbloHpTwVwwWA5PFqiOmtMWm/UA+djE2a2Hzr44ynniA5V0GPKldxc7IDZb1+NR
 csu7M9/++CPjb8yTJMebdhVP7NK1Q/HsJF2qvFrQwVojTekVZaGFxzVNvyp5HgG0A/za
 MXjVNVBemYQUGJQ9iICJ3YbPRDhZCVJbtyOGrOB67IS6vjUl6kxJOv9SpDp3gXgrA/t2
 C1/4PiQ0fPAO9NokI0STRLJMJsRIWe5yrD3xDE/UNU8qQ2f7OnM89ZT5sgiiXuY8Rexw
 TgWW9w5DtHJk1pPcCopnxCOA7RZkKH/umNVCDYRdOfo3y+RTbqLid29s1jIgslZAKBjI
 GFxw==
X-Gm-Message-State: AC+VfDx00RTy3SImk71sgeIukjRyQ0N9TszEOtrLZ0zhTji72Lna0J6t
 LWUJcgjk8UsBRcL6eafak7QukNd01hDlaAhdGeRC3Q==
X-Received: by 2002:a17:906:6a23:b0:973:93d6:189f with SMTP id
 qw35-20020a1709066a2300b0097393d6189fmr1596050ejc.61.1685014758202; Thu, 25
 May 2023 04:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9GamGybSzd8FKBtmZ2qMgjRFy6D=Vhu1y0dL8m9Sa80w@mail.gmail.com>
 <20230523155644.678524-1-marcin.juszkiewicz@linaro.org>
 <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <4101dedc-91d7-1735-4655-81082931b79d@linaro.org>
 <49fa8502-70f9-cdc4-1058-9d4202400db6@redhat.com>
 <CAFEAcA8OUP9vnJwRxcT7AUWPD5ANhc17ETgePYPe2=-N_ZvCsw@mail.gmail.com>
 <e6444d41-62ba-2381-3b26-78e75c2da56e@redhat.com>
 <CAFEAcA-BX6n3YWy+PtSED=Jex9waiez4vxqBK0+Ob3hT-SZmPg@mail.gmail.com>
 <87675164-50ce-a387-12a8-f965b450eb28@ilande.co.uk>
In-Reply-To: <87675164-50ce-a387-12a8-f965b450eb28@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 May 2023 12:39:07 +0100
Message-ID: <CAFEAcA8O2WF2JjJ5k5L9e6yn1fh8n23cpkAbxuLSkNguaUumWw@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: sbsa: correct graphics card name
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Thomas Huth <thuth@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: cBUakL/2cKFF

On Thu, 25 May 2023 at 12:06, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 25/05/2023 11:44, Peter Maydell wrote:
>
> > On Thu, 25 May 2023 at 11:32, Thomas Huth <thuth@redhat.com> wrote:
> >
> >> So there needs to be at least some logic dealing with vga_interface_type if
> >> we want to be able to select a different graphics card for this machine.
> >> Then why not go the full way and use pci_vga_init() here, too? ... that's
> >> certainly the least confusing way for the users.
> >
> > Is it? From an Arm perspective, having "-vga" do anything
> > at all is pretty confusing: it's a rather PC-centric option name.
> > (Also pretty noticeable for the Sparc TCX/CG3 framebuffers,
> > which are not VGA in any way.)
>
> Right. From the SPARC perspective it was added to allow the user to select either the
> TCX (default) or CG3 framebuffers from the command line.
>
> However I guess that shouldn't be needed anymore now that mc->default_display exists.
> Presumably there is now some kind of -global sun4m.default_display=cg3 command line
> option that could set the machine default_display property value instead?

Maybe. Handling builtin default devices remains kind of awkward.
But for this Arm board they're all just PCI cards, so the
only thing we really need is a way to say "don't create that
default device"...

-- PMM
