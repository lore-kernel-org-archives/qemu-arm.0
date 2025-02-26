Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp864350njg;
        Wed, 26 Feb 2025 04:29:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUXWBhRyeII3giqtrboI9lonpXbWr5EkXQfZnGI8MYUQOjT7r5ysWFRF3weIUBtohbIH3UhqoxNHSJQFg==@linaro.org
X-Google-Smtp-Source: AGHT+IEhsvkRKp8/68OiK2ud9yRfwL5TmUQxAx+7AMNKysaV4wTi+E6/E/YzPZju6frpX3jXpkCn
X-Received: by 2002:a05:622a:1a09:b0:472:2df:6ff2 with SMTP id d75a77b69052e-4722293993cmr303683151cf.34.1740572975731;
        Wed, 26 Feb 2025 04:29:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740572975; cv=none;
        d=google.com; s=arc-20240605;
        b=YH8VyeaTa78vzqa/exllOnIbEvcgcaIljIG5P5pKC7s4IpbSECptAo4gpRf/byTs5f
         9D5IM+6barljXDT2j+N3D7dd5HVvCmhRZiMmpIU9IyHji5MuXtN/rEKpvw8EGHTdv5ye
         BHlMNRdIqTgnxC4CB0Mmv+YRGxCbDpvoqL7vxliG26a5x99k/jpQkhaoodVQheeFLK/l
         gChv0jUhuLplxbMDxjWOFyKVpz+L1sqcEJuUbefxhKZhJEI0cQ+Kl2loETY9ZmQdPlLV
         BL6whmfQBvqLfiSKQo6Id2vfbU6l329I2bZht3MUv7FApiqM/HWiM9siuc7QRDgfp0/Z
         ej1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=YqtUsmTYfSl8QjL4A92EdoUfNd8iKRnEclZHB/5oJQc=;
        fh=JPaGp4krEwT3aKtUkVy1FRj1iCGbVTz2DeOtn8fbXTg=;
        b=QYDD7xIubzXGVNEyUEoXUHKKwiRyGmtuS9giY06UfmDru3dFleXoBDMRPATmaIl9nv
         5Dw2mdQIPBhc2ccs9vIuY/xRopvFEmuAhZtHOSKzz3FboOZ77jzzoc98RQgMqD4w8DP7
         r0W6YdU4rl6WZM7/FGRsBV8HjptfVGWwcALcdL0C2R7OfQxjUNtdQEedytZ6VmEoWVxu
         g9mjnU+wizdWYaKZ7QxjvQOMONnpT+4cJbidSVGHQr+1S7pTvIoOKddQqD3YRN41tRyT
         +RfMnyCvnv4Vj4ycWPUiE9YIh7mHUltUKh95vzRQWlBNumcUry9LfUcVFhabAKlHErcC
         kFCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GIf4v6Ma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47378082ef3si33357251cf.291.2025.02.26.04.29.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 04:29:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GIf4v6Ma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnGXS-0003Mc-Bo; Wed, 26 Feb 2025 07:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tnGXM-0003Ll-9h
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 07:29:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tnGXJ-0001dg-9h
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 07:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740572950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YqtUsmTYfSl8QjL4A92EdoUfNd8iKRnEclZHB/5oJQc=;
 b=GIf4v6MaC8EmwdwyunN157x5d0PciwgSfRDwuLacPOPDKs3bgUSgL/upyrt60uFWt9Duzb
 bqim0vcGg5T0qV2FNES6nccmnbrdQ5SNlxxdCBuuXlD0uifbeocibCuXM4UM9k3sDxxcXk
 RXq4dp61DUMCTLIvFN8vgFj6IC5Smw8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-SIkh4j5TP1OPa2vqY4pk0A-1; Wed, 26 Feb 2025 07:29:08 -0500
X-MC-Unique: SIkh4j5TP1OPa2vqY4pk0A-1
X-Mimecast-MFC-AGG-ID: SIkh4j5TP1OPa2vqY4pk0A_1740572948
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43942e82719so48672235e9.2
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2025 04:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740572947; x=1741177747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqtUsmTYfSl8QjL4A92EdoUfNd8iKRnEclZHB/5oJQc=;
 b=qO2HVZTkNOfWnjP2mE8xWxWU0sgl3uJGzV7wqg9oE3CXWgQwvojnzuxTpj99RNwchA
 xMrQtB3PX2/2/HN+4czvZIuQCGkDnEJX1WXJGUtRB6+NhEtnIeir8A7aMjG5hFhH8KCK
 ASAhF5uIBw23WqaPN3ojsgC1iziEZNASVu25cL25kyc6D3uKFKUd/QkFIw6hTpyBrppD
 +myaeokplGDaFL3dJVk749UwC0vWQvNW7H/xOASaJyhGP9PjjRzJv8ufppV8nIqIQfER
 ux0Tu2PDJ1Equ/p/FD1lIhDIqmL9Ry5yykFa3lCffrgqHJL67yntt89Z2dfyPGAldWBv
 82hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/Cb7X6S9lbrl47vRYI3atn+alt3QA6/Un+ejlEPJY2yKO68hW8yyeX2HIGagW9u/LIHDODXJueg==@nongnu.org
X-Gm-Message-State: AOJu0Yx9KFskzY3vixjeXzgiMeuyxg4uG82L39QU/glh4aYwZEAXO4C5
 f8EWNDfSABD4ZUX9+8aSCFBYvfPBcNPdXIYlc7gbBtJkodbTVNV6wRwhtZZ/lBkIc0HfWXwH36o
 FjGPKcmDWC7R0WeeKafczzkSSlM069lqR3UreI+KJEOxMI7PkCQ==
X-Gm-Gg: ASbGncsCr1plDh1ONINyOrwfxx8Jn9yw4itbOJiiV5/CriaGfhAaS4NDg8dgiV45TDM
 v4With1I6QafPl7BHwEaxrUMcOcqa3f29dMFIYr/4E7rKjNzYLej+hVO3sYgSWFQCSpCaSqPRwa
 y1OClKOk5pW8waEmZcUJemHfpmg0XN4VfcY4auj3AcplgljB73QIKh/ndSYdCZnPICDP3DYDIQb
 5DokBgpmUbbDPvcHGLndkupOJLHdEA+eRhBDJhTtuQzFyDI4dZSDUSIiLF1xRN9rFsjVlBwZ9fY
 LS4lIf34vgeqr+MQW1kHCcnkLsFndjwMgLDulzgZ7WeZZUNXPLBVk/68Uev9TDM=
X-Received: by 2002:a05:600c:35d6:b0:439:985b:17d6 with SMTP id
 5b1f17b1804b1-43ab903603emr23928025e9.27.1740572947512; 
 Wed, 26 Feb 2025 04:29:07 -0800 (PST)
X-Received: by 2002:a05:600c:35d6:b0:439:985b:17d6 with SMTP id
 5b1f17b1804b1-43ab903603emr23927655e9.27.1740572947018; 
 Wed, 26 Feb 2025 04:29:07 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5711dfsm19946945e9.27.2025.02.26.04.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 04:29:06 -0800 (PST)
Date: Wed, 26 Feb 2025 13:29:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Philippe =?UTF-8?B?TWF0?=
 =?UTF-8?B?aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Cleber Rosa <crosa@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Eric Blake
 <eblake@redhat.com>, John Snow <jsnow@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Markus Armbruster" <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, "Paolo Bonzini" <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Yanan Wang <wangyanan55@huawei.com>, Zhao Liu
 <zhao1.liu@intel.com>, <kvm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 00/14] Change ghes to use HEST-based offsets and add
 support for error inject
Message-ID: <20250226132905.47aa50d2@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250226105628.7e60f952@foz.lan>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
 <20250203110934.000038d8@huawei.com>
 <20250203162236.7d5872ff@imammedo.users.ipa.redhat.com>
 <20250221073823.061a1039@foz.lan>
 <20250221102127.000059e6@huawei.com>
 <20250225110115.6090e416@imammedo.users.ipa.redhat.com>
 <20250226105628.7e60f952@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iaJOybYltvsO8R31o0GsT4Un5J8j-MeO7lo2dqMq0rA_1740572948
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: kQ1g3ygVWGcW

On Wed, 26 Feb 2025 10:56:28 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Tue, 25 Feb 2025 11:01:15 +0100
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Fri, 21 Feb 2025 10:21:27 +0000
> > Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> >   
> > > On Fri, 21 Feb 2025 07:38:23 +0100
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > >     
> > > > Em Mon, 3 Feb 2025 16:22:36 +0100
> > > > Igor Mammedov <imammedo@redhat.com> escreveu:
> > > >       
> > > > > On Mon, 3 Feb 2025 11:09:34 +0000
> > > > > Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> > > > >         
> > > > > > On Fri, 31 Jan 2025 18:42:41 +0100
> > > > > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > > > > >           
> > > > > > > Now that the ghes preparation patches were merged, let's add support
> > > > > > > for error injection.
> > > > > > > 
> > > > > > > On this series, the first 6 patches chang to the math used to calculate offsets at HEST
> > > > > > > table and hardware_error firmware file, together with its migration code. Migration tested
> > > > > > > with both latest QEMU released kernel and upstream, on both directions.
> > > > > > > 
> > > > > > > The next patches add a new QAPI to allow injecting GHESv2 errors, and a script using such QAPI
> > > > > > >    to inject ARM Processor Error records.
> > > > > > > 
> > > > > > > If I'm counting well, this is the 19th submission of my error inject patches.            
> > > > > > 
> > > > > > Looks good to me. All remaining trivial things are in the category
> > > > > > of things to consider only if you are doing another spin.  The code
> > > > > > ends up how I'd like it at the end of the series anyway, just
> > > > > > a question of the precise path to that state!          
> > > > > 
> > > > > if you look at series as a whole it's more or less fine (I guess you
> > > > > and me got used to it)
> > > > > 
> > > > > however if you take it patch by patch (as if you've never seen it)
> > > > > ordering is messed up (the same would apply to everyone after a while
> > > > > when it's forgotten)
> > > > > 
> > > > > So I'd strongly suggest to restructure the series (especially 2-6/14).
> > > > > re sum up my comments wrt ordering:
> > > > > 
> > > > > 0  add testcase for HEST table with current HEST as expected blob
> > > > >    (currently missing), so that we can be sure that we haven't messed
> > > > >    existing tables during refactoring.        
> > > 
> > > To potentially save time I think Igor is asking that before you do anything
> > > at all you plug the existing test hole which is that we don't test HEST
> > > at all.   Even after this series I think we don't test HEST.  You add
> > > a stub hest and exclusion but then in patch 12 the HEST stub is deleted whereas
> > > it should be replaced with the example data for the test.    
> > 
> > that's what I was saying.
> > HEST table should be in DSDT, but it's optional and one has to use
> > 'ras=on' option to enable that, which we aren't doing ATM.
> > So whatever changes are happening we aren't seeing them in tests
> > nor will we see any regression for the same reason.
> > 
> > While white listing tables before change should happen and then updating them
> > is the right thing to do, it's not sufficient since none of tests
> > run with 'ras' enabled, hence code is not actually executed.   
> 
> Ok. Well, again we're not modifying HEST table structure on this
> changeset. The only change affecting HEST is when the number of entries
> increased from 1 to 2.
> 
> Now, looking at bios-tables-test.c, if I got it right, I should be doing
> something similar to the enclosed patch, right?
> 
> If so, I have a couple of questions:
> 
> 1. from where should I get the HEST table? dumping the table from the
>    running VM?


> 
> 2. what values should I use to fill those variables:
> 
> 	int hest_offset = 40 /* HEST */;
> 	int hest_entry_size = 4;
you don't need to do that,
bios-tables-test will dump all ACPI tables for you automatically,
you only need to add or extend a test with ras=on option.

   1: 1st add empty table and whitelist it ("tests/data/acpi/aarch64/virt/HEST")
   2: enable ras in existing tescase

--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2123,7 +2123,8 @@ static void test_acpi_aarch64_virt_tcg(void)
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
     test_acpi_one("-cpu cortex-a57 "
-                  "-smbios type=4,max-speed=2900,current-speed=2700", &data);
+                  "-smbios type=4,max-speed=2900,current-speed=2700 "
+                  "-machine ras=on", &data);
     free_test_data(&data);
 }
     
  then with installed IASL run
    V=1 QTEST_QEMU_BINARY=./qemu-system-aarch64  ./tests/qtest/bios-tables-test
  to see diff

  3: rebuild tables and follow the rest of procedure to update expected blobs
     as described in comment at the top of (tests/qtest/bios-tables-test.c)

I'd recommend to add 3 patches as the beginning of the series,
that way we can be sure that if something changes unintentionally
it won't go unnoticed.

> 
> >   
> > > 
> > > That indeed doesn't address testing the error data storage which would be
> > > a different problem.    
> > 
> > I'd skip hardware_errors/CPER testing from QEMU unit tests.
> > That's basically requires functioning 'APEI driver' to test that.
> > 
> > Maybe we can use Ani's framework to parse HEST and all the way
> > towards CPER record(s) traversal, but that's certainly out of
> > scope of this series.
> > It could be done on top, but I won't insist even on that
> > since Mauro's out of tree error injection testing will
> > cover that using actual guest (which I assume he would
> > like to run periodically).  
> 
> Yeah, my plan is to periodically test it. I intend to setup somewhere
> a CI to test Kernel, QEMU and rasdaemon altogether.
> 
> Thanks,
> Mauro
> 
> ---
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 0a333ec43536..31e69d906db4 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -210,6 +210,8 @@ static void test_acpi_fadt_table(test_data *data)
>      uint32_t val;
>      int dsdt_offset = 40 /* DSDT */;
>      int dsdt_entry_size = 4;
> +    int hest_offset = 40 /* HEST */;
> +    int hest_entry_size = 4;
>  
>      g_assert(compare_signature(&table, "FACP"));
>  
> @@ -242,6 +244,12 @@ static void test_acpi_fadt_table(test_data *data)
>      /* update checksum */
>      fadt_aml[9 /* Checksum */] = 0;
>      fadt_aml[9 /* Checksum */] -= acpi_calc_checksum(fadt_aml, fadt_len);
> +
> +
> +
> +    acpi_fetch_table(data->qts, &table.aml, &table.aml_len,
> +                     fadt_aml + hest_offset, hest_entry_size, "HEST", true);
> +    g_array_append_val(data->tables, table);
>  }
>  
>  static void dump_aml_files(test_data *data, bool rebuild)
> @@ -2411,7 +2419,7 @@ static void test_acpi_aarch64_virt_oem_fields(void)
>      };
>      char *args;
>  
> -    args = test_acpi_create_args(&data, "-cpu cortex-a57 "OEM_TEST_ARGS);
> +    args = test_acpi_create_args(&data, "-ras on -cpu cortex-a57 "OEM_TEST_ARGS);
>      data.qts = qtest_init(args);
>      test_acpi_load_tables(&data);
>      test_oem_fields(&data);
> 

