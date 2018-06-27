Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5825574wrq;
        Tue, 26 Jun 2018 22:57:26 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd5LmKVMvmXBAQz0SG2y9+wDAcPEq7GYEA2kZ+2+mNWqBE2M3iu12wD0mjqT3vVmiXo8vpI
X-Received: by 2002:a37:9b83:: with SMTP id d125-v6mr3818947qke.127.1530079046414;
        Tue, 26 Jun 2018 22:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530079046; cv=none;
        d=google.com; s=arc-20160816;
        b=K1j6AfrQyjFsB/VL2KcUGSFphgv/bdJQITuooHWr7KTiLP33fW0WE06JV+g3rYLabw
         BTqEbEA1P48RDnkYfxjvIp7i8qMJ/OZT9SENrf2fPizwrDkbL9oDxrQySJa3UAhDLunq
         fzD0Aimr0Mrq6ZUH2kvptx4JOy6u8AbXN1Vtqdd+TVqM1L6YOj2jaNM1BFYXe98LaFge
         SwwQFELkbohW+rcVA9bT7jEz8T8Q6z5AJXCPNrOokLM9HgZbyurO0Km0Q09e2D02lc1B
         zCnFzxtg2cEP4Cs+1Ax4kKL8A8VRwrH4kSudhGJRyVOyoWa0SgYo8bwCsjW0QvJ6YzFV
         dR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=G4NKT3ovpH+epmvX0eaiuNUeK4j07hekX/wxaKqzNDw=;
        b=x57fx7G+dKdkzZ0vl7mddqDIo3UWJZ/wjnWAN2ysh7h8MVQIMJoQu/PNb+/Zb746af
         CwzjIq5NPZJhQl+M2wbIf+GfkCN9MOebEDdAY+MdHd9j7p9aVuPuC4748WKY1u/pmyjI
         jlNXSyDA9cykC44bGTHqfGJs/AfQDqN+oa1q4798PPuZcRvGe/Ng3kK0tt7pDSTzuc+v
         eI7MZhuAc/6q/TVqfpSyJu6fL+3TU9OxAGDDUmng28Xp4aDCvJ/pSMQeZYRaa1z/HdDu
         kScNLbj5NQyOmgC+bs5ZUaG9Y7F1P6U4LxhbfLXkMCv2RaKXB4MOxPcI9T2QqZdDmiUo
         DeSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MOv3FMWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o35-v6si2360918qvf.160.2018.06.26.22.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 22:57:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MOv3FMWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY3SH-0002hB-Uk
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 01:57:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3S7-0002fT-3z
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 01:57:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3S4-0000Eq-3J
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 01:57:15 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:37313)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3S3-0000Dz-JS
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 01:57:12 -0400
Received: by mail-pf0-x242.google.com with SMTP id y5-v6so482979pfn.4
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 22:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=G4NKT3ovpH+epmvX0eaiuNUeK4j07hekX/wxaKqzNDw=;
	b=MOv3FMWScpXwvsys03NSrIbC2iMNi7YjT56qOTZpnHRoLwu7SEm7qht8lka5tQMdFs
	3a85CS4Nq1mHq6zxLgqmvl96YkBZ4DjrC9YnEOOITY0c0aDDM/lPntAy9cw6jfo3g/yO
	RQOBuEfYXG0BFgXinh5a4sDEuh2spLxSB9vh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=G4NKT3ovpH+epmvX0eaiuNUeK4j07hekX/wxaKqzNDw=;
	b=RwBnDNQvEJ2VX22kL6LHWnbtwXPzs/M2NXkPUzPlSNyWvtq523t9Su1Yxzk+K9sipS
	Dbb43xaQoYcVjB9NI1IynOGuLRdhc0DBBT64zSUTkJqe4Pt7UxWF3ZhXAEBu+3sk+9mO
	dF6opWI/g69kNwrQYZcwF558wZZ4F0qAH7Rlucm60CS/2d4o4cbkbI4QNQ36l+J7AzYq
	xqHXEcff6pHYGMB9Wdti3RHP7VNl6mp8oE0iQ+3NEfUgdai9JdZLQFen7W31qDsjJmH3
	Q7LzHGElepRWtS5IF1MtRpJg9TijDhF+kMzLkRYh3exfQLfEglSi2bqvOEL/ZoSr67fH
	5fnQ==
X-Gm-Message-State: APt69E3tQQ7xqrdwfAzFpCyV8AFVUZXdvMYXMl+/w3zAt0/fUDxflkMB
	Ck6MvCGObSW9r3f9l99TQAYqJA==
X-Received: by 2002:a65:4841:: with SMTP id i1-v6mr3859536pgs.75.1530079030557;
	Tue, 26 Jun 2018 22:57:10 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b62-v6sm5279439pfj.123.2018.06.26.22.57.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 22:57:09 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5f396d83-59c4-01e0-3f90-ba68e8217c1e@linaro.org>
Date: Tue, 26 Jun 2018 22:57:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 05/46] hw: Use IEC binary
 prefix definitions from "qemu/units.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Paul Burton <paul.burton@mips.com>, "open list:ARM" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SA9Kj2DbICMM

On 06/25/2018 05:41 AM, Philippe Mathieu-Daudé wrote:
> Code change produced with:
> 
>   $ git ls-files | egrep '\.[ch]$' | \
>     xargs sed -i -e 's/\(\W[KMGTPE]\)_BYTE/\1iB/g'
> 
> Suggested-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Acked-by: David Gibson <david@gibson.dropbear.id.au> (ppc parts)
> ---
>  include/qemu/cutils.h  |  8 +-------
>  hw/arm/msf2-soc.c      |  4 ++--
>  hw/arm/msf2-som.c      |  6 +++---
>  hw/core/loader-fit.c   |  3 ++-
>  hw/core/machine.c      |  2 +-
>  hw/display/sm501.c     | 14 +++++++-------
>  hw/hppa/machine.c      |  2 +-
>  hw/mips/boston.c       | 28 ++++++++++++++--------------
>  hw/ppc/pnv.c           |  4 ++--
>  hw/ppc/ppc440_uc.c     | 26 +++++++++++++-------------
>  hw/ppc/prep.c          |  2 +-
>  hw/ppc/sam460ex.c      |  2 +-
>  hw/ppc/spapr.c         | 10 +++++-----
>  hw/ppc/spapr_rtas.c    |  2 +-
>  hw/sd/sd.c             |  4 ++--
>  hw/sd/sdhci.c          |  2 +-
>  tests/test-cutils.c    | 18 +++++++++---------
>  tests/test-keyval.c    |  6 +++---
>  tests/test-qemu-opts.c |  7 +++----
>  19 files changed, 72 insertions(+), 78 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

