Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp575849lfj;
        Fri, 13 May 2022 15:22:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkO2pF45M7ii7hj791Q6VMBseKpB1bQImKNGGM48Em7nwXbGE2jjz8U3KaiB4jl6z1aFrZ
X-Received: by 2002:ad4:594b:0:b0:45a:9692:14a3 with SMTP id eo11-20020ad4594b000000b0045a969214a3mr6571143qvb.107.1652480557816;
        Fri, 13 May 2022 15:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652480557; cv=none;
        d=google.com; s=arc-20160816;
        b=wXC9C97mjjA81pR3b8PXzsVhq4VcnW4WumaW0uB7VhK9mJQPnBKuQ1Qe4AdShLAIb4
         ggVfb4aFqtWCWqDGxHct+pXDoEkDBYm//eRkzwHKM56/N4WtmdM9obKsby2jMcRnIfAI
         ZbCW/yezMZDXpQbcoYRtNdX5911YYjKNt7V6U/Ue74+pXMIPSmeIIjSuCHj1EwUJPMER
         7EQiSOkykpXuOoasdSxTiOCy4NufpXEUFPncks4XOXO3MoeRIxAJHBg4xdiNskivcYp8
         dyQUL+Fme98KHH6Db5u29VFZ4aZEeMhqvHYK8e+M2hyT5qbMe3tSJEjTVoiOzJT0Dp+x
         ruIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=daeFLf+AhaKwZp2OdaLLNRuVaf0ltxVYDfAY45oXBpw=;
        b=OlDShc7UHJsdFIi3JGKHijsRErpRkaJQi+jkXqlPDQ4Os81ZG0HSF+a8PkVZ8iMYeI
         8UOlqitLwVoTicgKD4+AJNndiRVW6dxZSHTDCAtyzjUSS6JYVQ0Tvv+CIonkgnLd3lo+
         fKKjP+V59aWipz9JRtfGTiMJr7zscH24fanuoAA14ot1QI+6S1D6w1m1HxDoYCcSxLW7
         5BEAxJpRg1MEcIalk61lMHedxXPtlfUXYBQ00x0qVAESL0IQ8SbhNXuxtJvfOyw2Sy11
         +7wd3PY5qG4QD7UqBidxRtMAhiKWJ3z8kvq/uXU6RHGkF9EqJ+/MBGMRxc7KWDrmbhLX
         iHUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bewilderbeest.net header.s=thorn header.b=OxIqojsY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bewilderbeest.net
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv9-20020ad45ce9000000b0045aa13b6d0asi2230940qvb.528.2022.05.13.15.22.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 May 2022 15:22:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bewilderbeest.net header.s=thorn header.b=OxIqojsY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bewilderbeest.net
Received: from localhost ([::1]:54952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npdgD-0001hy-Aq
	for alex.bennee@linaro.org; Fri, 13 May 2022 18:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zev@bewilderbeest.net>)
 id 1npd0K-0002Cq-4O; Fri, 13 May 2022 17:39:20 -0400
Received: from thorn.bewilderbeest.net ([71.19.156.171]:57271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zev@bewilderbeest.net>)
 id 1npd0I-0004KP-FY; Fri, 13 May 2022 17:39:19 -0400
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id EDD5AA21;
 Fri, 13 May 2022 14:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1652477955;
 bh=daeFLf+AhaKwZp2OdaLLNRuVaf0ltxVYDfAY45oXBpw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OxIqojsYQxbjfbJUKz7Xq9kXWARnitZSWMnfkPlnTXoidPQznkVJ3ruUpQ9mhoWvA
 ysPcYV4aG/xWUnPCmwnLmJiy7Ku+1DbuAmqLny4CDk2n2BAZGpcfAcGSPFL5XLLFsC
 UkZHK4JpAr6PL398IsdPAhnu5758mfa9c8tZV030=
Date: Fri, 13 May 2022 14:39:12 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Peter Delevoryas <pdel@fb.com>
Cc: irischenlj@fb.com, patrick@stwcx.xyz, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org, openbmc@lists.ozlabs.org,
 andrew@aj.id.au, peter.maydell@linaro.org, joel@jms.id.au
Subject: Re: [PATCH 0/2] hw: aspeed: Init all UART's with serial devices
Message-ID: <Yn7QAJK7jnE7kz9T@hatter.bewilderbeest.net>
References: <20220513040220.3657135-1-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513040220.3657135-1-pdel@fb.com>
Received-SPF: pass client-ip=71.19.156.171; envelope-from=zev@bewilderbeest.net;
 helo=thorn.bewilderbeest.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 13 May 2022 18:22:28 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KCOO4pGfHLN7

On Thu, May 12, 2022 at 09:02:18PM PDT, Peter Delevoryas wrote:
> CC'ing Zev and OpenBMC since this was motivated by a problem Zev had there:
> 
> https://lore.kernel.org/openbmc/YnzGnWjkYdMUUNyM@hatter.bewilderbeest.net/
> 
> This series adds all the missing UART's in the Aspeed chips, and initializes
> them all with serial devices (even if there is no peer character device provided
> by the QEMU user).
> 
> This allows users to quickly test UART output without any code changes. In fact,
> you could even connect all the UART's to separate sockets and check which one is
> emitting data.
> 

Thanks Peter -- I tried this out with an ahe-50dc u-boot build (ast2400 
with stdio on uart3), and with

  -serial null -serial null -serial null -serial mon:stdio

added to the command-line I get the u-boot stdio and the qemu monitor in 
my terminal as expected.

Tested-by: Zev Weiss <zev@bewilderbeest.net>

