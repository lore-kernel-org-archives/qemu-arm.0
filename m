Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3614514wrp;
        Fri, 27 Sep 2019 08:06:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWdBbnjH20wW814A2pRpjNnR8ivbwipwqFRqDrZdYrXqt13dziexfRu1ovIOl9SZzvf4GD
X-Received: by 2002:a37:8f86:: with SMTP id r128mr5094475qkd.392.1569596765252;
        Fri, 27 Sep 2019 08:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569596765; cv=none;
        d=google.com; s=arc-20160816;
        b=RJAMxNMWA8IzX7xycYsGeuxwk61dW5+UM936tn72axs+yQgCKXx0Co9eTgjifiL6fy
         rXfkikqNHDTJmClKIIN5BtO+fOTA9/tkn7nuHqt3JShrpDd2eoVZwjo9hIW/BaP4Y3hd
         ks2ifVi4Rn8PSD0zW93u2M1W49E20pqKPLZ28eqTxXYn6SrpKL70VlHvZ5BIOHtfK08N
         jjqYy5t0t9cEHbEmbnFGkefSYVoQDEP6UBGGwEvLXnKlnaxz/UwfnoY0U8QnaYLdBmAX
         6DdoltN01SWXvVxKF/N+nV5ZniuVYEJzd9dRM9DR4zNI1b2mmZPAQQ8h531W8yp34nhf
         hoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=iFxNGnMHc2gomfgmq3P5pPVF/whBRHuAE9BOwskh+hw=;
        b=dPrlR0bzxidxUGckcZpIWgw1mwb+fOgYUfudhjwClP+YG4b056JHCJOB/rUZ+SNMBF
         60tcrbAme1owAnJkOASs7b7pa4hxixBbTlpNbPdlyOQvUpbDp9qmyIv1BBSuArCutwka
         lTt1LOPehrRd4Z1J9fmFBgduEXlqc0hyJEGp8cZJwHUpoKb57nSgEyy49QjLGBeiigHm
         nyVJI13m+AqLv27HoEmSZfrqmXNYps1Xm2E69kQQLZtAp36MgOoIlXaIsEhuwp5NIxbd
         YCs0oFL6ziKdXb7TEfZQxFWxndJdPuuliEH06iTJRPEOxawdbD/+IK7QOl0WirlisO4p
         LXpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IjA3JX7D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y30si4896210qvf.98.2019.09.27.08.06.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2019 08:06:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IjA3JX7D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDrop-0006sE-CU
	for alex.bennee@linaro.org; Fri, 27 Sep 2019 11:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iDqS1-0001pM-4a
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 09:38:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iDqRz-0003NV-Sq
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 09:38:24 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40855)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iDqRz-0003ND-NF
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 09:38:23 -0400
Received: by mail-oi1-x242.google.com with SMTP id k9so5199935oib.7
 for <qemu-arm@nongnu.org>; Fri, 27 Sep 2019 06:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iFxNGnMHc2gomfgmq3P5pPVF/whBRHuAE9BOwskh+hw=;
 b=IjA3JX7DIDleqxnLELS8jcb70/pCkCrV8JkN1Ujn0/mWiHUW3RvIqdY4HcEep0++BG
 YGl4jCRTQPFF28EfOQA+7S77rOPQdfUOQHdFmCKtJypx64IU3yejdn239QJ+9Q6rjbP5
 yDGJuCayFT7mG48tgi1AfoHRnMDXn+BY1fxa6jbMyaohEDzEJEN+A/YGkH1PIfZS46OF
 qU42Rco7BMGWTSjQrIlqoz3xo13kfDZxorWn5ArIvfBq+XUJKytRgI7jjgkTXLYg4Y5+
 ZOyKiqaazsNpUpX1ADbw4IsT9wGelYM03c9eubnJUp9rryKzCD0E4PtwoMBaBC6yTRq2
 d1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iFxNGnMHc2gomfgmq3P5pPVF/whBRHuAE9BOwskh+hw=;
 b=RUrpp8LQSlTFnA6d5aXHRzOE7RyrVohJvSPupHh5bZVDVOisv0aTTt4cazc+Ra0FcF
 EV+WGt3vY8ppDVsMjPrKOhRMsPiQeizd82gyRxVbQO77FHOLhAAUhVBqLrpb6bpfkUVa
 mFjM/OG46YOJRqfLahFDXZBBh3ND8SMhiRE6E6zI9gAP+kIjdJb0XpWcg8ARt7CcrYr5
 cZIpTFnML1PiQ0aL7nlQ8Mfei6zC9bGX3BihKCpL7J9L0DKqir0PWG8ku5jRMQA0TBfd
 uIBs1GC0vMNKmQifBfk2aLUP9i+FhlUzxrx5uxCi5QxQvdlqdqc82nd6mlGN6V35l17X
 3wAw==
X-Gm-Message-State: APjAAAUMo28i78WnJU5ViGUhTBykFciMexx4jXQqvYZijn9MOqnV6r86
 A0bSyIrOXz9rTLEtM8F82NRiZ2yp+FLne2njf9Ek8lGtGNk=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr6111829oib.48.1569581165430; 
 Fri, 27 Sep 2019 03:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190923131108.21459-1-philmd@redhat.com>
In-Reply-To: <20190923131108.21459-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Sep 2019 11:45:54 +0100
Message-ID: <CAFEAcA9V9LXQMDxE-QFCECJou9-7x-F8XDTCKSo9SkGT_oenuQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/boot: Use the IEC binary prefix definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RHSr//4Kf29Q

On Mon, 23 Sep 2019 at 14:11, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> IEC binary prefixes ease code review: the unit is explicit.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2: Use 4*GiB in arm_load_dtb (sgarzare)



Applied to target-arm.next, thanks.

-- PMM
