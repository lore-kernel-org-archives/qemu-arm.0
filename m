Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp854922njm;
        Wed, 5 Mar 2025 06:56:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUdTtZ9UzP0fG9qDX/6Ki93KqhjFHa9v4aWcNrgPudzMvjUiCemRec0Lc87G+COa90oPgsMIIOs3U/H0A==@linaro.org
X-Google-Smtp-Source: AGHT+IF0ygK+HnaeFlJg7KAXnqwv2VbCjyKj6sUH5iT4a5aWzRS1IjdbucAvYyKJrD+Ydx38qDVw
X-Received: by 2002:a05:620a:2690:b0:7c3:c4ba:d892 with SMTP id af79cd13be357-7c3d8ef9025mr655636885a.54.1741186591425;
        Wed, 05 Mar 2025 06:56:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741186591; cv=none;
        d=google.com; s=arc-20240605;
        b=APeJNBTSSoYM8c7nBLZIN3gyy3zYHtnIpmZgAw1HRBM72bNkXaJ6HySbzaw3sJw+2v
         GayVGa1iVvg/OJkfx9zTQ+LEpL6Fe526F1iNbh5R7o1ncabQbkpp6tE2sz4btfvrK7N3
         7b6BRt4DLfm/jZMv+mx/tExSnlBKgZTC+CWUAEeFqJ/mk+4EIu7dFlqLkSiTr0oH1qfq
         cno8x8SJYjUKslR0sPSfiFNLwPfRHdwN6vHg3lCpU8nEHeqQsqlzZ/XgGVt3gbP0BTKn
         g+aNjMZ5s5+dX1V2qayEytB2RdpAIAuWC3J2MyAA1/BURef4hPVtqqqTZMkCpCHJ7qjC
         PCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PioQ5undYVeEE9b0UYezdduIYqmaDGeuu0d+xdqMB/E=;
        fh=Bd1GV6Nkm+ILsUekPc6vyDzsPpdXlnHW8oCSyrxI1Wc=;
        b=aNrpdGw0wkbu0twclwIrtbA4q0U1hirjQJKrjSvsF6JqbCeYcWWFD+UNocKCzD3h2A
         RjDqR42NUdVo9bEYYPPC/MWn8GdbIE5SSzE6LNwB3aaOLtAwW0O/ABk+ve1A8+kL7+2P
         FKgz/VBGDYLncY1pz1h9M91SGbL/M6e5GykWTDCTutm8uiz1e/pqNileuGeGx8opuZoR
         LuvgxFFD9LNfwXOyUyxXfljzdww/vQQ+K6d3kKVAYZIbUL0XtiexQKfNEJVQfKlEtCZR
         zAKsGyLiWjKC+kp2zMy5XMMrhmoRvcPdgDt7m6ki2G7NHpYGMCOrzAtQAIjBC1rRBYrv
         umBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lc+PpELY;
       spf=pass (google.com: domain of brian.cain@oss.qualcomm.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=brian.cain@oss.qualcomm.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Return-Path: <brian.cain@oss.qualcomm.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id af79cd13be357-7c3bcc0042dsi625519285a.615.2025.03.05.06.56.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Mar 2025 06:56:31 -0800 (PST)
Received-SPF: pass (google.com: domain of brian.cain@oss.qualcomm.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lc+PpELY;
       spf=pass (google.com: domain of brian.cain@oss.qualcomm.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=brian.cain@oss.qualcomm.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525B14a1031245
	for <alex.bennee@linaro.org>; Wed, 5 Mar 2025 14:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PioQ5undYVeEE9b0UYezdduIYqmaDGeuu0d+xdqMB/E=; b=lc+PpELY6yQs5QCa
	DLnVq+J2xtpCNKJvWzz6/HGN8jHz3nvu/E/azYw18AU4V6RnL7I0JoJiC/uh9AOk
	JzQ4A1mZeWWw2g9o+s0/Hg7Bro/gYScQSdTXrAZ3mRfj2J9u+XbitNyIKQDQdFo0
	MldrusAKF2N8JKcfwMP4YkfPn8c+WQ9snHZEU8C1BSgXw3wCP2SHh/SY1NZGHbaZ
	ZGMu6A6HibBn+xLQVM+EZ0zBJZNVHU8HcUANqolkHEfqRwGGNCHh+V9IT1u/YdB2
	gqaGzSShDdXsRtI56mR6AO0cPNAiFx5brjpvzOFbivkazDvsS6SwT9J+tEffuRGY
	mcPtyg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t5pj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <alex.bennee@linaro.org>; Wed, 05 Mar 2025 14:56:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4750dbf9b61so13417241cf.2
        for <alex.bennee@linaro.org>; Wed, 05 Mar 2025 06:56:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186589; x=1741791389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PioQ5undYVeEE9b0UYezdduIYqmaDGeuu0d+xdqMB/E=;
        b=GRcQ5lVL9X3YOYMwRHmjktkfndeyhm0igt7yBzGOwzwbxrz+uhH7+9l6MqaS7cRZCV
         USTXBw/zOC8tRMMvQyig7pmuoi9Q/MHBa+dOAWKG62BqCj9nmKg1PHeyQcrsjCrrGpRb
         GlHQsiALAuSqAfwqNgYKZGeyjvgioXILGEKj+JzSH28LkU0XmCTFHA5YCwoj2yT4JIjv
         0BGQx/0IQNdSb6Ay6LXsK6xS+bPlKz1TuSehdlR0ymzowW9EJrgTLIg0z3axoiagsuvP
         XbUHCQMHIvvDksU9Df478sNV4NOq7GJkf96k29upPaAAxEgytLB7LsBhJoCeXEZ1xscE
         GHQA==
X-Forwarded-Encrypted: i=1; AJvYcCWfgtM6MVQcRuPx8foLpc4cHia0WuJmd96wRB6AAvC2ReebLHFlVf90SEQntTvJUbz+nz1biaMR0GuVQg==@linaro.org
X-Gm-Message-State: AOJu0Ywhzubh5XHF7Gnh0biViNnzG5+cX+EbnYHVCFoVL0tLC9WQO+6e
	sgxq1Wl2mekzAwzJ+5lApzsyHx1iHnyF1glM4jrLY4hyieRetmg+HnVsb03HANzCPJszYutUUYU
	/QG67940W+OdIgYXmuUGmjYvVOOzSTGl1FysiJLfbVYNrPo8yBW/kk/KUEFpmcAA=
X-Gm-Gg: ASbGnct82yg7f0HIhxNyxzRRVWq2nbh4uVBOGDzOgmaZyxZ8Ix4szWdz6t8ZSZ8QTfU
	SoXoaYh5J3GYVUvEYwZnUokqwKmEHapbXr3L9tNYvQhQS4WPItB7ZhGBWfVMzsgw8LSznFrPCUj
	ukmx/iFcLQu6bBGrxe0G+ZRrvD5KUFJ5HOCmDttjWi0qmERVW67ve75hGShOSFQ1pTqv4OlZ8do
	DAVOYLiDQgRsK5ItQ9jp2/8P3E4NtHd3Oeigj2jDSTMJe1jFYKJwsBV1ChnfsfOevQXOFp6dBVc
	hQQLIRuebr7BVdsEDnrNeHM0ARvb10G6zd8WrYEoVgou6Zkwe+Ot96lYXYloFEKoBfKq+HWhbEu
	GQV+JzHYO39JeXrzA
X-Received: by 2002:ac8:580f:0:b0:472:614:19a0 with SMTP id d75a77b69052e-4750b4c7ef3mr47681331cf.35.1741186588611;
        Wed, 05 Mar 2025 06:56:28 -0800 (PST)
X-Received: by 2002:ac8:580f:0:b0:472:614:19a0 with SMTP id d75a77b69052e-4750b4c7ef3mr47680851cf.35.1741186588194;
        Wed, 05 Mar 2025 06:56:28 -0800 (PST)
Received: from [192.168.1.157] (104-54-226-75.lightspeed.austtx.sbcglobal.net. [104.54.226.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4750c7ba271sm10308701cf.14.2025.03.05.06.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 06:56:27 -0800 (PST)
Message-ID: <2de21adf-204b-4417-aa2b-2d16d22148f8@oss.qualcomm.com>
Date: Wed, 5 Mar 2025 08:56:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/tcg: Suppress compiler false-positive warning on
 sha1.c
To: Peter Maydell <peter.maydell@linaro.org>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20250227141343.1675415-1-peter.maydell@linaro.org>
 <87o6yh57r2.fsf@draig.linaro.org>
 <CAFEAcA9VDtWKoQ09dOt+ZxJ2MhdRTFY_X1ON58pEjYTM_NtZ-A@mail.gmail.com>
Content-Language: en-US
From: Brian Cain <brian.cain@oss.qualcomm.com>
In-Reply-To: <CAFEAcA9VDtWKoQ09dOt+ZxJ2MhdRTFY_X1ON58pEjYTM_NtZ-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wyjLBUaj48MF8WbDn2WKbrGM4nxT28RJ
X-Authority-Analysis: v=2.4 cv=KfMosRYD c=1 sm=1 tr=0 ts=67c8661e cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=x6rl1zRT+JsLSO7OGbGBKQ==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=1CxfK888tdwoY2JWDiQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wyjLBUaj48MF8WbDn2WKbrGM4nxT28RJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_06,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050116
X-TUID: cCd4bPH9x6+Z


On 3/4/2025 6:51 AM, Peter Maydell wrote:
> On Tue, 4 Mar 2025 at 11:56, Alex Bennée <alex.bennee@linaro.org> wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>> +# GCC versions 12/13/14/15 at least incorrectly complain about
>>> +# "'SHA1Transform' reading 64 bytes from a region of size 0"; see the gcc bug
>>> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106709
>>> +# Since this is just a standard piece of library code we've borrowed for a
>>> +# TCG test case, suppress the warning rather than trying to modify the
>>> +# code to work around the compiler.
>>> +sha1: CFLAGS+=-Wno-stringop-overread
>>> +
>> Sadly this breaks the hexagon compiler:
>>
>>    error: unknown warning option '-Wno-stringop-overread' [-Werror,-Wunknown-warning-option]
>>    Traceback (most recent call last):
>>      File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 683, in <module>
>>        sys.exit(main())
>>                 ^^^^^^
>>      File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 679, in main
>>        return args.cmdobj.run(args, argv)
>>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>      File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 657, in run
>>        return Docker().run(cmd, False, quiet=args.quiet,
>>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>      File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 370, in run
>>        ret = self._do_check(["run", "--rm", "--label",
>>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>      File "/home/alex/lsrc/qemu.git/tests/docker/docker.py", line 247, in _do_check
>>        return subprocess.check_call(self._command + cmd, **kwargs)
>>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>      File "/usr/lib/python3.11/subprocess.py", line 413, in check_call
>>        raise CalledProcessError(retcode, cmd)
>>    subprocess.CalledProcessError: Command '['podman', 'run', '--rm', '--label', 'com.qemu.instance.uuid=5bbb7b6ed2ea4377b9b6d646859ec4ea', '--userns=keep-id', '-u', '1000', '-w', '/home/alex/lsrc/qemu.git/builds/all/tests/tcg/hexagon-linux-user', '-v', '/home/alex/lsrc/qemu.git/builds/all/tests/tcg/hexagon-linux-user:/home/alex/lsrc/qemu.git/builds/all/tests/tcg/hexagon-linux-user:rw', '-v', '/home/alex/lsrc/qemu.git:/home/alex/lsrc/qemu.git:ro,z', 'qemu/debian-hexagon-cross', 'hexagon-unknown-linux-musl-clang', '-Wno-incompatible-pointer-types', '-Wno-undefined-internal', '-fno-unroll-loops', '-fno-stack-protector', '-Wall', '-Werror', '-O0', '-g', '-fno-strict-aliasing', '-Wno-stringop-overread', '-mv73', '-O2', '-static', '/home/alex/lsrc/qemu.git/tests/tcg/multiarch/sha1.c', '-o', 'sha1', '-static']' returned non-zero exit status 1.
>>    filter=--filter=label=com.qemu.instance.uuid=5bbb7b6ed2ea4377b9b6d646859ec4ea
>>    make[1]: *** [Makefile:122: sha1] Error 1
>>    make: *** [/home/alex/lsrc/qemu.git/tests/Makefile.include:52: build-tcg-tests-hexagon-linux-user] Error 2
>>
>> Is it that new an option?
> I think it's new-ish (gcc 11?). On the other hand


I was going to volunteer to update the toolchain used for hexagon to 
address this.  But unfortunately this warning is still not supported in 
clang 21.

https://github.com/llvm/llvm-project/issues/72455 sounds like it's not 
very likely to arrive any time soon.


So "-Wno-unknown-warning-option" does indeed seem like a good workaround.


> -Wno-unknown-warning-option is quite old, and would suppress
> this error. If we do
>   CFLAGS+=-Wno-unknown-warning-option -Wno-stringop-overread
>
> does that work?
>
> (Meson has cc.get_supported_arguments() that we can use to
> filter out -Wfoo/-Wno-foo options that the compiler doesn't
> support, but since this is built via a makefile rather than
> by meson that's not conveniently accessible.)
>
> -- PMM
