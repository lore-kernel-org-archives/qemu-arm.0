Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1028899ejc;
        Fri, 20 Jan 2023 04:12:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsuzwyZpJxvREjpVmfTeU2zHqJH0EAGFJBJjcCzKf/j8D/O+YyFJt4jsl+K9NujICcC6seC
X-Received: by 2002:a05:6402:380b:b0:499:e665:8683 with SMTP id es11-20020a056402380b00b00499e6658683mr17266674edb.2.1674216743647;
        Fri, 20 Jan 2023 04:12:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674216743; cv=none;
        d=google.com; s=arc-20160816;
        b=FDRdFM8HtIrEUklGLGZhkPGnqyCx5u/6QPTQxBTROyrbcHY9PFN91sksLt5H/GLl6e
         0dpj64GKFd8h+TF/w6Wu/kdnBLsa6sxPZ414Vm9oTGhEydL2ElcjcvK6eBP3UjILZiei
         sUA85kEEyGmPsmo5QV1pr8fh8LG9RAAulZQqSp3aLPU4IZyX294ZAuqiig+k5lW/EonI
         8xNpEeRLAOc4ctdqI47pTHdGEbWbYbrfSPIAcuAM8d9eUC28pah6tHeFrsmy8DigI1Ng
         O/KVqKw9c13MwhjmtindTTWmb+QMHcGYagiEkpuJmVhboA/sPx9y844zEG43Qr4LXn+n
         1z2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8nMcQ/SSp1CsoDIgufVnjeQz+anrr2HiTCkaNW+Aw5Y=;
        b=MnYJYKuVIkIYMjO4CvargpnwaU1SiRrsKpN8VRZJAeQfabm96SfrPc50ckOBASAsV7
         afRH2s+AE2zMh4yowqJbifsaRMEVP8ix/FGBD/168UXkZWjUeUewGPTSZZHwDCAYH5ec
         JzpBDJGAkmZ/Ovf5yT3G/Jhmf7g1YN8trEfwlmnKDrAdT/pICg7MlsE3C5HIOOLVWpBG
         ADHcofcRkeacOkL0BSsuqqEw+OxQcx2I8GSXN3HwsPVUKGzYG4DJuv/HZyX1PcymJTdX
         vG7I5hqy5YSEJkD9YB/CC/QNyncvkqTkWae4kNeXAdiA4mHXWrJn08KL7kGt2gNvfXgn
         eyww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g6RPjKmW;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id fj4-20020a1709069c8400b00871f78c75edsi12123538ejc.826.2023.01.20.04.12.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 04:12:23 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g6RPjKmW;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674216742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8nMcQ/SSp1CsoDIgufVnjeQz+anrr2HiTCkaNW+Aw5Y=;
	b=g6RPjKmWpBIrp+JsuBcRmQYoDZKB1CvHEvf3n03OkXz2WI97nSQp8Rlj0JlcHPYDbgGWbS
	c2rX4W/Je+IXrq48rWtLVsJv7ZwJQonqd9EczBC32wVCM+TmGlfj5kKfcUsIak2UEaY2uq
	v2DOlr9KZJeaFKh+9uoqpz5a4kk3hs8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-B_pAzk7sMOaZx6swBz1t8Q-1; Fri, 20 Jan 2023 07:12:21 -0500
X-MC-Unique: B_pAzk7sMOaZx6swBz1t8Q-1
Received: by mail-qk1-f200.google.com with SMTP id v7-20020a05620a0f0700b006faffce43b2so3315000qkl.9
        for <alex.bennee@linaro.org>; Fri, 20 Jan 2023 04:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8nMcQ/SSp1CsoDIgufVnjeQz+anrr2HiTCkaNW+Aw5Y=;
        b=OxVUKRtvIRXLjdyJnvKKttSSUBnZn03YVztc43v91rQ61NcowMmIqPxFsqP7V7KYIA
         3rqN+OroopCtmjazsY//ekpUEoBXJ6IX1K0Ddujo9BSt4PB94yQynrk7rvmVzreBDumr
         PWfYUakdcTUe3sC1y9+5kMTpLVQf++78GTEmAZjOen2+hMQ9Ij4bYmXdVbk24C8p0jlW
         OoFzjOAruVIGIPrUtP38CfWkHmijjoEp7fPZcySf8ybwCb9yQhNDt3+2odvgPAXzaKF7
         inSyVDRSYx4amtaZaaCdQd3TBT/v5mtlZO/+5wvtqZHc0U1o4rXNeEQzAeDNlqrRbq5o
         GMJw==
X-Gm-Message-State: AFqh2kqDmO3GgRKyKBqcC0PltFM84++WEL41tlzxCY+UNx5MWu5HdyiZ
	0co9DW8PC7ZtTTVxT3m16XDD7tJUmkdkYdwFfuo7KRfA998MODhYa65bjYCKrHnqvCpeetfJukq
	bdXyI2QfKYbaJ4sKj
X-Received: by 2002:ac8:678e:0:b0:3b6:3df9:22ae with SMTP id b14-20020ac8678e000000b003b63df922aemr19231959qtp.18.1674216740687;
        Fri, 20 Jan 2023 04:12:20 -0800 (PST)
X-Received: by 2002:ac8:678e:0:b0:3b6:3df9:22ae with SMTP id b14-20020ac8678e000000b003b63df922aemr19231936qtp.18.1674216740473;
        Fri, 20 Jan 2023 04:12:20 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de. [109.43.177.118])
        by smtp.gmail.com with ESMTPSA id d2-20020ac81182000000b0039cd4d87aacsm20120159qtj.15.2023.01.20.04.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 04:12:19 -0800 (PST)
Message-ID: <7a6d10ea-3396-f70a-db4f-36b32379f376@redhat.com>
Date: Fri, 20 Jan 2023 13:12:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v4 06/15] tests/qtest: Add qtest_get_machine_args
To: Cornelia Huck <cohuck@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-7-farosas@suse.de>
 <20717e57-8524-5bca-efc3-ff294cda34f6@redhat.com> <87wn5hh0uy.fsf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87wn5hh0uy.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: cgAivNs2RCDL

On 20/01/2023 13.00, Cornelia Huck wrote:
> On Fri, Jan 20 2023, Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 19/01/2023 14.54, Fabiano Rosas wrote:
>>> QEMU machines might not have a default value defined for the -cpu
>>> option.
>>
>> Which machines for example? ... I thought we'd have a default CPU everywhere?
> 
> There's a patch further above that removes it for KVM on Arm... do you
> think that's a bad idea? In that case, I'm not sure what the default for
> that case should even be...

Well, if there is just one machine in the whole of QEMU that does not have a 
default CPU anymore, that calls for trouble, I think (as we can already see 
in this series where you have to rework a lot of qtests). It's likely better 
to set another CPU as default in that machine in that case. What about 
simply using "max" or "host" if TCG is disabled there?

  Thomas
