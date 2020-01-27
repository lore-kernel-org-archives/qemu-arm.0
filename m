Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3464527lfp;
        Sun, 26 Jan 2020 23:49:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwkln75YzxucyYeLfY1vAGhl9rZT6HN4obN/QD3uFKVfBvkU6kezh0vyVmohokU0RHZE2TU
X-Received: by 2002:a50:fd04:: with SMTP id i4mr12155591eds.311.1580111370453;
        Sun, 26 Jan 2020 23:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580111370; cv=none;
        d=google.com; s=arc-20160816;
        b=wHCIBg415/7OWveBTriudUlFklEPo4W3AyjQM/EUzsTFZfNNQ6+ssP8Od1Q9xdcAnM
         INC6FgX/MNOXeEPPOJ63LpvA8AEc9WxzkJIni4Kh4Ths15ufqbT16JfsWKhC8kFpd8aD
         bfiesgGVfnvn2WY0v7jje8pCBLWfedBBQh34WsTGtq9jajke5ehGWTiKSIrsgsNLya/9
         InAAJXKK6NeSBzBmEk2K4YHlPBoRdaHASVefBxIxNzReqCUDkZ1wvrT3mQDjYRbx8yV7
         dqP/q0vcgXPv13P+8vDCDBMWLP6Tx/OnpTBae/Bu0VDCAf7MRUqPTGXchfLCuzNdSWss
         jBDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=2isgC+Th+Y5lBOuihoALDvgG82ggvzF9Eoh0UOce5iU=;
        b=TESBiCY8qGy5PsYXISdENk73CkqhZ6a2CCWtLAfJRLTuYlOfeDZPrlwzO1eUdWCqfF
         jTXFaibk/1n74fuzFZTwytsj2Xnp7ctXJRLAZL0Hl86QphAo7lM58Re8crdb1swA9Nrg
         EB2JrG4XSDPI+g0m48/+PqEg6s9CbaJePym3DVPFIBSrDEIBmi5xmBcnVE8KH5CToHnu
         Ems6dhKGTk6ul5XyEeqm1rA2cFmoHv8nD2QYoGPWvIvP0Y2AYsW3/8pjg7TSRzdKnyPt
         dkQOMZXbNZ2BWsgwUYHGUJ8KbeX77Pcitxm8l1B9vID5ZsZnsvS+kBsbIqnSbKn3+y5n
         NpQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QYtJuItY;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id md25si8154313ejb.91.2020.01.26.23.49.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jan 2020 23:49:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QYtJuItY;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580111369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2isgC+Th+Y5lBOuihoALDvgG82ggvzF9Eoh0UOce5iU=;
	b=QYtJuItYhxRwxg3Aelgoi+Pf6MhRDdyDrpSXGeVWVN7zpTut1D/jx5nwN6DHv/QUprsKHv
	cc2rrhZIdfLDWDbJwnBX+MCXvseoVJNJE3Vnfm7TvZw6daPUU8pPq3s38G487csbCN6zLh
	sROWzqhmIhTnmOi0jijnQA69EXLuA2g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-_FbA4FZaPVma3MXeBpyOkg-1; Mon, 27 Jan 2020 02:49:23 -0500
Received: by mail-wm1-f70.google.com with SMTP id y125so2699725wmg.1
        for <alex.bennee@linaro.org>; Sun, 26 Jan 2020 23:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+KkpnSe7NgDwqjJ8ktjeHvyMM+wNpqJbSmqs6R84lkY=;
        b=SjSY6G9TBOeCwVhYDI/9HLtOd5gxiy0Qib+Kdt9mso1ZRLFSU8rcaOmQgfM30mg0wl
         uh73N//kK/VaFvD4/A2I1+VORjcEYZA89/5ptLO6pXPliaDbUkCx/TOrrLeYKTHxuzmK
         qdHFbdN47BdHZ15/p7VLDTIaCEPL/vyz4HmO68acdWlxk1FvAPr0KFDtC4XOAMqRPSF8
         YAkBYMZEhEC00TQi1vtxtPNk1wnwHQpPTFDJ6+sozoH/qQOZfUM0Mxv7St3/yUNOfVFJ
         IokXIpdXWxrCfd6El4QDt4rgxlzfZc1OQdGKvAdyvzRX9tcos4OUnk1cr8aL3L2MDHEU
         P15A==
X-Gm-Message-State: APjAAAVjmjfsPzqc87Zja4hdXLXC6fyb/KLkP2DalFqZ1MOIQvSJ3QRw
	W6qVPLt1lcoui0ZN7WxRZeFbS+/nBe2G/5iMhjZUH0szrOiDG1mthaiSPq+q5pAUl+CNTe8SKr6
	re2f1pl7F5op1oEWn
X-Received: by 2002:adf:ec83:: with SMTP id z3mr18981185wrn.133.1580111361039;
        Sun, 26 Jan 2020 23:49:21 -0800 (PST)
X-Received: by 2002:adf:ec83:: with SMTP id z3mr18981171wrn.133.1580111360839;
        Sun, 26 Jan 2020 23:49:20 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id q19sm17262137wmc.12.2020.01.26.23.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2020 23:49:20 -0800 (PST)
Subject: Re: [PATCH] target/arm/arm-semi: Don't let the guest close
 stdin/stdout/stderr
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20200124172954.28481-1-peter.maydell@linaro.org>
 <87zhec8w67.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <44ee8563-ced3-9416-4e79-1dccba02d27b@redhat.com>
Date: Mon, 27 Jan 2020 08:49:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87zhec8w67.fsf@linaro.org>
Content-Language: en-US
X-MC-Unique: _FbA4FZaPVma3MXeBpyOkg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: ZT6WgVGtrA1/

On 1/24/20 8:57 PM, Alex Benn=C3=A9e wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>=20
>> The guest can use the semihosting API to open a handle
>> corresponding to QEMU's own stdin, stdout, or stderr.
>> When the guest closes this handle, we should not
>> close the underlying host stdin/stdout/stderr
>> the way we would do if the handle corresponded to
>> a host fd we'd opened on behalf of the guest in SYS_OPEN.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>> ---
>>   target/arm/arm-semi.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
>> index 788fe61b51a..8718fd01948 100644
>> --- a/target/arm/arm-semi.c
>> +++ b/target/arm/arm-semi.c
>> @@ -403,6 +403,15 @@ static uint32_t host_closefn(ARMCPU *cpu, GuestFD *=
gf)
>>   {
>>       CPUARMState *env =3D &cpu->env;
>>  =20
>> +    /*
>> +     * Only close the underlying host fd if it's one we opened on behal=
f
>> +     * of the guest in SYS_OPEN.
>> +     */
>> +    if (gf->hostfd =3D=3D STDIN_FILENO ||
>> +        gf->hostfd =3D=3D STDOUT_FILENO ||
>> +        gf->hostfd =3D=3D STDERR_FILENO) {
>> +        return 0;
>> +    }
>>       return set_swi_errno(env, close(gf->hostfd));
>>   }
