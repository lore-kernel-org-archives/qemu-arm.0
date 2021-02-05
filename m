Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2103450lfo;
        Fri, 5 Feb 2021 07:24:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTs1mAq495G7XW8dql/SyZJ1FCbINQNXQsiewvU3ULe8MZ6gnTRzSLpd5AFNHbpCkiTMvG
X-Received: by 2002:a25:6a86:: with SMTP id f128mr7100556ybc.114.1612538678849;
        Fri, 05 Feb 2021 07:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612538678; cv=none;
        d=google.com; s=arc-20160816;
        b=cL06Ua2pgTAspaGCNZBiIoWF2SI2sWaQGLF+4ffR/N1OVOtJAvPdx7zHEYwqRXKgQx
         pZAv603rlWZDoX/8tHHKXUttp9+d2Q/uBhwf72YT6Eo6aky2aiTZHP4WQ0wDqbS3bKmn
         U7CiPrhv9WrdgEUUNqSLACm0UhGwGjRqyhGqoNChXFlTCBIuNubpKm/+t2YWauvT0dJ0
         Tfcs2lslVOueZFuYHfWs+JaOEjJT2NI/5gpzWtL03ZSw0bKrqG1prWaI0kx5wpxJbwSK
         IoVha3vFsUhn+x6AobtjvFjapFuYPFMDMSIeXgzVraxMQwTohxCvIPGWnsW/1ANpf984
         G/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=iqTAOZK9CE1PPCXsSwtDn6iyqomK+bZghLCsoaPe4GY=;
        b=z3jJ4Ig1IGHDnis6VqL/k1aSGYTTU8Y5zQEeS+/fcZAu9gx99+XEoNkElIlmY01P9V
         sczo68tFALnsrmxz9AKNF1MJ8oXulh1GgaodQzN8Gtozhkuh8U3bmJGTGSy+5JLHbRo6
         AUCJ6uqjmURGMpW4yqhhlia6YtTHsJP0AVfAaCh4+HWgvWO4vxq9Kn3PVhxM3dW4giQs
         IpYuSipCq0wk2GKFckW+c7s4JPLD+jec6hmbls7aVCUfLkYpToQ2CIojMF9QuynxKxd6
         37exV+SfK88lvxFb0dmBlJwPjSApikHVJaNH/U6sJ/aA9yf2EspRMRgO2VyMgIlmHyYU
         db7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ce1eEf/3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si8531473ybi.241.2021.02.05.07.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 07:24:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ce1eEf/3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l82yM-0004wO-88
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 10:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82tE-0005w8-9X
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 10:19:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82t7-0000tW-LZ
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 10:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612538350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqTAOZK9CE1PPCXsSwtDn6iyqomK+bZghLCsoaPe4GY=;
 b=ce1eEf/3R/Ns3iSeAqi6iZ8TvAsbHOAQLJpwYc1XOyu6Fzz+cdeTzUPmmVt39RMH2a75tR
 R9XoqctnKBJBaV7Z7F2SExJxZl2uUONHUDVnG6uxdvGbEPwcOSkBCsgVfNNcqmxQybB1Xp
 sPJUgOtFW6i/N1QV8DTgjIeQR5T9sOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-mRrzRsjhPtaIPrTZP-vPsA-1; Fri, 05 Feb 2021 10:19:07 -0500
X-MC-Unique: mRrzRsjhPtaIPrTZP-vPsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFE24100A8EC;
 Fri,  5 Feb 2021 15:19:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 694C219C47;
 Fri,  5 Feb 2021 15:19:03 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:19:00 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 8/9] hw/arm/virt: Restrict 32-bit CPUs to TCG
Message-ID: <20210205151900.7rqsv6evey6erfqh@kamzik.brq.redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-9-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-9-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-TUID: aIbCQlmrd95a

On Fri, Feb 05, 2021 at 03:43:44PM +0100, Philippe Mathieu-Daudé wrote:
> Support for ARMv7 has been dropped in commit 82bf7ae84ce
> ("target/arm: Remove KVM support for 32-bit Arm hosts").
> Restrict the 32-bit CPUs to --enable-tcg builds.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/virt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f5e4a6ec914..ab6300650f9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -197,8 +197,10 @@ static const int a15irqmap[] = {
>  };
>  
>  static const char *valid_cpus[] = {
> +#ifdef CONFIG_TCG
>      ARM_CPU_TYPE_NAME("cortex-a7"),
>      ARM_CPU_TYPE_NAME("cortex-a15"),
> +#endif /* CONFIG_TCG */
>  #ifdef TARGET_AARCH64
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
> -- 
> 2.26.2
>

So this filters the cpus out of KVM only builds, which seems
reasonable to do. Of course, if the build is for both KVM and
TCG, then the cpus won't be filtered out and we'll have to rely
on the runtime checks to error out if one where to try a 32-bit
cpu with KVM. But that's fine too, so

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew

