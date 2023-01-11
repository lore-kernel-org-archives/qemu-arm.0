Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4416459ejc;
        Wed, 11 Jan 2023 16:37:34 -0800 (PST)
X-Received: by 2002:a17:902:ed92:b0:192:7a02:31a7 with SMTP id e18-20020a170902ed9200b001927a0231a7mr4450409plj.49.1673483854595;
        Wed, 11 Jan 2023 16:37:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673483854; cv=none;
        d=google.com; s=arc-20160816;
        b=gkz9DjDJDC1cnUSvudoa+TZ2/xekw0a+Ho95rVSCqG0cXmnVFjXtcp7tBQeLhMMAXg
         lXmY5l9su4pTkVWHL5ePRaJAVrWHC9pul2nshmaFc9V3SiZczRwX2A1e3MdO7suV9jyK
         nXVtFJ21sqWqhPTcv958Wwg9FTjBM2894ktjZxffwyu5a3XCsgzvUTZR9sGpv3rVSLEr
         COs6nVZiIDVZsu8RrjTnta3dZV48fqmrDiyp4owZKbVbY66GEFRQTRH+3zzeVDtPWoZZ
         2mTsYK7aNfMfLp0SIUoidBAsIq8oxdWeNKaxPH2x6goKDcyYYE0sqbYto75mOy26yDfJ
         vndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=w3dSyXN1RKi7nVnTNy7sl17nMxRk5FXSE/DSuWGove4=;
        b=0suUsxzFzmoS3eubAxlZo6p+CzqlfVh1RLHcHnGveh3wQap253u2roJJ9A6f/Evs1i
         dDeUGrmZp59FN4wI9f9g0aomw365G7+IMPhp/Q3KaeKVvOYVkG6dczpxmKWeWCb15ZCY
         pBzD0p3wYJcfqRbHDOnIU3IpRf9yKzMxsj+12s5CP9fPk7w2qAUkRtSRH2lyxyoD6WeI
         s9zhWe4J4AMgZTO0sqndd8eQwqPe+Um/52QKcoFJBNNEe/KsQT9GceyxEheEuAz01sth
         jFyLa52TWGNHEBungLAAPGs9hNulZL6t4CJeFQYT/VyLxM2QKiVNYWf2ITPbAaNiELbi
         wLQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bragzYjh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w2-20020a1709026f0200b00192fad42ca8sor7956978plk.141.2023.01.11.16.37.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Jan 2023 16:37:34 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bragzYjh;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w3dSyXN1RKi7nVnTNy7sl17nMxRk5FXSE/DSuWGove4=;
        b=bragzYjhsFgpfEbGjBOrr+EHL785poIt7eomUK+mq4dPGV8qt5qbSRn1usWK74SfKL
         fR+PSFGzOFC/MvRey3VHa1ksoIVJEa2ZFkGcrSS3P+w+IECS/Othes3yZi87j3SnPWqC
         Wlm0NnYQFq5L8fpRiIi/LZNCKBEHL9nB1qybgZQNXt0r3qv2QhYZPLOtLG2yCbnOIk7X
         lkhw0fGpM9ZZPbZ7o5RuxRNBkJRY1B+9ooh2bzBKnYP7EAPMbucvgFo4d7aejthobtSa
         nO67zW4DbmyHlIgruGchwfzQIPWFTeus0OJ5kSaUXfG1IgU8HUHBNQ3dtU3A6mEttnsX
         Jobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3dSyXN1RKi7nVnTNy7sl17nMxRk5FXSE/DSuWGove4=;
        b=pjXibpBAV/dCBcw1EBTItbb6c7OCRuFJ51fnnV6qZNJUsnCWEwC0rqZnlhgOGLznWZ
         +0m9TSdaiDsJHEfpAYON0bgmdlloUZYXpoIBcLy/Jp6GNLmBknYDaMDTID0PR0uU2eN5
         AJ/4DA60XYGFB8fxHs1pBDBxoJPDIfBH4jjmNg3EATbBTTKu6uuhIv0X5g7bqPeiDPbC
         wGi7svioNetpAmIS6M62Y9JgyEsPX76B3k80h/nyVwQdcTriLNH2qr8WSCo51NvjRP7q
         r6g0Qxq/XZGxm2vc0frhE8BZbfH8ql4dp1uic44121ceHtbaFlafsOSQGy/MO7OWkjjg
         NvRg==
X-Gm-Message-State: AFqh2krTPFs9UT4DsyK6LeE9FJMvD0MWmvqRslxCPtqsYkFdUxqxmbHi
	LCOtqm5kz5G5aCM9wnYtlQSsFEpY
X-Google-Smtp-Source: AMrXdXvakTMQKGLw079z5qtRMw0NLOdBkx/f2cu0irF0GNDudSJMp/LauzAYhToQR7LitobGDeO5bg==
X-Received: by 2002:a05:6a20:9592:b0:b6:3708:7be9 with SMTP id iu18-20020a056a20959200b000b637087be9mr6440246pzb.36.1673483854146;
        Wed, 11 Jan 2023 16:37:34 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id d63-20020a623642000000b0057691fb0d37sm10486699pfa.193.2023.01.11.16.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 16:37:33 -0800 (PST)
Message-ID: <214f89fc-6e90-7d0b-8555-4bae1d1d0b70@linaro.org>
Date: Wed, 11 Jan 2023 10:30:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
 <87sfgia4uj.fsf@suse.de>
 <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
 <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de> <87fschcko4.fsf@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87fschcko4.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: v18kgGlYUq8Y

On 1/11/23 04:36, Fabiano Rosas wrote:
> Nowadays for KVM is the 'virt' machine the only one we use?

Also sbsa-ref.


r~
