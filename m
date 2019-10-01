Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8517304wrp;
        Tue, 1 Oct 2019 10:58:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbvRdKNdI3ZPNlY5CjFxnc1qzNhbBsvdyVQ+RrfzxwCIMJSu+kX5f4DZLrW3r41O2ar5VA
X-Received: by 2002:a1c:2501:: with SMTP id l1mr4432155wml.74.1569952726054;
        Tue, 01 Oct 2019 10:58:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569952726; cv=none;
        d=google.com; s=arc-20160816;
        b=WabTpnzC9wakhuOBa5/LxFNDjtaFOMMq4yZZPqdUJjMIJ0x6kjYywAIxpgfGDT+h8u
         kO3QvmHd087f/0d0D8yAJiFxGHE+Y5lxrAY/KYj9MijtI9JTOBEanRPUL5nKKfLSjN1y
         et5tqTysnyad5vJalqxbZlNkpkdvd1tJbaJ1ABi1q48DMCGVyzoI4cN7NmPqKwJIWEDT
         Lu4ESDsEh/eq5ElO7Lk1YPXfmWNFOr/vUmpC2qF/lZHBhtbnZBmv7aLLgHT47vnT2Cn1
         MdJFZ73/wIcwsChoSDDcgn5gtKKUGW+89WsjWZALrxxcyhyhfPxLxYQ9gs2oemXOZUHh
         PqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=subject:content-transfer-encoding:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:cc:to;
        bh=A55nu4ksSoczXuYcpPBwd9afCmDsZDj4Cd5yRAraRPE=;
        b=GiSsJlIuVrZzCvzUfyT2EMev7AmbzarbRBMdKFD7a/mVzVUXcxWOPx+Z0lKxzTSPTI
         2kS59UmD9uuHWcnYEulQoPI1cvhDmTt/TQ9m+6djqfakvB9NrmBvtl35/IDM4svuQEtj
         6LUUzT5rxaDPPfoiWtwghnCJwqpViOrFlthhW7RziBvvSRyKgGE8c6PboDEYcF3lMkW/
         Pv8Gk44Xs4Kv8pZ/16Kvu7rVLlOdNI7qJIGpOvd86woscl3ZqnFwWvQZa2LVlC4zJbKr
         IUzjQYN1nk2Z9vja/OuzQYqZvTB4HbQmGE/FV010kYYXR4lMvOVCLGc1IdsLNPJ88phL
         wPoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 46.43.2.167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk
Return-Path: <mark.cave-ayland@ilande.co.uk>
Received: from mail.default.ilande.uk0.bigv.io (mail.ilande.co.uk. [46.43.2.167])
        by mx.google.com with ESMTPS id w19si12661725wrc.281.2019.10.01.10.58.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 10:58:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 46.43.2.167 as permitted sender) client-ip=46.43.2.167;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mark.cave-ayland@ilande.co.uk designates 46.43.2.167 as permitted sender) smtp.mailfrom=mark.cave-ayland@ilande.co.uk
Received: from host86-133-194-221.range86-133.btcentralplus.com ([86.133.194.221] helo=[192.168.1.65])
	by mail.default.ilande.uk0.bigv.io with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1iFMOI-0007Yu-Tm; Tue, 01 Oct 2019 18:56:51 +0100
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>,
 qemu-s390x <qemu-s390x@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org>
 <20190930092519.GB11996@redhat.com> <87impakrky.fsf@linaro.org>
 <CAFEAcA8_Zt+4RuXh8ww3Xm5=fQT+e_XcjZ6VC2N9k5mzLy0bnw@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 mQENBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAG0ME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPokB
 OAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63LkBDQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABiQEfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
Message-ID: <ddf455e3-742e-81ce-c51a-d783e8d2ad55@ilande.co.uk>
Date: Tue, 1 Oct 2019 18:56:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8_Zt+4RuXh8ww3Xm5=fQT+e_XcjZ6VC2N9k5mzLy0bnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.133.194.221
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	mail.default.ilande.uk0.bigv.io
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-TUID: brdw4mxTCrbN

On 30/09/2019 12:41, Peter Maydell wrote:

> On Mon, 30 Sep 2019 at 11:26, Alex Bennée <alex.bennee@linaro.org> wrote:
>> The int128 support is due to the fact we are going to start to see newer
>> architectures with things like 128 bit shadow capability registers and
>> they will be a pain to shuffle around in 32 bit generated host code as
>> well as requiring writing new extra plumbing for TCG's pre/post amble to
>> pass them back and forth between C and generated code. These guest
>> architectures may not even be full 64 bit guests so it's not quite as
>> simple as saying you can't have 64 bit guests on a 32 bit host.
> 
> I think that for int128_t in particular, the ideal answer is
> that if the compiler developers want to introduce a new
> abstraction like that, they should support it on all targets,
> not just half of them...

Just out of interest, which host/compiler combinations don't currently implement
int128_t?


ATB,

Mark.
