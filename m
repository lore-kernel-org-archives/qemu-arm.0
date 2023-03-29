Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp522843ejb;
        Wed, 29 Mar 2023 06:58:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set8HNLspZaC8N5545FMCb3N9UCdMU3HWhFE7djmpZa1N94C1Owni4slI+9hi3JzTmZk4qxle
X-Received: by 2002:a7b:c5d4:0:b0:3ed:b349:e473 with SMTP id n20-20020a7bc5d4000000b003edb349e473mr16727719wmk.37.1680098303270;
        Wed, 29 Mar 2023 06:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680098303; cv=none;
        d=google.com; s=arc-20160816;
        b=bB6+fkKtuNW+qNf4aXXLt0GjGfo3wmwF6TOL3fkx7BhMAA7RqF26NC9NIdfsU6d3hN
         h9ENAPP0963BXWEwM2O8kRkQLbIkoSeDktS4YtxylcjEPYSq4GrTBNYC69s9FhiSWdz0
         YNvaqUkHh6YflP6M1fplJ+v/XY4KNrR11uzvAUiPihsRFfbViSsHzNU9E4CRC5FeGSew
         2hdwm1i4Wj6KqtTilyeI1poPolLsABsYJImP4IcNkzvJVxdA3VPIORk9nEUlWRlniCZi
         Kmyj2PZS6tny9ZshuUs8HKbrrr63KKsrTEhSP698NzF6d40gP1Mj+qQFXRsaeCFr4je7
         IizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=95YmYhA7ki+TZC4T3l9Mr5muPYJroIXUV9t1BWvU/2E=;
        b=jWDEDR1XavafxInwbFDhK1bG+gtOGZoo22Te+a4RoCF++mSms9LwytxjlMk9is+YSe
         sccvUkyrwhNEyBQCK/WcsAB6q2fqz+TsSbZPh+RiroS5kmV/+yKFRgmr2DOcsEdRHyVS
         r7OwojDsoPATRBJs9/XKzM21gVXx2QpnWCHrOjtjpLAseFACl+TI5W3apoCVTilBRwyR
         Io0tNgq3xRM9C5r3h9oiMGRrxvv2IlWApHZaT18vxb/4J7bwOtp/zZ1CRdccAlKvfoIt
         u3MRRA7oB9dR3ffUkt6TjXJdLmBy73sf1HCOxdjzVXQh+zZilWB/0+M5cThq6KhFVkKU
         tuzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Gq+mnb1J;
       dkim=neutral (no key) header.i=@suse.de header.b=J97+9T98;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id p15-20020a7bcc8f000000b003dd1c4bc1c4si1301606wma.84.2023.03.29.06.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:58:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Gq+mnb1J;
       dkim=neutral (no key) header.i=@suse.de header.b=J97+9T98;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E6794219E8;
	Wed, 29 Mar 2023 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680098302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=95YmYhA7ki+TZC4T3l9Mr5muPYJroIXUV9t1BWvU/2E=;
	b=Gq+mnb1JfEitGhapUj7FK7mZpU+Xx08N6ihNcNSUmmRhrEDeX5IX5rO3mlbwlg7+x2E5IH
	S5PNjTZ95Wuuag/oVErhHv4XiJueY7Im025nHsobi9VYPOnACPQU+joPtcZp2WowW9YN/O
	2eEzLzNrE6oiUtw11YFEFryaV86S1fw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680098302;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=95YmYhA7ki+TZC4T3l9Mr5muPYJroIXUV9t1BWvU/2E=;
	b=J97+9T98Z6FPs4nNyGEWVKcCxRt8GKLT/wF/YDjGrAUbN4FcJfOOxCZ0HejscxaDkV4zXS
	biE/DhAUdcKuphAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6A9B1138FF;
	Wed, 29 Mar 2023 13:58:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id um1fDP5DJGQoJQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 29 Mar 2023 13:58:22 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, David Gibson
 <david@gibson.dropbear.id.au>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, qemu-ppc@nongnu.org, Yanan Wang
 <wangyanan55@huawei.com>, David Hildenbrand <david@redhat.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eduardo Habkost
 <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Greg Kurz <groug@kaod.org>,
 kvm@vger.kernel.org, Ilya Leoshkevich <iii@linux.ibm.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Thomas
 Huth <thuth@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Da?=
 =?utf-8?Q?ud=C3=A9?=
 <philmd@linaro.org>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH-for-8.0 v2 2/3] softmmu/watchpoint: Add missing
 'qemu/error-report.h' include
In-Reply-To: <20230328173117.15226-3-philmd@linaro.org>
References: <20230328173117.15226-1-philmd@linaro.org>
 <20230328173117.15226-3-philmd@linaro.org>
Date: Wed, 29 Mar 2023 10:58:19 -0300
Message-ID: <87sfdny804.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yvZtFi3r1Z5P

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> cpu_watchpoint_insert() calls error_report() which is declared
> in "qemu/error-report.h". When moving this code in commit 2609ec2868
> ("softmmu: Extract watchpoint API from physmem.c") we neglected to
> include this header. This works so far because it is indirectly
> included by TCG headers -> "qemu/plugin.h" -> "qemu/error-report.h".
>
> Currently cpu_watchpoint_insert() is only built with the TCG
> accelerator. When building it with other ones (or without TCG)
> we get:
>
>   softmmu/watchpoint.c:38:9: error: implicit declaration of function 'err=
or_report' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>         error_report("tried to set invalid watchpoint at %"
>         ^
>
> Include "qemu/error-report.h" in order to fix this for non-TCG
> builds.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Fabiano Rosas <farosas@suse.de>
