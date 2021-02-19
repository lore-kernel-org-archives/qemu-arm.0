Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8956322lfc;
        Fri, 19 Feb 2021 03:58:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9UfYkJiaZJ7WYKmhRDe/8l3unZQ1obcbz9766wWMtR9TxyVgIYx80jWZZ0vkej8t8K9JS
X-Received: by 2002:a25:5ac2:: with SMTP id o185mr14251798ybb.252.1613735915917;
        Fri, 19 Feb 2021 03:58:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613735915; cv=none;
        d=google.com; s=arc-20160816;
        b=j2Jwis/i3VwzuWSJ+2snqDIdMGf5y03gfEKG3WzuDscSL/nRxxCQHqEmKOuDtb9yaH
         OvNEF0H0oLbwBTd849wpNJKgIJ9jCDaMWwoK8RmEOCSXC4ULtDyK13QsCdsJBu3+wkmX
         xgg2Iu87rnK0tjPGhxQ5XGXOoZOb6ggS755lL/5cwBjw4MebydYFhrYaYDB/g9J/NnXk
         7dI4O4M/zBGjseJ4T5vlmYFnpeS7tfmjeZLpUt/8ywOohZrRpeIVMT1Z4qqjKxglF0wq
         0r7ux4qqfATuShSCuDQVG5CMRYeoDbuYRpbwnpG2l1Viob8e35G5WP6Oe3I3ADE2OsMo
         mOmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=0Oat3ESJK0nJqOq3w4Qti1Q4yrZeJ9Lqn+lQdEnc1XI=;
        b=xQS3Su6A7TYUA5FLzeLWGZ6Kax+PviS1RE37Q3JAo2HpSAm94Wk6mKTm/JJAOL22xo
         UZPdYNyagR8qznX1TfKOmUOuB3R5p5i98owNdeKcn/IplVzJInzjz4EUCUtA0RKTgSNI
         6R6lh3lzJjdKEBVX4nPcWyp4s3oRJsRM4huv1B2w/qXUFxo7TJeOPMEUSqGh+BQyV5f6
         68SO/YXaYdwRJanuSX0SKrKIg/e4n8twmcS5Z+P73KPnz1T+WzBLlskcPhClEkdjqwQw
         EDBL6aTqNcUA4w32YF0JMb4lvkWoBXxsRUJQq5BEG6AJcbxnZj3/DzweqQgBF8aFCxT8
         dcsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZFsCDtKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p188si9468485ybp.399.2021.02.19.03.58.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 03:58:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZFsCDtKF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD4Qd-0008TE-97
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 06:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD4QR-0008Q3-L6
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 06:58:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD4QN-00087c-74
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 06:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613735897;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Oat3ESJK0nJqOq3w4Qti1Q4yrZeJ9Lqn+lQdEnc1XI=;
 b=ZFsCDtKFcMf3IX74CHLMrcUhLnBjGIw8XKuqRBe8HLvONNe62tADNr43C7L4bw3tKvKiLz
 4eZT1HQfZsBdvVE5erUv/6zHx1O+ft7VxHh50RHGzpmqGrfVjHnFBRjk9HGaIA9OCLlDMx
 iqE9vWHtco7qmk+eJA5BpHFsoEgSqao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-Rbk-XNaZOBKnFnbM5wF23Q-1; Fri, 19 Feb 2021 06:58:14 -0500
X-MC-Unique: Rbk-XNaZOBKnFnbM5wF23Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3B0F107ACC7;
 Fri, 19 Feb 2021 11:58:10 +0000 (UTC)
Received: from redhat.com (ovpn-113-184.ams2.redhat.com [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 508F56086F;
 Fri, 19 Feb 2021 11:58:00 +0000 (UTC)
Date: Fri, 19 Feb 2021 11:57:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/7] hw/boards: Introduce 'kvm_supported' field to
 MachineClass
Message-ID: <YC+nxWnB+eaiq736@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
 <20210219114428.1936109-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210219114428.1936109-3-philmd@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gKVhebBWSTfb

On Fri, Feb 19, 2021 at 12:44:23PM +0100, Philippe Mathieu-Daudé wrote:
> Introduce the 'kvm_supported' field to express whether
> a machine supports KVM acceleration or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/boards.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 68d3d10f6b0..0959aa743ee 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -129,6 +129,8 @@ typedef struct {
>   *    Return the type of KVM corresponding to the kvm-type string option or
>   *    computed based on other criteria such as the host kernel capabilities
>   *    (which can't be negative), or -1 on error.
> + * @kvm_supported:
> + *    true if '-enable-kvm' option is supported and false otherwise.

Is the behaviour reported really related to KVM specifically, as opposed
to all hardware based virt backends ?

eg is it actually a case of some machine types being  "tcg_only" ?



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

