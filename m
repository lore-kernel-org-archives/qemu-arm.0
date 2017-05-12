Received: by 10.25.0.6 with SMTP id 6csp391325lfa;
        Fri, 12 May 2017 12:23:10 -0700 (PDT)
X-Received: by 10.55.155.143 with SMTP id d137mr4913724qke.310.1494616990592;
        Fri, 12 May 2017 12:23:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494616990; cv=none;
        d=google.com; s=arc-20160816;
        b=kMdI/uVCjfE07dso2bUQk9s6TzDvQ2rLkZsRGFyH8VksMVCO/NCY/NJpVJrt42VXDg
         MSuWODgXI+IfmIATTXlWMA46wIAtC9aqOyugV8fkLV6MGHikWctJz5V+TQTO8RR9zMbF
         q5gMAqJnSamcRtGY1pxyYyz0X1cn/kvJ77247Krt6KjOaIpDHieyrIufaPR7ae2lHkiz
         FLCLRFTK9a9Ja3ByGHo6ZwncCZ/3F2BsrKcsi1VDjmysLqBo5twd1Ao9SwZ7wUo/gNLU
         +SvnmM3dSHICqe66qpS5HmFjcjLkEOOlaIEGzkHx9XgY0ktOX++UfrpkuM7bYDk9djZT
         /Itg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=j2PSuY/TBd/mIlfMquF6bRJDlvH1YeJzHE0pDC17f88=;
        b=wGqep5MWeL7tct5tihHOCtsBM5giYjsCb/hKT8tq7Kp8DuuZZ/Kr5Zdr68m8h4Cg1r
         7Z1fdxyI6/Za/qp33HXNER1azjp1qJpB3FBuCy8t8LGussVtmfVoRqYhB/Tp6UzLzhUx
         vWFy5SDWoy9OZi9MJLzBNDtD//WOoPSZd1o55zbQiaCMB+bE3ulLLi1n7fA60280GaZp
         0TloUYydkr8iiGXcFeiZZX6MrhHUm4FmRGWT6YXq7K1X80+2X3FLQwzJ8PPl4Os1qgPM
         Ni1WyfCf2KOVoWE1MK/hDWB2nPKN+ZlutVzW9kbDuMQpyNTYGvaA/e5YKuZJduCRsaBP
         y2hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d33si4190212qtb.141.2017.05.12.12.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 May 2017 12:23:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55012 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9G9c-0003pP-0Q
	for alex.bennee@linaro.org; Fri, 12 May 2017 15:23:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1d9G9X-0003ng-0h
	for qemu-arm@nongnu.org; Fri, 12 May 2017 15:23:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1d9G9W-0002Ji-6q
	for qemu-arm@nongnu.org; Fri, 12 May 2017 15:23:03 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:39278)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aurelien@aurel32.net>)
	id 1d9G9T-0002GC-LS; Fri, 12 May 2017 15:22:59 -0400
Received: from [2001:bc8:30d7:120:9bb5:8936:7e6a:9e36] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1d9G9P-00062R-FR; Fri, 12 May 2017 21:22:55 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1d9G9M-0007Wf-MS; Fri, 12 May 2017 21:22:52 +0200
Date: Fri, 12 May 2017 21:22:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20170512192252.hgtpgqfn5vtba362@aurel32.net>
References: <20170512033543.6789-1-f4bug@amsat.org>
	<20170512033543.6789-3-f4bug@amsat.org>
	<f447c23f-f63c-f3bb-a1b9-f63e5aff4063@twiddle.net>
	<20170512182132.jdw4g2pd5gvf2dti@aurel32.net>
	<aaa04be5-78d6-311b-609b-d02f18e9ef96@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaa04be5-78d6-311b-609b-d02f18e9ef96@twiddle.net>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:bc8:30d7:100::1
Subject: Re: [Qemu-arm] [PATCH v3 2/5] target/arm: optimize rev16() using
 extract op
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lKLL27I/gin4

On 2017-05-12 12:05, Richard Henderson wrote:
> On 05/12/2017 11:21 AM, Aurelien Jarno wrote:
> > +    uint64_t mask1 = sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff;
> > +    uint64_t mask2 = sf ? 0xff00ff00ff00ff00ull : 0xff00ff00;
> > +
> > +    tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
> > +    tcg_gen_andi_i64(tcg_tmp, tcg_tmp, mask1);
> > +    tcg_gen_shli_i64(tcg_rd, tcg_rn, 8);
> > +    tcg_gen_andi_i64(tcg_rd, tcg_rd, mask2);
> 
> It would probably be better to use a single mask, since they're not free to
> instantiate in a register.  So e.g.
> 
>   TCGv mask = tcg_const_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
>   tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
>   tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
>   tcg_gen_and_i64(tcg_tmp, tcg_tmp, mask);
>   tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);

Indeed that improves things a bit for sf=1. For sf=0 though the
constant is never loaded into a register, it is passed to the and
instructions as an immediate.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
