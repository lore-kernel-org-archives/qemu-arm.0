Received: by 10.223.197.9 with SMTP id q9csp142727wrf;
        Tue, 10 Oct 2017 19:19:05 -0700 (PDT)
X-Received: by 10.55.94.196 with SMTP id s187mr16222112qkb.88.1507688345534;
        Tue, 10 Oct 2017 19:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507688345; cv=none;
        d=google.com; s=arc-20160816;
        b=fks6DMatonPuWOEn6SVeEBiuB0V6IsOziddYH+Lt1X7VesY/YoLhelZ+R4VG9vS2OR
         GAxOdKDg3gk9GQaz0iRUExpB/XC5qPLkR4HBHtyG95o0uHF2L4S82gEc2jkOyETEcnb1
         WWIEJWQG4Ywk5P1eev6HAGwVzbsAY2r6GFXAq26mWD2h9HLPXtpAXxBM7D/knGEBFOLQ
         gWTyFD+9GUG32h6rD55MW4G5Jb9aKhoQ+b70Jf1L/+IuXCi3Hh0kSAEdw3QuStfWQupg
         3jbkW7C2yArzJd0qVN0yvG5fDY4gIaFdkg7Qsr+5EyQxK6P4MYJkP6TV0G3TV+IJ5nFG
         YWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=rbXPDzx0Tmx0NSGcCe91kXxg890817hFV/R/rY9Nhfg=;
        b=fQ22ypseBbzWttLwTUaiuIok0UJzLaxh47gJ7APYkHuVvnLnHolmpxLs713ut+fi5e
         WSOMiNXaCtkG81B9ld3XaaxCKBcpAZLVVS+7uOsiSWpm3Zcc7IzhUvOKVBX0jToOGRvz
         j3QTSjm/TIY+/BpniwB8FZFLy8u0Wvnq9/tdpRMVJWTqQGdeSCMQjkKFIZPS5Jl4kQ49
         c19nFiHphq/FsPhepcOfg0FT+sFYcePWlR80C6OvknWfwO2OVRS/DJXT4oH60tOxWTON
         EdX3vGbEfIdhiWR+adWkFmYcxmyLez94RnzaX4J7oNWEcPkTcLV0RJM4SR+gHR9ru3V/
         wB9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UbkDZB+7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e186si563244qkb.320.2017.10.10.19.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 19:19:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UbkDZB+7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e26bv-0007h1-8G
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 22:19:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e26bl-0007ge-IU
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 22:18:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e26bd-0005Nc-TY
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 22:18:49 -0400
Received: from mail-pf0-x229.google.com ([2607:f8b0:400e:c00::229]:45733)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e26bd-0005NR-Mj
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 22:18:45 -0400
Received: by mail-pf0-x229.google.com with SMTP id d28so361101pfe.2
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 19:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rbXPDzx0Tmx0NSGcCe91kXxg890817hFV/R/rY9Nhfg=;
	b=UbkDZB+7mTwo3rnQg1K0/S2nTSNsej1xsCfjHjWGKsmzeX0yEMiEY+UlBjvgn6PL9d
	oDPX22mt30EI36oYAgn3vEC7jtNUjT/WoDSGrYGHyNnws0X28OyLEJh+w+eGK5AqWHZn
	92H24q02OQ2GhNq1EAFAZnhxFGbTF4ldHiy+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rbXPDzx0Tmx0NSGcCe91kXxg890817hFV/R/rY9Nhfg=;
	b=j45IkjEP87qu6SiEIdZ7Aj0XG2tnUOEUDjq4k1jeN0KngoUqcwzr9fmBwfoNsz1gHl
	uE1PLINvzIfJ0xh/U1YS6nWrMiS4QhohDwNPKlGx/h/N4OEGRccJlI7XKblCztGMNCEF
	cHMvZeIHd+gZUYm4tRgzxocDrphhDQ+ZS+Z97RODUhMUvNLay9mOZyfeYjcUuEOLGF1p
	bomJgMTxQYqnPcXkGSqRaN2kj+JmMK94FF/HNKsvPgcX6vULNzAXHHJc1kvodHZyemVQ
	mv2M3p6pQxcykDt2yRkjGGHmmJ9kxg0lSBz3omoZelanoQnGfCQqD8HccVfPAQvTk5Wn
	1aZg==
X-Gm-Message-State: AMCzsaVodg4h3PntqMjD+/6iuOe/799UVNSC8WWO0ut191PKSdHLdpvq
	uZmsQ+gCNBl5DpdE65SXc4MBXg==
X-Google-Smtp-Source: AOwi7QCXt50PbQTlzUoW4jF0Yx3Rw+rYjZNzEto69g0ciwQDYyZARMh8lp98voOu4GoQIjFH+AUvzg==
X-Received: by 10.98.102.82 with SMTP id a79mr15609636pfc.109.1507688324824;
	Tue, 10 Oct 2017 19:18:44 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net.
	[97.126.104.76]) by smtp.gmail.com with ESMTPSA id
	m69sm22071405pfk.54.2017.10.10.19.18.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 19:18:43 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
	<1507556919-24992-7-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <520fa164-103e-c09d-67af-5d0e9d8ebb9b@linaro.org>
Date: Tue, 10 Oct 2017 19:18:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507556919-24992-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/9] target/arm: Pull Thumb insn
 word loads up to top level
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wiP3fJq4iqzJ

On 10/09/2017 06:48 AM, Peter Maydell wrote:
> +    if ((insn >> 11) == 0x1e && (s->pc < s->next_page_start - 3)) {
> +        /* 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix, and the suffix
> +         * is not on the next page; we merge this into a 32-bit
> +         * insn.
> +         */
> +        return false;
> +    }
> +    /* 0b1110_1xxx_xxxx_xxxx : BLX suffix (or UNDEF);
> +     * 0b1111_1xxx_xxxx_xxxx : BL suffix;
> +     * 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix on the end of a page
> +     *  -- handle as single 16 bit insn
> +     */

I really had to search to find docs for this.  I suspect it's quite clear in v5
manuals, but I didn't have one handy and arm.com seems to have dropped
everything before v6M.  However, I did see a footnote in v7M that explained.

But, everything appears to be in order.  It's a nice cleanup.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
