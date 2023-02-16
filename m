Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp800498ejb;
        Thu, 16 Feb 2023 11:21:29 -0800 (PST)
X-Received: by 2002:aa7:9737:0:b0:5a9:c837:5ae6 with SMTP id k23-20020aa79737000000b005a9c8375ae6mr841430pfg.26.1676575289384;
        Thu, 16 Feb 2023 11:21:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676575289; cv=none;
        d=google.com; s=arc-20160816;
        b=XzBW908ZZARHslByaNIhrfZ5UmYcvznn5EIiUiI8BKW47NPXudzyLA0vGS8TBrUJLG
         lG+hylLQAgvuQPp1eCOwBzRpOc6/Ft4CvYS7CqaHMjV+f1kqAP9cJtkae44uNrtJ8fWq
         OVbARj+yPG2oA36iK0XLBuFmNs5OQoWOrBVqoDZg2T0jO+kJNnjy+P94oCSQqPX8BG1u
         d+iybEimLtHvla8wbp3CEm7ctQGQdr+O590FYCSyof8A2eI6CfnJi2mJbvI47n5aqnfu
         rpAQ0rpNmOju9YlFrbIscs3Mwgq+7KGywSwch+bfQpWr+3IH0RKdDdEkvKRpo01MtJe9
         8FtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oiowY3BEaR5AcvwNJ3+5Yt+7D990ExrCQ4lZv6loti8=;
        b=eCLO5zhm2cYegvoWQrvchjoeCy7LHOEcMBy78vGkK2Mbm7+ekoLcC4F7YUJb0QDMUb
         OTcF5t63UYI5GtmScJ5AqF5huyiXGFPdikhQAMPWjpJjOd1O0lg+qNOEsb76xSlm/mcp
         NjzxwkmrvBYFVK4vQQLSdAGNMgZK8RFabC1tYYamJpuStz59wqB3rFFG90/mDbMNZTTQ
         siVhGZk4n62W569fAy8rvRvR3RBUvtPCI4/413FKJBtkP/Nl0NiAjkZ5/xm3vyKJvXPb
         hpjFPbssEWDrhkoemFRXy+z+QbUs5P972ABlZgeMH+16U88Y7nsy1+E/4JtMPeDVKuiP
         BA8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ei+HIckx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h30-20020aa79f5e000000b0059252920dc0sor1059179pfr.25.2023.02.16.11.21.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Feb 2023 11:21:29 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ei+HIckx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oiowY3BEaR5AcvwNJ3+5Yt+7D990ExrCQ4lZv6loti8=;
        b=ei+HIckx5uOXEf4dpZfU7Ya8/hMSdg+GThi5zb81bghY3gOnojao8tndzKn8swDeJj
         kh/c7XS3iMqujTD5KW2WKxH2ZiZNs9Y3gxiaRd02KJRGHbIDafi+sukm/wU3vUNWpOT6
         qSClTwXplqI7m3uMCLR1W0WeZzkMl3XI6A+SUXgJ59SwR1RS0OmO0TBBCMxsD/iRgG5S
         X9lEU2LaPpF87yR827D5eIAbXMwyAsh0Fop4Nn9pVxZgBDkz7SgQegiUFPPcTQKsZh75
         EfiyukU2yiLZicwbdhTgRx8a7nau70aI1l9CV1mN4w4rpjRnKkehO/0EPQhqwNugxhZV
         8nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiowY3BEaR5AcvwNJ3+5Yt+7D990ExrCQ4lZv6loti8=;
        b=7x/sjBtGcsD/PTkQ5xRI54GKbPB0cf9b0tafOCGZLl71MTao6f8mhGn/kKJ3FhBQj2
         KmeLs9IkI5c9I03qK7ActaEOmFVnzu5aGvQKl4FEVFv+mhtE27D9cv/TU3aPKhWSxu3N
         9rMrIrYo+txMyBflqpGZuinObpfgXxczRJussg0aTaKql3enBbg6nJ3odBd0h9UYkgrO
         Gap4XmZzSJu+uJHmDP+fiqzBgp/2f1ffdYhieusDdMLxuVBDODQ1fbGucwoDwldMa4XO
         675Lz3y5aNfMm/74Wf27lKVoljV9/6bd2Iq61+Oj3PapYewyNR/3LWeUaN1/Nuz9YWvc
         nVfg==
X-Gm-Message-State: AO0yUKVV8hAKoOLz2xA2eaPA2NJc2YH1mVUfc8Bb3QQGA7t+lezM6ThG
	2MUvc1UE4G5mUHjzutEH2vxqT2VE
X-Google-Smtp-Source: AK7set+chf/ANxx+AKS7bZEajq5zLIaLCxzAmuGGg+0YL+oCJOeHzgRc6jLi54u7+sMSANh2UNNvgg==
X-Received: by 2002:a62:7955:0:b0:5a8:bd6e:90fb with SMTP id u82-20020a627955000000b005a8bd6e90fbmr6295199pfc.19.1676575288855;
        Thu, 16 Feb 2023 11:21:28 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2607:fb90:8f62:8652:bed9:812b:5b9e:e49a? ([2607:fb90:8f62:8652:bed9:812b:5b9e:e49a])
        by smtp.gmail.com with ESMTPSA id v19-20020aa78093000000b0058e24050648sm1703459pff.12.2023.02.16.11.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 11:21:28 -0800 (PST)
Message-ID: <ebdd4b42-22c8-9903-79bc-1b106765198d@linaro.org>
Date: Thu, 16 Feb 2023 09:21:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RESEND v5 00/28] target/arm: Allow CONFIG_TCG=n builds
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230213202927.28992-1-farosas@suse.de>
 <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
 <87357536br.fsf@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87357536br.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: yJQr8STPe/Yi

On 2/16/23 06:47, Fabiano Rosas wrote:
> I'll try to split it up, let's see how it goes, the ARMCPRegInfo arrays
> are huge, they might end up pulling everything with them.

Feel free to make static functions non-static in e.g. internals.h or cpregs.h as necessary 
to allow an array to be moved without all of the helper functions at the same time.


r~
