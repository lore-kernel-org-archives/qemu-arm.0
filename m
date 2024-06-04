Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2823733ejs;
        Tue, 4 Jun 2024 02:45:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgOwK9fBjVOTMS4lJ8PVuRm3FZ3963T6uOrAWqUF7N9ZdEWa42gzZwDt+YUiUF2qGF5oQgld8/qUGqJERO6OWUxv0EOjTD
X-Received: by 2002:a17:907:7e88:b0:a68:ce70:61f7 with SMTP id a640c23a62f3a-a68ce706471mr631505466b.17.1717494314945;
        Tue, 04 Jun 2024 02:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717494314; cv=none;
        d=google.com; s=arc-20160816;
        b=WurHZFfBeYPuh5z3xMV93+ooQDeF2rAPTc034KKWgTOJsKWutrkwmpBy13xO/B2cb8
         QkodaH7ILVDMN5ZGDzUeQHQVRff93U+BmU44JOuuDp9JX/yC6Mw8Qyu9RBy2988XRHEE
         S/L+wOWV2eOZZ271uGJixSS+GgEOSUDqWRhyF0J8ba167rehhSShTPgr0Mc6asDPUqBQ
         3At2P04D8CDRwnOFabVnpXGf67Pv4zOBR66RDq6TwLNzPBGAFOF8M6t4m7TytuXjvhyK
         Z4RTK9vHnjK7bmlLzKrWdHu7GI6pWNz8Fcbv6eUjYDkiHR6/BwbZ/AHMWm2LiH8RYvIY
         SaBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CDiA1iH3Is/8QelR5Op25gwEeDLmgqCOg99x/mjG4fk=;
        fh=oqkyRW3WNdIU0pZVrmmg9pOKrAH36YbNr51/lwZMILc=;
        b=DGYZ1xqiXB2rDUMmBimhrnd3rwlNl3WYAqed2p243Gnyj0u9+RRXpYzLbIbNYUPvdQ
         reg/dPkXJOBjcHl+lv6JeGQ0pQ/vGiols25rkwyasdl05itBVy1rpGcy++ccg6DOkEF6
         xA12/TZslMSV2O7kfuQj4IW3lCr/MzroXVRg0EzvBRN2k9+5gdkQMPbOIMZMZ3d0Fjta
         JwGTTdj+kP9UMOphZ6/6e5Fsr7lK0RGmGLCjemv93r7iqiWWq0SUBG3dt++0Om3+w98A
         6OtKHFpbXOV1nA1smo014cwBWZtc2tndTFXRJQpYQSSO4A7TF7ZJzSkj4OMNVam52XcV
         beRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vcnRuxWx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a67e75e83e4sor193183566b.3.2024.06.04.02.45.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Jun 2024 02:45:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vcnRuxWx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717494314; x=1718099114; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CDiA1iH3Is/8QelR5Op25gwEeDLmgqCOg99x/mjG4fk=;
        b=vcnRuxWxLHBR6ZghuPHkXEA5y4ysDJE6UsjSbgq3QExgyqPgeVuX6wBdll+l7i4LTJ
         Ct58aosLgTLsQnw3UkUG6WjZH7uu3nzsjYkjsrONjXWaRBmw8XFCC6+ma1mo8EAbYcM5
         URV3BrXKSBsgPVNEKoe3npd8lrkFCpRXUf+a/yMxUvITae7ZU8OsZr62d/dcRKJvfBEl
         QeaJbZcr49eeJleAf/XW5BbgJN9OHKoZwAb6697QimnmM9enoiAyh+F+sR50cdiooJoK
         JUeNp9z2cNChP2i+exA2AbL2bNdrf922aFJ5/+QeupvUYrV8nahGP8BHEQGcktRl00+4
         fOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717494314; x=1718099114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDiA1iH3Is/8QelR5Op25gwEeDLmgqCOg99x/mjG4fk=;
        b=fOVNZUpMfJX6Op8xxta0RvRtpAZKcX6mD5E2JL1+g3ViIAMvSzpNCptzfcJzGRZpk7
         p7eQMj3xLjilrIVrbFrrZus+eCaFIzf73ft3Iu5+MUONy3FkWiRb5BuC0xtl6NAKh1tZ
         Q2M2lAUpuGapPYSccFTKZbwXCKlwjzJGO9MHxf/I1xUGRsG0Yf2tEUXEdbS3p5jAze6j
         FPkUn6KxKh4TI065dKeL/mZFizmJeIGWk634wqn2zk4KqSrsFQDkAN6PNXUvpTcDJfHM
         0Wm8hkm8dzzdairBDiFNEfALA/hhs1e3Gve69sFgCXo0wyzwxK+nw0Ko62bsiulqMW8f
         4q1A==
X-Forwarded-Encrypted: i=1; AJvYcCWjip4TiC3XcKpPHlcl76vW1YpLuFtN1mE8xThKlZMI3eBH9Bd8fVNgtyseVyA2qD8S+Ew+OgMdCfQrrZMnU0Qba9yh2cjV
X-Gm-Message-State: AOJu0YwYcvkxx5o+G80W3MYt0tIwgR8D3fz9bi/aOdi8klQrpPIuHne4
	4x5m4a1Zmw2z7l+EsPWkhYgl9xFsxsi59bFeTbriG+M4RZ+UBGC2scneDJhirBpZjA==
X-Google-Smtp-Source: AGHT+IEHvEa9j4cG92UAr03wb2sMZwBzO7HNUulkcYcP5PACQ1RaK6qzU9j30BsYxhLKhDDaltZA1Q==
X-Received: by 2002:a17:906:2845:b0:a68:b5f0:3b31 with SMTP id a640c23a62f3a-a68b5f04030mr519947966b.72.1717494314352;
        Tue, 04 Jun 2024 02:45:14 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.159.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a691122859esm252602366b.224.2024.06.04.02.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 02:45:13 -0700 (PDT)
Message-ID: <fcb6ff5d-fcad-4eb1-9b64-0a8477954a0d@linaro.org>
Date: Tue, 4 Jun 2024 11:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] hw/s390x: Alias @dump-skeys -> @dump-s390-skey and
 deprecate
To: Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 devel@lists.libvirt.org, Eric Farman <farman@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm <qemu-arm@nongnu.org>
References: <20240530074544.25444-1-philmd@linaro.org>
 <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
 <Zl20rAjHLJlZkwxE@redhat.com> <Zl4tgFuAdjU2bst6@gallifrey>
 <87y17lcni7.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87y17lcni7.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: DAd65bfVYUMy

Hi Daniel, Dave, Markus & Thomas.

On 4/6/24 06:58, Markus Armbruster wrote:
> "Dr. David Alan Gilbert" <dave@treblig.org> writes:
>> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>>> On Fri, May 31, 2024 at 06:47:45AM +0200, Thomas Huth wrote:
>>>> On 30/05/2024 09.45, Philippe Mathieu-Daudé wrote:
>>>>> We are trying to unify all qemu-system-FOO to a single binary.
>>>>> In order to do that we need to remove QAPI target specific code.
>>>>>
>>>>> @dump-skeys is only available on qemu-system-s390x. This series
>>>>> rename it as @dump-s390-skey, making it available on other
>>>>> binaries. We take care of backward compatibility via deprecation.
>>>>>
>>>>> Philippe Mathieu-Daudé (4):
>>>>>     hw/s390x: Introduce the @dump-s390-skeys QMP command
>>>>>     hw/s390x: Introduce the 'dump_s390_skeys' HMP command
>>>>>     hw/s390x: Deprecate the HMP 'dump_skeys' command
>>>>>     hw/s390x: Deprecate the QMP @dump-skeys command
>>>>
>>>> Why do we have to rename the command? Just for the sake of it? I think
>>>> renaming HMP commands is maybe ok, but breaking the API in QMP is something
>>>> you should consider twice.

I'm looking at how to include this command in the new "single binary".

Markus explained in an earlier series, just expanding this command as
stub to targets that don't implement it is not backward compatible and
breaks QMP introspection. Currently on s390x we get a result, on other
targets the command doesn't exist. If we add a stubs, then other targets
return something (even if it is an empty list), confusing management
interface.

So this approach use to deprecate process to include a new command
which behaves differently on non-s390x targets.

If we don't care for this particular case, better. However I'd still
like to discuss this approach for other target-specific commands.

> PRO rename: the command's tie to S390 is them immediately obvious, which
> may be useful when the command becomes available in qemu-systems capable
> of running other targets.
> 
> CON rename: users need to adapt.
> 
> What are the users?  Not libvirt, as far as I can tell.

Years ago we said, "all HMP must be based on QMP". Now we realize HMP
became stable because QMP-exposed, although not consumed externally...

Does the concept of "internal QMP commands" makes sense for HMP debug
ones? (Looking at a way to not expose them). We could use the "x-"
prefix to not care about stable / backward compat, but what is the point
of exposing to QMP commands that will never be accessed there?

>>> That was going to be my question too. Seems like its possible to simply
>>> stub out the existing command for other targets.
> 
> That's going to happen whether we rename the commands or not.
> 
>> Are these commands really supposed to be stable, or are they just debug
>> commands?  If they are debug, then add the x- and don't worry too much.

OK.

> docs/devel/qapi-code-gen.rst:
> 
>      Names beginning with ``x-`` used to signify "experimental".  This
>      convention has been replaced by special feature "unstable".
> 
> Feature "unstable" is what makes something unstable, and is what
> machines should check.

What I mentioned earlier could be 'Feature "internal" or "debug"'.

> An "x-" prefix may still be useful for humans.  Machines should *not*
> key on the prefix.  It's unreliable anyway: InputBarrierProperties
> member @x-origin is stable despite it's name.  Renames to gain or lose
> the prefix may or may not be worth the bother.

Could follow the rules and be renamed as "origin-coordinate-x".

> Making an existing part of the interface unstable should be treated
> similar to deprecating it: we keep it stable for at least the
> deprecation period.  Not written policy, because we didn't consider such
> changes when we documented our deprecation policy in
> docs/about/deprecated.rst.
> 
> Alternative path to a renamed command (*if* we want that):
> 
> 1. Make it unstable.
> 
> 2. But keep it stable for two releases.
> 
> 3. Rename.
> 
> [...]
> 
