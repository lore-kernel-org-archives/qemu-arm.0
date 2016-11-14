Received: by 10.25.150.194 with SMTP id y185csp1173178lfd;
        Mon, 14 Nov 2016 11:44:47 -0800 (PST)
X-Received: by 10.37.162.70 with SMTP id b64mr2629559ybi.34.1479152687631;
        Mon, 14 Nov 2016 11:44:47 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-yw0-x233.google.com (mail-yw0-x233.google.com. [2607:f8b0:4002:c05::233])
        by mx.google.com with ESMTPS id b202si1576196yba.189.2016.11.14.11.44.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Nov 2016 11:44:47 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:4002:c05::233 as permitted sender) client-ip=2607:f8b0:4002:c05::233;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:4002:c05::233 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-yw0-x233.google.com with SMTP id r204so75189788ywb.0;
        Mon, 14 Nov 2016 11:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=eecslRcSjizpo/YsF/VoMyGB7ZcE5izlsFmexaUcvfI=;
        b=r/hdoej6xdAVuPSZWyehXL+6JXZjIWWaGj1iJacnQ455zd5VwS9432Rl329S9ZCPiJ
         Aho5NXL4bzJF3D4HZtjUGSSfRDp7DE8Ucw8xpvqXlSSPYhkcndEbFc3wJjPQxLoNqXkS
         LwYYDsGcKgV4vBtTdW8GEkVGRqUKHGfHq5s6PcoUd4BYk0lsdTltZ4SsWEnfBDLZfIIY
         gf+BiUXnyr9NDx+9ZxDWMB6Zj7uxu2DtdnPloKk6F5ZFoSVId0xlVa3Z7wlKG3VVMFZl
         Jstjv3jZufTHuvYnTp+7UyNGDvWEHQuqeWoat7EC4OyfakNCDOGB+q8yuDH+5g+9a9Vo
         cBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=eecslRcSjizpo/YsF/VoMyGB7ZcE5izlsFmexaUcvfI=;
        b=JuKYaH+FqsZ2EbbQ0Dlq/WS2rPyg6jTUc2NLnyREVvxvmv+w3ALAglQfo/EVncaV2Q
         6TJiBDRW8k+BAHACasuyYcIyEBffhkdhuWYJ/sOGmc9FwvMfWKERLwKupZ/5WmuPRu0O
         2cCA4u7kNYNd5SjD1znS64eBK4IsO7B/YLQs0xLbbJlfH+sCTDmY17HE8rLdww1xucfH
         N7SsOtgsYyyGx4fQLo3yeYjF+lTyjXFOLl+bFBi6NsSR+eLY5WDBjantD7lYUP69Jw1v
         ySnqZQDtnOFDkKwdafNtbUvvjWkRWuhEtzWOYZ4QdIAETUSG188L1Vms45stPEUDbKH+
         T0FQ==
X-Gm-Message-State: ABUngveqv/UJscT+ZMGChZXC7C+pRjX69DSatGgPcqtWtjkEE0LJUG5ZopnSfaDmWgup+g==
X-Received: by 10.157.13.23 with SMTP id 23mr7317317oti.149.1479152687198;
        Mon, 14 Nov 2016 11:44:47 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (mf25636d0.tmodns.net. [208.54.86.242])
        by smtp.googlemail.com with ESMTPSA id w129sm6671603oie.1.2016.11.14.11.44.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Nov 2016 11:44:46 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC 1/2] qom/cpu: move tlb_flush to cpu_common_reset
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20161114174010.31040-1-alex.bennee@linaro.org>
 <20161114174010.31040-2-alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Walle <michael@walle.cc>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@imgtec.com>,
 Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:ARM" <qemu-arm@nongnu.org>,
 "open list:PowerPC" <qemu-ppc@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <88351c7a-4b33-b3ed-962b-cf7d71ea71e0@twiddle.net>
Date: Mon, 14 Nov 2016 20:25:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161114174010.31040-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Q0CCg7mWYnM8

On 11/14/2016 06:40 PM, Alex Bennée wrote:
> It is a common thing amongst the various cpu reset functions want to
> flush the SoftMMU's TLB entries. This is done either by calling
> tlb_flush directly or by way of a general memset of the CPU
> structure (sometimes both).
>
> This moves the tlb_flush call to the common reset function and
> additionally ensures it is only done for the CONFIG_SOFTMMU case and
> when tcg is enabled.
>
> In some target cases we add an empty end_of_reset_fields structure to the
> target vCPU structure so have a clear end point for any memset which
> is resetting value in the structure before CPU_COMMON (where the TLB
> structures are).
>
> While this is a nice clean-up in general it is also a precursor for
> changes coming to cputlb for MTTCG where the clearing of entries
> can't be done arbitrarily across vCPUs. Currently the cpu_reset
> function is usually called from the context of another vCPU as the
> architectural power up sequence is run. By using the cputlb API
> functions we can ensure the right behaviour in the future.

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
