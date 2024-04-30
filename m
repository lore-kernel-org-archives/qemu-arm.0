Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2814069ejb;
        Tue, 30 Apr 2024 02:40:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOome1pVjwj9GyCnQEjlHqiuR6idq5HZr6AcKg21JAbfyOZlGhjNKlpFIBuqW5HWMM7qzFP96KHbGYoyvsfrG4DB3KZCzi
X-Received: by 2002:a17:906:48d4:b0:a58:bd17:f96a with SMTP id d20-20020a17090648d400b00a58bd17f96amr1521463ejt.36.1714470045344;
        Tue, 30 Apr 2024 02:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714470045; cv=none;
        d=google.com; s=arc-20160816;
        b=eG0cSNS6UurrG40dqmxPBwWAIM8TFq+HDP51f/qJ6NzVappGP7hwovlA02smgu3LJ+
         jz56TZPnhibAWEO3y38HHeuMyQvkMzQ6vUO0tCMgLZI8cu+Gt0VgXFOIx9GSkLZIb9yO
         s+LMeUbqfH61bxgUVFUOrxI+i6DnRNNpV5GVMl5LMPSqBMOdkXDEafYXCUVzVsPOO+6O
         oCIUdDlAgMU0YuKX7pWq1OVV/wVMqqrGX6VRnP+JXJxjrricQ8xpda/dorI0kgzYUvcT
         +iNW6OSyY/4LWN09SXF1gBil3rF/8mI7NLXOLWJa3/f76v5UuoKsSTtasoua1AO4QZwv
         Ddww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WCW36M2OPMJQEyyFgNdC/dGiDwonm3j21cpSR92e9XQ=;
        fh=ZZ9+5PrRArRlrXN1PNBN1MR9mosNYdWqTZO6rCqfiU0=;
        b=lTLiDnouMbIFNVVLrNQC7CeV0EEYHNGPwUx0fyIccllwYQWQhxPn8jb54/Y9Rpa6RW
         Cg0AwCQx6llM8uxSRgHKq/0JVRw1DIAu6bN7++Xk5bn8P4fNAOWXdgDXbEVdSTqnqfrp
         atW0uLpiS2ANHZZO/7+ZvMqQGuz3uWWoEPjIRweODImf7w/1YWFKz6HqEAItz3DK+ez5
         WTbDBfMjcQfALtyL8xRppjAAIg6HaaRvtqZGTv4h0K3JAb6a7QJlF9FgOc9eLd0JEjQ7
         pM4duSC10VGb3txreMf1Wii65tWm2GpVtwu7kKPO6alr3Nx2a9NrjtdgV3avfGNswmj+
         d0wQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aL9i8wsa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ku16-20020a170907789000b00a58ff191bd4sor1244022ejc.10.2024.04.30.02.40.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 Apr 2024 02:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aL9i8wsa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714470045; x=1715074845; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WCW36M2OPMJQEyyFgNdC/dGiDwonm3j21cpSR92e9XQ=;
        b=aL9i8wsaAvUaqCTU2VNCWxJu/11oMlaINkkZU1c6JUcIBTNFrl6SC9+YBkA24M6ccf
         Jvoo/YkYh6xFPuAZu3PX1nVozUx0IoCty/vJ4zg6eLzfnXZc2b5NJ9fpr1RzpKnC0rJ0
         O2ORUN9Nlj50NNqLFJwitc4XXBVbWO7iPgOg3kje9plEvlN3sMrJsAER7HdsMSfym1qu
         VT0wuXghVlescE8FC2/cz4pghqy4WMPZzp2tzubqS6KmVLYGxgMtRFeCHR6fOVWlZbvl
         UXkoT67UiLsGpr78tbABs96griYM7OZOrtcv25i1lloqg5ebIHXG1MCRBRoV1abvC8+d
         LJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714470045; x=1715074845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCW36M2OPMJQEyyFgNdC/dGiDwonm3j21cpSR92e9XQ=;
        b=mdkb65kle4bdbyNI2VeHj16cbzXTZibiHkLFz13IoyUXk71Bymf2qnzBDx3c6qDSh2
         t+Wxpy62Bg2+31WnlGHPGXylTm7b2wjDNCURqTWmjLpuS8BXOpwoeu5gdHsdIY/9f7eF
         3IKXSR2rJVGO8HSa24bSlItybh01ZSVhCOmpTLBYFHKQfZxCMM1Uy9ozKemC7RRwMpjU
         blA9og2LmA84ARwgU5ofJVkt/F0hYslqUw6lWq0xbAV3ExFukWj6jiKWEHPrw9tdABxC
         qqKfgo5rEoMyIulqc+9/VR4VoptkDgNuR8DDCzMimoWRSOzntqdXgvtQnbAeJWtR9MDh
         5Xtg==
X-Forwarded-Encrypted: i=1; AJvYcCWtiTJ6Sn/NRZeWjOd5ujk8AikA662kRD2DC0NrCwjE1NBjZUSwlrKTeCeH6eLWONgBqtElaBxebxn4b2XMPmRScEnZSCwx
X-Gm-Message-State: AOJu0Yz+t9t4JenmO6jT4gCNL4l4ZV5H9vfdJALJ4zy+yw4WL1W/BzTK
	xbtdvsTn3kqnW/WHWTPuQ7cwykDBT+8PBjkipfkdtyd0J/wGYAUtOKwMl7Hndl9xdg==
X-Google-Smtp-Source: AGHT+IG7XLmwO7QxuzgXq2SVqqslj4FXwQzCThn2wfkH4A9JCUY6sNp/icquTpaem+8tzcmU+J8LRg==
X-Received: by 2002:a17:906:5851:b0:a58:7ce0:8e13 with SMTP id h17-20020a170906585100b00a587ce08e13mr1469299ejs.34.1714470044921;
        Tue, 30 Apr 2024 02:40:44 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (mab78-h01-176-184-55-179.dsl.sta.abo.bbox.fr. [176.184.55.179])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00a58ed644d6dsm3526332eje.127.2024.04.30.02.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 02:40:44 -0700 (PDT)
Message-ID: <e0e836cf-f080-45f4-a71b-060dd2c90279@linaro.org>
Date: Tue, 30 Apr 2024 11:40:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/about: Automatically deprecate versioned machine
 types older than 6 years
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: devel@lists.libvirt.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
References: <20240430064529.411699-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240430064529.411699-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: onhNa0wnN1S/

Hi Thomas,

On 30/4/24 08:45, Thomas Huth wrote:
> Old machine types often have bugs or work-arounds that affect our
> possibilities to move forward with the QEMU code base (see for example
> https://gitlab.com/qemu-project/qemu/-/issues/2213 for a bug that likely
> cannot be fixed without breaking live migration with old machine types,
> or https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg04516.html or
> commit ea985d235b86). So instead of going through the process of manually
> deprecating old machine types again and again, let's rather add an entry
> that can stay, which declares that machine types older than 6 years are
> considered as deprecated automatically. Six years should be sufficient to
> support the release cycles of most Linux distributions.

Thanks for taking that out of my plate :)

IIRC 6 years was because of some old RHEL version, otherwise could
5 years be enough? (maybe it could be good enough for this old RHEL
version as of QEMU v10.0).

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 6d595de3b6..fe69e2d44c 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -220,6 +220,17 @@ is a chance the code will bitrot without anyone noticing.
>   System emulator machines
>   ------------------------
>   
> +Versioned machine types older than 6 years
> +''''''''''''''''''''''''''''''''''''''''''
> +
> +Starting with the release of QEMU 10.0, versioned machine types older than

Why can't we start with QEMU 9.1?

> +6 years will automatically be considered as deprecated and might be due to
> +removal without furthor notice. For example, this affects machine types like
> +pc-i440fx-X.Y, pc-q35-X.Y, pseries-X.Y, s390-ccw-virtio-X.Y or virt-X.Y where
> +X is the major number and Y is the minor number of the old QEMU version.
> +If you are still using machine types from QEMU versions older than 6 years,
> +please update your setting to use a newer versioned machine type instead.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
