Received: by 10.25.208.211 with SMTP id h202csp742691lfg;
        Thu, 18 Feb 2016 09:59:53 -0800 (PST)
X-Received: by 10.194.62.201 with SMTP id a9mr10501644wjs.130.1455818393836;
        Thu, 18 Feb 2016 09:59:53 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x233.google.com (mail-wm0-x233.google.com. [2a00:1450:400c:c09::233])
        by mx.google.com with ESMTPS id i10si6826343wmc.50.2016.02.18.09.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2016 09:59:53 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::233 as permitted sender) client-ip=2a00:1450:400c:c09::233;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::233 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x233.google.com with SMTP id g62so36669318wme.0
        for <alex.bennee@linaro.org>; Thu, 18 Feb 2016 09:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=9+dkL8Hr0iQjopUQ9k+9K3QxNN7NdRPNrdQ6wtTX5U8=;
        b=gxYQslh8pon3PaVJ6+OFd01sV3JMlyUYF08RwtBJb7OSbS0kGWnOyd4e/PnCgju36S
         Z2Dcu1Pvrwdzk9OGVYrZKCUVTm5eiVnF61w3HCn6tbbkbdhpkiFvnnT8qTrNKDIMduFN
         EmqxZrt9yIJwbONXicIcf6N0MQGDty4PDEaD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=9+dkL8Hr0iQjopUQ9k+9K3QxNN7NdRPNrdQ6wtTX5U8=;
        b=eMGh6ngD/Yn1wjKlIsL29O8oMR4d9Ymf6FNlZN1ij09XC+LU20O5DTN8jscHly2ilu
         Mgyq4KeCAAjspapwtyiiXDYwzuBbmHlQG4kQ+2N6QzqS1hq/bhLgJFPwvUu+w4J8UGHD
         uznzI77Nm85nay07PiXZYz5VCqe1SmGXf6EP1NNQzATLxmLuWRuiDFKn5KvaUmA3bLvt
         V+OC+Vm06BXK8y+1g6L8rS2OG62F6p2nyDS7Rrsg6XWvKgl4CuKRlCOtejD+1dEd+ED/
         WJ/2zQTvCdRz8yAqAxwWniv68LgoP0Mm/3Oh25qmDDgCxTxcf+aBMOtGLMq5xPjXH1T7
         wnmw==
X-Gm-Message-State: AG10YOSc5CeZ8/bEULualowQf3IKUL/uoA7SaVqyciDjZxWGN97WO+vrWbmOdneATg1PpE6eYls=
X-Received: by 10.28.109.141 with SMTP id b13mr4445646wmi.25.1455818393562;
        Thu, 18 Feb 2016 09:59:53 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.25] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id t3sm7665187wjz.11.2016.02.18.09.59.51
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 18 Feb 2016 09:59:51 -0800 (PST)
Subject: Re: [PATCH v6 0/8] AMD XGBE KVM platform passthrough
To: Alex Williamson <alex.williamson@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1454334712-12360-1-git-send-email-eric.auger@linaro.org>
 <CAFEAcA9UM_XQsd9nnZMnP3nxPwjf6PvW5KB5GdeJK+a29T0f2A@mail.gmail.com>
 <20160217125939.6df646dc@t450s.home>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 Christoffer Dall <christoffer.dall@linaro.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Peter Crosthwaite <crosthwaitepeter@gmail.com>,
 Patch Tracking <patches@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Baptiste Reynal <b.reynal@virtualopensystems.com>, thomas.lendacky@amd.com
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56C6067A.2020900@linaro.org>
Date: Thu, 18 Feb 2016 18:59:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160217125939.6df646dc@t450s.home>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: 0jJ4Sv7C4Hdu

Hi,
On 02/17/2016 08:59 PM, Alex Williamson wrote:
> On Tue, 16 Feb 2016 18:40:47 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
>> On 1 February 2016 at 13:51, Eric Auger <eric.auger@linaro.org> wrote:
>>> This series allows to set up AMD XGBE passthrough. This was tested on AMD
>>> Seattle.
>>>
>>> The first upstreamed device supporting KVM platform passthrough was the
>>> Calxeda Midway XGMAC. Compared to this latter, the XGBE XGMAC exposes a
>>> much more complex device tree node.
>>>
>>> - First There are 2 device tree node formats:
>>> one where XGBE and PHY are described in separate nodes and another one
>>> that combines both description in a single node (only supported by 4.2
>>> onwards kernels). Only the combined description is supported for passthrough,
>>> meaning the host must be >= 4.2 and must feature a device tree with a combined
>>> description. The guest will also be exposed with a combined description,
>>> meaning only >= 4.2 guest are supported. It is not planned to support
>>> separate node representation since assignment of the PHY is less
>>> straigtforward.
>>>
>>> - the XGMAC/PHY node depends on 2 clock nodes (DMA and PTP).
>>> The code checks those clocks are fixed to make sure they cannot be
>>> switched off at some point after the native driver gets unbound.
>>>
>>> - there are many property values to populate on guest side. Most of them
>>> cannot be hardcoded. That series implements host device tree blob extraction
>>> from the host /proc/device-tree (inspired from dtc implementation)
>>> and retrieve host property values to populate guest dtb.
>>>
>>> - the case where the host uses ACPI is not yet covered since there is
>>>   no usable ACPI description for this HW yet.
>>>
>>> The patches can be found at
>>> https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-xgbe-v6
>>>
>>> Previous versions can be found at
>>> https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-xgbe-v<n>  
>>
>> I think you have review on everything in this series now, but I'm assuming
>> this is going to go via the vfio tree (or at any rate not via target-arm).
>> Let me know if that's wrong.
> 
> The little bit of vfio here looks ok to me too.  Eric, this doesn't
> apply cleanly, could you please rebase and incorporate all the acks and
> reviews and I'll send a pull request with it?  Thanks,

Thanks Peter for the last R-b's. Alex, I rebased and sent v7. Once
pulled I will update the qemu wiki.

Thanks

Eric
> 
> Alex
> 
