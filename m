Received: by 10.25.208.211 with SMTP id h202csp1460227lfg;
        Tue, 16 Feb 2016 10:37:30 -0800 (PST)
X-Received: by 10.31.2.14 with SMTP id 14mr19480984vkc.9.1455647850510;
        Tue, 16 Feb 2016 10:37:30 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com. [2607:f8b0:400c:c05::229])
        by mx.google.com with ESMTPS id f68si33817559vka.42.2016.02.16.10.37.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2016 10:37:30 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) client-ip=2607:f8b0:400c:c05::229;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x229.google.com with SMTP id e185so141443188vkb.1
        for <alex.bennee@linaro.org>; Tue, 16 Feb 2016 10:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=E0SX2C18J1BwJFrfaN5QwQd6T5nTgj/3b5B72Y4gDpY=;
        b=UdoFtHpVFZPdpHHox9Op1xpeUQAxctmraTVNzRTOaCYqQ0gMtatWkAqs0nX0CkY4H0
         RckM3YJAKdX9S9DYYw1/UNxKL9U6Fp460wtJDJiL6dd4qWFJxDBBf8S1FR5AdPXUgB75
         XQFrwhygQGLBL9w3aw+PZvLR2dmGTY4z+tmi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=E0SX2C18J1BwJFrfaN5QwQd6T5nTgj/3b5B72Y4gDpY=;
        b=bOXY5vKKXk59t8B5NcHc+WDyLYw5oVVQykSavBmOd1bcAsdjYPFdPEhvI3YGwjqvWL
         /Z+0mXOnWPWn7TJuJXvV2VfSrM7fCbHzns3CstS/WhPsQ1i5vErH5Vb20H0BWo8QreLB
         FEHCoDl8hUnZ8L4+L8iKWIqsSKrs5v45ht/hTtFaZE1Tw26yyg1+/Nr23lJJ/+GzXlZk
         cQBQu/u9w1OJw7WuwOUTegdbGS/5pqpNeqvKFQc1MyF/aFi6t1fnFDAI8B742gdjmAzJ
         RxnLNswErYuTSj2754mHkWud0ZeEDy1ilJe8Wf6gUjjexvpwgB9pdXT7577p7ifCGMAg
         XB1g==
X-Gm-Message-State: AG10YOQQYOMUQmilgMUIe+6+JP4VqEIHFWyMStcFHBBpsdK3bMhgOZrUMdndjF2BGJr6ugp0sgmEjvQ9jZ4TMf6TTDM=
X-Received: by 10.31.194.130 with SMTP id s124mr18901627vkf.92.1455647850131;
 Tue, 16 Feb 2016 10:37:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 10:37:10 -0800 (PST)
In-Reply-To: <1454334712-12360-3-git-send-email-eric.auger@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org> <1454334712-12360-3-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 18:37:10 +0000
Message-ID: <CAFEAcA85qi4wgSAheb6_pVLZOb1az9xDeVe3v=vbeS6CH=UMaw@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] device_tree: introduce load_device_tree_from_sysfs
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
X-TUID: tjcCnDB323FT

On 1 February 2016 at 13:51, Eric Auger <eric.auger@linaro.org> wrote:
> This function returns the host device tree blob from sysfs
> (/proc/device-tree). It uses a recursive function inspired
> from dtc read_fstree.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
