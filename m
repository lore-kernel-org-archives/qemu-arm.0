Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2849528njc;
        Tue, 5 Nov 2024 06:14:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVxu6YpGXxFkmuGPWxaNvprEN5xHrhWAO/gHUDjesEvqNHgNKOFVHGmHnt6QO1NwvvaWPnLNAOK1QNTIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGyCfXXAF2RAZGGm237NuL8HzhMtvIuUQEyg5Z4/nfMIvwizF5t/JWykL5vIxETMI1SDZ8S
X-Received: by 2002:a05:6214:5347:b0:6d1:83ec:32f9 with SMTP id 6a1803df08f44-6d351b20d6cmr247828606d6.35.1730816080451;
        Tue, 05 Nov 2024 06:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730816080; cv=none;
        d=google.com; s=arc-20240605;
        b=aImpUWeUfQsRvQa6jgHmIKR+q8mGCU2wSZxhmLiJ3/LFsgpha3AXH/HyiwGfTWFb1Y
         a+MsBlRqUb7wT9JdmDcVmEiB4FHYUi7/PlVXHWPcBQKDbNKw5TCCz+jswknN3xktTVgL
         4wWqqPJkdXRMzxWwSZPDbMdZpd0ql0uayy/JkXlD45InfmGOpDNX9W7MVM7atJx+z2al
         rSoyZlLXVfbdCpJu3GYtzcIbKlSAidmAnnSINh3zlTmVTvqpIIJQFPFqnQvBSs9rwywo
         QjpBkUBDce+o3CcCMgFaN3jC/8+l0lzBX8eKrOg7ETBt/gDgHG6WQ6gbRJc7Ynyqd3EB
         1/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:date:dkim-signature;
        bh=XwmlBMqKPjlHNdp9z7jm3VRik8MSS/vBHkdkLW5IyLA=;
        fh=vDt2tAnSauL46jd9IHShjTjOSYwG1bOsam4bHq/qpFQ=;
        b=O+h1+79WlMHyn0eXMkQ7Z1ZEMd+CUCuxZmEutEjQ3F5Ky/NP90URA9Yfkv6tl52y9F
         z3TdMGgoe6J4RS+WRPMYR8pY8FUtSS9mQs62s/3XBzqWgO48lhh+J4t7MUwg4w0ZCjVL
         oYLbI7UJPnjrjAfR5KRJ1OCuMt7FhVekdlopqBccNLbPgfZVxB5n5tAZg/zS2I3rOEbO
         5oyKczAi2xX2rTviSGxA59rsNUMcpQjs+9m48Appxit5NzogsAtN+vYf0BY5DF0+cDwP
         xdQPrdLAune1AgFPPI94LjJZ8e1hgATbk0le7rba8eIDEMeZh8Qv7+qWmKQ+ZLRQFxkQ
         rEjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=AtFlFOFw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3698c07dcsi93230196d6.428.2024.11.05.06.14.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 06:14:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=AtFlFOFw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8KJp-0001qb-DH; Tue, 05 Nov 2024 09:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8KJj-0001qE-Do; Tue, 05 Nov 2024 09:13:59 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8KJf-0003zs-HK; Tue, 05 Nov 2024 09:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=XwmlBMqKPjlHNdp9z7jm3VRik8MSS/vBHkdkLW5IyLA=; b=AtFlFOFwpdDKwV+
 luTUg3wV2Y3t1KPN7FG0rVnIrpqpNWdrBmQaHBQxG8XBRjl766dNlonW/WUG4+GlHRUCS4ZNTKO0K
 urodXPm59zcCFf2+KMKVTjd6siICr88b5s4Qq3Ug0VXjInPqxAxmkubCt4oEfKecIjqOV6plcA1p9
 VA=;
Date: Tue, 5 Nov 2024 15:16:31 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 01/19] target/microblaze: Rename CPU endianness property
 as 'little-endian'
Message-ID: <md5babzxm55agafiblwe66cmmui7vtkddxrxquhxmndrxfv3t6@zx5tweyq5gqq>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105130431.22564-2-philmd@linaro.org>
Received-SPF: pass client-ip=94.130.142.21; envelope-from=anjo@rev.ng;
 helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GhoOlTKptAYz

On 05/11/24, Philippe Mathieu-Daudé wrote:
> Rename the 'endian' property as 'little-endian' because the 'ENDI'
> bit is set when the endianness is in little order, and unset in
> big order.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/microblaze/petalogix_ml605_mmu.c | 2 +-
>  hw/microblaze/xlnx-zynqmp-pmu.c     | 2 +-
>  target/microblaze/cpu.c             | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>
