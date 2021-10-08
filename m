Received: by 2002:a0c:90cc:0:0:0:0:0 with SMTP id p70csp1803913qvp;
        Fri, 8 Oct 2021 08:27:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTV7fuvfKWvAj/mbdbrHWuFV1d7ganuvLkn42j0hRo9Pd0T/Zh+LqBtwTzcVasDWKOS/xB
X-Received: by 2002:a05:6214:6ed:: with SMTP id bk13mr10803174qvb.47.1633706831414;
        Fri, 08 Oct 2021 08:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633706831; cv=none;
        d=google.com; s=arc-20160816;
        b=rkTqvbYNiq1YQPecwxBqd+HejzyitAlC5dj8Jk6aiy9pImqH28J7TkZN11T1qX5MDH
         w9c/YLdVq9P6kndaQSifHWtk2JKl0nCMUYM1synEM1pqCN5CkVygd3fM61wEx8T+VTyh
         EEfQqh2uSBgibWYWTKOw9tM0xGK5lCUtLti1MmlDDHQmfTRdNlcjDGaXwioXd6wnFVT4
         irP3oyO0LlTtl6Eyy86PLxK2E1a1AilYxRSMgyyDCVsSFJS0ZA0aYOT0vlW7XD8QhHTx
         aghdKAb6VqG0yyS1NedD+nKEsDAS+eEWaD0fCb9RN+ZSSjaP+P0abX05hKL0d1r44oZj
         KSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wcWyrvxOKLEpdq6q7EwxjxFJw9h5PmcqB4+2loQL3ls=;
        b=x6gxrww9jTxMqH1WAmy3YoMcCpmzktp9wktnn4xksvUWGZICaCbpEFQYVi0HRnlA3Y
         PCPhXUs5eKjcy659i4VBYtIQAXeFd3oOt36O3eSi12IcmIaHDy0ZLawIQ+MJt89vMDLh
         vnuHN78VsYLFckDa8vMlECGxpTTLYTfdpXrz9bQnwfg4wz/OFwnFhZomTpqGOIxneN4k
         eVEA/XuLwkvnHdw5lqe3lbjP+0/Yz256xgsHiGYKoKhqycaJYniFSkGFxBlQPbRspjSE
         9QpP9DXA3yxUUDoSQtYL1h/HyZ9I7j3WK5N04DHiV0wsvm0caELO/EUjkhF9EO0P2UmT
         mJlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tzivasKi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10si2254466qtg.377.2021.10.08.08.27.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Oct 2021 08:27:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tzivasKi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYrmA-00006d-UK
	for alex.bennee@linaro.org; Fri, 08 Oct 2021 11:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrlp-00005H-3h
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 11:26:49 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrlm-0006YD-TO
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 11:26:48 -0400
Received: by mail-wr1-x434.google.com with SMTP id r18so31016356wrg.6
 for <qemu-arm@nongnu.org>; Fri, 08 Oct 2021 08:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wcWyrvxOKLEpdq6q7EwxjxFJw9h5PmcqB4+2loQL3ls=;
 b=tzivasKij+So4F0iZc1QDLAFUrbjwWWTXQVezttHk4Hz6HSCEnDXvlFiC0DQoUASuS
 T0nDLv5QJWoumOn/wK07hfVPUIHvh058o+ALc7tMHD9TCtAG2cUd53BUzo6ZvdGCxQFI
 JbcZQtQj7zZfQiSfTqACfljfi5agctOo2eVxUtKRqUCD7SP4xmSwU4Veaag17wIp/IIR
 p1yg9TnH/EEiky4fSJh8rvMer5niH65eetGLZi/5bqTfITJSofpPIfLH26E4pj75j43M
 qoNVlL4ShmtdjRfa6VObEJk9Q3D4dcBjKkqTl9XQnsV3LIHtDWdvLb3iWxTKykaJP0VE
 BJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wcWyrvxOKLEpdq6q7EwxjxFJw9h5PmcqB4+2loQL3ls=;
 b=NDKD1UvE++R7YL6N2eGVQ+T5MdiKPySTzj46J2gV8r5VAKgFW2ljOi8IO+OBnspm8O
 G8na63931eU5xcx1k/tYbLcCu7TwOuenfr2JhgBSEFHgsLg7zt83uUnntAjQukB6g8lJ
 wx4AYxpmWpprfCfClv6FEtd77FzHDeYeDs+0Y2feoD7zRejK6713yAjmSkUYDeu2FxLA
 jMlMXfBSastfX3prA/ZJSWkmuuESsmoi6m1G64DdiMKWA3T0YfY0dJGHuHs5DQuxrLne
 Es2sZcV1tMXnRVtu8jU5We/+J6JJRrjtPXBXEHagnpvInJiAAkrpifrtE8VDaPEvroWe
 Blpg==
X-Gm-Message-State: AOAM530YEozK6yXk2g42aT3HpF+VovbzHNAUcwpxB97+J23Bkw4bb+jX
 F0Xt8eVBaSI5yrbRtVh6V+47BQ==
X-Received: by 2002:adf:a35d:: with SMTP id d29mr4718159wrb.318.1633706804956; 
 Fri, 08 Oct 2021 08:26:44 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id v23sm2777723wmj.4.2021.10.08.08.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:26:44 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:26:22 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 08/11] tests/acpi: allow updates of VIOT expected data
 files
Message-ID: <YWBjHrELdZIBXcOD@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-9-jean-philippe@linaro.org>
 <20211006101215.24414401@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006101215.24414401@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8bgpzKKDRomJ

On Wed, Oct 06, 2021 at 10:12:15AM +0200, Igor Mammedov wrote:
> On Fri,  1 Oct 2021 18:33:56 +0100
> Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> 
> > Create empty data files and allow updates for the upcoming VIOT tests.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
> >  tests/data/acpi/q35/DSDT.viot               | 0
> 
> does default tests/data/acpi/q35/DSDT differs from
> DSDT.viot?

Yes the VIOT test has one more PCI device (virtio-iommu) and PXB devices,
so there are additional descriptors in the DSDT

Thanks,
Jean

> 
> >  tests/data/acpi/q35/VIOT.viot               | 0
> >  tests/data/acpi/virt/VIOT                   | 0
> >  4 files changed, 3 insertions(+)
> >  create mode 100644 tests/data/acpi/q35/DSDT.viot
> >  create mode 100644 tests/data/acpi/q35/VIOT.viot
> >  create mode 100644 tests/data/acpi/virt/VIOT
> > 
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523c8b..29b5b1eabc 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,4 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/virt/VIOT",
> > +"tests/data/acpi/q35/DSDT.viot",
> > +"tests/data/acpi/q35/VIOT.viot",
> > diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
> > new file mode 100644
> > index 0000000000..e69de29bb2
> > diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
> > new file mode 100644
> > index 0000000000..e69de29bb2
> > diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
> > new file mode 100644
> > index 0000000000..e69de29bb2
> 
