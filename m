Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2524640lfc;
        Fri, 5 Jun 2020 07:54:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxP6eVk1tImPLJ0hHYU+Uwvxbg4gWGOkD9kLeBVn8ImzhIFAgRK1OHgbKLIMgg27ttEBzep
X-Received: by 2002:a25:dccb:: with SMTP id y194mr15530100ybe.116.1591368898975;
        Fri, 05 Jun 2020 07:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591368898; cv=none;
        d=google.com; s=arc-20160816;
        b=s5BulkZgy2jyChPMMh3qg0rcEYQKCu/LxCjrruiMkemaihXzpFiwp/Re0WllHHpl1u
         VkaurnlojcTXMGVbBH1wpKWTc2HG0FfqAjKmxIpM7kIFzLm+utQFMyGC/j9tBh1+CYzC
         QaADGsK0RZ6a75PFO8xVUw8Rp6wCTaMS6Uy0o9Ho+2vaFiMC/jrT0Cpz9VZvmfxnty14
         w3mBiBWL8g8bdBUBhIJLwjxT1WAP1rTzXcZ/FLQ4cJ+VECxr2YDjxpOalCoXGaZ1iBr+
         WXGHCJ5zW6PTunnOxiP1WpLPFIqc9RHRZRERlhnKwRnuYNegokqHfIddi4ZrUcq0hiP1
         rr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=NqmHOySC3GGp/NHkKCTGcOCLaGaUhK7dFDeBKmK3QvI=;
        b=mYDHucv01PjPe2PFdNhJU+rQ+YfkcBOPUZUj9hu2btok1K2h8ufCssiWgWClarOuLk
         f0dUK7rPyeBgP91C7benCm+AgQLuS1YGDorEhVKZUbL3QDHc6HxtFwC7K2F7AT4oP8xd
         HSCbYj6Qbmyqrf5/7mEsdV8RTX5YTP/uPJ9R+YlE23QFavvRTGKrH9CdnwrwXDBNKVVF
         8NkjtEDeTxyKQyf1+Q4wMdZZKWWfiyhxfE9YBdko9dystNXMx8i9GUJWpPbERDpxc0jP
         CMnznegQ6nJLBI6gJzs0FWHdSNn9XoFIQy3aPyGcMztnaW94iGuu6DUGOWHjU+vUqKOO
         35Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AwHN7kWN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si6985892ybn.148.2020.06.05.07.54.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jun 2020 07:54:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AwHN7kWN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jhDkI-0001ou-Di
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 10:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhDkA-0001nl-HG
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 10:54:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40382
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jhDk9-000753-FX
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 10:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591368888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqmHOySC3GGp/NHkKCTGcOCLaGaUhK7dFDeBKmK3QvI=;
 b=AwHN7kWNVnejPR0NHgloO3LHoEcyjLO9efCWbUQOAybSQqANgX8+2b5LWohfA0JWwAp8m1
 ksrB6Y6x7ziMOwYWQIo+boGNsWrWZAIo5hgiV5hr64KadtcF7xdJf+wrbw9pn5A453wOww
 1I8D7ERmclxskc1qaCPCh4FrdX4+R/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-DwvqNppUOAuBkiO6dVogMQ-1; Fri, 05 Jun 2020 10:54:46 -0400
X-MC-Unique: DwvqNppUOAuBkiO6dVogMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E50E380B713;
 Fri,  5 Jun 2020 14:54:44 +0000 (UTC)
Received: from localhost (unknown [10.40.208.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CAC66292E;
 Fri,  5 Jun 2020 14:54:33 +0000 (UTC)
Date: Fri, 5 Jun 2020 16:54:32 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [RFC 2/6] tests/acpi: Add void tables for Q35/TPM-TIS
 bios-tables-test
Message-ID: <20200605165432.30e65cc0@redhat.com>
In-Reply-To: <20200601102113.1207-3-eric.auger@redhat.com>
References: <20200601102113.1207-1-eric.auger@redhat.com>
 <20200601102113.1207-3-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:27:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: qVku4p3fn5Oy

On Mon,  1 Jun 2020 12:21:09 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add placeholders for TPM and DSDT reference tables for
> Q35 TPM-TIS tests.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/q35/DSDT.tis | Bin
>  tests/data/acpi/q35/TPM2.tis | Bin
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 tests/data/acpi/q35/DSDT.tis
>  create mode 100644 tests/data/acpi/q35/TPM2.tis
> 
> diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
> new file mode 100644
> index 0000000000000000000000000000000000000000..e69de29bb2d1d6434b8b29ae775ad8c2e48c5391
> diff --git a/tests/data/acpi/q35/TPM2.tis b/tests/data/acpi/q35/TPM2.tis
> new file mode 100644
> index 0000000000000000000000000000000000000000..e69de29bb2d1d6434b8b29ae775ad8c2e48c5391

