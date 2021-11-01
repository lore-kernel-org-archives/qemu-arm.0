Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2631907lfv;
        Mon, 1 Nov 2021 15:37:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQbw5BOXiOK+V1lrenfP4N288vH/67WDhN0mLTbHRfKi/jFvi607EIztc/jzZH/Np7ImXY
X-Received: by 2002:a05:6808:120e:: with SMTP id a14mr1633584oil.122.1635806249409;
        Mon, 01 Nov 2021 15:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635806249; cv=none;
        d=google.com; s=arc-20160816;
        b=TtlzquCtnhVjftmNUocegoIwSVkWapt44gwHXowsFsyA4k2WrneRpJTuEX7sB+CBRX
         I0NXuBwNnzfT+4uxIohCdojmShRk/txJ8x2vMa1qC8QcNilm7/775V6q2YNPO4vEtScV
         o3jzGuCTYxmfqkEOEnPn7wphk0n2yZrYFsL5O/5v0Bz0NPuVUgkypnuHEJj4aDIExbfw
         bQsngN3cVkzLmq4JJtojFLPRrm5yT7UPh/OjxhRDYkNr9ODfkxCOrRzdYq4QH03sQapT
         BQOV+EQ2IC6jzznCL7LbAaBlKyd45Nh9sVnYN1Ip0wQ0VJAPXC2oHBUyz8GfpDkPqcSd
         7LAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=lSjWElxRcx23/d0nb2Eu8vOPj+3TJ9xNFCzK4HtKMdw=;
        b=0pg+SCbRsy7sPa2fRxMcEw64jLoECYxEO6s2SEW0uF4wg7asGWL+bmi89A1qLGJFlw
         kC1KNiEfpzYIXPqMD/YC4kX5Ri0GahhOBub/Wef+Y6Bi8EQKyw+PjwRueulwp4J7xCQr
         XaSSo++EexI1EyUhNHWpwAZZpkrhO5LBXN+9X+vA8VejLQUVpOMaAY2zKdAtNggei6S+
         T6nBraj13m/tj/TiVuYkd3mE+TdUhRG5NR5wBYvUFdz8cPSMpMdNhGXFFSfzBJ6V0MzD
         7IYa2R3w7ZiwMN8DpsuEwK5C9kPVwSkg3q8hY20mOfyFHJkgYzEtejg4yBdlGpTFWvCt
         248A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KEg0tcGR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si5988756otn.290.2021.11.01.15.37.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 15:37:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KEg0tcGR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhfvk-0001ep-MS
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 18:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhfrG-0006sX-GE
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 18:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhfrD-0000TG-Rj
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 18:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635805967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSjWElxRcx23/d0nb2Eu8vOPj+3TJ9xNFCzK4HtKMdw=;
 b=KEg0tcGRIYd5/l1amDwvErQGOmmIMPbwCx4uDD676vmBKAi9PzhCo/Rg/v/tHvqcqeEDRI
 OCYeq1b3llYb2yCw4s2jwB4IIJFqKKEny6Gf4jNctz9NB5RsTfJHxtLXfG7ZVM4gg+Z1lL
 3yrQ34RtobctNSsnwVTaMQER9CIL7Ao=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-Awvs2gELP6Cseg4d1ayVuw-1; Mon, 01 Nov 2021 18:32:46 -0400
X-MC-Unique: Awvs2gELP6Cseg4d1ayVuw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w26-20020a056402071a00b003e28a389d04so4636016edx.4
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 15:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lSjWElxRcx23/d0nb2Eu8vOPj+3TJ9xNFCzK4HtKMdw=;
 b=F+zafZ74SBf8ZZJ+zY88XIdSFB+a5IqI869CYjKA9ognuZnSP0TwHzJ1CEUvhG7N2/
 KvieHpT/MCPQMTRLuxQ+Xz7UyE1ZSlzfmR/2GO5czC7yXz32eBV27TTTPlveTp0YEUmu
 R+uQC+7T6CYOVpZ5MINoA5RLCV2+KCyYetdkJEQpUUu/7/psPzYy7u2zuD1vZiTM9yYd
 QIxIF6J5EKgy6V8ILSfBgzvGX/kWZvI+lgCNfi6acohYw40xL/kUeo56voDXMczcTOXl
 DRku2WiQDsQ7/vUeiCf+WkTynbNZ+93Qk94Lw8/ECMrmhdOMcdWGugwjOeRLGU6Viuou
 58yA==
X-Gm-Message-State: AOAM531rQrluuyoSv8tXyU8X31WTR2KlRXvr4vdxoKu75WptVY7zKd3F
 HB7U7RKB/7CGhwpB8PgxtKvgWTza1Jh/HIb9oh/0tZU0ceksykdyVgObJhwe4EHEl3MJozIuZ3x
 csmYTv9nn4TmB
X-Received: by 2002:a17:907:6e26:: with SMTP id
 sd38mr22936642ejc.90.1635805964963; 
 Mon, 01 Nov 2021 15:32:44 -0700 (PDT)
X-Received: by 2002:a17:907:6e26:: with SMTP id
 sd38mr22936606ejc.90.1635805964783; 
 Mon, 01 Nov 2021 15:32:44 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id qf9sm850185ejc.18.2021.11.01.15.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:32:44 -0700 (PDT)
Date: Mon, 1 Nov 2021 18:32:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v3 0/3] pc: Support configuration of SMBIOS entry point
 type
Message-ID: <20211101183224-mutt-send-email-mst@kernel.org>
References: <20211026151100.1691925-1-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211026151100.1691925-1-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s6x9SOLNXKcK

On Tue, Oct 26, 2021 at 11:10:57AM -0400, Eduardo Habkost wrote:
> This includes code previously submitted[1] by Daniel P. Berrangé
> to add a "smbios-ep" machine property on PC.
> 
> SMBIOS 3.0 is necessary to support more than ~720 VCPUs, as a
> large number of VCPUs can easily hit the table size limit of
> SMBIOS 2.1 entry points.


We need acks from QAPI supporters on this.

> Changes from v2:
> * Renamed option to "smbios-entry-point-type" for clarity
> * Renamed option values to "32" and "64", for two reasons:
>   * The option is not about reporting an exact SMBIOS
>     version, but just the entry point format.
>     FWIW, the SMBIOS specification uses the phrases "32-bit entry
>     point" and "64-bit entry point" more often than "2.1 entry
>     point" and "3.0 entry point".
>   * QAPI doesn't allow us to use enum member names with dots
>     or underscores
> 
> [1] https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@redhat.com
>     https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@redhat.com
> 
> Eduardo Habkost (3):
>   smbios: Rename SMBIOS_ENTRY_POINT_* enums
>   hw/smbios: Use qapi for SmbiosEntryPointType
>   hw/i386: expose a "smbios-entry-point-type" PC machine property
> 
>  include/hw/firmware/smbios.h | 10 ++--------
>  include/hw/i386/pc.h         |  4 ++++
>  hw/arm/virt.c                |  2 +-
>  hw/i386/pc.c                 | 26 ++++++++++++++++++++++++++
>  hw/i386/pc_piix.c            |  2 +-
>  hw/i386/pc_q35.c             |  2 +-
>  hw/smbios/smbios.c           |  8 ++++----
>  qapi/machine.json            | 12 ++++++++++++
>  8 files changed, 51 insertions(+), 15 deletions(-)
> 
> -- 
> 2.32.0

