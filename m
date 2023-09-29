Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3014258ejc;
        Thu, 28 Sep 2023 22:15:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQZq7wJqm25tPrb5cYmNd+23eFJBMJvoykrkNfEerSenmuKC41TOrsCVS9S50QiQ5JSaWw
X-Received: by 2002:a05:620a:b5b:b0:775:6f44:5c1c with SMTP id x27-20020a05620a0b5b00b007756f445c1cmr3110095qkg.60.1695964532183;
        Thu, 28 Sep 2023 22:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695964532; cv=none;
        d=google.com; s=arc-20160816;
        b=gQ+7uK9143gA9mN9Rhmb0+/vkJzeYkTzViHYZ9Xdwx6nDt/xg6hH7uRRjhbTR84hvN
         u2uxWerq9PtgOdVfIlJnBPApWZJSe82K37Dk+KEU4mbwKOCdtPZqHu3Nuhco07/GIt0e
         mjgVZPE9emSbBCxV9FfVKDS7AF08JPOW6gb0bDhPw6EeaIErn37TKrvG9aOD9xRqHTY9
         FK9Xsmf6jKXkhAWqQeSvn+aMbL45t6g616vq+sg3Jt2Kz0TAwZfL5bkUiDfmdSZRTtFI
         3Ga/QWasaiyIdS7g4HAKux0kqNJmxGgy9GCRb7SQISa9eF/S/hCQbtfdW+eUE0SFBKw4
         ckAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=IKEyQlxDTOQr6fR63UrycJi4GJ6EMi9YSQmeyYvHjKk=;
        fh=XOcsgqAO8FrYO3hPJm4HugBFn4zBt9xdLbPKOU5gUU4=;
        b=u8IkbTdw0EraNW7RMw54SDQ+joZc9bc873Qbkgtn6E1mzcK1kD/G9flTL2V8HfF3tV
         kNLSA5k6IlNQDUtZvRG4yfGyr01FZz/iegep13xGxpmD7LCgowZQuqsKutE5tyKPJ+4G
         kh5EGReE9e2fSd2W0c7VeAr5djWNXX5uDmq/jWOrtfgnsTl8ivepdBmJ+q25MMvlc6Li
         NQvMfRP72w9MB9iWOOZTSImwUT/zeUhT8mqfArVtADArj/M1sBZiPTjMaRrUCM8KGrYw
         uBNXGN1TR8nJSsBDE5uuTasxB+VUroJbpDABEXmBfnAfcszEQ6A/zk8K70uwdeqv5/bA
         C/yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=INY59cJC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a05620a290a00b0077412011692si9403290qkp.18.2023.09.28.22.15.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 22:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=INY59cJC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qm5qY-0003i9-BU; Fri, 29 Sep 2023 01:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qm5qW-0003fh-Df
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 01:15:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qm5qS-0005m8-Gl
 for qemu-arm@nongnu.org; Fri, 29 Sep 2023 01:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695964519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IKEyQlxDTOQr6fR63UrycJi4GJ6EMi9YSQmeyYvHjKk=;
 b=INY59cJC8tIy7UbdTdiwBY9Gozn0d3Dnbj/2uIh/wYvDXlIXVMICiMqtpc1qo9Pd0pB2qJ
 NSkn7o+iHIxvs6QUoUmPLou+VGOXujZzq9cRIoVD3VB06DnnlFfnUPRgBEaJ+ze23x1412
 HtY/ivZHkMEUv9U5Zts3++YqlrMhbQ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-tOzkHZ98MXa3x-96nOg5MQ-1; Fri, 29 Sep 2023 01:15:17 -0400
X-MC-Unique: tOzkHZ98MXa3x-96nOg5MQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C989185A797;
 Fri, 29 Sep 2023 05:15:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A3D414171CA;
 Fri, 29 Sep 2023 05:15:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 172EA21E6904; Fri, 29 Sep 2023 07:15:16 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH 0/3] (few more) Steps towards enabling -Wshadow [3 more]
References: <20230904162824.85385-1-philmd@linaro.org>
Date: Fri, 29 Sep 2023 07:15:16 +0200
In-Reply-To: <20230904162824.85385-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 4 Sep 2023 18:28:21
 +0200")
Message-ID: <87bkdllfvf.fsf@pond.sub.org>
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
X-TUID: gmWE/hYslQeg

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Just missed while posting v2 eh :/
> (https://lore.kernel.org/qemu-devel/20230904161235.84651-1-philmd@linaro.=
org/)

PATCH 3 has become commit 82fdcd3e140c8d4c63f177ece554f90f2bccdf68.

Remainder queued.  Thanks!

