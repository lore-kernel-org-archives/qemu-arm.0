Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp330573lfg;
        Thu, 18 Mar 2021 05:50:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCAFptengfjrdgNTAncSI0vfSFHw8VoNDvgpzWWQZpOihRrOXtfzT/fsm/a2bbC989sK43
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr9525257wru.366.1616071816100;
        Thu, 18 Mar 2021 05:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616071816; cv=none;
        d=google.com; s=arc-20160816;
        b=WWiNsv+mui6Ib/vWgn26Sb4DKJZ/WSyUuVngtNy+h2pFQJx2Ca9+nA6JENI2HFkAtv
         my2DlpKz4COUFmmpIy7B9Lyg9wwikH+JxFeoV8FNCW/aJdmjUZ/GsCJTClNeyoQshfk8
         uSEwG55QzhGuukygDX/jYox8H4JxYr4HlrQxwN9dbaY/so+ummUB5HSrrlQdLbuZ/1F0
         6p4eSSDS/3borkLg7MMhT8Pv/54ON18trkKvyT9HDST7VzTveeiYj2YUgwHweP8sKj7p
         3K+znaNXMRuo2Gdhi6ImtKBIVKm9DE54MbASdAxWmuMg+LZAIk/etqNUUfR8fqetS+vE
         9zhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=52WOGLQ+ZJyVFakBUNzQoGDcH1ps1XG/BT6J15OJZek=;
        b=FfmT2462VZS9wRNauxkab0kj9xkOvLA0o0SS3gm9sB6jDQK1paxBcrZi/d0gI4NXuT
         rHBWIXXlpwrgfjaca49WeC1JI7I40EMHVdofA/6wPLVE3q8ORMYELnf7yHflZWhjg10A
         CCIQSgy5rhFYF5dWwdpM6lMAoD8+93aulKa8AymrqB7lfkBD1VoLyyVJs6JCZSF5GHth
         7G5PB491xNw6U5apaoVEPEttwOeJ2KoIKGv8a2VWskcQTmCC55mKgznNamrF2jg4FRLt
         M3WPA4RlFxVGVpBaZee8+M5Qmb5gJcFkJ5S8GMx36nrPdQG7LikchCg/S64UXaxQtkkh
         De6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id 7si1983699wmi.175.2021.03.18.05.50.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Mar 2021 05:50:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A4FEBAC75;
	Thu, 18 Mar 2021 12:50:15 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: Andrew Jones <drjones@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
 <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
 <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
 <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
 <cd4caf9d-c32c-25fd-a27f-d352ece74ed3@redhat.com>
 <CAFEAcA8YybFf1=wQ7-scC2JnQEHr9nx0LBvt16dTBOXV0KuMAg@mail.gmail.com>
 <28540fd5-3bd3-30d7-624d-da21d0f39806@redhat.com>
 <CAFEAcA8t3Roq2qL1RTru1H+WZAQMVmWcN=VjCtJkvAzmyws_YQ@mail.gmail.com>
 <20210318123727.vfjaecuklzicmprn@kamzik.brq.redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <f41c34dc-2cad-5929-06d8-6ea098ab5b8a@suse.de>
Date: Thu, 18 Mar 2021 13:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210318123727.vfjaecuklzicmprn@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: sDyzyp/XpLgD

On 3/18/21 1:37 PM, Andrew Jones wrote:
> On Thu, Mar 18, 2021 at 11:38:51AM +0000, Peter Maydell wrote:
>> On Thu, 18 Mar 2021 at 11:31, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>> I tend to agree. The problem is for the running VMs started before
>>> 82bf7ae84ce (so up to any fork based on v5.2). I don't know what
>>> the forks are supposed to do with the running VMs if they want to
>>> migrate them to newer QEMU (or upgrade the host QEMU).
>>
>> Anybody with a Cortex-A15 KVM VM is just going to have to stay
>> with their pre-existing ancient hardware, their pre-existing
>> host kernel and their pre-existing QEMU binary. That's what
>> "we deprecated and then dropped support for this" means:
>> we no longer support running that kind of VM, so users who
>> were doing it need to either do something else instead, or
>> else just keep on going with the old versions they have.
>>
> 
> I strongly agree.
> 
> And, downstream-wise, I can't speak for anything but RHEL, but RHEL
> cannot have this problem. There are no 32-bit ARM builds for RHEL.
> 
> Thanks,
> drew
> 

I don't see a strong issue with this either, there is no 32bit support for KVM ARM.

Thanks,

Claudio
