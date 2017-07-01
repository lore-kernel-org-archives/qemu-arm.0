Received: by 10.25.227.6 with SMTP id a6csp371086lfh;
        Sat, 1 Jul 2017 15:48:33 -0700 (PDT)
X-Received: by 10.55.152.66 with SMTP id a63mr12739381qke.31.1498949313425;
        Sat, 01 Jul 2017 15:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498949313; cv=none;
        d=google.com; s=arc-20160816;
        b=mJKwHBfPD/e/Fexyd3FCKAyARcLMIss8n1k+R9NtUB6yB7OvW+uXV6GFHwAdO86WFj
         p4ksRkt1Pl5xCO58tTyt0x44VQPuHV4DkS9foVT6seJjnQZ1KbN1vAGRfCLkSqccyKJa
         QedoiiMhFCHV8N3B00Vd8155VjSHF2WPJbrXc5RmL8rZGBykkdq5XQ1g0SJJg5IChFQO
         +5ciSQvD02882B8GdZrLlHtuYxX41v1adpZXwmlUukfsMZx1h6EN1Np+/AMPZtFH22pF
         5YEPpWBW1dEJymYXvL0r087+C9LudHrJFumk9FP6zcQdAfI9tNPpncRGnu25NqawKy+a
         MJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=bCgL1RVY4rmMZ6m71mslLY8i0JdCTGbVf2U7ekgs5h0=;
        b=sMBjzgDdAqfrw89oPKtkToyUf+7BjDO7pH8fak3T6ZCl4y5aiZFgcSAardcQj4eY+1
         QkcvQ/cqsEOjxCXURhvK9zA3PVFcmx+GPi54ZsVWXBsov34wuRP2YHsLvZPmKwrgN5/B
         3WP0Akzt7+udi8YvFUO/biXA8HSPnw4gXyZCjDVgG0ELE5zLUXHXQdU8urYXrO4zxO5a
         5kDEDG8H53rGSrXqdw4fBJWKTkHHNwMfe52lbHeQD+cSunHFSCtn9qKEQuc7L6vCEme7
         23Q7NtefVoqEcOC+LFJ+ImkbK/o3afMiyhmSWYoygWx76V9pT2kpr4wYIsQunxlCnd0z
         YvLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=q2KEI5cD;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com. [2607:f8b0:400d:c09::241])
        by mx.google.com with ESMTPS id a196si10625481qkb.219.2017.07.01.15.48.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 15:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) client-ip=2607:f8b0:400d:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=q2KEI5cD;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x241.google.com with SMTP id 91so19847102qkq.1;
        Sat, 01 Jul 2017 15:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bCgL1RVY4rmMZ6m71mslLY8i0JdCTGbVf2U7ekgs5h0=;
        b=q2KEI5cDHnoXuVSyOYUo0NKg0VSxZBWJher79egZUYHn5H+ttIkTfqrRot1iSL7gcb
         vztqRWq8M8ir9pwtIrM36Ew9xznMVV1gxIGeUZGHTulj5vkN8hoz7Rezv6Op1e85RL9Z
         A86WscfnhBwc0VS6AyLiR44spO6fX2xlWZaPmxmBFkYSBBHXTBct/jw0B8Lv3r+Nk0Cl
         2c1o//5jPYLTPaVL4stAIxKHAOM88EZwSIofNHYu3F2uTBl7k5KwBcn5utdpsOTouVpD
         pMlK8pSa/ng/0UFB7F0rL2I3fXrVgSUwRVqIQtiy5ADv3tc2JpDIYoivIxAGH2GjOyOt
         wsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bCgL1RVY4rmMZ6m71mslLY8i0JdCTGbVf2U7ekgs5h0=;
        b=ZP6A790JS9ve6erT+zH+h57Ad0byJm1ynUPjXYJFqTjakk8xCxSMllJUkw1ojWO29V
         E+6UTk5YAbfcDnNOijmBod/AU8GR3/lNO+6G7YmMFi2DAHzJJofWD/SIzYxW9Bmo8GHH
         SGvSDes/XKpS6cabkH13YIkQyAPNsasIjBr5YPF4iPeFUrOZFRsF4OVZuo0UIVrYwSx/
         rdr27D+6683XuLrCbP4gVUUErJqApw/LevvxYCED4L7U8I3ev8qOiUB3LSutgdC5Eyd7
         X26aP13G7oYySF60zngoUOXKpkv+RC/nensVMfdD0AA9+5NGOfTTb4EHdr5hqNe5X2gU
         +Z6Q==
X-Gm-Message-State: AKS2vOyI6zJ28r8l1ldz7gkenl11nJEmz3uoIWYIXAQ6V5V2pim0cwci
	Pcf7IPZSONCJLt4t3yA=
X-Received: by 10.55.89.67 with SMTP id n64mr35004132qkb.158.1498949312755;
        Sat, 01 Jul 2017 15:48:32 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id h34sm3184790qth.0.2017.07.01.15.48.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 15:48:32 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 03/29] target: [tcg] Use a generic enum
 for DISAS_ values
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Walle <michael@walle.cc>, "Emilio G. Cota" <cota@braap.org>,
 "open list:ARM" <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865292643.17063.14495945233139782748.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <8738c294-8c73-492e-f574-5d1d88d8cb38@twiddle.net>
Date: Sat, 1 Jul 2017 15:48:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865292643.17063.14495945233139782748.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Lz264996n3me

On 06/28/2017 05:28 AM, Lluís Vilanova wrote:
> Used later. An enum makes expected values explicit and bounds the value space of
> switches.
> 
> Signed-off-by: Lluís Vilanova<vilanova@ac.upc.edu>
> ---
>   include/exec/exec-all.h       |    6 ------
>   include/exec/translator.h     |   38 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate.h        |   26 ++++++++++++++++----------
>   target/cris/translate.c       |    7 ++++++-
>   target/i386/translate.c       |    4 ++++
>   target/lm32/translate.c       |    6 ++++++
>   target/m68k/translate.c       |    7 ++++++-
>   target/microblaze/translate.c |    6 ++++++
>   target/nios2/translate.c      |    6 ++++++
>   target/openrisc/translate.c   |    6 ++++++
>   target/s390x/translate.c      |    3 ++-
>   target/unicore32/translate.c  |    7 ++++++-
>   target/xtensa/translate.c     |    4 ++++
>   13 files changed, 106 insertions(+), 20 deletions(-)
>   create mode 100644 include/exec/translator.h

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
