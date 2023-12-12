Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp746352ejo;
        Tue, 12 Dec 2023 00:18:34 -0800 (PST)
X-Received: by 2002:a17:903:2589:b0:1d0:6ffd:9e38 with SMTP id jb9-20020a170903258900b001d06ffd9e38mr4734909plb.138.1702369114588;
        Tue, 12 Dec 2023 00:18:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702369114; cv=none;
        d=google.com; s=arc-20160816;
        b=TSdSbJxlcPOL6t1FN0tRa8BruOOl1+5FAL2gtro8pxrAf7DqeDCOXqFx6O8ioQv6ca
         Kz2lWUz1n6C7brhfgHPiFs4vQ787xwGOBRo0AcZ3OuPjOUwm9IB+oAi7xgjqKYlT4xFC
         JMsXda7Ur1x1IzvPTxM7Kwej4csSe+M8rREOfQ9xg0pH+GMGd9m+O4QZ6DXRx8QgizRX
         1UBUJyNW8xpstfjCp1oUL8xcz9bLqH9dysbk98ZyQ7Zr1PqpnqWrZ2WSrpL+ue5d0Krc
         XoVYnVm9KyVcj1WE0+SUz/dlZyJfyO16J4wAk9V0bgCbNIdu4v/L70VLQlxrT+1y629N
         Sypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1T95QWqyyB3QrSdcTdS83OdNBFUN2mcUfmPVVpeEvD8=;
        fh=zU+5UfvEnh8ksn6LckhpDQJahQTkZcgzEFVSjE6OTj0=;
        b=dP3Q4CkPF+zOS8Z4kunbx+kYzIjg5vrPGJvgcEqZL9mZCUJDEnHh0vZvAd0caAs30o
         4HcFp/pI9Gj1JxCx38pPFDpxoU2eHu16x4yFWs7oCtZpJFRSn0jzNmhJ06s+TPS0nl+v
         LsxlcyTcXX4amh1iU9unkAWzCXP3EKJVr0AmrJHHyG1gzXfwpo9qEzeiuOEJ+VthWa6r
         7oMuKQHzobm3RI6dBRsAgsezf8hMbYFeWUtv1uPehfedaaSRen2bPWeBh4A1nrBkqlrX
         Fi7zT/SVwfNTHCZG41BmE34s3Twt1rMTI8+eF22MV5hvzC8tSkpo5Hs5NG+4GiCy9T47
         o4sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=3cYvghdV;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h8-20020a170902680800b001cfc9ad74a8sor5022364plk.4.2023.12.12.00.18.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 00:18:34 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=3cYvghdV;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702369114; x=1702973914; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1T95QWqyyB3QrSdcTdS83OdNBFUN2mcUfmPVVpeEvD8=;
        b=3cYvghdV37ERhB1l50ZRA2IKMXeymmdBQ7HE4YR8gXurWvSXI0HLNzFhXy89i1aUts
         wEQj0FnpSLsqbrtw+8XbA0CmIahhYIPHVmEIU/Qyix5XwL8BE/u4gYw9+W8p83oCqsvg
         ZG7D2ICoDjWqa9CzW2+GZhoVZKXiqiKdYQN+qj1+1a+etbWVPDhmw43Z7O/AMz1wCxmI
         sq9zgEbZi7eYCEh+4Zr5IfbZBPkid0LSxut85WpYma6rJGXmn5xS5jSlBCvdTyBpEURh
         BD1wlYJIsxaDjJ+pYt3iaGpDkuAvi6YbNP4ace4b+fn5nqND/7eLppnGjla3wxBazibg
         idxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702369114; x=1702973914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1T95QWqyyB3QrSdcTdS83OdNBFUN2mcUfmPVVpeEvD8=;
        b=pFoYGMPDVu1fIjjJD3cXCA9XqNgpM2E7BKN9L0lkrvdljhpKUXGw8HcFmVyePP9cyI
         xWv2xwve3ZxDmnIcb0zNr2i7LDsBav8VrKiIP93/gnsMP07GBSwy4fBwe4+OAMuOdn4V
         0/bTqWEdSCn5shq6d/AHWGgomPdX1RfrWp4tyE7Auy3NMus78V56VkPG0+lfxz3si3fN
         ZfgmWjtG3wgqCq8ZcIYecuBy3AtMuKDXNoAKYDecww8g6e7cE3tBtnZRxkqNl2260DnM
         bjlKr/hzxidiwBx7mngpSrSlBft/Z0Q+JeUSVO/00dn5B8ldspbIP7EJLFUIpD/Y2D2T
         8LzA==
X-Gm-Message-State: AOJu0Yxw2B8MT8U8AwDMdrjKOjXJsFp++8sFfAJ2mJosevRN6l3O0wfL
	OXTHwoUMQHKgu3w6HO7tUqTaus0Y9rTt40CYJOqhIQ==
X-Google-Smtp-Source: AGHT+IECl1GgbPZCq4cTTUNez9QilmNaeqnLGkNCJnpE9EtezYZ99xe6htdNeSY+PPh4Uk+g8xR7bg==
X-Received: by 2002:a17:902:b683:b0:1d0:6ffd:9e25 with SMTP id c3-20020a170902b68300b001d06ffd9e25mr5670806pls.119.1702369113973;
        Tue, 12 Dec 2023 00:18:33 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.205.15] ([157.82.205.15])
        by smtp.gmail.com with ESMTPSA id i9-20020a17090332c900b001d07b659f91sm7986764plr.6.2023.12.12.00.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 00:18:33 -0800 (PST)
Message-ID: <947ad8b2-14fe-456b-b914-6e1c86dc27e4@daynix.com>
Date: Tue, 12 Dec 2023 17:18:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] tests/avocado/intel_iommu.py: increase timeout
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Eric Auger <eric.auger@redhat.com>
References: <20231208190911.102879-1-crosa@redhat.com>
 <20231208190911.102879-4-crosa@redhat.com> <8734w8fzbc.fsf@draig.linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <8734w8fzbc.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: E970soCLKwpY

On 2023/12/12 2:01, Alex Bennée wrote:
> Cleber Rosa <crosa@redhat.com> writes:
> 
>> Based on many runs, the average run time for these 4 tests is around
>> 250 seconds, with 320 seconds being the ceiling.  In any way, the
>> default 120 seconds timeout is inappropriate in my experience.
> 
> I would rather see these tests updated to fix:
> 
>   - Don't use such an old Fedora 31 image
>   - Avoid updating image packages (when will RH stop serving them?)
>   - The "test" is a fairly basic check of dmesg/sysfs output
> 
> I think building a buildroot image with the tools pre-installed (with
> perhaps more testing) would be a better use of our limited test time.

That's what tests/avocado/netdev-ethtool.py does, but I don't like it 
much because building a buildroot image takes long and results in a 
somewhat big binary blob.

I rather prefer to have some script that runs mkosi[1] to make an image; 
it downloads packages from distributor so it will take much less than 
using buildroot. The CI system can run the script and cache the image.

[1] https://github.com/systemd/mkosi
