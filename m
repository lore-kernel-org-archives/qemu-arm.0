Received: by 10.100.176.137 with SMTP id h9csp3729301pjb;
        Mon, 18 Sep 2017 04:00:08 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAlMgNQxvHIhOo4/0E2GQPr4MqEcq7Ros5/hKLsZ5iAnYbvr3DKRadnxy13w3I4GuFEvEyX
X-Received: by 10.200.40.104 with SMTP id 37mr42676094qtr.284.1505732408816;
        Mon, 18 Sep 2017 04:00:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505732408; cv=none;
        d=google.com; s=arc-20160816;
        b=L1DG1Q61BcrDs+SEPpY8zA0ZMNWrNkGWqeTGZWTZsz8jkDmzetUlwlIWzhI/wTYHsG
         zjlBlB9A+d0gvOKgTMJ5ZxPJKDQ1JGLkRCRLuzPfRDx2Z9FVmm2no1bnjYyX41yMIcnO
         3oaVhFn6gqz8dIt6UNRnLVzqhyN7w8UBBfxzHCTqAAixyDxs0/epN8abr8lfG3fRpgH6
         NunbYoE/dA/JwmSBn5wAqvbmHoGJ24f8w/2CiBvTmhmVmVzgbdIFoh/ewzzymiv/eRVE
         dDezKsWfMzuDFX60G9daMwzN+zxC9n0hWYdWjA0lN1G122TKmooTTkSu/gnG1rYSAGtc
         QKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=X5vYktdO7BC2R0MjhXnnKECdmle0bLaSL8t+2ktYKEo=;
        b=PSVM6bdE/NA5kl3EyEE7//t++rFVv5R2BDjogpzpC2cXB+NTaBAmghZnJm/W2PpwgU
         4fbyLbKQoYhw4n6oXNvZRnqJqf56SCn159ObxlW5bA1i3tv9KcchAKFxqb8P9ePixdL1
         kNaItOftRec0BXQJ7ZiB0jo3jvDZ/mevprZ3MxkI/dBUX3vlLAgLfer+tJCsUUIFrTWy
         Zs6mNxwK5W4tjdKFgFZef6JyNSCszBgWKOOx13C0/6HcOC3JlRZ6aSzJ8u8SYzhvVeqg
         wQo3N8skF3TINr5uybteUuC/7ZgPi3DCuLOT95QJS7emM1WlOkJOt+dHVscf+LXwxPxj
         SeCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m7si5536791qtc.151.2017.09.18.04.00.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 04:00:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35765 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dttmY-00014c-OO
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 07:00:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dttmQ-00014H-LE
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 06:59:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dttmN-0005M3-Hn
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 06:59:58 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:53831)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1dttmN-0005Lf-81; Mon, 18 Sep 2017 06:59:55 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0MUo3w-1dv3SU195g-00YBOs; Mon, 18 Sep 2017 12:59:18 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
	Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	Anthony Green <green@moxielogic.com>, Artyom Tarasenko
	<atar4qemu@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stafford Horne <shorne@gmail.com>, Yongbok Kim <yongbok.kim@imgtec.com>
References: <20170917232842.14544-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <17911dc7-9326-66c6-7b94-8e59d06d2af2@vivier.eu>
Date: Mon, 18 Sep 2017 12:59:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170917232842.14544-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:QSXK4Ou+jCP/wgdEef+Pa/G1ECeLkRRViq4gfFhJPMR7+WmeQog
	60evQ7ghAqWC4gZC/trrV2rzsiPs95c/v/7Eba71GTljXJt+L05IrARwnBxh4zzCe8J+bCr
	2TEqzon1R7t86fNfsjzdAqqmp4bvLrJfT6I/Y3pbl+cFwSjq0CiZh3kR5GpojWjIARrmjzv
	kkAY+/pZb5aoiWNgD/sbw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:2jVId6bnc3Q=:QadWSLgpX4dMsZJTV/jCX3
	+n2jV2SsfBzx+M3uHQFk8mfnNU1RtIJHgzicgF3lzgCJL2Y9hxVczG/iinsqXtuknyLsg71DG
	rAWaZHw6CwhHy07FEqGqgJPcZRIY6ZqoaxreeYfvm+jgP39qb9YbXVrngNyvcG0K4x6nXVLcs
	hQwDTM+J07Lb/Hdplc22adaevBkYtlnZx0hq+Z90J25tL6dq39oeeLd0eT5SRfZIkJsDuIsJT
	2XNSho7R71GH2ReMDg9GqaQ4Hqz3VH9yOXuVgYGYHSxm84k6lms688mvsq5GrgidOKiCnCc2d
	jJ7XlQV+TYyKRPThgP0kw6mz1sdqYP4xw2Rbj4t9afzMfmn2OBocGnv+ZDmgqkCjiWxwZ+khu
	ZeDBbdWi1g16utOdcqHcOoYpStQlSOgynss0qCLJ3upe6Mz+0Va7vEUk/kstYaL09wKWaij1H
	5KIxLMW38wme+aWwPWekfZ3w+K/9BAneEt24gzBtA3jLDSHQb68GZtlcznLz/tVbOZoCOdWtL
	xnMAOPa7l/1cG1L2pQl1UFVlRaL/LudBj2MnU2YMFHBNMnppbu18vRwAC89OLMicrhJ4SG+o1
	1zEitRmCLpMYST4zthyCWvu6oNGhPbFUzIruwWDRRTNTK2yv8Fsr7vspB5zQhpD/0DTo7tKfe
	KcYdV5QeaxjtK68wWWHsgR0O6v0Jnc1KYsrQLHO3lmVH16WHChC8nK/sBOn22eLM1oT/qqZIG
	7c1Aml5x3tjZ3hojyJwR8Pr4KJ58UVaT80J42d5G4ks/3GUGIu87ysrsvek=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-arm] [PATCH] qom/cpu: move cpu_model null check to
 cpu_class_by_name()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Marcel Apfelbaum <marcel@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zlaQnH6W/rwf

Le 18/09/2017 à 01:28, Philippe Mathieu-Daudé a écrit :
> and clean every implementation.
> 
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Based-on: 20170917232010.14183-7-f4bug@amsat.org

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

