Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5873352wro;
        Tue, 30 Oct 2018 10:31:29 -0700 (PDT)
X-Received: by 2002:aca:c509:: with SMTP id v9-v6mr10790154oif.48.1540920689217;
        Tue, 30 Oct 2018 10:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540920689; cv=none;
        d=google.com; s=arc-20160816;
        b=BFrmlaLIU1JJv+2jFXv1GjAX9xZVcMLd47Y2ZWfkk+rxTafrH9jggYZqgaaxuso8QC
         PYx9SCrQqdfix7MDYjMommDVqKvuL/b/Z/Kvho2eh/gpPPBeGIKZMzuBqYHgamwdKr3N
         sR3sOTgagbOQV1Cz1+GUjG9XtdR7Cm4ZyIGDFltEIyuJtNU3y5ffsekSOD82ISBalYjr
         pEdd/VFLZ8oy5KglX0bIEkCp/JDTs8vvdAnQyj/BrGf5HsY4In/tIyEgxHIqihLMD8Th
         IP0dtxnix21x9jySW0/GXKjErs8N3637aIcnlOIqEJhqXxyqzTWmQq2mFC3ZtFWDw866
         OfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=mNufS7vs4ADt5Fr1RqM+RnfZ06HLxwtX1wfG3CjIseE=;
        b=dm4X99HwxoAwjS/0nIlfHCUw7gVOweZIZIpw3oWe43EkQNI4Ducp8jgHV08S7nheL0
         iJ03lxoHzLljbXci51sJGLhtRlGLIX6Jt0bejQZKHsM6YEbsoXXnjatLRfZa+Jp4ACUB
         4VK26yra3rrF4dqT6pa0fZjNPV1GsnqCSfdF7q5cHmazfPqvXMXjjLXn1jdNlCQs7s/p
         f+VHWqjHsvi9A0vavahHP2mdCN75jO50VfQfWwZMEGyKGrYUCoWHUAfhmdbbh/d6cWu4
         a63Gdmy/POE16idbH/ot1zz9z2QhK3R4cDny/9GWKc+V3FtPAWHBsmTXmvPJ4y/t0Uvy
         KxgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TB36Rkbc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k109sor12252564otc.25.2018.10.30.10.31.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 Oct 2018 10:31:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TB36Rkbc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mNufS7vs4ADt5Fr1RqM+RnfZ06HLxwtX1wfG3CjIseE=;
        b=TB36RkbcAWC/z7qupksi1/XDxq5r/k9xqwaDncouk55xhHEs35rKzrIugvBoVAUN/E
         jvTB5kJYDFR7l6e1zvmefPV3xzjmTWrNa+T17pu2NaKAOk/TK7yx+bCn1cfZvK96CJUg
         3o0LmGDioXyrmrVOgqhqO8sbZq3VSSd1xuzZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mNufS7vs4ADt5Fr1RqM+RnfZ06HLxwtX1wfG3CjIseE=;
        b=U2FOnJVquCD7h+28G55r2lEA/WzK2jsLk82vijZ33JH6tu6YzWusrR2n7yqug7lvCG
         FAXGr7rpWt+OEEyj36Xdv/f1Ud2nju+dpW16aL8bTgBnH7rtFgS1yv8Lgl+The/DsyUL
         R2IzetyUf3ktEtxDsskQGszqdE6HqMFQ0ZYNsBeO10GROpkH4JSOK8tvHwoZWhwVZGFo
         AG5apKzX3tZOoHNi03kZTlSKE/YIxHfh1gDcABb9+VzxYYU+gRqC255+1CpBf4pDCwYB
         sXpv2CIHPogASkw4tnvMW14Yghnb08HzTHzy9eIq+l4+xtF+2Q8O+7j9HdUr9tpCqSbb
         05tA==
X-Gm-Message-State: AGRZ1gImWOnp3O+0TYANnfUOp2rU+FQT6Hs9gDe7rJyqHN1udrUjfSvB
	QE82qt5zDZYCYrkYAJPqzz7O91GBbAE+tpUn0QewfzkH
X-Google-Smtp-Source: AJdET5eS+PaFl/QpGIon5wOLunwhSLOomjfR9pwdGc8BbnaP8XYe+8zIcR1lUJR9UzaLV4pnMQqxjJwmDZberxHjWuo=
X-Received: by 2002:a9d:64d1:: with SMTP id n17mr10794725otl.151.1540920688693;
 Tue, 30 Oct 2018 10:31:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 30 Oct 2018 10:31:08
 -0700 (PDT)
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Oct 2018 17:31:08 +0000
Message-ID: <CAFEAcA9wOKFxRQDqaxtz5krfskGnxrDjTApE8BZxDH--0bWLew@mail.gmail.com>
Subject: Re: [PULL v2 00/20] Qemu trivial for 3.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Cleber Rosa <crosa@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Max Reitz <mreitz@redhat.com>, Fam Zheng <famz@redhat.com>, 
	Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	Qemu-block <qemu-block@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>, 
	"open list:X86" <xen-devel@lists.xenproject.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Riku Voipio <riku.voipio@iki.fi>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <lvivier@redhat.com>, Michael Walle <michael@walle.cc>, 
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: bSh4BrP5ZqKt

On 30 October 2018 at 11:23, Laurent Vivier <laurent@vivier.eu> wrote:
> The following changes since commit 808ebd66e467f77c0d1f8c6346235f81e9c99c=
f2:
>
>   Merge remote-tracking branch 'remotes/riscv/tags/riscv-for-master-3.1-s=
f0' into staging (2018-10-25 17:41:03 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/qemu-trivial-for-3.1-pull-request
>
> for you to fetch changes up to 7b2b797cf0addac789ba858fdbd95c55128d72d5:
>
>   milkymist-minimac2: Use qemu_log_mask(GUEST_ERROR) instead of error_rep=
ort (2018-10-30 09:13:31 +0100)
>
> ----------------------------------------------------------------
> QEMU trivial patches collected between June and October 2018
> (Thank you to Thomas Huth)
>
> v2: fix 32bit build with updated patch (v3) from Philippe Mathieu-Daud=C3=
=A9
>     built in a 32bit debian sid chroot
>

Applied, thanks.

-- PMM
