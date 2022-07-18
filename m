Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1203427lfp;
        Mon, 18 Jul 2022 02:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vAqKVmpffnQ+E032xbbV9NK72WeQoR6RNeHdXftyYTzMlD1z+RGBBW4Jal55wfeWSFohZ1
X-Received: by 2002:ac8:5dd4:0:b0:31e:e473:bbf with SMTP id e20-20020ac85dd4000000b0031ee4730bbfmr6539305qtx.124.1658137956829;
        Mon, 18 Jul 2022 02:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658137956; cv=none;
        d=google.com; s=arc-20160816;
        b=usHMqiFwo2eSqC/mBV5sAUjQ0h338SizrHucvfwVWPRLX1nC/bXiWg3G7K0lEzU31a
         dMgUljUhpKSWPF6Qo/7cLyOxyWUPUwVWVf2SKrVupOUMlJEMNh6BJMp4vdJrxP/GrJp9
         rgtxev/raz+MgtVHh9oPlsILtB5/kVhZ89WwDTj4L3lpYDmIYO1SGyYS15pk9nf5YErG
         9dlfqw2KhwGdEbPZ8PPHOOU13a8Goaqf/XO3koV7Ksvne0+Dh9GICPpnNG6InDiZz8Un
         cSE6DI2H1DYQjAWpSBI25MChZpad+lJOU/u9zmaFYXZxjoMkctUyFebIeL62Pv7+UnAA
         3PKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=ODB4k5uWd/SSmqTwO869KXlx+d0XUhV3Gqn6FfdXG5I=;
        b=Ks1W8s7Dn9VXT3J6WEqpms7FqH7sAZ5x66RP6cQjopXGV2UzUxWDIDXKke/WOvI4Tm
         NIBn4Zik6u6FKUF3ep9nD8TgBROB7gDa4aE0BjA8l2/3potsjaormj+tlbOo9IXE49l1
         z5wTDXcnlc/OwLOlTzC0NILl8Wyygylau7SPa3+JWrLEcr1otDeKg5tkzKyTB0NxJQDj
         EHx9rCct2o2uNyXXwvJ0qT/wFfKaUUUUig3SQdvFHKgf6hwWq86N9/ZtL68RK45GN3dz
         /qJWIidcFFzPwfW56y2OoffJ/hdMAHFWYHKGD0HDOXU5+xmVIlh+ax5M8ybfZ/IN6RXC
         bYJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dsu5CZ6G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv15-20020a056214240f00b004737909860esi5636179qvb.315.2022.07.18.02.52.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 02:52:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dsu5CZ6G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDNQa-0000Ma-CC
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 05:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDNQG-0000MO-Pf
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 05:52:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDNQE-0003Qm-RM
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 05:52:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658137934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ODB4k5uWd/SSmqTwO869KXlx+d0XUhV3Gqn6FfdXG5I=;
 b=Dsu5CZ6GQzXaZW82zhjh6kD7oufHwIkoKkbOaNC9K/K9t/O+f5GOikoybv5uJE6cAExu3E
 m86L1M2LiiMUMI2eiSV3dFuXzDN5PzDLkpU/ADPXMlLQuOlOBon6eFXniooB8W1bfMyJTA
 +GQ/+YtVgUpetAIsPGKV3j+Dm0VAVUk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-ciLdc-9UMpydDA7A38cIkQ-1; Mon, 18 Jul 2022 05:52:03 -0400
X-MC-Unique: ciLdc-9UMpydDA7A38cIkQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F61C85A589;
 Mon, 18 Jul 2022 09:52:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D89FE1121314;
 Mon, 18 Jul 2022 09:52:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CC29221E690D; Mon, 18 Jul 2022 11:51:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Hao Wu <wuhaotsh@google.com>
Cc: peter.maydell@linaro.org,  richard.henderson@linaro.org,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  venture@google.com,
 Avi.Fishman@nuvoton.com,  kfting@nuvoton.com,  hskinnemoen@google.com,
 f4bug@amsat.org,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 thuth@redhat.com
Subject: Re: [PATCH v5 7/8] hw/arm: Set drive property for at24c eeprom
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-8-wuhaotsh@google.com>
Date: Mon, 18 Jul 2022 11:51:59 +0200
In-Reply-To: <20220714182836.89602-8-wuhaotsh@google.com> (Hao Wu's message of
 "Thu, 14 Jul 2022 11:28:35 -0700")
Message-ID: <87edyid9z4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VQGjBUG+1gh3

Hao Wu <wuhaotsh@google.com> writes:

> This patch allows the user to attach an external drive as a property
> for an onboard at24c eeprom device.

What's the contents of the EEPROM before the patch?

I guess the patch lets users replace that contents.  Why would a user
want to do that?

>                                     It uses an unit number to
> distinguish different devices.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

