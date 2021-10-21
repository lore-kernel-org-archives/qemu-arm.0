Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp357159lfc;
        Thu, 21 Oct 2021 07:01:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy71ykBSBzuLmP4Mhj4hmFBVEqlE7PoIi/sF7kE+EgOCgSKvAGxsgFnzvU15AGxN2JeBzbl
X-Received: by 2002:a05:6808:2127:: with SMTP id r39mr4644622oiw.124.1634824898309;
        Thu, 21 Oct 2021 07:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634824898; cv=none;
        d=google.com; s=arc-20160816;
        b=WTfSeqwHbeDLT1nVWg8SGIJ+Zc6Sj9uzRC2TdG0e3FHQ1RRWJSuDbCKyHemPQ1oWR3
         kdB6ik2alP4uuEW6/YoZS8OgWEIlUA+MsQenM6E37yxwvZCXwznmaoOc6k3cyjw6SR7I
         +BhY0GNuOPRtPwzV6iqqP2NUzvy4Q5xik31WXIv5hnAG2iWd1gQbL3z+JRVkMIKnJJ7A
         wlKMGc/W8VejICZcB6qY3CXLdtO0LwcjAC/n977vrCUjd2Qsik6rOfpB3BIFLH6xmW6q
         FjxuAL5W0L5H8gEotaqgJVde+V0Nr5Hbh2lL6O+wT2O84VIIMhpxcwWkv26Axj2xfnDL
         cUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=VdaqRsTxIcorfz6kht5/IWl3Xn2FlVJupR/VWOEiuns=;
        b=KdeGfFiLHInp12ysObjsDV20P11IMwyfMlubAVvKAt0apmA6kmTx9H/2eySW729/PU
         SFttXISbbtQhVD4GaMzzFtnksXlAySxI1WXrlibgaEQZmwKJml03QN5oKkBDxtj6aPBu
         VMXo33CCnDocSmVmHXCH7iuYlODlY75rPFIwYxRD86fD8wacYZjxUhxm0z4tfdrl6juU
         1m6/RzXlcq4A/ieWHQ2c1LCp4/DaDagUUXgxnRhP35FTcgPrBemmVJq4PDhKGVssa3CV
         4rnzMTXxOkbLjv+qBhV4BVJQ6MuaX+63tcZFBpzMnL1M4oUNtESu13I9OLGdDX7P/6Ny
         YAlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BRFavyUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e129si5542921oia.150.2021.10.21.07.01.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 07:01:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BRFavyUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdYdV-0008HQ-Al
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 10:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYd2-0008GT-6F
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 10:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYd0-0008Lt-8G
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 10:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634824856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VdaqRsTxIcorfz6kht5/IWl3Xn2FlVJupR/VWOEiuns=;
 b=BRFavyUlxoH9EzRwpuO+GLMspYJOV0NNI2weWHUe158i3N+H9usMQ8nM7kdeRMFkFLQC7o
 hjNxm/1M/ZTvWV93vcvUlCd9lP04v7jrZwM05ssa77lZGvlJhVReWEMKsOtyZQM0ONjZid
 4eomuiZpLbgjRBgY021fHfCdQWMXvXM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-uSIZsxuKMgmo2G0-ZOBWFw-1; Thu, 21 Oct 2021 10:00:52 -0400
X-MC-Unique: uSIZsxuKMgmo2G0-ZOBWFw-1
Received: by mail-ed1-f70.google.com with SMTP id
 g28-20020a50d0dc000000b003dae69dfe3aso445980edf.7
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 07:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VdaqRsTxIcorfz6kht5/IWl3Xn2FlVJupR/VWOEiuns=;
 b=Ed/Ht0otwAmguW5uAT443GhxjDcr5TTpvC9zAa4oygNlrtzPpw0fLjta8adTJ1DUCi
 qEsYC9ePk8GInT2dUOgR5ynDYa9m+nqy+2R+/xzGOK1HPuqtzD9vFFK1Bdrdz3tSy032
 /YTB+MmG9vL9ZbW3MjSs08rlmHHEfUWMNH+hSl2af/hq9LSOeXlIIZL4cATsYWBx8ZAL
 aN5ohzz98sGSLZ5KSIaQTT+xvrx9LPDA3euxWQZST3ljUIuOya28bI31jSrATDJ0OLdR
 qxDdokPLa3ycIuSfs2ijpWUlYzvckNcQMYYMHBqWjZd3Q25EhaZ+8gOwzJnd2No+2QuL
 7vqg==
X-Gm-Message-State: AOAM533v6GXWazgr5bEL222J6YMhMnD3T6KlYHb2RCf8a4AM0f083SqS
 x9OTabIYjavn8aiinw+lrB2YNhJC6KusCaabyIowkZ2xjrsCe0u6f27gGLi2bfXB0PiYB23uUA0
 R1NjamU6ge8w4
X-Received: by 2002:a17:906:1706:: with SMTP id
 c6mr7755601eje.343.1634824851677; 
 Thu, 21 Oct 2021 07:00:51 -0700 (PDT)
X-Received: by 2002:a17:906:1706:: with SMTP id
 c6mr7755538eje.343.1634824851072; 
 Thu, 21 Oct 2021 07:00:51 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id j15sm2946407edl.34.2021.10.21.07.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 07:00:50 -0700 (PDT)
Date: Thu, 21 Oct 2021 16:00:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v5 09/12] tests/acpi: allow updates of VIOT expected
 data files
Message-ID: <20211021160049.4f7659c4@redhat.com>
In-Reply-To: <20211020172745.620101-10-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-10-jean-philippe@linaro.org>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, ani@anisinha.ca, pbonzini@redhat.com,
 eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7LJ0dyQuKLO4

On Wed, 20 Oct 2021 18:27:43 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> Create empty data files and allow updates for the upcoming VIOT tests.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
>  tests/data/acpi/q35/DSDT.viot               | 0
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

Acked-by: Igor Mammedov <imammedo@redhat.com>

