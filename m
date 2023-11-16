Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3579513ejc;
        Thu, 16 Nov 2023 07:48:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKpI5xmf5ioBLEyW4SYvMq+BvA9/EzFpxbSbikJqFvLM58tajSmKxfgBlunC3btyj3zrCz
X-Received: by 2002:a67:e098:0:b0:45f:6490:b6c6 with SMTP id f24-20020a67e098000000b0045f6490b6c6mr11384005vsl.18.1700149723249;
        Thu, 16 Nov 2023 07:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700149723; cv=none;
        d=google.com; s=arc-20160816;
        b=PjnfAYrcU/d2Mnk61thAvJIsHiLEoOx8bhNZY9+l7WhP0wB05iLlmVyBAX57g4dGOM
         Q2LR3QdqLVaRCl1Cc6bfq0/i1Ij533Ss0sO+iJHytg5mhALkO5U2w/RsOCVFUMfB/mZV
         uLMUBPWSjoY6AuFVe8z6Kr1ITkBPPlm2dg4WQP6LjJ57oZn/qBGFKaJTViKhe/50tEFV
         +L2T045loYmcKD4SXcJXYZiEr0MGbvBervjsbQZQeBfLGCiCSK7vLBNDMDD4/jBLYtj1
         f0B98bZqqGHUX/W2jysyWQavBE2HuepkikFl0lqF4QeEoIA0d/M3EqGKd+iNrsJ/WVU5
         pENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=PncKhv7RlipPGQAqM/anQZy5pF106X6pETcgPdX4raM=;
        fh=7L/5xmHabEsjP0P7zru1qK3twFt3EQ7ypChsSOg1i2A=;
        b=RP6hE940m7f1dtnrZ4P2b5+VXepoV3cuDtf6CZO/mCwqwbFfXe8KvncO+AD9yi2WnO
         VWaRSQTh5UG2ONIvc1EGT4X5jezWg4UPciqXC1UU/1Vi9QzATErOTa33+H6qyZAuHnqT
         PrRFs3SB2mdygkzyn4dlefGZ0m/HwS7HCRbaKV0n0hvI+mJqlfkZf4mkvteRWa4qYy2H
         4c7bGUMvwnHO7SpvwAAClsZf52nyjN8930K00KLYg+YCFzFAQQcorsJ7XbqX2Cp14gmU
         WwBFa9h7GLX1ddw4Tv9tE3qwswKxCXQEE3+vPkdwt+UstX/EQuoMC0dYXvUyCluSUW+W
         BxtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ECqDV5Sw;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id t1-20020a67a241000000b0046271f498edsi254633vsh.154.2023.11.16.07.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 07:48:43 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ECqDV5Sw;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700149722;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PncKhv7RlipPGQAqM/anQZy5pF106X6pETcgPdX4raM=;
	b=ECqDV5SwUFQV+w1ccavyIX/lSsli6yOwLpuNXvfL93ORj1lYoWpK6bjg+ZnMktiGjh4pqk
	DzAiPy1fG71zdB7YNmVsrjqJB48XK8coS8YMS9TOb2FCyKOrqGHu8EhlyU7TMnd3VA8Hb1
	XgQpDA6vcyrmB2c6GPvIDv3YqCUQ4Ho=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-5_QfBPO3PL6fjkUtwtTVtw-1; Thu, 16 Nov 2023 10:48:41 -0500
X-MC-Unique: 5_QfBPO3PL6fjkUtwtTVtw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-32fd5f7b674so440229f8f.0
        for <alex.bennee@linaro.org>; Thu, 16 Nov 2023 07:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700149720; x=1700754520;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PncKhv7RlipPGQAqM/anQZy5pF106X6pETcgPdX4raM=;
        b=rSkTq8nS13VX2gd+NTA9VuRb6QPalDxqBW2NieSGHdisAJTpGBeWEB7B5gu9w7cpsR
         52f0kinO5ke6kGUYb39yI3Pc93NhfL3B777EqTCUOtd2wVl6DxWjKdAxFnzuTuSeeeed
         aN3/4doMxpoV1+ui1ZIzPRRcPVC9jtEF2zq/zzypoC+Ay2VjlMqFOroMOSWeKZPPq5NV
         cglBmVh8Eg1cj9feXhl8bY7G5liT6TRSqSykH3fGqslcE1xB32slmKQqE+YbtCCwb607
         WDZ4s3F6JeOzIrXkSFAcOxlMbAGPGSyWknGoN3RWnDQ8ElBSKATXY3m6gFnSh4s5uyGE
         IL5w==
X-Gm-Message-State: AOJu0YyxV12TtKbiVyOi+3WfO6INSyXJJ3eyDrwl0eLlMnZgpkVnRiOa
	w/gNZD0emHBIpnrWmnwT+KftMjV+usiUScqHUyvKE/tze8EYn2hYDWfeqdXKqCLnvBMhGmClzWK
	tbbBHL/W86pS38OcI
X-Received: by 2002:adf:ea07:0:b0:32d:9b32:8a7e with SMTP id q7-20020adfea07000000b0032d9b328a7emr9586633wrm.71.1700149720411;
        Thu, 16 Nov 2023 07:48:40 -0800 (PST)
X-Received: by 2002:adf:ea07:0:b0:32d:9b32:8a7e with SMTP id q7-20020adfea07000000b0032d9b328a7emr9586621wrm.71.1700149720034;
        Thu, 16 Nov 2023 07:48:40 -0800 (PST)
Return-Path: <quintela@redhat.com>
Received: from redhat.com (static-151-150-85-188.ipcom.comunitel.net. [188.85.150.151])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600010cd00b0032db8f7f378sm14080769wrx.71.2023.11.16.07.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 07:48:39 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
  qemu-devel@nongnu.org,
  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Alex
 =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,  Gavin Shan <gshan@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
  Peter Maydell <peter.maydell@linaro.org>,  Evgeny Iakovlev
 <eiakovlev@linux.microsoft.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH-for-8.2 v4 09/10] hw/char/pl011: Add transmit FIFO to
 PL011State
In-Reply-To: <45ef60fe-dcb6-461d-97e1-d19e5174075d@linaro.org> (Richard
	Henderson's message of "Thu, 9 Nov 2023 15:24:16 -0800")
References: <20231109192814.95977-1-philmd@linaro.org>
	<20231109192814.95977-10-philmd@linaro.org>
	<45ef60fe-dcb6-461d-97e1-d19e5174075d@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Thu, 16 Nov 2023 16:48:38 +0100
Message-ID: <87o7fthf6x.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: q6aPhDb/Z/3A

Richard Henderson <richard.henderson@linaro.org> wrote:
> On 11/9/23 11:28, Philippe Mathieu-Daud=C3=A9 wrote:
>> @@ -436,6 +438,24 @@ static const VMStateDescription vmstate_pl011_clock=
 =3D {
>>       }
>>   };
>>   +static bool pl011_xmit_fifo_state_needed(void *opaque)
>> +{
>> +    PL011State* s =3D opaque;
>> +
>> +    return !fifo8_is_empty(&s->xmit_fifo);
>> +}
>> +
>> +static const VMStateDescription vmstate_pl011_xmit_fifo =3D {
>> +    .name =3D "pl011/xmit_fifo",
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .needed =3D pl011_xmit_fifo_state_needed,
>> +    .fields =3D (VMStateField[]) {
>> +        VMSTATE_FIFO8(xmit_fifo, PL011State),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>   static int pl011_post_load(void *opaque, int version_id)
>>   {
>>       PL011State* s =3D opaque;
>> @@ -487,7 +507,11 @@ static const VMStateDescription vmstate_pl011 =3D {
>>       .subsections =3D (const VMStateDescription * []) {
>>           &vmstate_pl011_clock,
>>           NULL
>> -    }
>> +    },
>> +    .subsections =3D (const VMStateDescription * []) {
>> +        &vmstate_pl011_xmit_fifo,
>> +        NULL
>> +    },
>>   };
>
> It just occurred to me that you may need a vmstate_pl011 pre_load() to
> empty the FIFO, which will then be filled if and only if the saved
> vmstate_pl011_xmit_fifo subsection is present.
>
> Juan, have I got this correct about how migration would or should handle =
a missing subsection?

I hav'nt looked about how the device is created. But if it is created
with the fifo empty you don't need the pre_load().

I have no idea about this device, but sometimes it just happens that if
the fifo has data, you need to put an irq somewhere or mark it some
place that there is pending job on this device.

Later, Juan.
