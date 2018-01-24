Received: by 10.28.71.27 with SMTP id u27csp819018wma;
        Wed, 24 Jan 2018 08:33:26 -0800 (PST)
X-Received: by 2002:a17:902:6c0c:: with SMTP id q12-v6mr968544plk.51.1516811606040;
        Wed, 24 Jan 2018 08:33:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516811606; cv=none;
        d=google.com; s=arc-20160816;
        b=J+ZnaV1Nuib6IPOncSlxLTPzsx8UPr4rocITHcWUtyqsj5+U5alGPMOqL4KGPGyQzV
         fs4Xr+L9UXYeKt56cH+AfjJnSps9kXmH4ecKcDD3StpGxhl6X93PjMlsuYzxEB+wgDjc
         Xpvu6ZIuz04QvNDXX8K+D8S4y7JMzOWRKKt7DhbNSlTEMDbftE/uy051Gk98sU5i0wAP
         +sEbSG/k7jQroMUn11kxCx1ud4OCHF6bTtisDqOeNs3RmQqxSKp2loNDwtzngWFtXR9c
         CE29H4AA1hxB3Rf21HB9ZJHRnzoFBw+Gemj/AId4ky7pJuF1f5+Ip/Q/1UpxadAEeUY8
         tRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=tvUaAWG0MBeEfzbNMRAXg882dk8nI/tyEWvRmrmXaIY=;
        b=aPU+GFbl4RaMAIUScdHFbkjrzZ7C9TnKApLbr4kSRkwQgeReJAB8rZPDLwZU0e75sd
         pFP+pgdeLoXBMUc9ksLy1rH/47abFN13JLnsuZrH9ExRGUFHyuCj/2O5uhnwdcxmACfY
         U85eNy46SE3qrUcCgdjdoUw3NRm2gfXE8OdGLTo5zE2aYoh2PYwXBHt5C4xIQ7OuDK2O
         4E7JGpadZYIh2EafgtTWcAoYvRvseNWJ7lMfHtR861PTPXXPantNHKtIx6tFjZ0hWyhN
         rYnpwE+e5efegpGnn91z3JuGFHnXzv1TSaRTvlvxbnAlZYk4p+mSz6JSxhwYx5ND/ddP
         J1Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i7vzVMCr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 31-v6sor213714plj.77.2018.01.24.08.33.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 24 Jan 2018 08:33:26 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i7vzVMCr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tvUaAWG0MBeEfzbNMRAXg882dk8nI/tyEWvRmrmXaIY=;
        b=i7vzVMCrlRfRsZzSJVirpZ0uNNCdc4cf4B+PNCPitE0RcTtFbHA42YHAH+R1FWTame
         BNCfhoUMA2w2YU0mMg71qiqu7kECuW1LY29yCrmtYbTIeNJ0u1MQ0HCTpNnjyd3sd7Fg
         qZkeSYWUSxwaYFnQD5r/YGmjEHBJZ0Scp7jpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tvUaAWG0MBeEfzbNMRAXg882dk8nI/tyEWvRmrmXaIY=;
        b=YbpFZh1Hxg2hTA8qvo1CHv8Cb8izYcTCL6nSL3Cu2c26KxAQjIm3pYFpWI8CYVx4CO
         rqEnMkjkZ90fF+ovHLvF5UIwn0FFnemtk4g+QAzPc/rBgdSKqG7FykrrECHGsvVV4rZz
         JGqiSxOnB8gysz6hwCddn4FhADlQPMZrajJWs/m15pLKTakplEcNFgmk809+CKwf5y8E
         GC+CmharLkNQfPWq/6LcjmCYDBGA9IhGvO4lOZ0me41fIqKh2u2LwgWHdv5WYw0PZviq
         8zm+LbxYGxzmocas+ZjsOiAwES0SqWdwrWxraGM0O1NrH+TGm0J40k/NLls2Q3F+6l01
         f4Ww==
X-Gm-Message-State: AKwxyte594OM/ymzpSnxVHsyQDF8BAgRx3hyyfKRVLFyI2TwBr9PDGKR
	D6wwvh9F88uU4rBc2DGXkYtkNcKT
X-Google-Smtp-Source: AH8x227+bnN/Kan5+9pPzvX/HCU1ptlts67Dk1K5CKkMsxDaCnFMm5EYlHCflPjlwqkO/wO3mRD3Sg==
X-Received: by 2002:a17:902:71c6:: with SMTP id t6-v6mr9046796plm.318.1516811605624;
        Wed, 24 Jan 2018 08:33:25 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id x84sm10962548pfe.81.2018.01.24.08.33.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jan 2018 08:33:24 -0800 (PST)
Subject: Re: [PATCH v3 04/22] target/*/cpu.h: remove softfloat.h
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, laurent@vivier.eu, bharata@linux.vnet.ibm.com,
 andrew@andrewdutcher.com
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 "open list:ARM" <qemu-arm@nongnu.org>,
 "open list:PowerPC" <qemu-ppc@nongnu.org>,
 "open list:S390" <qemu-s390x@nongnu.org>
References: <20180124131315.30567-1-alex.bennee@linaro.org>
 <20180124131315.30567-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <704a0aeb-4ae4-bf09-c20b-16232344397c@linaro.org>
Date: Wed, 24 Jan 2018 08:33:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180124131315.30567-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: uZqEreIm+xmh

On 01/24/2018 05:12 AM, Alex Bennée wrote:
> As cpu.h is another typically widely included file which doesn't need
> full access to the softfloat API we can remove the includes from here
> as well. Where they do need types it's typically for float_status and
> the rounding modes so we move that to softfloat-types.h as well.
> 
> As a result of not having softfloat in every cpu.h call we now need to
> add it to various helpers that do need the full softfloat.h
> definitions.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
