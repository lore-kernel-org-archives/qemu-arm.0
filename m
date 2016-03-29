Received: by 10.25.208.211 with SMTP id h202csp2198049lfg;
        Tue, 29 Mar 2016 10:58:23 -0700 (PDT)
X-Received: by 10.25.84.16 with SMTP id i16mr1799484lfb.88.1459274303254;
        Tue, 29 Mar 2016 10:58:23 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lb0-x243.google.com (mail-lb0-x243.google.com. [2a00:1450:4010:c04::243])
        by mx.google.com with ESMTPS id f138si17711691lfd.83.2016.03.29.10.58.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Mar 2016 10:58:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::243 as permitted sender) client-ip=2a00:1450:4010:c04::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::243 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lb0-x243.google.com with SMTP id bc4so2130148lbc.0;
        Tue, 29 Mar 2016 10:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=MoflKOfjICHD4A/6tE8Cv7I2hZPqMqtPfs0SJiF1RJc=;
        b=pu9Ki2UMDRIgnh7VagvOsQ4NKcJqMNOCSQetRKBUpY1A8RzMDfUV8JLEKDa1vTGzFJ
         63/cd1XbNNgYEjBYMqKsok8gX53au7nfFBkgQSkpDFN3yWIHLQyP13XikHV9/lb6/Ooa
         n9VUe8u4QydVa68Y6YvVKuqA9TXuVcW1cucuJFl+V54cUKmoo0FaxYPDsr882ou2snNl
         d6E+fDXJ05dPNtcGTiWgu3ETFpN5ysuSmWXqzapnRS5yxhP5nH6WQCxfc80C6BJ0DESA
         eX7ivyy8xk2nAGGdxy+/wdGn3DuwDCCQ4th1rhYdGWDh+KbXosZRzHlcKGfdHiPHNcSa
         K8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=MoflKOfjICHD4A/6tE8Cv7I2hZPqMqtPfs0SJiF1RJc=;
        b=mDOJdrxAxsmdD0CGkWyy9XGwwOTJvFrpc8FzhEYpWe6LYsWJnK6ajMqajMk2D+QNmN
         2bKnbDGUXj2pswhpplewTLFQM2MF5iexADR2XoISSwXPdbcjVeLNjM0wRLHJfD6U5ET1
         m31B2akH/HuFRtDUpJrnZS0b6FJNdqbCcdS/HgzHYKwigq3EmyosxH90mqTr45H0tMQK
         HP4ChruogOXHsK4upaeNF/pYFB1wazCAL0Fs7j3DiiGsA32FWajeiYP7X6h0nW/RnZX4
         hS/VSiOONEj1Ep6fa+p5wuafvBdFK/6aYbX8G4Knr8CrRQSRLw7dcYqA41UPNR00uG1E
         7Hwg==
X-Gm-Message-State: AD7BkJL69NLjWogWgFugHTX0+NhdJyo2ujbpRro0brMZ+NMX0JGjqzo5xEEtQY04pTSDWA==
X-Received: by 10.112.125.201 with SMTP id ms9mr1769813lbb.141.1459274302897;
        Tue, 29 Mar 2016 10:58:22 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.65] (broadband-46-188-121-115.2com.net. [46.188.121.115])
        by smtp.gmail.com with ESMTPSA id j2sm4660390lfb.25.2016.03.29.10.58.21
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 29 Mar 2016 10:58:21 -0700 (PDT)
Subject: Re: [Qemu-arm] [PATCH 1/8] tcg: Clean up direct block chaining data
 fields
To: Peter Maydell <peter.maydell@linaro.org>
References: <1458815961-31979-1-git-send-email-sergey.fedorov@linaro.org>
 <1458815961-31979-2-git-send-email-sergey.fedorov@linaro.org>
 <87poukq9fk.fsf@linaro.org> <56F3F377.4070809@gmail.com>
 <87mvpnrkby.fsf@linaro.org> <56F4039A.5050907@redhat.com>
 <56F9AC4E.4070304@twiddle.net> <56FA3D71.2010505@gmail.com>
 <CAFEAcA_EfzC4Rf_cegYMetcw2VEor4CitoN2Oc1Hagd5YjiMoQ@mail.gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Sergey Fedorov <sergey.fedorov@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
 Blue Swirl <blauwirbel@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Vassili Karpov (malc)" <av1474@comtv.ru>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56FAC23D.3030604@gmail.com>
Date: Tue, 29 Mar 2016 20:58:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_EfzC4Rf_cegYMetcw2VEor4CitoN2Oc1Hagd5YjiMoQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: F6f3Q9Zyj3fg

On 29/03/16 19:26, Peter Maydell wrote:
> On 29 March 2016 at 09:31, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
>> On 29/03/16 01:12, Richard Henderson wrote:
>>> On 03/24/2016 08:11 AM, Paolo Bonzini wrote:
>>>> There is also a case where a TB jumps to itself; it then appears twice
>>>> in the list with different values in the low bits, such as this:
>>>>
>>>>      tb->jmp_list_first = tb | 0;
>>>>       .--------------------'   |
>>>>       |                .-------'
>>>>      tb->jmp_list_next[0] = tb | 2;
>>> Of course, it begs the question of why TB would be in its own list,
>>> even if it does jump to itself.  We only need the points-to list in
>>> order to invalidate a TB and unlink it.  But if TB is being
>>> invalidated, we don't need to reset the jump within TB itself.
>> If we're going to move tb_phys_invalidate() outside of tb_lock, we
>> probably need to reset all jumps to the TB, even if it jumps to itself,
>> so that it eventually finish its execution.
> This is likely also the historical reason for the current code --
> originally we handled requesting a CPU exit by unlinking the TB,
> so you needed to be able to detach jumps-to-self (these days we do
> it by checking a flag at the start of each TB).

I'm not sure if CPU exit request is raised each time TB gets invalidated...

Kind regards,
Sergey
