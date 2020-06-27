Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1150809lfm;
        Sat, 27 Jun 2020 00:08:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDPHJmhXDftbGNOSdlNZ6fqFXgfD/MmeJZqml+ZKPoxtY0/3dtIYpMl+lV9U8hGm0tvfNy
X-Received: by 2002:a25:53c5:: with SMTP id h188mr10774911ybb.133.1593241735782;
        Sat, 27 Jun 2020 00:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593241735; cv=none;
        d=google.com; s=arc-20160816;
        b=miRbqHkssv/C3f2abi9/DJ8pAI55EB7mZ1GPriU4F+fhWHKyu6NYp9SfUkjGqGQKU0
         6Uy6IQSoFDmIXO1aoS8cEylduSFiSlfliI+oujpvhvNKUwvRNn7r2aIjNhERq0Py/Coa
         XbYdzFDl/lFOsDAULGLoTiK0dkhrcMR9CMq6LAuYXQuTQyy+0jzzV7EbfP6/wunooVkK
         6O6PbtyhdoY0TzgE9iWGeRsvkohKbUtMfB6sVeUFk0qMnwWED8cUdwMTly4MTe2OZDVq
         5teWs5TCMHk/He9wSfym4C8B/wU/zM75nMm4b0CQxX4yAjnEgR1w/beyleifhjYkcC/s
         Xeug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=GQw1TWKVKJmhFHxv89IhMdAWCX92d+mIhs2OaXalD9M=;
        b=zhwaowm4WNTphhcO/2Knv4gnti0fQUb86o79U02BuRwv17rjfhbXK3yFq0UQObydzq
         DBC6U4BfRTToAGakXQUmpX2Gs11GZ6TAY0XAn8htPtpm/xxW7Z+ZFcUdjuqz378RaFfk
         lT4twV1i228bFHB4agoGbP7nYKLrBFGLupXWjN3nzy9d8uz6l8q7VrwM/R7qYVl8hV8r
         ZYV+Kli0zrRFdaMF0ABeIJy2agaw9T5cHL1nLXIdE5wf/TuAlAJkTOM5A34CdN2RdK3+
         yvj8mpnzF+1nR/Z1Br+I1lG5HT9Q+6rrtuJ5R8smLqOMW0K4I0iCc58WoZMOy4a8JSaa
         pWoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OUXNnZRy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si2569160ybj.142.2020.06.27.00.08.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Jun 2020 00:08:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OUXNnZRy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jp4xL-0005YR-5K
	for alex.bennee@linaro.org; Sat, 27 Jun 2020 03:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jp4xD-0005YI-K7
 for qemu-arm@nongnu.org; Sat, 27 Jun 2020 03:08:47 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27984
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jp4xB-0004yu-OI
 for qemu-arm@nongnu.org; Sat, 27 Jun 2020 03:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593241724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQw1TWKVKJmhFHxv89IhMdAWCX92d+mIhs2OaXalD9M=;
 b=OUXNnZRyvGjGDSw0YmxMSUl1m8k031SIb9gdGhVzHRqm5bPYG5wNieP068hnRc2m9/fz9t
 pE/WLTklNIYXbJ0MC0AJkMItA1u1MGaLZ7QnQ3QhC9VfnvDG0BFJtCekgFTgfOHnyrmKtT
 bkDG/eXMs9F5jqTrnJSLWB825VgJiko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-vAWIxqEHMFuKYyoTtEItAw-1; Sat, 27 Jun 2020 03:08:43 -0400
X-MC-Unique: vAWIxqEHMFuKYyoTtEItAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 067E118585A3;
 Sat, 27 Jun 2020 07:08:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BA885D9DA;
 Sat, 27 Jun 2020 07:08:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 09CA511384A6; Sat, 27 Jun 2020 09:08:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v6 2/5] virtio-iommu: Implement RESV_MEM probe request
References: <20200626103057.11263-1-eric.auger@redhat.com>
 <20200626103057.11263-3-eric.auger@redhat.com>
Date: Sat, 27 Jun 2020 09:08:31 +0200
In-Reply-To: <20200626103057.11263-3-eric.auger@redhat.com> (Eric Auger's
 message of "Fri, 26 Jun 2020 12:30:54 +0200")
Message-ID: <87o8p5rno0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/27 02:53:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 pbonzini@redhat.com, bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O3KE+MemCuHi

Eric Auger <eric.auger@redhat.com> writes:

> This patch implements the PROBE request. At the moment,
> only THE RESV_MEM property is handled. The first goal is
> to report iommu wide reserved regions such as the MSI regions
> set by the machine code. On x86 this will be the IOAPIC MSI
> region, [0xFEE00000 - 0xFEEFFFFF], on ARM this may be the ITS
> doorbell.
>
> In the future we may introduce per device reserved regions.
> This will be useful when protecting host assigned devices
> which may expose their own reserved regions
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>
> ---
>
> v5 -> v6:
> - removed validation of s->reserved_regions[i].type in the
>   probe request as it should rather happen in the realize()

Consider keeping the assertion.  I'd makes it locally obvious that the
assignment to subtype is not supposed to truncate.  The realize method
is in another file.  This is not a demand.

[...]

