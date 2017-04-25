Received: by 10.25.0.144 with SMTP id 138csp1815344lfa;
        Tue, 25 Apr 2017 04:15:06 -0700 (PDT)
X-Received: by 10.223.176.184 with SMTP id i53mr9520210wra.53.1493118906390;
        Tue, 25 Apr 2017 04:15:06 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com. [2a00:1450:400c:c0c::243])
        by mx.google.com with ESMTPS id p53si22729350wrc.129.2017.04.25.04.15.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:15:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) client-ip=2a00:1450:400c:c0c::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wr0-x243.google.com with SMTP id v42so16286888wrc.3;
        Tue, 25 Apr 2017 04:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4wYnSxyBXCHnEp6nbPd7oikVrIt3HwweglbGdtfPQ1I=;
        b=YZehRXcPQU2CR8vbMlyK9UqnXxPVED5YcWw67t/TNU3sh81oJZu0tz/WprbgK8fjh5
         Q9sDHw2AMnQbhsPsZA/58RDA5To1dmnLP0jDfdjxOeO+QwynCQyoldLhoWErtdXaXKrY
         U90waYSCb68YwgtaHINvqVcpKMsW6BqnKXVpPwdXJOlOcgEDIqwlLTmq0+/VTvBigLJD
         pxpcM2Jq2GqYSBHGBmmYyGNGYeo34dUqmCj/CbJuDvHd3lUAd065Talminw+TCP/Hpoj
         DtPwaTnDZx1HEB9y1FfUfyV2yXK9it2ma0hSz53mAf/+0+Ku67ZBHOkDrTGX6PkZhgza
         AYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4wYnSxyBXCHnEp6nbPd7oikVrIt3HwweglbGdtfPQ1I=;
        b=lS13nkUFOTUCDuTMoEnXb8C3W7ou/aplqqhGvAeSKY82aq7rho1bHPDtKdsISB34fZ
         pIgMpLEm3gVxMP3FSwQtXbAaWfY5NHHqX01LLdzFMPlgK1JnzS5C9jWj7tNvUqNxLCib
         ffdo/xEy9qCIuzmGjTq2DuceOVuPbOQ3ae2OIhC4soLm0f/lWHGWgrtepVwW6zDDp0uO
         cYSmlK0g0lcqS+MtabD14AzR1qR/wT6GjBdBQ+cai/VeyFZWmrIgeyHDtJeEWh9cLubL
         jn8yfCxFBFttwaPFF9Cy5D1hzpUCUa5/VHmfzGQMRkdC+vLwhGkEuu0xKm9Tx+g1Uqvf
         ArlA==
X-Gm-Message-State: AN3rC/7sDFzID1tOpn1P2abDWFgG2BK+5n0LRbAF80rj3umWEZt990KB
	iJ2+A86jim6JaA==
X-Received: by 10.223.132.39 with SMTP id 36mr8766999wrf.182.1493118906191;
        Tue, 25 Apr 2017 04:15:06 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id m4sm25938748wrm.4.2017.04.25.04.15.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:15:05 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 02/13] exec-all: inline tb_from_jmp_cache
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
 <1493106839-10438-3-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <f72ff4ef-bc82-4e24-f15d-4f8adcc04dab@twiddle.net>
Date: Tue, 25 Apr 2017 13:15:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493106839-10438-3-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: NzGABsLq3Lwq

On 04/25/2017 09:53 AM, Emilio G. Cota wrote:
> +/* tb_hash_func() in tb-hash.h needs tb_page_addr_t, defined above */
> +#include "tb-hash.h"
> +

This causes an include loop (I think), and quite a few targets fail to build.
Are you using --target-list in your testing?


r~
