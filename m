Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3047969ejc;
        Thu, 28 Sep 2023 23:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw8HpNTWJNAonHDVzgaD1MBT4Fg3Lp4vluf6Ufeg/02gyit/mCQ1RLwhb4y7EkLzaErbYG
X-Received: by 2002:ac8:5952:0:b0:418:f005:3a18 with SMTP id 18-20020ac85952000000b00418f0053a18mr4456088qtz.64.1695969988053;
        Thu, 28 Sep 2023 23:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695969988; cv=none;
        d=google.com; s=arc-20160816;
        b=bxqwg0DMingw3XEOWJBz5Wg59C5+pDtgEUaeGJJdoKSXcBAvf+ihj6eAi72B+aD43w
         qNxi99EsJ8isWx+8vMOzNR5mmrZLa9+41IjlW3Jprgh4ea3remWO/H0H4IUKSWfxt6zy
         oqNsIp1gCCfphGTfvRol5i3uPxeHwX//nIiH3ZLYIm5NWLvILMhs5GCKdaBcY47O7mWB
         9ZMC1zLSzVY5jr6P/Zf7Ke3Nd81BdReYc1IRf+OJYTOdSYXj7CITATYyF9uVe1f9U7G0
         r1fP+kAMlDO5TmOsa03zOr6Dfmd4cM+5w7RIRq7aUgHYQyzTLJFIGIH7P/nTVfFMMMpj
         YpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=pcgqEZ0dyo0op2HncJAhr/pSA8DkXDL9izufk4nQ8Z0=;
        fh=wQrh6XvlOF1kI8gZoqb0Lm3jgnP4pOSs4UOhJ5EVNNQ=;
        b=A5DOWFZ1sbSI4lj9Hh+YGMnzmqQFdEBqy5nMStLVOc+4fH7MwbBScjQYJ0XHJXWlYj
         Rdl67cVwLolaSrVNQhahixsUKv9SdqE0rmxwRGjNfDmNq9TxqpsgInMYhqSulRM+vNKj
         NWxmCcLH82A0PjyW6uqw8fdq55yOjE1Ixzs02OlHGD4tOwAEp6HYCtEFlGMOddFC7Nsq
         qQ9+pL0pGsaJGQJC8VNxvLm/Haws4eR9S6VB2NYjDimcVNHeRgwYYgI6UAg4sad1mDUw
         4IIj4zqOn2P35I9Yqii16Wv/IvDxLAaUm83klcnXriVTefkmovvNJ2E6jjKSBG9v6ZZH
         gFYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Eiey5n3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15-20020ac85fcf000000b0041959043686si2765034qta.250.2023.09.28.23.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 23:46:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Eiey5n3Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qm7GV-00022R-1W; Fri, 29 Sep 2023 02:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qm7GT-00022A-Hp
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 02:46:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qm7GS-00014E-61
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 02:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695969975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcgqEZ0dyo0op2HncJAhr/pSA8DkXDL9izufk4nQ8Z0=;
 b=Eiey5n3ZlVqRRXEkTd5KAXymgb47AMNUiiOWnJp/YgBgNoWXL2gOWVPFX4xZQFpww3e/YO
 4cOnvlUucep3Q1GVQCuOPfqHq7cGjST+7J9phlp/u2ktvpyxJWFXVRqQ1LLFd4GUiIeyRk
 JlV6h25P5amJVdPxd2JKB6xo3KVsheA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-Tzuxz0OtMr6q9ZU2ZsoE3A-1; Fri, 29 Sep 2023 02:46:10 -0400
X-MC-Unique: Tzuxz0OtMr6q9ZU2ZsoE3A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 536783C1770C;
 Fri, 29 Sep 2023 06:46:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24FE8492C37;
 Fri, 29 Sep 2023 06:46:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1B64C21E6904; Fri, 29 Sep 2023 08:46:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  Joel Stanley
 <joel@jms.id.au>,  Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 0/4] aspeed: Clean up local variable shadowing
References: <20230922155924.1172019-1-clg@kaod.org>
Date: Fri, 29 Sep 2023 08:46:09 +0200
In-Reply-To: <20230922155924.1172019-1-clg@kaod.org> (=?utf-8?Q?=22C=C3=A9?=
 =?utf-8?Q?dric?= Le Goater"'s
 message of "Fri, 22 Sep 2023 17:59:20 +0200")
Message-ID: <87bkdliij2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: eXxufvLPwFZU

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> Hello,
>
> Here are cleanups for local variable shadowing warnings in aspeed models.
>
> Joel, Andrew,
>
> Could you please double check patch 4 ?=20
>
> Thanks,
>
> C.=20

Queued, thanks!

