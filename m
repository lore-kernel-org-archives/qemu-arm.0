Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2084233lfo;
        Fri, 5 Feb 2021 07:02:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSf6RckIJqCyMk0NO755dY9ceqKs0+9RTjGXrYct2DjH6gXs+15IplIaGM2wKpaNlCIBXn
X-Received: by 2002:a25:6e87:: with SMTP id j129mr6619784ybc.364.1612537361734;
        Fri, 05 Feb 2021 07:02:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612537361; cv=none;
        d=google.com; s=arc-20160816;
        b=D/xl8PN9mHXKswblUxYayrear7BcJ9ZP9kIh7+55rjJaIWe1zeuTBZyvQvtRAIa2Qg
         +XauvCXRV0GVWsAaXr1ajA/y0vp/eL2k7q3B1bkWvon0iKZ+EeV95E9e6Xk2E7VTFS5E
         zfw3DQYwy0NeS0O1kgg+5hC7nlJs1+xK9JRU7jkK7VRHIzz0R5vkxzR+h/IsDng8N+SD
         9k1XTOpAUw3vnvk4OWt+zba/kD8t5c0dB2gKtpRvNTlmNsYqviFgptTWNRFakYDQPDZL
         ntNicLyhnlz3+RyJnp8ZKP/T24iwRhuINM95jmUeCEGmGYb47ZmMroS577fgRoRtGkzO
         7TZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=UG/9V8QHIhdE26Qnt1+gKN7s+Hn3t+n5dG8z2XlW+84=;
        b=TcDYq86qszhGcAV8DfvOHzmTO6hjysDpWYEi5GAPqMSERYb5eu02ERNUWIB2LLdwBD
         mgFDVC80CSdta53Cspxs1xD0UwWRFdMqZJjWlg/+GBdAeUFoJGdY1an5NxncuKkgkQRq
         G5hXNVdQBpMHGlmcTmrUHe78hsz9ogK2YIxgzm1yLqPUxBLEVt6A0IfdR0A09UFt0AdL
         GndcpLd6Q395dWslNKNKDrKT2LW8dsp++KgzCbjnLDb/6YHbuf0V4nsIp0L8nNxTZgtN
         qb8KMgrn+/LR2TlTSOk1d/4d6oHxjciMMby5bApAZDC/VqSUtRZUkhMQPVWu8Su9a8S3
         DICg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Il4LyXi4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si9974061ybj.81.2021.02.05.07.02.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 07:02:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Il4LyXi4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l82d7-0002Zo-3H
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 10:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82cx-0002Xl-6v
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 10:02:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82cs-0002GR-Ks
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 10:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UG/9V8QHIhdE26Qnt1+gKN7s+Hn3t+n5dG8z2XlW+84=;
 b=Il4LyXi4soOcHVPkDDlncw6icg1NHRwtFrq52HdSkZpnXxFyaDyEEl1t/6GrF8CFzT6b9f
 XCFLwkfKscLon6sydESBoHtGPkCj0jIvdRcIHbL8NEhYOYEqpvELuqg+8qjnaN3Y8RMz3y
 UR8vs8iS4gSTg5N9oqF05YR/dWWd1z0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-KdMPN8RPNNeNXGnRsD-h9A-1; Fri, 05 Feb 2021 10:02:22 -0500
X-MC-Unique: KdMPN8RPNNeNXGnRsD-h9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB34784E240;
 Fri,  5 Feb 2021 15:02:20 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58C3310021AA;
 Fri,  5 Feb 2021 15:02:18 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:02:15 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/9] tests/qtest/boot-serial-test: Test Virt machine with
 'max'
Message-ID: <20210205150215.s2i2okuv5xkh7wvj@kamzik.brq.redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-4-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-4-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +/UdMETBxHhp

On Fri, Feb 05, 2021 at 03:43:39PM +0100, Philippe Mathieu-Daudé wrote:
> When using KVM, using a specific cpu type will only work if the
> host CPU really is that exact CPU type.
> 
> During testing we can simply use the 'max' CPU which will select
> all the features available from the host.
> 
> This allow running this test on a Cavium CN8890 (ThunderX cores).
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/qtest/boot-serial-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index b6b1c23cd01..d74509b1c57 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -149,7 +149,7 @@ static testdef_t tests[] = {
>      { "arm", "raspi2", "", "TT", sizeof(bios_raspi2), 0, bios_raspi2 },
>      /* For hppa, force bios to output to serial by disabling graphics. */
>      { "hppa", "hppa", "-vga none", "SeaBIOS wants SYSTEM HALT" },
> -    { "aarch64", "virt", "-cpu cortex-a57", "TT", sizeof(kernel_aarch64),
> +    { "aarch64", "virt", "-cpu max", "TT", sizeof(kernel_aarch64),
>        kernel_aarch64 },
>      { "arm", "microbit", "", "T", sizeof(kernel_nrf51), kernel_nrf51 },
>  
> -- 
> 2.26.2
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

