Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp67087ocb;
        Tue, 4 Oct 2022 03:19:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7pJJzOTgb9L7WF2V8eyJE2KuK7c3EsKKflrmDluwCkvqO4YZUuvNA08lerWZVhticsw+RB
X-Received: by 2002:ae9:efc9:0:b0:6cb:e321:12fb with SMTP id d192-20020ae9efc9000000b006cbe32112fbmr15646436qkg.446.1664878760973;
        Tue, 04 Oct 2022 03:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664878760; cv=none;
        d=google.com; s=arc-20160816;
        b=CJWgZ0R2MelPPwAOUMQNvcTlWGr1uo+D0TeZ4P2iMnUfuipEpb2GuYMu84WGvSHj7H
         DIbuqjxVbdOT8fQJGIImDVuRx5w7EfqTubA5OON0lj6vKXskV/Pmvq/J14nQ+UgFAM7s
         9OiQVuhNhLlllcpGiyG2bmCFHZjKv2SE0j2Z98JV0PUMdBRIzFQm7lwP61LDXVz5c29M
         Y2xhOKNwzRZs58I50b1Amu96ys6zzhjqwcyzPP5OMmksY3zIKNOKsFBY7hdxphFCWN2I
         Upe++snMLMjLBxRa31Y8yIrn8UMQlZx4NrfMqGdO40yj7qZXGCuRYfzzS/LfyHcacYLN
         PadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=8KNwLkncspptQfdDjD78Tgx4lFz78K5AOVdR09b4BFE=;
        b=PHN2Kx2Reb/nzSwwRT7CL7ZofI3E8p6AKETZRJmpASUePdWEBoeq6V490Uw7D74Exr
         f7bB+g1RZZYdm8eedQae/LH20o7DBX0xY9Drgflk7lI/07feEXY2kDFRf0n7zlXmLp2R
         zngMkE3JfNaSFzgPu0TUXtexFANOba+NIJbGSEmZXOLGhRjA9RUOnptlFSOcxHkyU0Rp
         HnEg7nINsXdYWMgszgFWOoOSyjx8kym1DuhgTOFQuOtC51FuMUPHnhCdJfH32goqWEe6
         zJbXpG3xYYy6ToENosrXDMdOc2bPinUDRJRMgzWbVreU2/jlA5spibZbNI3xnSkJNXFP
         Mi4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bkfPwcQX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020a05620a410300b006b8d79c90bdsi5347538qko.215.2022.10.04.03.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 03:19:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bkfPwcQX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1off1E-0000Lr-K1
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 06:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ofey8-0007lz-0s
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:16:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ofey2-0000v4-Po
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664878562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8KNwLkncspptQfdDjD78Tgx4lFz78K5AOVdR09b4BFE=;
 b=bkfPwcQXx0nt9R41hfLUVQxI/skj18b1NHkIeEPKefkceLX1ZGcbv+SQi+xjz9dyLb3uyJ
 8ZTZNYSaNNssVrk7OjZZjyBktcnvKtNSF2EQHnGcqwcw2CuX1RQCq9jhltD6UEUfiAGaRP
 VoJTeh1lbh/ggJQf/J6UXge83tmeOlw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-e3n9hmHEPMm023Gc0My_lw-1; Tue, 04 Oct 2022 06:15:59 -0400
X-MC-Unique: e3n9hmHEPMm023Gc0My_lw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 995F938008A3;
 Tue,  4 Oct 2022 10:15:58 +0000 (UTC)
Received: from localhost (unknown [10.39.193.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49CB7112131B;
 Tue,  4 Oct 2022 10:15:58 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v4 2/6] hw/arm/virt: Rename variable size to region_size
 in virt_set_high_memmap()
In-Reply-To: <20221004002627.59172-3-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221004002627.59172-1-gshan@redhat.com>
 <20221004002627.59172-3-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 04 Oct 2022 12:15:56 +0200
Message-ID: <87k05fopwj.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EjhfaH2ZB57f

On Tue, Oct 04 2022, Gavin Shan <gshan@redhat.com> wrote:

> This renames variable 'size' to 'region_size' in virt_set_high_memmap().
> Its counterpart ('region_base') will be introduced in next patch.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

