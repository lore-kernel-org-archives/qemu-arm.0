Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1503078ejc;
        Fri, 13 Oct 2023 06:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqVx2yuEjHr9ejT417r3AkYb+OnayXo3XfOJer82z/uFthO7O4Us+KnRWVoIgEFnEfqBfB
X-Received: by 2002:ac8:5b0c:0:b0:419:4bdf:756b with SMTP id m12-20020ac85b0c000000b004194bdf756bmr31942332qtw.36.1697203093600;
        Fri, 13 Oct 2023 06:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697203093; cv=none;
        d=google.com; s=arc-20160816;
        b=jw3nngTjAffWiKNv7k+L0lceV+ipwyon0rMV4Gm+2UWkxNPZIsR6gAbU3S2v+uhScO
         ACcRG+dnXKm9pdpz98OJ+PC5eL8ZpRx/PG3/3SVnaO4ZnRMV31EHbSMkmzMkf32q4sI8
         IvHBxZiIdo+8vSHXMB6IMWQmC0quNqLH9UN0eapmWd0gEMC/VF0Qqc8x6PrIUMPYqfe3
         31scf2DJhpHwl0mbzv1V0V2Th5tMXw4d840vvWQo8A7HztWFqLK2cTzOnPF9dOhilgSm
         C9GBZxFsUC3aDJpDsOHmH3xIL1z0g1+XBDkyZWe0nMvdWUZnbmF6sPE4UxSC+D5/nSnM
         pC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=RuP6RgPZp2oDrq2htYXca4j+9IsftKzhIHCnhzFVR7Q=;
        fh=yb4b79XAGCI30noH8GSpCr9rwvQW/pGoAYpupm/Cfyc=;
        b=Eqxi1FadjTKVF5jtOSYr5IkwAsACI4NSnqd5s6VJR+5M6MGlmEs5yVMNbLUkdSmgBi
         AYxdLtC3K7V8IQReiisJn3+hYfdN393KUMWlOtEbMTwxuqLpCA7Gpmrgw2yqO+5C1clU
         shLiJuAWqqpI10F61TYE5w4Romd9/3DBn1muWIa3WRCO5dXVHXWeM9FaBKP3M7myO2GJ
         Y5IMuOpDUPOcLJsQe57LWFw/UONV6X9Ab1xkZz5wnAof8mUKsv5nlxrUKgyhR/bNHcEt
         vuOfyyUkJI8q7xd+Qyq2nSnVBXkcvvJFt/rK+Hs6QDX716e0/nX4burXVkYEghvzk47N
         vBAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Enw+HW+B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp35-20020a05622a1ba300b00419875f512asi1172531qtb.674.2023.10.13.06.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 06:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Enw+HW+B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrI3C-0001VT-At; Fri, 13 Oct 2023 09:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qrI3A-0001Ss-8T
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 09:17:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qrI38-0007gp-TL
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 09:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697203074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RuP6RgPZp2oDrq2htYXca4j+9IsftKzhIHCnhzFVR7Q=;
 b=Enw+HW+BXzQZSl6TKpd+o5mtbXl6cNKfehkPThYd3oN0uPhzr8YuGbADg4gYeppGehTUKD
 8eJLM1pHITT80ZFEAEV8pe6yUg9h0Yn3vhgooMi83TfapwcftuWyilWhRgRhkgCSr5YoWh
 aqIQUo6Lnd1wG2G8oNws3LcGaR6StDg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-3RFgzaKvPbKhWKJd8lbn9Q-1; Fri, 13 Oct 2023 09:17:39 -0400
X-MC-Unique: 3RFgzaKvPbKhWKJd8lbn9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74DB61C01514;
 Fri, 13 Oct 2023 13:17:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CDF040C6F7F;
 Fri, 13 Oct 2023 13:17:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5113F21E6A21; Fri, 13 Oct 2023 15:17:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: <ankita@nvidia.com>
Cc: <jgg@nvidia.com>,  <alex.williamson@redhat.com>,  <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>,  <peter.maydell@linaro.org>,
 <ani@anisinha.ca>,  <berrange@redhat.com>,  <eduardo@habkost.net>,
 <imammedo@redhat.com>,  <mst@redhat.com>,  <eblake@redhat.com>,
 <david@redhat.com>,  <gshan@redhat.com>,  <Jonathan.Cameron@huawei.com>,
 <aniketa@nvidia.com>,  <cjia@nvidia.com>,  <kwankhede@nvidia.com>,
 <targupta@nvidia.com>,  <vsethi@nvidia.com>,  <acurrid@nvidia.com>,
 <dnigam@nvidia.com>,  <udhoke@nvidia.com>,  <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 3/3] qom: Link multiple numa nodes to device using a
 new object
References: <20231007201740.30335-1-ankita@nvidia.com>
 <20231007201740.30335-4-ankita@nvidia.com>
Date: Fri, 13 Oct 2023 15:17:37 +0200
In-Reply-To: <20231007201740.30335-4-ankita@nvidia.com> (ankita@nvidia.com's
 message of "Sun, 8 Oct 2023 01:47:40 +0530")
Message-ID: <87o7h2fyq6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: rMP7POo99/Wz

Same comments as for PATCH 1.

