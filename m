Received: by 10.25.159.19 with SMTP id i19csp25514lfe;
        Fri, 5 Feb 2016 08:27:34 -0800 (PST)
X-Received: by 10.31.16.153 with SMTP id 25mr10049692vkq.143.1454689654710;
        Fri, 05 Feb 2016 08:27:34 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com. [2607:f8b0:400c:c05::229])
        by mx.google.com with ESMTPS id 192si15230994vkp.28.2016.02.05.08.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2016 08:27:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) client-ip=2607:f8b0:400c:c05::229;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x229.google.com with SMTP id e64so60122242vkg.0
        for <alex.bennee@linaro.org>; Fri, 05 Feb 2016 08:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=YqEgvkm3cAE4rAf8iZi1oqxF4XTjxUDAL2Ws0rynjjY=;
        b=KNdN5GxKk9cXioY79R4oUxqqgCp9sX4e6OVPvtXZ5ui3O6bSan7qRWXph2JbNbVTz3
         i9soxuahNL5wxy0IVfOTEtm4982lDCI4MCF/8/F14kFE3FDf25CLmY6iQAMyZcizp5UF
         8CACO8R+TwWgk8jqlycze0DVXKkNjlTXSeuoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=YqEgvkm3cAE4rAf8iZi1oqxF4XTjxUDAL2Ws0rynjjY=;
        b=kt0eAYsbGQxqushSRBbWM8PMYUWJMfkauy+xpuU9gsegfap2+oygNnbki6c0Qtip8q
         5uzPknD/foLx/sYFOFLHYWI4OcmOyqIBwlV4C803Dk2T4xoqNoT3hpsDA81pVa+tlRQq
         Gn/xIgHkazMybE6RK1DxspEb0DiDikeaYZIT9nBZh+ImOxvpSXwGHSv4yYgXhrW+nbRi
         KDX95vnPTB2Dis3rFI3FRyauLdMAVpnAQptg6qhiBAvEGncLN4ae/ped0ND4GCF3s0Ct
         auyd1JfC0AaZJGo4opHyXd1uMprVW38/mhg6CwSPVkppIFjtTAHga7dhDUWFDu+ktVcq
         XZhQ==
X-Gm-Message-State: AG10YOSxjQUbuaC2ZhxKNQyDhT/WnD6ROySVZoP3NTrejCfmb5b1pEO0i0QhPKkY5za/NbJ/5x5XIiqCcjfTzHRZj0M=
X-Received: by 10.31.141.2 with SMTP id p2mr10281673vkd.37.1454689654421; Fri,
 05 Feb 2016 08:27:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 5 Feb 2016 08:27:14 -0800 (PST)
In-Reply-To: <87egcrnnbe.fsf@linaro.org>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
 <1454506721-11843-6-git-send-email-peter.maydell@linaro.org>
 <87io23nsqe.fsf@linaro.org> <CAFEAcA_RJs_DaBa2YqP3z+-ykMntPULEWAYO8LnQz8Qzs+dyXA@mail.gmail.com>
 <87egcrnnbe.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2016 16:27:14 +0000
Message-ID: <CAFEAcA_H-BoNJ_h8pHDanZ-OrqUKgmp7ubagOTNP1aTFQW4hCQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 5/7] target-arm: Add isread parameter to CPAccessFns
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: MqRtXnqNiTND

On 5 February 2016 at 16:17, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>> I haven't measured, no, but since there are only 3 arguments the
>> third argument is going to be in a register on any host architecture
>> we care about, which means the overhead is just going to be a single
>> "load constant 0 or 1 into register before the call". I think that's
>> going to be lost in the noise compared to actually having to make
>> the function call at all, the work the function call does, and then
>> the second function call later to do the read or write.
>
> I was thinking of knock on effects on spilling other registers in the
> TCG code. I guess this depends on how complex the code is around system
> register access.

The register in question is going to be caller-saves anyway, so no
effect on spilling in the TCG code I think.

thanks
-- PMM
