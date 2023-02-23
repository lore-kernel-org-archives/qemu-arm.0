Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp736599ejc;
        Thu, 23 Feb 2023 05:41:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8p0n0c0m1blCGmfA+5bc9YNJ8CWM0RtXIB4Dk2VkS9BQZ3ZNbn18n1U0xFKAAg6KwLDIKD
X-Received: by 2002:ad4:4ee3:0:b0:56e:a39f:f060 with SMTP id dv3-20020ad44ee3000000b0056ea39ff060mr23336863qvb.19.1677159714636;
        Thu, 23 Feb 2023 05:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677159714; cv=none;
        d=google.com; s=arc-20160816;
        b=iLXnHWxFA5XAzeCgzYw02EixK8E432yjdUbZ8yh602agOpmVdoicGgH3kXi/aF74sI
         fQ67vrSfBhkGt5tgHJyUDWeMbJnA1wvmkiUSD4n0HhVJgLSXag6KForLu4ytZeHpwMbg
         qK/yTRpVQ9Q79315TgObX2rg0JxIpJMYVi5uopsukHHQ6jjQJCTmyTnjD4vJJ+q7SPEQ
         ErIbjHNxntKk4eFZGilkwR0o7ElFIhmm61DtnmwXvLm+EmbK3okQHq2hr4FRRT6vMTzN
         6E2u/NWKOuC/FIG/irJLZWKRZSCmylEz693FAZM29/T0uU5+qwlvCaTWy2AP9Wapofn2
         n0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=QmrGgr0qeLj4KUtgfDPVD+kj6eXpQTSORE39CKdOo2k=;
        b=RDFH2fmmODBdibTGo31RWiIQPa0n/wNb8d0hjQ0di6tMqXc2Lhkwg49PwOIuIqRNAv
         kyi5oqPSZU0d0ulV9WqhAHqSfPmgPOj52Ri/igMC5xuryotTW90ll4ddEWeTxsvVF2vh
         8aHvoxJK/lG/AxCOCeigmvH1IermtpXSC9Kdo8pIPvj80cFR2+13YiY0MgRME1mZpZtm
         cj5iepwpoEr6BqueAd0Fs/0dVoFAQLWd0rw6kuxfXU9/d9SlLlrxkqnPbrg8YLO6uwHt
         aqHTTN9bSxtBjYEa5XsVbo7V4H7TZOqmMt/Va+5qa4g2v7NISJLH3tD9kRZqJpICY/dF
         Ac+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iW8aAg87;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10-20020a0cdf8a000000b0056ea9c2a140si2975014qvl.96.2023.02.23.05.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 05:41:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iW8aAg87;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBr0-0006mh-9O; Thu, 23 Feb 2023 08:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBqw-0006hr-4L
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:41:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVBqu-0008QJ-GC
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmrGgr0qeLj4KUtgfDPVD+kj6eXpQTSORE39CKdOo2k=;
 b=iW8aAg870i4KyULJCjWLQyY5G8tHdVjbEB/+CM1H63GbvpIaEi79mV4GF8NdHz9wqEkIyI
 gbfWzftAID2n58+l2i8NAEvn4AAXLlmy77zBImIg/QgyrKwhihJV2HnPRgZkGPFQPuze9C
 wVztwkNq+jUf4ESnfym8sPzWReucoQ0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-xxmJfaUrPniWJU3dNA-_eQ-1; Thu, 23 Feb 2023 08:41:38 -0500
X-MC-Unique: xxmJfaUrPniWJU3dNA-_eQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B1A61C02D31;
 Thu, 23 Feb 2023 13:41:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58DB8C15BA0;
 Thu, 23 Feb 2023 13:41:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6FAD821E6A1F; Thu, 23 Feb 2023 14:41:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,  David Gibson
 <david@gibson.dropbear.id.au>,  Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org,  Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?utf-8?Q?C=C3=A9dric?=
 Le Goater <clg@kaod.org>,  Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,  Song Gao
 <gaosong@loongson.cn>,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 3/4] target/loongarch: Restrict
 'qapi-commands-machine.h' to system emulation
References: <20230223124340.95367-1-philmd@linaro.org>
 <20230223124340.95367-4-philmd@linaro.org>
Date: Thu, 23 Feb 2023 14:41:36 +0100
In-Reply-To: <20230223124340.95367-4-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 23 Feb 2023 13:43:39
 +0100")
Message-ID: <87bklk4hyn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SAg4/+I9YuGy

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-machine.h"
> header in a user-emulation-only build.
>
> Extract the QMP functions from cpu.c (which is always compiled)
> to the new 'monitor.c' unit (which is only compiled when system

loongarch-qmp-cmds.c

> emulation is selected).
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

