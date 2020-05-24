Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1172195lfc;
        Sun, 24 May 2020 05:43:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNn0GGx2qCnm4nhdNSroMz40OwKXWYQ+aRAyFqaNj7fbb7RuwVI8L+xFa/QGQtHihX4Hk8
X-Received: by 2002:ac8:5648:: with SMTP id 8mr7967183qtt.280.1590324184029;
        Sun, 24 May 2020 05:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590324184; cv=none;
        d=google.com; s=arc-20160816;
        b=zN+pybWKGqkdX138H95jKeHkQIL7dGFDeeKsPhyJq4YIh05VHuTjnRwXqiBVsGWJT8
         dldiVaL4j+QsTmrC/x07VBCpZAsNLqssduKK+6yIvZtHOyEmPgKyXPyrm0HAvSHAqKnS
         gshdggBBBQbkjioDxWSToFfVA2tSLrr9fJsPTu9WBIuq8IV9vzG6RSB22VzZdLepCBWz
         fEkyxh+PjM/yeYTyWYip7vd/VFFA2XHcB6m1IV64yzhFXG4UhXvYSda6q1WhZPESzmn1
         f6AAMz2OikhVDFZVR3iK5/UYDseex/ZEIUY0WGVeAaT6uFtnlAJVxCiYrOojNk8Gz9eA
         M1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=Uw1HvwwEAJEnEY20vEQuGlBWvkW2Z7Tx1UBWJvtRoE8=;
        b=ytewBOfm9P4gja43/UzdGQ8DLlCWqmrgbHJ6jacV+xO7QvHId/GEDr27AXCIaAoysJ
         DGlOMhkrB1CJAWaV3VVV0RtkVYziErMPtVi7pgA1iUTzH3W3s2RHOunduKAkp/t20Sj7
         u3T4Ml6xNWp6lsbzWioSJ6I93s825vSiNfZP0Hp3Qa8qZDX/sM/5p3WoaXVIu/RG7h3D
         e4hvBmyQchOQV8O5B5OoieXPn8iG2Wb0ewvfhr1AWmicoemjzzAIqnABrE7eORKFp3q5
         7Pm742HQNNCRdq7YDQ8rjzuHDqebF8gn4S/GoUMQn9LFyw6/3YpL/jT9S4WR/SPscYBz
         OYUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si7165769qtp.284.2020.05.24.05.43.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 May 2020 05:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jcpy3-0002D4-Fz
	for alex.bennee@linaro.org; Sun, 24 May 2020 08:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1jcpx7-0001f8-3G; Sun, 24 May 2020 08:42:05 -0400
Received: from relay68.bu.edu ([128.197.228.73]:34029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1jcpx6-0006f5-2h; Sun, 24 May 2020 08:42:04 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 04OCfWig012398
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 24 May 2020 08:41:36 -0400
Date: Sun, 24 May 2020 08:41:32 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/display/omap_dss: Replace fprintf() call by
 qemu_log_mask(LOG_UNIMP)
Message-ID: <20200524124132.dri74sl5iei3aaxl@mozz.bu.edu>
References: <20200524103833.8188-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200524103833.8188-1-f4bug@amsat.org>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/24 08:42:02
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nb7lFoQDeipU

On 200524 1238, Philippe Mathieu-Daudé wrote:
> Replace fprintf() call by qemu_log_mask(LOG_UNIMP), which is
> disabled by default. This avoid flooding the terminal when
> fuzzing the device.
> 
Hi Philippe,
libfuzzer also lets you pass -close_fd_mask=[1,2,3] to close stdout,
stderr or both. As a side-effect, In this mode, libfuzzer will write the
crashing stacktraces to individual files ./.$PID, instead of to the
terminal's output. As far as I know, closing the FDs doesn't bypass all
of printf's allocation/formatting code, so getting rid of calls can
still be a good idea for performance, sometimes.
-Alex

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
>  
> -- 
> 2.21.3
> 
