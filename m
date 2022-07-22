Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp370908lfp;
        Fri, 22 Jul 2022 08:41:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vvQUbzXi0kWKe4rH5d9znzqWKnRmgh9B2FHdZmY4/J1bduDkNLHq5Azbbb5br7jdEsKi6J
X-Received: by 2002:ad4:5ca9:0:b0:474:b2d:439b with SMTP id q9-20020ad45ca9000000b004740b2d439bmr657290qvh.0.1658504497424;
        Fri, 22 Jul 2022 08:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658504497; cv=none;
        d=google.com; s=arc-20160816;
        b=GxB5DZgMjSm/VVH4AHqEWguUhjBWZsv/rqOA2SvOwzo9/HWIujSIR+JPNaeTiCuYpH
         Ix4tbW2Vh0J6Y2qmFie0Q+S3Nng5mQa+UnHObYJ+tucvsWIxW5qoiWffmrf1YumNtfif
         XTPdZZkzsiU79pioXL6uJ/AFqWAPZrfgZtMuNlZxrgfs5DTAasELpYwYkMA33kYRs+L0
         ZQu4/SzcRoNBNZWylpITRDbVbFnwbG6BChf+E3qSeFvdD6Wro46jcm9aGuPktClUd480
         mT1PRK/qbNaPUhN/mbWFz7tkapHUM1brIXkPfXh2msSBA8WsKVY9HWaxvVSj73zPKvPR
         OCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=4NCYf1ws68F6X86Cf7QAFbjrw9NgeWslbdBpAs3+x4o=;
        b=c/yoYwZc8o4kUgfxY639E+xGoWnXDUeZ3TWp4dWDsPawxKPz29T+84Lq74Be41wXjR
         o5HDwkxvgvkBTkzlv+Z166PoGVniZmwMnoE6abXQPlyXo/MTEJWJcqpHu5YPMCscRNAe
         3UdGDEiEJE4fMq5XkIZvdm9P5YTmqZ5DgcRATxW1/50+ArDsAxG8uZs+2J2YooGtBgLK
         e08AAtue9yezNR3QSEEKXo32IgSKwrFUcWNoe65rFebY0nrdUcAr2187MARM/e2SEXaW
         M/qrR6O/qhQTJNqWjOBXmJPOY6GcdQmakq80b0/xHEfLNdGaYghQP0IDhe999L7dasqL
         FuNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i3iSs5Mf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8-20020a05620a440800b006b5d6ad8b9asi4045674qkp.516.2022.07.22.08.41.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jul 2022 08:41:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i3iSs5Mf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEumW-0005bv-Ts
	for alex.bennee@linaro.org; Fri, 22 Jul 2022 11:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oEulG-0005Oh-9z
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 11:40:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oEulE-0004ac-J7
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 11:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658504416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4NCYf1ws68F6X86Cf7QAFbjrw9NgeWslbdBpAs3+x4o=;
 b=i3iSs5MfshOhN5k597RsO4k7z6Tdg2coudUYkq5cE5mmREOKMulaSPwyl05Dpey82vHLL1
 Sfj3hEM0azLCFBSIt417SUtSOuILLI/CQb2w4WKQFdr0QMZoMLmC/rx1ltK6DbuTOTSPPS
 uTZ+OpxEqHXIALUwwn92e9HqzrEsXA4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-qHjkgsrTM_mvbn9Hm3Db7A-1; Fri, 22 Jul 2022 11:40:12 -0400
X-MC-Unique: qHjkgsrTM_mvbn9Hm3Db7A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EE693810795;
 Fri, 22 Jul 2022 15:40:12 +0000 (UTC)
Received: from localhost (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05ED8492CA5;
 Fri, 22 Jul 2022 15:40:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org, =?utf-8?Q?Dani?=
 =?utf-8?Q?el_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 3/3] target/arm: display deprecation status in '-cpu
 help'
In-Reply-To: <20220722120224.2311982-4-berrange@redhat.com>
Organization: Red Hat GmbH
References: <20220722120224.2311982-1-berrange@redhat.com>
 <20220722120224.2311982-4-berrange@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 22 Jul 2022 17:40:10 +0200
Message-ID: <87wnc5ma05.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k9eEEnJ7REDn

On Fri, Jul 22 2022, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> When the user queries CPU models via QMP there is a 'deprecated' flag
> present, however, this is not done for the CLI '-cpu help' command.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  target/arm/helper.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

