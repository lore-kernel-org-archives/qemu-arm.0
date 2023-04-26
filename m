Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp266393ejm;
        Wed, 26 Apr 2023 01:49:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350YDL+jhK4OprCaYS4j0Ed/WpG8+mRBd0GPG2KIwa5YCDnjQITq54PswxJILZ0x1EBnLb+0G
X-Received: by 2002:a5d:4fcd:0:b0:2d7:d4b:b33 with SMTP id h13-20020a5d4fcd000000b002d70d4b0b33mr14825925wrw.21.1682498959632;
        Wed, 26 Apr 2023 01:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682498959; cv=none;
        d=google.com; s=arc-20160816;
        b=jJ2dSM23VudmPfGME/CeV/BjnZeWSBYN4R9nFCinekg1o0572LcNrYw0ciObdGandA
         QnBb39b90MLl8XugGGRoriTuApG9mMnOITLRfKRZlxgL+Ngej1lJd3CprO2dX27p9LdJ
         XpJi3GQS8Jbazxsn8HWE6Acae/vd3edpctijP1TiH+/T/oh88jOByGBX8gl4WhDf1CLh
         mccR4eN8jpKsu+2gk1ROlCTha3cgitWjzzzN/lyE6UvrYkJCq9wER3GZAcfM345e4rLG
         dcpnMtAxnR2JoDjehuWfwZfZirMEQgX2J/v24L+dy7kWlwEE4K8cU+qvJtCE5pA50DPI
         4Dug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=subject:content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QzaTlj7aaKqMOtoDFQwtRqe+WfbslHGv7qaI4vH121Q=;
        b=RjGv8MF+LeNmFXBPpgjRqKS02P8jDT4Id5ZRSbFZ/Gw8C0MIJ77vpVANKQ8nPypT5P
         fWJBBruC9oy/+BFA4EaDlEa0UDFrhNALkvyr+MpxCHCOCjHzkFDTlvaPn4yD6gqIixgk
         PwfU0rnY40Xl9Yqr269hnuoDC0g1uRJ8Ah8oNJY5U2hu62OlZF7n3s5bhj6XZGkebxT3
         +wf8iQzQK2bK6wrOgjZmoF+UjRGagD3ljFIHbNv+Z7cZmdHqkE4fm5K9VDZ0AmV743jO
         /zL1+zq4JDNCf/sL7Qj7vXYgPXC0rQjOZEBYMZysNlAAJoa96UWQDLrcWiNtV0ZHE52e
         hUrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b="f/hhWTNG";
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <mark.cave-ayland@ilande.co.uk>
Received: from mail.ilande.co.uk (mail.ilande.co.uk. [2001:41c9:1:41f::167])
        by mx.google.com with ESMTPS id s17-20020adfecd1000000b002f23dbf6923si9379835wro.490.2023.04.26.01.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 01:49:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) client-ip=2001:41c9:1:41f::167;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ilande.co.uk header.s=20220518 header.b="f/hhWTNG";
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 2001:41c9:1:41f::167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QzaTlj7aaKqMOtoDFQwtRqe+WfbslHGv7qaI4vH121Q=; b=f/hhWTNGPhi/SkTcWy/9HrrfCc
	Umevjt1l0MUeGra4lN7B2fpA+PfbvilSy/NDRBvbyar/gjd90LNBZp8qmZRuRJXGK6piMG41ZrLbH
	ZkCK5crdL+chheMwekDpac2vZyoUsEap+KpxHT2ZDTvSIdGFbJBsGWvozczbVKKUspvTyGNIvrSYb
	cpFbyuzMHmlvj2dvAyB344GarAAKem0Pq9GenxX0WCr9vCkWenkWPOdK+8gIVWrL25kkKAY9ZHAEa
	ytHWnV/bijeAzUrGvLp515mC/Ch50k3tUfwGfR8Ct2sEBXNIsVZkw3py42XgUSnrbViuHr4+BHqZH
	i0qxh+2BLcxyL8t5bS1g2VFMBnOuhRi4ecHWHpux3u8Aqj3z/yf4mxfFUdl0cfZ9asVOfYq7BAdCI
	QhLPkLJhjNou49JRzo+g6hQPsyZOxbVnVi6ZpI/YbMUghjLKjd68dDkgBizYjRSsdIDW9Rjw6V0rp
	GWVR/EXmlmwEgGDeA2YhAOIKYyW2XFEDTIP4Dn7GQBoJqw0o5FrKuQ7RBESQ8luvGFjbvNtmookUb
	OQWvEuBHEOLMbrMZLUGNBTaLM3/mMyP2rxDoKqtL1DfO31PGpex8g8o0W6NEXdR0ExjZi1IMV9oMF
	LlY0f0ccoRsg+9BQ7pI7XOp/govtsbqlsDZBuiU6A=;
Received: from host81-151-114-25.range81-151.btcentralplus.com ([81.151.114.25] helo=[10.8.0.6])
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1praof-0000p5-Sf; Wed, 26 Apr 2023 09:48:01 +0100
Message-ID: <495a50b5-e8fe-a3b6-1f25-c8b7e94f658c@ilande.co.uk>
Date: Wed, 26 Apr 2023 09:48:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
 <20230424092249.58552-18-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230424092249.58552-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.bv.iomart.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED,URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.2
Subject: Re: [PATCH 17/18] docs/devel: mention the spacing requirement for QOM
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
X-TUID: dH3K2z6r3vyZ

On 24/04/2023 10:22, Alex Bennée wrote:

> We have a more complete document on QOM but we should at least mention
> the style requirements in the style guide.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Message-Id: <20230420155723.1711048-9-alex.bennee@linaro.org>
> 
> ---
> vppr:
>    - use Mark's formulation, briefly mention property separation.
> ---
>   docs/devel/qom.rst   |  2 ++
>   docs/devel/style.rst | 40 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 42 insertions(+)
> 
> diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> index 3e34b07c98..c9237950d0 100644
> --- a/docs/devel/qom.rst
> +++ b/docs/devel/qom.rst
> @@ -1,3 +1,5 @@
> +.. _qom:
> +
>   ===========================
>   The QEMU Object Model (QOM)
>   ===========================
> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
> index 5bc6f2f095..e9fce0fc69 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -628,6 +628,46 @@ are still some caveats to beware of
>   QEMU Specific Idioms
>   ********************
>   
> +QEMU Object Model Declarations
> +==============================
> +
> +QEMU Object Model Declarations
> +==============================

Accidental repetition here :)

> +The QEMU Object Model (QOM) provides a framework for handling objects
> +in the base C language. The first declaration of a storage or class
> +structure should always be the parent and leave a visual space between
> +that declaration and the new code. It is also useful to separate
> +backing for properties (options driven by the user) and internal state
> +to make navigation easier.
> +
> +For a storage structure the first declaration should always be called
> +"parent_obj" and for a class structure the first member should always
> +be called "parent_class" as below:
> +
> +.. code-block:: c
> +
> +    struct MyDeviceState {
> +        DeviceState parent_obj;
> +
> +        /* Properties */
> +        int prop_a;
> +        char *prop_b;
> +        /* Other stuff */
> +        int internal_state;
> +    };
> +
> +    struct MyDeviceClass {
> +        DeviceClass parent_class;
> +
> +        void (*new_fn1)(void);
> +        bool (*new_fn2)(CPUState *);
> +    };
> +
> +Note that there is no need to provide typedefs for QOM structures
> +since these are generated automatically by the QOM declaration macros.
> +See :ref:`qom` for more details.
> +
>   Error handling and reporting
>   ============================

Otherwise:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.
