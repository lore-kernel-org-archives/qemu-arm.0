Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3532163lfp;
        Sun, 2 Feb 2020 21:34:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpd2HqaJk7151ep/kE1J+sHVpB5l+xzce4u+HtJCLkkonrvsw7VAuSeV6bQF+9EqdPm4qg
X-Received: by 2002:a05:620a:1587:: with SMTP id d7mr22146927qkk.355.1580708065607;
        Sun, 02 Feb 2020 21:34:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580708065; cv=none;
        d=google.com; s=arc-20160816;
        b=ZshfA5Osj9hknO4enxdBt2uogNIVVzLFV07YuoyrmKEVMkuNufqazp8wETHLfrDBO6
         iw8K3WeGpcsKtMr5pEqa94LETaCexryhXlYATx+1aq0yf4cxprEemE3UTofsBV3eMfXt
         XADQutOxRFLGBrYXA6gSsGTESIguoRTWQpaUE0rZecfpSIoj3aftrI5sfY0CGcFIvEUY
         4VmTmudlxaPYIHZ8sNxivCIgv2ZwLtpladw5gRmTrk+SDcqroKUbVlRGQ+tESplevi2H
         UYRZJRICUMWnZH8QePER0zSFDpAhk5PlFJIFLoRHKmAKS8Rdc0/oeHmxJCsG7AAPrkik
         +dzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=RcFJJCjQo0TOdLh1o4wwrPlObe/GNGk4kz+QgrOhKIc=;
        b=X6kATmxFxcDN8x4+CFcxkXgHcm6h3QBt53fg71ljaWe82bWE8YxUsvORapuC+EZCQD
         M84SmbmFpgbxHlIgiImKtW1wtel/K744riPVjakbqF2tRkGpxhDKnAxO8Lqn2hJW+oof
         kmjsh8SSFO18TNX9pFGlwLAyNxfjMKuneY/Ulh6vI9Apc+KlU3n5GbXKqcaUwhQpvJm7
         yPXHAWbnsVn0IxxJRBWCwSJNek+8OqpEufLh+8dMaMnIcElhM5e1DZEI7wcFMbAEwfn7
         wGKN4U9+b1ZVzthBrcSv8jr5llm2H+l0RnHs7ty8Cw+nduizEi6q8y22wMC+OwYjPTq0
         Mk/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ezRg/9K/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16si10316086qtq.33.2020.02.02.21.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 21:34:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ezRg/9K/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyUNN-00012b-01
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 00:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49840)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iyUND-0000zg-MB
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 00:34:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iyUNC-00077V-M6
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 00:34:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28118
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iyUNC-00076w-Ho
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 00:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580708053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RcFJJCjQo0TOdLh1o4wwrPlObe/GNGk4kz+QgrOhKIc=;
 b=ezRg/9K/isF4FyfhpBpx8wthRDtpLLzsEUBLakx0ElLaiZPBZvgO8dg6ZOgfbx3rUaFEHi
 lgU5fIX2n5na8eZiRXMpzLfHLwRNOFyAvisFz1KC5Eb2cv/kOWnOsy44PBb/KEDWwwmJX2
 Pp+EISEiEcfl97sGR0nB0gTuw3vhFrk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-S8mcmWwbMGaAxGtajl-sbQ-1; Mon, 03 Feb 2020 00:34:08 -0500
Received: by mail-wr1-f69.google.com with SMTP id x15so7622153wrl.15
 for <qemu-arm@nongnu.org>; Sun, 02 Feb 2020 21:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GAKCQPHXWz2VKhrbZjv/2cs5ACvknu78Y17OHJ87Gxo=;
 b=Ow88m5dXAGHEVaOyYyzYFkq05GogLfuUqE54CG9affoTVkLKfSP/fFkAmEhiS2/k3J
 CqxYTb4DOsU8fVTGBCk3eE/flp7mDr7sK9uEqsSlS5E3cr0zDgjYK946sjt7bHtVhnHA
 b9s0lRC15Vl4+baGXscHsdT0kWYi13wxl785S2zvugjD6r1PB0+5cFHTnRfOGWcII+vu
 cDSGyNX8yifbsJ1sXkfWQezshKYzDx95HaCXk0xqA6z9al9YxZa+bCki0fU/zI7NKMvO
 PmaNlnE/TqZL8edFSaMUckbgfcxDssPM6vF0ZF37OTucCLBjZGt9WVTRla5jMXBTJrgR
 Qpbw==
X-Gm-Message-State: APjAAAW5mJ/6svaP4i5ntI/CzXHPFqMK31qQnUc45z//m7HQcircAUK1
 W7PouvO7xguBkOrvkadF/DV4G61PCoRc2pIzs8vuAEq7YKFFxvq2xQL02YS9c40yu2u21SjDkDn
 NTOw0l9uts7IW
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr26927930wmm.77.1580708046980; 
 Sun, 02 Feb 2020 21:34:06 -0800 (PST)
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr26927910wmm.77.1580708046831; 
 Sun, 02 Feb 2020 21:34:06 -0800 (PST)
Received: from redhat.com (ip-82-36-244-173.west.us.northamericancoax.com.
 [173.244.36.82])
 by smtp.gmail.com with ESMTPSA id m9sm5021390wrx.55.2020.02.02.21.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2020 21:34:06 -0800 (PST)
Date: Mon, 3 Feb 2020 00:33:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH v2 1/7] bios-tables-test: prepare to change ARM virt ACPI
 DSDT
Message-ID: <20200203003349-mutt-send-email-mst@kernel.org>
References: <20200203001505.52573-1-guoheyi@huawei.com>
 <20200203001505.52573-2-guoheyi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200203001505.52573-2-guoheyi@huawei.com>
X-MC-Unique: S8mcmWwbMGaAxGtajl-sbQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pLrX15BgURpP

On Mon, Feb 03, 2020 at 08:14:59AM +0800, Heyi Guo wrote:
> We are going to change ARM virt ACPI DSDT table, which will cause make
> check to fail, so temporarily add related golden masters to ignore
> list.
>=20
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
> index dfb8523c8b..32a401ae35 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,4 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/DSDT",
> +"tests/data/acpi/virt/DSDT.memhp",
> +"tests/data/acpi/virt/DSDT.numamem",
> --=20
> 2.19.1

