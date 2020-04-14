Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4857724lfm;
        Tue, 14 Apr 2020 04:05:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypL9F0x0RPhnzgecPqjteWWEj4ASkdYs5TmvAd98Qdq1gj1VRK6dGr+G6UUsOF4Has2BfVJi
X-Received: by 2002:a17:906:add7:: with SMTP id lb23mr11719905ejb.6.1586862356124;
        Tue, 14 Apr 2020 04:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586862356; cv=none;
        d=google.com; s=arc-20160816;
        b=pxRlhNDxiSIaI3QdhZUovYlymRht8557iSdcyVnU5+lzeZDEU8QFiai+y4PmxMYOLQ
         6RvX8QsFVhL4ghYgS2tTCg9VSTXt7CoYfAYnqfS0G97Nt1yY6UyjNhOUZdBWQikCpA7o
         /Alm1Nh23KhX6bXGwUWt+/d0uVmr3Rrp9cMSIYIi7xDX/jHlYnXHBoNkaveFCTKRlFBV
         hECrKg7ycDTe2v8bsixRCB+zkoL1j64TsQbSX4ALRB/STtLzO1q2hNDNBbCjS2HvOBZ9
         3/YJRXYaYEkdTpVRpM7Fh5dRZg0RUaL8j1xMbrxPqi6XkYOgbT4cNSTta0niKvEe78sy
         ayqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=fhKic4CgLDAITTVqOWLQc/a0CpGBlrbxOka9h/3X3Xg=;
        b=X5XCheLoAtbfM6pAn3ob0kP4+y/IhLM65DbMDSA0mAJnSJRa87vtGA6ask12OZfgiL
         Ywr6KsADLuhKa+6TEX3u3BPo0iGhlrgYhU/JGyI/pgB8khfkDxcVp08926IY/X3YiVQj
         zW6ge8gNkTGGEB0iHZnka3FGee9b8ZTe32NBC9OBwnaRVYtCWWsyBtP0E04S9/PpOx6f
         IefW5laH8Up715w5XGzxDw2WCfDAV10WPz1NFGviqJbwsXd/49n6SU+6no6NRiOqTOW2
         Dt3sJ2K+xlunzGJyyNaOUgzBcJMJqGiYOHN83RH55RaOabp9RyZosyOi0CpznyKmnU/t
         gRGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XEuBcdS0;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id cw10si5149721ejb.369.2020.04.14.04.05.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Apr 2020 04:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XEuBcdS0;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586862355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fhKic4CgLDAITTVqOWLQc/a0CpGBlrbxOka9h/3X3Xg=;
	b=XEuBcdS0OFyXc5GKlP2PmM9if4Twy6Vx7NuUpsh2jKxnMCzU7Y7dchXq2qdFvpK9HxcgHq
	njCBqOaEVX4YVNRsgUO8xuI3gs2+jjPZUnqv9aLvjqegH7o2/QYNhxLGnApm8hCf7Urbqz
	kUNGvkikxrCASU0KxofHEL1wMB/ZVco=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-_nRoPNl-PAuIqtDrsohJFw-1; Tue, 14 Apr 2020 07:05:51 -0400
X-MC-Unique: _nRoPNl-PAuIqtDrsohJFw-1
Received: by mail-wr1-f70.google.com with SMTP id h95so8446564wrh.11
        for <alex.bennee@linaro.org>; Tue, 14 Apr 2020 04:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IMZOTjQzgLyDI6M332pDffSdIQH9Z471mNNr3+WXrPk=;
        b=lX6bx7xYDyCcuWXZL5aClJ+01XRtrvUMw0al9TmPXgDeBYwWb3wQkYUhKu3KNKOGER
         zXrFi1SGmKOLBdqJ6YxF+VhSWJy/4XfvSrOYKhnpJCksaU0S+1XNqo9Mu12OhP2TI9j/
         2Nl7hQIz6ZW76Ii8B9ccsZP4Q7lbEk0H1Ky851ZKQmFqfwuFdZWT/ursAvO7H8cFBTve
         UE1QGJXav204/t/58BJzexTUNnI6EgKGp1UFQa2j2LeXd4QoIl+rqVEcPjmL9kufeRoV
         VAECA9D/FleBD6RRQ3OZxKllbJQUu5/12LlYU0O6ORlFy2aFwDQI1yK+ZEZLSVaj+B8j
         0QiQ==
X-Gm-Message-State: AGi0PuY9Nkgdqr095k+c+DjO/iKYiylKQFWMGS4BKuhFihUvbJ2cvgMf
	OLbqoqbIEznaELUBfqcUHmIIPf5RxIgUgWzpFRbrh56LaGHvPuYbMh9pgr6A9e7KlVPH0sTVC2u
	w9BWNiDSkpWtNv4nz
X-Received: by 2002:adf:c442:: with SMTP id a2mr21985004wrg.110.1586862349914;
        Tue, 14 Apr 2020 04:05:49 -0700 (PDT)
X-Received: by 2002:adf:c442:: with SMTP id a2mr21984989wrg.110.1586862349740;
        Tue, 14 Apr 2020 04:05:49 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id k185sm18888734wmb.7.2020.04.14.04.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 04:05:49 -0700 (PDT)
Subject: Re: [PATCH-for-5.0] gdbstub: Do not use memset() on GByteArray
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Max Filippov <jcmvbkbc@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20200414102427.7459-1-philmd@redhat.com>
 <CAFEAcA-PyMisjC25CSGyU5-ASjaAd7gQMabzMCR=uvudSBk-Fw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <357e2335-b00f-cd28-4ade-d6286ace144f@redhat.com>
Date: Tue, 14 Apr 2020 13:05:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-PyMisjC25CSGyU5-ASjaAd7gQMabzMCR=uvudSBk-Fw@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 4zl5tedksGhi

On 4/14/20 12:52 PM, Peter Maydell wrote:
> On Tue, 14 Apr 2020 at 11:24, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>>
>> Introduce gdb_get_zeroes() to fill a GByteArray with zeroes.
>>
>> Fixes: a010bdbe719 ("extend GByteArray to read register helpers")
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>   include/exec/gdbstub.h  | 9 +++++++++
>>   target/arm/gdbstub.c    | 3 +--
>>   target/xtensa/gdbstub.c | 6 ++----
>>   3 files changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
>> index 30b909ebd2..b52d9933ee 100644
>> --- a/include/exec/gdbstub.h
>> +++ b/include/exec/gdbstub.h
>> @@ -125,6 +125,15 @@ static inline int gdb_get_reg128(GByteArray *buf, u=
int64_t val_hi,
>>       return 16;
>>   }
>>
>> +static inline int gdb_get_zeroes(GByteArray *array, size_t len)
>> +{
>> +    for (size_t i =3D 0; i < len; i++) {
>> +        gdb_get_reg8(array, '\0');
>> +    }
>> +
>> +    return len;
>> +}
>=20
> The other implementation option here would be
>=20
>       guint oldlen =3D array->len;
>       g_byte_array_set_size(array, oldlen + len);
>       memset(array->data + oldlen, 0, len);

I thought about it but I'd rather not access GByteArray internals.

>=20
> For length values < 16 my guess is the perf difference is
> not going to be noticeable though.

On ARM it is called with size=3D12:

target/arm/gdbstub.c:50:        memset(mem_buf, 0, 12);

On Xtensa it is only used with unimplemented registers:

         qemu_log_mask(LOG_UNIMP, "%s from reg %d of unsupported type %d\n"=
,
                       __func__, n, reg->type);

If you prefer I can use a static empty buffer of 16 bytes and copy from it:

static inline int gdb_get_zeroes(GByteArray *array, size_t len)
{
     static const uint8_t zeroed_buf[16] =3D { };

     g_byte_array_append(array, zeroed_buf, MIN(len, sizeof(zeroed_buf)));
     for (size_t i =3D sizeof(zeroed_buf); i < len; i++) {
         gdb_get_reg8(array, '\0');
     }

     return len;
}

>=20
> thanks
> -- PMM
>=20
