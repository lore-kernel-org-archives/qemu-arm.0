Received: by 10.25.208.211 with SMTP id h202csp2147785lfg;
        Tue, 29 Mar 2016 09:26:24 -0700 (PDT)
X-Received: by 10.31.182.18 with SMTP id g18mr1892202vkf.73.1459268784696;
        Tue, 29 Mar 2016 09:26:24 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x233.google.com (mail-vk0-x233.google.com. [2607:f8b0:400c:c05::233])
        by mx.google.com with ESMTPS id 14si8851079uak.103.2016.03.29.09.26.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Mar 2016 09:26:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::233 as permitted sender) client-ip=2607:f8b0:400c:c05::233;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::233 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-vk0-x233.google.com with SMTP id z68so25357102vkg.3
        for <alex.bennee@linaro.org>; Tue, 29 Mar 2016 09:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=2xTbJwvFofqMDIinwU1OLMbduVLY+TTyz4wp2ESvsRY=;
        b=WtiKUO6XvcAVY+1jKHAN2tSAlLoVWOOHKciZsleQKJAZs4iMdeSQ7Tm741gm3Ijj+9
         4kS3QnACsFQAZK2BSdc22PC++9drWu9kY8eHRDZyUm9fX3NUHHmSlMjA/HTtpcdKti2a
         7/URAvGDcg7x4HTc2A1+hJ2OybtUecwKPe274=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=2xTbJwvFofqMDIinwU1OLMbduVLY+TTyz4wp2ESvsRY=;
        b=OrbV/0fVw0Lj1uGbKz81MCdpTbKky4quGLHaqNmHfX/CUQ2Yh16RAcifUzf/M3azyN
         hjiXNBrlG75o+1KwhF1tXw/wY4Cq2vgyKhffoOSTUSh6iMPN+Win0ctbkkBukjthMnwn
         jVKqZEZQJkbJvjVcC1WOgBKBF2ydRwVru00r8y9g1/+Y4vgaQzpKYPrgD1ozs8eP+Aik
         dZs8nqmdHXRm8JKJgOlPjeWICUMng0W7yVCn5NkKXei4V/exnaoLMl7f5g61FtzjvzOF
         YcQY5cElesaX4/6X8nSSvcvP+uWtbSm7GjB41dTyAflZ3iY2TzGvM5blOJtx7W+wxgcZ
         Fd4w==
X-Gm-Message-State: AD7BkJJF3R+9UXDSQnX/8LKS9tUJRiA252KIETNUoavGIx1KkxJ2Gd3lBmgsHiE1Sy+Ru/lY2tkUgRrHBcnWLSo1Gwg=
X-Received: by 10.31.8.210 with SMTP id 201mr1891933vki.90.1459268784375; Tue,
 29 Mar 2016 09:26:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 29 Mar 2016 09:26:04 -0700 (PDT)
In-Reply-To: <56FA3D71.2010505@gmail.com>
References: <1458815961-31979-1-git-send-email-sergey.fedorov@linaro.org>
 <1458815961-31979-2-git-send-email-sergey.fedorov@linaro.org>
 <87poukq9fk.fsf@linaro.org> <56F3F377.4070809@gmail.com> <87mvpnrkby.fsf@linaro.org>
 <56F4039A.5050907@redhat.com> <56F9AC4E.4070304@twiddle.net> <56FA3D71.2010505@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2016 17:26:04 +0100
Message-ID: <CAFEAcA_EfzC4Rf_cegYMetcw2VEor4CitoN2Oc1Hagd5YjiMoQ@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH 1/8] tcg: Clean up direct block chaining data fields
To: Sergey Fedorov <serge.fdrv@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Sergey Fedorov <sergey.fedorov@linaro.org>, Stefan Weil <sw@weilnetz.de>, 
	Claudio Fontana <claudio.fontana@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, 
	"Vassili Karpov (malc)" <av1474@comtv.ru>, Andrzej Zaborowski <balrogg@gmail.com>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-TUID: brXKvgV5nTG4

On 29 March 2016 at 09:31, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 29/03/16 01:12, Richard Henderson wrote:
>> On 03/24/2016 08:11 AM, Paolo Bonzini wrote:
>>> There is also a case where a TB jumps to itself; it then appears twice
>>> in the list with different values in the low bits, such as this:
>>>
>>>      tb->jmp_list_first = tb | 0;
>>>       .--------------------'   |
>>>       |                .-------'
>>>      tb->jmp_list_next[0] = tb | 2;
>>
>> Of course, it begs the question of why TB would be in its own list,
>> even if it does jump to itself.  We only need the points-to list in
>> order to invalidate a TB and unlink it.  But if TB is being
>> invalidated, we don't need to reset the jump within TB itself.
>
> If we're going to move tb_phys_invalidate() outside of tb_lock, we
> probably need to reset all jumps to the TB, even if it jumps to itself,
> so that it eventually finish its execution.

This is likely also the historical reason for the current code --
originally we handled requesting a CPU exit by unlinking the TB,
so you needed to be able to detach jumps-to-self (these days we do
it by checking a flag at the start of each TB).

thanks
-- PMM
