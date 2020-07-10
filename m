Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1007657lfm;
        Fri, 10 Jul 2020 12:31:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoC9bulMUFND9QYAspz7WwVpyl8THLJVUS4Q640mYXsoZODfvIisVwysO8RJwt8B5l7Q35
X-Received: by 2002:a25:d946:: with SMTP id q67mr28610238ybg.302.1594409479811;
        Fri, 10 Jul 2020 12:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594409479; cv=none;
        d=google.com; s=arc-20160816;
        b=HzlQ8UV6hYmto+CEfPNZF+EgTbKwkeLdBwqqmqMp5BcTzSKaFMaR2Cq2adMsmcx8B0
         uNhvXkbE9eoqfrSrqD/58fdvqH7r9W/wgqpI2U96Vi4EpXa2/+R1PyQherSDbLzf3o6l
         cco/me8LtGyYUUbROi7vrwcoc0sYyvZ8/oLuOY1pLiuSsNo0N1XUHEdp4VWC29K43z0l
         1B/HDhuFvUsCkiTnHJq4xKK8Be6DNTb+Hwt8/rUN2v4FKb9WVo17JjIZUKmX+H4+Y7gC
         f8rTTuoi0SRQxVOrA58oiRu3LnhXb1FQ0xfYFDGD9LtWCrTXwd1Besr/CCsgJh0aVU1v
         AHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=zrFhGqQJTZ+04pKrSa9yBQ0NDdATXyBp2yOzDueAG9Y=;
        b=INofF1PqJWOVsymbdGHP0W6Hmh70TsJHqrUEQvmoGmR6VUTQSjeWPYjyEBN4M3rSe9
         KW4/lDwF7vaHK5HhEGaimoZ345y5bz2hdilM0UMfZ9VWpQ5HRx7LuYKfckxDamBXBUFk
         6vzzUNPFP9FfDmxUfsZWLU0g4ngRDUf6nO6tiux6Y/+TWFfNkgNTu8r04Pr0c2mRgVyY
         GqigPjno0/gN+oZ7DEihwjIHlH3JooSkFoMxFFnvDeZkvQ3sy9SV7h1ik8BExJNuZ3Zn
         Fv3YvB36U+7pB4ikBU3IfjKxD3BLCE9DqzbxVoaDC78EgQL8zdbRfnufSKxLmravev/r
         kpmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Gp6WYqT/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si6198189ybc.234.2020.07.10.12.31.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 12:31:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Gp6WYqT/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtyjv-0000WM-3n
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 15:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jtyjh-0000Ui-6h
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 15:31:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43322
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jtyjd-0005CH-PF
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 15:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594409460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrFhGqQJTZ+04pKrSa9yBQ0NDdATXyBp2yOzDueAG9Y=;
 b=Gp6WYqT/JFt1ywrP9npxS+W5StXrPcKa1P3eAIDHHIs1HxuEjnPpqesnQhYBEIa2aP6QRy
 zC0/Hv61046LxcaCFdfBjaolwYKcm9L1zaCZNybAVCMpntf2oa0/K4/HHi1QvlqJuqmKDa
 t+JxYtej3cjpu3wGAZcQGbbjJvnz8C8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-FogeucCFNKmj_zHT32E3GQ-1; Fri, 10 Jul 2020 15:30:42 -0400
X-MC-Unique: FogeucCFNKmj_zHT32E3GQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 299B01800D42;
 Fri, 10 Jul 2020 19:30:41 +0000 (UTC)
Received: from localhost (unknown [10.40.208.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99A951002391;
 Fri, 10 Jul 2020 19:30:28 +0000 (UTC)
Date: Fri, 10 Jul 2020 21:30:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v5 08/20] microvm/acpi: add minimal acpi support
Message-ID: <20200710213027.7e467d81@redhat.com>
In-Reply-To: <20200709123332.dlyciqz3sq6zdgsk@sirius.home.kraxel.org>
References: <20200707125356.32450-1-kraxel@redhat.com>
 <20200707125356.32450-9-kraxel@redhat.com>
 <20200708121614-mutt-send-email-mst@kernel.org>
 <20200709123332.dlyciqz3sq6zdgsk@sirius.home.kraxel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 15:06:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1jS9DOfGSoaw

On Thu, 9 Jul 2020 14:33:32 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
> 
> > > +    scope = aml_scope("\\");
> > > +    pkg = aml_package(4);
> > > +    aml_append(pkg, aml_int(5)); /* SLEEP_CONTROL_REG.SLP_TYP */  
> > 
> > I'm not sure what does the comment refer to here.  
> 
> It's the register field the value gets written to.
> With full acpi this is PM1a_CNT.SLP_TYP, hw-reduced uses
> SLEEP_CONTROL_REG.SLP_TYP instead.  This is cut&paste from pc/q35
> version + adapted for hw-reduced.
> 
> > Does this 5 match
> > the value IO handler tests against?  
> 
> Yes.  "5" for S5 state (aka poweroff).  Can add a #define.
> 
> > Below is from "7.3.4 System \_Sx states" right?  
> 
> "7.4.2 \_Sx (System States)" here (ACPI 6.3), guess that is the same.
> 
> > > +    AcpiFadtData pmfadt = {
> > > +        /*
> > > +         * minimum version for ACPI_FADT_F_HW_REDUCED_ACPI,
> > > +         * see acpi spec "4.1 Hardware-Reduced ACPI"  
> > 
> > Spec version - I'm guessing ACPI spec 5.0.  
> 
> 6.3
> 
> > And I think here is where you refer to
> > 	Table 5-34 Fixed ACPI Description Table (FADT) Format  
> 
> Table 5-33 FADT Format
> 
> > > +         */
> > > +        .rev = 5,
> > > +        .minor_ver = 1,  
> > 
> > So 5.1 I am guessing just copied from virt/arm?  
> 
> Yes.
> 
> > > +        .flags = ((1 << ACPI_FADT_F_HW_REDUCED_ACPI) |
> > > +                  (1 << ACPI_FADT_F_RESET_REG_SUP)),
> > > +
> > > +        /* Table 5-33 FADT Format -- SLEEP_CONTROL_REG */  
> > 
> > You need to use the earliest spec version that includes
> > a specific feature - and document which one it is.  
> 
> Phew.  Isn't it easier to just use table and field name then, so it is
> easy to find in whatever version of the spec you have at hand?  Also how
> can I figure the earliest spec version easily?
> 
> Sometimes the 6.3 spec documents which table version added specific
> fields, sometimes not ...
> 
> Is the table version synced with the acpi spec version?  Does DSDT v2
> mean the DSDT format was updated for ACPI 2.0 and hasn't changed since?

not necessarily, even if it's pain to check for earliest spec where
feature appeared, it's the best and the least ambiguos comment format to
refference spec, i.e. (do not count on chapter/table numbering/naming being
stable accross versions)

/* Spec name + ver: chapter/table where the feature is described */

something like:

/* ACPI 1.0b: 16.2.5.4 Type 2 Opcodes Encoding: DefObjectType */                 
Aml *aml_object_type(Aml *object)  

> 
> > But the main poit is AcpiFadtData actually has nothing to do with
> > FADT format. It's an abstracted API   
> 
> The FADT is generated from AcpiFadtData.  There is a 1:1 relationship
> between most AcpiFadtData fields and FADT table entries.  This isn't
> what I would call "has nothing to do with" ...
> 
> > > +    xsdt = tables_blob->len;
> > > +    build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> > > +
> > > +    /* RSDP is in FSEG memory, so allocate it separately */
> > > +    {
> > > +        AcpiRsdpData rsdp_data = {
> > > +            /* Table 5-27 RSDP Structure */  
> > 
> > RSDP is since ACPI 2.0, table number there is different.  
> 
> References to ACPI 2.0 are almost useless.  ACPI 5.0 is the oldest
> version uefi.org offers for download.
all versions are at (starting from 1.0)
https://uefi.org/acpi/specs

> Guess that underlines the point I made above that referencing specific
> versions of the spec doesn't work very well ...

so far that worked well, effect of requiring spec+version was less
questions during review as reviewer doesn't have to guess where
it's documented.

> 
> take care,
>   Gerd
> 

