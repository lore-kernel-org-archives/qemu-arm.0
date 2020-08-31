Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4023779lfc;
        Mon, 31 Aug 2020 14:46:40 -0700 (PDT)
X-Received: by 2002:a17:902:7c14:: with SMTP id x20mr2520691pll.212.1598910400042;
        Mon, 31 Aug 2020 14:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598910400; cv=none;
        d=google.com; s=arc-20160816;
        b=IveLmFBEGi2suGSqfZxpETaHSSIWaZcHGfA7KdHm6lVkSAvWxEV0tC5OmV3AhcIwK6
         5tOHDHjJ1cIWSUMhok2iyfXk84Wp2qzqiCEfXZOyDVpmW0FpXyb13F8wHC3L7sv90yhh
         AFKJ3oY6RNxC15TMfO/ZKwv5E636Dza30yKB4wVaKtYBW1+HT7f3qirsk682NW2GiJi5
         S1X83PzFhbj1Q3dsk0HMa+8HqTTPlU6m5Gy6zdSI0dWa7BF8b7Bia6ZEnbdnws48a1r5
         3P8eIVxv65U+mb2NesVrxGi4JgVe8jKlPpkAm41LOhIBua8uo7HNYmiHQzO7LNcntajw
         iLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=DAMvSkP3ycghdbPfao8tjevb03zNd12UoRVFNvmY36E=;
        b=l6gE5EoKVowPQLh2i7uDnwK7QaQoOm25fU6WgF9fsC1FnFp7JzJBCUIhDr/yqHhYBp
         dGsCoSf833bGQQsq+2ozIK/4t/8UlRfOnq5VTw1TvZg4UyPwvuAqPV0XJ40SZP9RnlKI
         Wl7amzfFh5TuvfZiwtbaBVu4yMMo2r2VSYX9ubZ0E9OOhixtFWr9x2iAFatBLVlfDx4b
         UUAzCvB5wpsj0RIdIlaSJYNxZWZxPofJ7pi9y2oBPjGUuCqtr6a3Ch8BsdwJ4KtAV1t6
         TZ5IYZLSFVKK/VoqUOtafLGaxEqO2sla6Judj9mMZIIMrcftuYQTjdML0LUUaKPEQELb
         Y4pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iPsWc6iQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i124sor3434463pfc.89.2020.08.31.14.46.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Aug 2020 14:46:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iPsWc6iQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DAMvSkP3ycghdbPfao8tjevb03zNd12UoRVFNvmY36E=;
        b=iPsWc6iQv7QsltWoK3+ijsoP1moLRxpImZEue8X7GtJcystyO4zIlXWNfSM09ZyQ1W
         KObxSCIK7DAYzLxueNwh479O9PGvts2PRq+Med7mv8vZPKxH0ZomSiDXToUuH41rwCdy
         HSgc9DmDv4pc65o9X2pjCaVgXOuZ1KymoXli/ujb7Zs/2637Sms3Omh3BEv2CTFga1/S
         kV+TW/21x1hCGafCNv2ekSBaKal/Ov6PYK52e9NjGNPjv9OfKuMsh5smsTmethxyZf8f
         5CkZicR9T2CRI2shE+gRFuf1OKVugZezEDrlXXddGN4iPXttG0yLvfBDbXWxZ4AGJejO
         DFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DAMvSkP3ycghdbPfao8tjevb03zNd12UoRVFNvmY36E=;
        b=M0100jrH03CQgfRLpyQT1d4q+O9d0ZAjBfo48C4znIQLqafURBN/sa4PUbZzcep/pR
         VuuqzbCvvV87PI5kJuOGGUCfdQlyifq58nCEOw1oeU3O0ZEHt3SwrcwBd6vhqtMNb3mm
         XRyMBGiS3q1DTpe+nRExfkwk1O8DjdjfgsXqm4Wjk70OZnWqx0yTYfZZutMP+w2JRRMT
         aVe8Y7Ml40xnmoLsPJxrRjD1K8MXfceiQiW5S8yEcW1lwF1qU++tajgJr9IMT/K9RX0D
         q+68mmLfxDw5G5bn++WRnOHQ6a7lA/r429uYW/YDPa3L30ip+yHJ6vuZ1MLQqXt/Xkst
         1fTw==
X-Gm-Message-State: AOAM533qEfyDI/r1hjy7jdTO8C5JTmOc6x1hRxlgIpAYQcCqGgCQKM5F
	KL4fSord23Y0ROuu6EDWLkMKCZLl
X-Google-Smtp-Source: ABdhPJwVMWj8oUCpSfve9TEoH3FHJ80jj1Hv+2mD0LUDgJqyvyFzzmUWM1IPifEPUU//Q9eLHkn1CA==
X-Received: by 2002:a62:444:: with SMTP id 65mr2964961pfe.86.1598910399504;
        Mon, 31 Aug 2020 14:46:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id gm3sm535739pjb.31.2020.08.31.14.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2020 14:46:38 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] target: rename all *_cpu_exec_interrupt functions
 to *_cpu_exec_interrupt_locked
To: Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, pbonzini@redhat.com,
 Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 peter.puhov@linaro.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20200819182856.4893-1-robert.foley@linaro.org>
 <20200819182856.4893-7-robert.foley@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0ef04de1-4dd0-e432-d1c1-b5672d276e1b@linaro.org>
Date: Mon, 31 Aug 2020 14:46:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819182856.4893-7-robert.foley@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: GhAL/9WiT0K0

On 8/19/20 11:28 AM, Robert Foley wrote:
> The rename of all *_cpu_exec_interrupt functions to
> *_cpu_exec_interrupt_locked is preparation for pushing the BQL lock
> around these functions down into the per-arch implementation of
> *_cpu_exec_interrupt.  In a later patch, which pushes down the lock,
> we will add a new *_cpu_exec_interrupt function, which grabs the BQL
> and calls to *_cpu_exec_interrupt_locked.
> 
> This patch is part of a series of transitions to move the
> BQL down into the cpu_exec_interrupt per arch functions.  This set of
> transitions is needed to maintain bisectability.
> 
> The purpose of this set of changes is to set the groundwork
> so that an arch could move towards removing
> the BQL from the cpu_handle_interrupt/exception paths.
> 
> This approach was suggested by Paolo Bonzini.
> For reference, here are key posts in the discussion, explaining
> the reasoning/benefits of this approach.
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00784.html
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg01517.html
> https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg08731.html
> https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00044.html
> 
> Signed-off-by: Robert Foley <robert.foley@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
