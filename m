Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2546454dye;
        Mon, 30 Jun 2025 08:25:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVM5zkNFYT3VMY0DryFDIVwJBT3DXTGO+Mgyb744QFfCq0nYIcdh8BLvutJBznEjbu1isTEJd1qjjK6g==@linaro.org
X-Received: by 2002:a05:690c:60ca:b0:714:586:86fc with SMTP id 00721157ae682-7151715b900mr205893807b3.16.1751297112469;
        Mon, 30 Jun 2025 08:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751297112; cv=none;
        d=google.com; s=arc-20240605;
        b=XPCBpqbb9EI+gDam2RCrpLkzlUnhFvpjqSa1vHQBz+36zvx6Pq0Fax2ecCYB4AmgHR
         Nv6oR9NtZpp4wPfHos6kj2CKPC+jr+YfEe8XsP15zKm++Pxbxf3bpN9COr3vIggS3sMT
         K6hXBcHhyRXt9Ao5O7poR34v0nLSOGsci7/WJK3+73MPZBspIS4SuOXv5acu3l+5vKAh
         DpipeR6drwuQL6PVYTHJ3n1otpRhBPxJQp1ApHyn7nEk7+f5ub9qVnJVp2jXpQ93ymFk
         1+2KcpiJ2dF8ezWmFtH95hAyNhU1lKKNwwkkren72b/vPfTxs/FsWUGuisc7Wc8GGEnF
         kCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I5h/4tT6uYWyspNT7UisC2lRP7Ask7OpjyLTLtPE4HQ=;
        fh=EA769Muqs2KHZq5K986g6Hp4V1jxtMlIEMzwKE/YW00=;
        b=Tho8C8nsf6+oQ+/IC/5qpwKUgRGlGluli3eKoJFUq0YrtQMly9l5y7ilvIoGRd26mU
         43Q0hDvundhwI5jKk7MeX2PiLHNmMbFP5KkKdg5E5DG71nGXQvjcozjfY6dQvzmseKxs
         4IZZshHhAGbNRtYqkR8aFihb1dPhPe7HkPkW3ebPhYDIECxuKy7InNlJlwH8ZeXzNm45
         BBqarwhFHg7L6ydfoMcN1SwGgw3wKJD4on/KUHdlGuULVPGruTfkeL4jKLcH+KQ5Lx/s
         zB+eEQ06guSRCdlaB+fXEg2VorP5xDAYoyY+n+TXYlyA4TSGWiKALPsYZg9Bh/TcrzjV
         wAcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QIxPz96p;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515cc080bsor48344797b3.13.2025.06.30.08.25.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 08:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QIxPz96p;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751297112; x=1751901912; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I5h/4tT6uYWyspNT7UisC2lRP7Ask7OpjyLTLtPE4HQ=;
        b=QIxPz96pY0qbxmIMz1XCSFpz3REAzdSm9fXXtASFwesZBsyRPMFzJMEJ7QFyRT/6Jm
         aIIv1PAcYMnc4pQwYhANZhYZXltqgBbzys3HJGXchIXHQ6ZVaT4VGGKoEkKt+f9VVgWT
         PlmtQKu05wK+L7pw6NW/ylFcO/v7mWplgdVwg1neqBCzI1jTQgRU4SKovbIceXupDW31
         QM6FRuhnLqKx/MoqlmZ2Ew1Fb/Qeg8O84C8qscLbaZRakqAEAmcdDuZPglcKEr3scL6M
         HnA/iGpFsTLnj0GxwHfxCF+Cyt+x3oiGeV7qnyeqLBkxxPj+X9ybWWP+Q5m44lNDaG6j
         +qWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297112; x=1751901912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5h/4tT6uYWyspNT7UisC2lRP7Ask7OpjyLTLtPE4HQ=;
        b=bm9ELWRHXPu20rNxyQym7YNOar8xdKwwdjwdW2REx0dmM9tsRLZib+RpkRVZpsi4U1
         JXwVOahYzsi4DpMrXy9b1zE5DcbkXlD85fGG6oB/q4EjDbS0ft/+MrmkzIu6zKP04XsM
         xPGTmtqmz0oPZKX+1jFfxqevPytXotAYJxcXDJNsewvXALz1qhRv/qL7UBLmL4kwSQTA
         uDG+3PRpajF8EIz3l3yUTtsR5vNxJMDtjS4QelrYgFcb+VSlLEeWw8AcOI4x9+xUKWEM
         zHEXTXUDNYKvIDIPlc+k9kQGy1gRdLYzb62j19N44ansMPYuP/8lLw0D0E2n9A26XXvs
         7bHg==
X-Forwarded-Encrypted: i=1; AJvYcCU34M3inY5QLBG9D6Ei15AZpd+Xfwv7L/alt0CJFvYKiNtTU2UIOOF67L+HWjCGV1Elvm28EOXsChHnEQ==@linaro.org
X-Gm-Message-State: AOJu0YyKO9CrzFvwcMTfqbzLNZns7FNaNxaTXUkqHE3Xlv7AOwqEUwEQ
	FPA2r3FHQD+C/cLarLYxpXZb8EQ7ZHTNfVEyN5ekBDpa2y4KZw+oFIwsgJmPF+aW8vIHANNwTnK
	ResEvRPJBgTia750GQ6954JYbeVcsSWgYSNCcJt4TCwzp
X-Gm-Gg: ASbGnctz7KwFcFIGMVoRHIrWx19F7dgQMRDKWM7Pjmugaf3Q35/S7D5ztlctGPNCrde
	O29D4lz7Qbvk5bzPHyXsxG1t3JLNqFaVtOO+C6tbuWQy2yKNT3JdFxfnOScAKU6byOw282UUiCP
	OM389gI02tiv88beoqmDg4kUVcG90aBpFCAdons085vr9q
X-Google-Smtp-Source: AGHT+IHbDKkB+v2UqZI/qbpQTn8DDgm/V9SQW5oPnLxD8oZI4VSXOLZFRxjLJnIc+/ugHtVSQMvSaqZsLIPCSyZdD+4=
X-Received: by 2002:a05:690c:dc9:b0:70e:142d:9c52 with SMTP id
 00721157ae682-7151719cf61mr215756077b3.22.1751297111869; Mon, 30 Jun 2025
 08:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250617153931.1330449-1-cohuck@redhat.com>
In-Reply-To: <20250617153931.1330449-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jun 2025 16:25:00 +0100
X-Gm-Features: Ac12FXw50PpiOmK56GCGuI5ZjfhKrVyyA1XeCo2Esd3LtbqKHdL_R1y58yMuILw
Message-ID: <CAFEAcA-Zuqzqg_qUQh+yT4BGqEke3=OhSr0iSY1ztPtVV506sw@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] arm: rework id register storage
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org, 
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev, 
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, 
	berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, 
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, 
	pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: zdTPKMxi180n

On Tue, 17 Jun 2025 at 16:39, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Mostly addressed Peter's feedback:
> - make sure every inbetween stage compiles (also fixed some bonus issues)
> - try to make the scripts more robust, add a note the generated file,
>   and make sure to grab only registers we actually want
>   - I did a half-hearted attempt to use python instead of awk, but I'm
>     out of my depth, especially with the script that will be used for
>     the register fields in the cpu models series
>
> Also available at
> https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v8

The script seems to be creating array entries for some registers
it should not still; I've left comments on that patch.

I've taken patches 1-11 and 14 into target-arm.next so you don't
have to keep rebasing them.

thanks
-- PMM
