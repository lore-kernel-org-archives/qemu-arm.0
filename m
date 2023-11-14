Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2050514ejc;
        Tue, 14 Nov 2023 05:56:00 -0800 (PST)
X-Received: by 2002:a2e:9aca:0:b0:2c5:15dc:ba99 with SMTP id p10-20020a2e9aca000000b002c515dcba99mr1942836ljj.51.1699970160107;
        Tue, 14 Nov 2023 05:56:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699970160; cv=none;
        d=google.com; s=arc-20160816;
        b=KmLvUri0aeO2+YHEYt6wJXlrYapIhs4tNHSb9p1CvXG25k2BbTaY2rBwDCyiVopsL1
         LrNDi71464F2VFaaOWDqQQS24uv/OZZ65VhdihWm92p5utfb9fMWTonl+0qhMJes152r
         na4L9mjhcB4aGHizDkTqV1lj4aDtz0bNRLBYejuiNovWqmf2h1m+oPSWkDNS4CxrZ5El
         C004Niii6IyfAZ1H3+Gns/BTCMw9haGgq2KLXg8B225hMkiWXoru11N1ciehIwrO+z44
         n5N7kLnxnzHr6qtjqBlQT7OYfb7qUHRIcoYflSFFF31b+IEqfrX2EICZIo5vNDXHr1L0
         foqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lvQiIJnm8epdhnB5vkpeRbG5RDMsBlsUOmn/ErmAs3E=;
        fh=2l27m0x/bWoYcDHLMyC9AvJWf4q+xA7d9UXAQ53XL7U=;
        b=cJATlPq8kKbBG2d/AZ5a/bHka8yVGK7a60z/MQLHBjbXML5xoxZI4x0Z4Ud4uUims5
         23e/WCGHOX3a6kiqMrmFEtbPM5e6wAJTUMxNu70WnTOymWouvBZjXYtXf/QRpZdf7ysq
         naEZHGok7Qsq+xZ1oJ7QYDmvGdyPLUOrVG9miQoQmgFqEomHrJu1OPjr5P8UnzMUqnGB
         hvr1ri7ue7fvtoGIz8c56EGFVtG+Ie3Th9wchf7RPlPa5IZbag17EmtARJmaU97k/mzA
         bccdg64WqnlQe6RYgaHMYWT+LuAjaSXSCXfqnibnl4FpOkcMAh7T7M8uQJJbxnoCYtQt
         W08w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Toe+LmxI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w11-20020a2e998b000000b002bfc27471edsor1650608lji.13.2023.11.14.05.55.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 05:56:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Toe+LmxI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699970159; x=1700574959; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvQiIJnm8epdhnB5vkpeRbG5RDMsBlsUOmn/ErmAs3E=;
        b=Toe+LmxIHfV7uO1Ng+bOhHH/JD6kC01LoxGXZ8QYz8hCQruZWaU1mFxhzT6pbSWPII
         QNe0ANkgbDipxX6B8kcj54jaDC4kkDETsl3gjgg0wWHe065Hu0fOU7+b2o9H2bBJlS95
         Kr7I3Rc6MO5ZqVpA+svhSFm0pvM/7pwdnXyLVu4IRJt1NkYS0KmVI95Hod3GAuC76WGK
         tc3Fh/OZ+Mdh99JhmgMrqI6ljsDx334vsDeWSwIXkSmAZ/1zKl69r2aXbFa8SAx2EtmT
         LN9MPWfFfbhyPvfPtVyx6sK3hnd5a2dl+slx+yVv+hIhqO+L80h0GNyNLaYqS3JFLT0S
         6Y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699970159; x=1700574959;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lvQiIJnm8epdhnB5vkpeRbG5RDMsBlsUOmn/ErmAs3E=;
        b=B96XX+GDSRid82YqHg1nXTCI1dxiNha5cZyAcsrUVO9wYY1iqfWFO95ZxbQbjSmnh+
         /fNPumPNAFigDIIo4yphbo12eAd2nW1BmpJp23Fk2bYN1gbe+ZkovH2TgTYVvlGNa7zb
         mVPYlHQODE+WEuXsVUC1muqSuEsy0U2DtrTC7d+6olV8OQUxoC7RJvFKu5WsNQ+ZLESd
         E4Op/bIV/eNxRPb0Z1yYdoLvq647ApursKIwMVIDwhDChRTZpismBw28DMAsR4tRoVse
         CJOWk7aNbpmOB7rH+IeO51jCj2bkOOI7TBfNbaLn9fe53+CrQaCwDnoMwiACoz+LpuqO
         /lyQ==
X-Gm-Message-State: AOJu0YwyF2+gjuyv0nCZkS83kc5ikoZdlCxhaQmbBUKQZChDPsTrO0us
	ylpYQ324p9XLeYOAxQCFyDqv35WV
X-Google-Smtp-Source: AGHT+IHzswkfE7e3I7hDUvm2VdqNG2hFrVp8V7AJ7+73k/8D9WsRzXIdAy+MgUwZ78p+bsfL1MXbEw==
X-Received: by 2002:a2e:8842:0:b0:2c5:47f:8ff7 with SMTP id z2-20020a2e8842000000b002c5047f8ff7mr2475960ljj.18.1699970159645;
        Tue, 14 Nov 2023 05:55:59 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id v14-20020a05600c470e00b0040a47091602sm13749947wmo.31.2023.11.14.05.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 05:55:57 -0800 (PST)
Message-ID: <3b7badd2-931f-47f4-a24e-3f5b9541c06d@linaro.org>
Date: Tue, 14 Nov 2023 14:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 07/10] sysemu/xen-mapcache: Check Xen availability
 with CONFIG_XEN_IS_POSSIBLE
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-8-philmd@linaro.org>
 <9ba10b4a92ac6782d0c581b1e1ee5d5efee44c33.camel@infradead.org>
 <86153cf2-129d-4e1e-8949-786764bdf607@linaro.org>
In-Reply-To: <86153cf2-129d-4e1e-8949-786764bdf607@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: sGTsKUvilowj

Cc'ing Paolo

On 14/11/23 13:25, Philippe Mathieu-Daudé wrote:
> On 13/11/23 20:52, David Woodhouse wrote:
>> On Mon, 2023-11-13 at 16:21 +0100, Philippe Mathieu-Daudé wrote:
>>> "sysemu/xen.h" defines CONFIG_XEN_IS_POSSIBLE as a target-agnostic
>>> version of CONFIG_XEN. Use it in order to use "sysemu/xen-mapcache.h"
>>> in target-agnostic files.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> Noting that CONFIG_XEN_IS_POSSIBLE is for Xen accelerator support, and
>> may not be set in all cases when we're hosting Xen-compatible guests,
> 
> As is CONFIG_XEN.

Actually we have:

- host Xen support
   . CONFIG_XEN_BACKEND

- QEMU Xen accelerator
   . CONFIG_XEN

- HW models
   . CONFIG_XEN (old / generic models)
   . CONFIG_XEN_BUS
   . XEN_IGD_PASSTHROUGH (PCI stuff)
   . CONFIG_XEN_EMU (Xen on KVM)

Paolo, David, is that correct?

When can we have CONFIG_XEN without CONFIG_XEN_BACKEND
(and vice-et-versa)?

So for clarity CONFIG_XEN could be split as:
  - CONFIG_ACCEL_XEN
  - CONFIG_XEN_MACHINE_FV (Fully-virtualized)
  - CONFIG_XEN_MACHINE_PV (Para-virtualized)

> Maybe be worth renaming CONFIG_ACCEL_XEN if you think we need
> guest hw specific CONFIG_foo_XEN variables.
> 
>> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> 
> Thanks!
