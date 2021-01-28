Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp116947lfo;
        Thu, 28 Jan 2021 03:02:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRLOXyYICR5LrknIFLf38+AJrj0XmktzeDuS/+GfdCKRaxIMt7Q/Qt0D9P1xD5jkeSfFJ3
X-Received: by 2002:a17:906:509:: with SMTP id j9mr10327032eja.89.1611831764664;
        Thu, 28 Jan 2021 03:02:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611831764; cv=none;
        d=google.com; s=arc-20160816;
        b=wVNiN4Sru8YnTW3x3PBCxDl8KBz7NkS9Xx5u0T2/asDZjC8s2Kx+OYOPDMn5XnBbKE
         LjF+r1sTunkSKRt4dUChb3g444kudqExObBSHGLbSPXjmCOJX2Z8jzb+80kL9ocUzNmm
         BggoiGcbJMv7U2R3xbCFYJjyVbunnmCUzNYSEvhPmbGaCWUQzWQoH7uSrR0yzauGfiTq
         UkBkOEVbqk/hejEAHGnGVI0VCQkdFTw4Ldbm4eZVWFY7DwNc5U9Q95OaTr9YlT+XTWw2
         EFVctDl5PpwU4rej2UmBQ0t/nimLaHQj8mhb7k8ZRyy8QcTAkxX89gcJGzEGG83PYyUc
         17Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=a1m/cLEY13tDBo0h/pnmMRjcNA7DsFWhW2/f2XTrp0s=;
        b=SZRFLeM+2hi4INvN6u2TupRE0xnzdTbJ4UXtw+WqqH3CpagdhcXod7ACUraE0Z+jlp
         tCxOnSX3Vq5Lewd4oC334UebjKoeFXHpSxyqx+laM22yhliVxdZDA4OUex493MSmp458
         LfqSuHQnWFK1i6ecFZ6XG1ik2EJnBYcw4bdK6MuvoJfRADUG8oZn7CDGVX9nnMe/D0Ny
         yyNmLnfI4aMD69ZzlR/FnYo68zpyvjUB8euxdTTNxbElJDJeYYB/fQb6V41MDmbMvfDT
         kSiN2pgYt0Tru4ZyHG4vasDXqpShKpilVDNxbataR95q3DfEqLmLF0HnBLresBZrc7pd
         LHTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DfJWTj6T;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id y15si2849646edv.236.2021.01.28.03.02.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Jan 2021 03:02:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DfJWTj6T;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611831763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1m/cLEY13tDBo0h/pnmMRjcNA7DsFWhW2/f2XTrp0s=;
	b=DfJWTj6TqHXXPx4ljIjNyHRdISoA+vYnoJKfqPCFiUIKjrVes7+vZneQ/CGbZnLu315rpe
	P+aU9EfXYyYaYCByqUaoxyvjixjTIDa+9q1RSz096+hSzYTjQSc2OXSCudBHi/GNTYE074
	DyfPfeZR+FfnOf++2nG+n7XcNnnM/Uo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-OK-eSESsOKat402x4KpbEg-1; Thu, 28 Jan 2021 06:02:41 -0500
X-MC-Unique: OK-eSESsOKat402x4KpbEg-1
Received: by mail-ed1-f69.google.com with SMTP id e25so2992314edq.6
        for <alex.bennee@linaro.org>; Thu, 28 Jan 2021 03:02:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a1m/cLEY13tDBo0h/pnmMRjcNA7DsFWhW2/f2XTrp0s=;
        b=DmP0esBfV8/y0+1qFMD3JWfENmaA4yK3YWYZ03+NaSWA7rHQX3bjpD6pdYFcIv1ccW
         nAkm5fOhPxfrYSyEah2RRCOqNT3pigPi2nC0Zy9DH5on7rFJ5TGNgiRhoNpWtRzp5NBu
         +pjDrKaN1IbPJEzkecmswbgrcoYdlHHtxAtjlf/ZCVJvbrHbi6FW75fCw//wbF408JeG
         sfYJNpr7ensr6Pe8uGDb0fAHLR/iYBRdpJAD7LNZE79o+XsJGvuESlMua/rCqIzpSz65
         NY+sAiMj6/tAsBFhLUwbVsbrDVzWuCTSHmgswYEtjK0uwQhrfTbWVDHs5+rd25ZRiHOE
         gNHQ==
X-Gm-Message-State: AOAM530ls3MwtdE79GRaaf9/bHN3YtfbqZzi+KrF27t2T0V1MkvfU04q
	/eKtY/1+sDiOUrgmnpaHP9ROHpTWdF+iAe93/6tChYjkyrF29fh/Ap2LqS08CLZ9KIK2Y4h4NBa
	hJWVkCfKSe1ofVOzD
X-Received: by 2002:a50:a684:: with SMTP id e4mr13175031edc.148.1611831759975;
        Thu, 28 Jan 2021 03:02:39 -0800 (PST)
X-Received: by 2002:a50:a684:: with SMTP id e4mr13175005edc.148.1611831759796;
        Thu, 28 Jan 2021 03:02:39 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net. [83.57.169.13])
        by smtp.gmail.com with ESMTPSA id e27sm2164457ejl.122.2021.01.28.03.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 03:02:39 -0800 (PST)
Subject: Re: [PATCH v4 00/12] Support disabling TCG on ARM (part 2)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <87r1m5x56h.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <98f06a0a-efe6-c630-8e68-0e4559f04d58@redhat.com>
Date: Thu, 28 Jan 2021 12:02:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87r1m5x56h.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: hDgm7h9ry7RC

Hi Alex,

On 1/28/21 1:41 AM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Cover from Samuel Ortiz from (part 1) [1]:
>>
>>   This patchset allows for building and running ARM targets with TCG
>>   disabled. [...]
>>
>>   The rationale behind this work comes from the NEMU project where we're
>>   trying to only support x86 and ARM 64-bit architectures, without
>>   including the TCG code base. We can only do so if we can build and run
>>   ARM binaries with TCG disabled.
>>
>> v4 almost 2 years later... [2]:
>> - Rebased on Meson
>> - Addressed Richard review comments
>> - Addressed Claudio review comments
> 
> Have you re-based recently because I was having a look but ran into
> merge conflicts. I'd like to get the merged at some point because I ran
> into similar issues with the Xen only build without TCG.

I addressed most of this review comments locally. Since Claudio's
accelerator series was getting more attention (and is bigger) I was
waiting it gets merged first. He just respun v14:
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07171.html
