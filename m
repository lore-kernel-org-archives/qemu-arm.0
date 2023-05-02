Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2061986ejm;
        Tue, 2 May 2023 02:55:24 -0700 (PDT)
X-Received: by 2002:a17:907:360b:b0:959:c6cb:9fc8 with SMTP id bk11-20020a170907360b00b00959c6cb9fc8mr16707613ejc.29.1683021324440;
        Tue, 02 May 2023 02:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683021324; cv=none;
        d=google.com; s=arc-20160816;
        b=SZE+ab85S32Bt+IvdaGkeD7kla6SsxpEyL4MtxuHPhIopQ4Fzl+C9LaOGlWwxjuirJ
         dhzfMxLvrX5ktIb8PKC1pfnaSzWhCzYPOJl4BDNDC5Zgz37R6rnjM5v7Su1dB7XhHKAI
         v67nwKXLReixFpJBo7liWkSKn6UyMO2kwz2TPAzsa0m+hCeBQA4HG75GVCPtcbmZ/r9v
         pyZwSFWU/CsWBnNt5zFQGnUkLgBEUnW5WYlNCXG2wXo1bStm27L4sU+zEM+WKQ9fxE3w
         Dvjmo+XIEKnE6OmDvwcu4SXxow103xtmMrLdLA6yziGRQplA/oLFmIy9suE53MbQqKtO
         rDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Tt4/gwWIWNEU5OhxPl9ay/wAaV+k05WcoQgOscbm9ZQ=;
        b=VrdjrNiuPNtuTUMvDfJfs3S2tlXx6aFm/XR84EzWG8Z7oa/8A/JDFdJSr5JdMyLOGo
         0NF5i5YwRSrbLUPkvdfMKlbZjPYvYrdXmCymmYub7Mgwj9on1IrK1xPf1YtLxuFVA8J5
         RrCeDJ0+EMZQ7Jl21lUhr4VXwr7SznifqPL7L4tAf1lbuWGe0ZtpUiww6156njqbZjYe
         Krsi2JYBl3CSRAGuwLflR4lPs1+JIpOgvvpn0ziQuG6e75wJaePjBos+QW/YMrAxBP+W
         8uG4O35nNA76VRg3HBfDhzczbjDCv4weVGFG5e4TzFI1v3Wgk8FBPgyrrMutSSA0n5vN
         s1PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a9TQ+Ll4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e21-20020a1709067e1500b0094f964a2027sor1333808ejr.1.2023.05.02.02.55.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 May 2023 02:55:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a9TQ+Ll4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683021324; x=1685613324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tt4/gwWIWNEU5OhxPl9ay/wAaV+k05WcoQgOscbm9ZQ=;
        b=a9TQ+Ll4y6dyU5r9vECZQImdkfZu/Xau+wMsAD+muPzdL1DeId263J2916hml6zQxr
         uNIs4pYjFUaGzqw1UKv+H87/gHQaUCh5MtXgv9xQVO15j2GQdvxiX+lqgVh2MesC8TyH
         PFW7riHI8rxYXY7Zwuc9A4hml1LxYL1K/W0LYBHMO7bpgYSvQEchZyY+UPnb2O19/yhX
         ByUeUp00wTdsq5Hqs4F0luR6XJufth1mD77fuz6+VkhS9wwln3nFxrIeBbjYwWT56te+
         9eTSo/W1dlmOTlYweCB8Ky+MIuOsiYjCR6IC+r+Sn0VouGrdl7hSZLY+28XAA35Te8hg
         AJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683021324; x=1685613324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tt4/gwWIWNEU5OhxPl9ay/wAaV+k05WcoQgOscbm9ZQ=;
        b=dBxA9Yep8mOwXyM382q3hWiR92jUybG9rjXrpv94BGyJRyF8/xIhekeed7BmKew7mG
         IQB/5OIbD7Ojv+At5Um4ywOK1U6VgfrxWfjAM3LT/NRTjokAaYD1T2jCywInb38IWHA/
         ZxBj82fHHF2jQii0HgkcaYuIRZfUtBtRh/RA0ybuvUEXzFtHbEoQgLR5xm04r/fvKA6F
         UcXiQ84hpV8r+FCWt9dIM05sKj8ADkrIoEx0KZEQa2IIIR8cqC9UxYamEArG1bI1HMUt
         MBG+QkPQMmq9Ohv8KMCnMV5LKBp9xifaqYNPRj5TfHBwN0YultGEIXmQgqOTRYqpuxmE
         mwRQ==
X-Gm-Message-State: AC+VfDzPqUZoFb3Sj3DiphA0oiGEMxHD3nf0L1WAoM51Mv1GXcotrhjE
	Y9NE1h9dRRr/A9Mbc2Nf8hBwYN3URZe32hI3GfpiW12zEQuF0xshVS0=
X-Google-Smtp-Source: ACHHUZ4SY9dv217fSJgwVVosRceib3a8ROm/DSLsVo0E6PXHWZi6lWZ4lKrnHqU7XyWC2t6Ua+cqZVI4J/7EPrXKPt8=
X-Received: by 2002:aa7:d511:0:b0:506:a1c8:2bc5 with SMTP id
 y17-20020aa7d511000000b00506a1c82bc5mr7430948edq.15.1683021324064; Tue, 02
 May 2023 02:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230426180013.14814-1-farosas@suse.de>
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 10:55:13 +0100
Message-ID: <CAFEAcA_ZVpZzuvZ71NzgweRC5Uti0T_fqG00paqDDe18QP-veQ@mail.gmail.com>
Subject: Re: [PATCH v11 00/13] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: PZSrOcQ0RpIX

On Wed, 26 Apr 2023 at 19:00, Fabiano Rosas <farosas@suse.de> wrote:
>
> Hi,
>
> Some minor changes:
>
> - new patch to move a test under CONFIG_TCG (broken on master);
> - new patch to document the unsupported CPU test (Philippe);
> - changed the test skip message when no KVM or TCG are present (Igor).

Applied to target-arm.next; thanks for your persistence in
working through the many versions of this patchset.

-- PMM
