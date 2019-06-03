Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp383116wrg;
        Mon, 3 Jun 2019 01:11:09 -0700 (PDT)
X-Received: by 2002:a1c:e90c:: with SMTP id q12mr13448910wmc.128.1559549469538;
        Mon, 03 Jun 2019 01:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559549469; cv=none;
        d=google.com; s=arc-20160816;
        b=twhsykSy6nEvL8hEZ55lbcQAv7v9x6QZJoet4uZu/CKYIlyxXL3uf0l7qvnqDtru0l
         KZP9GS55j+KFZ5r1NLL8RO1+5MKo6UwnKagj6sbNHOh9a2aThVJa9j/H39x/i0vKOdh/
         4OMNItaxfqOX1wqo5cm7renPd2LtCwdl/+oIpDmnUCICXGOquuiEOb6ZW6EFwQwilaLH
         aEY6A6A4atj4BqE4b7R3NVHGfCR5nAZ8FY4V1e4rggLuvQ3ybNUvk48682Mlgz4VAIkW
         YdQUhRbY001Dt9hib9P6RvgOY4oOqhrBJfDJBwrVEcs9QFk4Ha30EXfuThwt9iQCxmbN
         N53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=UJY43iiuLGtmLI0s9YlpkwQjhF7g9c5cS45Lq4hmJnE=;
        b=fYgDihlQHJSkLbogHCaJ4gMLnP+RAQjJmYTBEzEyVX6n3LHU/bALjqD/bx8UzFySEH
         XueSzqFNnphV2i/6KR/q0iIaqH7EnhlsaZY/ATLkEm6dhcN+vMRPwqV+E61f26CFSBre
         4yuNIPAUVrg7CbUdHa2vCnuLsxjuK5fJLBiHKS943f1SxfUbJ+JsuZDSYV48h3289nCp
         QLwkwvazborIr8KM7pFq4Zns9MsEACfY9c4fw66qEMEeJGoRlktZCMR9ZeVwjpZ181h3
         fISXxVmzushiZ6SZEOaJcNmEJZHo9oFnb79Cs+sGmfddYrQR+9LDrfa4fn4xoTrpgXhx
         JefQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l12sor7547626wrq.27.2019.06.03.01.11.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Jun 2019 01:11:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UJY43iiuLGtmLI0s9YlpkwQjhF7g9c5cS45Lq4hmJnE=;
        b=X6s1DEtT2nGaEQygXfme9wyhm/ot07XjF/Nds2DrkjDsNmvSEfB+Of3xkVusGCP1RW
         dLfPUiXreSdn0/Nb95fief97Dh6FplWpwQFI3cWIfQzClQ6/Ucl2RtZ6H5EiuBFTqxpn
         q20RBRig8T8aONNZU28YduiWV4czurpdRzN3pAIuOedJ4i4GLIw8nza4AB2jdbR0nb5Z
         bTapYS3q/e0NG9WWumm+RpnU44LEeC9r0uvOFQpv4alwoaG0HmrKrFV0bNNf6AMjzJtD
         3BhiiL75s7rY1A+ZYSl+Ka/6aHVQ+g1YsIJ2cPOv5zeMp9Ax+dzHsAB8FFiyo2Ik0VrW
         Mp9w==
X-Gm-Message-State: APjAAAUlM8ydBG+8RAazBgp++y4j+dj0iVa0Tyap/TZ7GAFQpUBIIPc2
	QZzBa/jfDfIrO6q+H1NpTwbBwA==
X-Google-Smtp-Source: APXvYqzIkWSBt3a3x6Fd7cci1WOIE6fuJsWd8C/7qzTELH7Ug5siCZKyCvPNoEHd/5y4drNPwQg3PQ==
X-Received: by 2002:a5d:6207:: with SMTP id y7mr1434687wru.265.1559549469219;
        Mon, 03 Jun 2019 01:11:09 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:d43d:6da3:9364:a775? ([2001:b07:6468:f312:d43d:6da3:9364:a775])
        by smtp.gmail.com with ESMTPSA id w6sm3410528wro.71.2019.06.03.01.11.08
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 01:11:08 -0700 (PDT)
Subject: Re: [RFC PATCH 0/2] target: Build with CONFIG_SEMIHOSTING disabled
To: Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm <qemu-arm@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>,
 Rob Bradford <robert.bradford@intel.com>
References: <20190531154735.20809-1-philmd@redhat.com>
 <CAFEAcA9TJGq-8fMv2amQEEGz9QKCNWYwJxCXrjqSh=Yc87yTww@mail.gmail.com>
 <947e851b-4b95-3126-2eaf-d5d16f8b831b@redhat.com>
 <431872249.25606899.1559321648368.JavaMail.zimbra@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a3cbd83c-a942-25f4-d424-bbbc0013acec@redhat.com>
Date: Mon, 3 Jun 2019 10:11:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <431872249.25606899.1559321648368.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: HqOMxSLcy9vF

On 31/05/19 18:54, Miroslav Rezanina wrote:
> What about CONFIG_ARM_VIRT - can we use it to introduce dependency on
> CONFIG_SEMIHOSTING or is there valid scenario of qemu build with CONFIG_ARM_VIRT
> enabled and CONFIG_SEMIHOSTING disabled?

If you are not really going to use TCG, disabling SEMIHOSTING makes sense.

I think Philippe's patch are the right way to do it.

Perhaps CONFIG_SEMIHOSTING should be made "default y" and added as
"#CONFIG_SEMIHOSTING=n" to default-configs/, but that's just cosmetic.

Paolo
