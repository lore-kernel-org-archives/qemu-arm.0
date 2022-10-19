Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp354612ejn;
        Wed, 19 Oct 2022 06:52:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6YIvGNlNVOJi9bOaiWfGdV81x9bTMOFaOny7/xBjnpD4d2nNF7jeGW+gf/SgOAMDD3sa4W
X-Received: by 2002:ad4:5b8d:0:b0:4b4:9b68:c651 with SMTP id 13-20020ad45b8d000000b004b49b68c651mr6693365qvp.90.1666187556942;
        Wed, 19 Oct 2022 06:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666187556; cv=none;
        d=google.com; s=arc-20160816;
        b=YrNV0BhUdYLBtEM+tAc6VpVz1BugR9CJPEVY7ionPXHwkMBb9HRusO60QJyRr9AFXH
         53W1UT1h0hrt96PjLJykjIvZpbDV8jgzrbuX8PPTaAs/nU9B3PauAG2QB0jAak85jMhe
         9LOfaqZVRg2WFNzFYtamYa5YdhO3GsIEjHhHrXOSlszku3dBrftHUlfdupuJDXce2UQL
         +kmfDqkRkJmgOf+S/6lm3LP3binIWcQ2Xj1rEVDKQBFVHZ0rCqiODv3E317D3PadzxV5
         TS0ZGijdChpDaMaZA+nxUiYe6RbGbHbweM+2xyRpDwQtRB/Un/Tl7sj4Fzvl1Fqj4F6h
         Lzuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=OHlPayFUH77OAALUBNCzWmPzjqOh9C8unFWYU2Bh4jY=;
        b=ntQ/h6M9vSYwJNOjQY5Qk7w7Kq1Q5FtMtLupyzjHd8qnq1m1fISHeCqLXo2QThAo7Q
         1uWzq9Z9/YIivmkT970FfDwk8XhIzvBmdPgiVbAPtW+aPunVogrYc2SDrSQ8Iz62BHcY
         OWIYHERjUK3IYnDxA8nXPAKSzEcJzwGCx7Umsz4fHhtFig6h15F51gdn+1NBVha4NDIG
         mp3rAqvXm+iBH10rMPbwrQgH8zMZWoNqy39qYPYiMBcLeyH2pCai5pXDt620Uz2roHAD
         QEjwpTKWxLofqDkMy6rcva/FRoKLkfU14AkQT9KVn6dFw3YkIhuatIiZ1EdGlSIERe/s
         +7wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g2lmHK7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q189-20020ae9dcc6000000b006ee8b190250si7844074qkf.523.2022.10.19.06.52.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 06:52:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g2lmHK7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ol9Uq-0005KR-Fp
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 09:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ol9Sy-0005IK-Pg
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 09:50:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ol9Sw-0004wg-Of
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 09:50:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666187437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OHlPayFUH77OAALUBNCzWmPzjqOh9C8unFWYU2Bh4jY=;
 b=g2lmHK7EKbCItYa+E/iCBHNuTLftgJDYlgFiGUcP2dszTtKLsfMuKphnfJGQoy9lKCf/ZV
 a+LexGzC1mrilP300GwXVL/kIXX6808JiTmwPRT0kGyRJzQENJEDjBYUUyaDJaILlXb6DX
 wMqbyfFn+xTJQN2Ys+9BIdrHbxjdSCw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-euJmU37YM22DDNa8dz76eg-1; Wed, 19 Oct 2022 09:50:33 -0400
X-MC-Unique: euJmU37YM22DDNa8dz76eg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C44D429AB3F5;
 Wed, 19 Oct 2022 13:50:32 +0000 (UTC)
Received: from localhost (unknown [10.39.194.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 758DBC15BA5;
 Wed, 19 Oct 2022 13:50:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v5 4/6] hw/arm/virt: Introduce
 virt_get_high_memmap_enabled() helper
In-Reply-To: <20221011231832.149839-5-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-5-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 19 Oct 2022 15:50:30 +0200
Message-ID: <8735bj2a8p.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hAmqPPTVPUFb

On Wed, Oct 12 2022, Gavin Shan <gshan@redhat.com> wrote:

> This introduces virt_get_high_memmap_enabled() helper, which returns
> the pointer to vms->highmem_{redists, ecam, mmio}. The pointer will
> be used in the subsequent patches.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>  hw/arm/virt.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

