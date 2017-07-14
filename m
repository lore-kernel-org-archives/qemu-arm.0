Received: by 10.25.44.15 with SMTP id s15csp993998lfs;
        Fri, 14 Jul 2017 07:21:00 -0700 (PDT)
X-Received: by 10.28.87.205 with SMTP id l196mr3161293wmb.121.1500042060587;
        Fri, 14 Jul 2017 07:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500042060; cv=none;
        d=google.com; s=arc-20160816;
        b=ygjt6n8c076u7FqvxVRNEGFdpr96SljM+FazEAjIXRspfnptP/pyBWXevjSzQC8qUv
         FCGFZqBJDEPtJrt//AO+1RHnzOpvp5rZXl6UYYIdld4jDJioQHC1Mi3yxa2AtATzvubJ
         HrsbmAt/DVVoFzm7D7kM8iHt8L4n+u+SY2+EDZKQxgwDSvhOzbFSUvpvcznvCdyv/REJ
         Nu5u3ChUBNFxq4OBOTNry00qEZShMUHmdLNK0kS5Gfz0qYkcgwcp5GuLJFNTjf7CZoPy
         aPyBcA5g6uky2GmQoWNnTm1E1MYjlppnKqxMbGJLDcYnCL1iumAU8eKMYX4Ybi1xseb0
         v/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=vEVHGI7dVdjkSo7oJzclV1RNS4OpQgIWpSUVacySoXQ=;
        b=S5VRCBNw+b4tujRgatf/3AIq0vkHEXjsI/n3z4lEF7ZjyVOPWgA7aKOTf7FIR8+MjW
         PaicwP33nf2QVxR7MNQeZeRt/ewajszGOJHbUO60YOvKOQjPdVqT+MB3aCEkjC8aUEk4
         AYm3WR+drvdkImNrnh/aHSW0NpFUweNaREprKr5lHg12ZP+toKrCx/jOe4257Any5Mt1
         XuMVU+tltqq/lENMgkeiK8z2bJqOZG5dmoPcOo+z5P7cHrCd3EBACOX8r9auj9Qgg50m
         N/HdX7NehjWAFwS+WY88Xb8HwgYe9Y3n95fDBrF6pEfGUe1TtVB8tul+xkREAoIHjLFd
         YOkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=NC1ychGC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::230 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x230.google.com (mail-wr0-x230.google.com. [2a00:1450:400c:c0c::230])
        by mx.google.com with ESMTPS id e128si4409168wmd.3.2017.07.14.07.21.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 07:21:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::230 as permitted sender) client-ip=2a00:1450:400c:c0c::230;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=NC1ychGC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::230 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x230.google.com with SMTP id k67so67961665wrc.2
        for <alex.bennee@linaro.org>; Fri, 14 Jul 2017 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vEVHGI7dVdjkSo7oJzclV1RNS4OpQgIWpSUVacySoXQ=;
        b=NC1ychGCsr8qNDOKjYtF7DblmcYl1F1YmRKuql6PcVVwThZrz+Eo7trL+T4FR4HP70
         amsNFP7Dr0RqP5XlH9OFsPx//ZHzgKO7rUC2ZO7w2n6JgmBRbJNHXibXTsN90yTK6XIF
         71SguTIgIPnbpGhcs4Q1krc2XQJVi5+UxMV/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vEVHGI7dVdjkSo7oJzclV1RNS4OpQgIWpSUVacySoXQ=;
        b=MBa5fcIJL5PEX3IWV6r4eiJQobX1B4fGU/mxovp866mHYRl5V/05zFYlGIMvjl4T6s
         naVrbxuM93MaG5A3fNgr5Db84ADLfVtpLd1WXFLnG60FftZIwHOmyT47Wv+tJC3Yvcbi
         iQavusYll1clKQhcDngkZ8KINQGaaU7/fGpbYZ3o+U94D2q8Yo+spux8psBbiwyietMS
         MWB4it0maf99kyY2EQgxlKo46X6qm+OCyy2P/m6TqWmlJ+/7JW3oaGGSFbdUwUnElqHj
         4DUieuGm0Xg8DZcUL87s6XXLfXSDYQrGZSeKsycRz9G0AwxFTve/3RlPnWYVhoe+meAZ
         XdOA==
X-Gm-Message-State: AIVw112zVhctA2tL3HuQY/weqbXHkpgciFYzeYP1rCZKjtwUnBM/nllg
	2mg/PM2sww006nX0+SNRaAW3MhB4U3F8eZJOIA==
X-Received: by 10.223.172.86 with SMTP id v80mr5525590wrc.112.1500042059934;
 Fri, 14 Jul 2017 07:20:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 14 Jul 2017 07:20:39 -0700 (PDT)
In-Reply-To: <87pod3umy6.fsf@linaro.org>
References: <20170713141928.25419-1-alex.bennee@linaro.org>
 <20170713141928.25419-6-alex.bennee@linaro.org> <CAFEAcA8o4rU7BXR_+VEQhAXBSzJ7usAnkYXDb=CEqQ=duuirqA@mail.gmail.com>
 <87pod3umy6.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jul 2017 15:20:39 +0100
Message-ID: <CAFEAcA8s5Xm8AO8L2=Rs_CQNYqzgArq7ahmjK0sNjy_bGCObHA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] target/arm: use gen_goto_tb for ISB handling
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: N83g04lVzaqm

On 14 July 2017 at 15:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>> Why do we need to clear the low bit of s->pc for ISB?
>> s->pc is the actual PC, not the "PC and low bit indicates
>> Thumb mode" form that jump addresses have.
>
> It's what gen_lookup_tb does to it's PC before the calculated jump. If
> it can never happen I can get rid of it.

Hmm, I think that it's unnecessary, but since we were doing this before
I guess better to make cleaning it up be a separate patch.

thanks
-- PMM
