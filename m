Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp100528ejb;
        Sat, 3 Feb 2024 03:56:39 -0800 (PST)
X-Received: by 2002:a17:903:11cd:b0:1d8:fb03:a01e with SMTP id q13-20020a17090311cd00b001d8fb03a01emr13421622plh.32.1706961399048;
        Sat, 03 Feb 2024 03:56:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706961399; cv=none;
        d=google.com; s=arc-20160816;
        b=i4zRyBaHJwKi7GDhwpIP5y+qmJZghBBqbZ8NyhASaj2R4/AmZ2b3KRakba0TaEICBf
         Jz24sJZ5JK59dEaTSHTnw1c8LI1NvBHpqS3jzbqHeuZDlP2/VAOoIBhguYp8NaU/UKJW
         vnHSN1fPriDWbj6NN8MHNGa0b9UGIXayrVEDBPpx/rvpNYZasS83YiLmpsMueZ49whn2
         TtpqygW6wDfy/e4X7lI9pqcvzpGxgf/QO3MD14Z34WYMoe/5ZfMVqUyrwMU1uT/xI6NQ
         VGBqGd1z4DwxF0Fd3KrUyqY911vdXmPCGkCCHSXE0PeuWqJxZdCkIyjv9+NjKJZnYJJp
         cXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bkQjBftO9m+++qBi2Wr4fsXvHgz/k5Iqw3XhapBO21g=;
        fh=BlIQGdfdcJVLP7VjRRsDVJE2CTxO0lVKBqNL5Ntpg74=;
        b=PJzvymhnZStVWT8UTjvQ6AqUeHKlOLAOKNkWTZndEOPiZ+t+IA9Vq4Icte1tVH+Leu
         HnxMI8J94dKARN3LJR5GbyBd6ypzLImABRjcrmnNO3ai39kyUVNZnfQRwEkXpoDPVlWz
         zaEksh/x9G0KX8cmHzVf/5iF5rFQLqdiFYz+LaCtQ6Y9rtm8HIn6bQboCu9nd6Ton2xF
         z2Gimv/xo1zclJwXOiocJFtVN/vYt64I+xC37ENJvleuT4ZlVSjnPuDFbTRuho2viY65
         FuLvoI5mjZuup5lX/HAFnr2QSkWBDROP9UmzdcgdYBUZIik/RiQ6hVX4Ni1Ix5u+rNi1
         lnbg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="Tf62p1+/";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c9-20020a170902d48900b001d8ffd8481asor2857653plg.15.2024.02.03.03.56.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Feb 2024 03:56:39 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b="Tf62p1+/";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1706961398; x=1707566198; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bkQjBftO9m+++qBi2Wr4fsXvHgz/k5Iqw3XhapBO21g=;
        b=Tf62p1+/1/wLlSHl4La7kp00MeWdiUt6Y6yDDlJWCWw3AJFaHgJc+20bdLvZzzZ7GL
         nL1DRf7DWWqorjRZ8jLO97E6n5eQL7UaZIml84S6XqqN1Y8aZECaGdhi6Zcvie0u6ISG
         FJG4MGjKnvOmo1r9lIZBFNci4eJpsDc5L2+wOuW01BfluozE27jmZ+eTWC3oindeJbm2
         1fYNYBPpb4hbOnVTuYcQKWT7Qg03BLtUplYAQEt4Gb7Ju9I4hAKatHDXZ+Md5ERdwudp
         +ipPmAS6YJHUoGjJOGrCoH9xsTt94qtoqlyP3w2/lZS+oyhER763cVMRx+u3WBeb1orH
         9NNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706961398; x=1707566198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkQjBftO9m+++qBi2Wr4fsXvHgz/k5Iqw3XhapBO21g=;
        b=mo00E8McdNtXbFmE1dbX5kim3mJAIYDeF2G0sTr1habZmcr0DsgY+f6aw8AL066RzD
         ZrfSLLuHL5tzF/NZM2Vy9CcO/45lsk/md0HE+izaBVBm3LgP1QTjHnLOs1MdCUIwM5YZ
         0XQc4VBfqxYQknXifdXkrADbMafyCFX5d64OrSQ38tr6tOviej/CreeyRU9DmBBuWOL1
         /zqtQ4eCyJXNj25I7E+lP9bP3E7g6LeYKHhiXcNbdHqfU/a5A6cejZ7x7Y1GBRxxpKcR
         MM/JzFb2OpJqYaVbmTTZIMtQPDfq0jFwX/le9R/k/+Zoe4qnf4XrVu7A6PzYGqlyKu4Z
         gmCQ==
X-Gm-Message-State: AOJu0YyxIXNVJSJWQTqD92CsTu1lxGoj2fyTv4dNvf2OkuOGlD0Uk5OI
	/COAmMjk31Ohky/tJ0txK++uqDJKYLXVeDB77/3FCytQxl981pxfToavMurAzQ8h0QdrkzHcucE
	X
X-Google-Smtp-Source: AGHT+IHB+AmjSBxtv5wYPSJMbqsO9run7tNYs9Khwxwkq68D/UBBem7OVeFSqNuKg8auq+cu2CpFdA==
X-Received: by 2002:a17:903:2114:b0:1d9:8ac8:d79d with SMTP id o20-20020a170903211400b001d98ac8d79dmr1339459ple.19.1706961398378;
        Sat, 03 Feb 2024 03:56:38 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU9w6jw97GTrrv2YrzHdBM9dTeWQ3vVHTI56/t5JZ3zc41gPoVX+1fgSED7vAQySu4hIf6KJcJO25caBrCb2bc4uPWYpDkKZo76S3gu0PCoBNWXYvcf98BFBkYi6CumHUVWOmuSXKQBJuyu8GXAeYRqC4R7lySSP32Ill/st0sOdtQQLfxXQ+68gn1ZXKUWDSNPRRbGgE+kBdbd+SvBUmooxD2s7W8TfRIz7W73Xgz3uCPZeY+xRalhm36fPJtLdk0ev8OOx5tdaCCjTMKgX0D9113dxr9Sse5+lGDTC0EQrWzfFOj/aLgU70mnENuxu5dBPZ0nAIOENnJV90PjrOdyk9cS3Sg2jSKxRTLeXVy6QSpZPe8/nJfZ5Iz0rYnfmRl1DskPHm3Ys16ui3CgVg5Yncrh49RujvCFamU7utyWnt0reuYzY434JFD1mbr5orJR1gsxeKo0YC+/M/DY7OxL6ah7jFiI3c9U1qozWLbF8hfhleWTwNxgWeWLlCJ6HmuT+E2PiG5JtSuqtBQmI8z3cOFBu0FUlu5i2uQ6yR5ogi9hmJeOcqIM/BQ8Atg1/G92t+WraYM9SFzyQwuMQHvETJo4j6J3MPtfkvtGYHcTiq9XKbjhiVw4KxwiP+H6x1EmbsZZgwd4EdF3kVhq1KbY8eWQwtmySGMTMc6RiuGTbH4EMMaaKK2zZziUWA86NWX9xYsmgrKZvi+biDgxXFU+e83WqQVPhTIVAwqAccqTpuZNYHmLTfEHCm6YEl3iiNWiq5j9x0NQOajkmvVx15TPuKI/ne3DS+aQiHa8nrxBmOYdbnfR7B5qcEVXNW9JeuvFh7IGm/St7fpXXXNHGUtC9bUTp94dnNbDU1Ciz1uSn0PWaw3aP9JR+cN24Ftcrr9HjQGVaZWwhPkMMBoDync9/+u63uxS5R9v9uQzbOqboWE+5cxQo0J6snNoVO9SZJroY9
 aXreSYG0y7+bBFPJOZHO8NvCI1L9LA+274wPonY7qpn7cBhFLyYV2lOYMZuIYlcBrG24h/I1JWwJ9zECGQMSXrVxWZ8Z4mz4kTnYoKeKpvqT/F/Pp9gGtSwyVn/ayVr8/h/erlkDjltIwjj4cAtYxxdyg8ZuGuemnE9XSbxp2UDxZtmFniE+8mJk0uXyfh37pcPvBS1bRE8NX+QuKgC6kvL2d2D5FmAPoeYI3Xmh85WWDp48Smp7rfOnGAC6TGDYOcfeSHysujFEycXMvJWulSAQOLLyOu9bS4JWC25fRguqK8NlKTJ4eWmL91uygH31Jhqouo
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.200.138] ([157.82.200.138])
        by smtp.gmail.com with ESMTPSA id mo14-20020a1709030a8e00b001d965cf6a9bsm1216785plb.252.2024.02.03.03.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 03:56:38 -0800 (PST)
Message-ID: <4291ba65-8a25-4242-a7de-bc403749531c@daynix.com>
Date: Sat, 3 Feb 2024 20:56:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/21] gdbstub: expose api to find registers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Laurent Vivier
 <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-ppc@nongnu.org, Weiwei Li <liwei1518@gmail.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Alexandre Iooss
 <erdnaxe@crans.org>, John Snow <jsnow@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Woodhouse <dwmw2@infradead.org>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Paul Durrant <paul@xen.org>
References: <20240122145610.413836-1-alex.bennee@linaro.org>
 <20240122145610.413836-17-alex.bennee@linaro.org>
 <1c9a2e94-0c54-446b-99a2-69e25e9725df@daynix.com>
 <875xz5pyaq.fsf@draig.linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <875xz5pyaq.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MjMc7t3u3+0f

On 2024/02/03 20:44, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2024/01/22 23:56, Alex Bennée wrote:
>>> Expose an internal API to QEMU to return all the registers for a vCPU.
>>> The list containing the details required to called gdb_read_register().
>>> Based-on: <20231025093128.33116-15-akihiko.odaki@daynix.com>
>>> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> Message-Id: <20240103173349.398526-38-alex.bennee@linaro.org>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>> v3
>>>     - rm unused api functions left over
>>> ---
>>>    include/exec/gdbstub.h | 28 ++++++++++++++++++++++++++++
>>>    gdbstub/gdbstub.c      | 27 ++++++++++++++++++++++++++-
>>>    2 files changed, 54 insertions(+), 1 deletion(-)
>>> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
>>> index da9ddfe54c5..eb14b91139b 100644
>>> --- a/include/exec/gdbstub.h
>>> +++ b/include/exec/gdbstub.h
>>> @@ -111,6 +111,34 @@ void gdb_feature_builder_end(const GDBFeatureBuilder *builder);
>>>     */
>>>    const GDBFeature *gdb_find_static_feature(const char *xmlname);
>>>    +/**
>>> + * gdb_read_register() - Read a register associated with a CPU.
>>> + * @cpu: The CPU associated with the register.
>>> + * @buf: The buffer that the read register will be appended to.
>>> + * @reg: The register's number returned by gdb_find_feature_register().
>>> + *
>>> + * Return: The number of read bytes.
>>> + */
>>> +int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>>> +
>>> +/**
>>> + * typedef GDBRegDesc - a register description from gdbstub
>>> + */
>>> +typedef struct {
>>
>> nit: Add struct name; docs/devel/style.rst says struct has a CamelCase
>> name *and* corresponding typedef, though this rule is apparently not
>> strictly enforced.
> 
> I think the wording is a little ambiguous here, especially with the
> reference to typedefs.h where the anonymous structure typedefs are held.
> In this case we don't need the structname because there is no internal
> reference to itself.
> 

The majority of structure typedefs have tag names though; grep "typedef 
struct".

That said, I'm fine even without a tag name. As I mentioned earlier, 
this convention in QEMU is not consistent, and I have no other reason to 
have a tag name.
