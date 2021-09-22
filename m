Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp137001lfp;
        Wed, 22 Sep 2021 05:46:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/EUnRIZ1lFzZqjyOTh4u+oYl46bUZI+B7fj0bIpD2JyWjuHjbXZZzG8iDGCEbIwn8+j+y
X-Received: by 2002:ac8:4b41:: with SMTP id e1mr24821418qts.383.1632314764316;
        Wed, 22 Sep 2021 05:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632314764; cv=none;
        d=google.com; s=arc-20160816;
        b=fuRU798ARgMfS+RhlAgQkYGIHHVabOT6CQhkUubfXDqPIEPCcdwF7/ZZ6uNvCoESz9
         P4VrUanSsB49SfbwzTQh+VJ9lgcgEzELpqajFpSBmJex6uJS6PCbKzNbeqRy0MPmPles
         jTdKUfpVp3DU7DPqkjT9oYpBNOXmi1LQ0/XGXOVe7Rt0ZQRq9FNI+9neDg2GednZEO6O
         gIHx2VChhGmk/H3OP1jBoa8bNv2/ewYAj3KVNWPzAgELWWvpIuOHdo80J0446z7o6gTo
         rnFqWCyvW/rWyHyvLLIR18z/CYOmMe42o6lAqqe1yU8WGuZuPW0Slc6IRpyfL/FfhuMp
         T3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MipNfkz7Nf1NrUuqmrUvxfk/BhvFLDdy9e8n769BM4s=;
        b=w3r2U3eahp9Sn7l6gIc/HrcHZ1WTXcI7VGSqFUnD1S3r7yTAIptCv6yz8fsZ1zeTOy
         jBWFjcBn04AzzgpElsNHSfMlKJs4TBgauBuT/S7RBnjbdBYwxicEOZGHOSstlbrcSGFY
         Oj6gwejtOwbs8LrHz7ut+KDiGQEI54iZRFLpGSJCiK8eU/c2pxCiBBZgdB9uS6tcl7dB
         7v4Tqb8t6WpHnWkrmImuCO4232Ij6/YBs+kDkeT3NwD6P5TNhVl6VnfdhJCRF7dwn/3p
         tIN+kvsLwPYn4uKuFbEkTihnDJrRWL8cppG/OWxti/9rKFgVGuCGa13qYN6mJCdU13Ut
         eZ5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jAykGCXO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj30si975665qvb.239.2021.09.22.05.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Sep 2021 05:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jAykGCXO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mT1dT-0004DF-Fa
	for alex.bennee@linaro.org; Wed, 22 Sep 2021 08:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mT1cs-0004Cn-O6
 for qemu-arm@nongnu.org; Wed, 22 Sep 2021 08:45:27 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mT1cp-0001t8-Gx
 for qemu-arm@nongnu.org; Wed, 22 Sep 2021 08:45:26 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u15so6403786wru.6
 for <qemu-arm@nongnu.org>; Wed, 22 Sep 2021 05:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MipNfkz7Nf1NrUuqmrUvxfk/BhvFLDdy9e8n769BM4s=;
 b=jAykGCXOXSZlzrxIWWA/UYwi8cIvmdZ2tzs5v5nFSQdSuITubhPJnilD2E1flp22Z8
 q352j2MyOHhnJKAdrLYsXQ+QFLzf/RZi5MbWiOaTBxZN5If97Ko+N9gPEt1Z59x9ycrm
 s/h5Igt9aCYUQk/leL8mfycAR4C4B9Aedo165DAFoQyZvYOGEejNUkFjMx4q4Ej29zp3
 n0UFGb0QvhM9Had01SamW/I3tq7TjUZlAWDS1puD/c0BgCUw61eJzclFBGGrsW1Hjm2c
 2jfmwwgi/bZv1Vfp5uCuuqeXrd1ALbZPUxLKKub3ty97BEi/gw/mkXSOYDx5RceUWqTH
 tXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MipNfkz7Nf1NrUuqmrUvxfk/BhvFLDdy9e8n769BM4s=;
 b=sFkksjcYdebIuB2jIXXS0vnx+PqghMmjDPcJxoMCb+UaM9EAKD+3K2DxRPNR10VqtL
 yY7K6MOsqZ4xhyVweqBYejG8I0E490N/oUyg9pIj+mPniMybYWOth8kjc9zxTYsLGFty
 yHiNDBlHVqJbzlu6zx/AGV35coycXU8fmAUy+vDFGEECTv9uU5u1thELcQ2fuvUcr/oX
 tHZ93Ud0ZzNu06iHVn95ZqvBol/R9mDRuCnWJOPoJAUXnmmiFn1xfBgG7dqqesbCe1Uj
 jmTe6InhQi37MlF4Qr1F9IGu4cvhMCx1w9pVm41oTUImILV6IMyCE+rFGPA4M8MydT8Z
 k9qA==
X-Gm-Message-State: AOAM533JjHFts9BYlH9kkjNfjbXRvSU0RXGIngFmYvRJ5QM5w57NPsru
 axVwBMp6CJjxcOVRSn8dEByO5Yp75E0q0furZjq4+A==
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr10366151wmo.21.1632314719411; 
 Wed, 22 Sep 2021 05:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-7-agraf@csgraf.de>
 <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
 <8e219cb0-8b65-faf8-f636-5c1d24471f84@csgraf.de>
 <CAFEAcA8xs3x5WCqT+FnPYip=nbQx6=UEH90Dkjq48YLboV9qAw@mail.gmail.com>
 <CAMj1kXEEN+J4k_Kib8gRHcy8v1vVRwk7c847yT_Kuv+jnLf9ww@mail.gmail.com>
 <CAFEAcA8yd6m-S90Uq1G=HTYFAerp6cZdJk9B=CFrHMn5tEMZ5w@mail.gmail.com>
 <CAMj1kXGXbjrG4XanWr=-H=f5wsUk6YVu-oTA9A_np3F8ELNcxw@mail.gmail.com>
In-Reply-To: <CAMj1kXGXbjrG4XanWr=-H=f5wsUk6YVu-oTA9A_np3F8ELNcxw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Sep 2021 13:44:27 +0100
Message-ID: <CAFEAcA_fxW0yKwxqBuDi8+ux-jtVKeJxNhDV1=ROb+VamLiZRQ@mail.gmail.com>
Subject: Re: [PATCH v11 06/10] hvf: arm: Implement -cpu host
To: Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fz07AXKKhrg6

On Wed, 22 Sept 2021 at 12:41, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 16 Sept 2021 at 18:17, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 16 Sept 2021 at 17:05, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > I'd argue that compliance with the architecture means that the
> > > software should not clear RES1 bits
> >
> > Architecturally, RES1 means that "software
> >  * Must not rely on the bit reading as 1.
> >  * Must use an SBOP policy to write to the bit."
> > (SBOP=="should be 1 or preserved", ie you can preserve the existing value,
> > as in "read register, change some bits, write back", or you can write a 1.)
> >
>
> OVMF preserves the bit, and does not reason or care about its value.
> So in this sense, it is compliant.

Hmm. Alex, can you give more details about what fails here ?

> > > but I don't think we can blame it
> > > for not touching bits that were in in invalid state upon entry.
> >
> > SCTLR_EL1.SPAN == 0 is perfectly valid for a CPU that supports the
> > PAN feature. It's just not the value OVMF wants, so OVMF should
> > be setting it to what it does want. Also, as the first thing to
> > run after reset (ie firmware) OVMF absolutely is responsible for
> > dealing with system registers which have UNKNOWN values out of
> > reset.
> >
>
> Fair enough. But I'd still suggest fixing this at both ends.

Yes, the version of this code that we committed sets SPAN to 1.
(This argument is mostly about what the comment justifying that
value should say :-))

-- PMM
