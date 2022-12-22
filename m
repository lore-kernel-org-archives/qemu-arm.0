Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp311918ejb;
        Thu, 22 Dec 2022 04:11:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtrPC22acqGjIVIsPVB1Ufhd2C2mI52i1ZbaaYlJc4w71w8aqSJXtI7hHvtVLstTf/q9ypW
X-Received: by 2002:a05:6214:1bcd:b0:4c7:50b7:8d73 with SMTP id m13-20020a0562141bcd00b004c750b78d73mr9954064qvc.4.1671711063347;
        Thu, 22 Dec 2022 04:11:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671711063; cv=none;
        d=google.com; s=arc-20160816;
        b=mns/UydcFWL9dBOMXsXRZrZyj8x7/jK3dLJe/mRbirQ7uhxJ33t5ZnUPLeObnIhtCL
         cKKwiICRFjNuwazfkLJ+zKc8vc7iBgAc8uyUKA1peAKw6OaY4c4SA3jrjhmYgk4/Z0hB
         kmjdXvXCES0ikWFv8OTR10BDxNw/AuEX0s9JXyZNISDZLLip/bK/WgvwY3OqP5K82cQh
         zVRAImFOF1dleEkGkyei2qmvmkK6OER5XhTp+M5BnzSXSkrNSS/6nyJQhO31J61EzI+n
         rG/9OSzNT8brN6O2VF6fy7otO9cLAwDcW5SDoP/KsRaeUe+qt6Mcx0zc+LBb558uNuI4
         1QAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=SmuOKcmhc5P8kB9mxDdXSAF3BAiFiDucFWG7ceOtKqM=;
        b=DAdCqSwKCiV1WWFHFryupkN4spEyhbCJjRY0oSu2jmqM5Sokhb24TtM9R+HsJt7vxs
         wRtlnhwZF+N1QR4sdQNvXwZW3zLnBPgpVAi9D/rZPgBsU9gUMMS7Qxob63jXQ5eAFsF8
         TeTSNhOgPAHtHp2oK+IxitALIU+pXPeKOLAi6Zsl6v+D5UoOiOC75mloNREi1GXYCZQv
         6wJtvOujKIepS+4fnTaT7kHEfy4+p8cU7IWOb06GKJy4jLZSKgcsuPqIv95TMi3kbqbE
         JCaSr8rJF/q1Yp7NmQkA3oqjmxMgSEXSzRyQ33vAeRlAvOtGJUqyQ3T237jAX0eywXpI
         +uzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MOmpzW/s";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu9-20020a056214260900b004c690ad6e72si166605qvb.411.2022.12.22.04.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Dec 2022 04:11:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MOmpzW/s";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8KOz-000897-2a; Thu, 22 Dec 2022 07:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8KOv-000887-Gj
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 07:10:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8KOu-0004wh-1B
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 07:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671711015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SmuOKcmhc5P8kB9mxDdXSAF3BAiFiDucFWG7ceOtKqM=;
 b=MOmpzW/sPNe7f6Pp05q/XUHsL7A8jdxWe0dr5ro+KrSX/ixZaLZ3BVELXmQO8kb77FHD1F
 pV16x0aLOROTQKPVJi2/JDWWfzEIrllCqejRimZCT89YVYNSj/h98iabQHCTYSsalZbBgQ
 ehWsjzTNtGtWTSfnj232mzQuyXouy5o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-KAq2bMT9MyuSYtgLgzcndg-1; Thu, 22 Dec 2022 07:10:10 -0500
X-MC-Unique: KAq2bMT9MyuSYtgLgzcndg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4651B85C1A4;
 Thu, 22 Dec 2022 12:10:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C35534014EB9;
 Thu, 22 Dec 2022 12:10:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9FEA821E691D; Thu, 22 Dec 2022 13:10:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org,  imammedo@redhat.com,  ani@anisinha.ca,
 peter.maydell@linaro.org,  laurent@vivier.eu,  edgar.iglesias@gmail.com,
 Alistair.Francis@wdc.com,  bin.meng@windriver.com,  palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com,  yangxiaojuan@loongson.cn,
 gaosong@loongson.cn,  richard.henderson@linaro.org,  deller@gmx.de,
 jasowang@redhat.com,  vikram.garhwal@amd.com,
 francisco.iglesias@amd.com,  clg@kaod.org,  kraxel@redhat.com,
 marcandre.lureau@redhat.com,  riku.voipio@iki.fi,  qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,  qemu-ppc@nongnu.org,  crwulff@gmail.com,
 marex@denx.de
Subject: Re: [PATCH v2 0/4] Clean up includes
References: <20221222120813.727830-1-armbru@redhat.com>
Date: Thu, 22 Dec 2022 13:10:07 +0100
In-Reply-To: <20221222120813.727830-1-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 22 Dec 2022 13:08:09 +0100")
Message-ID: <871qorej1c.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: sf57K8cTi5Xd

Michael, I forgot to add your R-bys.  I'll fix that in the next
revision if I need one, else in the pull request.

