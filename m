Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp669086lfm;
        Mon, 6 Jul 2020 23:50:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnsIIpd2PjvrjrxX3uFyTmanTaX7d/DgXA6F44O+wuhhq8t11s0qgOmb/GxqDBuU+zk/ij
X-Received: by 2002:a25:2609:: with SMTP id m9mr39272286ybm.387.1594104637108;
        Mon, 06 Jul 2020 23:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594104637; cv=none;
        d=google.com; s=arc-20160816;
        b=VXWKHxeZdlMbkJgFqiSwbXtrBdQ/E41855oAEjpOiwA9wtu/Jh9Lg+0ay8CvNV/co0
         2J7T1ujBFtPc3oXMxGw4dyR159oS0bfFHNMZpKznmVTxPn/3h8NhWA7GUkBUi5iVIJKz
         LcO/Ihmp6+FkgJdtcCqX6/ppcGNcRymqq0EcDyAUY9qKFQJ/q8nQOokabN7p2Jdft/Ff
         C2w/q1Ff0cF3Dq7o2jpHMtD67Yujv08sU3Y9FbEH5Z24vcu4MN6QcX2IlQcPnkC0QEmX
         h3iuZAgEFTgYpnLevIlBDIm/ojXryrL8d208G1E1KutbNoPvTWCAFsuw6WcQzru16K3m
         yUVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=0GD/aR7YdYjGqFqj3DhJDszcPCzdEA0c14PN15EmwW8=;
        b=EeQniMw8h/u2u2h0Lawe+2eaTihPshYkmGASf1TMWwXOXXmFC5dPGjFFAmReEVidpC
         HKpF2N78IBWYgorsupLnoD4hyw4FeFCxFddmjUKSrihsmLhdup+I4OaBfs0DEFcbVSlj
         EPBxycC62pN7zswxTsCKbR7cZ3/+9tgiDMtnDrWjL+c2Z8nXQ3+/kbpiSPFYw4YMGSO9
         sXGw9I74ikhWtWvCgpcP2WDdnOh8PsQh3U1kY3troevomIqjT8w7IZDnF3CNkUFXYi0B
         TttO3++4DZbc7735iniSRr3u7aiDvvmcqL0YToBRepYPhafA4n/zWUsPMceHc92RlPHW
         kx6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ORLc7QjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si22085404ybc.441.2020.07.06.23.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 23:50:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ORLc7QjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jshR6-000266-HU
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 02:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1jshQc-00024P-LE
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 02:50:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54136
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1jshQa-00014a-OD
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 02:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594104603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0GD/aR7YdYjGqFqj3DhJDszcPCzdEA0c14PN15EmwW8=;
 b=ORLc7QjJvynCzmByhgEknhE7s/TWXd2KpjkpwOODYAYtse0l4785RpzAHWC1IrifEEsczn
 SMnVD/m905rfGyu9ZlqPmwZ2SwH2kPC2ZR52ALcsbB5aWBoTDtyUce2W/dUGJtGUEgglTa
 wKUly+A6N2sOjmBu25pWudffI0xFWb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-rdi-f3QIOkykAbFaGVa3yg-1; Tue, 07 Jul 2020 02:50:02 -0400
X-MC-Unique: rdi-f3QIOkykAbFaGVa3yg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BADD9107ACCA;
 Tue,  7 Jul 2020 06:50:00 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8F40B3A65;
 Tue,  7 Jul 2020 06:49:54 +0000 (UTC)
Date: Tue, 7 Jul 2020 08:49:51 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 2/2] hw/sd/sdcard: Deprecate the SPI mode
Message-ID: <20200707064951.GC9048@angien.pipo.sk>
References: <20200705220731.28101-1-f4bug@amsat.org>
 <20200705220731.28101-3-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200705220731.28101-3-f4bug@amsat.org>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 23:10:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <huth@tuxfamily.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 libvir-list@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JFH8+XYFztaC

On Mon, Jul 06, 2020 at 00:07:31 +0200, Philippe Mathieu-Daudé wrote:
> SD cards be used with SPI, SD or MMC protocol.
> 
> Unfortunately, maintaining the SPI protocol make improving the
> MMC mode very difficult. As of 2020 users are more interested
> in using cards with the MMC protocol.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  docs/system/deprecated.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 5e67d7f3e0..01dca3d038 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -384,6 +384,11 @@ full SCSI support.  Use virtio-scsi instead when SCSI passthrough is required.
>  Note this also applies to ``-device virtio-blk-pci,scsi=on|off``, which is an
>  alias.
>  
> +``-device sd-card,spi=on`` (since 5.1)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The SPI mode of the 'sd-card' device is deprecated.

libvirt didn't implement this knob so it's okay to remove it without
replacement.

ACKed-by: Peter Krempa <pkrempa@redhat.com>


