Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp131712ejn;
        Wed, 26 Oct 2022 22:47:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4/Ixl+YHhhVeSc9gdfqQPPHEeHR4gx+g34TGZUf6KzL6C2MjXqrE7L/WzhYPcZqLEm3nnf
X-Received: by 2002:a05:620a:152:b0:6ea:d82e:f7e2 with SMTP id e18-20020a05620a015200b006ead82ef7e2mr33454270qkn.164.1666849624147;
        Wed, 26 Oct 2022 22:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666849624; cv=none;
        d=google.com; s=arc-20160816;
        b=Zx83xMRAgp6YwTqQy3niIQhbFLT226gAmAshGfmzF9lxt2ORYgsKAbsAFiwSn/d2F8
         Al7mOqJS/Fc2UxBWkYS7MA6ejOvaTl3Lcf7xVbsofmwjQXGPqcHFk0H//gxTjHZMeJ9i
         M/uxmFhDi32zuTtukqk9ij3nLYhJ/8uXMupKAZfJ0HcZpUH/ZjmCpTjs372NtLW0VCyK
         Vg1LwThuS4wMGS2Hv0cMJXgQSH2n8/F9U0i0FrKvX9cGo/jb53HOG/YHvGs41Lv1G4qj
         er7s/kysZuGPMBTKb8u9pStbPcLI3WETzYDoiik8iagBG5vcvNggSKc0xoLhhyZOu2jK
         RI7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=MtIkbCwavHN+ceqXcDrkfgF8CrrQJZjyMLLM8HKfgxg=;
        b=L2nv4rUGYiS5zPqmxcIy/eQMAtb6DyR10w/qJcVO9UIildGt8H3I1LJ59YsvM68VVd
         sfp/e05misbZBeZCWwJ016hJvV6w/4X0vK6lT/Lfl/gFS9gHe7Aiq4aJxSVxJrptuYjl
         ocHMMDfBGXs1Th6ytV5EyQs5bEhinYyVYF/LQbW44zPBrQ4UJ24CyaZbi+stMpq9DVjQ
         rcQpVZ5kE/yWuOxEI9CCMGbuG/S6v9Y616lMkNQwEd8JQMxd/Q5B1xs+Dz8y/EugIfVm
         eeOkaBr50WuZdQmCMpC1jx0uAeZQ4i0fN4ErPLnyD83AlGIdktTlUZC0X74Tl5v9QsA2
         xDAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JsJV8/a0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4-20020a05620a430400b006b99134c715si351656qko.459.2022.10.26.22.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 22:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JsJV8/a0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onvgY-0006tZ-Iy; Thu, 27 Oct 2022 01:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onvgR-0006sP-HT
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 01:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onvgP-00036V-GJ
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 01:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666849438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MtIkbCwavHN+ceqXcDrkfgF8CrrQJZjyMLLM8HKfgxg=;
 b=JsJV8/a0lzMNjcCClWR1uj1shQrnDmyNHe8nRm+YOwnk1paxUh+YJBXSFMjfE1DyrK54MS
 G0W8fjADuANLNfeOf7+V3uIvHZmFp9yA2J1bdfw4qPTc2tPAn4vUa5S5bKwJYQIZlKWNbZ
 klGk59CgPSqme23p4pTvqChXAj97t68=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571--D-GBrc-OWWjj4BQZiMeeQ-1; Thu, 27 Oct 2022 01:43:52 -0400
X-MC-Unique: -D-GBrc-OWWjj4BQZiMeeQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0D1A800B23;
 Thu, 27 Oct 2022 05:43:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B24B61415117;
 Thu, 27 Oct 2022 05:43:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9B4C121E6921; Thu, 27 Oct 2022 07:43:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,  qemu-devel@nongnu.org,
 qemu-block@nongnu.org,  qemu-arm@nongnu.org,  "Michael S . Tsirkin"
 <mst@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,  Eduardo Habkost
 <eduardo@habkost.net>,  John Snow <jsnow@redhat.com>,  Dmitry Fleytman
 <dmitry.fleytman@gmail.com>,  Jason Wang <jasowang@redhat.com>,  Stefan
 Weil <sw@weilnetz.de>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Peter Maydell <peter.maydell@linaro.org>,  Andrey
 Smirnov <andrew.smirnov@gmail.com>,  Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,  Yan Vugenfirer
 <yan@daynix.com>,  Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v3 02/16] hw/i386/amd_iommu: Omit errp for
 pci_add_capability
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
 <20221026201527.24063-3-akihiko.odaki@daynix.com>
Date: Thu, 27 Oct 2022 07:43:46 +0200
In-Reply-To: <20221026201527.24063-3-akihiko.odaki@daynix.com> (Akihiko
 Odaki's message of "Thu, 27 Oct 2022 05:15:13 +0900")
Message-ID: <87pmedbz3h.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SOGx9RB7rf6v

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> Omitting errp for pci_add_capability() causes it to abort if
> capabilities overlap. This behavior is appropriate heare because all of

Typo: here

Same for later patches.

> the capabilities set in this device are defined in the program and
> their overlap should not happen unless there is a programming error.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Otherwise fine.  Thank you!

