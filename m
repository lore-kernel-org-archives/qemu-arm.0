Received: by 10.25.21.96 with SMTP id l93csp678247lfi;
        Wed, 15 Jun 2016 11:45:46 -0700 (PDT)
X-Received: by 10.140.170.4 with SMTP id q4mr271116qhq.30.1466016346735;
        Wed, 15 Jun 2016 11:45:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d81si23197298qkc.10.2016.06.15.11.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Jun 2016 11:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDFow-0003rw-2J
	for alex.bennee@linaro.org; Wed, 15 Jun 2016 14:45:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bDFor-0003q2-23
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 14:45:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bDFol-0003uW-QM
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 14:45:39 -0400
Received: from mail-lf0-x236.google.com ([2a00:1450:4010:c07::236]:34212)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bDFol-0003uL-Hm; Wed, 15 Jun 2016 14:45:35 -0400
Received: by mail-lf0-x236.google.com with SMTP id j7so25860286lfg.1;
	Wed, 15 Jun 2016 11:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=vU6xrV7VGa9ozVzdsnPbSK4/t6r5GoWswhmtlqfLzmY=;
	b=VRlYVW9T2RcMa03akWSYP+M5KJJLn3JYXwUSBpCI+dfFqdpaiOK2vnLOpkl+PRGVOK
	PRNqIDfdv8jbgNBkW4ZN4fk//SDYdetPGxLNObko0wxkgXWc41fB+9efJpaCCqSuigvN
	zSut79p+ZMrxN394d2dUNza4I6IgPmOi7625OprGkHzCYejP2aPiUScQxC80XwuZC4yj
	rWDcHJYt3hTYPaeeWXUlvBGA2fmTVCPCy4OQpD3XPhZ8fMw+56IQ2cgBkbVjb5xdGNci
	0WuTXecnNdWZnKrFu/KaMN9K/oNgbpQ98euArty3ggLmDNgmUoqJdgx5GqXlRWCHXaG+
	SKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=vU6xrV7VGa9ozVzdsnPbSK4/t6r5GoWswhmtlqfLzmY=;
	b=iSrybyjjRRnn8eRGy+9CE4vdThH3tyFZTv+7b++/c8Upkfu31exqElGMNXTAbp4pgQ
	gOcJSNA5tDK3XEkKRdD8wiqM0gNX26h5n/d2vBHUBh+kw8RoxYEk7i1/u51vs5QvzZGJ
	TU4KXvhPugf+32kiK9dnZPLpvB5Pc+JOtwZl0zA6VuKdXjYThyyECiCe/tN4GDaRogJy
	wih7voxHyR2iY7cxrRySkbx82YX27JFDOmTAeUpNKYbyjsBQGnB2lnbeX32qJtJGdCFf
	oCrWNUOHeQ1fJS13FHyFMYi/QOKqjByE7u2FsFAvOoMOrNS/oMAhZ9QR6Z7L36CqfroY
	/1zw==
X-Gm-Message-State: ALyK8tIDbbNNqnoHwk+0VJGRlDFiGX88Ac4ulY1dJMGwrfnAFYPfYaSodoBvzNerZcKfLg==
X-Received: by 10.194.7.70 with SMTP id h6mr169313wja.38.1466016334637;
	Wed, 15 Jun 2016 11:45:34 -0700 (PDT)
Received: from [192.168.10.165] (94-39-188-118.adsl-ull.clienti.tiscali.it.
	[94.39.188.118]) by smtp.googlemail.com with ESMTPSA id
	ib10sm35439484wjb.31.2016.06.15.11.45.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2016 11:45:32 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1466005488-21400-1-git-send-email-clg@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aee6647d-5013-0327-4551-a63a2693a471@redhat.com>
Date: Wed, 15 Jun 2016 20:45:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466005488-21400-1-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::236
Subject: Re: [Qemu-arm] [PATCH] ssi: change ssi_slave_init to be a realize
 ops
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org, Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
	qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0iTHqUFWacYo



On 15/06/2016 17:44, Cédric Le Goater wrote:
>      s->sd = sd_init(dinfo ? blk_by_legacy_dinfo(dinfo) : NULL, true);
>      if (s->sd == NULL) {
> -        return -1;

This needs an error_setg (see device_realize in hw/core/qdev.c for an
example) until sd_init is changed to take Error *.

Otherwise looks okay.

Paolo

> +        return;
>      }
>      register_savevm(dev, "ssi_sd", -1, 1, ssi_sd_save, ssi_sd_load, s);
> -    return 0;
>  }
