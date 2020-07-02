Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1774983lfm;
        Thu, 2 Jul 2020 12:26:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwROYGVHhsJkD+R2koR2WIgeIB4yipm+N5Yj0WgfNmQ2UR0cDqu1WbmrATQod1GkTaetkF/
X-Received: by 2002:a25:a08c:: with SMTP id y12mr50261272ybh.259.1593717997998;
        Thu, 02 Jul 2020 12:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593717997; cv=none;
        d=google.com; s=arc-20160816;
        b=KnUAyQN1yW4LGMWWq3IdXo3LuiiFoOspFI6tFBb686wk9DFByrkQ5NWo6ZRm0V346G
         nzplPF3rEoV1+bV4aPzMuMvNRbs0XDZ/luTcECTzOzBYQGSIaNFQDCmgpKvuHZSh2Q3c
         fmz5IYGYK1UxIXnKb1liowFrQA+dx4QbWnIbSjH2JPp+nHgWNmWjCiTeXUZJax+a/BI8
         rp8k+CtD1JztBX+09qShmsaY3A3tZKfFi8NDSZ1L5Ta3QzKf3OrS1Z0pYYeJeqK3RSpA
         Ih54rhtJZOyM/bViGQc1ca1FE9SW40mNtkjANA4F77L1WVUYrFU1Si9X3I6JmMRbvmjd
         c7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=h+kkp0glMQKAXMJ6/bC36ZxkMzJectPPpL5LAdpf9ms=;
        b=mi0Uyf0FDu5Ri51aXr8z3KNE2ZsD0CyFK5fjeu+O5mKQfTPx7GlAdzlxh1EnCgeY/l
         A+59XCFAM8CKfadGPORAUrkhROxKp5wcrAEsYZ9OBNfvw4duaogm7DbsCnros0PyEvz8
         4j6mGzYnw54qsbHMBdX06D98DlY46BDtZV4PtbKUzfC7kRQ8cRholZ+x1xVOAtF/G7aV
         eINUpsAVOWDINLzXKtWlrmXMTCXoIPu8k0sx5kXLUafuik7dVBMlnTogATGDv/fCK/NL
         d01TteJUkR99cV5H2816J5pvXTkYze0keLyL4kjgAyqy8SLpWC+4XUUiBhimZNAwJv1S
         se6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="G21kdh9/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si9521318ybi.228.2020.07.02.12.26.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 12:26:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="G21kdh9/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr4qz-0001VD-Do
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 15:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr4qq-0001Tb-JO
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 15:26:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55038
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr4qo-0006BZ-8Y
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 15:26:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593717980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h+kkp0glMQKAXMJ6/bC36ZxkMzJectPPpL5LAdpf9ms=;
 b=G21kdh9//s4wHpvkWrOdnm8ElCpYhoi/I1ySqiUZbAKy5sFDVJz8tV3d0IfChN/E6aILvb
 OeclF17NDHhJnawDTkONRfIt95/bmRUOoM495xhDz0lDhQprLOeXqjvHncQW1JMrrGE8Vh
 gskpWRuHPmdjmGgkIigyYMQEmMZfiEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-cS6ilCO-OF-CB6j5O0CnyA-1; Thu, 02 Jul 2020 15:26:18 -0400
X-MC-Unique: cS6ilCO-OF-CB6j5O0CnyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45D84804001;
 Thu,  2 Jul 2020 19:26:17 +0000 (UTC)
Received: from [10.36.112.70] (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85918100164D;
 Thu,  2 Jul 2020 19:26:08 +0000 (UTC)
Subject: Re: [PATCH 0/4] hw/arm/virt-acpi-build: Only expose flash on older
 machine types
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200629140938.17566-1-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c31ed07d-33e3-2233-43ec-e320cc2180b3@redhat.com>
Date: Thu, 2 Jul 2020 21:26:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200629140938.17566-1-drjones@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:00:43
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
Cc: peter.maydell@linaro.org, mst@redhat.com, philmd@redhat.com,
 shannon.zhaosl@gmail.com, ard.biesheuvel@arm.com, imammedo@redhat.com,
 lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: epSPtKuiCT74

Hi Drew,

On 6/29/20 4:09 PM, Andrew Jones wrote:
> The flash device is exclusively for the host-controlled firmware, so
> we should not expose it to the OS. Exposing it risks the OS messing
> with it, which could break firmware runtime services and surprise the
> OS when all its changes disappear after reboot.
> 
> This change was suggested by Ard and Laszlo.
> 
> Patch 3/4 is the meat. The other patches deal with updating qtest.
> 
> Thanks,
> drew
> 
> Andrew Jones (4):
>   tests/acpi: remove stale allowed tables
>   tests/acpi: virt: allow DSDT acpi table changes
>   hw/arm/virt-acpi-build: Only expose flash on older machine types
>   tests/acpi: virt: update golden masters for DSDT

SERIES:
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> 
>  hw/arm/virt-acpi-build.c                    |   5 ++++-
>  hw/arm/virt.c                               |   3 +++
>  include/hw/arm/virt.h                       |   1 +
>  tests/data/acpi/virt/DSDT                   | Bin 5307 -> 5205 bytes
>  tests/data/acpi/virt/DSDT.memhp             | Bin 6668 -> 6566 bytes
>  tests/data/acpi/virt/DSDT.numamem           | Bin 5307 -> 5205 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |  18 ------------------
>  7 files changed, 8 insertions(+), 19 deletions(-)
> 

