Received: by 10.182.158.201 with SMTP id ww9csp120450obb;
        Mon, 16 Nov 2015 06:07:32 -0800 (PST)
X-Received: by 10.194.133.137 with SMTP id pc9mr26618610wjb.77.1447682852086;
        Mon, 16 Nov 2015 06:07:32 -0800 (PST)
Return-Path: <afaerber@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id y84si15206442wmg.105.2015.11.16.06.07.31
        (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 06:07:32 -0800 (PST)
Received-SPF: pass (google.com: domain of afaerber@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of afaerber@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=afaerber@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 86CEEAAC1;
	Mon, 16 Nov 2015 14:07:08 +0000 (UTC)
Subject: Re: [PATCH v2 04/19] include/qom/cpu.h: Add new
 get_phys_page_attrs_debug method
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
 <1447682723-3977-5-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
Message-ID: <5649E323.8050407@suse.de>
Date: Mon, 16 Nov 2015 15:07:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447682723-3977-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
X-TUID: z77qQhRPDEVJ

Am 16.11.2015 um 15:05 schrieb Peter Maydell:
> Add a new optional method get_phys_page_attrs_debug to CPUClass.
> This is like the existing get_phys_page_debug, but also returns
> the memory transaction attributes to use for the access.
> This will be necessary for CPUs which have multiple address
> spaces and use the attributes to select the correct address
> space.
> 
> We provide a wrapper function cpu_get_phys_page_attrs_debug()
> which falls back to the existing get_phys_page_debug(), so we
> don't need to change every target CPU.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/qom/cpu.h | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)

Please use "qom:" and () by convention, otherwise looks fine.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton; HRB 21284 (AG Nürnberg)
