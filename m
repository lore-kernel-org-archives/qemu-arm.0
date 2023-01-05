Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp61815ejb;
        Wed, 4 Jan 2023 21:12:47 -0800 (PST)
X-Received: by 2002:a17:903:2c5:b0:192:cf35:3ff8 with SMTP id s5-20020a17090302c500b00192cf353ff8mr13046162plk.21.1672895566963;
        Wed, 04 Jan 2023 21:12:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672895566; cv=none;
        d=google.com; s=arc-20160816;
        b=n4fiu1SY8yf6A0nFzMeVZGqNiRcnrVPR+fdHQXs/WCceAQ6mRvL3xi0AyIHh+Yna7R
         CVMDXeF/yEq7mNYaYZQAhLbWf///cDVI/2NbWAln81lSDoAD6yKnAv69+iMi8ez/VddL
         AUn17TDZ3gpIZSjRolJqUyv4GghszLl9r6/BOAtKdRDkegY3SIbIDgDTaHW2NkkVvT2t
         vLbyO7A+gUAI0ivFcKRZah1rB5Bre/i11tuLLeWYjMF9zvZOpqfaEcbW7e3hUy1qpZiR
         qFU+QI90a5K76xV/FbvTM4lYQe88DAmcNICd8REOtejFCAyqpfKPq2Jv+7WHeJQzC2ay
         Ei7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WyIGvcwADA/FqyWombW+s1KNMFJ+ilMNg7bcoMpcjtw=;
        b=RB2dpjYy0AwbH8zbfZA2MFa17Qt3BPKeL5/s5ynRcr4bN3Y59z0QpcQKSQpmC3h6W1
         DwmzTiAtBlRDtw0F3qUdidv3v0s5hRRhFz+BDy0Y11t0vgO8l7sLhzmwkQP0S+dgG0yH
         14ArDfKQSJ/QMSVbb4d6tdmHLb7zBTKlVt6URKagoe0xmInBIM86lJcRpUNzm2mOoIgx
         g57uLZOv+pDHJJAffMrqJEnFkdPgTmRAWnInzh27tjxcPDGCU+EMptuy4JgxBNJE7QIa
         ZWh/9IHOdzZWi/rs/x7mniL1iQyVcbpxx5ueK3O5/QUplKCNZipt9TAns4ldDTvqF7pt
         uydQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahbEU2No;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k3-20020a170902694300b00192ae317cbbsor6495876plt.184.2023.01.04.21.12.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 21:12:46 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahbEU2No;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WyIGvcwADA/FqyWombW+s1KNMFJ+ilMNg7bcoMpcjtw=;
        b=ahbEU2NoIPfQMx6if7IpeB2siLtjOd6ej5df1sqO+C/FvoQVlWZteyr9bJlap2cqCi
         KSpJEQP7qqwqwEeLFOWHbWDj/FeSMCECLWaAe1zDfWmPH/YT9+7Bxaij8ESs4ChMFiyW
         9xfZO2Ocwaoau6RkzJIkkuivaiJ3p4Dp4Sl/Rl3ZK+V+yAqiaCjLx4ReXT+QXpsQh60e
         XgnT1h6SBEnNLLVgf3RZOSI1OkB4Vh2vCuN1xGxbjeXA3UHjbEK6bc5BE9cIhh139smT
         3KNjS9SgvX5nfpTZGC7pDY0m3+vtTsYgCmKpFvQM69N56fhGTiwCzXKiV306Y0vd0Iyf
         Vz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WyIGvcwADA/FqyWombW+s1KNMFJ+ilMNg7bcoMpcjtw=;
        b=XIgontH+xnE9r3T29Ts/VH9AE2EjY8NU852okTw1ldvcWUvh8hKwvRFjUscMCq4MNY
         DlbPr+iVpIoNHU1DG/Vv29CfgI8GphUF1LzHHkIQXgc9YY7iLz47kXcLvMrww8Eax9ym
         S46RFmxx4XkPGVctuRQBjO889SGA2njKxOn9stXjc7ebRo1lBjEF16BKHB0cmSb3c+Gh
         FEWsCHjciK7HUn4XxQTJx1JdeQ9/6/QguuxbDIRqGr8R6VAE22mZuMexiAU4+tvhMvQE
         xRh1M+wvFr/BbitF3rIsXmPQdUrIfnJj4bTpFWhEnVVd6N11FAoPVWR1RVdlUTBDC5q4
         4Cig==
X-Gm-Message-State: AFqh2kqkFxazwAS+SYf/dP5mWXtfVjGfukbQnnQH8AwOpbHX1KelUAEU
	18bqO95Y3r5Fe//dnAeYOx6rTanohKFhNt699/8=
X-Google-Smtp-Source: AMrXdXuajSgUQ3j3n1L4ajCWjSUX3KHq/m9TYvd5qrs7tlXIhjwS23UjjMJUmUe2CJjbYHNCL96F0w==
X-Received: by 2002:a17:903:32c6:b0:189:df3c:1ba1 with SMTP id i6-20020a17090332c600b00189df3c1ba1mr70485336plr.38.1672895566507;
        Wed, 04 Jan 2023 21:12:46 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee? ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
        by smtp.gmail.com with ESMTPSA id n20-20020a170902d0d400b00192fc9e8552sm481990pln.0.2023.01.04.21.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 21:12:45 -0800 (PST)
Message-ID: <326b71c7-dfa5-25d3-89e0-b3fbf50c1e26@linaro.org>
Date: Wed, 4 Jan 2023 21:12:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 26/27] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG
 code
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-27-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-27-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: CxCiYVGRY1PV

On 1/4/23 13:58, Fabiano Rosas wrote:
> This struct has no dependencies on TCG code and it is being used in
> target/arm/ptw.c to simplify the passing around of page table walk
> results. Those routines can be reached by KVM code via the gdbstub
> breakpoint code, so take the structure out of CONFIG_TCG to make it
> visible when building with --disable-tcg.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
> This is the least painful way I could figure out of doing this. Let me
> know if there's a better way.
> ---
>   include/exec/cpu-defs.h | 6 ++++++
>   1 file changed, 6 insertions(+)

Nack, I think we can do better than this...


r~
