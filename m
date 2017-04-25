Received: by 10.25.0.144 with SMTP id 138csp1814200lfa;
        Tue, 25 Apr 2017 04:12:27 -0700 (PDT)
X-Received: by 10.28.211.9 with SMTP id k9mr1174873wmg.75.1493118746948;
        Tue, 25 Apr 2017 04:12:26 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id p18si13331062wrc.79.2017.04.25.04.12.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:12:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x243.google.com with SMTP id y10so13066696wmh.0;
        Tue, 25 Apr 2017 04:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xDwYYfimxe38YAom+hPdxblMBvEZTumYDg3Zi+aXLmA=;
        b=a0/ey6bGVUQczBAIDQCx9qizdk/wWyRfzb5Ff5P9e56vagnFFOtDpHbs0dDE6lsOtN
         iWvMFAB2walKzrW8LcaL/OEVEcSIzcu69I18Vux7CYZB6kwGvz+O2l+sIWIHr8oMH8gP
         +hgzCZb212XzZ6eiPgN3UVcBF+CZwoocUGTlOQs0NG/+xQN6q5jYPXGt/1KiK74UC1HE
         GNcNZso/nd36bnVckkiDV4/yWt95TNFr/Ed41BxQpUhc33khkHH9kV5Dnhtaww04qAkn
         hI/mQbC32q4JbCyBccV30LLDVy8WjsXCKnSgLPjOI1ionpPufsYjkzmh+NJ+YZRiLiex
         4smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xDwYYfimxe38YAom+hPdxblMBvEZTumYDg3Zi+aXLmA=;
        b=F3CPUXpP7PE2CYOvUenk5v6qehxNfwSVV9BXGs8v60PI3Yzi8kxyMoCR6GAMuJqJ/Q
         tjcvylt7FuT95xY8pEltOoLjrp95BhqWby4rbs/4vAenGmzJ95Ib0hy/wqkHqDrzso4Y
         mdZ+s4aYEbb+mMQ6+Vr2R35XABgHvXbMaqbQgSGRMrrJd2B/yoy6B8/A1+6GeEoEP5kM
         DQ26oldBalS+v3ptInC9MRZxfZGYCyuSsWwcLWvtcrX2zDxTaqEHhIj5UfBSmwDJOgBP
         +5Amw4IRSQJosVkyXBuap00CI0LgwzSodWajSgqqKYIGQeekTi8yvwF2fgzls3haGk0w
         +aeA==
X-Gm-Message-State: AN3rC/6EdBPvXrqHsypoymYUHLgOnX3gDtR3jvOvfg7tEnNJ1nyPoIBp
	KTBHQWGa45V0Bw==
X-Received: by 10.28.182.69 with SMTP id g66mr1650693wmf.112.1493118746698;
        Tue, 25 Apr 2017 04:12:26 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id w11sm2212933wmd.21.2017.04.25.04.12.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:12:26 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 09/13] target/arm: optimize indirect branches with
 TCG's goto_ptr
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
 <1493106839-10438-10-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <afcedd26-5721-06e1-2bf5-5b7484c1b254@twiddle.net>
Date: Tue, 25 Apr 2017 13:12:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493106839-10438-10-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: tLC4pGYHkUYW

On 04/25/2017 09:53 AM, Emilio G. Cota wrote:
> +
> +                gen_jr = false;
> +                gen_helper_lookup_tb_ptr(ptr, cpu_env, cpu_R[15]);
> +                tcg_gen_goto_ptr(ptr);
> +                tcg_temp_free_ptr(ptr);
> +                break;

Likewise doesn't compile for aarch64.


r~
