Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1680695njb;
        Thu, 6 Feb 2025 09:09:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXt1QSBn6DHckDQyLSW2W5ZT+D5zMPe3vuoeizl1K2kU3GnQWY4nW41EXTYPQJlfnuHfCREHrRb8xsARQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFzjPqL7AgkVwZ7Tzl1AST7pOPQPaIMnsWYjqx4PeuFcBjBrpgASdBQygq+QMl6ZjRW8qyk
X-Received: by 2002:a05:620a:2a0e:b0:7c0:174d:e353 with SMTP id af79cd13be357-7c03a04838bmr1194227985a.50.1738861740661;
        Thu, 06 Feb 2025 09:09:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738861740; cv=none;
        d=google.com; s=arc-20240605;
        b=aUvcfHk64+BFTy6DJwQFEL3AWg+2bCK+eqfbtjQfEU7wGJDX2E9NA05LaYFGkmTQhh
         mf8PPJE5yeLdZHHIhBEaDakkuo9dRQURUSuTfkLlC5wrK+sGjDV9UpanEpbjsTw/2168
         QKCNaU9k1UcQkHnGQtfMXOq1/ezEkW9VFx9g+/OMZUldg8XpR74U/TrE7JhdZWmzPROU
         AQIXIooL6luDq5q0i8IMQmpcznQ4vjB87Es4t8VXfc13dDUrGm6teRH8DrUs9MSfVcQI
         RWGjKfByxn16a+vnPfnyGPZJOrDMVfDEKImr8/vE39dN41lmOxO6IEjuqJVsTBtpJDZ+
         YMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=BG53nlMU04NGKq+xa3R9304BpAVaRsdp8Zom4aGenhA=;
        fh=LE2UbtLK678Zqz4eG4Eh9lI41yaZjqm2MK2aRwMtt+E=;
        b=hM2z1RZStsQ+yZLtZtkYq3E4RrMFKB2O5PzcJhRcE35oRB76YbMJyUOi278h7KdN8d
         4SCePR+EzoVQRuGczX0E5oRmZf3OQHIAxBagk6UfCucnsTAf/m1yWXptlrDHKWd+jJ/n
         O1AH2Wp3I81GFE5O4vr2zqs8ucTSfZ/AGsL9g5tyPbDA3f+e91SjgyxPXx1G5/BXSAAe
         4NH0uBurjEkDooAzoqC9wMYHsRXihNANHL8apaErRNQ2xqQZozs7Wu/rq7JZHIHwDCkL
         bDPEU2WbTFWj3XTxe6zKZtKJLoD3t3b/6VeISUyoPdLCWL6s8dFiLQLOXmkjw989BRqu
         nGyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gnHL7DLl;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c041eb4dd6si146499185a.364.2025.02.06.09.09.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 09:09:00 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gnHL7DLl;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738861740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BG53nlMU04NGKq+xa3R9304BpAVaRsdp8Zom4aGenhA=;
	b=gnHL7DLlFmtMAKgvuFDeBFFdvsSF90QN0h+jAFBHON3ZPmGh5C1ZIBcel4bM1hQwC/UCrX
	vUktZ1GcqKdCbmlvUJkw5ZGrqI18DrfiVjMoKGP51VysgguPG+fFqHUCHdFykgUJEsfzBA
	foxjBOaBPjU5PqssG7e9kOmNlxFURQU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-vtmmBaRQM0OEOI7sU_ZbyQ-1; Thu, 06 Feb 2025 12:08:57 -0500
X-MC-Unique: vtmmBaRQM0OEOI7sU_ZbyQ-1
X-Mimecast-MFC-AGG-ID: vtmmBaRQM0OEOI7sU_ZbyQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4359206e1e4so9947355e9.2
        for <alex.bennee@linaro.org>; Thu, 06 Feb 2025 09:08:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738861736; x=1739466536;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BG53nlMU04NGKq+xa3R9304BpAVaRsdp8Zom4aGenhA=;
        b=te702pXnNB/kUPvBPxTYho6loZPIV9Xuf45rxcQ70Qv76AXoTPfz4LaWNouQKtkxic
         pGDvLf74OtCHQZCCKTJlCe6V6+NLX7P2TKiZB0s7+V41jZz/Q8e1/M0CSxXdBRw0eN5L
         mfDHiu26XXbyMIR9mwAk4WFeE5pS1NvOG7XLfP21KJUWnhBr/Nw5ShPPPFHawlBZ8z1b
         0Zdp5LK6UPLR1aGjSlLK2Q/PzGV9C4FKlA6PMuVnfrRCHZVJnyku3Z5S1DYMkJs5o/Bd
         FZ+NM3Cye1oLZFMe8JrPmIfogh0np7cwPGGWX5aJGTaaO0a/LnDm9RS+2ZtTlRz3d8BD
         hRow==
X-Forwarded-Encrypted: i=1; AJvYcCVCoMCbKnVauJL8UUWokKXwsqpX7YsnPvUJpm1S4EDN8VoAiV7w/lTmJ03oNioU5IDcO3RWKe+39WZU0Q==@linaro.org
X-Gm-Message-State: AOJu0Yxo8WhBRjiiO/1psq6soWGCbZp3vx+MGZr64OA9DQjBYKXUbH7m
	I7f5U+9bXAqW4iWFUPZk04LlMMS632x62bkKe4Mc1dwi4zlR3v1W4wkyOzRVd8xJ8M16vias8mX
	qpTIvmB4W91wPOE5IFtZVwKmzy0M4BKr25bpkDzfDMhA0MVA4CbAZ5w==
X-Gm-Gg: ASbGncu/JjyGcRX8BD1UUySFL9GPl1ucm8+iLTzywbGKR081D9aTA8ZZq2+2+kLkY00
	VnPoQTLVgeMYYIj9YbXdB9Xsy720HgWmfbprIXhH/7sXdSxbWNar+LTE7CSUSQJvllL0xOjR3ba
	v+7WlIJulxYvWXAf4Zvir9G/C1MwMzbG32RVLzalivpQzB/cM2APtSVTaRdpzVd8MX8r8Kj+oLE
	ym9YnCd2efEJwFYuOOyJdztH4jkOzQFPzJkNiscZnQQ0xhG87IZcFdDZFnkJEQZVNt2qRbZU5+8
	Ztlfj+ytmr+5ZPF/6/QEaISuezqcLP7uYk5h
X-Received: by 2002:a05:600c:83c8:b0:434:fbe2:4f with SMTP id 5b1f17b1804b1-439249a7ad8mr2053575e9.23.1738861735768;
        Thu, 06 Feb 2025 09:08:55 -0800 (PST)
X-Received: by 2002:a05:600c:83c8:b0:434:fbe2:4f with SMTP id 5b1f17b1804b1-439249a7ad8mr2052965e9.23.1738861735332;
        Thu, 06 Feb 2025 09:08:55 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de. [109.42.48.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1ddaesm2177603f8f.85.2025.02.06.09.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:08:53 -0800 (PST)
Message-ID: <ece11f17-af70-4c17-9444-78de29405671@redhat.com>
Date: Thu, 6 Feb 2025 18:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anton Johansson
 <anjo@rev.ng>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-12-philmd@linaro.org> <Z6S3Mgt1G7fIjeBB@redhat.com>
 <4624f149-76d0-4da5-8f13-8c015043c335@linaro.org>
 <Z6THtfjL6UVhBiW7@redhat.com>
 <3156dc3b-9553-4b5f-a934-f29ee0601887@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <3156dc3b-9553-4b5f-a934-f29ee0601887@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: btnZUNjEw3DzzmYO0aImrQ8orHBzZ4xINB2jwigVy5c_1738861736
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ByLECIzySmew

On 06/02/2025 16.04, Philippe Mathieu-Daudé wrote:
> On 6/2/25 15:31, Daniel P. Berrangé wrote:
>> On Thu, Feb 06, 2025 at 02:53:58PM +0100, Philippe Mathieu-Daudé wrote:
>>> Hi Daniel,
>>>
>>> On 6/2/25 14:20, Daniel P. Berrangé wrote:
>>>> On Thu, Feb 06, 2025 at 02:10:47PM +0100, Philippe Mathieu-Daudé wrote:
>>>>> Introduce an abstract machine parent class which defines
>>>>> the 'little_endian' property. Duplicate the current machine,
>>>>> which endian is tied to the binary endianness, to one big
>>>>> endian and a little endian machine; updating the machine
>>>>> description. Keep the current default machine for each binary.
>>>>>
>>>>> 'petalogix-s3adsp1800' machine is aliased as:
>>>>> - 'petalogix-s3adsp1800-be' on big-endian binary,
>>>>> - 'petalogix-s3adsp1800-le' on little-endian one.
>>>>
>>>> Does it makes sense to expose these as different machine types ?
>>>>
>>>> If all the HW is identical in both cases, it feels like the
>>>> endianness could just be a bool property of the machine type,
>>>> rather than a new machine type.
>>>
>>> Our test suites expect "qemu-system-foo -M bar" to work out of
>>> the box, we can not have non-default properties.
>>>
>>> (This is related to the raspberry pi discussion in
>>> https://lore.kernel.org/qemu-devel/20250204002240.97830-1- 
>>> philmd@linaro.org/).
>>>
>>> My plan is to deprecate 'petalogix-s3adsp1800', so once we
>>> remove it we can merge both qemu-system-microblaze and
>>> qemu-system-microblazeel into a single binary.
>>>
>>> If you don't want to add more machines, what should be the
>>> endianness of the 'petalogix-s3adsp1800' machine in a binary
>>> with no particular endianness? Either we add for explicit
>>> endianness (fixing test suites) or we add one machine for
>>> each endianness; I fail to see other options not too
>>> confusing for our users.
>>
>> We would pick an arbitrary endianness of our choosing
>> I guess. How does this work in physical machines ? Is
>> the choice of endianess a firmware setting, or a choice
>> by the vendor when manufacturing in some way ?
> 
> Like MIPS*, SH4* and Xtensa*, it is a jumper on the board
> (wired to a CPU pin which is sampled once at cold reset).

If it's a jumper on the board instead of two separate boards, then I think 
this is a good indication that this should only be a machine property, and 
not two separate boards?

 > My worry is about how to not break what distros currently ship.

So once the two binaries got unified, maybe we could still add a hook 
somewhere that checks argv[0] and sets the endianess property according to 
the name of the binary, so users can still use a symlink to force the 
opposite behavior?

Anyway, you likely don't have to solve this problem right in this series 
here already, we can think of this later when one of the binaries gets 
marked as deprecated. So for this series here, I'd suggest to go ahead 
without adding the -le and -be machine types and only use a property first, 
then tackle the remaining questions later...?

  Thomas
