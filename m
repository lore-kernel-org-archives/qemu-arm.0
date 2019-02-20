Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4799384wrx;
        Wed, 20 Feb 2019 09:31:32 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbcJy0dnqAbOFdxiTa8K46+ceDrYlxOP+njHK7Of7P5wWmQZg4XZWfvIiu58SdRSz0zHDR7
X-Received: by 2002:a0d:d4c4:: with SMTP id w187mr28968153ywd.41.1550683892864;
        Wed, 20 Feb 2019 09:31:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550683892; cv=none;
        d=google.com; s=arc-20160816;
        b=I77OoJCU3sqCA5mibdMEubUpoCnPNHOfud9MrrcHrJG5j94FdTa8rhwaEX1rmKcomH
         i4Na1NTaUoRprVm6qu5w7+O1NyGDbdWNaI8tCRfPnJ3NgmaUgKP58dkVbM21ZP+jnuuo
         fCEwVIL6sxuaRoX7XBg/JEgBVKGj8rDk1sk32qn/5/yLhQuxTMzQbqVWX+g27pPU9EUx
         8j7xfuc7QxhrglKlx1mxdYNRHmcATK/rzHCzLlGpK43MrPVq9X6rpks32UnKxhObEIHA
         YoeS3tOtnfI3Ckvc8+bUjKmJmDQdAIp8mvyrWZNgghuZC50Oplokcv3eNZiupdYQRNBE
         jtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=kyJgILNvYIGnPHdQyki6tgQMyyWqsNc+eZiQe3npfYQ=;
        b=wfzi/JVpz0SnJU7BUKG31In9yRBN+PE3/aBmpZ9QmO1x/+mbYZ9EK5LArZ7qYFERZE
         JpMURyPzR9+s/wvYEdxJAjBv8rw1+LXFYEu8Xr7B26CT2TV1ffBVBakevaCIA3ILPDel
         NqL850bPuHiBlFxP+sLizMpbj48DIWWJ+qDfr6WlDNUU8ZyCoOb4QvuHHbZga1UdGA/9
         qmEiCpXRRM2AJ+r4BuGTh+YFvYFcaBIyQffov1uvcRgxxGMoI8IMk/Y6Tx35vi0PkWzn
         lynsGE5fIAl1Lt5QJfSZEO8jIfkWU5RJhSij24wdSNnX7HorHnElAJ615fKcWQGysS/X
         i4rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bw4cO6iI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l39si5844805ywh.183.2019.02.20.09.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 09:31:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bw4cO6iI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwViW-00076A-6k
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 12:31:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwVeN-0004Dg-06
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 12:27:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwVeK-00018R-FG
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 12:27:14 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:40883)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gwVeI-00017U-HF
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 12:27:11 -0500
Received: by mail-pf1-x441.google.com with SMTP id h1so12218482pfo.7
	for <qemu-devel@nongnu.org>; Wed, 20 Feb 2019 09:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=kyJgILNvYIGnPHdQyki6tgQMyyWqsNc+eZiQe3npfYQ=;
	b=Bw4cO6iI2Yp2xvsHMQbvw3F4Q/+riN/h4JImNdMmmxXxC/890rJuJm89TaPT6VZGCl
	VxeNyj1yfjeTT59CznwaqZMwg2bcc+ugVIEpWxEZ68yR20RO1NM1R1bvJaLFfk4FL2ty
	I8su96RKWexnneqiktbqcNmECVtrJNIwpnZsXEVDDE46jQdfdNKlhWTe+xZlSSxfQd/0
	Ogc/O1kic6SfOypSFL2i7CAGvd4ujuyzvxzDoO56zqSX8Q8IwHWcxVOyaHrLWO0q4acT
	NRRPH1+i0QxJGlri8yKNr9uoVm9bMVfEBvfulmg2pOk2c290EIyvo8g5H3l50YlUgOmE
	LCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kyJgILNvYIGnPHdQyki6tgQMyyWqsNc+eZiQe3npfYQ=;
	b=PSTabpCdqxjFStBkzAILYAxD8k7XLHse6Zb4pVnRYnN+JeybaqxrYiXC8Sg8sYnaU5
	zsn0QiVc9LAA226BHeASWMCEBt8/RT6iO+Sm4n3fxY2ZXg101wy/ErfpnB/VfHAiedDF
	Xkr1HyJUvM8eKI3eKtkfXlzOvglz2KTmWobq9wzBuqfBnHbiRsWCI8mVysTLm03pPxPV
	VIP+PXDT1J9Gs0eeBUiwq6TQ5GutXbqII85kLoATE6rgucuuRr/KWobE2uC3F2WzEt/X
	y+h9UwKgt4QMIXnNorbirZfxzbl5XVyPxJzNkIDT5g5S34nMYgjugcVDsXu+QME5FtSk
	YNVA==
X-Gm-Message-State: AHQUAuYCCAaP+JFx9qezLiUgDgi7NNREl8WewfXIU0x64K6ZVP1CHLka
	RZatWy6KDuXSdYwD+xYyClbhFQ==
X-Received: by 2002:a62:e11a:: with SMTP id q26mr11226137pfh.187.1550683629251;
	Wed, 20 Feb 2019 09:27:09 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	p29sm25858943pgm.78.2019.02.20.09.27.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 09:27:08 -0800 (PST)
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <20190130004811.27372-1-cota@braap.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <70297ac5-defa-0d7b-b4da-44303b328ce2@linaro.org>
Date: Wed, 20 Feb 2019 09:27:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190130004811.27372-1-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH v6 00/73] per-CPU locks
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, James Hogan <jhogan@kernel.org>,
	Anthony Green <green@moxielogic.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Alistair Francis <alistair23@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y9F9mnE3WDzl

On 1/29/19 4:46 PM, Emilio G. Cota wrote:
> v5: https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg02979.html
> 
> For context, the goal of this series is to substitute the BQL for the
> per-CPU locks in many places, notably the execution loop in cpus.c.
> This leads to better scalability for MTTCG, since CPUs don't have
> to acquire a contended global lock (the BQL) every time they
> stop executing code.
> 
> See the last commit for some performance numbers.
> 
> After this series, the remaining obstacles to achieving KVM-like
> scalability in MTTCG are: (1) interrupt handling, which
> in some targets requires the BQL, and (2) frequent execution of
> "async safe" work.
> That said, some targets scale great on MTTCG even before this
> series -- for instance, when running a parallel compilation job
> in an x86_64 guest, scalability is comparable to what we get with
> KVM.
> 
> This series is very long. If you only have time to look at a few patches,
> I suggest the following, which do most of the heavy lifting and
> have not yet been reviewed:
> 
> - Patch 7: cpu: make per-CPU locks an alias of the BQL in TCG rr mode
> - Patch 70: cpu: protect CPU state with cpu->lock instead of the BQL
> 
> I've tested all patches with `make check-qtest -j' for all targets.
> The series is checkpatch-clean (just some warnings about __COVERITY__).
> 
> You can fetch the series from:
>   https://github.com/cota/qemu/tree/cpu-lock-v6

Thanks for the patience.  Both Alex and I have now completed review, and I
think this is ready for merge.

There are some patch conflicts with master, so if you can fix those and post a
v7, we'll get it merged right away.


r~
