Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp952611lfp;
        Thu, 23 Jan 2020 09:55:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqyPhZaKH1L7kkX28RzDgNKfdi3eg3jIERIRX8apuAM13G31GinG55grL89xh75H9fMS6Pec
X-Received: by 2002:a81:4ec2:: with SMTP id c185mr11670291ywb.423.1579802114197;
        Thu, 23 Jan 2020 09:55:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579802114; cv=none;
        d=google.com; s=arc-20160816;
        b=ojQxKd0ITSBN9PC/lsaaLBR7APHHjSQhfTt25MvcoMasZ1NpomKXrga3FeEEuX50WJ
         1e/C8RdZwupT3AlZCSynCN8ALwf50YX9MheerjDdDAA5vfFreSpxT75r5t45XyWLY2JJ
         +cfc4FzM1TC23lFjdUEk8kNSs1MxPLfE7TEx7SIpEVHTlsk3n3jrbg7GSMQGbs0GGbrL
         QnCwSQMAuXrS8NwgdJJfVUzpOkMvrdSjih6P/hqZcmLjBsxlseNzJm8j+1ybdBxDV9b7
         5QBHKQ/32Hwg2Azzb14A1g2+68xqiT0G+jCpxlnHxCPllp6Hfa778T6BIMwgRLBm90gy
         FISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=CsA7brPv5IiayWjJ564yZ0Wwt41HKNVlotkuFX3f/6o=;
        b=Vs+KkPNUYBxQkSwVufoVtmrivrESev9x0LqKxhYjqXb/ijQ5hlMjfynlrYKpLohD8P
         lDFmVC8Ps/3aY6MP2I91SueQjzFPsGkG/xQhGLBLY8r5yHIxQXR/NMLb5wqdfEHST7L1
         aDsbAvTJI30fU08BWmOEs1xL01aA7fo+KHdofY0IqYJYwddtWwJwXhNz9feKFLFfWuaN
         69oe6qD02o1vV+JlmXCtyqrgDP5Z0qdO4YEJdH36Ws1bvEl3NHR7M3A4Eng98Q0j/tsQ
         at6hke8Y3udVWSruU0Nswfjf3G8/rkiVYTcFIlv32eRZbEYVvDhjwGMuFVuVsejd9gcK
         R8Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H8VPBNLl;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g184si1624816ywc.35.2020.01.23.09.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jan 2020 09:55:14 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H8VPBNLl;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579802113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CsA7brPv5IiayWjJ564yZ0Wwt41HKNVlotkuFX3f/6o=;
	b=H8VPBNLlq8OqQdpSgn5D8ilLigkByPPSQ6bVKqR4vzDa9YAvmtcL8WtaTYkAM0D68p3c/i
	A6I2Hlh8e1vclQg8SQYpAs4u31DoAtt4dz3F/SIUROnMd5yf/gldzkKbtU+AbqBktMVsh8
	X9MUsza/wwDhs1JTYwIAQh28Kg7KzyU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-xyLPEDhQOYW4NHpr_06nKg-1; Thu, 23 Jan 2020 12:55:11 -0500
Received: by mail-wm1-f72.google.com with SMTP id b133so1486702wmb.2
        for <alex.bennee@linaro.org>; Thu, 23 Jan 2020 09:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0fl68LNmJbFTI1O/WBJWI+YervOar9TZo3leS9OrhI8=;
        b=bFPYct4Q5g35+TlFjTTdqyDnpLLJq9Jh8jgA+DrlQu74tL0o0vIqt7NdDhZ7uwwT9s
         F3tRGB8PqQuEjKJWfo0Np705UQ+9GvvAHTF4yguRiGuAlLskH7PkMJY0vaEvyHM0duIq
         JTuT+OyBAUq405j4oU+5CkOh4SNHZXP0S68cjZUtdVEUmnube7A5YCNZAotYGbpqSY6u
         ezb9iGQC7ZcgS1uz/xn/3olEbxsjdNXeGIJBrPgZJ5VEt0Q7lQo48JqxDwTUKeeMMuGp
         J+1H2MJL1U6klkYICq+j5TXf7/UynFkYGh37isRnOhvq2uvPJcuVKRwt7Hc/vw3kz96G
         ueqA==
X-Gm-Message-State: APjAAAWAnmz9WWVgBqaAYJZR7NLDwPD3u7dj58T2sVE6qVJGb0A/33sw
	yZ0YGpWhU42njQPhKkKfHbyNbDtc/ETkbA1Bz28fs3dp5vbZ7shLfl+zpEmmr2WYJNtN6TIvFlw
	lFQ1fsHzJbL7QRjzD
X-Received: by 2002:a05:600c:228f:: with SMTP id 15mr5568228wmf.56.1579802110479;
        Thu, 23 Jan 2020 09:55:10 -0800 (PST)
X-Received: by 2002:a05:600c:228f:: with SMTP id 15mr5568205wmf.56.1579802110302;
        Thu, 23 Jan 2020 09:55:10 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id u18sm3960739wrt.26.2020.01.23.09.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2020 09:55:09 -0800 (PST)
Subject: Re: [PATCH 0/6] Fix more GCC9 -O3 warnings
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Peter Maydell <peter.maydell@linaro.org>, Hannes Reinecke <hare@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Peter Chubb <peter.chubb@nicta.com.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org
References: <20191217173252.4672-1-philmd@redhat.com>
 <6a8266c6-7c6d-3139-249f-2dd46c98e02f@redhat.com> <87blquza17.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <47e28e48-362a-39ea-ee58-9bbe7d222394@redhat.com>
Date: Thu, 23 Jan 2020 18:55:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87blquza17.fsf@linaro.org>
Content-Language: en-US
X-MC-Unique: xyLPEDhQOYW4NHpr_06nKg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 9a55Zo2/BlnM

On 1/23/20 12:28 PM, Alex Benn=C3=A9e wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
>> On 12/17/19 6:32 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Fix some trivial warnings when building with -O3.
>>> Philippe Mathieu-Daud=C3=A9 (6):
>>>     audio/audio: Add missing fall through comment
>>>     hw/display/tcx: Add missing fall through comments
>>>     hw/net/imx_fec: Rewrite fall through comments
>>>     hw/timer/aspeed_timer: Add a fall through comment
>>>     hw/scsi/megasas: Silent GCC9 duplicated-cond warning
>>>     qemu-io-cmds: Silent GCC9 format-overflow warning
>>
>> Sorry, this series failed because I used this tag in the first patch:
>>
>> Cc: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>
>>
>> Then git-send-email was happy with --dry-run, but then failed:
>> (body) Adding cc: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail=
.com> from line
>> 'Cc: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>'
>> 5.1.1 <K  v  g  >: Recipient address rejected: User unknown in local
>> recipient table
>>
>> Note to self, enclose utf-8 names, as:
>> Cc: "K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n" <dirty.ice.hu@gmail.com>
>=20
> I never have to with my tags:
>=20
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>=20
> Is it possible to be more even utf-8? Sounds like a bug in the git tools
> to me.

The problem is the comma.
What do you mean by "more UTF-8"?
