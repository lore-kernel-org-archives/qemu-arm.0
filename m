Received: by 2002:a17:906:b80d:b0:9ae:5796:d6c1 with SMTP id dv13csp91276ejb;
        Sat, 23 Sep 2023 00:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGluAHtObuJtTbmXP6//fgebWrpRtVjAA/jr4pCS9A6oXXh0B5KgP2Um9Mz2XgyOakjRJz3
X-Received: by 2002:a05:620a:913:b0:774:1992:15c9 with SMTP id v19-20020a05620a091300b00774199215c9mr1462746qkv.42.1695453244849;
        Sat, 23 Sep 2023 00:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695453244; cv=none;
        d=google.com; s=arc-20160816;
        b=q7IMWOGTBsouwellSM8JD5ZLiHAeCLrPMglJPuQeGfTc4q/BEk25p99B5TYRiDlsqF
         zp5yGSZBGyNeN1PXlJuNmxwe5hfKns3PYzBhTPqKYrV/lNXgX3KidV/xlOuToZ/LQeaQ
         6WDT12baJykp8IgVliR24hWZ5BkiKG+iXkmvjqHpAdDJHWJJ1P78Ik8EAUtucHbVFezd
         +sod1t5UXWG/tCBeSLOjE+pcuwIy7h2ORLD0xx3UOvZKYUk8zGuPuJAnYWIx9/FS1y8r
         niC6CEW5emT3dvmRWnDd3U5Zb/klKdXH3fHw3+6EMo+zMSzox/XTAgvlEjNO4MdCoN9L
         Ms/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=5PuitPEavMpgxfNRjSKRyUWbURuUmzXU2EvZSbwb2oA=;
        fh=41pYziOKFGQm2nTVznqk7J0Ea0H7fMxk9gS1658bt7Q=;
        b=fRabZ0jhc3txaB0DI4kbmLyVrpO0776jziKDFOJ+AG2x7K6QqImxbl2CgrvhMg/HZt
         hYAE0Zhu6pjt0g9zXOTamH6x2ykzEgn5NibTFXMlMSDCMtqU/PI2Cl4rUcQK7gylV5W5
         YA7MbUiIEoSrx7UvrQjIUkG5/8EqmQvhy9dD+hY8aPSd9dlIOwuTxAh/KMnvXGatQpkX
         gUkqDrZP7iwU2pkodJIeHGK+bfJXdO1H4jhXp0I5t+3KIJq1SmYfNNMBgeyZ9vAV0AtK
         jkOLkGkTVzZyCQhqMMCE1x/jmSJgZ+L9Z2pwIdZNlPaxf6uRhuBeFs3rBe+9vbdxaZnI
         /yWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cRYZyVl4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020a05620a260900b00773beab2a61si3318548qko.324.2023.09.23.00.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Sep 2023 00:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cRYZyVl4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjwq1-0002xl-IN; Sat, 23 Sep 2023 03:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qjwpz-0002xS-24
 for qemu-arm@nongnu.org; Sat, 23 Sep 2023 03:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qjwpv-0007cU-Rm
 for qemu-arm@nongnu.org; Sat, 23 Sep 2023 03:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695453233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PuitPEavMpgxfNRjSKRyUWbURuUmzXU2EvZSbwb2oA=;
 b=cRYZyVl4vH9gc3lpbXTI7zQyq5NBa28nnZZKYDrlMAOQWs1ou8ypyEcncn+OCRQ5T/p3IP
 68sYm/9XWx/3XyVglybHPb737Cqvp3qpa9xFeid3hsrMyTYdsWjoWH2HNvFGYlIvow4by1
 EeNw/bIdjtvW576UUbgbSCGh4H9/P2o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-hu45Gv8APieRUwTsGtn12A-1; Sat, 23 Sep 2023 03:13:51 -0400
X-MC-Unique: hu45Gv8APieRUwTsGtn12A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4012285A5A8;
 Sat, 23 Sep 2023 07:13:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF4892156701;
 Sat, 23 Sep 2023 07:13:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B8FCE21E6900; Sat, 23 Sep 2023 09:13:49 +0200 (CEST)
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
Date: Sat, 23 Sep 2023 09:13:49 +0200
In-Reply-To: <838837dc-0d95-1d6c-3cfc-e321c9c01a7d@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Fri, 22 Sep 2023 21:00:37 +0200")
Message-ID: <87msxdmkeq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: IdxplrbvoFGo

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 9/22/23 20:20, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 22/9/23 17:59, C=C3=A9dric Le Goater wrote:
>>> Hello,
>>>
>>> Here are cleanups for local variable shadowing warnings in aspeed model=
s.
>>>
>>> Joel, Andrew,
>>>
>>> Could you please double check patch 4 ?
>> Could Markus' MAKE_IDENTFIER() help there?
>
> ah ! you typed too fast and I also read too fast, as :
>
>   MARKUS_IDENTIFIER()
>
> and I liked it :)

LOL

>                   but what is MAKE_IDENTIFIER  ? really, please explain.

Philippe is referring to

    [PATCH v3 7/7] qobject atomics osdep: Make a few macros more hygienic
    Message-ID: <20230921121312.1301864-8-armbru@redhat.com>

which tweaks MAX() to permit nesting without shadowing.  Your PATCH 4
may not be needed if you base on it.

MAKE_IDENTIFIER() is a helper macro introduced in that patch.

You can fetch the patch from https://repo.or.cz/qemu/armbru.git branch
shadow-next, along with collected other shadowing patches.

Questions?

