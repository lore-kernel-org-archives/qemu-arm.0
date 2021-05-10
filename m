Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2660030lfg;
        Sun, 9 May 2021 22:59:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHUw8GYu6xkOd+Efta7Aekpiw2gMOF5RQ1xFPdV34Fy8fkW9nzeqIiHpLSsJwAm1qBxaNk
X-Received: by 2002:a05:6000:1b8a:: with SMTP id r10mr5972077wru.296.1620626391348;
        Sun, 09 May 2021 22:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620626391; cv=none;
        d=google.com; s=arc-20160816;
        b=i4vdR4iMvUYDAMT1acotoHy76HXcSY9Jqjhzs6DfSMMpk+g2awfbMENzVePw2j7UOw
         hXNMwWc4+qNMiOQmOz6+bgCJRoux7qtBx7/Fg2AafJTsD7GePKtsbkZuv+Q72Cv978AI
         Kz42Td3FziGHS26qs2ZYPG3nxJVqihwGBw2F0XumClp19djW5edGi+kai+1zscTX20Dt
         R15YXh9h52JNE1E3ckd4fXujZsDc1vxlLjzl0S6Gb9S5CBvg8z8RqCd4xWMOWVoWY8Dj
         S8Teo/jJHb61t+SHz7F9K0bG1WyCrEruO3dQ76ep1nT+b27Tlfbc+6r3FGczJHO6oAzw
         0sZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=XmeMG1YFdCHs03dSMH0G4ib5+VOnqOnnQz4ItToS9V0=;
        b=s82hLGrV0zUHAGobQEq1QQcb/TSLZw7a/QvfbYGrkzLGbBuPF8j2mg/bWfoiAb2Kb9
         BfKuVEe5eApWoeZkONDXfFmGm8zQgbTdnOtn8c0ebT9p4ZV8gWBVmGggTKZe9gc7Gxsv
         +oacyCwGqOLlrT3gfgp8Pvws3G8mwFUZptxJESAezU6+idByst6O/TYcNVEryQP9oZ+h
         YtPB5pZwvwWJMy0eiFJ8vo3FJKyN0L/HKPFRgKq3ok/PsPBmNx6ijXsaf4s3kVjBe6w3
         0Zwlr7OBg043JAORAOkfL2Kw6aq+B9tXHfnWiXZenOF/Glut87STzw5+VRRgW80UFe0S
         eJYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.32.125.2 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from smtpout1.mo529.mail-out.ovh.net (smtpout1.mo529.mail-out.ovh.net. [178.32.125.2])
        by mx.google.com with ESMTPS id l15si18072649wrm.513.2021.05.09.22.59.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 May 2021 22:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 178.32.125.2 as permitted sender) client-ip=178.32.125.2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 178.32.125.2 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
	by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3AA6AA36E862;
	Mon, 10 May 2021 07:59:49 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 10 May
 2021 07:59:41 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-102R0046650abbe-2ab8-44b3-bb76-d83df9c50929,
                    EC2BFC7B1AED95346F6AF274786A4EFCDB415F6D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH v3 14/17] hw/misc/pca9552: Replace g_newa() by g_new()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	<qemu-devel@nongnu.org>
CC: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	<qemu-ppc@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Gerd Hoffmann
	<kraxel@redhat.com>, <qemu-arm@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>
References: <20210507144315.1994337-1-philmd@redhat.com>
 <20210507144315.1994337-15-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9dc562b9-ba4d-0832-951a-5040d9d540db@kaod.org>
Date: Mon, 10 May 2021 07:59:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210507144315.1994337-15-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ca5f8019-3b94-4721-b6bc-9cee1c76e1ad
X-Ovh-Tracer-Id: 14687645762622688245
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdegjedgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehphhhilhhmugesrhgvughhrghtrdgtohhm
X-TUID: HBk52pItjGg9

On 5/7/21 4:43 PM, Philippe Mathieu-Daudé wrote:
> The ALLOCA(3) man-page mentions its "use is discouraged".
> 
> Use autofree heap allocation instead, replacing g_newa() by g_new().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
>  hw/misc/pca9552.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> index b7686e27d7f..facf103cbfb 100644
> --- a/hw/misc/pca9552.c
> +++ b/hw/misc/pca9552.c
> @@ -71,7 +71,7 @@ static void pca955x_display_pins_status(PCA955xState *s,
>          return;
>      }
>      if (trace_event_get_state_backends(TRACE_PCA955X_GPIO_STATUS)) {
> -        char *buf = g_newa(char, k->pin_count + 1);
> +        g_autofree char *buf = g_new(char, k->pin_count + 1);
>  
>          for (i = 0; i < k->pin_count; i++) {
>              if (extract32(pins_status, i, 1)) {
> 
