Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp280771ejc;
        Mon, 25 Sep 2023 03:31:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrtNRvHFI1l57ztpEfFwRaRXhcx/nWZaGEPW1ZMEP9zS+srgJBQxqVLvE/CG3Mwm0huj8z
X-Received: by 2002:a05:622a:1cf:b0:40f:f9c8:1b98 with SMTP id t15-20020a05622a01cf00b0040ff9c81b98mr8021472qtw.10.1695637881208;
        Mon, 25 Sep 2023 03:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695637881; cv=none;
        d=google.com; s=arc-20160816;
        b=HqQRCy2XKU4UhdboTufFp4mxebSmmetQYnREtVTxZ1+kWfKBofFKN9G+CnXSkFZcon
         jYXfq+ux1giT1QmnW7iLWk7LBdyzgw513phtGL0rAKKabrdI0SW84xxqkAZVrHZwgrHa
         ubAizwFFpyokJ3pA2SUG76Z5dkcWT2wi9r+B520kbWQRi3lkoG8lUupCMjRWrjQ+a0WT
         CZmK5Alkgra9pzwXhpmSfFbMS3Hl2kuzPuTtkcrAMW2lDM7dRtIsd//ZnknbTCSMz/TF
         z3F3r3fJ7syTEoPj71bHQLCak/gtgEV9JiirpwvqnoP9Nbufjt1uonTdvUPT1paKKZw7
         8oEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=uhr1MwwQKYgPnTJ81C6Nnq6x9/CPLM+pru1LPIGEA3M=;
        fh=q5JjnxecY7U7EusA5quA1tY32JWcdr5sb+rmMwH02Ys=;
        b=MeaEw23yTrSosgn4U6l0yZDGOrLTxLAQ73hCCOrjtEmtW8jtWCPG7wuggADpJdd49L
         N7xJbFRyMdUn2QPH0GlwMKffcmQU7iPq74bziE4PW58VBB2YsNN/nA5fo/6CjdIwIOAN
         7mlZe4zqlRuFi0GDr7x6XViKivzEmqnUfHR3nApeRt8ie8Rtn86q1xVeDHHP84NNFfLU
         SHO967XKV+1omsx5+g50coIrTer2lgUgOJlmOsra9ItMe3A/5bwGgFBpCZlT9v2fA8pW
         bP65J07Z3t9tKSlYf7YrNzAHHXbsB4qJ1dpktAzLmtedz3OSlYV06GfRCsHq31lZy44Z
         7UeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eu1Wz2Rw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15-20020a05622a01cf00b00417b0de7881si6073082qtw.527.2023.09.25.03.31.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 03:31:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eu1Wz2Rw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkira-0006lp-F9; Mon, 25 Sep 2023 06:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkirW-0006in-9h
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 06:30:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkirT-0002SI-7R
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 06:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695637842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uhr1MwwQKYgPnTJ81C6Nnq6x9/CPLM+pru1LPIGEA3M=;
 b=eu1Wz2Rw+wpYHP/5t1uu+BtCvcjY6Te3/eG3lIaxf1e9/w+1RfE7leYKYvV20nNFAy4bFX
 PIrVcm0E3SKz101KnviXJQCUEXbIQciZLv0gnSa2A3JpJqY2XfQnruyGE09UsIfIyk/2DL
 Cf0mLcxMzQiVGDMILpo8rNdiS/jLbcs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-TwAkoXzPM1m3rRtjjDNnCw-1; Mon, 25 Sep 2023 06:30:38 -0400
X-MC-Unique: TwAkoXzPM1m3rRtjjDNnCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7449D101A53B;
 Mon, 25 Sep 2023 10:30:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A302C15BB8;
 Mon, 25 Sep 2023 10:30:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2CDEA21E6900; Mon, 25 Sep 2023 12:30:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,  Eduardo Habkost
 <eduardo@habkost.net>,  Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 03/15] linux-user/syscall: Do not open-code
 qdev_unrealize_and_unref()
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-4-philmd@linaro.org>
Date: Mon, 25 Sep 2023 12:30:37 +0200
In-Reply-To: <20230203145536.17585-4-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Feb 2023 15:55:24
 +0100")
Message-ID: <87pm26a6k2.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: iu0Sf31n2OM6

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> (See commits dc3edf8d8a "Convert to qdev_unrealize() manually"
>  and 981c3dcd94 "Convert to qdev_unrealize() with Coccinelle").
>
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

