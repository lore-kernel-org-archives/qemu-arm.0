Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp697361lfb;
        Thu, 5 Nov 2020 11:27:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+0+WyUawH/D4lOdyXGwEf2k4TgrrFNDpXyYKP+n82wmS5HIZwIwlraR1Gl6RL3YGtycWr
X-Received: by 2002:a05:6402:28e:: with SMTP id l14mr4191538edv.157.1604604457134;
        Thu, 05 Nov 2020 11:27:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604604457; cv=none;
        d=google.com; s=arc-20160816;
        b=R3UyuJyV8Ph9pTnHgy+z57RvvsZpPsE8xwqSBEIu1sQ0O3IzhH+xifGLXuJT8lccqA
         Ls1HPdjoM/vu5mZMOaqdeio+me+bb1JhWoi+xisRy2RW/RMhyvDOZMqiLGCLCkVZzdwS
         bFJkDdULSY72Yzqk5qgTD6noc6u1Zk8rccN64E/d2/BlHcAApviOdOYs9lizvuS2IrIB
         hV9IefX55L4tqnlWueKTPiIYyaZm0O6CrQc8FpWKm6rYSTPZ5kfCTwiHIkoCN/JFXPtH
         AgqfzfR27scShq4QMZsh8A6J38VbiTQ2dRfFLrwOeES4WsplpJmntRnF7+HYxp8EV+AI
         qUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=sr2uLDzMa0Xo2JPvF9ACkieW/OdLUrRAJ56OMahhDJ4=;
        b=jdJoV/a5XlpjTTVmuiQzUBKN5gW0ubzEFUoMFR2dCeOKDeLMqjnhoT1bV4ixIOivPn
         i1ZGjf+EeH16PSJ5GgHSoaOcJJPezksF2p4j/LmtMJPuMSVP89aqz/now+ty4SdRWHji
         7FYQJkAVm2l6vohlW7OVy7MBJkA7l4uOkDcoaV86gBFzRyNjUqfIYtjKAdJuh2BWU8U8
         WiSYn4Kj64LbmDESIitBZaRXM3trLlMM2inIyfO2TnEWTAwPE/BSb6IAeAtaLfWqx+7O
         Tw/KJ/KU4S+Xx4vKjlpyidKLA4wCTIAgyT71hyDRcz3PwzK29fHqEkZ/GVqc489btMQ1
         wsjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AdEi2D56;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id d16si1851200edx.296.2020.11.05.11.27.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 11:27:37 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AdEi2D56;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604604455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sr2uLDzMa0Xo2JPvF9ACkieW/OdLUrRAJ56OMahhDJ4=;
	b=AdEi2D56ycvuaMgydYYtimzKufwrJt9/D5+rejB75VEYiOfPoyb+KSAwPrEq0Fh8YeSeJ8
	yYIzMhz6luwvFFke4RZowOUK0N55lnxRV1ZwbJI9vZ6c8Bv8u3ccNzfsTBjXY+JmDipoWr
	Gj8UDpGu/0E9OZjJttfHxPjUXqaQ2PY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-GmkTgI3QNQ2kdGBKh1IaHw-1; Thu, 05 Nov 2020 14:27:34 -0500
X-MC-Unique: GmkTgI3QNQ2kdGBKh1IaHw-1
Received: by mail-wr1-f69.google.com with SMTP id v5so1147256wrr.0
        for <alex.bennee@linaro.org>; Thu, 05 Nov 2020 11:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sr2uLDzMa0Xo2JPvF9ACkieW/OdLUrRAJ56OMahhDJ4=;
        b=DFybUKc7oyHRWHvtwu4rWDPSqcc4U9dvW1TO12LAamv6zF1+9QZsaY7WUjxFuQFKvn
         QvD0KsqIJEOiozPXKCycbFRzj4CODffRJ7y9IbuR1S/Lz5jFDtFupVO1BN2HflG2UMGM
         eI9eUEKXlZgvwpYbPBb3sy4U0a7B60OpvXSowqAdsoM8lb0jcAb2SwbgbHpIwCAG7ZBx
         HMVUJJo+fbcvbkdo+gCHacrtm6bvfxmJhnkbg3+JqRTF3bLgFBsTTXcbeWEngJDRYSmp
         NvB18fFBegyIkc5A0C0chigzmMzee5EfU35MMX4GGwJnQUXLPTvbj2tPzTIv86Vjsjaq
         JQgQ==
X-Gm-Message-State: AOAM530uL3jH/+C4WIjNPhndTSL0SjkC48gDxqLBxQJNsTFijEcWzrtf
	pJ9ZTEwWjyHqcPRofokdNSwVFpgY9WgBbZJjGWJIr/WZ+1YHG2MA3fJaZjfu+IlPv6efSdbdpij
	FBDBpYA7C7/AXVtIB
X-Received: by 2002:adf:d188:: with SMTP id v8mr441801wrc.167.1604604453013;
        Thu, 05 Nov 2020 11:27:33 -0800 (PST)
X-Received: by 2002:adf:d188:: with SMTP id v8mr441782wrc.167.1604604452786;
        Thu, 05 Nov 2020 11:27:32 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id t1sm4154035wrs.48.2020.11.05.11.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 11:27:31 -0800 (PST)
Subject: Re: [RFC PATCH 01/15] hw/board: promote fdt from ARM VirtMachineState
 to MachineState
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, julien@xen.org,
 Eduardo Habkost <ehabkost@redhat.com>, masami.hiramatsu@linaro.org,
 andre.przywara@arm.com, stefano.stabellini@linaro.org,
 takahiro.akashi@linaro.org, "open list:Virt" <qemu-arm@nongnu.org>,
 stefano.stabellini@xilinx.com, stratos-dev@op-lists.linaro.org
References: <20201105175153.30489-1-alex.bennee@linaro.org>
 <20201105175153.30489-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ea13af19-9ec7-3d91-e7b8-b4f59aa4cf1d@redhat.com>
Date: Thu, 5 Nov 2020 20:27:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201105175153.30489-2-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: pXVD5IoUx5Qf

On 11/5/20 6:51 PM, Alex Bennée wrote:
> The use of FDT's is quite common across our various platforms. To
> allow the generic loader to tweak it we need to make it available in
> the generic state. This creates the field and migrates the initial
> user to use the generic field. Other boards will be updated in later
> patches.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20201021170842.25762-2-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Two S-o-b better than one!

> ---
>  include/hw/arm/virt.h |   1 -
>  include/hw/boards.h   |   1 +
>  hw/arm/virt.c         | 322 ++++++++++++++++++++++--------------------
>  3 files changed, 170 insertions(+), 154 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
