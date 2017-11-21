Received: by 10.223.159.82 with SMTP id f18csp598174wrg;
        Tue, 21 Nov 2017 04:08:29 -0800 (PST)
X-Received: by 10.28.35.80 with SMTP id j77mr1027788wmj.109.1511266109322;
        Tue, 21 Nov 2017 04:08:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511266109; cv=none;
        d=google.com; s=arc-20160816;
        b=c1++7hiaaQK57p1olar3zNcymZfu6TJC4TCKGq/cnCwCpGkgfYByHh+0Xjsx4Tf4aS
         BvcmwFtIqFKN8gTX83gPmvTiw3VgeA+o0BlxAFS4o1wcGRRTnA2K6wvIheea/ipvUOY6
         Wq0dMfATO4Nw+x+8No0qu3R4ZOgcfj8LKOFHf4l+ijTeAN32T61ezdTaUtuRy4uuNqdU
         HL2URWz8Qb+vAgySwa54WoBMTUBb2na/KoI0eYeuEbaUMJOZAtSuTC1rRSlhYC5EeEwN
         sgdSaNDvXnD5CLTMd9UYlgOoe0SyLBP2btg3GH4eyJ6rNV6D+7VTq31+4XySzUSqy+ra
         HkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=cFYkcd5JsR/sPKFHRLgaq7vfIKncg095I256KGOpY3s=;
        b=IhikptB7QEMP5GjUMEm81+PVjZYnrv3yCHd3gIQc49Jm9c4XrQKrqCga1zuj8Kz6am
         z1eSEgn2IdbLHKsVhUfmq71VSKcrOlxI6TvJqefP2QNV3Yryw+o1IKOrwtmdAqAWODEK
         pM74K3BsRB7XIwqreiJ+k8x5xasA3hBi8g5VRLSdMx89Ifd1urUHyt4NC28nzz4R/GmJ
         Kppj843S/2nhKHHfgV9Nz1TomWZ3mFzq6xYHu0ZbrIg4tQLPvvhhFnoihCI1OCrtPpRX
         9zei9+KophIPXzzJ1dWRzwdnHkCcp0yCHJiVsKfvO4ONwqjFzTTuqbRba0jJTt3WveKI
         F3qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=De3uOMyl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 1sor263320wmu.34.2017.11.21.04.08.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Nov 2017 04:08:29 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=De3uOMyl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cFYkcd5JsR/sPKFHRLgaq7vfIKncg095I256KGOpY3s=;
        b=De3uOMyliFF6XsosBlCS5yv3ZnaznFujldeJurN3rXJjlVkW9t1OAZUhIC9xmAzaAk
         Ib50oHUzzkQ/VxGUnD4t2kstsgpuzLT3tnIRpv0TYhjNTxnH6gvJM2vzhFQHcYOqLHKG
         i5/ts38KfAVKD1IV0RBErlESImNl1/c+gAy2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cFYkcd5JsR/sPKFHRLgaq7vfIKncg095I256KGOpY3s=;
        b=oZj81LJIDG+2HU3eaPtxJ9qSxiRz3rUdzHClyB/o/p2ir/jddNsm7xkRmSOL7oK5TD
         z8QeaSjsQeJPqaC4GZq8pDcUpw5llOVCjZZavh+YbQ8jOxT/XBvh8V5OhkAXQgwts13p
         ssrdkH+IpuA1Ej29B6S9I/rp9LNtoxOAMYKgquOuOOaxYXIMTl5Yv7w31aOTxAV5bbIJ
         fsD52tPsx0U/oyozh6NZALeYaIyXHoZzuhbG+hGuBFaZFITUyjlHv7PziCIhk9y2ehGd
         rerouVhiInHrvVe1ZJpwhLfKx0IzlBTeSQZvlPcHJjrOYzuaoW8nUDogdfqpnOAqQCNV
         kOCQ==
X-Gm-Message-State: AJaThX7gewYfGsxdJZ17oASkMSshYOdcaaHNZ4QDph557cY588rvme4O
	NOO/Ewt1jTey5RX9bGr9YSmNRogPnHProLlrLoPXTT3F0Do=
X-Google-Smtp-Source: AGs4zMZ6CbIo/a6VZffBGdB+HzwXSL+ttFZH3X1ALCZIYgRg0vfb9/58ukw8E7p5VApHHl5npZjdxEMDaCmMjdAIjQ8=
X-Received: by 10.28.112.22 with SMTP id l22mr1088163wmc.35.1511266108804;
 Tue, 21 Nov 2017 04:08:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.187.195 with HTTP; Tue, 21 Nov 2017 04:08:08 -0800 (PST)
In-Reply-To: <20171031145444.13766-1-alex.bennee@linaro.org>
References: <20171031145444.13766-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 12:08:08 +0000
Message-ID: <CAFEAcA9SrXVLAwoi=ZDxkCN9WOMVtQyR_jEkn9b3qn-yb9=dKQ@mail.gmail.com>
Subject: Re: [RISU PATCH 0/7] Add @Group support and some aarch64.risu cleanups
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: AUOsuZI0MvZY

On 31 October 2017 at 14:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Hi Peter,
>
> My RISU patch queue was running a little long so I thought I should
> push up stuff that was ready. The first few patches are simply
> clean-ups to the aarch64.risu file, mostly removing duplicate blocks
> that have crept in.
>
> There is a prerequisite clean-up patch which moves the filtering into
> the common risugen code and passes an array of keys to the backend.
>
> Then I add support for @GroupName annotations which allow for a nicer
> selection of groups of instructions. This works across all
> architectures now.
>
> Finally a big (but mechanical) update of the aarch64.risu file. I've
> aligned the names of the major groups to what the ASL/ARM ARM uses and
> added some example @Groups for the gross sections. I expect to add
> more fine-grained groups later as we add the new half-precision and
> SVE instructions.
>
> Alex Benn=C3=A9e (7):
>   aarch64.risu: document naming conventions
>   aarch64.risu: remove duplicate AdvSIMD Scalar 3 same block
>   aarch64.risu: remove duplicate AdvSIMD scalar 2 reg misc block
>   aarch64.risu: update AdvancedSIMD across lanes
>   risugen/risugen_$arch: factor out instruction selection
>   risugen: support @GroupName in risu files
>   aarch64.risu: clean-up and annotate with groups

I've pushed patches 1-5 to risu master, and provided comments
on patch 6. I'm going to just assume 7 is ok.

thanks
-- PMM
