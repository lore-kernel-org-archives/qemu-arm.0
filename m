Received: by 10.25.77.65 with SMTP id a62csp230012lfb;
        Fri, 27 Jan 2017 05:16:25 -0800 (PST)
X-Received: by 10.31.139.205 with SMTP id n196mr3274900vkd.63.1485522985469;
        Fri, 27 Jan 2017 05:16:25 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-ua0-x229.google.com (mail-ua0-x229.google.com. [2607:f8b0:400c:c08::229])
        by mx.google.com with ESMTPS id 62si1411174uay.237.2017.01.27.05.16.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 05:16:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::229 as permitted sender) client-ip=2607:f8b0:400c:c08::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-ua0-x229.google.com with SMTP id y9so205812637uae.2
        for <alex.bennee@linaro.org>; Fri, 27 Jan 2017 05:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6/MqTAzLx7ngf81lLrbSzBSVs9O7v5HMp3DbBUe7koU=;
        b=QnQnHEVfbFzqkNcDmTFsX9s5vuthQcwIcFgFg9KtlUdj2QA8MW+TS+xwVoDIAYQsPI
         xvniA8wUT24Nm6Zn5iAjdNv7gRWz5oNQKGuKuztaEyLBqwsRDxsGvM5HzIrdIkuSdQU1
         u8nGiQmJsDIQ/5eGTL+6IdMcEgaG3F0SlrOf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6/MqTAzLx7ngf81lLrbSzBSVs9O7v5HMp3DbBUe7koU=;
        b=lTMgewa5YHGRn2VvLgcsxMdNw+zB/U1muXsoCeXGgmHPDQeOOxT0KjCKGHAfQhEo6o
         rgVJxvya3kwIohkHl1zwPW1xFo9MyBpBu3fqQn1HHi0lej5KI7kcAwfnGZvSCB2lq//n
         0tNNbkLIX+n3+WWtixuNZlz91w9oGOiVQHBCyxjE/cPPGyNYiXomV3xPaATqEgxen+42
         aR2fEsP08icdVGXHu8UziIcIAzEZ5/Pu4SDmYdtAHWD5OzP09sAGbPeyrRAbMMahtg5V
         M1BRiV32Rc0Wlc9Igmo41O5NEHGFPAG4qWBKeejxVutGVjqPBllk7qpVj0kVVCjd8W6M
         F11g==
X-Gm-Message-State: AIkVDXJQq2xpM6C4nVM6jYjvmOx8XmAsWWdYVjzan179IN617NcNHJZpadDd5klsdhW+L9yHHw4bhtXixjYFqR0xaos=
X-Received: by 10.176.67.1 with SMTP id k1mr4297184uak.125.1485522985150; Fri,
 27 Jan 2017 05:16:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.205.2 with HTTP; Fri, 27 Jan 2017 05:16:04 -0800 (PST)
In-Reply-To: <878tpwad5s.fsf@linaro.org>
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
 <1485285380-10565-3-git-send-email-peter.maydell@linaro.org> <878tpwad5s.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jan 2017 13:16:04 +0000
Message-ID: <CAFEAcA_hYyh_v7feko06Mq28DWTEGixNoeYMXdhKg28689zQSA@mail.gmail.com>
Subject: Re: [PATCH 02/10] armv7m_nvic: keep a pointer to the CPU
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: zXf6CjZr88QV

On 27 January 2017 at 12:41, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>> @@ -349,7 +347,6 @@ static void nvic_writel(nvic_state *s, uint32_t offs=
et, uint32_t value)
>>          }
>>          break;
>>      case 0xd08: /* Vector Table Offset.  */
>> -        cpu =3D ARM_CPU(qemu_get_cpu(0));
>>          cpu->env.v7m.vecbase =3D value & 0xffffff80;
>
> Given it is only used once here you could just indirect it:
>
>            s->cpu->env.v7m.vecbase =3D value & 0xffffff80;

Two reasons not to do that:
(1) it makes this patch easier to review if all it's
doing is deleting lines that set cpu
(2) future patches improving the NVIC support are going
to add more cases that want to use the cpu pointer

thanks
-- PMM
