Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1067542wrq;
        Wed, 23 Oct 2019 08:51:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3gZNEZQN5qTP461iis24Qe4vG5rsDoOQvO4O4Ef56oLQQCL2moaHxxhvT9X6ByGCmet2A
X-Received: by 2002:ac8:6793:: with SMTP id b19mr10014525qtp.354.1571845918255;
        Wed, 23 Oct 2019 08:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571845918; cv=none;
        d=google.com; s=arc-20160816;
        b=biCRkPBu05FSpLMHQYuPVZ1CsXCtYaGtClWzEAUDS2wTTO5jg2xcM4JG3CdEgN0LIh
         RpVDd8FFomkeFiPCgE3EwOKXwD1EqkOI1mKlm0nfXJmLRDJ5Py46kDjd/cUzOPN/XoAq
         yjp+2xNurP94LUGFhtX2MWXPPbSo26n3lFlHh/bVvOHgH0ojZZkVk4Z0yND+ja+E3A9R
         x7tqKqNuCfnVgmuxLFJ6D+2bwGY4bcAyth1u9KXWojZqFljCCibTutCs7wudJNQ/aE0Q
         5vLz5PSWIdTvShOBgx6pNUKDlj+Pxq4Ops2x8gI5Tef4uugX+V6BZhPI/i9xUPuhbEon
         7PXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=4Ob/xIXJBCG5tLfXBADlNo4bUEXD7og5u1mBYUb4qkg=;
        b=ZBiYpAVMZO7ZYDI5g7bMP+8jM2/KSdIGyelYDcT12qsUIRALwWTP6RpB535yoscqHM
         KSEitDJguPOk7EyZ681Nlim3o8qfB8kyql97Upq0nH9hwiF8mghHllUPEKEhs4SXpbys
         4CHi9o67j5ZOAu3X/wRFhHwjA00hvHldlBHEUyIoPhmBBYK1AhP2/jJyXu4xXpolRLxc
         bh2848klcjvYzFvtXi422KZeENOQPgJA/XcMOwtf4nXEFYJOw+8URj9mVPQ7/saH2cjS
         4nulU7B459Btl/B4oz9xp0Yk5rTFsb/J1jeHIkN7w83s/mOU+i1w2mWlCYNqNEWJyBY6
         66wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="id9mtq/W";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g11si7790266qtb.5.2019.10.23.08.51.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2019 08:51:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="id9mtq/W";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571845917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=4Ob/xIXJBCG5tLfXBADlNo4bUEXD7og5u1mBYUb4qkg=;
	b=id9mtq/WE2YpMPU6VNkJqS7VQs/QafuOV8rT9eNwu1q3Fn2TXLXCSmFsuM6JL1ONzaKk7B
	9lJNjmNQeQJRA2WbcW4WvDI23bPwKFYK4HO+ZaLpgforoz4CiOJltlA1LHxSXiAgbWjLkk
	/3/dEITJTlinTEeYY79nI0xoBMAfPXU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-PhGGc5hHPuaiEY5PleElnQ-1; Wed, 23 Oct 2019 11:51:54 -0400
Received: by mail-wr1-f71.google.com with SMTP id a15so11287609wrr.0
        for <alex.bennee@linaro.org>; Wed, 23 Oct 2019 08:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fSMvcQIAJ52sZ3CkOU3CAdCDlsgkHSLmi6Doq0FBN/M=;
        b=Mu+/ghlv3Vs8Oav6sB5bfMD2Unx/TJZR3e6/SFomXhNbvwdifnGxqYObolyIEW7hLJ
         SUm16Hp/JBEZgtXiZp8h1q2xPbbrke8p41jAWlLpt49EQFpvmMI9DJ6cDuNVgPgo5CQm
         A0okJmHpovUBykjDbOUWmhDv5QWrGHrepcOMwezwK0jISB5EtvY6rh9kBqPy2ryjC+ZM
         sdcxXfdQwuO+Pk4vz0EAoeJd7I68Di0yR4O6cdirOb5Xoeh5/wfeCpOu02g3s50LUUBq
         WKvZm7pgWM8pwGljt7tZu61sJLG2dOmSHZpflPmPrp4EZn3dnLd+W1O855xpWBTxGfZ9
         3tZA==
X-Gm-Message-State: APjAAAWWRN7pO9IqUhOCTqpWESwtR0E/hOprxKTTYpcMBBaUVO8hi1Zx
	UrQpgVeQ7sVLyP5b9puboikD7S73BVSRvWWmFQYUvslWQgAbeUkCmWGcHj/rMetWqV99SMeGO7W
	uXMXQ7zIfDQdj0jGv
X-Received: by 2002:a7b:ce12:: with SMTP id m18mr514890wmc.35.1571845913060;
        Wed, 23 Oct 2019 08:51:53 -0700 (PDT)
X-Received: by 2002:a7b:ce12:: with SMTP id m18mr514869wmc.35.1571845912711;
        Wed, 23 Oct 2019 08:51:52 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:51de:b137:4c45:7cea? ([2001:b07:6468:f312:51de:b137:4c45:7cea])
        by smtp.gmail.com with ESMTPSA id q22sm19215987wmj.5.2019.10.23.08.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2019 08:51:52 -0700 (PDT)
Subject: Re: [PATCH] Semihost SYS_READC implementation
To: Keith Packard <keithp@keithp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20191022031335.9880-1-keithp@keithp.com>
 <d7470bfa-ba4e-3287-326f-ee63c5d76407@redhat.com> <87sgnk3b0k.fsf@keithp.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5e8913f8-558d-6a2e-c7d0-787ec533e4a9@redhat.com>
Date: Wed, 23 Oct 2019 17:51:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87sgnk3b0k.fsf@keithp.com>
Content-Language: en-US
X-MC-Unique: PhGGc5hHPuaiEY5PleElnQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GzwJCJv/cGbK

On 22/10/19 20:12, Keith Packard wrote:
> $ qemu-system-arm -chardev stdio,mux=3Don,id=3Dstdio0 -serial chardev:std=
io0 -semihosting-config enable=3Don,chardev=3Dstdio0 -mon chardev=3Dstdio0,=
mode=3Dreadline=20
>=20
> It might be nice if this could be shortened, but it certainly provides
> the necessary options to make it all work.

Yeah, it's not easy to cram all of the possibilities in the command
line, so in general you need two options, one for the backend ("stdio")
and one for the front-end ("semihosting").  In some cases there are
shortcuts that refer the front-end name in the option name ("-serial"),
but semihosting isn't one of those.

There is no particular reason for this, except for the fact that the
older option "-semihosting" was added without an argument many many
years ago.

> I'll post an updated version of the patch in a while, after waiting to
> see if there are any additional comments.

Indeed I have a couple comments, mostly on coding style and duplication:

>=20
> +typedef struct SemihostingFifo {
> +    unsigned int     insert, remove;
> +
> +    uint8_t fifo[FIFO_SIZE];
> +} SemihostingFifo;
> +

Please take a look at include/qemu/fifo8.h instead of rolling your own
ring buffer.  Note that it is not thread-safe so you'll have to keep
that part.

>=20
> +target_ulong qemu_semihosting_console_inc(CPUArchState *env)
> +{
> +    (void) env;

No need for this, and also...

> +    SemihostingConsole *c =3D &console;
> +    qemu_mutex_unlock_iothread();
> +    pthread_mutex_lock(&c->mutex);
> +    while (fifo_empty(&c->fifo)) {
> +        pthread_cond_wait(&c->cond, &c->mutex);
> +    }
> +    uint8_t ch;

... we tend not to mix declarations and statements.

> +    fifo_remove(&c->fifo, ch);
> +    pthread_mutex_unlock(&c->mutex);
> +    qemu_mutex_lock_iothread();
> +    return (target_ulong) ch;
> +}
> +

Kudos for the unlock/lock_iothread; I am not really familiar with the
semihosting code and I would have naively assumed that it runs without
that lock taken.  It is indeed better to have your own mutex, because we
do want to pull the unlock/lock up into do_arm_semihosting or even its
callers.

Thanks,

Paolo
