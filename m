Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp894339ejc;
        Mon, 25 Sep 2023 23:45:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYnydav84ar03Rfwc0orTlCa9+moAaT7Wi+ptCXwgwVwG2aHbbbp0W5Iu0gUjmWC/Jxokj
X-Received: by 2002:a05:620a:390c:b0:774:19a4:117a with SMTP id qr12-20020a05620a390c00b0077419a4117amr1873998qkn.19.1695710743972;
        Mon, 25 Sep 2023 23:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695710743; cv=none;
        d=google.com; s=arc-20160816;
        b=vJ3Ghe/1FL98dQWy2FlrtrVt7hzznfLHl4dxLJp18sQLiltrE8111dzDp1d9Zdhe2I
         SiBrAAJmrTGi2BcMSL4jSYlvsYQKNTgWfH6lF5pZeA3yUCGhm79qTnq4sEzC9HY8drKd
         IHKtiy9Sw+jI8XtABO0fBAy0LOn+niO6Kg9mcgK3xfkFjPUHO4Gh+ay4tOx8u10pAL2y
         kXONNv3getUwGNcr4rK4BUwp2gU/yTdTzBPrO0NsMqljg8stkQiEA8OIoBkj42IFNBdZ
         eIBHYdYJBQZDnb2tWQslWwi4a1Eo9w+1+QgaEnjF6n0hnYMdLbc+ynwUwKLUfySIiaGU
         taRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=r/Ho9enusUrYPSwNWcosz6+Qd9TalQfli6wpdToaWqw=;
        fh=41pYziOKFGQm2nTVznqk7J0Ea0H7fMxk9gS1658bt7Q=;
        b=O7Cxt7/YrHcptvogkXIM5g4qy1BHNhGC3x2BO4tofedPOsj3P+UdEibzubldhekqPw
         ZA2+LI6JHDN7L8nTyXl+MIvhsEAkrmdzqhQ7sr1Sh5eVISl3l8/bKPWQDwoJRDGVUG3k
         BzlZ/NxpXvfbH0+dwM/Vow9BetvTy1xNyBKlPy+z2JJKeWV7hL5dZPlGV9dzNHiDOXxc
         I0sqcPn1a1dxxIDaPr5yYFXFImJ+UeKCMdFHkcH/GY3h0aK9G8yZHsxVQGgB/1Hpm8Ci
         nh2oUn9Iyx/Pbqa7eK0ZAqo0jF1zUmnZy0AO+X9ZSWJGkRhJd4Ml+CmkB0MDXHqBhe6v
         yCOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cc7LBkDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11-20020a05620a28cb00b0076ccd3dc9f2si6973602qkp.741.2023.09.25.23.45.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 23:45:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cc7LBkDi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ql1oo-0006GF-5a; Tue, 26 Sep 2023 02:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ql1ok-0006Fn-At
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 02:45:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ql1oh-000177-HR
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 02:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695710705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/Ho9enusUrYPSwNWcosz6+Qd9TalQfli6wpdToaWqw=;
 b=Cc7LBkDiQf70EbUtJ2y6qGUv8i68UNjrEghKNH83BhiGBcBwb5gKL8stnyLZdvYM6QgSGP
 5FtSu2Eu62zqhz03pshmmdX+uSFtdcoaSAAZVclGarafi4VnkvtkBslr1GZz1XW5Hzt27q
 CQn/09C5dYzgj81zZ8OFoZJvL4rmj/0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-7y2ZnNjXPsWyz6B5PuBvCg-1; Tue, 26 Sep 2023 02:44:59 -0400
X-MC-Unique: 7y2ZnNjXPsWyz6B5PuBvCg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51D22800962;
 Tue, 26 Sep 2023 06:44:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2306F492C37;
 Tue, 26 Sep 2023 06:44:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 18D6B21E6900; Tue, 26 Sep 2023 08:44:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,  Joel Stanley <joel@jms.id.au>,  Andrew Jeffery
 <andrew@aj.id.au>
Subject: Re: [PATCH 0/4] aspeed: Clean up local variable shadowing
References: <20230922155924.1172019-1-clg@kaod.org>
 <f7cdbd47-1833-af1a-ae09-363c86c2e74e@linaro.org>
 <838837dc-0d95-1d6c-3cfc-e321c9c01a7d@kaod.org>
 <87msxdmkeq.fsf@pond.sub.org>
 <6e17b750-8e07-874d-05ae-fae05b2cd804@kaod.org>
Date: Tue, 26 Sep 2023 08:44:58 +0200
In-Reply-To: <6e17b750-8e07-874d-05ae-fae05b2cd804@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Mon, 25 Sep 2023 18:28:52 +0200")
Message-ID: <87cyy5juvp.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lE4Jb14QVocp

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 9/23/23 09:13, Markus Armbruster wrote:
>> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>=20
>>> On 9/22/23 20:20, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> On 22/9/23 17:59, C=C3=A9dric Le Goater wrote:
>>>>> Hello,
>>>>>
>>>>> Here are cleanups for local variable shadowing warnings in aspeed mod=
els.
>>>>>
>>>>> Joel, Andrew,
>>>>>
>>>>> Could you please double check patch 4 ?
>>>> Could Markus' MAKE_IDENTFIER() help there?
>>>
>>> ah ! you typed too fast and I also read too fast, as :
>>>
>>>    MARKUS_IDENTIFIER()
>>>
>>> and I liked it :)
>>
>> LOL
>>=20
>>>                    but what is MAKE_IDENTIFIER  ? really, please explai=
n.
>>
>> Philippe is referring to
>>
>>      [PATCH v3 7/7] qobject atomics osdep: Make a few macros more hygien=
ic
>>      Message-ID: <20230921121312.1301864-8-armbru@redhat.com>
>>
>> which tweaks MAX() to permit nesting without shadowing.  Your PATCH 4
>> may not be needed if you base on it.
>
> We don't need the nested MAX(). PATCH 4 is a cleanup which happens
> to remove the shadowing. Let's keep it the way it is.
>
>> MAKE_IDENTIFIER() is a helper macro introduced in that patch.
>> You can fetch the patch from https://repo.or.cz/qemu/armbru.git branch
>> shadow-next, along with collected other shadowing patches.
>
> OK.
>
> Would you prefer maintainers to include the shadowing changes in a
> potential PR they would send or would you rather take care of it in
> a PR of your own ?

I'm happy to collect patches and do pull requests.  I don't mind
maintainers merging patches for their subsystems; interference should be
minimal.

Thanks!

