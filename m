Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1904808wru;
        Thu, 16 Aug 2018 07:14:53 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwH8+QvZqxBA4n6G8ErJ7S7VW0MStQG1kP9RPLfBcuwEQogx0KV6GPkDdijD8zglv7F7RBJ
X-Received: by 2002:ac8:1928:: with SMTP id t37-v6mr29316615qtj.327.1534428893596;
        Thu, 16 Aug 2018 07:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534428893; cv=none;
        d=google.com; s=arc-20160816;
        b=ETmUcX37omiYsl8uQyB56HQKhaBl53fkObjHw8gZgmOLUegkKxdgToX1+ZDSYWNN/R
         +ZrsX+wxJLF40DJHl6TmnE2UFP279ldfaHVyLY87X1aHKZRTMfWXZK7Q0Q5rrXeF5Qam
         uM/YI1mQhoTcRJSjx1xjXgNUK3kCJ/rC9kyElw3Sb+prkhoJRwVMnQ108oGg50Cao410
         EJIAmTLhSbBrLxr+/XW3B+aIUW0Y3tpjbE41TbWo+VTItSpk47HGwhsuJVtIp0qQiiJb
         p7YtkW2lQVTnPOzYMdxSQ/t3icy98z5FO7jFJ7mMZffynYZeXf7uIabGvijTyKdp1+Ue
         /RGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=DjTHCcatMkkXT53CZgzlbtXL3UDbjrEs6uxp3KS4ZEc=;
        b=LWhxjMyI/lvjaWRnBRZeuoU04CRuPCHZ+csEyV+pf+bNvuV/puEW2r2OyB5wwOa0y7
         0bkwO7lNsZhRC5LQ4+6vG9nC/r2DmVA8EjUgi2rJzfo+EjpCSnRuqqlfxVrHvfTKJ1pJ
         N+wqJPjmxZ6NLMVLiKCjgEK4q98QkLVGmXKLGM2+mQ8+IdhZ/0L7NH3FV5swBrG8/Jju
         VC8sjeU2muXHj+I8zJqDO0c6v6J0d7QSeJ1UYGufkbIOGrx8iNkcrNjI2JwV1Qknasqt
         cckvZRyxiIhQ++T5vULan3Ou96QQUMsBnIM7Sg8EYQ60vbMGia4xJ5rMo/Eu1YZMLp9a
         9xEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R+kmRLWB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h7-v6si3184499qkm.150.2018.08.16.07.14.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 07:14:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R+kmRLWB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqJ37-0007Bf-1X
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 10:14:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJ1K-00065X-J7
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 10:13:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqJ1J-0003ql-T4
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 10:13:02 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33342)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqJ1J-0003qE-Mx
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 10:13:01 -0400
Received: by mail-oi0-x242.google.com with SMTP id 8-v6so8276895oip.0
	for <qemu-devel@nongnu.org>; Thu, 16 Aug 2018 07:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DjTHCcatMkkXT53CZgzlbtXL3UDbjrEs6uxp3KS4ZEc=;
	b=R+kmRLWBKSb4lut3TbDe2TpCX2reJhN3aFeZqQzvaQvurj4oKDJ/V6orfkbC8yzI35
	vvXLHVB/1SF+ThQumVkoUYsHFGpvF6jV5bT5fxa8WjyPNO2bfkVQY5olzIergNM6WSM6
	GCDsUslP4CFrFWKemXgRrgZi5J4xj6+9geSoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DjTHCcatMkkXT53CZgzlbtXL3UDbjrEs6uxp3KS4ZEc=;
	b=cFQf7Y4oadrkoCQh7qTzs0juFPomKGWuOXW+DkNeFoQHWr+/snqvhS4Z9VHYt0LMI/
	Sjgk0ZddtIl2lWHTCkabHlz72fZ1EGN2F3hpyb6Hku4+s9eZttDRjxz977wqrtvHMBz9
	8TyOXwmOKTwSEniRIeJlUtNtNAfWa79LBOkqEMUtfOpyfOE2vH1Y9V3PABnkn4xfq20z
	RlDVn4VzdJg1e7svZsNTFTTIoC7kOnO2D7KohXxociXbbfkl0B3my8EAQswh2vaSGAyh
	JNfpzaPu9S2U2yWWdwr6PgAWLV5wRdtItkvmcd+FwMCK+vCUoIDzHAtd9EtPRSc4aeuz
	xm1w==
X-Gm-Message-State: AOUpUlGVHiPN8vpGyfm4MkritxcC/5/yqMcFMpc6UvryxtxNIPPpmb7B
	1wpRr6rwD3UQ1Hgy4ydoQKqyomu/zqmeyB902nQF8Q==
X-Received: by 2002:aca:4204:: with SMTP id
	p4-v6mr29144733oia.242.1534428781177; 
	Thu, 16 Aug 2018 07:13:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 07:12:40
	-0700 (PDT)
In-Reply-To: <20180803052137.10602-2-joel@jms.id.au>
References: <20180803052137.10602-1-joel@jms.id.au>
	<20180803052137.10602-2-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 15:12:40 +0100
Message-ID: <CAFEAcA-rtgv21udS5On4amFEbOCVuwA6Dw7SBWG3S0L9v5sXbg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH v4 1/3] MAINTAINERS: Add NRF51 entry
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AD2tKZToqlUa

On 3 August 2018 at 06:21, Joel Stanley <joel@jms.id.au> wrote:
> This contains the NRF51, and the machine that uses it, the BBC
> micro:bit.
>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v3:
>   fix spelling of mailing list
>   add stefan's reviewed-by
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
