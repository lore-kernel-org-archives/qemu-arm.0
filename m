Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2493352njm;
        Wed, 3 Jul 2024 03:23:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5k5Cs6QncFhnyFCoH/GP3PppPSWyclaVBjF9v0AGKP06+7Ew20vhKzkBhRIC/gVjyumc4zkNnG9WaZiKvQbQn6f9HMtx3
X-Google-Smtp-Source: AGHT+IGbAvf08EU/4IbzVlTYiriSpWDiMkTJb+yil08OReFQ/CeghoeReW4SkMByAKD/5DOVAZYo
X-Received: by 2002:a05:620a:4014:b0:79d:7e72:b907 with SMTP id af79cd13be357-79d7e72ba2emr1472792185a.37.1720002213899;
        Wed, 03 Jul 2024 03:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720002213; cv=none;
        d=google.com; s=arc-20160816;
        b=aEi3CwZtu8koKBGpdR4pW+Gm9Z3wqWq03WiudEgk+Me9pki9KuTZH9UbiHOIhcd14g
         da4Fw7D7u2aH9SKKPG828W1HY8hloNVFiDci4Y7WRi2SEZ7BnR2uHhQntmA0wXcogmSb
         Cv68qPpqGNoh9W499ZXfoYBvZwPVMQgydXDvzzzK62g4oFcJ8+K6zNGm2J1TLmxT1++M
         pStCAIdcWHNCvAfYfQbPteGLbo86K5vrOev58q71umnBJrb3qqZlVRK2oGWPgXUkWX2C
         dhSEE6U484/b6Cww74nQo/X8KuzY4N7GUkE7r3WxXivZSA1d9IVXYzIl4ErsjAZ5h4de
         b6qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=tIav5KZUA6cIne1AwYaEIMMojMvU8ctn52V4PV46rME=;
        fh=UE3cTtWb9Wz23n8IRtFRRbQOTTdP7j4SOFbjNW2OwwA=;
        b=QAS9ypSWjnj7mtvYKjW6J/dA4T0OB/zJqSIhI3+DQO3QPhIVtkuLAEr47pKscf4Qea
         odCas95qmx7ZvYyrw1n5jLTrcGzZW0/dkxtr52zAUqRfcu3UYqGTRj+8pibcDKVXA5qf
         MqrfukoOYakXrRs951l81a+stwMgAX7Wria4gRX4Bj3ZJm1sMawHSYgcPo9WJEGQUMr9
         6SMdGq/z+8XgvZyOnlkAqDirbygkVsXToE3IN9dTfk4/L+Ky+mg7N2BtsS71I85rIJ8U
         BC2jimPaERd58deN6jK6PSXU7uZmCsttEyl04JhmP9iP0D61PZQ9qJm0zZOEwnQDVQwT
         5lgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=CtgDrRp4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d6934c638si1242085585a.743.2024.07.03.03.23.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 03:23:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=CtgDrRp4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOx8s-0000rv-CI; Wed, 03 Jul 2024 06:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sOx8q-0000rC-N4
 for qemu-arm@nongnu.org; Wed, 03 Jul 2024 06:23:12 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sOx8o-0000SQ-0k
 for qemu-arm@nongnu.org; Wed, 03 Jul 2024 06:23:12 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3d853305abfso360258b6e.2
 for <qemu-arm@nongnu.org>; Wed, 03 Jul 2024 03:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1720002188; x=1720606988; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tIav5KZUA6cIne1AwYaEIMMojMvU8ctn52V4PV46rME=;
 b=CtgDrRp434LSap9k7otVWL9X0PApP4H+nUqsMLGqElndnghHGJEUP9lecTSdF7Tala
 ORVI1qgL9N8sM7hJ/oX6h/IrcroUIgV0YW3Zq1VDWjUPA0MfRD7urDNFdqau/ijN30ms
 woxKBOtaFWvsxEsUCRc6Bv4L69bg5GRWC1aG8fc12J9AUNxjuiHEA0z+651Blcec/AIS
 x/UXt4V/iGyIAITEPH7ump9auTwVgAU60kQZHta7BnuKmuqJcLdfJL4t9q9msFuA2GJ4
 RiwqDP/Un7Zt4qZlohH3H6F440panp3xWDZl9YlqmsXPAjXF+GEbWJHUTQ374H3ipl/o
 AhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720002188; x=1720606988;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tIav5KZUA6cIne1AwYaEIMMojMvU8ctn52V4PV46rME=;
 b=lNcwU9ujnxrnlOxX1o5xkn+qAph0qcKsyUXTyQWBtx5tTVwLjciQbjOoHaFAx1P0zm
 uYFbql3RhXV1Qbbwve8rt/hMlcjK929NJlmZ4zpY+z4Ia3jYo2dHRIh2W28nzy0MgYwn
 vl7LqDsWuAczDog0293x0ilCFf2EmkrWNMB5UAzYZMYx7C+d/Kw/jZ0JN2xGzt/Oq8tV
 UiaW5cITaIJ6hHaKu+Gv8KLJpxEabpQ2bwJ23IXWSGEIzUNgU+raVmi1IA+ZFA6+Eej/
 HqVYzaDgKQku5qUMpf5brBF4OZf6iVafsAoChysyLmhBCr+H+ROLtgt+mv1gE8rrnBrN
 3mIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGnt2OhjzoTfxTO6jBs4B9DMbXT9tQJ2F+vDypzISqunKGOiPwqCpZDXweOWjOAk5ndnVgkr3NLYFE1EzdhxRXYcC4
X-Gm-Message-State: AOJu0Yx0bwkWer7IuFGT0llS6RncPo2J9Q/2xlHcKedvFp9/1gvGC/2+
 ujO9PbueQwZfqBGP7AqqXw7NGN2PxQ/xwR4vh+4steCXO++N5h+z8kZ49HwIGHw=
X-Received: by 2002:a05:6808:2f06:b0:3d2:1a92:8f4a with SMTP id
 5614622812f47-3d6b32e4136mr15562308b6e.23.1720002187856; 
 Wed, 03 Jul 2024 03:23:07 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3d62f9e9b20sm2027270b6e.25.2024.07.03.03.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 03:23:07 -0700 (PDT)
Date: Wed, 3 Jul 2024 15:52:55 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v4 16/16] tests/qtest/bios-tables-test: Add expected ACPI
 data files for RISC-V
Message-ID: <ZoUmf2zn51RWU0o0@sunil-laptop>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
 <20240625150839.1358279-17-sunilvl@ventanamicro.com>
 <20240627141803.42cd46c1@imammedo.users.ipa.redhat.com>
 <20240701170330-mutt-send-email-mst@kernel.org>
 <20240702150236.000042eb@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702150236.000042eb@Huawei.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QuHzUe/3GoRX

On Tue, Jul 02, 2024 at 03:02:36PM +0100, Jonathan Cameron wrote:
> On Mon, 1 Jul 2024 17:03:43 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Jun 27, 2024 at 02:18:03PM +0200, Igor Mammedov wrote:
> > > On Tue, 25 Jun 2024 20:38:39 +0530
> > > Sunil V L <sunilvl@ventanamicro.com> wrote:
> > >   
> > > > As per the step 5 in the process documented in bios-tables-test.c,
> > > > generate the expected ACPI AML data files for RISC-V using the
> > > > rebuild-expected-aml.sh script and update the
> > > > bios-tables-test-allowed-diff.h.
> > > > 
> > > > These are all new files being added for the first time. Hence, iASL diff
> > > > output is not added.
> > > > 
> > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > > Acked-by: Igor Mammedov <imammedo@redhat.com>  
> > > 
> > > Michael,
> > > can it go via risc-v tree or
> > > do you plan to merge it via your tree?  
> > 
> > given patch 1 is merged, I took the rest.
> 
> Looks like your CI runs are catching this as well but
> RHCT here is failing.  I rebased the GI/GP set on top of this
> and ignored that failure by skipping riscv64 tests.
> 
> Jonathan
> 
Hi Jonathan, Michael,

Looks like a recent RISC-V PR updated the rva22s64 ISA string affecting
the RHCT I had in my series. I see that Michael dropped those 3 RISC-V
patches from the PR. So, let me update the expected RHCT AML file in a
new series. I will also include Igor's feedback to remove fallback path
in that series.

Thanks,
Sunil

Thanks,
Sunil
