Received: by 10.25.0.144 with SMTP id 138csp171138lfa;
        Wed, 26 Apr 2017 01:30:09 -0700 (PDT)
X-Received: by 10.28.178.17 with SMTP id b17mr14858210wmf.23.1493195409845;
        Wed, 26 Apr 2017 01:30:09 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com. [2a00:1450:400c:c0c::243])
        by mx.google.com with ESMTPS id b204si6117290wmc.11.2017.04.26.01.30.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:30:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) client-ip=2a00:1450:400c:c0c::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wr0-x243.google.com with SMTP id v42so19825730wrc.3;
        Wed, 26 Apr 2017 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bn+7FJXoyQK6qHgCK2eLoU2eFuxN58d4Sna+n6bCJrk=;
        b=KBaBLonP8Uhxf798pkdfvy5mUDPCODFHCKTznZI8kOCsYfHja0uYOtQ+fo6YsN+qrb
         gEchHCRKSi5PeN7EHr29ipUFD64HwjXnJP/MAzb40XHl0rqSTaVhpI58Vl6uLwK7tKHY
         YMGYzN+q1jqFUQTyXTHvYmNdAA/Tk8fbgdDHfGhJcpL3UvPPJf+E9CKpAQ3gtxARDGws
         tD8y4t8Exk2/0Doj+w6NWeDND3CwL8c6LU6p2AU3Uol4cnqyQNo2CwW71pdhjuEmWB99
         MZtSlMfDiQsZ+/8z1I7r7nD4hrhb2xYl4bZ/U5iHN4ISe3tOKrc3wtn9SU7UpK5FYOHT
         p+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bn+7FJXoyQK6qHgCK2eLoU2eFuxN58d4Sna+n6bCJrk=;
        b=QH0ion11gLPZTfrHiiFMLHmkETwtYBLC6NUSL+Ar2ENH1SnZQLFzWKOgXYfU/VA7Ay
         cf3W4MdLXfSgqy7e0as3436AziqPyTqBTAhBfFC3L8n+M5DHI6jXLjEE9XvyqaQ/Gu7w
         nZY0Hu3BeyCAIUiaMBYdPnAL0bKGMBmPhvWj7PiDy6x5XHilhnN7UzjxL2lKqNZ2kUk+
         cQvSsl0RC1HqW8+XPs32n/S/J47+5dT9VXAmjUjxO3ZxtKL0yKnZ8JRq0rgWcjSDImY1
         O9lEsGT8OmMAsduU4KclBOEo1VG9QSY0KBMYtv2q+SrR5RY5IzoEIARFrIclpknF/NXn
         5bHQ==
X-Gm-Message-State: AN3rC/5/92zZAag814fwn9IxUx6sQcLQ5TODmDf4QT0y7yDSxXGWL5vH
	f5dbkcZ/9iB5qw==
X-Received: by 10.223.151.146 with SMTP id s18mr12234194wrb.40.1493195409614;
        Wed, 26 Apr 2017 01:30:09 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id r29sm28766556wrr.45.2017.04.26.01.30.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:30:08 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 02/10] tcg: introduce goto_ptr opcode
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-3-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <c5ac5d8a-6b3f-843c-9144-0a778e3ae1f8@twiddle.net>
Date: Wed, 26 Apr 2017 10:30:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493187803-4510-3-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: Mf4vmjM1vmQ6

On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota<cota@braap.org>
> ---
>   tcg/aarch64/tcg-target.h | 1 +
>   tcg/arm/tcg-target.h     | 1 +
>   tcg/i386/tcg-target.h    | 1 +
>   tcg/ia64/tcg-target.h    | 1 +
>   tcg/mips/tcg-target.h    | 1 +
>   tcg/ppc/tcg-target.h     | 1 +
>   tcg/s390/tcg-target.h    | 1 +
>   tcg/sparc/tcg-target.h   | 1 +
>   tcg/tcg-opc.h            | 1 +
>   tcg/tci/tcg-target.h     | 1 +
>   10 files changed, 10 insertions(+)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
