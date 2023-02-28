Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5668352ejc;
        Tue, 28 Feb 2023 03:54:31 -0800 (PST)
X-Received: by 2002:a05:600c:1c8e:b0:3e0:98c:dd93 with SMTP id k14-20020a05600c1c8e00b003e0098cdd93mr1855908wms.29.1677585271758;
        Tue, 28 Feb 2023 03:54:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677585271; cv=none;
        d=google.com; s=arc-20160816;
        b=C2gW8ZG3lp60fMFfo2lFhbd7lxo+mt/BNrIYvDZcw7WDvXL+/mgML77QFVhjRufJOg
         l0jOZba13De0UOXV23N6v92xVny3r97rtT3OF77XNDyRj34yKOv6frVwFb/ZOV93O4Z+
         3dIwAxA1S2TkTw2nlI0oMIFaBs+xgkMbK0ZlaAGO1I6WLGYYzIoAt5GkTmk54RfKDnLF
         lQWh9ns1xZHbKNYSKfppfdK895Az6uhpx6FAdBEgcSJRakHL85RL4cUNU/tiMLg4mV4Z
         Ptj7/0gHYoH7Zm5Yg00fXmV+l8ZofbzlviBlyN/6DNRaI5DTQjrl602hCTr2MEYZwc66
         e/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nk/W5I7yEYnRYYwu6FMoJYeX7Rz+RoLFVgBwtE6+/xY=;
        b=0mUHBo3OhPeZt2/p8uBZjqqguykK7l/Hk8IG2Ih12S19XksqKjplLTQUeO89i917EQ
         unhRP605Y9lSrFdW8xUfC15mGaAO1lIH0bKJJF3nsPXtuK302GRDZ7BPavGeit2k0zuq
         2uKr+PTXJO0lldrsLGKK0vUGDiONmnFSTzdGITAmZxjC97aw+jdB9pUAuL90g5aS4hxM
         mtW3WvqcTB4xhLQeiu1IYox3w/BSRPEl0K3k464zqHNripIk2op8rEHkTp6d5GKTJ5mp
         uo9bGaaXMXswnVxduY9gNQ5mDIMJgYIbUQ4eDrfHbSUBOCNpxZzrAVf9rqvZKQI1r/Sv
         x0ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W3W/w8s2";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k18-20020a056000005200b002c54fb628c0sor3485607wrx.14.2023.02.28.03.54.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 03:54:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W3W/w8s2";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nk/W5I7yEYnRYYwu6FMoJYeX7Rz+RoLFVgBwtE6+/xY=;
        b=W3W/w8s2bA4Hr7umWG7Q2odRwlU8IbiP0zdX45u6EGcdrbvenTqvxIarBrSwM5ecO/
         /jUAidfEToG6DU2PToMFvZN4DLqOJ8kBaL/8+5CNhSI7+jc/zTZCjI9EWBa34Z7vQEEB
         YANkH0OU+jmqs2u//fZgM3JQRpjAz7NWOLJHU7KIC0n2TlU9u/rI8qvK7dMxaj9naTyn
         rya2eQ816WsBNGdCTDpkvz4lTcbrLq4TZcAUaJ7CHiepMw9e5MUevjECIocGSiFPXxoT
         CMCGiyW/Y/7ps6bprGubeK1s6LZ3dyohFdKaIUJqHyOZjHNao9WR3HV3h6H422J/ysAq
         OPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nk/W5I7yEYnRYYwu6FMoJYeX7Rz+RoLFVgBwtE6+/xY=;
        b=trrEVfBSffXquqj6Ei9dq5Jg6bL3QjwfEjRkMW7f5PIwasJ5iugD1HlP/92yIJkyy4
         PsNTu0ELN704ircScc9wWJ/9ofc1FRC3fyNauHSbNkrk9dNY7eIyT8qnE1F7LIKohOAF
         KUHgNSOQc9X46ARYFhjDrCTBftR+76wGBHmjFK0x5u9Z5Q4uXtxghSI8j0fgK4ai4KT7
         3rB3Vgv5Fs9Y0XhqXjCutlwnY4QmZwgUPfDxYXxWoS4UDv2CD0nTOlwARjIQL3lWtCkS
         2NT3dmdHL1hKaD9Wa9rvrnANiUvhUbtf/usQrLGQkqBKexU1Mt9qfR3BnnjO1Ajn4NI+
         O3vw==
X-Gm-Message-State: AO0yUKWw0kZ833bxRzr/jJBdCtmyv9jmJQHhOOGDMc+Q+sDR1Sy2+U6R
	jpaOGwg3mxcwTmGndQ93CqDVoHQlMuGU9Q/5frY=
X-Google-Smtp-Source: AK7set/wv8d59OwoPof6RRccYE50LP2cZGcQNkcr484s5EjCqd0u8DDl0c4Y+idT0t4c0MlXX0xpag==
X-Received: by 2002:a05:6000:c7:b0:2c7:1c72:69a3 with SMTP id q7-20020a05600000c700b002c71c7269a3mr1817350wrx.29.1677585271271;
        Tue, 28 Feb 2023 03:54:31 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id p9-20020adff209000000b002c3e3ee7d1asm10006438wro.79.2023.02.28.03.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:54:30 -0800 (PST)
Message-ID: <307c003d-369a-c44b-2e62-679d3a9ac6d8@linaro.org>
Date: Tue, 28 Feb 2023 12:54:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/7] configure: expose the direct container command
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224180857.1050220-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JivkGoem5H8o

On 24/2/23 19:08, Alex Bennée wrote:
> In the process of migrating away from using docker.py to build our
> containers we need to expose the command to the build environment. The
> script is still a useful way to probe which command works though.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
