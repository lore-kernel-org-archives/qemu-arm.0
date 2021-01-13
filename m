Received: by 2002:ad4:4a74:0:0:0:0:0 with SMTP id cn20csp21565qvb;
        Wed, 13 Jan 2021 05:37:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfAdfutcHI7CffwmIdFRjiDk6q1tlQpO/tOzGwliqHDKKHzODEh/6MCf1QKu6EOQZa90Ix
X-Received: by 2002:a25:9882:: with SMTP id l2mr2973211ybo.425.1610545061077;
        Wed, 13 Jan 2021 05:37:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610545061; cv=none;
        d=google.com; s=arc-20160816;
        b=g+rssqUew9C24Lo8qSwZlHqYMK6NsH8mkO+gVPVed13iexstqZJuZzkVMvT1ISv+J9
         qvI8ridCb7aRosj9L/VcsrR/0cwfGdhCP2vtwu0AoCXEF+KT/KVvIMYVUceH5qToxTyJ
         3fOhCjlk4NGSVcm3LMTuLL3bWFv5Lh5yRb3AyIULk0f4ewE+gz0XE3vZT9tQCumin664
         B9Zi0yAPuMlyhEKjbhWrdGYS4k6dHMAdMUjSeQksdo2kUF9LRhmPcn5L7GcvWgM2zvLy
         y7ig6lOuSh9yyoNuepza7qPJPzIPeFo2RoHpBBOIEUpYRLY8SrZqy+k9JV6JSDlMNMOY
         2Xpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=ozCjCj0KoOgE4Zaz1sfJqi0oRDqpyppOnSMefLyC/cU=;
        b=ACBixnEV6ruqzQoWaku/4Sd2FLUPJkKQY+IRVjyetrg58havhSfbR/6pIMfb1ucZfF
         yv7sTfDvIO4SYtqNoJ44atvHKEx7Adq3yyMiLO0V00AVNrj9MR0bMr6xd/PZ15DFOggp
         4L06QtDw3enUEkc5rf2ch2Ftpf1f/kH131XANUTVX1Bzw80VSCoBDgEpIU1woZBQb/BP
         a4Xxr84chPkjLSJDuNtPBe19yuW9SuyRDfQaPtO8jBVbqxlY5z1WrRgsJZvdDcrSH8Tw
         kSKL+SXElpPO7gdO4Zwk0n9RV9bHKke438aufvfefmOHLQmJAsz2yYTK7XX+KIy7fpCC
         CQOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YaSgPTte;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15si1965298ybe.101.2021.01.13.05.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 05:37:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YaSgPTte;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzgLE-0005vI-F5
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 08:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgKa-0005sk-06
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 08:37:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kzgKX-0007tb-47
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 08:36:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610545016;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozCjCj0KoOgE4Zaz1sfJqi0oRDqpyppOnSMefLyC/cU=;
 b=YaSgPTtegEthDO5gQzzRasQbSNeCggUu0BTrRNHFnKKbdVcLk8IgtWvJCQIaGEr0pa0rBo
 1ybp0pjzCY3vl1ZRoph2uElubYQicpoJydmsWmW+9yf/ENDqpTpH2E7rLUm6B1TrEcsvH6
 M2GxIfIhZsSK3IR39dRoYIbNKrSh+W4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-VpiulcFbN1a9QHVmlVpCgQ-1; Wed, 13 Jan 2021 08:36:54 -0500
X-MC-Unique: VpiulcFbN1a9QHVmlVpCgQ-1
Received: by mail-wr1-f72.google.com with SMTP id e12so976413wrp.10
 for <qemu-arm@nongnu.org>; Wed, 13 Jan 2021 05:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4vGOXvngMiIHEkvOxc0i0Ro7ST82YJ/WLMStNoEm3DU=;
 b=j9dTECtvK3R9rQSaEMi0c71T8RCW9CtpjFHnSaK/CtmPnXZ2UMHu4udfS90DaX3d/P
 dA3Y1E8cMlsOUsxrVpp/spvZ5oJJ0tQf2K7uvOsrOYcfAkWJDDKRYkKwh/uzoRAs5VfJ
 BaLLGK8uL4LzWH2DAMO3dMVM40I06sdH9zsWlMZD7IhXSwao5/QtAKWuXGUJfBMxaTvs
 lXqDhcFz+mms/7AU4FVjr8+lI6qHv1Shtk2MiNl+GF2Ts1/gPfr8wC0XDhUJ0VO+sI6l
 pxUdgfcy34/FhefZrvOTIBEBJorjNnF5KHeg5vkmRXudEKGgIf83SQSwVSis1BZqpI0g
 +hUA==
X-Gm-Message-State: AOAM533OygE6nqXnf00NAdnL6poleNj7mdqeY72PdVMLKVcfHiCycSK7
 53rES9Bqe+HX4WUQGY7BrHvSDuN0vvsvM5M5OIflDoTqxESK1YQhCN2lSLgVnXuWe5nQTylXhps
 +Tql82351gOur
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr2248423wmj.146.1610545013346; 
 Wed, 13 Jan 2021 05:36:53 -0800 (PST)
X-Received: by 2002:a05:600c:21c8:: with SMTP id
 x8mr2248404wmj.146.1610545013163; 
 Wed, 13 Jan 2021 05:36:53 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id l8sm4332932wrb.73.2021.01.13.05.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 05:36:52 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v6 03/11] hw/ssi: imx_spi: Convert some debug
 printf()s to trace events
In-Reply-To: <20210112183529.2011863-4-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 12 Jan 2021 19:35:21
 +0100")
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <20210112183529.2011863-4-f4bug@amsat.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 13 Jan 2021 14:36:51 +0100
Message-ID: <87mtxdgdqk.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yh4eCs/io4y+

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> Convert some DPRINTF() to trace events.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

> diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
> index 612d3d6087a..20fcaf32df6 100644
> --- a/hw/ssi/trace-events
> +++ b/hw/ssi/trace-events
> @@ -1,3 +1,5 @@
> +# See docs/devel/tracing.txt for syntax documentation.
> +
>  # aspeed_smc.c
> =20
>  aspeed_smc_flash_set_segment(int cs, uint64_t reg, uint64_t start, uint6=
4_t end) "CS%d segreg=3D0x%"PRIx64" [ 0x%"PRIx64" - 0x%"PRIx64" ]"

Not that I am against the comment, but it looks spurious on this patch.

