Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5204lfq;
        Thu, 24 Sep 2020 00:14:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxz7ZkCF0o7xA/g+lss8e/D2bxcvRQmCTP5Uk8QRU8QV76s9aROFLAus61Ree2WUmnfwuPr
X-Received: by 2002:a25:6193:: with SMTP id v141mr5319430ybb.34.1600931661373;
        Thu, 24 Sep 2020 00:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600931661; cv=none;
        d=google.com; s=arc-20160816;
        b=WfHdIW8wxUJNfJmBtuM+4MjEX6Et5P+D42dx34RpMYcEesFYdm7A39Bw7mxbEYHPmr
         XKhu6aq6jjGwLgGGttaKMUzFRm3lzVoZ7bc9LJqT1wg+0Otd5bqTwIjLwEtKrMwrbHzV
         WFTTynK5qX5TxnInA1398pQG0hvpwnjTg43e+b1TUHXGcR6s2QJnzFEgAvpfULl0ceo4
         HreDUIILQ880AHoF/xk1n5OgefKMEee6J+t9CW+XGSiycNx/Q2ZIO4tenbNLnNzij2rc
         F9ykQUTQ2bEBEKpSj2N6M8KaGQVO3eyW6PFsMlrD1QH8M6tFocEXrhZb0gJbZceKayjX
         mEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:date:message-id
         :from:references:to:subject:dkim-signature;
        bh=Q+GJ3r9zQj13cYL/OFnEQjMJzs/wgDvYCl+uJBiqZ48=;
        b=RGH7RanbIwMFTu6FJYFO8c2KrTIIZiQSOYAGmOJJQhHzn+JK4vyHJvpvsc6v50plia
         UdUuN75neJp1ks160vKgbX4TLSuNM5u1nCOU+LFbricxplo0jVH3tZ9i0otlGBEf8Av5
         I4VKOS6tyVdgI8A3Z9KmorNIG/1eyjn0oGhDVTwxnkyd1MJif0pJqZx/t1UuCKYNh51r
         bxtmEp+MN3t+nDItptAFIcN+Eh/T/UBtH7wgPh+0FMeyeoQg4I9BKPcp4DWZk6yepwJ4
         lK4NFXGKAFME6qHfiDdHUOO7tZMjJkK+A68I1CVf+9Ktpo9mE6xigZw8RfK3MS65Pg2h
         ywGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Db2ySs/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si655736ybl.323.2020.09.24.00.14.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Sep 2020 00:14:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Db2ySs/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLLSO-0002ye-R9
	for alex.bennee@linaro.org; Thu, 24 Sep 2020 03:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kLLS9-0002yK-0g
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 03:14:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kLLS6-0006YE-C1
 for qemu-arm@nongnu.org; Thu, 24 Sep 2020 03:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600931641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+GJ3r9zQj13cYL/OFnEQjMJzs/wgDvYCl+uJBiqZ48=;
 b=Db2ySs/eoN9hy/7ZsFzngVTXMxDwAY5HJ2FzC4WjwTHjhR1D9Cc69SLU+ICiHE+tijeD3X
 EzOZf37XXLksmg3jw4ezs1T8MOmNOJEf1z4PRauTFZBno9vjs8RMvUc9dlFcWIBe2EvMOt
 8P5BO3kThDf7EnnWspwVFqvP7lAY6Nk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-O9H17lCYO6SG7Q7q_6Ae9A-1; Thu, 24 Sep 2020 03:13:59 -0400
X-MC-Unique: O9H17lCYO6SG7Q7q_6Ae9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67FF0800462;
 Thu, 24 Sep 2020 07:13:58 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-39.ams2.redhat.com
 [10.36.112.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D36451002C08;
 Thu, 24 Sep 2020 07:13:52 +0000 (UTC)
Subject: Re: [PATCH v3 2/3] hw/smbios: report error if table size is too large
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200923133804.2089190-1-berrange@redhat.com>
 <20200923133804.2089190-3-berrange@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a8943b74-e878-1104-c4cd-ae39d42f0da0@redhat.com>
Date: Thu, 24 Sep 2020 09:13:51 +0200
MIME-Version: 1.0
In-Reply-To: <20200923133804.2089190-3-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qOIIQWqxuAt7

On 09/23/20 15:38, Daniel P. Berrangé wrote:
> The SMBIOS 2.1 entry point uses a uint16 data type for reporting the
> total length of the tables. If the user passes -smbios configuration to
> QEMU that causes the table size to exceed this limit then various bad
> behaviours result, including
> 
>  - firmware hangs in an infinite loop
>  - firmware triggers a KVM crash on bad memory access
>  - firmware silently discards user's SMBIOS data replacing it with
>    a generic data set.
> 
> Limiting the size to 0xffff in QEMU avoids triggering most of these
> problems. There is a remaining bug in SeaBIOS which tries to prepend its
> own data for table 0, and does not check whether there is sufficient
> space before attempting this.
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/smbios/smbios.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index d993448087..8b30906e50 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -365,6 +365,13 @@ static void smbios_register_config(void)
>  
>  opts_init(smbios_register_config);
>  
> +/*
> + * The SMBIOS 2.1 "structure table length" field in the
> + * entry point uses a 16-bit integer, so we're limited
> + * in total table size
> + */
> +#define SMBIOS_21_MAX_TABLES_LEN 0xffff
> +
>  static void smbios_validate_table(MachineState *ms)
>  {
>      uint32_t expect_t4_count = smbios_legacy ?
> @@ -375,6 +382,13 @@ static void smbios_validate_table(MachineState *ms)
>                       expect_t4_count, smbios_type4_count);
>          exit(1);
>      }
> +
> +    if (smbios_ep_type == SMBIOS_ENTRY_POINT_21 &&
> +        smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
> +        error_report("SMBIOS 2.1 table length %zu exceeds %d",
> +                     smbios_tables_len, SMBIOS_21_MAX_TABLES_LEN);
> +        exit(1);
> +    }
>  }
>  
>  
> 

Tested-by: Laszlo Ersek <lersek@redhat.com>

