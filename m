Received: by 10.182.105.169 with SMTP id gn9csp1093169obb;
        Mon, 9 Nov 2015 03:09:45 -0800 (PST)
X-Received: by 10.129.102.9 with SMTP id a9mr25019920ywc.104.1447067385382;
        Mon, 09 Nov 2015 03:09:45 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-yk0-x231.google.com (mail-yk0-x231.google.com. [2607:f8b0:4002:c07::231])
        by mx.google.com with ESMTPS id y4si7185690ywe.189.2015.11.09.03.09.45
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 03:09:45 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::231 as permitted sender) client-ip=2607:f8b0:4002:c07::231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by ykdv3 with SMTP id v3so168287828ykd.0
        for <alex.bennee@linaro.org>; Mon, 09 Nov 2015 03:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=yylagnQim/PxCU4pIKwBEtyaxtV6CBAVyI32vaUDfoI=;
        b=eGDWFqgr0sZmdSnRjR5YXTMgwcQwm3DlAhDP6N3CDF0FOiyFXbsBuKXr83N3727Qyi
         DpNg6eiTXQejEqYyefhcjhiTE8/uiqLnnHF4AfuQuhX1HecY6y7ABOuZYqtGNHyjJmOc
         3nrtjtZBncGqaaMgyLUzcSXqvN7PCBL77eFSTnKcI0/1SlAb5sN1SLKNRF4N5N8GFDti
         zEtfwqhATQyY4lXrPaO4x6Pmf4MFCc3qyIDS49cIcuUO8Fqk5127CeFfTUJweAaTvmId
         CMdG2Lx1WtZOCPGLsj5Dcs2aIPrenUkmRv5U0KUdfAEZTm48y88v9o52nOGE+rgF6V8E
         OIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=yylagnQim/PxCU4pIKwBEtyaxtV6CBAVyI32vaUDfoI=;
        b=Kmayj9Sm414ostKOGuswBhIIpSrBpC+sjUi0NIOnzzZaxN0STwUyDXNUKqC7F+HOVS
         8AUVBvHxeohxrNcpzbktEo7vECCa8CjaNmixhNrDuDZJtLFkyQ4kjOhFjyMn+c7H4swO
         rbiyInLf6bsItFK0ymobSh8f68c/19QGIxI6nUFxdNoplnQJ6X7WbijHISlQeSqN/J8C
         Du78wrHzI7RxEe3NdkzMj7kwG/1t0EsU854Q2BjIJsib0ofbtcTiNNejOL7N8bZ2yekb
         zocx7MgZu0d5RNM/p/9kD1eEHqrMPk7iTiK4ry0xiaIF71WPt9TDo5pg6pskbAkkOl6z
         6xZw==
X-Gm-Message-State: ALoCoQlHS9R01dD/+iHe2GPsaRrrU2Y/ZGd3CuEvvdNtmWQhQ9PoqnnQiUKyutNxmH26mPdlDWVL
X-Received: by 10.13.206.65 with SMTP id q62mr21967652ywd.160.1447067385120;
 Mon, 09 Nov 2015 03:09:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 9 Nov 2015 03:09:25 -0800 (PST)
In-Reply-To: <56407D82.4090005@redhat.com>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-10-git-send-email-peter.maydell@linaro.org>
 <56407AC8.9020100@redhat.com> <CAFEAcA9KrB0wZwQzYUmGBW2NPZWkxHFk-JUnW-XwOfbo4wbWUQ@mail.gmail.com>
 <56407D82.4090005@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2015 11:09:25 +0000
Message-ID: <CAFEAcA9YNOOXenTw=M84=ACXqV_VwRaUCS+P3DNswNkPkGg3Sw@mail.gmail.com>
Subject: Re: [PATCH 09/16] target-arm: Support multiple address spaces in page
 table walks
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: M1OU5kWO/RC8

On 9 November 2015 at 11:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 09/11/2015 11:58, Peter Maydell wrote:
>> You mean "what is the case where is_secure but cpu->num_ases == 1" ?
>> That happens if you have a TrustZone CPU but the board has only
>> connected up one address space, because there is no difference
>> in the view from Secure and NonSecure. (vexpress is like this
>> in hardware, and most of our board models for TZ CPUS are like
>> that now even if the real h/w makes a distinction.)
>>
>> I could have handled that by making the CPU init code always
>> register two ASes (using the same one twice if the board code
>> only passes one or using system_address_space twice if the
>> board code doesn't pass one at all), but that seemed a bit wasteful.
>
> I think it's simpler though.  Complicating the init code is better than
> handling the condition throughout all the helpers...

It was the overhead of having an extra AddressSpace that concerned
me (plus it shows up in things like 'info mtree' somewhat confusingly
if you didn't expect your board to really have 2 ASes). But I don't
feel very strongly about it (or have anything solid to base an
argument either way on).

thanks
-- PMM
