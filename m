Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp277594ejm;
        Thu, 27 Apr 2023 02:44:15 -0700 (PDT)
X-Received: by 2002:aa7:c1d1:0:b0:506:925a:c224 with SMTP id d17-20020aa7c1d1000000b00506925ac224mr1042696edp.38.1682588655117;
        Thu, 27 Apr 2023 02:44:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682588655; cv=none;
        d=google.com; s=arc-20160816;
        b=HTooenkMEx4UjNhuqVqAMS+TV0Q9Jyp9nbXzl19oK6ZhowNMpmThoEf4y0Kx9r/j6X
         nCRDngScb/kBoraD+Zfkx8wCmD95MUEQVu9PGDDP8C3m6kl+vHhAhFoj+625SnZF4ZiX
         SDNBkPItKeUtkApjSz5mDMYZ7vpAcN4X+gTtyZsZVt6dqF3PhUdIVsxYmNvKvAA3EwQs
         1DvuuTeX/I//vr8/CLQLlMXe6OOr3CKnvBnkc+wZDLJFeFaVVmO0bXc4/B5ea96q14Ds
         kxtZIAzwJrwJnKI7wG+R7HcDvFWJosfgihkII61wjUD3427a6bHI9xdPGSlTzx4BUdQF
         Kg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NKTxXQ5YVmv7VUuu7M36wDBnaG4p0r1am1RGBJA/TEo=;
        b=oDSxhAYt6LbJxQjoYEJrgm0Jiu5gm5KU42mwDTmx97g4u6THAC3PZYKOAECKXMU85j
         OST8VpB0Yfod0PtDagNXZ7CQEL94Jn57y9Gt42AQ/6P7F3PoiaenoWaEa5Lmz9i+Oy2M
         lEsN30bP9EiNXy/GTMilgSQ2xLtf6fL401s1zkbc4Czh06K6VMxkBVch8a4o/QvbNAJv
         wRtrK77HAM4+w5Y9WqsXJ0mU+9JZBOpbgOO3dKUAih9B0k7/39ULYPotUVnoi6us0tAX
         i7Q8AAvpGfUgG1ODhsp8+9oX1CeCvly2n8PtvHPRNfd7ds03u8RyJCnYTZxKzuhvvi5e
         ekqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sJHWHXwR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e6-20020a056402088600b00504928747b2sor10678991edy.35.2023.04.27.02.44.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Apr 2023 02:44:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sJHWHXwR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682588655; x=1685180655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NKTxXQ5YVmv7VUuu7M36wDBnaG4p0r1am1RGBJA/TEo=;
        b=sJHWHXwRaKIKKvRQgYq1zrevnmol5fwvqPjSIDdul5REcx9+9BtygqNVi6pDr/O693
         xZ7BEnmk88eTvqcdBa0zd2PuDJIdO/CWB/XUJM2RqSPSfE3Hc3NUewdTvlU+anu+EbNi
         4w0BTlYP7ecV0FXVuMI6Hxzxb7AFGVSYCsXCbBTfy+E7qy9nG2yyMDPP/2UPMI2coqQ/
         rDKk6jMpCp8CxGra0o8dnd4exUVRyse/4OSK5GAFDAUNb/YKJ/rGAH9nks3hpnVdbKSL
         FN8W3w7orfndiwHi+moXJm8y+AGLUHyI0q+0J7UFjzMmUGqWoTzDqHGLopacSR/WkCyD
         mevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682588655; x=1685180655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NKTxXQ5YVmv7VUuu7M36wDBnaG4p0r1am1RGBJA/TEo=;
        b=M+yyXmrSsp7hYi04SCPx6TajXmNc5kqYpi39m0Uxls0MPhoVpZsICY1UoIPF0PYabm
         Gn0gQFRQBd02mkTLRAqNQhdvzmc/tXV6vFIpLIeMW5LGg6GPDLCUhs+4AaXo/BfjOskf
         Z2WIE0APrbZx38xhFhmQTyZqWRJsHYkzEdPVRXQhuAZIkps3Se52R896wrBLWZkeIzyO
         zU2JtaeenCfhB4WquU92gah6Eqft/2XDRcMCyltkrbLTomdjAXqui4L+G33ZkMA/BZd6
         gnBy/ZtpskdSdyrndMDHWfFPV67XBVIplGAv+E55zWYtQ4aeqMT4+0TfzudyYrKjZsd7
         MNsg==
X-Gm-Message-State: AC+VfDwhPcwca1aQx53vzHopMeHMiv352T7tx52pj+Jo8X1nMj55aVJB
	4HEvaX8kYD3hzZg2yYWa/zW2BYDM
X-Google-Smtp-Source: ACHHUZ5rvBn4kpZdo9SZPAlp8ZZIIREd+Bg0eQ561uO19z3GqMP9LCH3g63gyyMGfIX0f9ygdWd+iQ==
X-Received: by 2002:aa7:d6c8:0:b0:4fe:19cb:4788 with SMTP id x8-20020aa7d6c8000000b004fe19cb4788mr957139edr.42.1682588654696;
        Thu, 27 Apr 2023 02:44:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.23.3.19] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id n7-20020aa7c787000000b00506b2af49fbsm7785905eds.81.2023.04.27.02.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 02:44:14 -0700 (PDT)
Message-ID: <63f4fdab-a3c5-6259-3e8f-f2e6b7fef823@linaro.org>
Date: Thu, 27 Apr 2023 10:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 12/13] tests/qtest: Restrict tpm-tis-i2c-test to
 CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-13-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426180013.14814-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: kqMwuwvACHZF

On 4/26/23 19:00, Fabiano Rosas wrote:
> The test set -accel tcg, so restrict it to when TCG is present.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/qtest/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
