Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp3320687wrt;
        Tue, 19 Mar 2019 02:37:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5Griy2egvDop8TQnYEpz1GtGWRBau02s5sf4HWzTuaqvjoyJBauQOBg2KIFydczdNSPil
X-Received: by 2002:a9d:58c6:: with SMTP id s6mr936281oth.122.1552988231684;
        Tue, 19 Mar 2019 02:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552988231; cv=none;
        d=google.com; s=arc-20160816;
        b=woodmzlrx52g+q3obR1biY7pbP+wLW8OXmJgOrMDBki3j43J0IrjZykbzHSQxRMRYT
         AqQe0aYCy9mw8t927h96piFPIR3ciuD8BviTIDaOMT1iwEhewN5l378T5D/I0I8GUbHs
         8XRtam1nyYkbaI5Th58Tuyo6sVtt4Rhd+Jm/q8FVCJNj8n+IM7GxlcbPXS32gdSTJVfh
         2J8CLmYpJqUJwDly4qbdrzALP/mnvqej2uo1ld9+hlMMrDzHVnzvuwYNy/aqJ/vkfI01
         Nuk7t6koVD6+LeQnzo1E6rM5nJ7/SGVi3d2sPxv4nRQyvlHwCZHnTV2Mw8cbl4HZ349O
         ldbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=H9rNLaIFcFX+MEHB++FyJepiQIyMLmlP14tpy1m908Y=;
        b=kYhK+W6xbI+tirMhtmeeJfLXpXleHVFc4uAq5bfvip+/gkWyTjci6FHeTAQO3VjH4d
         GkyxYOv4gOEWvTGyfcajAAfEMMlrx1G0/ed73lUzaNV6Ocql9CX5siGcJicoRp7akHR9
         uCLfxqeuJu+vEjfG1LCZxXapOkmthtd9SVV7zNTxR6M8fCm5gKh3G9tSlZRWL5b4GLOc
         ue0tbwUo0cnV12HA0eC/OTruMEJtnyar3UokvXh8t/Quhod1Ea4E07VZXM+zS2bXjUts
         9Jdt6pxhTa4t2pBltnbbFE3qXGw7xAUNvj8oHmAyWyfyqJcu4MP3AxTtEIb31V5tGDrA
         bqzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.35 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Return-Path: <gengdongjiu@huawei.com>
Received: from huawei.com (szxga07-in.huawei.com. [45.249.212.35])
        by mx.google.com with ESMTPS id y2si5147457oig.267.2019.03.19.02.37.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Mar 2019 02:37:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.35 as permitted sender) client-ip=45.249.212.35;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.35 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id AF4387C754A932897B21;
	Tue, 19 Mar 2019 17:37:05 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.408.0; Tue, 19 Mar 2019
 17:37:02 +0800
Subject: Re: [Qemu-devel] [PATCH for-4.0?] arm: Allow system registers for KVM
 guests to be changed by QEMU code
To: Peter Maydell <peter.maydell@linaro.org>
CC: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, qemu-arm
	<qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, Eric Auger
	<eric.auger@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>, "patches@linaro.org" <patches@linaro.org>
References: <20190315143057.20165-1-peter.maydell@linaro.org>
 <c04c5c7a-f704-1c12-1a09-02f4a3db8506@redhat.com>
 <a2a1eb85-afd4-53d6-e907-368100357b0b@huawei.com>
 <CAFEAcA-DAHJP-cpQtb5_W-oHgJPLfN1B21MSp9iZivJyUvHRiQ@mail.gmail.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <c9eeae46-1886-fb0d-8c49-069560670e26@huawei.com>
Date: Tue, 19 Mar 2019 17:36:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-DAHJP-cpQtb5_W-oHgJPLfN1B21MSp9iZivJyUvHRiQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-TUID: AE05AfU+RAkK

On 2019/3/18 20:49, Peter Maydell wrote:
> On Mon, 18 Mar 2019 at 12:34, gengdongjiu <gengdongjiu@huawei.com> wrote:
>>
>>
>>
>> On 2019/3/16 4:11, Philippe Mathieu-Daudé wrote:
>>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>>> ---
>>>> Should we try to put this in for rc1? Not sure... Testing
>>>> definitely appreciated.
>>> You might include it for rc1 and we still have rc2/rc3 to revert it.
>>
>> why we still have rc2/rc3 to revert it?
> 
> I think Philippe's point is that it's reasonably safe to
> apply this patch in rc1 (ie now), because if we do do that
> and then discover that we have some other bug in it, we
> still have plenty of time to take the patch out again
> before release.
> 
> (If we did discover another bug in this patch in future, I
> would favour reverting it for the 4.0 release rather than
> trying to fix whatever that bug was, because two unexpected
> bugs in the patch means I clearly didn't understand
> the code well enough to produce a reliable patch. The cases
> that this patch fixes are pretty rare -- it does fix a bug
> but only in handling of some cases of debugging a KVM guest;
> but the patch potentially affects the behaviour of any
> KVM guest, even if the user isn't trying to debug. So it's
> riskier than some other kinds of change, and on balance
> that means that when we're making a decision at rc2 or rc3
> I'm more in favour of just reverting it rather than
> applying what we hope is a fix.)

Got it, understand it now, thanks very much for Peter's detailed explanation.

> 
> thanks
> -- PMM
> 
> .
> 
