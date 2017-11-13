Received: by 10.223.150.237 with SMTP id u100csp2199067wrb;
        Mon, 13 Nov 2017 00:11:14 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZLdJJlo+pbU4JiwOuhzutwBgk/hvk+uPQWMcLg8iNk3120ra0ORYZ9vPwz9TY5cYy7oVoQ
X-Received: by 10.13.245.1 with SMTP id e1mr5444344ywf.24.1510560674877;
        Mon, 13 Nov 2017 00:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510560674; cv=none;
        d=google.com; s=arc-20160816;
        b=aQ6SxRjDgaxN2ey+dMamURX+rPprGGhIZrgUSDiAqsnmNBZjSYmdfuSS6KNZwvh3Qc
         HlUxh7Ve2qzV5dVhoynUnaBjo6zSUBrLKB09srqbuUxwf1wD+mJSzhcAP5uoCLRie8Ja
         0SiO9VWqn/9Ed5kD1c8D8uGKi1D1LRGfA65Q60DOuKekMB+w1kjCNLec2UCFLs9EAf3w
         Pdtcrh1nmfdIq47HPq20OQOhSXP1f5Feme+78YDYoxLA3Nms7YQBAcEBZBWCOOyF0LA0
         7ptE1MkzHSPoRGP3qiCj7flnLtL2g7S3bCK9USYYRdkiuYOjLZsRA9Pjga96ElkFLoJA
         rqaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :message-id:in-reply-to:to:from:date:arc-authentication-results;
        bh=l8JixVclK6CCS+5C9u4AuVZo7ypUYieXQQfqZvsSsUU=;
        b=vQxI6tuXPRm53zzBzNgVrX17KJHj7Hl9sLmHBeR+jGcmFuhu25kitGyHmDg+CAFPtm
         gaaWRcgTeO/Sjo7G0ZQlZBt/NMsO4XYpN3gYjEu4t5NtdS0Cvs7dOtBYE23Fyzw64Nog
         A0SdjNO/PW9vXQIZvNgERD67lqjcluQG8pMpQn6/7X7Q0GK7QqFKCn2LKda9FmZB7cxs
         uIVHh0lul5geqbaIypp5YH4p1btcMvAeiElx+ZieT0Sz1n/C2b9btJA/8Br1wXopBRPb
         hKBunNYakGjQOZDxt+YZsWYz7aZTG8zE3casMozBQxlh5T1oiQ5odd+bvbwjTJO+tD+5
         8WTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v6si3447990ywv.763.2017.11.13.00.11.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 00:11:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eE9pq-0007qq-9S
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 03:11:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eE9pi-0007qe-2c
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 03:11:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eE9pe-0007bM-Sm
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 03:11:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38900)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1eE9pe-0007b1-N7; Mon, 13 Nov 2017 03:11:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 71DAA68688;
	Mon, 13 Nov 2017 08:11:01 +0000 (UTC)
Received: from javelin (unknown [10.65.150.186])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A4B718782;
	Mon, 13 Nov 2017 08:10:52 +0000 (UTC)
Date: Mon, 13 Nov 2017 13:40:45 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
In-Reply-To: <29f80a56-df32-0eb5-0152-683c85a7e421@amsat.org>
Message-ID: <nycvar.YSQ.7.76.1711131339450.10115@wniryva>
References: <20171111081111.32724-1-ppandit@redhat.com>
	<29f80a56-df32-0eb5-0152-683c85a7e421@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-128019816-1510560660=:10115"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 13 Nov 2017 08:11:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v1] highbank: validate register offset before
 access
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
Cc: Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
	Qemu Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	Shawn Guo <shawn.guo@linaro.org>, Moguofang <moguofang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eICJjlXI2XrC

--0-128019816-1510560660=:10115
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

  Hello Philippe,

+-- On Sun, 12 Nov 2017, Philippe Mathieu-Daud=C3=A9 wrote --+
| I'd rather use:
|=20
|            "highbank: bad write offset 0x%" HWADDR_PRIx "\n", offset);

Sent revised patch v2. Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
--0-128019816-1510560660=:10115--
