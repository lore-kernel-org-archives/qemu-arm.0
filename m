Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2195901ejc;
        Fri, 10 Mar 2023 10:15:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+8MZ8I5/+tVBDC18lO16wo/mVce6A0AQxzLD4tLe3YF10eV+nBgog7L7FJu0nmAz23Tf54
X-Received: by 2002:a05:600c:5493:b0:3ea:edc7:aa59 with SMTP id iv19-20020a05600c549300b003eaedc7aa59mr3658817wmb.32.1678472135625;
        Fri, 10 Mar 2023 10:15:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678472135; cv=none;
        d=google.com; s=arc-20160816;
        b=WKmBZlTcTArIEZjPxlv98MuiT1rrmeVnxVE8/05wTaN/zpuJsk97EbeKZ1pRsJV7l4
         FzZsIPaP5epeEQQic/kwvCj6+1rjn2c4yOp33Ej20Z8LTama73yS6WoTdwcgyC0PkPJY
         /rJgVRZ0uhPSr8TWRdTB9h395BPuMv5Tt9aOx2oto7yT+VuF/G6IWDIiJy+VvQZGW4yR
         oBUHPxyOdNnZio28Dovw6o56SLX9YX05PNg+HI2HRvrAVEUj7WwoqEbgZM4i/rW7c820
         8uUGQ+yR6M065uK0bcZR05d1XYrngbFnShldb9kcdE8W6to1pTBf3ufxhZQh97A0TSpH
         pyDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=vDFMG7A5Qxm5smzTuLy+b2qEiocvX2q6me/F86sRkwk=;
        b=F0yUApFqWIAuOdqlMP/BdtMaLhuLkioUZDmFQd6qktkqzIZuWqNOcf61UT59tbWblu
         PPb4Psy661lmJlpmER9SzoqIVVxE9/yq5JtcN411y6S8FsNpDOMCVKE6hsfMaz+4nsB+
         SAHT+66k7aS34yE75KE5CaZzUxmPOysr75y02QCWgWp18exE99lkwXjGeyLjOpwa1wPD
         vvsEBKqgY/sggGYLMnIW+jAMJgV+AXh8utU8PpQdztkz+tf2wbtYljffPOI3OOH2UpGu
         gd212/p39ajoSF77CxC0tSi2R2WqrqnYAjda1+5CLj9CfH/SYs8v3SmkqSHg4uFfJ8mA
         aSvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=pnfFrGDX;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id n42-20020a05600c3baa00b003eb4b4cd7bbsi554865wms.161.2023.03.10.10.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 10:15:35 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=pnfFrGDX;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DA8DD21DF4;
	Fri, 10 Mar 2023 18:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678472134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDFMG7A5Qxm5smzTuLy+b2qEiocvX2q6me/F86sRkwk=;
	b=pnfFrGDX9nEeYkwRZbi13f8sv1cT1pQ2aF/eYCY7qoRnnlqQcM+xgQmc56hPwDAzWx/Tgz
	IPJRJTYbjKQ4CfWBw9PTJr4Iy0MJ+UyJEvnxxReQT8yF0PJ+wd3Nik1/Pj4x1Mpze/sif2
	bD1W469szWDgHHMuXLGdXJK5J4xxwd4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678472134;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDFMG7A5Qxm5smzTuLy+b2qEiocvX2q6me/F86sRkwk=;
	b=3wcA0dW1htjwQy5ylO+V4PKQ9+mJif+HWIxoDKEy8dKAllqwx3IOUZ7jir6xM/TspcL6Ck
	8yVCqnX6GRaB+eDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64B81134F7;
	Fri, 10 Mar 2023 18:15:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id NNdgC8ZzC2TwVgAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 10 Mar 2023 18:15:34 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, David
 Hildenbrand <david@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>, Philippe =?utf-8?Q?Mat?=
 =?utf-8?Q?hieu-Daud=C3=A9?=
 <philmd@linaro.org>, Cleber Rosa <crosa@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Luis Machado <luis.machado@arm.com>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
In-Reply-To: <CAFEAcA_bjTPO+68gV0V7436S2n=iJAoH3qXGw1v9-xhG2N0CLA@mail.gmail.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de>
 <CAFEAcA_bjTPO+68gV0V7436S2n=iJAoH3qXGw1v9-xhG2N0CLA@mail.gmail.com>
Date: Fri, 10 Mar 2023 15:15:31 -0300
Message-ID: <87ttyscw1o.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NbvAP9j9d5HK

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 10 Mar 2023 at 18:00, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >> You need a very new gdb to be able to run with pauth support otherwise
>> >> your likely to hit asserts and aborts. Disable pauth for now until we
>> >> can properly probe support in gdb.
>> >>
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >
>> > If it makes gdb fall over, then shouldn't we be disabling
>> > the pauth gdbstub stuff entirely ? Otherwise even if our
>> > tests are fine our users will not be...
>> >
>>
>> Have you seem my message on IRC about changing the feature name in the
>> XML? I think the issue is that we're putting the .xml in a "namespace"
>> where GDB expects to only find stuff which it has code to
>> support. Changing from "org.gnu.gdb.aarch64.pauth" to
>> "org.qemu.aarch64.pauth" made it stop crashing and I can read the
>> registers just fine.
>
> But then presumably a pauth-aware GDB won't actually know
> the values it needs to be able to convert between with-PAC
> and without-PAC addresses for backtracing?
>

Good question. Although that feels to me more like a GDB feature. If we
don't break it even worse by doing that, the QEMU side which is more
about reading the registers should be fine. Note that we already have
other .xml files using a .qemu namespace in the codebase. As I
understand it, gdb simply treats these as extra registers not tied to
any specific feature.
