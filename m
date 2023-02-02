Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp423190ejb;
        Thu, 2 Feb 2023 06:32:03 -0800 (PST)
X-Received: by 2002:a05:6000:68d:b0:248:ab8a:5144 with SMTP id bo13-20020a056000068d00b00248ab8a5144mr5952334wrb.63.1675348323413;
        Thu, 02 Feb 2023 06:32:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675348323; cv=none;
        d=google.com; s=arc-20160816;
        b=zYmuNj6laOqI3kwpG0thaFYg41PC28PPTmGHzB+9O47/QINUskbp6bhMdVHAh/ypP2
         cftlT97nCRpfL6EBTyp5BUaCA+Tho/vRgwsrQqdGClI0Cstp7h//KoKPenQxt0S7MZbs
         2IK0GhJfrOcI4rlTbmiSUx0vGpYubuQxj9s1Q59du6Uv98a9eKERZal5chHAVN430hOz
         LfqkEdo87JF6zG3pgC3VxfF6vVDMwSio5siZbs1SkVY68hNEVwJHUyMBmivgq9AjdwfW
         aMnGOLJ9i5xDIx/6FYyaiik95/uzl/PNS8PuW2v7rkCaBVt2Jk6BdecKmVZjKXVrb7IL
         hvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:dkim-signature;
        bh=I6dyQOgZukQ54QDK6aIe7WXm73Yx6J7f4p/XUgBjaiQ=;
        b=Fb8PHGnhLAPD5UwxCDbrF9W+/T2hNGGVlba5SZBeqKGv6vVqfmOMYVvBdfY6bFC0rm
         J0p4Jya2AVIvnW/oFbqGajlmo/bSdHyE6xqOUiwFRAVIIlXvTvZqvNosMh9yLfw0/nmL
         mmdRzFXrDx0LIXqJqJNL6HAjSibN9kZaMxHIwdZxg/DpcdGrllOptk/38zL8xfgqfLVK
         elr/vrtsJPz5kdd0SNDqiTYuGmpf9l5lhBWnox7NGhQp8Rl177xtTg3gVqvF2qDAV2h/
         NewyFhUGNdBW1sgZnELzghotkhpDAy1NQrPwBRmwc6ynCXaOCrPLmAgr9L0AOh7vKDSJ
         ddag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gYEzfD17;
       spf=pass (google.com: domain of xadimgnik@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=xadimgnik@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <xadimgnik@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l10-20020adfc78a000000b002bdfcf43592sor3552382wrg.10.2023.02.02.06.32.03
        (Google Transport Security);
        Thu, 02 Feb 2023 06:32:03 -0800 (PST)
Received-SPF: pass (google.com: domain of xadimgnik@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gYEzfD17;
       spf=pass (google.com: domain of xadimgnik@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=xadimgnik@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I6dyQOgZukQ54QDK6aIe7WXm73Yx6J7f4p/XUgBjaiQ=;
        b=gYEzfD17n8nHeGoo5M7J1IahG2YNPvjdBolDnNH1dKlwLIQXMWw5VU0hROBTqSsbWm
         Npz0Q/sEvU9Pvv6n+f33YCfowllVjSHQofRAnH4e6OvqHfY4aYJ3iY1L6yRYpwNPNbmY
         VI6gWJfW8NBJaQYAgGel+y5tvn51iZ3Ky+OAt/opWL3Gmkwx0qezwoZKvXvva4g1nXQh
         IimNUx1q+fZliP6fbn4t2d+dyycwzO3lQKu0VqbQMomqkgPAL+BVeDucNBeEk42SdHEd
         ztaaXz6nwQvW7Q2rJfuhQDam4dWfsPjwyqs3RdNhBr+gZZXgE7a20uII9ldSfZgOEMm8
         8gQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6dyQOgZukQ54QDK6aIe7WXm73Yx6J7f4p/XUgBjaiQ=;
        b=7bQRHAMYI7yCiVDcM5HF1HajMdlWTPDJ3h/uOPfwcxDiIncBhVVQw8piG47eAeSmGF
         yVr8dlXNtXFcJTSCO7+fx4ZpHKZSLuRPnAcjZvexyQSi/4i90HJ5+nJDZhSIazgYDrPP
         qJ6bOVE2OveHCXV+K92mDTbUymfRilVHGEpsV/8R1WpBiegMt5xv/dvneBptDp2ky54O
         qsH0Au5rhhPdvFRlTgZF3OkMT7B8O65V1/kMyOP3tAcOZGmjni/YYsIo5ECZnbMZa4Yc
         dfIB5W5zSF005CSjW4tzz6TaeP6p9ygcy0W7qndTnCIBMF6YkebXrGE7wx/FPpz3B5Xs
         xRBA==
X-Gm-Message-State: AO0yUKVHbzjxniF3EAKJhYY9eyj/0Rg0owTDNwheHIL2t6UsyQCcNfMm
	j6MsS4UkjPLQWJvWdvy6x9Q=
X-Google-Smtp-Source: AK7set/Ded8UbNBqMS274a0klw1pXZiUb0FG0DCX0n76UwKL6fmeBdzYOvVoqjnvG9oAyaz0U8rRew==
X-Received: by 2002:a5d:464a:0:b0:2bf:b1f0:7bab with SMTP id j10-20020a5d464a000000b002bfb1f07babmr5097051wrs.47.1675348322958;
        Thu, 02 Feb 2023 06:32:02 -0800 (PST)
Return-Path: <xadimgnik@gmail.com>
Received: from [10.95.156.231] (54-240-197-230.amazon.com. [54.240.197.230])
        by smtp.gmail.com with ESMTPSA id e28-20020a5d595c000000b002bfd8ad20a0sm16175013wri.44.2023.02.02.06.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 06:32:02 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <5b7c223a-2c96-4bd2-7150-79a56281dd57@xen.org>
Date: Thu, 2 Feb 2023 14:31:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Reply-To: paul@xen.org
Subject: Re: [QEMU][PATCH v5 09/10] hw/arm: introduce xenpvh machine
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-10-vikram.garhwal@amd.com>
 <179d773b-2634-b52b-8836-8d8f882e1495@xen.org>
 <3e205146-5113-861d-ef39-c463257b54a1@amd.com>
Organization: Xen Project
In-Reply-To: <3e205146-5113-861d-ef39-c463257b54a1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6yH2BsOD+aIR

On 01/02/2023 18:22, Vikram Garhwal wrote:
> Hi Paul,
> 
> Thanks for reviewing this and other patches in series.
> 
> Please see my reply below.
> 
> On 2/1/23 12:30 AM, Paul Durrant wrote:
>> On 31/01/2023 22:51, Vikram Garhwal wrote:
>>> Add a new machine xenpvh which creates a IOREQ server to 
>>> register/connect with
>>> Xen Hypervisor.
>>>
>>
>> Is this really the right way? Is it not possible to do the Xen 
>> initialization (including ioreq server registration) off the back of 
>> the accelerator init (i.e. AccelOpsClass ops_init function), which 
>> seems like the right place to do it now that it's no longer 
>> architecture specific.
>>
> There are few other machines using the "accel=xen" option and few of 
> these machines aren't using IOREQ and other Xen related initialization. 
> Example: /xenpv/ machine under /hw/xenpv/xen_machine_pv.c /and few other 
> machines under /hw/i386/pc_piix.c//.

Ok. TBH the concept of 'accel=xen' is probably somewhat broken then. 
(QEMU isn't even running the VM in question, so how can it be 
accelerated?). Maybe abstract machine types really are the right way then.

   Paul

> /So, that's//why we moved the IOREQ and other common initialization 
> parts in hw/xen/xen-hvm-common.c and call them as needed for the 
> particular machine.
> 
> @stefano, just checking if you want to add any other suggestion here.
> 
>>   Paul
>>
