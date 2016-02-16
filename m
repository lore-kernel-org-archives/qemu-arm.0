Received: by 10.25.208.211 with SMTP id h202csp1461452lfg;
        Tue, 16 Feb 2016 10:40:23 -0800 (PST)
X-Received: by 10.31.54.194 with SMTP id d185mr16404827vka.130.1455648023438;
        Tue, 16 Feb 2016 10:40:23 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22f.google.com (mail-vk0-x22f.google.com. [2607:f8b0:400c:c05::22f])
        by mx.google.com with ESMTPS id 141si33672826vki.131.2016.02.16.10.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2016 10:40:23 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22f as permitted sender) client-ip=2607:f8b0:400c:c05::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22f as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x22f.google.com with SMTP id e185so141517261vkb.1
        for <alex.bennee@linaro.org>; Tue, 16 Feb 2016 10:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=wvCCi8iZ7LQ8QQ8kvFwexhzoeMyN+dvn2YUDE7iH+6A=;
        b=d5euqMbMJ0q9KjrlPqLuhjXJtEVq6vsG9+13CQui8qv4hwugRY1zk6YXItC0jiKn/d
         em9xm6nBd/o3s0r0ml9RkFgcvm4S1cXSjr/myLUDoQvnT3TyoL5x/gXnpqLrYSs9BMcT
         hmaYLqpz5MEKnNwXqjQP3n2KAeuDaAdtZDgXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=wvCCi8iZ7LQ8QQ8kvFwexhzoeMyN+dvn2YUDE7iH+6A=;
        b=DkW4E2nmR9p19uklqkhzE00OH+5h6+fosyQ3w7TWjfQmnb5hx2EGOg4av+xF1grBrE
         gui4UFaEZKhqDX7UXjzMlAS/n4WRU4o8YEzVkgWIi7NEZS2tcnhHLbdT4O636tJvD4GJ
         8ypNNneHJfrdxrxPhCfMlSr+kBTUu1mdE/gsFYLCaVoElKIpGCBFoWyx7ryUR6cEuTc/
         RjP3Ebk/K2sJ1VNwiiMpwwXm/nU750Nxy/GHYHAXz/ooXccN/AM6NhcoqVYDjxbbYFqw
         eq0Z1uzyFQcOp6aL4kXQbPQ50e6bQvjMrqyE977bUjNmBSfACmWH7dMIeLCbDcdKHIKi
         kWsA==
X-Gm-Message-State: AG10YOSSqkGLDoJpWV6RGyIzcjmIq6i7qOl9Zff8vaMzSWpUpHyBOL6jp1N5COccWf/NJo34CbO5NsGaPiMwafvnyHU=
X-Received: by 10.31.1.6 with SMTP id 6mr17417087vkb.139.1455648022945; Tue,
 16 Feb 2016 10:40:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 10:40:03 -0800 (PST)
In-Reply-To: <1454334712-12360-9-git-send-email-eric.auger@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org> <1454334712-12360-9-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 18:40:03 +0000
Message-ID: <CAFEAcA_cQHCaZTkCv68PjR20WnW1-oGb-wjuT-MornROMDm+LQ@mail.gmail.com>
Subject: Re: [PATCH v6 8/8] hw/arm/sysbus-fdt: remove qemu_fdt_setprop
 returned value check
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Alex Williamson <alex.williamson@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>, 
	Christoffer Dall <christoffer.dall@linaro.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
	Patch Tracking <patches@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Baptiste Reynal <b.reynal@virtualopensystems.com>, thomas.lendacky@amd.com
Content-Type: text/plain; charset=UTF-8
X-TUID: zWaocs/ok7BJ

On 1 February 2016 at 13:51, Eric Auger <eric.auger@linaro.org> wrote:
> qemu_fdt_setprop asserts in case of error hence no need to check
> the returned value.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
