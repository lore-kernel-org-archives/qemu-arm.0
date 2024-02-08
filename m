Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp136265ejb;
        Thu, 8 Feb 2024 06:22:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUH8yDNVMHZrTbITu+racFUuuTwpCwbKSBttIq0RP2FD6cttaNq9WmJdHHJW5AJvhwIaY0m5a7R6qw+UUzOVMAr1fZMzcqj
X-Google-Smtp-Source: AGHT+IFpBdDpWX9bGdWYKwaDwBuDMeuXL1S49AjdTkMM18VRAFHRwTK28N75ME0GB7kUtxOURhoN
X-Received: by 2002:a05:622a:450:b0:42c:30ec:e265 with SMTP id o16-20020a05622a045000b0042c30ece265mr10621202qtx.41.1707402162374;
        Thu, 08 Feb 2024 06:22:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707402162; cv=none;
        d=google.com; s=arc-20160816;
        b=cSoVdTD6tr8PeyufLTXvCMXvxRk3PEXumvdD+wuzsmYugocRqP0hG55vE1wNQOtHzH
         HnCG/qC1tGKxiUXPJ+qrAS6hDNAlFI6uY6nO+vgjGbJ/AHs9M7PpKn2MND8l2KgAJ4wQ
         3r4AOxeUbmazho2bAF/ZWt5bZ+MH0Hb63xC041wuUTJaOegZMMRWups/3+4DAPyEvrsL
         BmEAMlhK+hCJbN8bgp/3xkbSSNZfyjmIGm5F2MlFbgaOFD6e1HT6MMQgy8IZ+D9GLO+5
         zSGOeGJgxWjV+ZWaYrfVfO6ezFY0LqFzgkiJDB76Xf9bz43InfXkM6fC+4iMFfrZXVTw
         +y2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=gAla9J4PVDqycTuoekfcB6U5If2dSmAvYvLz7BgmNoQ=;
        fh=uCTIXdFYZVjtF+pvOay18b6c8jVmu6nGsRihkN2ODPg=;
        b=ZfEZRa95hWHlsw8XAEbHKFVeb/8lPJoAnubDruoGC+l9uIdIw1WK0n8jjFs9Evks44
         XlpVRE1OeB7dgklcrxyBYfhKvoAZ50VAX3oNsPM1Bs1oaXBBKjbN2fuPIQntUemEqf+v
         nCXLBExLEOKLsb4lbAgSQ2H26qjc6ahZdSOuYY1s6+RwHxM0AaAOjg2YEfKTEQtPSnxR
         uqay3zD94eP0FqiCKz02lpnqYEldukJFScNDkIUPnyWptage8MizQKzHKhzxajeXracI
         JeW29UmKW4hiLQiO+izQXKVMDqzUu8tVcL3x5Hy0z9hzefG1F+hMenoJERVHPsLR5wDe
         /IeQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Gxv/+1+b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCVSSHi988TXYl829gM8PnVZuHltXqT6NfPrYZ+J/gTSjN82ogbfL5H4VGQLbKuYyuuH/CraE+l7hcoCdMGMAWzMvfwZIui4
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16-20020ac84e90000000b0042c28be0ebdsi92833qtp.249.2024.02.08.06.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 06:22:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Gxv/+1+b";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY5IR-0001Oi-VK; Thu, 08 Feb 2024 09:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1rY5IF-0001Mh-0p
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 09:22:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1rY5IA-0005sm-Mb
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 09:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707402137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gAla9J4PVDqycTuoekfcB6U5If2dSmAvYvLz7BgmNoQ=;
 b=Gxv/+1+bJNeC96+zDt2eugAhsZBXqvfjK9qCWezifNIbWopl7dOTojWM9WGrP4lwfTUDeJ
 vXaOTrLzmfi1XgEwPibEcyBOVb7RP1/R5bW0aqWfs+XqL91BXWazg9hcD82YYcT9dK8jjR
 yWKji6iomgvUjdka/33880OHT+jtTEE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-dlziQXbcOvCOicqYfWWaBw-1; Thu, 08 Feb 2024 09:22:14 -0500
X-MC-Unique: dlziQXbcOvCOicqYfWWaBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1069185A780;
 Thu,  8 Feb 2024 14:22:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CEAA1C14B0B;
 Thu,  8 Feb 2024 14:22:13 +0000 (UTC)
Date: Thu, 8 Feb 2024 15:22:12 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH] iothread: Simplify expression in qemu_in_iothread()
Message-ID: <ZcTjlNeibKUnIDcL@redhat.com>
References: <20240208101657.15962-1-kwolf@redhat.com>
 <ffe07fee-0cda-4517-a64b-031cb922d806@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffe07fee-0cda-4517-a64b-031cb922d806@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.213,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: syi4ArupBD+S

Am 08.02.2024 um 11:48 hat Philippe Mathieu-Daudé geschrieben:
> On 8/2/24 11:16, Kevin Wolf wrote:
> > 'a == b ? false : true' is a rather convoluted way of writing 'a != b'.
> > Use the more obvious way to write it.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   iothread.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/iothread.c b/iothread.c
> > index 6c1fc8c856..e1e9e04736 100644
> > --- a/iothread.c
> > +++ b/iothread.c
> > @@ -404,6 +404,5 @@ IOThread *iothread_by_id(const char *id)
> >   bool qemu_in_iothread(void)
> >   {
> > -    return qemu_get_current_aio_context() == qemu_get_aio_context() ?
> > -                    false : true;
> > +    return qemu_get_current_aio_context() != qemu_get_aio_context();
> >   }
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> BTW using the same pattern:
> 
> -- >8 --
> diff --git a/hw/nvram/xlnx-zynqmp-efuse.c b/hw/nvram/xlnx-zynqmp-efuse.c
> index ec98456e5d..d074762a25 100644
> --- a/hw/nvram/xlnx-zynqmp-efuse.c
> +++ b/hw/nvram/xlnx-zynqmp-efuse.c
> @@ -582,7 +582,7 @@ static uint64_t
> zynqmp_efuse_cache_load_prew(RegisterInfo *reg,
> 
>  static uint64_t zynqmp_efuse_wr_lock_prew(RegisterInfo *reg, uint64_t val)
>  {
> -    return val == 0xDF0D ? 0 : 1;
> +    return val != 0xDF0D;
>  }

Maybe. I would have to know that device to tell if this is really meant
as boolean. Or maybe it should be written 0x0 and 0x1 to signify that
it's a register value or something.

> diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
> index 301e61d0dd..bdd73bd181 100644
> --- a/tests/tcg/aarch64/sysregs.c
> +++ b/tests/tcg/aarch64/sysregs.c
> @@ -183,5 +183,5 @@ int main(void)
>          return 1;
>      }
> 
> -    return should_fail_count == 6 ? 0 : 1;
> +    return should_fail_count != 6;
>  }

This one isn't unclear to me, though. This is EXIT_SUCCESS and
EXIT_FAILURE, just open-coded. I think making your change would make it
only more confusing.

Kevin

