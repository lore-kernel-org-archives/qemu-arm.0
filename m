Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2799392ejf;
        Tue, 27 Feb 2024 09:01:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVTGUcXcLshFdBSVmJtGHJvmk4EZP6pi06nTDrot/zR2WP6JO0/ibxX5CnpXdRcvzzh4H95JPtMm4K2mHu3hchTysvEq/+3
X-Google-Smtp-Source: AGHT+IFS/z+XLEfbGB38MhRCSE1qYZWhZ7ajx4IshjX5vLwzSsnkN+1JB+OGnU9F6ZJjgEKWNHog
X-Received: by 2002:a05:620a:462b:b0:787:b867:e886 with SMTP id br43-20020a05620a462b00b00787b867e886mr3852052qkb.24.1709053290989;
        Tue, 27 Feb 2024 09:01:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709053290; cv=none;
        d=google.com; s=arc-20160816;
        b=JKqvRwMCeLHC4RsimwYvsF9eroS4eOSsckrtOwxMaAieGA/zYN9djFasoKgbiOBLaa
         HyouUi1tV1OxUcRt5/2ec5tTJCeAzDccujKnbzEDBgWWBoXH38ejC4XKnJzN73HSQhNt
         ynXLKeRVTSZc/innE/4cqeamHHrfXKb+0k/Mqi5CeaHEzxg4pbrgrvuWTA67RqkGmYwp
         XPYY9cyrNH5vRcYxjm+uh/3i7jGI2oTGyP04I0k2/FE94eM+MdQyibTNGrk/7Vvg+z1o
         f3kpmroZlpLuSPWTpS/1g8T7aBcJdAkPB76RY+YHm3193WPIxOm32PkRpx++mYNr44/R
         JrnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=Dc5uEDKmUP6lkgd5F+ELxhywGff4XDS5bKezLevdlDc=;
        fh=5RvRCGLOdP26r1aXQ46SyJw5X5H+SU+s1OBVwYlGm48=;
        b=ljEitwJx9unwX0cKA8tou0GcyA6M5krFKneBOnqL61VsZUPqOGseL8ozcTpKtvkFDC
         8XGgieTJqjq4vMRRZieIz0Qs8A6lIB9ms92jZFBrEKscTKkOBz5WdWTlK1G17sy+O3aH
         sYwlejJizobsAD3gZzOsffiH2AZ8SZUT6+N9j6u3siytcfGDdKHQeOwYtev4IuurZURO
         HTCE/xMKB5K81/u3OcwllpEu/FoM9TQU/rPpoUa8MnPuFAQ8+QOybsNQ5u9Cnz0q9ewv
         dXCLq9XJhP2Nn02pSfmJv0TTl2g+QHrMKnTbBwT1UoHXI8MqAbfet6XojXPj/MDClwvN
         n/7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dx5wUJqf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19-20020a05620a127300b00787b85281e7si7679460qkl.714.2024.02.27.09.01.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 09:01:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dx5wUJqf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rf0pD-0001M8-CG; Tue, 27 Feb 2024 12:01:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rf0ov-0001E7-E4
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 12:00:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rf0ot-0005lV-5i
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 12:00:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709053242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dc5uEDKmUP6lkgd5F+ELxhywGff4XDS5bKezLevdlDc=;
 b=Dx5wUJqfzhWJ7WWSCBgakC5hh1rltmPVcMlfy8jB/H0UDWl7pBoo/ESpi7RLujMxwfuthm
 wNktj6T6uxszihlf8hx8IVNO1P3WCONvl8ooId4ppxeX6hgnWsdLfAy+jMIvEVD+zg5opO
 1QJw8DbsAuqFzDF8Nn6OvEGYbiZHBco=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-3-7O-1_E-rPlmSEC-NF5eE8w-1; Tue,
 27 Feb 2024 12:00:38 -0500
X-MC-Unique: 7O-1_E-rPlmSEC-NF5eE8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D590329ABA11;
 Tue, 27 Feb 2024 17:00:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04FBFC185C4;
 Tue, 27 Feb 2024 17:00:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C514C21E66D0; Tue, 27 Feb 2024 18:00:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org,  peter.maydell@linaro.org,  pbonzini@redhat.com,
 mst@redhat.com,  gaosong@loongson.cn,  alistair.francis@wdc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  liwei1518@gmail.com,
 dbarboza@ventanamicro.com,  zhiwei_liu@linux.alibaba.com,
 anisinha@redhat.com,  philmd@linaro.org,  wangyanan55@huawei.com,
 eblake@redhat.com,  qemu-arm@nongnu.org,  qemu-riscv@nongnu.org,
 f.ebner@proxmox.com
Subject: Re: [PATCH 13/19] smbios: extend smbios-entry-point-type with
 'auto' value
In-Reply-To: <20240227154749.1818189-14-imammedo@redhat.com> (Igor Mammedov's
 message of "Tue, 27 Feb 2024 16:47:43 +0100")
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-14-imammedo@redhat.com>
Date: Tue, 27 Feb 2024 18:00:32 +0100
Message-ID: <87o7c1970v.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
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
X-TUID: GPvCZc8VPmk+

Igor Mammedov <imammedo@redhat.com> writes:

> later patches will use it to pick SMBIOS version at runtime
> depending on configuration.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  qapi/machine.json | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 93b4677286..4c68528507 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1802,10 +1802,13 @@
>  #
>  # @64: SMBIOS version 3.0 (64-bit) Entry Point
>  #
> +# @auto: Either 2.x or 3.x SMBIOS version, 2.x if configuration can be described
> +#        by it and 3.x otherwise (since: 9.0)

Please format like

   # @auto: Either 2.x or 3.x SMBIOS version, 2.x if configuration can be
   #     described by it and 3.x otherwise (since: 9.0)

> +#
>  # Since: 7.0
>  ##
>  { 'enum': 'SmbiosEntryPointType',
> -  'data': [ '32', '64' ] }
> +  'data': [ '32', '64', 'auto' ] }
>  
>  ##
>  # @MemorySizeConfiguration:

With that
Acked-by: Markus Armbruster <armbru@redhat.com>

