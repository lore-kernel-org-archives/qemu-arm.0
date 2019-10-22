Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp194989wrq;
        Tue, 22 Oct 2019 10:19:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzUmJX+PKdLpEikwvMc2wIt8DtnplxH+hEjpRDba05Mcqp4aacRIwaF/g4EU9yEm38VHQ3l
X-Received: by 2002:ac8:53d4:: with SMTP id c20mr4311581qtq.90.1571764794535;
        Tue, 22 Oct 2019 10:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571764794; cv=none;
        d=google.com; s=arc-20160816;
        b=YZS2MS4bR7XqVUexO5yRGwaou3rDOPR1a3caSTXKviROT+CEsmZ0CO6AqPgruz3VG5
         nZIofxD8g3kMeS8HMjY3Y74xWX67hA78agxHVaQVjShOgljWRDoNEZh76fI3VhqwY9PS
         7Pmg7C2tAHXdJoXeqg3BhzYvgYAvAJNEMZtUpYL9yHB4y9pWFsV9zTHl6ocbjxZGSIAd
         ax8mvWCDimkwq1P88c5WHPMCaqiyJ1VF79RCoLa5rZHUu6DYs+bsIlc7DrbLa9q9D1U0
         CDCIOqRW8OJMGPvjdOhkaFdhuz0nBqwsQM+k3/oiT2o/nGlmS0WE3mHxwqNbSTUimNHl
         Jyxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ne/hWEhyLPh9P2iF1f90rmFstvnIDJwvxB4L5jsXSuo=;
        b=DxUp791BQ6brqsjv0Bxca2cCaPj0Bub7MQxKlS3Y70dW0VxYVKtn0kv/Q6GgaRc4Fd
         NevVn5zLxlgUOfyMC0G2ToJiyk8Lot5tIFzGWK/6FqoDgEhCRIPLDay/rr3WKFgK0UsV
         EZ5OHDGZIrjoWi2/gd0kNJLea7cByVMNVH1V8xr7v9cV5Yb6I6SQQ5PF0QpbcAWyYUog
         kj5DR87kboQZ8QKKh4Rgyr0MnRHVN4omDhiG5eT9ctl4d42YKBPCvrtZPf3AxQr6AxfN
         U9A8Ld8KsY1td1l4V2DrZ9TAh/sRnK07Yx9XFqKITW14DsRy6x5TaVW6G6mNOuiWN2hD
         OPlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kAjKDe9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si17011376qvu.105.2019.10.22.10.19.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 10:19:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kAjKDe9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMxp3-0004Jx-Lg
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 13:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMxom-00046O-2n
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 13:19:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMxok-0001vN-Sr
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 13:19:35 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43422)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMxok-0001uk-P0
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 13:19:34 -0400
Received: by mail-ot1-x343.google.com with SMTP id j33so411040ota.10
 for <qemu-arm@nongnu.org>; Tue, 22 Oct 2019 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ne/hWEhyLPh9P2iF1f90rmFstvnIDJwvxB4L5jsXSuo=;
 b=kAjKDe9ts8LLutdSWhimO3rnDoZSVaFLD8hXo4uggeLRx9cQ6lMwvAZxX/sjTaz1Ex
 wilD7EjhJcwtlumoFu4f8CQDoExbuMAFA6FTMb2ylhLSXkjhPt85ja/OtEzpnlnM19cy
 POdCLMl30scf4SlBHroOqgKcWgz3uiKv5kwRwSKDUSXEl+7UyvIrlBT8hRdFaPBOblk5
 QKYtWD5tp5lonBcX689hhiDG7l2RMlvRRcUjgIwwYU18mpjYdCXI9HfBi+/6VBSXaiLQ
 y2eukzOKlmkxivbBj0yE5U1kfUiH8DcvDNxX8HKxOJXwAaMphQqAOJgZARZgY7G2QX+o
 GuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ne/hWEhyLPh9P2iF1f90rmFstvnIDJwvxB4L5jsXSuo=;
 b=I+NYwiUEE3qyI/84VwMj35/PbE0gRYolpLVYuprHcXfKh/cwPv9bdwh+8qSSVd/oyr
 R/FuRzn2eUeDzagIls7kEJtkvr6MU+0PBQx5la06ZP6xhT5CBUUJdjcN89FjOzB8p9dO
 QPkwillLMhXUWfUFO78jL41rbhPVdHH5MV//wtT5a0kxiDvQykVeqzJE1BIchpzFnO2P
 ffT07MBWV9KYkhDi3m0weOtVNc4829lrcPxVe0UDAfnpp4+fmn3j9r1tUWieadBBuy5n
 BUtoOMBBdrNW7wT+98lOYxDdovQzb3gl9P2d6gaVGCIkhltVzGBYd5IfEhqjsJnnai6N
 RyiQ==
X-Gm-Message-State: APjAAAUQmSgJBunsMmbQZGQ185Zx7EtD+s26/AbCYi1aUVf+sEQAp9TJ
 stkuenDFtaMIV1XIas3Zia9HG6rascuKpyo8TakYbg==
X-Received: by 2002:a9d:398a:: with SMTP id y10mr3443749otb.97.1571764773451; 
 Tue, 22 Oct 2019 10:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
 <20191022162137.27161-24-marcandre.lureau@redhat.com>
In-Reply-To: <20191022162137.27161-24-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Oct 2019 18:19:21 +0100
Message-ID: <CAFEAcA8A4-wEy3ueq+Tz3oN3Fpyy_vXdQ4k_mmOXYiVwjDEe_w@mail.gmail.com>
Subject: Re: [PATCH v2 23/28] smbus-eeprom: remove PROP_PTR
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x4DZFNbXJdCZ

On Tue, 22 Oct 2019 at 17:24, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Instead, set the initial data field directly.
>
> (the initial data is an array of 256 bytes. As I don't know if it may
> change over time, I keep the pointer to original buffer as is, but it
> might be worth to consider to copy it instead)

All the callers to smbus_eeprom_init_one() allocate the
memory for the initial data, populate it, pass the pointer
to smbus_eeprom_init_one() and do not save the pointer
anyway. So we effectively "own" the data -- we could choose
to copy the data and make the callers free the memory instead.

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

I'd still like to know what the right QOM way to pass
256 bytes of constant data to a device as a property is.


thanks
-- PMM
