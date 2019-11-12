Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp2598445wrr;
        Tue, 12 Nov 2019 03:57:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqx0atxZ/ZHKB6QoY0sIWY8r9aUbiiYRbDaLOVd25xUqOeQq41HTIhG/+9VU8B42URz9W2VJ
X-Received: by 2002:a17:906:d71:: with SMTP id s17mr21132587ejh.312.1573559858060;
        Tue, 12 Nov 2019 03:57:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573559858; cv=none;
        d=google.com; s=arc-20160816;
        b=grk5q0i+RyyPUmCEcdodUwfcXCTypDQe57c5849sjZjPZSnkWFbJnJaQlflqi9NifL
         4sVcxZHXb9I3oUb9SFMVIaZXHJGtErGvJLVrqeDxe8LwlzKZcoYazQLqTzfPT/fbCJ+o
         Ta9nNN6GKT3RC9JCyS3bAnKk5T7xJH8hzaqCEyb9R2IoLisyyTT8eHMeLu+z+zDV2PUt
         ytZMF3gDo59WvNftcs+TrOETLy3mgY/QadJy3cEwzUwNoj3SoOBzClwxKx0Y5/lx/xe9
         GF6P7LyAHrgLdMLDGlM6o4KxrBWT/EvjOqQp2BCSyE0VjZWSdiVkzsm/dKmoV3gWDn45
         FWTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mHpwGMoPzVkjMtJKGRfojVDKC+X1kuu8azyLDSIFOE4=;
        b=WbDzpfTXoC6Spmx/EGZt+OX6gVG1chd9vc62zeAQgnvPHGi2pZvBUicMvK//ULfsee
         bmdRo8hMnAjz/MFfUlrEWZgZkTWfuJd7JDDQMjE3QOGLmM4mIRDe/DY88OYngatpE+O0
         vkIgnlyLFoHXwu9fK0dttTFNTdjvgN78+k14HH7V155MjPfFIAp9v/KBIa5w67k9sC3Y
         ZwwQiA8O3NUvZY+lHZlYMNZqslQzP+ktJpvYK9eR9joDGW9coswe7OfGbUNPCVk/qKCR
         gUAp2Nkamzp3vPAKCg9xKp+YBjShWWxsCkYLJJ5djxG+06Xfn7K+fhG7jMlNX9z756YC
         w3cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pqkQGZ6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si11133163eju.409.2019.11.12.03.57.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2019 03:57:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pqkQGZ6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUUng-0004br-PV
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 06:57:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38787)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iUUnX-0004ZV-Ro
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 06:57:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iUUnW-0000hr-H5
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 06:57:27 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39165)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iUUnV-0000hd-Sz
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 06:57:26 -0500
Received: by mail-ot1-x341.google.com with SMTP id z9so897285otq.6
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2019 03:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mHpwGMoPzVkjMtJKGRfojVDKC+X1kuu8azyLDSIFOE4=;
 b=pqkQGZ6STXIyXNO4PMpO1Yen/Pj4jbOobXe9Pewp56aTepFfn964MHsmDQCZAN5uhq
 R8PU4Xjs1cKsQGQdrT3PcNJdxL+gcs+psvSXjRtR9vsIk78uozNerRKc+rDnegADqX+s
 3UHPthspSxA0Tkah9vqod3p6lF09oycDAQgdoP9pCe5nZm2+SVen6HDiSEYNd7tlDEVM
 GH+ddjvWFSvkOtomPc5gpV7ZZI7c/2fNeLnb9007YUIw3HJwwviECrvWowzI6mlmCSW6
 5nHNy2pddcqZ8Zd8YY5V1d/wX09sjI9TYmR41N1Xm7IRPkMKf+OE9gbMkkRInoSnhIGf
 MsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mHpwGMoPzVkjMtJKGRfojVDKC+X1kuu8azyLDSIFOE4=;
 b=jfi9cWoG4ADOhfSYS7P45r3Wf1Mbtrh3D/VIoZ8iq2V1cu4HkOda1Rl/LJbtVeytuX
 293qcuFwQqnBaNNtvs1MTCJQnfJrTLrZMqfdQyRqx0YH8/m46vDmWFe8J6dW+PlSRXAL
 WW4bCh12o+2d7NjuhyH109iFNwDA6AM1YFjG5vLq9deQ5hCR97RwPiJ2oU/rOIscdGpG
 ON1zQZuMRmfZ9bOsN7lWHhwpaD42pX3k2gdV0hliyyu41at9nZkn93yHtCfdW3jBIdAc
 GK1Hp5gyRwoaLd9u1BFLzwgmv7VByuYiDy0i312MP8GOc46qsLVSwAC6eQ6Rvy4HWSH0
 WEWA==
X-Gm-Message-State: APjAAAXhrDC3rMtCXYSjxwtGkwSz849IQIcYjaBua+Wz4q1F7sWW0auh
 JSWdUA9ODljGrzJKcpgpwPBYoEEaI9tmWMLwYXTodg==
X-Received: by 2002:a9d:7ac2:: with SMTP id m2mr15265137otn.135.1573559844701; 
 Tue, 12 Nov 2019 03:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20191104115228.30745-1-graf@amazon.com>
 <CAFEAcA8zkR_MZ-28Nc=x4j05U9MsFYfzQtkHxTf65ZwacK020w@mail.gmail.com>
 <246a7cd4-7c39-c92e-05c3-1045bca2c114@amazon.com>
In-Reply-To: <246a7cd4-7c39-c92e-05c3-1045bca2c114@amazon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Nov 2019 11:57:13 +0000
Message-ID: <CAFEAcA_kwscZRqK5wTRu5WLkixGYbdV0c7mZMV6n+40DOS0-Mg@mail.gmail.com>
Subject: Re: [PATCH] pl031: Expose RTCICR as proper WC register
To: Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Hendrik Borghorst <hborghor@amazon.de>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5mFYy6EsbCYu

On Tue, 12 Nov 2019 at 07:28, Alexander Graf <graf@amazon.com> wrote:
>
> Hey Peter,
>
> On 08.11.19 17:58, Peter Maydell wrote:
> > Did you find this because you had a guest that assumed the
> > other behaviour? This bug has been in QEMU for a very long time,
> > and it seems odd for a guest to deliberately perform an action
> > (writing 0) which is documented to have no effect on the device...
>
> We found this bug by trying to find justification for the behavior in
> the spec and apparently my spec reading skills were lacking. I could not
> find the reference you cited above.
>
> So no, I did not see any guest breakage.
>
> I still think that being consistent with the actual PL031 spec is
> preferable though. If any real world guest breaks because of this, we
> can still revert this patch and document the exact breakage in the
> comment instead.

Yeah, I agree; I'm essentially just gathering material
for the commit message here. (The gold standard would be
to go find some hardware with a real pl031 and prod it
to confirm behaviour, but that's more effort than really
seems justified to me.)

thanks
-- PMM
