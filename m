Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1018832lfm;
        Fri, 10 Jul 2020 12:48:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbs68OxarDGY7gTGZLxsljC70h2DIQJPpDA9dL6w71zZHot/pCBGoQj4f6/Rn8IVHtlSBu
X-Received: by 2002:a25:e051:: with SMTP id x78mr895524ybg.127.1594410521932;
        Fri, 10 Jul 2020 12:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594410521; cv=none;
        d=google.com; s=arc-20160816;
        b=WR1mrafT5ItUMJroQS9tuW7/bazKpbMnkaeh9/Fyqfxd0zOAzZ6OfAeG6MiuDeYQlj
         umrAtbH7UX/uKUmC9ukDT1Cr5i+puaZ6tcNy0TyS/0Bxv31bI3EwFt3qHH6UFtLtITkM
         j3j6kmoSNEIQvLwxciQ/PF+zUNRjzghQcw00s2PatAhi179cWsiNj2H1Job2bJHwIBk3
         nuv/Q8VnT5CXDRZuxjtWTN/8LXqpscFBtuBuBYbEQzLL++kS9uS78ap/V/kHxjprOus1
         iQhcYKo1anFz2oAbo1qSvXBGcHuhFEcFYzstmmlClaztTgCd30xPhYq/tNOTrNFWY72d
         uOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=Xvx0go4Jiy4z8hywdAJfzIOcIxJTgEtu7RtU/HnhQTs=;
        b=ksbgcT3vHscJQAyGHVGZYrFlKxGzwOqpmlszxNbSB5LHzDSnrZsv8LXs9cyB9u6B17
         e35WGIKdKyUQZ4WQ2F3rJxvrQs0Rt6jmCsLcOOR/j+Fam3IHW5OrbMg8g1YoOcQiNHD5
         ECweA/SdBYr2BqX0YEsz4rthjijdR8RRA0/Jx99BEJV61DtJuCv9XHDgOoOVLCHmDPhQ
         nvTPr7w4Qm2ZMbayyZXkxrLJNy0k8vhzJMr4J7lf4obnLD3nYOSsxE0RlMInlyhlVkFy
         KwxsCSH0/eSSIB76sHfzKsEO4SKyL30C8oxMHGSFZyf36JXL0Qe30sdqXMwDmnC+eYMh
         k/DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JPnlt06o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si6268457yba.121.2020.07.10.12.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 12:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JPnlt06o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtz0j-0001Ff-9f
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 15:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jtz0a-0001FW-No
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 15:48:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35358
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jtz0Z-0007e3-68
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 15:48:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594410510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xvx0go4Jiy4z8hywdAJfzIOcIxJTgEtu7RtU/HnhQTs=;
 b=JPnlt06oZtXAs8c99K58STkvU6NKDJqcGJf16qeoy57sCGvhIaEDTY09b6tfXXA4hCPJ+E
 vpdYKpDPbuXC0Ow3KYqNUfy6NERvug/q9mnCtn3xOhk1EaLs69NQ7TgPivBbEgnX/px7Qi
 KGxU/Tk4sk+sPrgn+EgOzNuQYkaS4wI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-yr5Xt0glOBmFliRxkZnheQ-1; Fri, 10 Jul 2020 15:48:28 -0400
X-MC-Unique: yr5Xt0glOBmFliRxkZnheQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 344831083E81;
 Fri, 10 Jul 2020 19:48:27 +0000 (UTC)
Received: from localhost (unknown [10.40.208.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7125F5C1D3;
 Fri, 10 Jul 2020 19:48:13 +0000 (UTC)
Date: Fri, 10 Jul 2020 21:48:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v5 18/20] tests/acpi: allow override blkdev
Message-ID: <20200710214812.69e03818@redhat.com>
In-Reply-To: <20200707125356.32450-19-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
 <20200707125356.32450-19-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 15:08:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FvIpv7ymwo/D

On Tue,  7 Jul 2020 14:53:54 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> microvm needs virtio-blk instead of ide.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index c315156858f4..24b715dce780 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -72,6 +72,7 @@ typedef struct {
>      const char *variant;
>      const char *uefi_fl1;
>      const char *uefi_fl2;
> +    const char *blkdev;
>      const char *cd;
>      const uint64_t ram_start;
>      const uint64_t scan_len;
> @@ -635,9 +636,10 @@ static void test_acpi_one(const char *params, test_data *data)
>          args = g_strdup_printf("-machine %s,kernel-irqchip=off %s -accel tcg "
>              "-net none -display none %s "
>              "-drive id=hd0,if=none,file=%s,format=raw "
> -            "-device ide-hd,drive=hd0 ",
> +            "-device %s,drive=hd0 ",
>               data->machine, data->tcg_only ? "" : "-accel kvm",
> -             params ? params : "", disk);
> +             params ? params : "", disk,
> +             data->blkdev ?: "ide-hd");
>      }
>  
>      data->qts = qtest_init(args);

