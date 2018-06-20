Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp944249wrq;
        Wed, 20 Jun 2018 09:11:15 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIQXECfmY/w8RYjoqW9kUUdCtNgjlrCP+KDWNTvoqAcQXUHGrGQYtKRSiA4/7jJrZfg4Iat
X-Received: by 2002:a37:6216:: with SMTP id w22-v6mr18087049qkb.312.1529511075915;
        Wed, 20 Jun 2018 09:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529511075; cv=none;
        d=google.com; s=arc-20160816;
        b=x7ASGnFksZ2sMgnHC50QMztpyVX/OF5HjxiMAA+XU+IzKN2CBLPk3X2zk0wTSzteLA
         ng8tjIC4JtSGtUabmWLDsG9rQCRwJ0gY+wyNFeqIxlnzjpBd7kMRtBodZD39cW/rvjgk
         ISBzpgmbD5xoaLLOmPDFeho4iXScAZ2TJ8mCv9dLwJIH/CM4DEujLJNvR4t+O2ONg7YL
         l+6hf5t96SCW+N8P5m5xMtQsMvF0ADFz2w/DuiOh7HiGy8BANAE3SeRkxevZmYOP1Y5O
         new6ErwPPdnu2BiTKIm6DXj87vuu2YkwauEPy4RaFKO8xlgubkHn6O6yx821fUh/jZEN
         KoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=lF94IDBKKtoIvKuHCdsXz7lif2NGPvK3BBpmdfyKjkg=;
        b=OLLDrXNK9rKXNl0FJyM1awwNw4khD0GaJTUlaMLa3aFDvd4iIqtvU0dz6o8aWZR5cf
         ujevq/in1+OGCNabBQ1Wnsh8S/DEwo45nQo9uKzUlRhr52OtEfrCkBjJBYs6XIkJY+nY
         KQoGEZwdN63+FA5w1Ju/M7KHfeOmUP6Qn1ipSaIfuZwP2+aEnWLmQUbhRE3YMo3yFWty
         8DGNNEDq8k6hNujbTKGP/sj0pPqHib+cv8in30J73AT7yxAFjiS4DTG5WEsYMWjSgBSL
         80Cmiwb/hcqKlbnNWPzMnhat0q1X/nIcg8YlFmktl2p6F614xwSahDKVDbi1CRrZGMfK
         7Q3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Z/8bm/pQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g63-v6si2196602qkf.81.2018.06.20.09.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 09:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Z/8bm/pQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVfhT-0006gb-F8
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 12:11:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVfhK-0006eq-AS
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:11:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVfhJ-0002Hh-AD
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:11:06 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:35057)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVfhJ-0002HV-58
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:11:05 -0400
Received: by mail-ot0-x241.google.com with SMTP id q17-v6so131250otg.2
	for <qemu-arm@nongnu.org>; Wed, 20 Jun 2018 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lF94IDBKKtoIvKuHCdsXz7lif2NGPvK3BBpmdfyKjkg=;
	b=Z/8bm/pQlDAXB1IaPkrD+Z5BElUOBWngCkW+8qHJds69gyU0wP3bX0cwms2NvPdbZ9
	vicDwx9RzMJw1tI4SKSdU69qSJmIVCUbWhmKXmOJF+i5k1GcEUrhfYfzy/FNfH3bx+aL
	faX2tcM1CW+4n/n4mpL0jWKxWMU99EcFtJtVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lF94IDBKKtoIvKuHCdsXz7lif2NGPvK3BBpmdfyKjkg=;
	b=Wg8Kign8EWQ1P8//kzzuY5eHaUFU49lNwxj62L6FtTqN0WMh0KQ12SjvXpWgevHA56
	ffLDRjvhrUoI5hyMcy0SvRh3gKvvRuM6+iQ+QJmZiEhWG8x99hxAbdWlgyhy7WfK8bMo
	J3qkrmd+1w+5mXX6IAOnYZDbe1lAKplvyXe7pIcbme3+rdrjQUSIJSrFzhTepFEBNFk5
	xS60XdQALgi/zPu9Ux7U9cdkO+YTOUF8rUowRWcHOo0aEH8f1feCchBd0C/Th4i9c8DG
	U6SZH22Obj5itmYWf8HWGyp+c/5BaGeNgkwYATr8YCEJNx3O1JLbPM/q9KlRg9uQQK5w
	gUuA==
X-Gm-Message-State: APt69E2k5pp/siAhh9oog7Kw33HHrn8Gprc+sc1osV0FvK39kRgKs1Db
	sPFZl0C9sFoe72E0cqL8ONJqS57YDkqusKD5PYDFaw==
X-Received: by 2002:a9d:3d76:: with SMTP id
	a109-v6mr14158002otc.294.1529511059728; 
	Wed, 20 Jun 2018 09:10:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 09:10:39
	-0700 (PDT)
In-Reply-To: <CAFEAcA_rgm7KX+Tm+TkgoKEfAV0f-vAeoQ5dv_jBzfA47kAWNw@mail.gmail.com>
References: <1528790908-23441-1-git-send-email-eric.auger@redhat.com>
	<1528790908-23441-3-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_rgm7KX+Tm+TkgoKEfAV0f-vAeoQ5dv_jBzfA47kAWNw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 17:10:39 +0100
Message-ID: <CAFEAcA84MpwJj8n0LvyE0BrfuJLCfB4rVWT=o0GcDn-6HpMThA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v2 2/4] hw/arm/smmuv3: Cache/invalidate
 config data
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, jia.he@hxt-semitech.com,
	qemu-arm <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
	Jia He <hejianet@gmail.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: be1R6p8w1Qh0

On 20 June 2018 at 16:56, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 12 June 2018 at 09:08, Eric Auger <eric.auger@redhat.com> wrote:
>> +smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, float perc) "Config cache HIT for sid %d (hits=%d, misses=%d, hit rate=%.1f)"
>> +smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, float perc) "Config cache MISS for sid %d (hits=%d, misses=%d, hit rate=%.1f)"
>
> Does our tracing infrastructure really support floats? There
> is no other use of it in the tree. There is one instance of
> 'double', though, so maybe we do.
>
> In general I think we should prefer 'double' over 'float' anyway,
> though.

I asked Stefan on IRC and the systemtap backend doesn't support
float or double, so we need to use an integer type here.
Lazy approach is to just round the % to an integer; if you think
the extra precision is useful then you can have %d.%d and
calculate the 10th-of-a-percent digit or something.

thanks
-- PMM
