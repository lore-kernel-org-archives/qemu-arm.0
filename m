Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2085778wrh;
        Fri, 10 May 2019 07:21:27 -0700 (PDT)
X-Received: by 2002:aca:5d86:: with SMTP id r128mr5269396oib.135.1557498086881;
        Fri, 10 May 2019 07:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557498086; cv=none;
        d=google.com; s=arc-20160816;
        b=DZHLbS5A9E126wgBPYJm92SAAUT2Nn21eQQWIoetnKvXKVVBNenjdm8J8B4/CV7jln
         1GaKZAXyLyzaXf2otoSljTk5H3EVWQWjXoevxPz5vYeVOhYyOdGo9Q3Ra0iARSaeiBDq
         8fgeYWHTZxd4kE2SGrG0aF+KWFT7VXr9rgN6GI+8CPF6U32IoqBQZ7AuSbCbqEZKJ0aB
         R8SDvVEIpE18PZ1J3py6MD0hUHQof1ub1A5OgKRfo8OXMLce6Hq1vGYF7pP93iFqGtTw
         ztee/9XF0Q8wqPltxM9aUcO93ltGuV9oP6tUsQpqI2H0vIZTxgpNEivXX+TU4WwE8CmB
         7vHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dFaoTsiJTSzJWMVHdKu/z6BrzGtnGzTphxT8juCWe/Q=;
        b=k/4C7eGsBdyhFgjqn3+Fnct3GOjt3XblbZK5I993CR4ZqOZSpTIGNMGtHlM35rncOU
         gLbCiJNPXSG9JixXrTzPT8knNkQ75NHghYLgfuLGzsCxc2cxsiyouCAVeX6ULzCdlj7W
         CXcn0Rp7lnmkSeVrEDkYTX6brziH9xrGSC2FlTHPe0dchE0/RNNsxIIPWlioaO8UrAXu
         oouy4DZlqIV/RwSSEZgAxmMRAxOGxpmLzfjWleI5wNOSqXFqlKY79dwwJiJ6zymp3N8b
         cwPskDqfxPrrt/Vt2O2uF/a6Gnk/a4fMdYFBAGwY0rQDgVOUIL952UeWkUg91hxXyJnm
         1aYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=niae1qW6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w130sor2519667oif.139.2019.05.10.07.21.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 May 2019 07:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=niae1qW6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dFaoTsiJTSzJWMVHdKu/z6BrzGtnGzTphxT8juCWe/Q=;
        b=niae1qW6HR9HPA+K3s39bKRUbolClb006ghPXPKOFkSuaG73k0YYg6OhfPGzH80W0L
         JA8CueMsg0UVyN+st6D2XttVWCb4pe+NujnKCqOD9D7LeD7ij2SSxZD+biNPyMyk+9PK
         u7J2j5kRUqhsRYznTLT3rUdkdDyBsUI8MVxwb/0mLRYO+Ql+Q0sqVxnz8XONWFR7A5+o
         puouLXbzJOT1bDhrdDx91AmYnqxpgSrVwzhXe686dHGMzXzL7mA/G3FtWB+ZiQ6Ag7zz
         ylZDSSBl3nvbLexvBwkePUcTFna6kF8G/91LP2O6++NhjoZnR46Xh/qjOsmhdn8lbiTT
         vmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dFaoTsiJTSzJWMVHdKu/z6BrzGtnGzTphxT8juCWe/Q=;
        b=uWKt7deI9gQkQatPkM5DPXDdUbfswf/3LgS4ZXHs9Fc2tlIUxyH9AzG0xX+NmSRcCf
         5hUOWB4deKD96LueQmJoEUC/gttETFUaEQ+fL94nylb0fjiUe83RiPAi0OUnDlkw3hmn
         THfE9rYqFwJojghssBADo8urTZE9qgAHMx7zLMdC5OwhKT1iTk2B0W3A2kV5fQN1fWhm
         AwXMrqDaQjVzuwK78Cbi+bRUF+TQ3QNmUjQ02Xr/7HdQEmogYYUsuYNTZG/ryiA+USre
         MmSVhdWa8ycIeXLnBDSBXK1PIPQe5MA7TVCsG9dPLTIKuE7EVGVZJRrwTqq34EtDBKWC
         VFMw==
X-Gm-Message-State: APjAAAX6wvC70kNIjkBMdQ+8e2Hq/wqNFH+AdAM+ZhslP1UuqLqlc97t
	xxNcuRQ5dC5K05aTLaxhXUF2hBc8owrUOEaTILtyAALbxLvFfw==
X-Google-Smtp-Source: APXvYqzVwdUVuEULloKDhUnHyrj1uENXg09eSrEUk07p+9dPbuzfUC830Qnyak5NbQ0kK37uokj995M3kK/+AXjwUTc=
X-Received: by 2002:aca:4e42:: with SMTP id c63mr5376574oib.170.1557498085561;
 Fri, 10 May 2019 07:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-6-alex.bennee@linaro.org> <252a5c4b-6ba7-6fa7-8792-fe597e766757@linaro.org>
 <87pnoq4x4o.fsf@zen.linaroharston> <f6abf67c-94af-22a6-c648-2fdbfe73974d@linaro.org>
 <87v9yibe13.fsf@zen.linaroharston>
In-Reply-To: <87v9yibe13.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 May 2019 15:21:14 +0100
Message-ID: <CAFEAcA-Y7Jx-qyGZYzvP4mtTsi47rb9rBqd2r27hGarNLWpkVg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v1 05/23] semihosting: enable chardev backed output
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: L2kXdj20A2IG

On Fri, 10 May 2019 at 15:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Only for the first one though.. that said I'm sure the write string is
> leaking when we do gdb output with whatever lock_user_string is trying
> to achieve.

Yes, there looks like there's a leak there. (The fix is
complicated because we need to check whether the string
buffer is required to hang around until the asynchronous
gdb operation is finished and the arm_semi_cb is invoked,
or whether we can free it as soon as arm_gdb_syscall() returns.)

lock_user_string is basically "give me a host pointer to the
string at this address in guest memory":
 * on softmmu, the 'lock' operation copies the contents of
   guest memory into a local buffer, and 'unlock' then frees
   the buffer (possibly copying the updated local buffer
   contents back to the guest)
 * on linux-user, 'lock' does the guest-addr-to-host-addr
   conversion, and if DEBUG_REMAP is defined then it will
   also copy it into a separate buffer (and unlock will
   copy it back)

thanks
-- PMM
