Received: by 10.182.158.201 with SMTP id ww9csp392210obb;
        Thu, 17 Dec 2015 05:45:48 -0800 (PST)
X-Received: by 10.202.184.138 with SMTP id i132mr38024173oif.62.1450359948575;
        Thu, 17 Dec 2015 05:45:48 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-ob0-x22c.google.com (mail-ob0-x22c.google.com. [2607:f8b0:4003:c01::22c])
        by mx.google.com with ESMTPS id t132si10985509oib.144.2015.12.17.05.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2015 05:45:48 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4003:c01::22c as permitted sender) client-ip=2607:f8b0:4003:c01::22c;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4003:c01::22c as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-ob0-x22c.google.com with SMTP id iw8so56971505obc.1
        for <alex.bennee@linaro.org>; Thu, 17 Dec 2015 05:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=Tshz8tVl8F4q4MgLaWVe9SiTPS7kzfEkFDqVPxn/RCE=;
        b=ByP2P3+NX2JNdlyAllIbCBfE86IsAfy/gQ3Q2PmTFco/5MTFE28S1NVoHhz5Nebc8U
         SyJpktA2b87b+RplZF9n7CK55KEl6V4G4obTPdt/Q08EjfguDH7wdnuYW1pBvnMQwVr8
         EzuNHX7Z1y1PqQSpv2BsOIVqCGaho+IT5L3pM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=Tshz8tVl8F4q4MgLaWVe9SiTPS7kzfEkFDqVPxn/RCE=;
        b=QM1DTRy7+pSOU7tB0yBK6xkZuoElclgDrMh7KYBJlO7879e6arfSSI0F+qeOjYbNju
         sNyissMGSPJ+sCc+2OtsGsxagSG+2QW9rZ9wXy4tY7M2mpTfUS7QJLE/zGqtYlI1ujvE
         55+lnuU4HVThtl08CXpasGppDMObBD7a0jH3fIWTpdse0Gob56xYH0JpB8EGyjODJZFQ
         bjfleV/m0Wvi9iIJ/aumWejRyHE2U5e6b9HTbQeGZiCIDsqq/CtfgZ2KUZmHSHdV4USA
         Y9EgJYgmv5DUkoBkD31RHcp3coh+HcXwRyhjo1rGDTvCsjYAvUnfJ+XI7nBsh1zWB+0I
         rkIg==
X-Gm-Message-State: ALoCoQkJXFaV1zuLtrD36QBNW32B2nedhEYpw7PgzbiYZoa1eVf1zmVJ5tbt1GoH570/T0iwEIru1cM3fll3qbVr8KHeLzWkSeUy2e0FItTNwTZKbAZA/zY=
X-Received: by 10.60.101.166 with SMTP id fh6mr38365633oeb.34.1450359948254;
 Thu, 17 Dec 2015 05:45:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 05:44:49 -0800 (PST)
In-Reply-To: <87wpsdfbm6.fsf@linaro.org>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
 <1447946528-1533-6-git-send-email-eric.auger@linaro.org> <87wpt4bv9i.fsf@linaro.org>
 <56727FDC.1040202@linaro.org> <87wpsdfbm6.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 13:44:49 +0000
Message-ID: <CAFEAcA8Pmu+Tb_RLXe97APgZEFqNB7SAR=miZkRo_WS_6R6_yQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [RESEND RFC 5/6] hw/arm/sysbus-fdt: helpers for
 clock node generation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Eric Auger <eric.auger@linaro.org>, eric.auger@st.com, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Alex Williamson <alex.williamson@redhat.com>, thomas.lendacky@amd.com, 
	Baptiste Reynal <b.reynal@virtualopensystems.com>, Patch Tracking <patches@linaro.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christoffer Dall <christoffer.dall@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3YsmqFEOKeDb

On 17 December 2015 at 13:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Usually I would expect to see a pre-declaration of a function at the
> head of the file and only if it is used before the actual definition of
> the function. It doesn't make sense to pre-declare right before the
> actual function definition itself.
>
> I'm surprised to hear the compiler complained, especially as nothing was
> calling this function in this patch.

The compiler complains if it sees a function which is not static
and for which it hasn't previously seen a prototype, because
generally this means that either (a) the function is file-local
only and should have been declared static or (b) the function is
not file-local but you forgot to put a prototype in a header so
that other files can call it. (This is -Wmissing-prototypes.)

thanks
-- PMM
