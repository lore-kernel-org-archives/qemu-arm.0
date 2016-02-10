Received: by 10.25.159.19 with SMTP id i19csp2248300lfe;
        Tue, 9 Feb 2016 19:25:16 -0800 (PST)
X-Received: by 10.140.95.119 with SMTP id h110mr45992389qge.105.1455074716284;
        Tue, 09 Feb 2016 19:25:16 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com. [2607:f8b0:400d:c09::242])
        by mx.google.com with ESMTPS id b110si1546363qgf.45.2016.02.09.19.25.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Feb 2016 19:25:16 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) client-ip=2607:f8b0:400d:c09::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com;
       dkim=pass header.i=@gmail.com
Received: by mail-qk0-x242.google.com with SMTP id s5so242516qkd.2;
        Tue, 09 Feb 2016 19:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=ko8btDRkGA105J3XxCL8sqRFjPIKaFhPE5feWnVvyqw=;
        b=GV5rVdpXdNVyyRjFfaIamWrHdcidTxjw8tgcQEs6aQdFISyKnU7biZncx7MvuBdnzH
         Mv3DsbOfxTssHKYU9umv0HkrSfHZIdKzXAKvJvTr9my6tggEJngX/i7InMQoq+7aMNRR
         dZssSsVtfcMTk1Blz+m0GEwI4kgK4zCPXG9mR6EYmXQfjpw+3X4DMYoTSyAMGfXJ3MhI
         0IjmjpOxvWm8n35y7NEyH5pegep4QnjaWpGOu9ykdi5Q8VJrwaI51m00r7X/kuG/ZS0x
         1cm+QnHb7cgMsOIhtk+kCIk2MjYUyXepYQL9YNufxMYX60TL4U8YT4sRUjnpaQxTDRnU
         ImyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=ko8btDRkGA105J3XxCL8sqRFjPIKaFhPE5feWnVvyqw=;
        b=MRGVo+f2exxEh2KBDpXwR8/plmfMKtAu1EQUuJ2x0zxiiJDoH+6ONKGcNl0OVUmhqg
         dvfCyxwPSn6oWDzwS+85bLSFsQh+0qfKcXz1fZe4VadtMEvUuQu6sNt6quG3xx7edWUb
         kEC1+H92Eh9P81dj37//2GmbGelMsBQ7sL9ibN9ZF9hEUteQmJbni+bSQnd8WwtyQ3b4
         abRPrGpU20qb2jwK9B1R1uz28HWUtZaSOHLgP1zNE0FI/W0Eq/K/YEGyFdCmJz9zAKeR
         jz5s7ezNsHugvtd248dAg5zBVgxWdc2RReyQRaksh3BjknFM3c1OQZ4rJuVa0uyCCWoz
         9tbw==
X-Gm-Message-State: AG10YORd8G/sNtRpSWN4i9QSYeO2BUI8lRTdbxhSFGnT75bvaKpv/gEeE2QpntNJbDeqzg==
X-Received: by 10.55.75.77 with SMTP id y74mr45265929qka.19.1455074715934;
        Tue, 09 Feb 2016 19:25:15 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([172.56.7.187])
        by smtp.googlemail.com with ESMTPSA id r21sm496775qkl.21.2016.02.09.19.24.59
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 09 Feb 2016 19:25:15 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v6 3/4] tcg: Add type for vCPU pointers
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
References: <145505246212.4785.2237668256809452874.stgit@localhost>
 <145505248083.4785.7066950318146523490.stgit@localhost>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Jia Liu
 <proljc@gmail.com>, Alexander Graf <agraf@suse.de>,
 Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Walle <michael@walle.cc>, Leon Alrae <leon.alrae@imgtec.com>,
 "open list:PowerPC" <qemu-ppc@nongnu.org>,
 "open list:ARM" <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <56BAAD86.3010007@twiddle.net>
Date: Wed, 10 Feb 2016 14:24:54 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <145505248083.4785.7066950318146523490.stgit@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: QflU3SOsQ1fj

On 02/10/2016 08:14 AM, Lluís Vilanova wrote:
> Adds the 'TCGv_env' type for pointers to 'CPUArchState' objects. The
> tracing infrastructure later needs to differentiate between regular
> pointers and pointers to vCPUs.
>
> Also changes all targets to use the new 'TCGv_cpu' type instead of the
> generic 'TCGv_ptr'. As of now, the change is merely cosmetic ('TCGv_env'
> translates into 'TCGv_ptr'), but that could change in the future to
> enforce the difference.

I suppose.

We won't be able distinguish TCGv_env from TCGv_ptr until env can be 
auto-converted to ptr.  Which I can't imagine happening without switching to C++.

I see your motivation in 4/4, so I guess this is fine.

Acked-by: Richard Henderson <rth@twiddle.net>


r~
