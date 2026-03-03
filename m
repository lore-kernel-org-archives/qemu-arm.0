Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDD3EDA685
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 15:13:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxROS-0007EL-NU; Tue, 03 Mar 2026 10:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxROO-000778-65
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 10:10:36 -0500
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxROL-0004AJ-K8
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 10:10:35 -0500
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-64c9f7576d4so4150914d50.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 07:10:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772550630; cv=none;
 d=google.com; s=arc-20240605;
 b=Y9BtcJH5xWPOFaIpQ8ILXwOmKhov+4XSzWXOUpOJAd/RGsh7T13wyNHLfQbrOhqtpp
 xGX+St57H7NZt9x89SR6EWrvBh2cRC4pp7/DSezMUc9wD0Iu8z7hymuU8P4oW2YSAL3n
 Qs1S62leeKfg4I3DBsDs0+YmD8NEmK9ZpKpQBSm5TFwvHyfl2vgv+fZbkOXwaXmv+aOy
 OEeAr+GLKkhjZeFyjtp3cSCF+2M9SJTjUaUOMswc1j8F7/1Sy22of//GCp9hwp37RAPa
 HMlzOhgNdypYP4uNTg7anFKmJrjm3P4FBgw3UwSWitjawm92qXY3ElheK8uBOPLb4mYr
 KyUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8y5OIp/jfVpXibTs0NlVeqzjri8nP7FS+PuUPn0XIIQ=;
 fh=/hf0hetEZXP/P1XAOZvWalDLY0/dJNc1gfDUbWL8iNw=;
 b=kAyD3kc3ba0zMwZ9VKDWpOpxRibD9jeQc/FidRn9+VLTrXF+YIHFRWQTvmmOB3VnT+
 /TXzsCyVtHjH0IuXX/6RKmGepws852RVQKzFP8UVN9hZjfWVw6KpSNuiipG92KxQb6Pi
 XsWDfz0wt6E7EDNFdfcbuQMW6toVLckYLujYzgwE1GkDfSY0DiJ/0rVuCz2fsqcTgh8K
 sf6Dy9FQm+eTyR4gYysEODNq+B7imQS0jmegJXLvWxojMosfEehLY7EMTQL045bj/zOw
 lp/WiquUdEyrk5be2LxSKCP/mg+ScblGWjEcpYUj5cPc/Ebs7gdduYlfQDH99JjAHRAX
 vV3Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772550630; x=1773155430; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8y5OIp/jfVpXibTs0NlVeqzjri8nP7FS+PuUPn0XIIQ=;
 b=T0KWbHBtWFKKzbQvU6o8eYpf0CqqKGHMqCoj2AdBbh/t0/WuoLI6ha+/ek9wfugoHT
 MTjKsJFU9ouxRul3FkLDz+Z8nwU/yymXytz82DJwDh5Haz1FfUP1zkCTIW0RAR9rfkNg
 x+mbtZkcr1834scNJAIUlbfewdtxAJF/zypdq6Z3fgqOeN42SKY78khierhk83oy8SSp
 espCczTr+m70KiBcImjUFsfFzFF744LhC1Vv5guXJzmbV8xMeMgdHovMozQKSyIyPHn5
 oiFjfX+NXdCqbWBBFBZOaWo2lfX2/0agg78ALxMd0IyhFCF+LT39E2jYugHa20MkeBlh
 Z+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772550630; x=1773155430;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8y5OIp/jfVpXibTs0NlVeqzjri8nP7FS+PuUPn0XIIQ=;
 b=d6qzVTHE/qBpSdtWIGR9FNViMm4gyOocE5/wR/oaKUkLbSalQFC1p3kd7C6XJ3BDkr
 NDmkptVFUhHOwmhQCCE6UcrsJ7STfNV32Ds5CqbuVF5VO+RiSAHF7R6hWc+SpRN2jaUX
 y27y8PeRGbS1rOTDrkXI8wzdoBMC1KLWelkx0G9tZnxgFYVKan+3WA9leLLmHA9AwUM6
 E7k90LY1+BzbwWh98U09C2jFCK7PsAuQ/rahdHPb1kB+BJ8bBz+HxRbpdYsCswIe0Lyu
 jLQLX/Yd1tRE3gv9Wg1EQDOQ/SDdrUOjA9kky6wO1mkTrEybIia+ELsuaqYYW8eUIRyY
 Zafg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyurwlFwtKmokNshCKhtvuiBeeGT8w4eyPSxae2VU/4RoY0nQFsPMWv1ahwc+9DuZ7r7HWvJuhRA==@nongnu.org
X-Gm-Message-State: AOJu0YyS627u670KKe6jOOTwm4wb2BX8ppe4LlSkDMa9GqqduzHbQpow
 C+ItfTEbtSuCnUyl6SAeGWd/tJAadS7RXFyKY3e+ivdq+nHV5vHPqOM2nFsEBYOkilh7VGJtmUQ
 TYw6WSANEdt7eJ+hDTZEV3Qg3nN9IGHROBtmhlZp2ldfqp7EvqeGU
X-Gm-Gg: ATEYQzxRszTs+eY/q6saPFO7+LUa/jr+c4Xb2zKvoCaO1JqTjHGcWYPie0ZoOd+UzsH
 mFdRE5eLbcQ+YLewtceavitsFNWkWUn6uDnP1d3InXLzo5S3ptvTWKfGQe+KSJB0p+cIpFoUu7G
 Wp0JzhKJEhyvPeAqS+lQ7hEss7lw7WCfs/BDWwlCVaNTdSd/mkJTEetFdIHGzPTVbQ+f/x+PqvN
 Ap5hH6di6r+Oa8qnCgf3zfNfrDu4VxproBGeW35q5ZUVLSCD+XWzXEgSSFsE8XuTHGUHg9x6SO1
 8WH+k1FwxorI/bqBh2nEU2UIjvlkWv4c6RzuUj96XRtpgdlCm1CGbFMwLQ56rrihhpJ8b9IlWqW
 N8A==
X-Received: by 2002:a05:690e:1c1:b0:645:5d39:2547 with SMTP id
 956f58d0204a3-64cc22feb5emr10715420d50.72.1772550629963; Tue, 03 Mar 2026
 07:10:29 -0800 (PST)
MIME-Version: 1.0
References: <20260303143928.1747116-1-eric.auger@redhat.com>
 <20260303143928.1747116-5-eric.auger@redhat.com>
In-Reply-To: <20260303143928.1747116-5-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 15:10:18 +0000
X-Gm-Features: AaiRm525iwMLvGJFOu93Lp65UeY3xTmh-HZgxGu2VIDbpu-HihJykayJc_1JmtM
Message-ID: <CAFEAcA9LoXOnu9iYk76KA+rH_9VAF7g2HYS=iRA6B0cd6SoRLA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] target/arm/kvm: Tweak print_register_name() for
 arm64 system register
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 3 Mar 2026 at 14:39, Eric Auger <eric.auger@redhat.com> wrote:
>
> As opposed to other register types, arm64 system register decoding
> is not introduced by any 'register' mention which can lead to
> unfriendly user-facing traces.  Let's add "system register"
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  target/arm/kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index cfb46015d48..43dab246097 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -921,7 +921,7 @@ char *kvm_print_register_name(uint64_t regidx)
>          case KVM_REG_ARM_DEMUX:
>              return g_strdup_printf("demuxed reg %"PRIx64, regidx);
>          case KVM_REG_ARM64_SYSREG:
> -            return g_strdup_printf("op0:%d op1:%d crn:%d crm:%d op2:%d",
> +            return g_strdup_printf("system register op0:%d op1:%d crn:%d crm:%d op2:%d",
>                                     CP_REG_ARM64_SYSREG_OP(regidx, OP0),
>                                     CP_REG_ARM64_SYSREG_OP(regidx, OP1),
>                                     CP_REG_ARM64_SYSREG_OP(regidx, CRN),
> --
> 2.53.0

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

