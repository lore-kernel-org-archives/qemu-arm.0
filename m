Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2093808lfo;
        Fri, 5 Feb 2021 07:13:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiLybgO4UFpG84M2gxhWJf/BAeJfbL5cb0ka4LfHKP/HRtJ5MsFIITMXPu3a0RK1t5iz1O
X-Received: by 2002:a25:9105:: with SMTP id v5mr6717381ybl.249.1612538000150;
        Fri, 05 Feb 2021 07:13:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612538000; cv=none;
        d=google.com; s=arc-20160816;
        b=lPnRKqMfjLnsLCycUxD3+oniQIEEZrGNima+XXNkID5D8uClus33yFAJfMZXwmHdlX
         UB4soFPThRE6ji8TSv3tsge9wUUeRiaI29cAjBT0TQr+ToPuRvdmL8ExhAk5QFM1w9lK
         jIzGK1BLy72uaJdwxkmLq0MifaFdPIZDz87PUIrOtfKOIbyToBRJFryY7T0Xtd+JkpCG
         OPzJGdFwWy+m+J7/fVfYCiPFloPjaN7o6K873kV6vaXjYYPLY/zTE1UicEf6yAzMjkng
         l84KdDAMPrNDXxdslPqDNtPeNJ0SvNwGzgEbhOV2jUO6JxMSfdAw0KSv/G0bPoheiVHy
         X6UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=IkVz/q7F390OzU0nQyus8+RhLQiZF8nxp50I9ggfz3U=;
        b=qG3863n+pNHwMintW32uca7c+OXzej3uTlGKYnMs0ydiHv9qgz1o0OxCGNO3sRuAQl
         MJlDtKhizRa5QA9fowTNdp5s3nLsX4/D9Rp7xxWAfGeHP1EOtqyi6avdX9X+GXjzwDcJ
         f/5sje/tnxY14qPhd6b+nBjMigdpI5vOlWoshH43pMgu0zfnUtHRTJNA10gd7wcy13F0
         rBLBB6oHT2lkZbgJQ1GwoKzAoJ6uxSQ4xfVmPcT5otzsA4GfNAi5vTvCgmUiR08yoafO
         cYv8nmn7kU4LGENA/TTZ81YYHv1Q8xLfivw5tjUri0ZOjmD9rPdaw3hraAAjyjAxcYMS
         sn8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZyayGM5x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si9102296ybj.393.2021.02.05.07.13.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 07:13:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZyayGM5x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l82nP-00055g-ID
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 10:13:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82ig-00009g-4a
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:08:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82ia-0004kn-JV
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkVz/q7F390OzU0nQyus8+RhLQiZF8nxp50I9ggfz3U=;
 b=ZyayGM5xS7sKFYTGdKd1Ck8R1d9IQF5KM4FUufIHo/SH6wRY/m/vlxOflK4PcSyl9G8X5G
 1hAc/ng8EhCQlbDeSfVvcp526MVy6aOObdv+wAcS3WKCMdzbHkI7V04X/71S3OIGIx8iSn
 vEpvQsbalc3CYzsI+yA43fbvqa6+jyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-uv270cA7POWr8P6RBEvMJw-1; Fri, 05 Feb 2021 10:08:17 -0500
X-MC-Unique: uv270cA7POWr8P6RBEvMJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F63DC73A0;
 Fri,  5 Feb 2021 15:08:16 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03BD919C47;
 Fri,  5 Feb 2021 15:08:13 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:08:10 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/9] tests/qtest/cdrom-test: Only allow the Virt machine
 under KVM
Message-ID: <20210205150810.feuywlyy7xav56di@kamzik.brq.redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-5-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-5-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4CEFKiMhb0ff

On Fri, Feb 05, 2021 at 03:43:40PM +0100, Philippe Mathieu-Daudé wrote:
> Only the Virt and Versal machines are supported under KVM.
> Restrict the other ones to TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/qtest/cdrom-test.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index 5af944a5fb7..ac02f2bb4f1 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -222,9 +222,12 @@ int main(int argc, char **argv)
>          add_cdrom_param_tests(mips64machines);
>      } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")) {
>          const char *armmachines[] = {
> +#ifdef CONFIG_TCG
>              "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
>              "realview-pbx-a9", "versatileab", "versatilepb", "vexpress-a15",
> -            "vexpress-a9", "virt", NULL
> +            "vexpress-a9",
> +#endif /* CONFIG_TCG */
> +            "virt", NULL
>          };
>          add_cdrom_param_tests(armmachines);
>      } else {
> -- 
> 2.26.2
>

Don't we need to use a runtime check for this? I'd guess we can
build a QEMU that supports both KVM and TCG and then attempt to
run this test with KVM, which would still try all these other
machine types.

Thanks,
drew 

