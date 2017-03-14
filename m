Received: by 10.25.77.4 with SMTP id a4csp1754233lfb;
        Tue, 14 Mar 2017 11:56:37 -0700 (PDT)
X-Received: by 10.28.61.11 with SMTP id k11mr17244808wma.119.1489517797190;
        Tue, 14 Mar 2017 11:56:37 -0700 (PDT)
Return-Path: <k.kozlowski.k@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com. [74.125.82.65])
        by mx.google.com with ESMTPS id c46si6144844wra.299.2017.03.14.11.56.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Mar 2017 11:56:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of k.kozlowski.k@gmail.com designates 74.125.82.65 as permitted sender) client-ip=74.125.82.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of k.kozlowski.k@gmail.com designates 74.125.82.65 as permitted sender) smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-wm0-f65.google.com with SMTP id n11so1290397wma.0;
        Tue, 14 Mar 2017 11:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=3phxdJjhXFoKhFgVjiBXTqY29U17d1wXO8OQ5/+KjaQ=;
        b=kVodr9saCiZU/LLgfgk7Q+OqIJdLAbwQ2Xd+PUysO7KUm4vZw0xsno/g8RjtOzCCXO
         0qn/qD9ceCG9t0dUpFlUFcMSHBKYKG1V2S507cWV0hHqOyBEu7hKw8n6F1Vrk1oBvo+v
         ZeZ4YoOtrbP35xwk27NaR/VYbU/ZoadtG8ScVUUx70v1FMUQzq0vfhEMuHq7riSidB+i
         ZDyBs2rWaYHpuMI6LhHL7L/Jii7FS4oAQU7moyS3cD7NCWKiK7rPrWjdBoCxhO9+dy2w
         llmwWd247wwQl4H8N79ohy8K15FDx2IGo1tq29s7pn+fzr+F2+w5SF2PUWZUaQvYaQGL
         6jvw==
X-Gm-Message-State: AFeK/H2kBSba7atOO5oXLUbf7PZu+VlNO66SbZNcZoOtPsTLVMaADvpwQ/WozbWAMB6LGg==
X-Received: by 10.28.191.24 with SMTP id p24mr16279837wmf.118.1489517796811;
        Tue, 14 Mar 2017 11:56:36 -0700 (PDT)
Return-Path: <k.kozlowski.k@gmail.com>
Received: from kozik-lap (bzq-79-180-56-222.red.bezeqint.net. [79.180.56.222])
        by smtp.googlemail.com with ESMTPSA id b82sm16452658wmh.4.2017.03.14.11.56.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Mar 2017 11:56:36 -0700 (PDT)
Date: Tue, 14 Mar 2017 20:56:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v2 0/5] hw: arm: exynos: Bring up secondary
 CPU + CPUIDLE issue
Message-ID: <20170314185632.kzbccv2y7ah3nhqd@kozik-lap>
References: <20170313180432.7067-1-krzk@kernel.org>
 <87mvcnpzll.fsf@linaro.org>
 <20170314173513.wruppu4js7ikaxu2@kozik-lap>
 <CAHDbmO1apk81csbC7BJK2JFK23fvVBLb-wA5z7_y29T=ueFPyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHDbmO1apk81csbC7BJK2JFK23fvVBLb-wA5z7_y29T=ueFPyg@mail.gmail.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
X-TUID: 7jFuuZGPJVSW

On Tue, Mar 14, 2017 at 06:24:33PM +0000, Alex Benn=C3=A9e wrote:
> That means you're on a pre-mttcg tree so that's not the reason.

I managed to build it on current master (v2.8.0-2182-g5e2fb7c598c6). It
behaves the same (with "-accel tcg,thread=3Dsingle": cannot reach
switching to init).

Best regards,
Krzysztof
