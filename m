Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp694413ejb;
        Sun, 29 Jan 2023 20:17:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvyaMOirn8aS2nBX5uFMgciuza8CpJeXGJt1yiB6tdrXWyti2/sF1Uu/1Hvl1YVzB2aFzbz
X-Received: by 2002:a05:622a:5da4:b0:3b5:bd73:12bc with SMTP id fu36-20020a05622a5da400b003b5bd7312bcmr61332225qtb.42.1675052235076;
        Sun, 29 Jan 2023 20:17:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675052235; cv=none;
        d=google.com; s=arc-20160816;
        b=EtGDYWtSyCV3LoP2WJuK+VmsRZ0MTr/nqFXfP2Avc4zmdQ9oGFj3INKyRZ3mrE8LMO
         ci7rw3wIacsSQxDL1NNyroaphmy47iYmI+g7P8rf7IufpFexyCwImnB8qGrtJPQtsM7K
         n9MZeUJuiNf4NhAfxUgyFwm6DeDFHk6bd960nv5gleJWv5XUE9oIUdgT4uIww0gP9D1D
         9nj3x43NnLdIRa50gkFD9lNg5RPYheomEL9l6rOE+ASRD9EABGaGBxGMLMTOR7OOt+NJ
         4RW3Vd7mzQ3ymonv6lRiJLtnMCr7/lM79FJWWIMNQ6R9XAwDH0XAj+msvsPXbnoQ8bCD
         j9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=gU8adfAwuLfc26sqIh9pm7Jq7Iesz802exA5x/kmz6k=;
        b=UIf7JJkeQOayWxzbUY6LoIpY8lxsaUMD9pNhQn82WmmFMX9NNsQ2VJEdO6wwBkhp/A
         VUgh4UZYq9hBKAfuv6iiP7Z7RULsU06d1iZ89ZhmVthpOPW02M7BrZ/PZDexFHZJUQAS
         qTxly0DPW36r3KgZzo+MDvI0BwS3zUGo9jfAWKN0zDkM1/yFeh+5ZkBpuwbrd7Wezp9p
         T+S2B08Cc9QiTTBms6Oqhz73jzA2BD9+p8sZRzKdzSVTHgA8v2jVlT0q2kvDndT+VF4k
         7Ft5StAEvxCeXVmA2grDj+YLxFWWt9Czy8haH4cubTmLMRnimGm2Zl7uUbQzqU+PqgZz
         pbcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aRGJvA3f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17-20020a370411000000b0071fb4224ca6si814776qke.683.2023.01.29.20.17.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Jan 2023 20:17:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aRGJvA3f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMLbL-0000c5-I6; Sun, 29 Jan 2023 23:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLb4-0000aY-Pf
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:17:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLb2-0001iH-AM
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675052203;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gU8adfAwuLfc26sqIh9pm7Jq7Iesz802exA5x/kmz6k=;
 b=aRGJvA3fWmQDdzuKL3OMOhexSPJrXqXlj+FWit92ZC9ZCEhJBaY1G1cBQ7Je7Hix2kiMFc
 Bxp4rSJNGLF1Yi6V0xhH/GOfV89XmVhX7aAt8z4Hi+VylS/xnUeHFPN4sOIpzHKzItuTNb
 gQgrsQlMZ1IKRcsQQmZVlusDueMCusM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-arsEsk62OCSb7fAQHD5g1w-1; Sun, 29 Jan 2023 23:16:40 -0500
X-MC-Unique: arsEsk62OCSb7fAQHD5g1w-1
Received: by mail-wm1-f69.google.com with SMTP id
 12-20020a05600c228c00b003db09699216so3769513wmf.1
 for <qemu-arm@nongnu.org>; Sun, 29 Jan 2023 20:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gU8adfAwuLfc26sqIh9pm7Jq7Iesz802exA5x/kmz6k=;
 b=P7YfDJtEDrYTUVtmwy3fvQenCp0Y2FzCRV/Iyukh5maD00PYhj8eeMCPiXgWbBhTI4
 m7WPOSAQoMJxD/hev3SpRTVZ/QVMPY+oRlXBcbFKQLK+kP53TUFVw9+kPFxQ1lnlg4Fg
 v1EWwdmh8t4/fJdLJ79Tnfn7B2UZhzL4cXW8aDITCdlNhaoP2YOT+jwEdULMRVzVi9nb
 E8wOThpOGQCikD6ca1roShGKNQY7VMYsXY6+W168T/7BKRUtqzEgLt1hgyRWTMEDNQZA
 +YfJW+Gwyuybp1SIi/PFAzlZL4oCAow2rPukP2RtbVh0H6GLkVj1wvapvdAA8twM7JD/
 P+Pg==
X-Gm-Message-State: AO0yUKUNuYoV+7Z++wDY40mbxcJs1IW4K+ots19eq/6td2Ps8Bn7Botw
 sCqwkx+7YryAtbfAfegn5vC0bASmodvL9D82lC1SsTXxAd0g7uunHwr3rt4ciOJv5cOFGEY3fAX
 odu7Nv5zByWEo
X-Received: by 2002:a7b:c85a:0:b0:3d2:813:138a with SMTP id
 c26-20020a7bc85a000000b003d20813138amr4048257wml.35.1675052199093; 
 Sun, 29 Jan 2023 20:16:39 -0800 (PST)
X-Received: by 2002:a7b:c85a:0:b0:3d2:813:138a with SMTP id
 c26-20020a7bc85a000000b003d20813138amr4048227wml.35.1675052198873; 
 Sun, 29 Jan 2023 20:16:38 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 19-20020a05600c26d300b003dc50c38921sm4586064wmv.35.2023.01.29.20.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:16:38 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 19/19] Drop duplicate #include
In-Reply-To: <20230119065959.3104012-20-armbru@redhat.com> (Markus
 Armbruster's message of "Thu, 19 Jan 2023 07:59:59 +0100")
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-20-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:16:37 +0100
Message-ID: <87357spsgq.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yZ9DHAVrD2OV

Markus Armbruster <armbru@redhat.com> wrote:
> Tracked down with the help of scripts/clean-includes.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>


> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index b9a37ef255..8b7d1af75d 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -17,7 +17,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "qemu/rcu.h"
>  #include "qemu/madvise.h"
>  #include "exec/target_page.h"
>  #include "migration.h"
> @@ -34,7 +33,6 @@
>  #include "hw/boards.h"
>  #include "exec/ramblock.h"
>  #include "socket.h"
> -#include "qemu-file.h"
>  #include "yank_functions.h"
>  #include "tls.h"

Ouch

Reviewed-by: Juan Quintela <quintela@redhat.com>

I don't want to look into the logs.  They *could* say that it was me the
one doing the mess.

