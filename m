Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2709695lfc;
        Tue, 26 May 2020 00:23:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDMYMHE7jgWW6Btv2GmGwVghiMPa6Yhbvu7QgsAS4I9KqpHLip0acAfK+temPJjnCW0hE+
X-Received: by 2002:ac8:44b3:: with SMTP id a19mr11224qto.285.1590477811593;
        Tue, 26 May 2020 00:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590477811; cv=none;
        d=google.com; s=arc-20160816;
        b=Wac8g/C+BV7Ryse5WI+P4BJ2EPoQHl3cHBQb3twVJRbxrc+RrXMHqEIz5ZBkVVkWVm
         G6/RK/jNeR0/Qir7pkqSF8mFi6en6XsFkUbWdkozx3Q+XnyJ0O2QCRHaRZkbl8bGryNR
         gigEbEH8APcW0z/vVRUpS0UdrFgkp9UIbSA+jDOC96KmLCkcCDuDuh6V6JYpSSdBYAo4
         9P8HGIx1sx8mw+X/wisQqEApaHhD73wZGsefplWXF3T2++UyWGdinCiJmLQqxmfc9UIU
         bQPAGfWu9VjsqUR8uJf5OysAdAlOTBM+Id9ZaS2FkYOBliVeTs0NmMgfGzR5jyX68R6G
         gzCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=Af9OWCxiLuUmfuDth/SgRGvS12HJr+d02hiZGS+ph30=;
        b=H0OoW81h7zsnlIqlwci65eKRZ/om5Y9o+SZaIRv1mV7jKMfjikzcLAAzTppKtzFdg2
         3gy9XodWfKFZy2oIzDdYDWCE+Z/jX2JgJITlX7ZuvhLeejCwYUcNorjyU+7KvM5CQJOR
         ZcAesDT7MolCOwVSk6MeXyngu1xLuADny3Vd0MzizGjpEleDBoAGAd0nEYawf4Oly3qN
         Y2c8yDA9PbJkluI649QbQRV7n2Goew/lXQXZnY5Qw5zxt8UbspU8iV7MXvZZ6+Ze95WJ
         2zPgmjN8NW/nnisUGfP89GAkgsKmz0Al9do7pjtppUuKv+iNZ1KuoFtYlv4drx/VdhRb
         uJ+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GGEq8V8S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si111101qkj.46.2020.05.26.00.23.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 00:23:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GGEq8V8S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdTvu-0003a0-Uh
	for alex.bennee@linaro.org; Tue, 26 May 2020 03:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdTvo-0003Z7-9t
 for qemu-arm@nongnu.org; Tue, 26 May 2020 03:23:24 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42280
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdTvn-00057y-MM
 for qemu-arm@nongnu.org; Tue, 26 May 2020 03:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590477803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=Af9OWCxiLuUmfuDth/SgRGvS12HJr+d02hiZGS+ph30=;
 b=GGEq8V8SRc11T9emou2p/dkgR/xCXwzG7vQzRN97DPG3L62V+WFxYZTYCvXvtFtmoTBXsQ
 0hgd4SQ2x1l0F7Rxjs+2wL3OTyrQayOOJ5VZgljWcOBad+A8jYF40vQ7zOhar63w2LLJS0
 2x8RTYLrISZhzSCQRAQg59Z5t43QzlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-GsmL1c1LPqS0E2QZTHrncw-1; Tue, 26 May 2020 03:23:19 -0400
X-MC-Unique: GsmL1c1LPqS0E2QZTHrncw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 263E1107ACF2;
 Tue, 26 May 2020 07:23:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-138.ams2.redhat.com [10.36.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46BDE5D9E5;
 Tue, 26 May 2020 07:23:15 +0000 (UTC)
Subject: Re: [PATCH] hw/display/omap_dss: Replace fprintf() call by
 qemu_log_mask(LOG_UNIMP)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200524103833.8188-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2b9ed3fc-2f57-7202-0c15-52de18fc890c@redhat.com>
Date: Tue, 26 May 2020 09:23:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200524103833.8188-1-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 00:48:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d0AyFwGBrs6T

On 24/05/2020 12.38, Philippe Mathieu-Daudé wrote:
> Replace fprintf() call by qemu_log_mask(LOG_UNIMP), which is
> disabled by default. This avoid flooding the terminal when
> fuzzing the device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/display/omap_dss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/omap_dss.c b/hw/display/omap_dss.c
> index 32dc0d6aa7..21fde58a26 100644
> --- a/hw/display/omap_dss.c
> +++ b/hw/display/omap_dss.c
> @@ -619,7 +619,7 @@ static void omap_rfbi_transfer_start(struct omap_dss_s *s)
>      if (s->rfbi.control & (1 << 1)) {				/* BYPASS */
>          /* TODO: in non-Bypass mode we probably need to just assert the
>           * DRQ and wait for DMA to write the pixels.  */
> -        fprintf(stderr, "%s: Bypass mode unimplemented\n", __func__);
> +        qemu_log_mask(LOG_UNIMP, "%s: Bypass mode unimplemented\n", __func__);
>          return;
>      }

Reviewed-by: Thomas Huth <thuth@redhat.com>

