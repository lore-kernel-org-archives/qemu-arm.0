Received: by 10.25.208.211 with SMTP id h202csp1476206lfg;
        Tue, 16 Feb 2016 11:13:52 -0800 (PST)
X-Received: by 10.31.172.135 with SMTP id v129mr17743001vke.154.1455650032117;
        Tue, 16 Feb 2016 11:13:52 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com. [2607:f8b0:400c:c05::232])
        by mx.google.com with ESMTPS id z199si33837804vkd.38.2016.02.16.11.13.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2016 11:13:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) client-ip=2607:f8b0:400c:c05::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x232.google.com with SMTP id c3so142312924vkb.3
        for <alex.bennee@linaro.org>; Tue, 16 Feb 2016 11:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=kCjV8kcqNMkjSYrs7xre8eWyq7WxAavXIAvLE29oszo=;
        b=FsF2kZpIP5slb7Dut7XXwTdGX9eInOREbHtGeUvOycrEwBGbds5R8Tv0SVSa+7iZ3e
         gYKiuKabGoKIOZWtuSFuwjI0VkXHG3TupyrSySh+AG68rrPnU72/a4MWOVLNK4fpiAKW
         AlKKGGxiuwz02KNhE//G41sHDmIEe5AGYWhLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=kCjV8kcqNMkjSYrs7xre8eWyq7WxAavXIAvLE29oszo=;
        b=D6yPiHpU9l2wJZ2bRMrDBIDzP0LwY7KmZbXGfo+9KtufU2nlaHg2oJNVaQkq+ZqCJx
         EOU4pFIY3ucsM+5OWCl/wNgPCxWF+2wK05B0qsolaiCNGsL7qw4mCWu0+Vdyd48njbMk
         J7vpMkDqm+7HghItqZ2cB3Zuk12y6zVZh8mCx9+Zaj2qPkOh9l1POcpGA5R/8NwSx9Tn
         ztXZXiADlPAzE6i3pzsRVmG7Aav8wQWadqC9YD4tnCFVL0faKCw7/3Ub/4gSKeIirYGM
         pBx5HwtOmfhL54+/+JRBxXZUhorG9kaATYukbYRV9gbb92FkGr8bOGBnJq8CMce7V29o
         oEAg==
X-Gm-Message-State: AG10YOT6L3Qb67zYZu/NFzf3i1KNtz6dUv2oIPvLkXntuvaV5zfv7lNea+meefZAMT2le4LJqjUa+BwoLXtwwnPtGKQ=
X-Received: by 10.31.141.2 with SMTP id p2mr19393817vkd.37.1455650031780; Tue,
 16 Feb 2016 11:13:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 11:13:32 -0800 (PST)
In-Reply-To: <1455287642-28166-9-git-send-email-edgar.iglesias@gmail.com>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com> <1455287642-28166-9-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 19:13:32 +0000
Message-ID: <CAFEAcA8VfyWn8t4jBAH3_ph1W7=FhPMr0Z+TEk9SXtv5Adv23g@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] target-arm: A64: Create Instruction Syndromes for
 Data Aborts
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Sergey Fedorov <serge.fdrv@gmail.com>, Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: WRLqBQaKFUE5

On 12 February 2016 at 14:34, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add support for generating the instruction syndrome for Data Aborts.
> These syndromes are used by hypervisors for example to trap and emulate
> memory accesses.
>
> We save the decoded data out-of-band with the TBs at translation time.
> When exceptions hit, the extra data attached to the TB is used to
> recreate the state needed to encode instruction syndromes.
> This avoids the need to emit moves with every load/store.

I think this patch also would be simpler if the encoded info
put in with the TBs was just the syndrome register, rather
than some other encoding.

thanks
-- PMM
