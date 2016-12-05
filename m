Received: by 10.25.159.131 with SMTP id i125csp1619460lfe;
        Mon, 5 Dec 2016 07:55:44 -0800 (PST)
X-Received: by 10.176.0.169 with SMTP id 38mr45429082uaj.34.1480953344633;
        Mon, 05 Dec 2016 07:55:44 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x233.google.com (mail-vk0-x233.google.com. [2607:f8b0:400c:c05::233])
        by mx.google.com with ESMTPS id 44si3665604uau.47.2016.12.05.07.55.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 07:55:44 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::233 as permitted sender) client-ip=2607:f8b0:400c:c05::233;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::233 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-vk0-x233.google.com with SMTP id w194so180839182vkw.2
        for <alex.bennee@linaro.org>; Mon, 05 Dec 2016 07:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=nYSZxFlazpDq0YSR4PnjkT0a3PMQ1uPaAmISSBavHPM=;
        b=aoVkG2E5IaMjr6um5W9PNURbquypXjmiOUlNYWdefN1RzZwHje7SLJGC6SaxsNsAFq
         BpFPbGq54PJmEuacMtP7fEesiR5tlZB6z9J3d5lQmsdUd1rWWRfzTyDLSoEyBKTXOeZY
         ak1n79zSJ563UuLCnSiKLYk1HrA/qVvySRaSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=nYSZxFlazpDq0YSR4PnjkT0a3PMQ1uPaAmISSBavHPM=;
        b=lrmUt7C5x/GjQOarJLol+99xoRiTuiFSt3IjMOX9GVbBMksX7VTI3XLwqgo3cReKLH
         6ig7oLOL5TorZ1m3NeA+lam3UUJU6OlmINldG0NI2CBTL/hS0LMEpNSKoerzxpGVp81z
         J7aUEz/2eM6vQMGSLyQegdygSDKaPYIXIc3mL5WdphB5XWYj+BnVhWhOiojn4NuHYVDQ
         vNKpsbMnAXMjRRa7c7krw8H9/YjeufG/5vY6jEBn8BDGdAenZFwz5QDF3iWV9w5X8ns6
         kXBQ+ntD8z8W32w+SnefyVB7JEaaYyq9UsqGejLUY/gkVKM0pVLRhuxYbuEsJPoBo6nB
         XheQ==
X-Gm-Message-State: AKaTC03uSjIZ0rEvHl0Hzi42i0XsBp7/g3oyJTQA/dJ0slE+LLtZL+9rhOjAeZA18S4V6iN3IDCr5oDx2pSgAlFCGhc=
X-Received: by 10.31.8.8 with SMTP id 8mr21159613vki.173.1480953344222; Mon,
 05 Dec 2016 07:55:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Mon, 5 Dec 2016 07:55:23 -0800 (PST)
In-Reply-To: <b6c3b949-ef2a-31f4-ce86-712ce7b64a3f@twiddle.net>
References: <20161202173454.19179-1-alex.bennee@linaro.org>
 <8737i21vl8.fsf@linaro.org> <b6c3b949-ef2a-31f4-ce86-712ce7b64a3f@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2016 15:55:23 +0000
Message-ID: <CAFEAcA9k6u41vMcemdoFZ-imH6e6YAsoSMNMgr3km+G544s=uA@mail.gmail.com>
Subject: Re: [PATCH for-2.8] target-arm/translate-a64: fix gen_load_exclusive
To: Richard Henderson <rth@twiddle.net>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	"Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: hD1N8E090GOC

On 5 December 2016 at 15:42, Richard Henderson <rth@twiddle.net> wrote:
> We'll have to fix it properly eventually.  But perhaps 2.9 is soon enough,
> since that's when mttcg will go in.

Could you provide a reviewed-by (or an explicit nak) for Alex's
patch, please? I didn't look at this area of the code when it
went in so I'm not really in position to review it even if it
goes via my tree.

thanks
-- PMM
