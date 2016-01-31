Received: by 10.25.159.19 with SMTP id i19csp1936423lfe;
        Sun, 31 Jan 2016 08:11:34 -0800 (PST)
X-Received: by 10.55.195.214 with SMTP id r83mr23278741qkl.63.1454256694842;
        Sun, 31 Jan 2016 08:11:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m186si23906141qhc.62.2016.01.31.08.11.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 31 Jan 2016 08:11:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPub8-00025j-AL
	for alex.bennee@linaro.org; Sun, 31 Jan 2016 11:11:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPub5-00022g-M8
	for qemu-arm@nongnu.org; Sun, 31 Jan 2016 11:11:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aPub2-00080i-De
	for qemu-arm@nongnu.org; Sun, 31 Jan 2016 11:11:31 -0500
Received: from mail-lb0-x242.google.com ([2a00:1450:4010:c04::242]:32793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aPub2-00080E-4K; Sun, 31 Jan 2016 11:11:28 -0500
Received: by mail-lb0-x242.google.com with SMTP id bc4so5189507lbc.0;
	Sun, 31 Jan 2016 08:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=VUggcQzsodDzDed0aFHMVZi4Lo3zMATdF1zqD/vhQiQ=;
	b=QsCS72OE+KvbAuNDBmA0NZfJSnjML47FEswyKUR0SLncWC44MuGlDEFnaGrUU7UERC
	uvipcU8ffra3qP7jHGl3KPg4/rxK6XjOXWZlqgEu/PDd/ORcojfc+S7TFZ8FPe/R7fZu
	5D/KIU9XCmmyw1JY6wOD7maOfi1uQ77vxEZ6bGBewjF+Obrwtr19PdUzbzCKKSyW0U76
	6X/5sB+MeuHv5mmV8mRbs2G0O0TTytNvqlKcggR3WjH3TG7YhdI3d08K2lhMnYgJIaeF
	3Sr/dFaOtzJ+roxjZicoU4Fq4o5F9qJwF0YqWaVlSxzeiN2xXo94vQft8mhzPYS/Qp5z
	NE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=VUggcQzsodDzDed0aFHMVZi4Lo3zMATdF1zqD/vhQiQ=;
	b=HlTpSbDEB5uOE25BOsoQ0ZANTR6RMeEvAlD21AqZaVvjZkE6ciwYBIuBPObHNmLrS0
	ugjb4ItwBoYHFyaciT7vS5/niLOEnzTYuVPIY/4nkGfxBIEtO2Q2hw/VDb08BOsA7p/r
	EXiupk9XEFNxJWwc2BkiLNurQxyfctNW0CO7vQV/8P8SfreoTuPFB5eW8r3CX9OP7QKN
	Mfi2nuRWP2cKZsdebEbfNCVlL3eakZuZFNKhz2izYNK2kbZdU0EoFSdbKrwP68rkSKuK
	GeoAf4edfm1MK+RN7XnYYqRDUe3aaJFLr/MbPRfJYLZS+pPXdtTIQcW9xXoZRi5BOcMF
	MO3Q==
X-Gm-Message-State: AG10YORsGehGMwqm/Ig6RutaGBs486IVn24FMeQtReJqQDG6vfX9uT/bQ8diQ4GrXbCIZA==
X-Received: by 10.112.167.161 with SMTP id zp1mr6889233lbb.2.1454256687003;
	Sun, 31 Jan 2016 08:11:27 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	eb3sm3417967lbc.31.2016.01.31.08.11.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 31 Jan 2016 08:11:25 -0800 (PST)
To: qemu-devel@nongnu.org
References: <1454095052-17149-1-git-send-email-serge.fdrv@gmail.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56AE322C.4000602@gmail.com>
Date: Sun, 31 Jan 2016 19:11:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454095052-17149-1-git-send-email-serge.fdrv@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::242
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH v2 0/2] Architectural watchpoint check
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zLNZ9xBAHA/S

On 29.01.2016 22:17, Sergey Fedorov wrote:
> This series is intended to fix ARM watchpoint emulation misbehavior.
> QEMU hangs when QEMU watchpoint fires but it does not pass additional
> architectural checks in ARM CPU debug exception handler. For details,
> please see individual patches. The most relevant parts of the original
> discussion about ARM breakpoint and watchpoint emulation misbehavior can be
> found at:
> https://lists.gnu.org/archive/html/qemu-devel/2015-08/msg02715.html
> https://lists.gnu.org/archive/html/qemu-devel/2015-09/msg00527.html
>
> Changes in v2:
>  * Check moved before setting cpu->watchpoint_hit
>  * Pointer to watchpoint being checked passed to debug_check_watchpoint()
>    callback
>  * Comment for debug_check_watchpoint() callback improved
>
> Sergey Fedorov (2):
>   cpu: Add callback to check architectural watchpoint match
>   target-arm: Implement checking of fired watchpoint
>
>  exec.c                 |  5 +++++
>  include/qom/cpu.h      |  3 +++
>  qom/cpu.c              |  9 +++++++++
>  target-arm/cpu.c       |  1 +
>  target-arm/internals.h |  3 +++
>  target-arm/op_helper.c | 35 +++++++++++++++++++++--------------
>  6 files changed, 42 insertions(+), 14 deletions(-)
>

Please ignore this series. Somehow I send the old patches again. I'm
sending v3 with the correct patches.

Best regards,
Sergey
