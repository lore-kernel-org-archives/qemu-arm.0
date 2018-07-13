Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp507689wrq;
        Fri, 13 Jul 2018 03:12:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdgCQnOW/tU4x/hzwlaAH6/JTHt+s9BkCZCP9y2bUlt5hXbUXYZvDAmgAQamOB8XEJ7oels
X-Received: by 2002:aed:3aa4:: with SMTP id o33-v6mr5182722qte.19.1531476774467;
        Fri, 13 Jul 2018 03:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531476774; cv=none;
        d=google.com; s=arc-20160816;
        b=M+oIGvIc7GtPpMn+L/tsplRi2ixtOyZUnLxJzGOiU1jiX91GBVl3jd7eA5vJdZUReP
         0AWbpyWZD3b55n7wm98RNhZh76f6PGZrveOTJEXN3H9lWAVdfilTc8wo0zf+twiw+vs9
         l0sE/TsdHAOPHQyMyi/uN+OYfA0idCv1FIC9yOCe3KyXhGiQAzAPYS3Le2wt2kUM/wei
         QpQUXYoIvEIdSg7LDITFkmpfFPVhxjl+3txEsRoj6E3JLL2guVuaZW+/EtbllojZzlob
         xiBt4gUqlMRle4CZw2kPCtDysSVf9yuogubtJjTuxUlSAKJd6Vi4wlRQbPSTliUEXFmi
         oxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=ezadXkugNbS/va7RY3NHt9JfP/tF8aS26/pnvrdH+54=;
        b=WjW/KqOt/2+Qfx2cVhDOnSd0gxO4uKR3McEMVk/4M7uJ3nAufK8ariZ4Xf9D2hTS0/
         DvulRDVyGRJAKnGarMGynyaRBvqAx65tBV7gjai9inPoa2Mr/FJ7WfWwSp7bALlVDB1x
         9hKB0V3E+Xr+GijVcZ4r9iobulVk6mPqwZl/F5VvSuTelVI9CBvEn5FDU0zxBb9f+gnb
         J0LFQ3G0+HYW6F8HpOm2DTyaq5r1loQy7rAr19g+AJMncmAFy6bm4m4yWxLS5VG1mGTr
         8eP+yRWgY8H6gr7BHuJboBPEJ390hWw5DTIEFFBpImli4xMhgm+XfPnix/0L8vztyLRt
         hsSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 61-v6si56431qtf.322.2018.07.13.03.12.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 03:12:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdv4H-0007YX-Uq
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 06:12:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fdv42-0007V9-O7
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 06:12:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fdv3x-0006UX-Pb
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 06:12:38 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57356 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1fdv3x-0006UP-J4; Fri, 13 Jul 2018 06:12:33 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1347F406F8A3;
	Fri, 13 Jul 2018 10:12:33 +0000 (UTC)
Received: from [10.36.117.240] (ovpn-117-240.ams2.redhat.com [10.36.117.240])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ED142026D6B;
	Fri, 13 Jul 2018 10:12:29 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <1531409463-3843-1-git-send-email-thuth@redhat.com>
	<1531409463-3843-2-git-send-email-thuth@redhat.com>
	<20180712165224.GD31657@localhost.localdomain>
	<224a0bbb-9dbb-87eb-9e9b-1c82923010b5@redhat.com>
	<e034610d-9a1d-a8a5-ee92-b2e3f0ba2891@redhat.com>
	<1b9c5145-881c-2385-6b91-a3c56ddcae2f@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	xsEhBFRCcBIBDqDGsz4K0zZun3jh+U6Z9wNGLKQ0kSFyjN38gMqU1SfP+TUNQepFHb/Gc0E2
	CxXPkIBTvYY+ZPkoTh5xF9oS1jqI8iRLzouzF8yXs3QjQIZ2SfuCxSVwlV65jotcjD2FTN04
	hVopm9llFijNZpVIOGUTqzM4U55sdsCcZUluWM6x4HSOdw5F5Utxfp1wOjD/v92Lrax0hjiX
	DResHSt48q+8FrZzY+AUbkUS+Jm34qjswdrgsC5uxeVcLkBgWLmov2kMaMROT0YmFY6A3m1S
	P/kXmHDXxhe23gKb3dgwxUTpENDBGcfEzrzilWueOeUWiOcWuFOed/C3SyijBx3Av/lbCsHU
	Vx6pMycNTdzU1BuAroB+Y3mNEuW56Yd44jlInzG2UOwt9XjjdKkJZ1g0P9dwptwLEgTEd3Fo
	UdhAQyRXGYO8oROiuh+RZ1lXp6AQ4ZjoyH8WLfTLf5g1EKCTc4C1sy1vQSdzIRu3rBIjAvnC
	tGZADei1IExLqB3uzXKzZ1BZ+Z8hnt2og9hb7H0y8diYfEk2w3R7wEr+Ehk5NQsT2MPI2QBd
	wEv1/Aj1DgUHZAHzG1QN9S8wNWQ6K9DqHZTBnI1hUlkp22zCSHK/6FwUCuYp1zcAEQEAAc0f
	UGFvbG8gQm9uemluaSA8Ym9uemluaUBnbnUub3JnPsLBTQQTAQIAIwUCVEJ7AwIbAwcLCQgH
	AwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEH4VEAzNNmmxNcwOniaZVLsuy1lW/ntYCA0Caz0i
	sHpmecK8aWlvL9wpQCk4GlOX9L1emyYXZPmzIYB0IRqmSzAlZxi+A2qm9XOxs5gJ2xqMEXX5
	FMtUH3kpkWWJeLqe7z0EoQdUI4EG988uv/tdZyqjUn2XJE+K01x7r3MkUSFz/HZKZiCvYuze
	VlS0NTYdUt5jBXualvAwNKfxEkrxeHjxgdFHjYWhjflahY7TNRmuqPM/Lx7wAuyoDjlYNE40
	Z+Kun4/KjMbjgpcF4Nf3PJQR8qXI6p3so2qsSn91tY7DFSJO6v2HwFJkC2jU95wxfNmTEUZc
	znXahYbVOwCDJRuPrE5GKFd/XJU9u5hNtr/uYipHij01WXal2cce1S5mn1/HuM1yo1u8xdHy
	IupCd57EWI948e8BlhpujUCU2tzOb2iYS0kpmJ9/oLVZrOcSZCcCl2P0AaCAsj59z2kwQS9D
	du0WxUs8waso0Qq6tDEHo8yLCOJDzSz4oojTtWe4zsulVnWV+wu70AioemAT8S6JOtlu60C5
	dHgQUD1Tp+ReXpDKXmjbASJx4otvW0qah3o6JaqO79tbDqIvncu3tewwp6c85uZd48JnIOh3
	utBAu684nJakbbvZUGikJfxd887ATQRUQnHuAQgAx4dxXO6/Zun0eVYOnr5GRl76+2UrAAem
	Vv9Yfn2PbDIbxXqLff7oyVJIkw4WdhQIIvvtu5zH24iYjmdfbg8iWpP7NqxUQRUZJEWbx2CR
	wkMHtOmzQiQ2tSLjKh/cHeyFH68xjeLcinR7jXMrHQK+UCEw6jqi1oeZzGvfmxarUmS0uRuf
	fAb589AJW50kkQK9VD/9QC2FJISSUDnRC0PawGSZDXhmvITJMdD4TjYrePYhSY4uuIV02v02
	8TVAaYbIhxvDY0hUQE4r8ZbGRLn52bEzaIPgl1p/adKfeOUeMReg/CkyzQpmyB1TSk8lDMxQ
	zCYHXAzwnGi8WU9iuE1P0wARAQABwsEzBBgBAgAJBQJUQnHuAhsMAAoJEH4VEAzNNmmxp1EO
	oJy0uZggJm7gZKeJ7iUpeX4eqUtqelUw6gU2daz2hE/jsxsTbC/w5piHmk1H1VWDKEM4bQBT
	uiJ0bfo55SWsUNN+c9hhIX+Y8LEe22izK3w7mRpvGcg+/ZRG4DEMHLP6JVsv5GMpoYwYOmHn
	plOzCXHvmdlW0i6SrMsBDl9rw4AtIa6bRwWLim1lQ6EM3PWifPrWSUPrPcw4OLSwFk0CPqC4
	HYv/7ZnASVkR5EERFF3+6iaaVi5OgBd81F1TCvCX2BEyIDRZLJNvX3TOd5FEN+lIrl26xecz
	876SvcOb5SL5SKg9/rCBufdPSjojkGFWGziHiFaYhbuI2E+NfWLJtd+ZvWAAV+O0d8vFFSvr
	iy9enJ8kxJwhC0ECbSKFY+W1eTIhMD3aeAKY90drozWEyHhENf4l/V+Ja5vOnW+gCDQkGt2Y
	1lJAPPSIqZKvHzGShdh8DduC0U3xYkfbGAUvbxeepjgzp0uEnBXfPTy09JGpgWbg0w91GyfT
	/ujKaGd4vxG2Ei+MMNDmS1SMx7wu0evvQ5kT9NPzyq8R2GIhVSiAd2jioGuTjX6AZCFv3ToO
	53DliFMkVTecLptsXaesuUHgL9dKIfvpm+rNXRn9wAwGjk0X/A==
Message-ID: <e9e3219f-abdd-2ef5-c7f7-50807b063b0c@redhat.com>
Date: Fri, 13 Jul 2018 12:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1b9c5145-881c-2385-6b91-a3c56ddcae2f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 13 Jul 2018 10:12:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 13 Jul 2018 10:12:33 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH 1/5] qom/object: Add a new function
 object_initialize_as_child()
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
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MyZ7OgjEIVa2

On 13/07/2018 09:57, Thomas Huth wrote:
> Since we are in hard freeze already, I'd rather prefer to keep it
> simple, without the variable args for now (we don't need them yet).
> Especially since we can easily add them later when we need them,
> changing the prototype from
> 
> void object_initialize_child(Object *parentobj, const char *propname,
>                              void *childobj, size_t size,
>                              const char *type, Error **errp);
> 
> to
> 
> void object_initialize_child(Object *parentobj, const char *propname,
>                              void *childobj, size_t size,
>                              const char *type, Error **errp, ...);
> 
> should not affect any of the existing caller sites later.
> 
> And yes, I think these functions should have "child" in their names, so
> I'll continue with object_initialize_child now. Renaming
> object_new_with_props to object_new_child also sounds like a good idea
> to me, but that's something for the time when the hard freeze is over.

It's true that we are in hard freeze, but now that I've noticed the
parallel with object_new_with_props, it seems to me that making the
functions subtly different (in naming or functionality) is just being
sloppy.  A search-and-replace patch is acceptable for hard freeze if
there is a good reason for it, and the rest is just copying code from
object_new_with_props into the no-malloc version.  The variable
arguments are handled simply by

    if (object_set_propv(obj, &local_err, vargs) < 0) {
        goto error;
    }

and another thing to do is

    if (object_dynamic_cast(obj, TYPE_USER_CREATABLE)) {
        user_creatable_complete(obj, &local_err);
        if (local_err) {
            object_unparent(obj);
            goto error;
        }
    }

which is included in object_new_with_propv.

Thanks,

Paolo
