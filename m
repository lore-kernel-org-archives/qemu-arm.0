Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2525369lfc;
        Fri, 5 Jun 2020 07:56:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypOYhTrUflWU9yqqxfZgN3VhXl/x+5HUNt3fCRSbVRV/Ka+T1l2UW15lJZe/EWrcYrfiYN
X-Received: by 2002:a25:4408:: with SMTP id r8mr16343420yba.146.1591368960700;
        Fri, 05 Jun 2020 07:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591368960; cv=none;
        d=google.com; s=arc-20160816;
        b=wbd96sBu5AF0QEaBggALkNFaQyDaq0VhwDI8gTaAYLbmwG2xFK7Ubj103iqVT0FoMw
         g2z9nLueW9NsCXtp0/19B/fzUsJtscl3hnwmF0m9ZGwJhnybXZnb7fKdQzv0qwIPx7c4
         +YFIwzwU40jJkWpRvXGGTiLN3bC7uaIa39Ptb1GESmTCFSBtIgMVEX9u09y8zo8zXp3d
         a7EyratHV2epjanCHiPqdmj4KK/dac2xVyyz+xkvs/0Dq+6xnEskmQZmOiTLhqc9SYOV
         PqyR3Bzb+oXbok71ZXRux42AKsBX7xzqh9RSLW6+U1+u6ZbUYOHk5OER/8ryLlr7fhw0
         Fq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=GZMFFAclHg59tgW9VXfOg5RyQlIFb2LPuSM0z2FR28Y=;
        b=CjFk2TpgPmksbSWvRswjxJyUnn9wceh1RYFCfNEVIYng7IVqNEJ+W7W96PZuOtq4Bd
         fFh7W7X/rdjG+UJjIZCe50zLR+MAPcQ8+0dao9LKmldFqpYwIHMP/mQ9CgU8yeuGrk6T
         yrZao/oDSOm7ggDN+1nEz6vRyzKt9TsqkZ3srUuI83FZr6PIO1D4jjItH0EDD3Qq9XsQ
         S0XM3W/vgXYzWiVKSDHxD9e74xapGA5FP3dCxyTu3lf3+px4TGhx9ml/nSzCmorFtR3A
         Uu+1R5bKjxMbMOxE0pqm5jOLt+ISDOE6NuqPwFvWzKzQcPwS0mMwx2CsGoyg1OqUSmW6
         NquQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OcMKFbbu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1si6836904ybg.412.2020.06.05.07.56.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 07:56:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OcMKFbbu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhDlI-0002xL-4b
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 10:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhDlB-0002wC-7Z
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 10:55:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40985
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhDl9-0007Lv-1A
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 10:55:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591368950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZMFFAclHg59tgW9VXfOg5RyQlIFb2LPuSM0z2FR28Y=;
 b=OcMKFbbuwPr5tkUkqoQKMFCMWezVPY4uj0D7sBJ5nY3bJtYgPIJWWDPUp8G67yhIoN3yLx
 IIVD7Yk4f11d4FIACXrJHwgK0aGPIZ+lC/JiUn4EmODowtFdOvljZHLvB92+F50twNrmzR
 EKSqWDIw1gb7CIm6WUU3pQ99pUQaJ8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-ecE1WF52Mgi2PHeeydAEkw-1; Fri, 05 Jun 2020 10:55:48 -0400
X-MC-Unique: ecE1WF52Mgi2PHeeydAEkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4464FEC1A4;
 Fri,  5 Jun 2020 14:55:47 +0000 (UTC)
Received: from localhost (unknown [10.40.208.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A9EC60C05;
 Fri,  5 Jun 2020 14:55:29 +0000 (UTC)
Date: Fri, 5 Jun 2020 16:55:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [RFC 3/6] tests/acpi: Ignore TPM2.tis and DSDT.tis
Message-ID: <20200605165528.6673bbeb@redhat.com>
In-Reply-To: <20200601102113.1207-4-eric.auger@redhat.com>
References: <20200601102113.1207-1-eric.auger@redhat.com>
 <20200601102113.1207-4-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 philmd@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcandre.lureau@redhat.com, eric.auger.pro@gmail.com,
 lersek@redhat.com, ardb@kernel.org, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hv8AsTK/KGJC

On Mon,  1 Jun 2020 12:21:10 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Subsequent patches will alter the content of TPM2.tis
> and DSDT.tis so let's ignore them until the references
> are generated.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..a2a45d1d31 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/DSDT.tis",
> +"tests/data/acpi/q35/TPM2.tis",

