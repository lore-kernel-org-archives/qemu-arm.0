Received: by 10.25.208.211 with SMTP id h202csp1461785lfg;
        Tue, 16 Feb 2016 10:41:07 -0800 (PST)
X-Received: by 10.31.131.199 with SMTP id f190mr19528060vkd.90.1455648066942;
        Tue, 16 Feb 2016 10:41:06 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x235.google.com (mail-vk0-x235.google.com. [2607:f8b0:400c:c05::235])
        by mx.google.com with ESMTPS id g126si33626505vkf.83.2016.02.16.10.41.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2016 10:41:06 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::235 as permitted sender) client-ip=2607:f8b0:400c:c05::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x235.google.com with SMTP id c3so141467710vkb.3
        for <alex.bennee@linaro.org>; Tue, 16 Feb 2016 10:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=wwzzRQUXlYv3xeZRuyKVG9ApV33NY9wwdotmaKDR/W4=;
        b=X5tWNrOY0Va0f3k1mF/AkIWnf9bZoZWlfhq01zA/DkfifUGVs5y1BaVQ030TKe8NlC
         v/MC3McmeaDx0YYUq/gdhx6Mm/X79VxxtI014k7mLWw2YjQkdyut+b0QYv8dAvEX/Aj3
         NZd3hZ+8V284lt8glmL5Z6GTYq0oucaR6+3XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=wwzzRQUXlYv3xeZRuyKVG9ApV33NY9wwdotmaKDR/W4=;
        b=aAKl8a6Xcp/hDN9lOXOxgxr34rKkPDN2e0apGaxGT4xNhnprVQk815pNftKhPdx2Px
         QBZenGlG/e/GgOTl1ICgzMzMZ7dv0bocnbL2hn7Hz80yY5qbyJ29rN2dOdyIMgjh6ucI
         2oXe6xae+trGLjx3U2D1bgfnQldZTO5dSKvRWfCSqamepLzJzVoa09JW0HJLXVpDg1sY
         TheZTwTVtfcPG4BAmosR5zp+v0rIl2kWohlJhkTiY7Tl3DkUEpyLXjNhDG9sOfLXmPXv
         xfk0rif0b9aYgEdzQ8zvpAfcEMfS6wMKzIAjAygPG2Z63YAJe4UnoCfDNr8YwSGL9VNQ
         iI3w==
X-Gm-Message-State: AG10YORW3a/I2DqFUDwa+Rn43V/nXy4VMgmKQDX/mPAaZy6Rxmmmg3pdggcWpk+ciXdERJIjcQaT9CKgFnd6wmeHL/Y=
X-Received: by 10.31.180.85 with SMTP id d82mr16864949vkf.83.1455648066573;
 Tue, 16 Feb 2016 10:41:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 16 Feb 2016 10:40:47 -0800 (PST)
In-Reply-To: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2016 18:40:47 +0000
Message-ID: <CAFEAcA9UM_XQsd9nnZMnP3nxPwjf6PvW5KB5GdeJK+a29T0f2A@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] AMD XGBE KVM platform passthrough
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
X-TUID: 11rV1pwXmGTP

On 1 February 2016 at 13:51, Eric Auger <eric.auger@linaro.org> wrote:
> This series allows to set up AMD XGBE passthrough. This was tested on AMD
> Seattle.
>
> The first upstreamed device supporting KVM platform passthrough was the
> Calxeda Midway XGMAC. Compared to this latter, the XGBE XGMAC exposes a
> much more complex device tree node.
>
> - First There are 2 device tree node formats:
> one where XGBE and PHY are described in separate nodes and another one
> that combines both description in a single node (only supported by 4.2
> onwards kernels). Only the combined description is supported for passthrough,
> meaning the host must be >= 4.2 and must feature a device tree with a combined
> description. The guest will also be exposed with a combined description,
> meaning only >= 4.2 guest are supported. It is not planned to support
> separate node representation since assignment of the PHY is less
> straigtforward.
>
> - the XGMAC/PHY node depends on 2 clock nodes (DMA and PTP).
> The code checks those clocks are fixed to make sure they cannot be
> switched off at some point after the native driver gets unbound.
>
> - there are many property values to populate on guest side. Most of them
> cannot be hardcoded. That series implements host device tree blob extraction
> from the host /proc/device-tree (inspired from dtc implementation)
> and retrieve host property values to populate guest dtb.
>
> - the case where the host uses ACPI is not yet covered since there is
>   no usable ACPI description for this HW yet.
>
> The patches can be found at
> https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-xgbe-v6
>
> Previous versions can be found at
> https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-xgbe-v<n>

I think you have review on everything in this series now, but I'm assuming
this is going to go via the vfio tree (or at any rate not via target-arm).
Let me know if that's wrong.

thanks
-- PMM
