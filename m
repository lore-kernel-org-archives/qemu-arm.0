Received: by 10.25.0.6 with SMTP id 6csp1600409lfa;
        Mon, 22 May 2017 17:22:03 -0700 (PDT)
X-Received: by 10.159.52.84 with SMTP id s20mr11553595uab.8.1495498923622;
        Mon, 22 May 2017 17:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495498923; cv=none;
        d=google.com; s=arc-20160816;
        b=w/HPrzgWnKul+CjwJz6USV23tiZCQeO2K/3Qhd7BW5Q61PBknte1iB+aW1W1s8VbWH
         jHbdVDR4ttF7mlwTCv+xZ/A/tmERW53KYTU+6eBYXjBqWRUEk4e03P49Tt7AMmHzEF+t
         sqrmONCE8CdSSEB6An5am0XZ64smkkd/Cmnpw0ksRwNV+iw7/WD+dbMepUuebyMRtZOL
         7TyCL1zoo1MCe8Uzu8d6hl3mu6pOfQmXgWtwjjDs66RwjqSq+TGGHnOGsXvNFvACAhsU
         ppq6RpQsWwq5mmalcgnZfeUePndMNzpGbiPPtNg5gUeWk9CU5tnBIQWxS5iJWxxQejwl
         uRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=VjWqVVFoc/0SAawfwGb+c+Uug5GrhVqMbkD4dGF0Z50=;
        b=JSf0XqHu0vANBE8A6DSlAxXO6aAD0bjAm97yBYKegTQaXQbK+GCd/iPTmJ3P0Pogjz
         92TMZcTkyXk4D4ZAEXdgYD8v0IAcXfn0aG5QIMdB/Sg/kvKuncmWBoEj7dAdrsjrw1x7
         CLVZHSnmVOi3Dd8hF+lPzDBhFTGz1Cxv8XyzIhhGZjRTC7bMlBcmkJxd6hJVUtFyMOLn
         8gNEhMf6H4diMMSnHeXXtvyGM8E1FZpeFtj5JhA73ZhmD6cfw5ZsiGz/PAjbzFS6vAaY
         iNvjW928bHG/mNxc4Xl8M+3mYjlHWLgvx4+1lqUwuN2SRi7gRwi6e8B8/4QIRmJL9Sby
         IXYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j39si8379798uad.88.2017.05.22.17.22.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 May 2017 17:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45421 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCxaN-0003wX-1H
	for alex.bennee@linaro.org; Mon, 22 May 2017 20:22:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dCxaG-0003u6-DZ
	for qemu-arm@nongnu.org; Mon, 22 May 2017 20:21:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dCxaF-0004NA-Mw
	for qemu-arm@nongnu.org; Mon, 22 May 2017 20:21:56 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33375)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dCxaF-0004N6-IK; Mon, 22 May 2017 20:21:55 -0400
Received: by mail-qt0-x241.google.com with SMTP id a46so20304151qte.0;
	Mon, 22 May 2017 17:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=VjWqVVFoc/0SAawfwGb+c+Uug5GrhVqMbkD4dGF0Z50=;
	b=AioKUS1mLCK3Gns4Is45LHYGI9ZixHZaE2TVqrlFqt3Ia8mq7sJpuieACVrIzdrIkK
	QpUudZOox8X12J2YvZVjEOcsrZw1+J5jglsFzT9mJOwr3rFQ7E93yALau8S/RYIzloR2
	VSGTcPnRzr06Lilk/e9IKb5ZYvE66cBdym4kY9NputkfMiDWh5gyw9MiiPQ3fWilrtKr
	0/+rcpD+rYZoinX9mkFbZ6p21NiTWilMAs5+oTs0ElP7XSvGDe0MuQ8evl1iIO2fRX4o
	fHg29rkHqnpGfTN/+KJDNhbwSmqDac5zHZF+2nboDl9LDvdJeazTZN8YJkOwBCNyCeMn
	E7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VjWqVVFoc/0SAawfwGb+c+Uug5GrhVqMbkD4dGF0Z50=;
	b=OdPbwxeO9w4NOEtESOCwpr3HJObrjOPfoc9tZZ/8m5Ilq+QEuw7cLt4eycsZaD9XR7
	4SPUcMV4HXnCksioj+cAgFGNN6H1uYi6GMOrbqCTWIDzRhthi3knmmn8lJq6TmT1afe0
	0C3iKbHhsn778FfdEEzpSzaKMJImtTFqmYIOwgDc1L8EfWY5ly7EjQCe5wQCJ1whaElJ
	A3ROr3ENPWNENI41DRS15e5loboTRvfvcJBNNi4AUpUojg433T9BnFZNGPfbrUrT+pbL
	A4Cw8bkCAIP8OFpYjiguRTDW1e2EKVyp1qomB7mC7Rq1/oLOOdsFo2JC65RTSyc3amIS
	9aaQ==
X-Gm-Message-State: AODbwcALEh6QrIFVHE2ugWvwTx7SDmZUySdtoesf2TJN0MMolzMc6HFo
	OM+NaBe2vBBU4JJCgpU=
X-Received: by 10.200.47.46 with SMTP id j43mr26208158qta.255.1495498914816;
	Mon, 22 May 2017 17:21:54 -0700 (PDT)
Received: from bigtime.twiddle.net ([2602:47:d954:1500:5e51:4fff:fe40:9c64])
	by smtp.googlemail.com with ESMTPSA id
	l184sm12815040qkc.33.2017.05.22.17.21.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 May 2017 17:21:54 -0700 (PDT)
To: Aurelien Jarno <aurelien@aurel32.net>, qemu-devel@nongnu.org
References: <20170516230159.4195-1-aurelien@aurel32.net>
	<20170516230159.4195-3-aurelien@aurel32.net>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <3d09ab30-3c55-b3ae-d749-cd2f1055d6c4@twiddle.net>
Date: Mon, 22 May 2017 17:21:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170516230159.4195-3-aurelien@aurel32.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/4] target/arm: simplify and
 optimize aarch64 rev16
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
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qJVey/pYCYQD

On 05/16/2017 04:01 PM, Aurelien Jarno wrote:
> Instead of byteswapping individual 16-bit words one by one, work on the
> whole register at the same time using shifts and mask. This is the same
> strategy than the aarch32 version of rev16 and is much more efficient
> in the case sf=1.
> 
> Signed-off-by: Aurelien Jarno<aurelien@aurel32.net>
> ---
>   target/arm/translate-a64.c | 24 ++++++------------------
>   1 file changed, 6 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

