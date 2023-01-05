Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp64355ejb;
        Wed, 4 Jan 2023 21:19:43 -0800 (PST)
X-Received: by 2002:a17:90b:716:b0:226:cbb4:1451 with SMTP id s22-20020a17090b071600b00226cbb41451mr986286pjz.37.1672895983720;
        Wed, 04 Jan 2023 21:19:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672895983; cv=none;
        d=google.com; s=arc-20160816;
        b=tWt25c1ctlu4qWPFydowWofUiFWTIxupf3zC+iE/yMhlQoZQ26Jo+rOCZbzO9valU1
         BLXnJ8oxnGpZgB3aBdkfJHETy47cSF1iDnUJwaN3Qed+qN/QaMazrVBc1qJz/12RWb3G
         UQV7VlujmgNRQdnMCY5QrH457Eil+bsLZgsFIWzNCcfhFbQEst8h5VmA7r+oRaYfc2tm
         1p+nXuNsccSzqEq03DmkS8ZbTlUxvH8BB5CIOP4ptYciuyVXV6W9xH28URRkbpCmYbrh
         sUiBS7h2Q8ZlwtGyS4H0HaH8x2HS1vVYtd1fIIR3WgTtzb9hqDPdk3mZGR/UaqyLluoi
         Oekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zlWWI91i6rQkNBj1sgrfBtYBFXYAAqNcoNe266kSgvA=;
        b=YCrlOr6TbJrCs+Rj+UV9zWE1NdmOCa2OEYjd2thCRk/hvGOFOCoG1rUWz1dCir7FDn
         yvznckq7ydUoLXIuSf54QfJyszlynsSkr11InNSUxRdB9Mnc3UWRw/a57V+bNII5+Dvh
         k0epPws8MAmNjz2+CfdyuUk5AkQQwFQLqGwpTfELEQX8z8LmOmcy0y0wkRLPGyzbdrjz
         eZb6VGtq6GQBP9g2hylT0feh1OuJzD+1PblkLvNJju/0esojMuUuFDSRn9sncfSmdneZ
         YTVzVKdSKAaSweknMo5bWBye1LDNse4CzF2WWGokdjMPZKFKuVlLgd8FHDX/OqU68K/o
         EsAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fekFMaff;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r5-20020a17090a560500b00223b1d8e430sor394266pjf.42.2023.01.04.21.19.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 21:19:43 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fekFMaff;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zlWWI91i6rQkNBj1sgrfBtYBFXYAAqNcoNe266kSgvA=;
        b=fekFMaffFrmRP5RDYTpjBME0o465xwT5qO3ifL4oV0l65nHgCmPF6S0g3VgM9QMUXp
         8/zZqSP9zjwqcJkcE36XVEGTkcLHEkSuCYzJfb75J/SO9IRITmGBZ3ewExLmxDHK4cvD
         O2k3SjnarnAkmXmsf0AlSTuUu4WaS42RKT3KTsfPglk0RymlxpNNHkBO2o3KTRFVLeJC
         746OIxTjxXIsAPvkzDMKgbDxVznX3kAjCOnRo/LqfXF9SPI3YNj7IT4YD3hwaLeAPnZd
         Qpn7baDguQ0Gm85NZsQ9v6gPXArGRdjNgl7BIvR1TG4hqkktCNnz7Eqha+l297G8jAn/
         gpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zlWWI91i6rQkNBj1sgrfBtYBFXYAAqNcoNe266kSgvA=;
        b=pjcnHl9IiKWr0J89jyUzp5iC0dlCPGx7Qy8PZvfrKWrAfrFlUywZNLgt3NRRn+n51o
         7cyQUdsK6URbYsuG0F98IPwFPt6m+ZUN7WJBraQsUIowK42skjIxA0iw5wOpBcnd+aql
         AnknC318cV4kHrzDeNg6zWTVb5dTxZlLhQdKPGMVVKRZfcMOdA3aIQdqbhKx5RW+O64d
         +VmEDKJtWdCOQveM6LVtzVhpp7lxQN+MklNEikcr0RTzW1NoWt7wgCssMNdHN4kzUMU3
         AYHyzhGQELwD/eDHuhGWtEM2NaZ6ULeJ2ZmxGVa2YbBgQC82zcr4gHfxtZJParlG3xTC
         DrJg==
X-Gm-Message-State: AFqh2kqpD4wsViVuTFjHpB8AKTE8UWoqw7WkFoxopMNd0MJoGIOxIhLm
	RBAL4Af1bZ3B5KJKzQj+GkzKNp2b
X-Google-Smtp-Source: AMrXdXsj/Im8lHWYaOWRYHormgRNXgzPoBUb2t9f2A36eS2rejbVPOLf326tex69LvlRQYxVd72cVA==
X-Received: by 2002:a17:90a:a4b:b0:225:d285:acd4 with SMTP id o69-20020a17090a0a4b00b00225d285acd4mr42635636pjo.32.1672895983209;
        Wed, 04 Jan 2023 21:19:43 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee? ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
        by smtp.gmail.com with ESMTPSA id ha24-20020a17090af3d800b00225d92d69b6sm441580pjb.29.2023.01.04.21.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 21:19:42 -0800 (PST)
Message-ID: <6cf2f6fc-fdc6-6903-4594-3f9b7be3befa@linaro.org>
Date: Wed, 4 Jan 2023 21:19:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 27/27] target/arm: don't access TCG code when
 debugging with KVM
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-28-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-28-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Hlp4GeKWfznD

On 1/4/23 13:58, Fabiano Rosas wrote:
> When TCG is disabled this part of the code should not be reachable, so
> wrap it with an ifdef for now.
> 
> This allows us to start using CONFIG_TCG=n (--disable-tcg in the
> configure line).
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> As I understand it, only a small part of the ptw routines should be
> necessary for use with KVM+gdbstub. But I don't know enough about arm
> MMU yet to make that distinction.
> ---
>   target/arm/ptw.c | 4 ++++
>   1 file changed, 4 insertions(+)

If we ever hit the assert (and I can't imagine why we would from kvm), we could adjust the 
preceding test vs in_debug, which would take kvm back to the setup we had prior to the 
rewrite.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
