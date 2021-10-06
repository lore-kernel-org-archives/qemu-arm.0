Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp56011lfp;
        Wed, 6 Oct 2021 01:12:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmKfHvLVM9wbqoSk/2EsdK8//VtbSkqr75jLf8sUdsW6P5pqHYuCxsAgw2R2DSkzDZE9K/
X-Received: by 2002:a92:cd8d:: with SMTP id r13mr6221614ilb.244.1633507949889;
        Wed, 06 Oct 2021 01:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633507949; cv=none;
        d=google.com; s=arc-20160816;
        b=IhTf68tFxp6qEDh6xUWhwTlEiSTKwJP2/XrtnVIkALS5vTmc3BS1ooOsNy3cRCAi4y
         Y4zI2yhHlKwEAjUJgctDumMEgx+BW06NYRcWvm6Kih3nTtZniNht7hbh/OjVAxUWIGZG
         hVJ3U+9FkESitVnkwO8g0XS1be10P54bqTj1+toTx6P8H3h72JCLgz1NSWCoGTSIefCc
         RDAKFYNoqDQfTapeA9poSl9ORb03MyCMNmEvIy4e2bnyXukzlc+5oXVRcKbHc9m05SLq
         vyiJSuSWVU2y8Ven4GZzvBvb4aGHijHUbRC8sAY84vPbQpDOMsL/9JG5MsNjvfkw1zlY
         +6IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=anBl3nhtxaPKnNe0Ikp7Ut89cAoGL0l90WohRi4CYYk=;
        b=Pl+LiaHlxjU0kHBkoZr2quYKJXxFpSol0al3sNmUsK2vR72Z7EhVRoDw61yiZzZ3HC
         tAglZ1qZ4YgECsORrgq/CscP2sVThEVBZky7hp+d/TbX+4iKb2+1rizP9yG/d3UAvCgz
         K2shNQnNg+ZKsVhqY+3nRwgJjn9A27pB7SaOYsAvKkzOGOAtFL7OrjlJF4kBfnFxCRO9
         SSUTTH+6oYeknmch75tobOJ8G/QHXS+6HZVJm1FjPOLB5uSdlx1rW7xtFwVdojkTlVb7
         yLB3g5Ml+hjlL8FGzEgaqbw8fIpGuXWC66DKrtH7tRR/+xIvybMj4Nl9R/Yy9E323VBA
         8Ptw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=heBoXlqv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si20089245ilq.49.2021.10.06.01.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 01:12:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=heBoXlqv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mY22P-0005bS-8u
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 04:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY22H-0005aw-Nq
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 04:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY22G-00079z-9r
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 04:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633507939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=anBl3nhtxaPKnNe0Ikp7Ut89cAoGL0l90WohRi4CYYk=;
 b=heBoXlqvWCX0F6SyoOySuwfcL+kId/zuEa8ql4B5sHPDVnwiH7py6kDR3lDWmo7nMz9Ebw
 EcUCGFF7LzieQMMFrAPuNJ0BRJUjsH9QqVmw0mUOyQIsM8Yb2ZbtcfHGM4uvqBODlT2IPo
 bLgACFOskozuDkRiymBWIVlgbFVAO24=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-qEYxD5ZTP22X9ueDRI-gfQ-1; Wed, 06 Oct 2021 04:12:18 -0400
X-MC-Unique: qEYxD5ZTP22X9ueDRI-gfQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 l9-20020adfc789000000b00160111fd4e8so1356864wrg.17
 for <qemu-arm@nongnu.org>; Wed, 06 Oct 2021 01:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=anBl3nhtxaPKnNe0Ikp7Ut89cAoGL0l90WohRi4CYYk=;
 b=Be9LNZcwlxBZHvomJJ74U+68W8/b0pmVXlUGzzfES+B3dW5KnGPUeO41XeGc06N/jc
 iwUTJlh8UywqQZwU/8m0A2YKVRFDUd7fYHF0m6LzwZxVuTdLh+gzAP6bM4/X8qdNSHov
 sCzqe2ZV19p2/ARkzGHmImS5xIW05SQTAMLcvqHdNkOkNx92gMEVmAmSOeTn52EAvPF0
 VssxufS8R1+/Whrg2pVpBhRQi6L41ooSABvs0NdPw/GrZLzA3YvmXpdA+02iObh7PJ0C
 TDanedNaRWFpAuR2ePhnCfdDVqkoi3fwJbi/idyEMJO1/llFpYfwtjGIPOfxJV/BJaz1
 QVcA==
X-Gm-Message-State: AOAM53244tL45Lf+cDnf3Y0fQ2H3tuH1HeAD5rl8iip3aR9FOnrrN0OP
 KXVA6Bm8mmFkI8E0q6u8W51a81VLg7u2DOc7BqjvF82ungIJiwXRJEYquUfHPkCxGG9d456W/Lr
 IobTW7LLZlOSa
X-Received: by 2002:adf:bd91:: with SMTP id l17mr14966005wrh.261.1633507937457; 
 Wed, 06 Oct 2021 01:12:17 -0700 (PDT)
X-Received: by 2002:adf:bd91:: with SMTP id l17mr14965960wrh.261.1633507937114; 
 Wed, 06 Oct 2021 01:12:17 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id k128sm4701645wme.41.2021.10.06.01.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:12:16 -0700 (PDT)
Date: Wed, 6 Oct 2021 10:12:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 08/11] tests/acpi: allow updates of VIOT expected
 data files
Message-ID: <20211006101215.24414401@redhat.com>
In-Reply-To: <20211001173358.863017-9-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-9-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G8LReLB8mW87

On Fri,  1 Oct 2021 18:33:56 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Create empty data files and allow updates for the upcoming VIOT tests.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
>  tests/data/acpi/q35/DSDT.viot               | 0

does default tests/data/acpi/q35/DSDT differs from
DSDT.viot?

>  tests/data/acpi/q35/VIOT.viot               | 0
>  tests/data/acpi/virt/VIOT                   | 0
>  4 files changed, 3 insertions(+)
>  create mode 100644 tests/data/acpi/q35/DSDT.viot
>  create mode 100644 tests/data/acpi/q35/VIOT.viot
>  create mode 100644 tests/data/acpi/virt/VIOT
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..29b5b1eabc 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,4 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/VIOT",
> +"tests/data/acpi/q35/DSDT.viot",
> +"tests/data/acpi/q35/VIOT.viot",
> diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
> new file mode 100644
> index 0000000000..e69de29bb2

