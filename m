Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp177405ejm;
        Fri, 28 Apr 2023 15:32:43 -0700 (PDT)
X-Received: by 2002:a5d:6dc2:0:b0:2f2:9198:f0f with SMTP id d2-20020a5d6dc2000000b002f291980f0fmr5074024wrz.10.1682721163028;
        Fri, 28 Apr 2023 15:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682721163; cv=none;
        d=google.com; s=arc-20160816;
        b=bnlL/KHlP1SQuPugQUZGDTHRIdNsvUFvZAmaZx6SOg0ncJhnDf9z8+5lwyVBmOWBw0
         DL4jPjaRZz1HIyhwSoFXFpDj6e/Odkt/+VjoLuZdsRccLydrW0FNkuwwPFtyAhR4JADL
         xYoUQYK3pCBpIdd0i8g8dEigtVrdioBWc4wl62QwCjKZmMtijo0C80x64UP2sYNiz5sz
         SMYdKYuAkJo8D9jeOIqL+UgzzN8eFEtMMpW5p8AuGVisDuhFObOn1chqZS1eaIC7eAmf
         xKV5D2gMPbioP+jgLLJDMH0UmLZX7AcN025WlM66kZaab8bgRGJUlgbfaEwZTb1OWKPI
         /LHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=O8L0o1sAlxY6lrvihDvAAf8F9qY4OxJ51gZwJAMl8MM=;
        b=OzSg8rm1P8Uv5Hx503Yj+lcjDHGwTHXP/0kaun21tscntWGu0a33nkM1Twd5W24dtV
         5OLK8tm3BGtFwZfQn87oTT+NqTH4IEMuZzsZ0/YHtzdry+ABEiITQdQ5xSJjxn/Wvb6J
         JmZBlyFSvVTMAfGaVoBi4pdgGw91TaAq/cycNt8E8on4E9dTYr3g4OiKicRdDxGKncx9
         cKQX9yETqf05vmGEZ8x+uGvew0eAr5kUyfh4kP84JgsPOyVuxnb7yNBr7V1nPO8l7irm
         otRIB1IJaxjur0qU/G2v1KpJMs+SClJtf1TipiE2G++/P/OJ8P8V+pnpIzNVJH+wARbl
         dggA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wjZtAWpe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l8-20020a5d6688000000b002fc3015d527sor9095964wru.24.2023.04.28.15.32.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Apr 2023 15:32:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wjZtAWpe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682721162; x=1685313162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8L0o1sAlxY6lrvihDvAAf8F9qY4OxJ51gZwJAMl8MM=;
        b=wjZtAWpe2rXb0QPbB8GX3s0lvweu0Ibya7k0DWbGUU3P8fzuzmosvNFJkHJ4c0mPif
         b2ATjXtjXyzozy12gTToQ9+e9oXokhzIZKcZvJfldKeKejb9nt5atiUXO1hPY9PEn18J
         pqtalMDj7bVCaFF+Xil+E3e2rt3zvc7sCV9d/XrSDr7TslLtAqhKAjMsgHnw4GAvwyAP
         yVdNwtqpZtt2BchoVXi6EEsO3JWze+4LzZH5xy0AjmXd1iB2HETe/JrAmIxDY6GThCIB
         ho5vCKCzDSHsHfVzXvjIrfbboW6lSfp8Zlk90QtHWQofmuwwJv70U6j2cf4opx9BaLdY
         WAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682721162; x=1685313162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8L0o1sAlxY6lrvihDvAAf8F9qY4OxJ51gZwJAMl8MM=;
        b=iA/Bbr54voZWXVXdPG2DobqWzCg98c0KkrbWIBNDWUcIO5jf2p5voVCoTDeELchCt7
         3K9ifm46JRw6lFzlGPnLvJ0jdx6DIR8MeaovkI3Mi9x/V8VSJzufWuAqrdWTxt4zjsC0
         s60gxs9bukwIexjOFOimBX7gavADnicwSQYhXEOoqeeJ1SKnxKsqkaFmyZZ2f4imzJIB
         kugEwmqQx4AGvEGyKNnGbslLSbn6hglXlMChgaZXXtnUMvusXtm2zo5vcwUd/ujQ1aOP
         tBxGbTz2hwK96h4IJA+30MWoGsKaIRkmy7RclV8VAPFrVMRf1j8uoT2F6xUt/+nsc8bH
         a/Eg==
X-Gm-Message-State: AC+VfDzv7dV+n2u8+i4kcxPSBbP65rP6vjvDWuBWS1HwMeOVPKirmRTw
	JtSS12MiRRAfE59Kic3Bc6yyqO8N8Er1O5p4oIvYu98G8bw=
X-Google-Smtp-Source: ACHHUZ5C4D+3gTAx4ICr9zTxHJaaTEv2bP5RuQ/h7mn70+TcT4vTSAu3JOglWG4uVZb7K3nEFwRdTg==
X-Received: by 2002:a5d:6291:0:b0:2f7:f6e:566 with SMTP id k17-20020a5d6291000000b002f70f6e0566mr5344739wru.31.1682721162670;
        Fri, 28 Apr 2023 15:32:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net. [88.28.19.47])
        by smtp.gmail.com with ESMTPSA id w6-20020adfee46000000b002f0442a2d3asm22072998wro.48.2023.04.28.15.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 15:32:42 -0700 (PDT)
Message-ID: <d3e7cb83-27ba-b2e0-ac5e-73956725d22c@linaro.org>
Date: Fri, 28 Apr 2023 23:32:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v11 08/13] tests/qtest: Fix tests when no KVM or TCG are
 present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-9-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426180013.14814-9-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GilAiNLoVRAX

On 26/4/23 20:00, Fabiano Rosas wrote:
> It is possible to have a build with both TCG and KVM disabled due to
> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
> host.
> 
> If we build with --disable-tcg on the aarch64 host, we will end-up
> with a QEMU binary (x86) that does not support TCG nor KVM.
> 
> Skip tests that crash or hang in the above scenario. Do not include
> any test cases if TCG and KVM are missing.
> 
> Make sure that calls to qtest_has_accel are placed after g_test_init
> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
> printed before other messages") to avoid TAP parsing errors.
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/bios-tables-test.c | 11 +++++++++--
>   tests/qtest/boot-serial-test.c |  5 +++++
>   tests/qtest/migration-test.c   |  9 ++++++++-
>   tests/qtest/pxe-test.c         |  8 +++++++-
>   tests/qtest/vmgenid-test.c     |  9 +++++++--
>   5 files changed, 36 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
