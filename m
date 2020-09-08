Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp494694lfq;
        Tue, 8 Sep 2020 03:59:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwa3OGrmf8isAXWr82p9utjtsNNgzWNsvfZgkhU5gR50W7afuhzZup6vAzmIsYmjtKxhlxg
X-Received: by 2002:a25:c088:: with SMTP id c130mr32708540ybf.356.1599562741776;
        Tue, 08 Sep 2020 03:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599562741; cv=none;
        d=google.com; s=arc-20160816;
        b=MsPkbMpUrqwzq9CgrK9Z4Iaz4PJVnU3JOyBlEkeb3rNF1AbXqYoCTy1qFXt0FvBORF
         t4uuL59VmZxybzJdTCcv2BJa8hv99PhFN8Je+u+8FXhxDDkO1Mwp5oYlQnP7FsbMagXb
         pQ5OK7DFi0IarMPQrTOds0Uxhou3jPHktrIBaxvNplTShLwLsbBfAZFY2CxK/59uQfBa
         /9XJiei6l/vEGsnkBqTNgbcG3I0uZvH7qH04Z3ZRXSdxsuRad4mgGUN8dFS816FEKT52
         ECao9PE15l+RhikEE+7VD0QbUO9SMgHrXJDq0xhDJiS3EheDP7xYvZrlsNROSumGmzJy
         esbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=qPc/0Uh0FgG1i/tb2PZ08YkkVKl85kjsey4d3P+ERVQ=;
        b=eJlCmnkkz8q2hFz+LWG57TBKX4U9Vyx9WTpyQmYKcbhDjoR7t6gOz4Cx8p50s8/XpO
         x29i+i2aL2seF8VEz9/vYe0Isv0gOqHBr9jW1xPP1647vditmJfLSJZdt1gtrHUudiTN
         e57vIHyllTOtjwARb6xoPSm1+yuHuoDcEukvDqPZqKlQ1v0Qt6LvtKQ5YgRXLpD/S8uJ
         izABYRRWr69OsaM/UokIIzeHfpxOWIc20z1AXFtXqsmIU26vfs3PX7yDDFVnz2MpmR5Z
         N1Jm1JbmN7LmImnm4sFh70sepMeVjZBdMj6wFCD3ZwCYbmpw0ilg2M3GGWBQnYh3MfDq
         duXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vl7Eer3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1si20604979ybj.134.2020.09.08.03.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 03:59:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vl7Eer3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFbL3-0000e6-7N
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 06:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbKw-0000dx-7X
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 06:58:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50925
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbKu-0004b6-P6
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 06:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599562731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qPc/0Uh0FgG1i/tb2PZ08YkkVKl85kjsey4d3P+ERVQ=;
 b=Vl7Eer3upd0f7i+CSdHWyu1FMSM/2vu67lZjcxYLK/qhqQ8o1uXnPEOsqwqNZBuM+CK8vU
 jfr50T3/FwQbpiXYE1usTzB+gMwtUDcraif+2itnB9aMl1DN9VLv1Xg35uW05Tlx4G1zxv
 gSgRD2536SgehcvRdd3ZyZckquHprgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-OlMbsJ8CMxuBLMzSu5BtjQ-1; Tue, 08 Sep 2020 06:58:50 -0400
X-MC-Unique: OlMbsJ8CMxuBLMzSu5BtjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DDEE80B70F;
 Tue,  8 Sep 2020 10:58:49 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70F395D9E8;
 Tue,  8 Sep 2020 10:58:47 +0000 (UTC)
Date: Tue, 8 Sep 2020 12:58:44 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v2 06/12] target/arm/kvm: spe: Add device init and
 set_irq operations
Message-ID: <20200908105844.ngcpltb3ndqyhuae@kamzik.brq.redhat.com>
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <7bc684ec37de06827c68c409d5f02da7381734e5.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <7bc684ec37de06827c68c409d5f02da7381734e5.1599549462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: philmd@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bcaHa4CMthks

On Tue, Sep 08, 2020 at 08:13:24AM +0000, Haibo Xu wrote:
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  target/arm/kvm64.c   | 33 +++++++++++++++++++++++++++++++++
>  target/arm/kvm_arm.h |  5 +++++
>  2 files changed, 38 insertions(+)
>

Reviewed-by: Andrew Jones <drjones@redhat.com> 

