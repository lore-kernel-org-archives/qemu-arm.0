Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6929262wrg;
        Thu, 13 Jun 2019 08:18:03 -0700 (PDT)
X-Received: by 2002:aca:5e57:: with SMTP id s84mr3375621oib.139.1560439083308;
        Thu, 13 Jun 2019 08:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560439083; cv=none;
        d=google.com; s=arc-20160816;
        b=pwOp+0hhH76TylPJb91LNWYwMNeYuoIZ8hDQl+4I6YOd1CyvVGbbZ1onN/yMf0Cj4c
         GohtUpddgSFi6uSU8PsxxDzsabeIDkll/Bm9jxB79pPGp2u4jbadoSdpIbjtWrMagfu5
         vcnNqWsptC4ehkwLIQibbZxpwoSFdcvvE/LDDjwWv6hx1OLGsW8uVZEsbUAh6qRuCAgA
         71pvs7ykJadF/W1Tv/9r2Hmeb2TC1Nbg8ywmqG/NcLq/NIEh88xEsTzT415g07+arne9
         /MQPVkwZu5YGpweT7h/pi/tEsfZilACavk8oTWtF6/pz6Ivd8OPyro77fOMvNPtEF2l0
         COlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V7w64XM/BEYAFL0wXyQNKxfl3dGfHZAdo/1xVpepP6Q=;
        b=ra61R082JIyiuQyg+xJeOmufAlav0aMFwc2N3M8uX2ac4ILvC+Qblda9TAjzJyG3rt
         W7IGT6bayMWJGTdNjM+bDJRCV92CewqPBDZmrQLPTSzywH3UuTHWldszZ29T8OUuaaYK
         iQpBpcZNXs95wIhER1Y+8GKw5ODG1/kZoyi6yD1wWUloyfqNMHWKH/rJgLn7g/Y/e28B
         F2HbRGsJVXyCxbrC06ntvkfEPNAZKLcw1nbcUsEKSrgfxZKa0P1jrBLzLu4uVilPUgbG
         4+PmOJk2LkHSyaCjpyfMgmYSq3UWCFOeI4i9ItbO3pmGxym7iDsZLFky5Ugi/QelNUHr
         OvZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sffk12yk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j99sor92836otj.124.2019.06.13.08.18.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 13 Jun 2019 08:18:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sffk12yk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=V7w64XM/BEYAFL0wXyQNKxfl3dGfHZAdo/1xVpepP6Q=;
        b=Sffk12ykJhDp+PRZHpKz9qkSSoAplpn3PrFba0IzN+ayfDEZUJyeOU296iXP/cRi6a
         5QR2Zj2SJFbyTnsPqRMUO980ciA7UgUOy3KUc72vZ0HQs2Nb7enS8ylisS5vluph+tnx
         Qr9elVobHEFn1ag8LDOKaRLh0ODa6RLAmuXKu0N9aKrTX6uBpFFrsXsxqOer8lFgBWcs
         Yc2CoRfhHCh0ePoiZv+q3I7VRp7hf3/ebKU5zlZL/quWlzyt1+4yG6rluWMGrAZ/w1tN
         YO5yB6xkabo+LmAV1Sr/nGxAmLsVuyPuwR3ZEyfMtOd6KsuXCG1zgEEjnJp8pXFtEkdp
         izLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V7w64XM/BEYAFL0wXyQNKxfl3dGfHZAdo/1xVpepP6Q=;
        b=lilU/V7Tp48f+19yYFrCvMpJ1TCrHDTFupJO1Kmq+WDOlAU6pGmsW0m4fJKAEv/dM/
         hxjPRQTYg0eNcPLl3OYIpenOtbSd6EotWTefARo0N++Gcro71f1dWzbzhIY1YqW3YaoA
         3oN+2tLTm/BBIll8o3AXT4tuECPZSvED4DSOqfBruix44HNTvGCEjyx+/D420pdg7ZlN
         t+EbF9AJtHC1luEJipEx+O1nOsG/rIJNfJ7XyHOR9THQmYEL1yUV+K18oIpPv6EAERoz
         bgn76de0Y8laNYgvK/IXzQg5xjK6w5d6f753sjT3kJZd0jQAL8DrC+QPKIDK2Jn0tncN
         K00A==
X-Gm-Message-State: APjAAAWGmRDXxUx5IOUJTzAqZCXF0yjogBkGLXqSWvRUdtCEAPQRWzoJ
	EkYX93zr8Flzxoc1X6BDQqMuYuHru2ZReVi5IKztmQZubzrlrw==
X-Google-Smtp-Source: APXvYqyfMqAl0/ojMkuVCmQQHKYjKRX/z6EI0IPWaO49Dm1RAkJDMXMoUvOlW7p3Gz0/G8BGeVQ4Wvx/JPTCyjmFn94=
X-Received: by 2002:a9d:630a:: with SMTP id q10mr8757585otk.91.1560439082756;
 Thu, 13 Jun 2019 08:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190517174046.11146-1-peter.maydell@linaro.org>
 <20190517174046.11146-5-peter.maydell@linaro.org> <875zp9ehah.fsf@zen.linaroharston>
In-Reply-To: <875zp9ehah.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jun 2019 16:17:50 +0100
Message-ID: <CAFEAcA8aWdAyWpaP2RiuBJds45HqWph8Dkn3Q7HPgrpokEtxYw@mail.gmail.com>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 4/4] hw/arm: Correctly disable
 FPU/DSP for some ARMSSE-based boards
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: JgqHY+mlOwg4

On Thu, 13 Jun 2019 at 16:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Given the ever growing configurable nature of the v7m platform what do we=
 do
> to ensure the various combinations are tested on instantiating qemu? Or i=
s
> this a case of relying on the wider community to shout if users actually
> find a combination that breaks? I guess fuzz testing would be a bit of a
> sledgehammer approach.

It's not really all that much more configurable than the A-profile
cores; I've just been a bit more careful to actually make our
emulation reflect what the hardware actually does... a really
careful testing of the A profile cores would want to test
the various different cortex-* CPUs individually to make
sure they UNDEFfed on the features they didn't have, and so on.

thanks
-- PMM
