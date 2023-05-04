Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp279235ejq;
        Thu, 4 May 2023 05:56:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ52gsTdx3aU1nI/84qQxKcPAM/rGuDWYWZZu7TfrIJ5HLRAdriIrkVoYr/e+FEb3c4vP1CD
X-Received: by 2002:a5d:456a:0:b0:307:71c6:8a4c with SMTP id a10-20020a5d456a000000b0030771c68a4cmr22526wrc.52.1683204976865;
        Thu, 04 May 2023 05:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683204976; cv=none;
        d=google.com; s=arc-20160816;
        b=mEtY/WiuLNW04Y+PcHz4iezUvutyQb6nUabg2ogkbaqdSU5MYqCyeOo2g1g4bgRPMi
         e4MXDOjzTOUdiR6UY3H9Rh5IcTOhmtiS3hK/YyQtZiNuoh1ay2du8nnVLYPgKLZzJK8Y
         DbYpYVc7GTnfyA1bWNXwjyYWi+UE/jf2p7dvfu1gU+Qp8Zp5y1qrdGi5mFdMzWOdzAC6
         qcWsa136Xy9BWseCYTXRdcCEOd5lhLlZGN4sQW66BvRtGY3LtfodTFmOm/Q4HDWyCCzb
         adD2xzYTyyQFoIQVyCeqDQYN0EdVmzxrqC4Pf6KCgyvWhztWA4vvJwlYNLAQ3mOIE2U5
         FV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature:dkim-signature;
        bh=QTjxPNXUea4Fx/ok4KnuX3WtYHWnEYvpZix0XRJS4jQ=;
        b=nhhBp299cNr4EnqMiasmpJEyJ+8YJlNA5HgSkbyLaFFV7UKUJmJxyaeoTRSRWJeirp
         dPRzhHyEl0i3gs8/kSZJ3eY968XTWHRlXx7BnGjBJQ794cYYk2GeRvkr/vuAQhWciU1f
         o518l2dEUWdbIXyu3jP/RGyEZqlnPFJurReV3EcrpvZ2odbHBna8WeiTl0rYsv9EuIbQ
         Mksz+JdouJ+pkrDqp3Nkwkgr/qdEPxz6YV4frDJ9L8N/llHCPELlhYrXDb3+p+UfU74y
         2KYi1m6LJWZpOmbWIX9C8gi216Fq0JPYyZKWaET1ZT/PIboqEQf6IfHZUblbz/aZS1S4
         ut+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=dl0F7kfW;
       dkim=neutral (no key) header.i=@suse.de header.b=4yfZmRBA;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id 19-20020a05600c24d300b003ee0513b28bsi2294805wmu.15.2023.05.04.05.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 05:56:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=dl0F7kfW;
       dkim=neutral (no key) header.i=@suse.de header.b=4yfZmRBA;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 55DFE20AA0;
	Thu,  4 May 2023 12:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683204976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QTjxPNXUea4Fx/ok4KnuX3WtYHWnEYvpZix0XRJS4jQ=;
	b=dl0F7kfWatFTLFqDh7ruCwcQ9Pzm25Rv87yi6deE209IFGxsXjB6u+2PPwk9YlakIgEXWR
	o3nVg75LvmFmzTbrxD+gHOhbshYvLma0ml/mkTszEA6tVdJf03QykNlaz7ssqA3VtyuH6s
	x/WImXPfMnD7hxjXnZ2lneGmkBuThMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683204976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QTjxPNXUea4Fx/ok4KnuX3WtYHWnEYvpZix0XRJS4jQ=;
	b=4yfZmRBAPO82SV5L2fWn8QB+WpRsOhcRw+owWntNv71mVAleX4tPcuaZwM4yvqecbcqORz
	8Dg5quxDH/TNt2AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3112133F7;
	Thu,  4 May 2023 12:56:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id xVS6J2+rU2T/TAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 04 May 2023 12:56:15 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Laurent
 Vivier <lvivier@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, Leif
 Lindholm <quic_llindhol@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela
 <quintela@redhat.com>, John Snow <jsnow@redhat.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Mark
 Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno
 <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, Joel
 Stanley <joel@jms.id.au>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
In-Reply-To: <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
 <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com>
Date: Thu, 04 May 2023 09:56:13 -0300
Message-ID: <878re4cl1u.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-TUID: +mgQ0zxSKz4J

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/3/23 20:32, Peter Maydell wrote:
>> Do we really want to build a QEMU that then barfs unless
>> you pass -nodefaults, though ? That doesn't seem very useful.
>> Something somewhere ought to be saying "if you want the
>> virt board then you almost certainly want these".
>
> Well, the point is that --without-default-devices is intended to be for 
> people that write their device config by hand.
>

It's a bit hard to maintain the original intention with just
documentation. Couldn't we require that --without-default-devices always
be accompanied by --with-devices? And more to the point of Peter's
question, couldn't we just leave the defaults off unconditionally when
--without-default-devices is passed without --with-devices?

The coupling of -nodefaults with --without-default-devices is a bit
redundant. If we're choosing to not build some devices, then the QEMU
binary should already know that.

Just to be clear, -nodefaults by itself still makes sense because we can
have a simple command line for those using QEMU directly while allowing
the management layer to fine tune the devices.

In the long run, I think we need to add some configure option that gives
us pure allnoconfig so we can have that in the CI and catch these CONFIG
issues before merging. There's no reason to merge a new CONFIG if it
will then be impossible to turn it off.
