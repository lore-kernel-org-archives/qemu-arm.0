Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp379981ejc;
        Wed, 12 Jun 2024 06:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWA+684/EuxkMuSr/6IALcEtsW19FISZa3cij3SfVqs/xbZ9p66evj40KPKMeAwAUa4fu9s+U26eELF4+AkR8KL/ZQ0IA7U
X-Google-Smtp-Source: AGHT+IEe8wq/PQwSsjRKWusqiBvSgjuTkBreawVc5xug+ntRM8K4ZyKFMbCDpExHiRJrXeZwy9dc
X-Received: by 2002:a67:eb0b:0:b0:48c:482a:cc50 with SMTP id ada2fe7eead31-48d91df3c08mr1837601137.21.1718197864485;
        Wed, 12 Jun 2024 06:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718197864; cv=none;
        d=google.com; s=arc-20160816;
        b=hR/kdzpW/qUi7uCJ7uvpidtjrBdT5zPPjFtB0UDORPrk7rkbkOsqGSo1P+91bbp472
         Itz211ayaY7P1AY75Dvynvf+DZfvOFiGgc3kUNoP0kHbqPaxZCyt6VCT6NZ56xfjmtxS
         QeVWumh81iOmA3WdHo/kb5J/v1+WYg2J3WemV51WjnEesQluP8d1e95z00RfK67ha/PI
         p/b9RHrbd8x8IY8CrQZvwd5EzrFhGXjf1BRpNA3JZ/jTk1Plb87Fzvv3v8pBX8umRrpH
         DSZDwMZ91+Il58aAQCyA0HfOypvjditg/B84b6+UaApkNGgKI/UN6WWiMjfBu4PXs8ON
         Q6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=BBfd6Z86Wbhg9+axntpREHq05oibhQASjFKI6YkK6pw=;
        fh=6ThEABbZt40j1Z/FULqIgCb6OhddEejlvahWnHgpVKA=;
        b=XVOePhEjV2n472ggycUZq6zSfKqaB7oMVOfLDD2yDjZMcBLIFYllGBMt3h9kxKLIbD
         bwTEs010ZTMgPfvdSGRj6kF55FAcrm31PtLkWt9TAzy3F/GScG2zzE+XbVQZONRUCJji
         isDZ8STh8Fn4Lj/eVaVLTOvLoQGeI06twXZXAFnYHpKZqopwk0XfPKmVTA3XSLS5t/NZ
         +lkPVoZZXKU8z7wi2mZ/dFhHMoW/6//Uh5bVg9bCGF7og480FBXjDRWODw1oypDJindA
         IDvuVu8MZmyrWxQDYQF8waCLEHchoYiGiRmRGMfvlViLywly0JttSVKkUQNI7wbBey1s
         W0yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aWWtZXVy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48ce7cf2848si1880406137.682.2024.06.12.06.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 06:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aWWtZXVy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHNhF-0007sx-9Z; Wed, 12 Jun 2024 09:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sHNhD-0007mK-O8
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 09:07:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sHNhC-0000Yg-4M
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 09:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718197641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BBfd6Z86Wbhg9+axntpREHq05oibhQASjFKI6YkK6pw=;
 b=aWWtZXVyex/0WlGVo4zOH4iuG7IVBICnRm22lQ5OY7i97GNNLyPmqtzgLxa7cP0y8o+dVX
 fOKLLGeEQGgb3Xtb+2MPtHVkYHbgnm1TbTycLQENMKgUjKNp1JmUG8DrHWdXEWueOzJ4F3
 Miq1m5Jz8afBcaT+gMPOvFazju9R5AE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-BV-LNF3yOTOUy7iEhDe-LQ-1; Wed,
 12 Jun 2024 09:07:17 -0400
X-MC-Unique: BV-LNF3yOTOUy7iEhDe-LQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8566F1954B0B; Wed, 12 Jun 2024 13:07:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.93])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EEA4730000C4; Wed, 12 Jun 2024 13:07:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C30B721E66E5; Wed, 12 Jun 2024 15:07:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,  qemu-block@nongnu.org,  qemu-s390x@nongnu.org
Subject: Re: [RFC PATCH v2 21/22] qapi: Inline and remove QERR_UNSUPPORTED
 definition
In-Reply-To: <18739a67-84bb-4fd3-adb6-0db0f0eb7af1@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 12 Jun 2024 14:23:09
 +0200")
References: <20231005045041.52649-1-philmd@linaro.org>
 <20231005045041.52649-22-philmd@linaro.org>
 <87mswx5n63.fsf@pond.sub.org>
 <18739a67-84bb-4fd3-adb6-0db0f0eb7af1@linaro.org>
Date: Wed, 12 Jun 2024 15:07:13 +0200
Message-ID: <87plsmfgxq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 4vDIwHUDa3LC

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Michael, Konstantin, QERR_UNSUPPORTED is only used by QGA.
>
> Do you mind giving our maintainer's position on Markus
> analysis so we can know how to proceed with this definition?

Daniel Berrang=C3=A9 recently posted patches that get rid of most instances
of QERR_UNSUPPORTED:

    [PATCH 00/20] qga: clean up command source locations and conditionals
    https://lore.kernel.org/qemu-devel/20240604134933.220112-1-berrange@red=
hat.com/

I pointed out a possible opportunity to remove even more.

I think we should let the dust settle there, then figure out how to
eliminate remaining QERR_UNSUPPORTED, if any.

