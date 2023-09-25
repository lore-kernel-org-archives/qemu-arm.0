Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp280532ejc;
        Mon, 25 Sep 2023 03:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe+Fq6Np8k687APt85GHwRhbsmw8j34w+jWdMrx50vEoG5qmA1g3lxUb7xqQGySXmu0Ckv
X-Received: by 2002:ac8:5bc6:0:b0:400:9896:b0fa with SMTP id b6-20020ac85bc6000000b004009896b0famr8630742qtb.64.1695637852471;
        Mon, 25 Sep 2023 03:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695637852; cv=none;
        d=google.com; s=arc-20160816;
        b=tFEZS7Z86HSlfSxZrYqDTgcMh+u1YHzcB4h32V0kl+NohiCc8PXIyOljt7pHPfiMsF
         eJg2rgAo3CTB6+yTVm+C5eDuePf9fnZQ8PaIXQBFNPEsz4gtk1keM6ZrwCDplqrbotTF
         P17EcMoTabuV0eWhM9Z9Bchkux9GJ1PKD8UCB1VUlEc9RfeLPDjDTHy0cjHeMtGPnqRJ
         YoS7NDd0+ixY1PpDni89K1S4tvHJ4N3VY7y7dMkLyI/WJsGTmALuIMResqaBMNdrYjwc
         OwPhdBPn84LkqCTVfT0OfjuFfqMYW2HZ9ySLq4SeGMSfnjJSnhGNeG65SEGa3+KMAXZh
         HGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=ilU884pzesI0a4Okwzi3GP5tvbvdYWR1D1Sw5hA09YA=;
        fh=ptOGY/ohYRh8UD0Fhb+cGB1B8QebpzRPj0QVihZ99l4=;
        b=UjkPaantLinmni+wOlAB/t31xEpgyRZ1yIbA0X12AUuak7m5W3oHjTLbkB2DkA7p2W
         1fZBuq3pqG1JmVW2UMhZa+Kw8HBtZ1jaAc3vZIHKJtcyGHk+xjZZLwFrSETiFhgmGgyq
         CHknBXMTUnDRp3PtxX6gm+rOjvyMfa0MB9aDumD/xjF/tqfJwudHC0ecEXCukuwuyIAU
         ABU8ZX+HUgsTuc5u6DttbMFldG37MICxckwN+/TswQGI/MQORjq+WimnEqqEatBhMDXy
         Rag7Gpphjm8jm1eKy0b6KdhZ+XZSYw9V4KfIRsaGm00XtkEypPtCeDPoc4wH3IQiRdrn
         101A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FinNPs3U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w22-20020a05622a135600b0040eb9b330d5si5716971qtk.492.2023.09.25.03.30.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 03:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FinNPs3U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkirF-0006cZ-NV; Mon, 25 Sep 2023 06:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkirD-0006ar-Ju
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 06:30:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qkirC-0002O8-Bu
 for qemu-arm@nongnu.org; Mon, 25 Sep 2023 06:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695637823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ilU884pzesI0a4Okwzi3GP5tvbvdYWR1D1Sw5hA09YA=;
 b=FinNPs3UqgRH6l0/sG/qG9kwswkhj3v76LS3oZ/Bef2Re7e48XfTHHGOW1yL9nR1PgtcAt
 ZPrFzjO7fhZ3/815kt3L1v7EurM9uQg2bs8r6K6MSEPCyJ5oqqaBk9Rr1DVJkX3dsLVzuR
 zPjZcFVSXtU2CRMw4rZPJAzQxR2X8p4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-p-mLzOAJOOypNTCpBw3Cyg-1; Mon, 25 Sep 2023 06:30:20 -0400
X-MC-Unique: p-mLzOAJOOypNTCpBw3Cyg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3DDE101A529;
 Mon, 25 Sep 2023 10:30:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0454140E953;
 Mon, 25 Sep 2023 10:30:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A235521E6900; Mon, 25 Sep 2023 12:30:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH v2 02/15] hw/qdev: Introduce qdev_unrealize_and_unref()
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-3-philmd@linaro.org>
Date: Mon, 25 Sep 2023 12:30:18 +0200
In-Reply-To: <20230203145536.17585-3-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Feb 2023 15:55:23
 +0100")
Message-ID: <87ttria6kl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: n2dhJoW8bpQL

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Inspired-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

