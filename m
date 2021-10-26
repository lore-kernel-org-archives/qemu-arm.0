Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp1249259lfn;
        Tue, 26 Oct 2021 02:47:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOaotR8PSrwdMG511zQrOSRWrWfr/uFrd6z6x+5KvT/ABf+e3SWNCCQUCeQ7fpjEiX8NZJ
X-Received: by 2002:a9d:3e0e:: with SMTP id a14mr17337334otd.277.1635241666171;
        Tue, 26 Oct 2021 02:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635241666; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3nkoD+7wY+QV78A1TfQhNLVqtKLbuyesj/bHEh2lnBNTsUh206CbSf5ck5k5wRXSv
         yiOAxlhs5qKb6vl9uXMAKMuJYdd4GcAK/MhC5SikToQ6jxH5cvBkb+3eEQYeGQYwYel1
         aqZypJQxgYU5EEDcYYafXQu3DUmPRolcHKV1iyTdG3qjxh5KTCsB2CNcDMW9z+/mmS44
         KsyY8MftpdcND9ZlFvGlsV3ofsxoznxZv/oca5WZF6s6tTj2/m8wI5ntZBRs9YFbzBNS
         A+X0RLul813QWLIvL+OxHP6JvDxVyTUdybRUCPoRpc4Vx+t/T0k97hvfWwVqsdJLurXX
         KWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=5V25Yb/oMUvpVDl1njjnJ88gHdme+bfzB6xAExqJroI=;
        b=yvuJtTUNhFdLUB0TTc17uPLBcxQt8fjNFtTH0MXridyL5MYWwBcjNErUekwT0Y0Cly
         ZS/LkVLT6HJIWn9q2htGKKInPXLN/MsrfWHw1boIl/1mP1mCM06lhi7QY8cSHPcsdHou
         HecPEnioJpyLfPu3nsfhDxbnJDEevOHw0cnguZCv9EHAUbjZBP2cqaZ1p3crLPgaWysr
         7xEaP7MYBcaGREQlqIf+2rr+nViNoE6oS/WVr0UjcHbTJ9XIBxt4GAfhUit/gFSWYR9n
         hQatXeiMALhUDHuPextbXyN4pvS+AdV1frWhMPOpjlSS0Pw0pjFL3CdxtTHWBcuaMdOk
         z3CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YO1ByWZN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20si29174004ott.346.2021.10.26.02.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Oct 2021 02:47:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YO1ByWZN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mfJ3Z-0003vM-Cf
	for alex.bennee@linaro.org; Tue, 26 Oct 2021 05:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfJ3Q-0003u3-Gs
 for qemu-arm@nongnu.org; Tue, 26 Oct 2021 05:47:36 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfJ3O-0007VV-HT
 for qemu-arm@nongnu.org; Tue, 26 Oct 2021 05:47:36 -0400
Received: by mail-wr1-x434.google.com with SMTP id d10so13997705wrb.1
 for <qemu-arm@nongnu.org>; Tue, 26 Oct 2021 02:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5V25Yb/oMUvpVDl1njjnJ88gHdme+bfzB6xAExqJroI=;
 b=YO1ByWZNcynrTHf2Z7QTnoVxMedatyO9dgBOPlgw5/w4e42w2p2abEAIcHhrWciY7o
 yw3C0/RHSH7LjvQSkOtGyERjLVehItV/qtyTgZe2DIKrEkgSNHXo+YcIOAQda+/6hU3B
 fxbGkOVhzKbT1bYT395MRR1uzMPde37YiWiZGk8MT9ZQE5ZTkJaenXsQHdO8CKXi+uG1
 dd4AnvX77/tYc5pa0r/YgGOu6299FkWiYar03BhqtTCOQ4+tiQ2lFiOIUNjZM5ewLVP1
 7gGLAlEH+1feaSB6lhSkrRxShlR1EvYIp4/7qKbTkcdIpTmNOdDSPRjQ8PLJYyVGaSFI
 l3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5V25Yb/oMUvpVDl1njjnJ88gHdme+bfzB6xAExqJroI=;
 b=RE3yilVGNqB72pIG90ZXCjJSFnHsN5LRRc7U/tKl79/XEksyodPrtJl513uqGeQdXg
 bdssdjkcxut2vGHNV4+aaSpSdCWPgRwoZF+v6A76cJtVPZxxyXEIpUF6tppsNSWCoLw1
 Vp/rtWQkJASS9vAIix2Mk68pN6m0qXxfXHIrJ7IlfyzDnVJVEoy4wEtAhIqcf35q2Ckh
 aI1H/YHKRrWr92vHgDhJIAULQtgO9V2J6+SLQXRlgE29/ivayAWuCKA7w2fuL7ZPLysf
 onlTHUB5caUqCzmHNpBSVY3AQHk/NVnZaVcxh8QCVnxM90K4SagvIsb1mhpQXlHMZ+tL
 daFg==
X-Gm-Message-State: AOAM531wrFcJHrkQVamVLtPk71ag/QxU60l+JnfQO9ngLyFEvkgqJr39
 p5M6F/k7O+mI/SrZprK58LKheA==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr17835270wrd.178.1635241652704; 
 Tue, 26 Oct 2021 02:47:32 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id f17sm14065284wrr.56.2021.10.26.02.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 02:47:32 -0700 (PDT)
Date: Tue, 26 Oct 2021 10:47:11 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v5 10/12] tests/acpi: add test cases for VIOT
Message-ID: <YXfOn5AcPRsCrMXC@myrica>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-11-jean-philippe@linaro.org>
 <c7dda57e-b154-1b69-1480-c89b4ba0db2e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7dda57e-b154-1b69-1480-c89b4ba0db2e@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IHlA0SkImfLL

On Thu, Oct 21, 2021 at 11:02:27AM +0200, Eric Auger wrote:
> Hi Jean,
> 
> On 10/20/21 7:27 PM, Jean-Philippe Brucker wrote:
> > Add two test cases for VIOT, one on the q35 machine and the other on
> > virt. To test complex topologies the q35 test has two PCIe buses that
> > bypass the IOMMU (and are therefore not described by VIOT), and two
> > buses that are translated by virtio-iommu.
> >
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 4f11d03055..599b155201 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -1403,6 +1403,42 @@ static void test_acpi_virt_tcg(void)
> >      free_test_data(&data);
> >  }
> >  
> > +static void test_acpi_q35_viot(void)
> > +{
> > +    test_data data = {
> > +        .machine = MACHINE_Q35,
> > +        .variant = ".viot",
> > +    };
> > +
> > +    /*
> > +     * To keep things interesting, two buses bypass the IOMMU.
> > +     * VIOT should only describes the other two buses.
> > +     */
> > +    test_acpi_one("-machine default_bus_bypass_iommu=on "
> Just a reminder that we still have a dependency on the
> default_bus_bypass_iommu fix here. Otherwise those tests will fail. So
> the fix needs to be upstreamed along with that series.

Thanks for the reminder, the fix is now queued (for x86, which this patch
relies on) so should be good to go. I'm planning to fix the conflict you
reported and resend only the x86 parts, so they get be merged this cycle

Thanks,
Jean

