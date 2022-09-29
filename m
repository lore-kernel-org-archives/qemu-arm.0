Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1082878ocs;
        Thu, 29 Sep 2022 08:03:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6FrsEJB9H1883I+UKfr5/RjisMTpe1ZI+i2HqGug0QBBzXBYH8H//IffxCF0fqGYLUwftc
X-Received: by 2002:a05:620a:25d0:b0:6bb:f597:1a3 with SMTP id y16-20020a05620a25d000b006bbf59701a3mr2496986qko.43.1664463781137;
        Thu, 29 Sep 2022 08:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664463781; cv=none;
        d=google.com; s=arc-20160816;
        b=cUlRxNMHeqXBEG4x07oVpXxotZh/OycUW/LcKwifLn2kYWUj1eg/SDC+bHHUlw0MV3
         RrJ5S/u0mA1PpTRRDT0vlalEuyFelB9SSOBlERPmTcHmo6UT2zU22tHrncURXsnmZpez
         pHftRppW2RV4Frzs8RU13Mbb6Z5FD0iMkwezQQ7hvLcF59iNo4O4vQlJYnj7Y8Qy0Smr
         MEsPlho90h9dW1d+a29eergv0zjm2Y0cGs4li1c5YjsdfH7nGB5/X0tLwxW2y30jF4RF
         fVWCx1NEDmN6qJkQL7A8vN+F6J0lNwLpigpz9YlJ8RLzWj2MPN5MtaeMZ8AR9MnbeRjD
         +RUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=fWj6jcTa3DeVfQ3FmqR63pwi+8DEn6QHRBAQ7XEy0Q0=;
        b=shr2pNr0tnopVumpRwxwSMpX61PUxjapwXlEMI6vlNlt6OWQfAJvQPzPXTyvFMEx2C
         mjeQubg8QPToCAyy3148D5aSY87Z3LtK5EnmAFSon25EypRZGXPxM/KdxmM/IcOi13Rl
         G5aATYRRjIP2GIfggOOlpO6R/Nv678XBtcPNOodmxUXFlWsIXCNfNg6TfakeHhT643kY
         s85VH7s7Spf80+x5qhdi7FzF9W2sb+m4gBnxfq7F3BNUWeywCA/tzgxvdpSRIwHlmXvt
         fa+temn7GY2TBh3G6GG8jam15eImpdldYxIIAbPD8zmuuBtXFrHYP/96e9pjRuH50CaM
         9Zbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LJ19j42y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de37-20020a05620a372500b006cbd8dd869esi1373104qkb.19.2022.09.29.08.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 08:03:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LJ19j42y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odv40-0002TJ-20
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 11:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1odtu4-00076w-1Y
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 09:48:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1odtu1-0006Uw-89
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 09:48:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664459316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fWj6jcTa3DeVfQ3FmqR63pwi+8DEn6QHRBAQ7XEy0Q0=;
 b=LJ19j42yw8lVLAVO1UxfQSrFFGoTyFQLnlSPSSeI6zK9+PXJDW75+J9qg0grjVYZLRrbN7
 vWTlryLsD5BkrzwmpNiknH3mBv5zUhpVaxd6r2Zj+fxprZKG+sYIMZk/KEUskUpAZHo/Wk
 Qh7bI5gD6Dp3hUWDaN80ZO473f0zyKg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-xg7dyTu-OAyGw8D2cOoywA-1; Thu, 29 Sep 2022 09:48:32 -0400
X-MC-Unique: xg7dyTu-OAyGw8D2cOoywA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67E4C88B7A7;
 Thu, 29 Sep 2022 13:48:31 +0000 (UTC)
Received: from localhost (unknown [10.39.193.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BE0B492B05;
 Thu, 29 Sep 2022 13:48:30 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v3 1/5] hw/arm/virt: Introduce virt_set_high_memmap()
 helper
In-Reply-To: <20220921231349.274049-2-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-2-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 29 Sep 2022 15:48:29 +0200
Message-ID: <878rm2e1g2.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: RZqTFU1K4MBa

On Thu, Sep 22 2022, Gavin Shan <gshan@redhat.com> wrote:

> This introduces virt_set_high_memmap() helper. The logic of high
> memory region address assignment is moved to the helper. The intention
> is to make the subsequent optimization for high memory region address
> assignment easier.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 74 ++++++++++++++++++++++++++++-----------------------
>  1 file changed, 41 insertions(+), 33 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

