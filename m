Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2601938wrg;
        Mon, 13 May 2019 02:52:17 -0700 (PDT)
X-Received: by 2002:aca:e8c5:: with SMTP id f188mr12322626oih.132.1557741137677;
        Mon, 13 May 2019 02:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557741137; cv=none;
        d=google.com; s=arc-20160816;
        b=nYovJwSJLpJb2TKckR22IKFevB5FycSlHQkqnOAH45ynE8/uIIJf+hoIjiWZzraUxO
         SaseCbRBaM9Heaf4EA49vPDlR59h3Ix7dOcu7FKUzABZYEcUWuh39HdKosLyYqZ3vzBM
         wk4Wx8XpXMhGirAEzzfN/e26IALgaOoS0sXFEIikqwSEE719bPBw/2bQ6LoNxXbEq7J9
         RfhIG+As/+THp77T61ZskE9z20lUJFF3qg7glvZd0l2QzsNIATTNgoaTj4noNzEmJp0u
         UIxtFqqk9S/nsSvPgRIZ1PCQfKY/tjXukIyPHxIEWxZ4PQy54C0/oSPXZFfNXwGjD+DT
         83og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PYvG6NjDQGH3CIQ0F+yQtd6Ko0eXE8yTWncx9BJJ49I=;
        b=aGphdk7d17HLyhb9oP2jdNWUJcvlmddsAXEgBpAqyyHAztWpAq3NENlT5dOTibosoN
         qZAmKOvBJL9e6p0sQLd8p69YPRW/FdXYsok6txGTg37PEy3azHUb0ngDWcLe5kF2uvQA
         UkN7W5GtWTmXxNjJ4kDAbYcx2cJlAXwnYpFlYOfw3EuSZIXHOEqUpsaJpF5bci9WVXd6
         nGzAqacsBrxrRCbNO0MDT4UspSu7L7hPRwiof9sePQFc/AYg8mBkdIj2vCPIh0QPs2VL
         AM7aF1RnYMJcLbt2rGdXU/VAqCW4QuE5bsZrH+tuWG9sL5PqiAS3OsayMKPV2CBRK95v
         D/Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CMMcrm/A";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i186sor5497487oih.32.2019.05.13.02.52.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 May 2019 02:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CMMcrm/A";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PYvG6NjDQGH3CIQ0F+yQtd6Ko0eXE8yTWncx9BJJ49I=;
        b=CMMcrm/A8vdWYtGmanPD8GeVL74Mrtfem9uLPz2QNHON5ldw08ReuLpK1zD8nQsn6r
         hfClK/h1hMdbJNxCZqZizBnjnXbBy/0dQW3RyR3rFgbmwgkONGz39YVbynhbEE1TRJgF
         ziJeNdHWFhmmScC19FBIhLmUBeYkVjPhUCr/2laZ7CMcAHpIKtgO66gsvyw+gWBL+hma
         96Kj3/VBPtsmn4gCbkl/AYqU3kTNDDE5nWjclsbeC3kh3h+C/pGu1IAgW/+7+QUCq5mb
         WAKZeB2VfOUEZDxwLbWO56EfTiQn8MUxOAbFmZOMTXYK4/SBX7p9v+leayehvgXgAiMS
         sDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PYvG6NjDQGH3CIQ0F+yQtd6Ko0eXE8yTWncx9BJJ49I=;
        b=Dut5/GzTMegAXWOFf0273naV2G7EStGWYEOa+v9w7HbNVShSedHPsF8+WXPWF+OnXw
         ANsitHCj7tnE3/5XZHkGHLScDP0EXYXUgTxhouPhTt4RiRUVVU6FkJL/U/Mw9f9Vz3KI
         rVUVYb4ugsjaCg27AtdDXJY4icTowIqLyOSNCvW0Z50VP4GREFJZrYDm5LNPFqtBNktw
         buss2HHsTQCOyigSB/0/1+L3Ap/a4VVkXulvISFB+jvvni+MTVKzk8P1NM15iY4sL7BH
         MRGuLznEWW8+Q6ZyCFY4Ziq5A0IqKiDOoWKrg9J/zZKuUX0xFr4AATpfX0qTwBa+BWhr
         BlkQ==
X-Gm-Message-State: APjAAAWwBViQcwuEIzU6g2ktONU7FlAyCtORLu6cbi886ySkDpMTzArd
	4YeL5MdYD3AEwBDeP4/YQZ3IGKwPuFDAQlz70NLqGAPa
X-Google-Smtp-Source: APXvYqzyhkhEJnU7/HDVMAM217XpSdW0vYjlzq8vaJPV+PyQAnCmN+UZgweYJKgygbvpKJ2PQcdeIcTRO+sQ71mjyZY=
X-Received: by 2002:aca:845:: with SMTP id 66mr3172404oii.163.1557741137334;
 Mon, 13 May 2019 02:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190512083624.8916-1-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 May 2019 10:52:06 +0100
Message-ID: <CAFEAcA8vY7WVws3rOqKxsaNTDSboecOeS4DM5rdsEZHt4Lkv-A@mail.gmail.com>
Subject: Re: [PATCH 00/13] target/arm/kvm: enable SVE in guests
To: Andrew Jones <drjones@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Dave P Martin <Dave.Martin@arm.com>, Andrea Bolognani <abologna@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 28r4F0CPfMb4

On Sun, 12 May 2019 at 09:36, Andrew Jones <drjones@redhat.com> wrote:
>
> With the recent KVM guest SVE support pull request [1] KVM will be
> ready for guests with SVE. This series provides the QEMU bits for
> that enablement. The series starts with the bits needed for the KVM
> SVE ioctls. Then it enables the arm 'max'cpu type, which with TCG
> already supports SVE, to also support SVE when using KVM. Next
> a new QMP query is added that allows users to ask which vector
> lengths are supported by the host, allowing them to select a valid
> set of vectors for the guest. In order to select those vectors a
> new property 'sve-vls-map' is added to the 'max' cpu type, and then
> also to the 'host' cpu type. The table below shows the resulting user
> interfaces.
>
>    CPU type | accel | sve-max-vq | sve-vls-map
>    -------------------------------------------
>  1)     max | tcg   |  $MAX_VQ   |  $VLS_MAP
>  2)     max | kvm   |  $MAX_VQ   |  $VLS_MAP
>  3)    host | kvm   |  N/A       |  $VLS_MAP
>
> Where for (1) $MAX_VQ sets the maximum vq and smaller vqs are
> all supported when $VLS_MAP is zero, or when the vqs are selected
> in $VLS_MAP.
>
> (2) is the same as (1) except KVM has the final say on what
> vqs are valid.
>
> (3) doesn't accept sve-max-vq because a guest that uses this
> property without sve-vls-map cannot be safely migrated.

Is this "migrated between two hosts with the same host CPU
type but with different kernel versions which expose different
subsets of the host's permitted vector lengths" ?

thanks
-- PMM
