Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp567073wrq;
        Fri, 13 Jul 2018 04:20:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe9v7RAi2k+XSXWDL2tJiC4kAumNCR9uwlggyzpovcVjYRSa2OwpkzdTQ/2WG+b6rUOBqtl
X-Received: by 2002:a0c:8745:: with SMTP id 5-v6mr6512178qvi.223.1531480823205;
        Fri, 13 Jul 2018 04:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531480823; cv=none;
        d=google.com; s=arc-20160816;
        b=LkKFJoJer2GHdFm6Go0i0kaky14Garj40r01NfSxLECQ0wMCN+veBbIy68KJN5nBNe
         enGx+eQVah2y4jr6BJXWWT9+cwtxPjEUbPgZhtrS13hKj3aIxWp9VhMCxtU6bFpyt4MZ
         yHFkwe8Oeb0Yjs4Q19LT9iq9QUMxwY+0e7HZ2nPT7IZa/vCd+k3th0+n+Eq8b1rRbJrq
         PhxymP0jF5pn1dgSt94kYkvu1/iZMmypmgeBTCHdBFUUmuAj5ZF3zM45z0R1Yuc/8Fki
         8rS68Z1IN1IqdhSQSqTbNep4e72YhJhkJfry+LLgeRrHrUmP47xcrhI+XoMgk8tlFxuN
         EXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=x9fwF8Og9Z/x2vfZw196yqQNAnR/V+tTjGT32l6djuU=;
        b=hTRWN7aXgCJscqeoEExAgz2/2xcBeLg5iSyC1NwwYvXdvrCiC3S5TgIwbQ6j/dmN7p
         lI+XEUwDNudQl8jnzEpMX2CyKxaOO9Kz1tm92ZJaJq7hjQau+RSkM/CAZVRy5O1mPflz
         Ou98y6h117kUwK2XG1ek3kpL+0FcQ8+pMV6JZW/MtOYGtZeMl1ND13HgT6jNnqI9OqHh
         GKvypY2HuxKloMVRAU6PG0bYv9GYEfqktSBF8T+24MipbOHpinQ9aZRcCNjg9XSzlN9+
         mMXk/2voAsTbuqA/HJL2N7hO9j7q8EizcXwf43qVb2IaKfLR44/F/Ktr9wrEOeX3EfOr
         K4ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n39-v6si10814443qte.96.2018.07.13.04.20.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 04:20:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdw7a-0001JY-Oa
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 07:20:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdw7U-0001He-9s
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 07:20:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fdw7Q-0007cu-AT
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 07:20:16 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36020 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fdw7Q-0007br-4d; Fri, 13 Jul 2018 07:20:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52B617DAC8;
	Fri, 13 Jul 2018 11:20:11 +0000 (UTC)
Received: from [10.36.116.70] (ovpn-116-70.ams2.redhat.com [10.36.116.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A06F62156700;
	Fri, 13 Jul 2018 11:20:09 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <1531409463-3843-1-git-send-email-thuth@redhat.com>
	<1531409463-3843-2-git-send-email-thuth@redhat.com>
	<20180712165224.GD31657@localhost.localdomain>
	<224a0bbb-9dbb-87eb-9e9b-1c82923010b5@redhat.com>
	<e034610d-9a1d-a8a5-ee92-b2e3f0ba2891@redhat.com>
	<1b9c5145-881c-2385-6b91-a3c56ddcae2f@redhat.com>
	<e9e3219f-abdd-2ef5-c7f7-50807b063b0c@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <9351138f-0316-7a23-356a-8d3a9c93e759@redhat.com>
Date: Fri, 13 Jul 2018 13:20:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <e9e3219f-abdd-2ef5-c7f7-50807b063b0c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 13 Jul 2018 11:20:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 13 Jul 2018 11:20:11 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
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
X-TUID: PqUVMGfOwX5m

On 13.07.2018 12:12, Paolo Bonzini wrote:
> On 13/07/2018 09:57, Thomas Huth wrote:
>> Since we are in hard freeze already, I'd rather prefer to keep it
>> simple, without the variable args for now (we don't need them yet).
>> Especially since we can easily add them later when we need them,
>> changing the prototype from
>>
>> void object_initialize_child(Object *parentobj, const char *propname,
>>                              void *childobj, size_t size,
>>                              const char *type, Error **errp);
>>
>> to
>>
>> void object_initialize_child(Object *parentobj, const char *propname,
>>                              void *childobj, size_t size,
>>                              const char *type, Error **errp, ...);
>>
>> should not affect any of the existing caller sites later.
>>
>> And yes, I think these functions should have "child" in their names, s=
o
>> I'll continue with object_initialize_child now. Renaming
>> object_new_with_props to object_new_child also sounds like a good idea
>> to me, but that's something for the time when the hard freeze is over.
>=20
> It's true that we are in hard freeze, but now that I've noticed the
> parallel with object_new_with_props, it seems to me that making the
> functions subtly different (in naming or functionality) is just being
> sloppy.  A search-and-replace patch is acceptable for hard freeze if
> there is a good reason for it, and the rest is just copying code from
> object_new_with_props into the no-malloc version.  The variable
> arguments are handled simply by
>=20
>     if (object_set_propv(obj, &local_err, vargs) < 0) {
>         goto error;
>     }
>=20
> and another thing to do is
>=20
>     if (object_dynamic_cast(obj, TYPE_USER_CREATABLE)) {
>         user_creatable_complete(obj, &local_err);
>         if (local_err) {
>             object_unparent(obj);
>             goto error;
>         }
>     }
Maybe. But I doubt that I've got enough spare time to implement and test
this before the next rc. So if anybody wants to see the fixes in the
next rc already, please pick up the v2 series. Otherwise, I'll have a
closer look next week.

 Thomas
