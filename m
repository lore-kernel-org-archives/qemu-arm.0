Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4571676lfb;
        Tue, 7 Sep 2021 03:20:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoR2EaIUEnf8PnwNphiWUxGp2KunAqwv0dFLV51SZOW4AVE6HSP/WEvxZKnWao7Bc6Qf5Z
X-Received: by 2002:a02:2341:: with SMTP id u62mr14794331jau.6.1631010034937;
        Tue, 07 Sep 2021 03:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631010034; cv=none;
        d=google.com; s=arc-20160816;
        b=winHAzREXneBYCie657qNv33iXRElwPNhIr3rnUarL1S7jOAwGoGiqOghorQ6Q89Nc
         +UEelMnORw9ENloOxZe7iOjfHyjqKKQKVrQb1aNPoZ6Dtho+xN/1Hqb3jD3xTpMRUjof
         L95lCmVhwh5fgh05gEFUiJlOPW7uswiTpz3oRy0lg9co/mA/4wE8Ut/+mXwpFjYJvE63
         jyELeDAJZr+ZeSAZweBmcXscBkuXPfy87t/bJQ2QeWOHWN6FIbNvPGMBujIgesQyXUk4
         oFebEm3j1tXH0YktM77ia7eXVAEgfTdf1JYp1D/Kvowe+NzeVWQAfUW6awSFotLrzNHX
         pibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=NRNInx7vUzsisgZPFyAYXt3Ei5qwj9SPX3Hi5nzLxWY=;
        b=q95xANOFLKNMymKUr8HvnNk1FNd5e1msJOrXrQWqaHvVLrqQj/3qcQyZTTOWNNl5vw
         rfOqBeg15aHezy/rskXmhyWZuO8AAkmgN80ZSU0kdWoeD0PUBRTsJoePnuX763LHvm+V
         QdcmZfEufXGA9dQN3OriavHRpNSwCjocjJNy3iD9br3esY/UaquNYaRrkPZmU4o30no1
         b3F8VO7Esd5HrfHPexJz658xLjMKq6WHYTgx0x4i4IVMGY1SdcrnhoydrkitkqRb1cJP
         hjyQqVv58Lbo4c9Oib3ZZTuoDiYm76r04+1dH1YovmVV+2nzd3vSjR4DWwelQZVp9g62
         jjhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YtoXJoJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w31si4882617jal.61.2021.09.07.03.20.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 03:20:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YtoXJoJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNYDS-0002SD-BL
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 06:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNYDE-0002R7-0N
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 06:20:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNYDB-0000yp-Vb
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 06:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631010015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRNInx7vUzsisgZPFyAYXt3Ei5qwj9SPX3Hi5nzLxWY=;
 b=YtoXJoJSwEMSDZIAYIAmpZE59F7HCRDeaVEvDn1GEmDAO1O1JRJC2/jJl5CMePFjlK3Sfe
 OvWpx0Qz4suHTKi5xQ26vwpIUWqXfJtqYMV1kG1yJa8Mf3IzRzB1h6lvtJfB4UuwENmCoP
 yxwY2uGbno4j47DOh4R4jeMYzYDqBCA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-w_GSB1bYNeCBc4WYDFLOlg-1; Tue, 07 Sep 2021 06:20:14 -0400
X-MC-Unique: w_GSB1bYNeCBc4WYDFLOlg-1
Received: by mail-ed1-f71.google.com with SMTP id
 b6-20020aa7c6c6000000b003c2b5b2ddf8so5045797eds.0
 for <qemu-arm@nongnu.org>; Tue, 07 Sep 2021 03:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NRNInx7vUzsisgZPFyAYXt3Ei5qwj9SPX3Hi5nzLxWY=;
 b=DNp6iCkHSBoLb42flUhYlna7dK0L/QCsGTh6B+oSqbqV1N9w60pI3YvPIq6ajif15H
 C/kPbPoI10BokDHMqQsBVoTjXUkjZ9Q6u5XblBos0jeeoQqI5yqkY3aGVVSB+Bg/iizg
 oMvEH7yX04ij10pjx+2KM0ZDexwL8ITshWzmJFya7JPvmB+woRyhLRkkdQC4zE1mUczn
 +lsJku6qpuOMfPirGj6ob0J6F/46HhHj4WjhMtd7DsyRYjQkxSRAP6eoJW0PdfzLAnXh
 /SbNC5ahsQ9phAf/4USO83IoWOpMEDLCothehiESrP67scaRbnN2RN5VtHXW/vJY4fmY
 MbhA==
X-Gm-Message-State: AOAM530dzdW/VhjJAJ9BKXsvIfTaHLK67HSa0mo6SIPbDvk+JzKNWR9V
 QnTudVhy4heH7a6s5LCa9OJ/YK9U1nQjUVQGIbWMp0fT1v289Nd6QNtXRmGqEAYvQ4+7/HfCBR5
 evlQ0pyogXhJt
X-Received: by 2002:a17:906:1d41:: with SMTP id
 o1mr18065459ejh.232.1631010013722; 
 Tue, 07 Sep 2021 03:20:13 -0700 (PDT)
X-Received: by 2002:a17:906:1d41:: with SMTP id
 o1mr18065439ejh.232.1631010013557; 
 Tue, 07 Sep 2021 03:20:13 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id bx11sm5282992ejb.107.2021.09.07.03.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 03:20:13 -0700 (PDT)
Date: Tue, 7 Sep 2021 12:20:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 1/3] tests/acpi: Add void table for virt/DBG2
 bios-tables-test
Message-ID: <20210907122011.368a4e1e@redhat.com>
In-Reply-To: <20210906123139.93593-2-eric.auger@redhat.com>
References: <20210906123139.93593-1-eric.auger@redhat.com>
 <20210906123139.93593-2-eric.auger@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GafvL/fNLRsd

On Mon,  6 Sep 2021 14:31:37 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add placeholders for DBG2 reference table for
> virt tests and ignore this later for the time being.

s/ignore.*/ignore till reference blob is added /

> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/virt/DBG2                   | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  2 files changed, 1 insertion(+)
>  create mode 100644 tests/data/acpi/virt/DBG2
> 
> diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
> new file mode 100644
> index 00000000000..e69de29bb2d
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8bf..1910d154c27 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/DBG2",

