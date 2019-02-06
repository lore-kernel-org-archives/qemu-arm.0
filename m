Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6033655wrt;
        Wed, 6 Feb 2019 06:57:30 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZjdZu0djvP7QUuqkt1vLdxBhvmMsxQVzlZ2gMCco+r5Gx4vFAH9/h2tTZqDmHC7zWv5UQ6
X-Received: by 2002:a81:6905:: with SMTP id e5mr8792185ywc.94.1549465050212;
        Wed, 06 Feb 2019 06:57:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549465050; cv=none;
        d=google.com; s=arc-20160816;
        b=w71WFM6QkIqCOi8A6glvFjHjgcWwmdqaVxJ1u3GNN1+Iuo4eu5RkCsLmBJr/4GC6UA
         Gv7q4GgwOLJcEHggTlM2YJnVaj6c1dKknR+Wgd0l3yo4JftfJUGmmWG6nwdQnuy8jKpt
         PtE7QNQ1uiVlATB6C2wagJrLanPuiEAzih+mcZSAR+ifVDnVl1aVCcloIuqy8FWaMADp
         XHkY6r/B/5+uMz8vgd94/hXJ98/8gQYAvv63OsvTMZz1PHKmNa0F3Gt/UoE7UxEvSus7
         U35Kz8z7HDfLynvhbpMw09ImCPBNXGkDIsVpNrOrEgdTq5/1PtnrKUcqgo4kVS6rAYmV
         0VqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=pqYsVZ9GZsTwZ8lZl1r8ZpQtxnpMPtaU2sWZF1OBJ5U=;
        b=MuLFjkvKwMBQqBvh5wtuWIXwHSD7cLA8ndurILyt8jGXilYX83IOehqFF2DJSAZnxZ
         6R6l8Q3PGMRPxkYw/3JzUw0g645TtIgZHqwwNPYl87OfWHhbj2byiL00u3eb/t4RY4Wq
         rig39jkSPmQ2TWMqF0NNF39GQPUf9eKT14nb/XkPLp9+pUu7fWkLS1Tyj3SnrIAlva9D
         PbdSvEi0Dq24AS/542MFa/Sn3VRml1cCSWPStMWH9nARWwBF0HtXvjini2JG2aphu8Zn
         IQvAmTCzmDuLfZrsS4U8aiX/BZaS6ARRQ+CKi5LVZDDPQAw8XWlo2EKhpfxw04Vt+fxW
         0Zeg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 81si3811325ybd.495.2019.02.06.06.57.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Feb 2019 06:57:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grOdl-0006ND-JL
	for alex.bennee@linaro.org; Wed, 06 Feb 2019 09:57:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOcd-0005pI-Uh
	for qemu-devel@nongnu.org; Wed, 06 Feb 2019 09:56:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1grOcd-0007AS-5l
	for qemu-devel@nongnu.org; Wed, 06 Feb 2019 09:56:19 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:41237)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1grOcb-00079S-AC; Wed, 06 Feb 2019 09:56:17 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1M2fM1-1gq1hy2uLf-0049ST; Wed, 06 Feb 2019 15:56:05 +0100
To: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
References: <1549371525-29899-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <36af6cca-59aa-3c6d-3be9-71c2e26a2135@vivier.eu>
Date: Wed, 6 Feb 2019 15:56:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1549371525-29899-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Ub6EC2I0ilIyqAn0RUrNgpTb1z33ozW7IOIYALXEm0ZJThraLq/
	NRtd7oOATcJQ/iBcbQpIiE+MAJTChUWUEFZJ+7XU5QcjUGT6VFwZBvTxWhrbtSsYL/uI6Hg
	pw79LfQgKW+Icc/meV6BhFpSOPDQI9dbSZQ/v0tmW06PCVr8jTnqNPZ/KF1X5jrZojxbNuD
	h/XqLco+FGE5m5ZWth2Mg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mafpiJHBWSM=:L8YGbHs3e6GNVGM1SQG1Uw
	hRu05vBEi5fR2+aYMyWldY0XyUgqb+WYCHZE3RHPAVleDC4zdMinWNPVJ/oKaENR/s+qsnEyt
	c44YsXtgQl32FVjxYS5lNooIJ23E5fFLFwKrUWl4vhEn2iTlfVFrrX3UmuhmuaKYnJFzITIbp
	vTqFJ9xvZP5JYnou0276cRcgCDSn9tyRVWJkGPnRKRGM1LgOeAsd/eIAUScnpwplpmUrXF3pi
	KAOEZdZ2loNFNXeG3u5OGknnUN1LCYFxSLP0M/NPsuNSmbSQ5smrXhrfvb2H3Z1T8BlTOdUvg
	3o1N7fHeV93IcB4KTckm7oQ88AQG8ZCI42OZ9/GXe0e2yxxrt+g4//XdGTZemAUJeG/YYCxRZ
	RrtCWE+GfhvBR6sxMSRzNZpYfwrt34MxViCgA0E04aFa+VcsTbjh56Sl0GMujP0J4YekZxHrj
	lT2oOpYIDzPnOSJDTQNBVrQjBaM3SJ2t72R99t1V+K0aAMh3+englxcqBPABIEvCZdnxKobUe
	e4rAYsW3qV9mpIQ4cIT1Lf/9X54zgOEB4960RlM2Nug3DhGZosU3IhiKOpwvNiqF/gSCeL+1O
	MRpKflZIL1Jbki5/YVyzXqqAJD25Va8zkfL9uraDsxeBs+XrKWOQlvUpWXOPJwe62JLnu7gwy
	5V3Na9oM1oDI74gM2U/t5yu7p6T2yvTm1maqOSTTbB+L5i7JvURL/kpG6b3rAKwt0l+seIuzB
	lDhNHfQkKPe1tFHECkQJ52p6GMTJ0ETMT+GjQR4eYqdcYmdLE3cEbnJFKlY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-devel] [Qemu-trivial] [PATCH] hw/cpu/cluster: Mark the
 cpu-cluster device with user_creatable = false
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4B0vluZUyrQP

On 05/02/2019 13:58, Thomas Huth wrote:
> The device can not be instantiated by the user and QEMU currently
> aborts when you try to use it:
> 
> $ x86_64-softmmu/qemu-system-x86_64 -device cpu-cluster
> qemu-system-x86_64: hw/cpu/cluster.c:73: cpu_cluster_realize:
>  Assertion `cbdata.cpu_count > 0' failed.
> Aborted (core dumped)
> 
> Since this is an internal device only, mark it with user_creatable = false.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/cpu/cluster.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> index 25f9070..6f5f037 100644
> --- a/hw/cpu/cluster.c
> +++ b/hw/cpu/cluster.c
> @@ -79,6 +79,9 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
>  
>      dc->props = cpu_cluster_properties;
>      dc->realize = cpu_cluster_realize;
> +
> +    /* This is not directly for users, CPU children must be attached by code */
> +    dc->user_creatable = false;
>  }
>  
>  static const TypeInfo cpu_cluster_type_info = {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
