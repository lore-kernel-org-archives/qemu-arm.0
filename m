Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1271204njc;
        Wed, 21 May 2025 08:34:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmXVDRaAA2YhBAsQ6YtgBhWiCjdubGAm4bdkYebtjdJcadRhSl4w4zUxE8S2rbbRx0Arsn/ywhreui5w==@linaro.org
X-Received: by 2002:a05:690c:6602:b0:700:a6a2:690a with SMTP id 00721157ae682-70ca799b8cemr277678597b3.7.1747841677506;
        Wed, 21 May 2025 08:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747841677; cv=none;
        d=google.com; s=arc-20240605;
        b=M2ro/NVZ3bqvpSdQQ4PKUOT0KoojrSZLSRXY4YnC3bwYwe8BjIpSNHlhRhXYxSrnWJ
         ZJc16XV5whs+Uf0Le1tIZxIr+ZXPSayA1q5OIO94NP/phzzGijNpaTt7G9kJXGfJSsWV
         6UzetTO2peyN99W+d5JaHqRTz9Cgrekpq2/7Sq5lQ/aBosWWg/1Kab8BcQdskhieD1y3
         FocsiRx1zv0qMsnEDqZqFPrR02KYVzbuqEztf9+VoIjRiAz+pqLYn8/vydBR6nRXbgrY
         N7Q7Vt5wVzzteTzrO9Lqsamm4c2w/h+hsiuZUDo+BWluUqBG8Fx2RpMw6THodBRjgCxL
         MHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+gdPfSv/iUEZ0iV22CDF8Ccyp/t9XL8qu/hu9upFM3c=;
        fh=W5rJ64ewN99vZjsMgJ7B7Xq/n2yvZaO3bnkndWawPeY=;
        b=gw8O3jbSFnPEEak7rqAcLL8ys6I7US4PuLad/lAUVWA3aPXkw9QBWuY1/jFW2CT5Jf
         eocbC78Cba8QpD3uLVyotlnb3D7x1SkHL0GHUb56GllA4wZRCAOMgiNIif92OT4DFPko
         1FntPSVg4tGXEicW7DpeiD6UmKH5OAN7Q+fFd8BNKG+Qa3XIeMWMKRFLrfn7Z1pwBGfc
         GtiUcQ63IT74vuVjAmxgKlUQiEvYjh6E939JIbLdtOQI4PElbBxcONa/+hwRtYE2NAb6
         YbtZGseengstV7F5jEq57dzetxQop4Xi5yfnIiOTyfz53YkC3Ho4zhcTirx1CTwCepAv
         J0Zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ComtI/GW";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-70e01442123sor2595667b3.10.2025.05.21.08.34.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 May 2025 08:34:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ComtI/GW";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747841677; x=1748446477; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+gdPfSv/iUEZ0iV22CDF8Ccyp/t9XL8qu/hu9upFM3c=;
        b=ComtI/GWSPCfAizvYNdbUCQi3LkMugQ8fTC7rJPCG6HVLsdYdz47SwgsPczB1VdrLp
         OlYEczQaRWhJlzjpzBlOPKVGYRyNWUSfRp1jfoo/MJpoBnPixinKevY+E1U5ZSJIScf/
         drvwizeMRyl6hY8mnSu+KBt8Y/TL2/+8M2nQV+xugCmAxM1FyCazePehcfbK8XHlN0/n
         qwCfUkUz6c5j8K/Lco2oEFaMxX+Du3NaF0Y2Uq+l38Gk8ZMkRdkjEgvKlw+M8DmF/J+A
         VWvxYYm7I3RlYWeDeGX4IqTQAp6efUU1E0TqML6BWBOR7j7p+f4R35XQghCfA7ObHwDN
         TJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747841677; x=1748446477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gdPfSv/iUEZ0iV22CDF8Ccyp/t9XL8qu/hu9upFM3c=;
        b=KiIsZfYMvilifVlIQ7kGbF+lDSnJW0KJUDyoiNYaITwLThpf0n4IUIBhwNGZJtASGE
         4xvewAUDACNmgXCsxwVbmVDHne64BAoqd8Eq74di7xOmfRHgbk1ce2pX6FBBeaAnaRk1
         wp4xNT4WlARKoqqFHwiumQrWNWXezc7jxOeXikxXyPZyH16lTtnuvu1pccF0H5dcU7i4
         qgTQAVfLnnnvKifIlJeG86ShU+CA4F/UGSjYY6gxFH0hzTvAMfF9q9I7vAiEyLCKik7j
         37IoxG5D2iZiu67fP2+0b3vFxLf+abEkwB9afVE5QSlq3rJTAJi/2OeLOph+dFmKMaMJ
         vTmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI0/POn5XYCGGWC2Li3SO7ZCbayco4/aji9RBvXfJncwYzMUz9CVmQ98HYY0nLJB4tvuSugq+yD8vLWw==@linaro.org
X-Gm-Message-State: AOJu0YwOXWUR6jwmSZZoYYDNUR07VI66bWnkqsR/SOHMvqaMSKpVAk/8
	B4vy9HjrdvLZrA6Ql//iPrCr9SwN4NXPhzp5l2lEK/vm4sQUNa8kI4ICZHJ0DOFUpyPDIwdmiYN
	anyuJX1fLsqEcYtPS4MDsUAk5nvetDTWsRI503rdf06tE1idewDFBKqoKMQ==
X-Gm-Gg: ASbGncsjMBflS2+x1E0u9w+hjMIb7NIlhPo4ZmQm18ibuiouNit7d9Uoua4ugSBJeUQ
	kQrzKmEHoijeeAkmCAboPxZwdNDDE3BowtIF1lWlZhHa8IBSBzM4BI98uMuMcrtswCp3BBv4TAz
	0PDRf6zCu6j/Sqa9JylZF9eWa5lwUUpb6/9lcJfCT01j1c
X-Google-Smtp-Source: AGHT+IEqiXL6sJmJknJBdAC1ULYcGaNnm5HYbGP1pXy1iaNzcNYUc1xLSSbp7Nqah/VoVnRRgBYH7kqq4fF1v6YW5uo=
X-Received: by 2002:a05:690c:3686:b0:708:39f9:ae49 with SMTP id
 00721157ae682-70ca7b8b963mr288387497b3.29.1747841676875; Wed, 21 May 2025
 08:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
 <20250207153112.3939799-12-alex.bennee@linaro.org> <ee091002-a552-49fe-ae5e-8916937dba15@tls.msk.ru>
 <56e0a35b5c53b416db130c414cd0f3d6@linux.ibm.com>
In-Reply-To: <56e0a35b5c53b416db130c414cd0f3d6@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 May 2025 16:34:24 +0100
X-Gm-Features: AX0GCFtQTqAUvcQ2co9hZjymHoBFnNlqTY5AGz0B7rNw7UAqe6lSJQfx9Cc154E
Message-ID: <CAFEAcA8Mzo-Ne48=uFBTcy+CXNcnxGOaW941p=CRkD6gmC=JfA@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] gdbstub: Try unlinking the unix socket before binding
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org, 
	Nicholas Piggin <npiggin@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Bin Meng <bmeng.cn@gmail.com>, Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>, 
	Kyle Evans <kevans@freebsd.org>, Alistair Francis <alistair.francis@wdc.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>, 
	Harsh Prateek Bora <harshpb@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>, 
	Alexandre Iooss <erdnaxe@crans.org>, Laurent Vivier <lvivier@redhat.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Warner Losh <imp@bsdimp.com>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: 4g46sQzgoQFD

On Tue, 20 May 2025 at 23:22, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> However, wasn't it already broken in this regard?
> With fccb744f41c69fec6fd92225fe907c6e69de5d44^ I get:
>
> [2/2] Linking target qemu-s390x
> /usr/bin/ld: /usr/lib64/libglib-2.0.a(gutils.c.o): in function
> `g_get_user_database_entry':
> (.text+0xeb): warning: Using 'getpwnam_r' in statically linked
> applications requires at runtime the shared libraries from the glibc
> version used for linking
> /usr/bin/ld: (.text+0x2be): warning: Using 'getpwuid' in statically
> linked applications requires at runtime the shared libraries from the
> glibc version used for linking
> /usr/bin/ld: (.text+0x134): warning: Using 'getpwuid_r' in statically
> linked applications requires at runtime the shared libraries from the
> glibc version used for linking
>
> This comes from glib, but the ultimate result is still the same.

Those are in upstream glib, as you note. We can't fix those (unless we
have the enthusiasm to write patches for upstream glib: last time
we asked, they were not against the idea, but nobody on either side
had the time available to try to write the necessary patches).
But we can and should fix the cases in our own code.

> Also, what are the symptoms of the breakage? IIUC as long as execution
> does not reach getaddrinfo(), which it in this case should not, because
> it is used only on inet paths, there should not be any issues, right?

Correct -- if we don't call the function it's fine. But the easiest
way to be sure we don't call the function is to not link it in :-)
Otherwise future code changes could result in a call without our
realizing it.

Also, mjt's packaging for Debian puts in some stubs for the
offending getwpuid etc functions, which suppress the glib warnings
(this is why he noticed this whereas none of the rest of us did):

https://sources.debian.org/patches/qemu/1:10.0.0%2Bds-2/static-linux-user-stubs.diff/

thanks
-- PMM
