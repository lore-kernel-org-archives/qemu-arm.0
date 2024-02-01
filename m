Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp343915ejb;
        Thu, 1 Feb 2024 08:18:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbGHaOPTe0g7X+DKxhgg26MBCZBCQ7OQ/mVshYgdUX+TLnOvRNlIfiXH+s0jQK0DohVjax
X-Received: by 2002:a05:620a:2916:b0:785:4786:e6c5 with SMTP id m22-20020a05620a291600b007854786e6c5mr2159268qkp.48.1706804326974;
        Thu, 01 Feb 2024 08:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706804326; cv=none;
        d=google.com; s=arc-20160816;
        b=PvvQt7QZCqCrnqXYvlwQGHKN8B7bxLZiYYRrtlk2f/Ase1RYsOtsKiPYv4y+jVPTrZ
         gj61UjzHiBXPE4D2WndxGHJljpa4rPH6GGSMhymY3tsN5aw8uDLVWcMt857ePQf12hWK
         XSAdovasUhLzN/92urhM2g5H64OK0glL+aIO53Z7caFH0YEe6TI0oLbVT5ylQBtlyqej
         /6eACHnoMqPKQE4SNRzUzjIsyKb+8jtW+qTw2ALBoUuE2rL4tosShEi8HJt/iGu5fDDq
         2JB/0OsRCqhCAY0++jAgRp7MO4LwfP+B9bjT+4YnBU2OzNIczb4uvCeko/O3q81U49St
         M4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2/odLJmMeHyuqRUqzmdAcU+qyr3LEbWvoXulvRLZ69w=;
        fh=UaqerOH6/7iAo+Z1fGX6SxcKFKdRiE5593V5tsghNX8=;
        b=kX+89Z5OqDQFib1dA3v1aRhFMLEyX9dkjMJG1RZCSQINPWTMNih5N3roeblkqM+6Tb
         mcwdx+wqJYXDWyi0TJcR9cBpA0REi6gMzMuEW2Cad6ckh/QjFuAlTG+v3RhAy/pyReqh
         sqQJoFn4JKpRoy8F+0ltBpzAuHKhQb+eTFIKmQl+FNRLyuFykxgh0sAMwo0OTkcRtZLu
         MrGgU8dIB1Shu+zUStb0g+yBzNfRSvMBYUo4RW/yL4cx0m4kR1Y2vvJKtrrsK/yjFYtL
         2xfS5nII0mb5WMFWuwMgURgTdPrjEqemifATg/LULHtYO7sInmd4dA12UBBz2hOolYUh
         uviQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rlLzP4Lf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXQ9l0F11dGMww9Ije5vERQEvaaLh4Ca45g/3XHSQq5x3y/ak+7gbEVIbYT6aZB2Zxn9oM0EAQuVdlao7eq3QagQknxOSku
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a05620a204800b007854f08e693si558634qka.118.2024.02.01.08.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 08:18:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rlLzP4Lf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVZlt-0004I5-75; Thu, 01 Feb 2024 11:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVZlf-0004Gq-NC
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 11:18:23 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVZle-0003KW-31
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 11:18:23 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55a8fd60af0so1595653a12.1
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 08:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706804300; x=1707409100; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/odLJmMeHyuqRUqzmdAcU+qyr3LEbWvoXulvRLZ69w=;
 b=rlLzP4LfhEsHCrYS/sMf8cnGwK08UT9Ri+SmBZAtP0BApkBTnvRG5qrjE/DY4yNcJS
 D215t4FN2yTXfoNMIVFH5EttxUYxSt5fjZCMZhu+EltlOp2fGe/JYqW7tpN9/2cZZ5M4
 Ko2VIGjGivzndUAc8YSygUnDCVC6NE84DPvQ9n1UWw9xuPj4Y5PPcH9gVfavU4XQ+QWa
 3X09Monzj9wTi2dvblzCUdbO1ex7t2XuOlmowCDU9qsXEAaHxGAfQYwxhwIFFzVaWsAT
 NeKxyWUtBFEldpOXgklfifpIQgtq5NHqBWUfoGYnI3drYvwhnfS/Hw+fGfbBtRCw2lL+
 ZCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706804300; x=1707409100;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2/odLJmMeHyuqRUqzmdAcU+qyr3LEbWvoXulvRLZ69w=;
 b=ieCg0o2P4psfn/F6XDvEPcGmVEfOnvKBjQ5FtEwLLdDscRLSHCaj+813Y7C7sGa4xQ
 EQ6L+Jqkd3V63Ufexq/ORlFuIVSqBKwOkMvVs98MxTo5ybbEx/SxwiTHtY+A7PAMmSAE
 anIiUrJP5OgiITa718e6HifVYeArJz18/bdrcYe0i6xY3uvqQo+lIuw7O6NVo8tbjCPI
 Gu+amu9ezp9fPMLaReX1rwu5p3jt2WvZNclYD9Yam8llfKC5JlaBYJ1XZcS/OGxJtWDW
 OvrItXXEX9WkAzaVwe9J+lDVe+uhGmJ7TVl4GFWkMLES1fZmhaPLg886IAzEjXktFAKc
 WdUQ==
X-Gm-Message-State: AOJu0YxMD6/VL5jv7Sf2Stw1WKSM9l84P9tbelTA03i8RC4p39G+5/bn
 tDUHP1qtpRLlnm8jOHlrx9wTd9S7dnc4RQgyqFSilCXSqd/eQDANwSFrZFmny82HUatViu/fQs7
 0Eqpu6A9ntRMTU9s84eWSVu3e+PPB4VCwgkc5gQ==
X-Received: by 2002:a50:e606:0:b0:55e:fcfa:607b with SMTP id
 y6-20020a50e606000000b0055efcfa607bmr4153847edm.32.1706804300171; Thu, 01 Feb
 2024 08:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20240130190317.25692-1-philmd@linaro.org>
 <20240130190317.25692-2-philmd@linaro.org>
In-Reply-To: <20240130190317.25692-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 16:18:09 +0000
Message-ID: <CAFEAcA9+HHFsE9KX_54aFwSAp_GKKHX6s+O4thMQ2K_n9FuRMw@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/arm/stellaris: Convert ADC controller to
 Resettable interface
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: ACqohs89uygQ

On Tue, 30 Jan 2024 at 19:03, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/stellaris.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
