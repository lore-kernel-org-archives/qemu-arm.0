Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp369664lfp;
        Fri, 22 Jul 2022 08:39:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tDmh8xPw0JCwr8XyIzpOWiPaBHCcwNTX4D02GX0tw0AecZoqWyGO9hwMXn7ilUen5o2uXv
X-Received: by 2002:ac8:5b93:0:b0:31e:f963:4f4b with SMTP id a19-20020ac85b93000000b0031ef9634f4bmr594335qta.461.1658504363415;
        Fri, 22 Jul 2022 08:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658504363; cv=none;
        d=google.com; s=arc-20160816;
        b=V15xV7uxIBeWlSI+LI/7Qz3vorslsOl56ilrAWCQ6BWwRGoNforwlTFten3uA2yVc2
         Zdn+9nFT4RPDNfaCU38dNj1xU5/2T6vhZ6Sy9kZdfqOOBStJx861qVmQs8BPA3GqAC3R
         xndS+BT9zo9e0ACu0E9Mw7HsrXi0UBY6yES4r88Kj2DI7cgWGzm4P7QR8+lr6DUNR66M
         SM7iPYSrbbjvuQzC99gxZ3AM8RlD5rPjAy+SXNaju2oiN1PeM9VDqlUltEqAIf8BSoNT
         CtPC97nk003W7k7xOOqd4K3Jf9XNsSKmhaf5ZsfOLJLn245gJctoHHLjljPuSx9KbXVs
         u+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=0aykfvyqCb9m58XbbPo/5tK0OVCKJKFLRXLpb9/eTBA=;
        b=ALIOxJcfi4utcuDiIedJsn8xDBYjLuv9vQfrJo8UKLNX4Jrf2kd1MQj4jgS0H3UQj5
         JDlenLe9wUxXuvnvx+TxnnLm8GNsYCSHxy/W42RAE25J7xkBBTTrGDKSx8TxCL5DSkod
         0ROkD5PIXpOwi1eGI0I5Lnf8bh8A9yca5Cz9eOAvO4gT5m6GYLRuBBqdLoVeVTJ5k3UH
         TKAV1SeFTqPyCNyzSFxXgvtmS3Oc3qlZBhC4gw81HqXAEigVjoWGOXAPHOen6CwFpKVU
         RpHDHrEfszG9aYnZ8ba88Vy4g06s+ExmpWGeeGgiHEn+LdWMv10jhIlJQsJTplNlNrqm
         mfdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="X35fK/h3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11-20020a05620a074b00b006a71a3878dfsi2589701qki.347.2022.07.22.08.39.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jul 2022 08:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="X35fK/h3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEukM-0003Lb-UP
	for alex.bennee@linaro.org; Fri, 22 Jul 2022 11:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oEuk7-0003JK-Al
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 11:39:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oEuk4-0004Hj-7p
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 11:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658504343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0aykfvyqCb9m58XbbPo/5tK0OVCKJKFLRXLpb9/eTBA=;
 b=X35fK/h3LxPdnWXf0L1r7wTZIGz0N7wvNBWUuR1TxXWFgHK7uFEjXFfsqCZtj7C0ptP7md
 wAxTGO7fIBCEABpU74wEDrnJ8Ycn+DsRlKi/mDFKXuymgiwcvB18GGxm9OJN4bdBhUFk5I
 gIbIeHwKKndDVhVNAOS/0cDJUCiBiL8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-Sa3v8O6tMfWZtfC8c90QrA-1; Fri, 22 Jul 2022 11:38:47 -0400
X-MC-Unique: Sa3v8O6tMfWZtfC8c90QrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 004E78001EA;
 Fri, 22 Jul 2022 15:38:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE064C27D95;
 Fri, 22 Jul 2022 15:38:46 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org, =?utf-8?Q?Dani?=
 =?utf-8?Q?el_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 2/3] target/s390x: display deprecation status in
 '-cpu help'
In-Reply-To: <20220722120224.2311982-3-berrange@redhat.com>
Organization: Red Hat GmbH
References: <20220722120224.2311982-1-berrange@redhat.com>
 <20220722120224.2311982-3-berrange@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 22 Jul 2022 17:38:45 +0200
Message-ID: <87zgh1ma2i.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: LXsGtJHDCYY8

On Fri, Jul 22 2022, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> When the user queries CPU models via QMP there is a 'deprecated' flag
> present, however, this is not done for the CLI '-cpu help' command.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  target/s390x/cpu_models.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

